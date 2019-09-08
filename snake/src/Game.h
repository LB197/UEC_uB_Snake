#ifndef SRC_GAME_H_
#define SRC_GAME_H_
#include "VGA_Drivers/Rectangle.h"
#include "VGA_Drivers/Mouse.h"
#include "xil_types.h"
#include "defines.h"
#include "Food.h"
#include "Snake.h"

class Game {
private:
	u8 Score;
	bool GameOn;
	Sssssnake *pSnake;
	Food *pFood;
	Rectangle SnakeFoodRect;
	Rectangle SnakeHeadRect;
	Rectangle SnakeTailRect[MAX_TAIL];
	bool UART_Enabled;
	void HardwareInit();
	friend void TmrIntHandler(void *CallBackRef, u8 TmrCtrNumber);
	friend void GpioIntrHandler(void *CallbackRef);
	friend void UartRecvHandler(void *CallBackRef, unsigned int ByteCount);
public:
	Mouse MouseObj;
	enum Difficulty {EASY, MEDIUM, HARD};
	enum Movement {BUTTONS, UART};
	Game(Sssssnake *ptrToSnake, Food *ptrToFood);
	void SetGameState(bool State);
	bool GetGameState();
	u8 GetScore();
	void SetScore(u8 Value);
	void DrawGameRectangles();
	void DisableGameRectangles();
	void GameSetup();
	void PauseGame();
	void SetDifficulty(enum Difficulty eDifficulty);
	enum Difficulty GetDifficulty();
	void SetMoveSettings(enum Movement eMovement);


};



#endif /* SRC_GAME_H_ */
