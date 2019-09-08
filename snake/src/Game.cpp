#include "Game.h"
#include "xgpio.h"
#include "xparameters.h"
#include "xtmrctr.h"
#include "xil_exception.h"
#include "xintc.h"
#include "xuartlite.h"

XGpio Gpio_PushButtons;
XIntc InterruptController;
XUartLite UartLite;
XTmrCtr Timer;

extern Game SnakeGame;

void GpioIntrHandler(void *CallbackRef) {
	if(SnakeGame.pSnake->CheckIfCanChangeDirection()) {
		SnakeGame.pSnake->CanChangeDirection(false);
		switch(XGpio_DiscreteRead((XGpio *)CallbackRef, 1)) {
			case 1:
				SnakeGame.pSnake->SetDirection(UP);
				break;
			case 2:
				SnakeGame.pSnake->SetDirection(LEFT);
				break;
			case 8:
				SnakeGame.pSnake->SetDirection(DOWN);
				break;
			case 4:
				SnakeGame.pSnake->SetDirection(RIGHT);
				break;
			default:
				SnakeGame.pSnake->CanChangeDirection(true);
				break;
		}
	}
	XGpio_InterruptClear((XGpio *)CallbackRef, 1);
}

void UartRecvHandler(void *CallBackRef, unsigned int ByteCount) {
	u8 ReceiveBuffer = 0;
	XUartLite_Recv((XUartLite *)CallBackRef, &ReceiveBuffer, 1);
	if(SnakeGame.UART_Enabled && SnakeGame.pSnake->CheckIfCanChangeDirection()) {						//UART_InterruptDisable nie dziala
		SnakeGame.pSnake->CanChangeDirection(false);
		switch(ReceiveBuffer) {
			case 'w':
				SnakeGame.pSnake->SetDirection(UP);
				break;
			case 's':
				SnakeGame.pSnake->SetDirection(DOWN);
				break;
			case 'd':
				SnakeGame.pSnake->SetDirection(RIGHT);
				break;
			case 'a':
				SnakeGame.pSnake->SetDirection(LEFT);
				break;
			default:
				SnakeGame.pSnake->CanChangeDirection(true);
				break;
		}
	}
}

void MouseIntrHandler(void *CallbackRef) {
	Mouse *pMouse = (Mouse *)CallbackRef;
	pMouse->ReadCoordinates();
	pMouse->SetLeftButton(true);
	Xil_Out8(XPAR_VGA_MOUSE_CONTROLLER_0_S00_AXI_BASEADDR, 0);
}

void TmrIntHandler(void *CallBackRef, u8 TmrCtrNumber) {
	if(SnakeGame.GameOn) {
		SnakeGame.pSnake->MoveSnake();
		if(SnakeGame.pSnake->bCheckIfSnakeOnPoint(SnakeGame.pFood->GetXpos(), SnakeGame.pFood->GetYpos())) {
			do {
				SnakeGame.pFood->Generate();
			} while(SnakeGame.pSnake->bCheckIfSnakeOnPoint(SnakeGame.pFood->GetXpos(), SnakeGame.pFood->GetYpos()));
			SnakeGame.pSnake->AddTail();
			SnakeGame.Score++;
		}
		if(SnakeGame.pSnake->bCheckIfTailHit()) {
			XTmrCtr_Stop(&Timer, 0);
			SnakeGame.GameOn = false;
			return;
		}
		SnakeGame.DrawGameRectangles();
		SnakeGame.pSnake->CanChangeDirection(true);
	}
}



Game::Game(Sssssnake *ptrToSnake, Food *ptrToFood) : Score(0), GameOn(false), pSnake(ptrToSnake), pFood(ptrToFood),
			SnakeFoodRect(0, 0, SIZE, SIZE, IMAGE_APPLEDARK), SnakeHeadRect(0, 0, SIZE, SIZE, IMAGE_HEAD_RIGHT), UART_Enabled(false) {
	for(u8 i = 0; i < MAX_TAIL; i++) {
		SnakeTailRect[i].SetDim(SIZE, SIZE);
		SnakeTailRect[i].SetImage(IMAGE_BODY);
	}
	HardwareInit();
}

void Game::DrawGameRectangles() {
	SnakeFoodRect.SetPos(pFood->GetXpos() * SIZE, pFood->GetYpos() * SIZE);
	SnakeHeadRect.SetPos(pSnake->GetHeadPosX() * SIZE, pSnake->GetHeadPosY() * SIZE);
	for(u8 i = 0; i <= pSnake->GetTailNumber(); i++) {
		SnakeTailRect[i].SetPos(*(pSnake->GetTailX()+i) * SIZE, *(pSnake->GetTailY()+i) * SIZE);
	}
	switch(pSnake->GetDirection()) {
		case UP:
			SnakeHeadRect.SetImage(IMAGE_HEAD_UP);
			break;
		case DOWN:
			SnakeHeadRect.SetImage(IMAGE_HEAD_DOWN);
			break;
		case LEFT:
			SnakeHeadRect.SetImage(IMAGE_HEAD_LEFT);
			break;
		case RIGHT:
			SnakeHeadRect.SetImage(IMAGE_HEAD_RIGHT);
			break;
		default:
			break;
	}
	SnakeFoodRect.DrawRectangle();
	SnakeHeadRect.DrawRectangle();
	for(u8 i = 0; i <= pSnake->GetTailNumber(); i++) {
		SnakeTailRect[i].DrawRectangle();
	}
}

void Game::PauseGame() {
	XTmrCtr_Stop(&Timer, 0);
}

void Game::GameSetup() {
	pFood->SetSeed(XTmrCtr_GetValue(&Timer, 0));
	DrawGameRectangles();
	TmrIntHandler(NULL, 0);
	XTmrCtr_Start(&Timer, 0);
}

void Game::DisableGameRectangles() {
	SnakeFoodRect.DisableRectangle();
	SnakeHeadRect.DisableRectangle();
	for(u8 i = 0; i < MAX_TAIL; i++) {
		SnakeTailRect[i].DisableRectangle();
	}
}

void Game::SetDifficulty(enum Difficulty eDifficulty) {
	switch(eDifficulty) {
		case EASY:
			XTmrCtr_SetResetValue(&Timer, 0, 0xFE000000);
			break;
		case MEDIUM:
			XTmrCtr_SetResetValue(&Timer, 0, 0xFF300000);
			break;
		case HARD:
			XTmrCtr_SetResetValue(&Timer, 0, 0xFFA00000);
			break;
		default:
			break;
	}
}

void Game::SetMoveSettings(enum Movement eMovement) {
	switch(eMovement) {
		case BUTTONS:
			XGpio_InterruptGlobalEnable(&Gpio_PushButtons);
			UART_Enabled = false;
			break;
		case UART:
			XGpio_InterruptGlobalDisable(&Gpio_PushButtons);
			UART_Enabled = true;
			break;
		default:
			break;
	}
}

void Game::SetGameState(bool State) {
	GameOn = State;
}

bool Game::GetGameState() {
	return GameOn;
}

u8 Game::GetScore() {
	return Score;
}

void Game::SetScore(u8 Value) {
	Score = Value;
}

void Game::HardwareInit() {

	XGpio_Initialize(&Gpio_PushButtons, XPAR_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&Gpio_PushButtons, 1, 0xFFFFFFFF);
	XGpio_InterruptEnable(&Gpio_PushButtons, 1);
	XGpio_InterruptGlobalEnable(&Gpio_PushButtons);

	XUartLite_Initialize(&UartLite, XPAR_AXI_UARTLITE_0_DEVICE_ID);

	XTmrCtr_Initialize(&Timer, XPAR_AXI_TIMER_0_DEVICE_ID);
	XTmrCtr_SetHandler(&Timer, (XTmrCtr_Handler)TmrIntHandler, 0);
	XTmrCtr_SetOptions(&Timer, 0, XTC_INT_MODE_OPTION | XTC_AUTO_RELOAD_OPTION);
	XTmrCtr_SetResetValue(&Timer, 0, 0xFF300000);
	XTmrCtr_Start(&Timer, 0);

	XIntc_Initialize(&InterruptController, XPAR_INTC_0_DEVICE_ID);
	XIntc_Connect(&InterruptController, XPAR_INTC_0_MOUSE_CONTROLLER_0_VEC_ID,
			(XInterruptHandler)MouseIntrHandler, (void *)&MouseObj);
	XIntc_Connect(&InterruptController, XPAR_INTC_0_GPIO_0_VEC_ID,
			(XInterruptHandler)GpioIntrHandler, (void *)&Gpio_PushButtons);
	XIntc_Connect(&InterruptController, XPAR_INTC_0_UARTLITE_0_VEC_ID,
			(XInterruptHandler)XUartLite_InterruptHandler, (void *)&UartLite);
	XIntc_Connect(&InterruptController, XPAR_INTC_0_TMRCTR_0_VEC_ID,
			(XInterruptHandler)XTmrCtr_InterruptHandler, (void *)&Timer);
	XIntc_Start(&InterruptController, XIN_REAL_MODE);
	XIntc_Enable(&InterruptController, XPAR_INTC_0_MOUSE_CONTROLLER_0_VEC_ID);
	XIntc_Enable(&InterruptController, XPAR_INTC_0_GPIO_0_VEC_ID);
	XIntc_Enable(&InterruptController, XPAR_INTC_0_UARTLITE_0_VEC_ID);
	XIntc_Enable(&InterruptController, XPAR_INTC_0_TMRCTR_0_VEC_ID);

	XUartLite_SetRecvHandler(&UartLite, (XUartLite_Handler)UartRecvHandler, &UartLite);
	XUartLite_EnableInterrupt(&UartLite);

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler) XIntc_InterruptHandler, &InterruptController);
	Xil_ExceptionEnable();

}
