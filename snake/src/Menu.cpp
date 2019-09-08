#include "Menu.h"
#include "xil_io.h"
#include "xparameters.h"


Menu::Menu(enum BackgroundType eType, u16 ColorOrImage) : eMenuState(MAINMENU) {
	DrawBackground(eType, ColorOrImage);
}

void U8ToStr (u8 Value, char pStr[], u8 StrSize) {
	u8 i = 1;
	for(; i <= StrSize; i++) {
		pStr[StrSize - i] = (char)((Value % 10) + '0');
		Value = Value / 10;
	}
	pStr[i-1] = '\0';
}

void Menu::DrawBackground(enum BackgroundType eType, u16 ColorOrImage) {
	switch(eType) {
		case PLAIN:
			Xil_Out16(XPAR_VGA_VGA_BACKGROUND_0_S00_AXI_BG_BASEADDR, ColorOrImage);
			Xil_Out8(XPAR_VGA_VGA_BACKGROUND_0_S00_AXI_BG_BASEADDR+3, 0b0);
			break;
		case IMAGE:
			Xil_Out8(XPAR_VGA_VGA_BACKGROUND_0_S00_AXI_BG_BASEADDR+2, ColorOrImage);
			Xil_Out8(XPAR_VGA_VGA_BACKGROUND_0_S00_AXI_BG_BASEADDR+3, 0b1);
			break;
		default:
			break;

	}
}

void Menu::DisableMenu() {
	for(u8 i = 0; i < MAX_MENU_BUTTONS; i++) {
		MenuRectangle[i].DisableRectangle();
	}
}

void Menu::MainMenuSetup(){
	DisableMenu();
	MenuRectangle[0].SetData(300, 250, 120, 50, IMAGE_DIRT, "Play", VGA_BG_COLOR_BLACK);
	MenuRectangle[1].SetData(300, 350, 120, 50, IMAGE_DIRT, "Settings", VGA_BG_COLOR_BLACK);
	MenuRectangle[2].SetData(300, 450, 120, 50, IMAGE_DIRT, "Exit", VGA_BG_COLOR_BLACK);
	MenuRectangle[3].SetData(300, 150, 120, 50, IMAGE_DIRT, "Continue", VGA_BG_COLOR_BLACK);
	MenuRectangle[4].SetData(0, 576, 200, 24, IMAGE_DIRT, "By D. B. & L. B.", VGA_BG_COLOR_WHITE);
	MenuRectangle[5].SetData(275, 50, 170, 35, IMAGE_BODY, "SNAKE", VGA_BG_COLOR_WHITE);
	VgaText::CopyTextToMemory();
	MenuRectangle[0].DrawRectangle();
	MenuRectangle[1].DrawRectangle();
	MenuRectangle[2].DrawRectangle();
	MenuRectangle[3].DrawRectangle();
	MenuRectangle[4].DrawRectangle();
	MenuRectangle[5].DrawRectangle();
}

void Menu::SettingsMenuSetup() {
	DisableMenu();
	MenuRectangle[0].SetData(300, 450, 120, 50, IMAGE_DIRT, "Back", VGA_BG_COLOR_BLACK);
	MenuRectangle[1].SetData(200, 350, 120, 50, IMAGE_DIRT, "Board Buttons", VGA_BG_COLOR_BLACK);
	MenuRectangle[2].SetData(200, 250, 120, 50, IMAGE_DIRT, "Keyboard/Uart", VGA_BG_COLOR_BLACK);
	MenuRectangle[3].SetData(400, 150, 120, 50, IMAGE_DIRT, "Easy", VGA_BG_COLOR_BLACK);
	MenuRectangle[4].SetData(400, 250, 120, 50, IMAGE_DIRT, "Medium", VGA_BG_COLOR_BLACK);
	MenuRectangle[5].SetData(400, 350, 120, 50, IMAGE_DIRT, "Hard", VGA_BG_COLOR_BLACK);
	VgaText::CopyTextToMemory();
	MenuRectangle[0].DrawRectangle();
	MenuRectangle[1].DrawRectangle();
	MenuRectangle[2].DrawRectangle();
	MenuRectangle[3].DrawRectangle();
	MenuRectangle[4].DrawRectangle();
	MenuRectangle[5].DrawRectangle();
}

void Menu::GameMenuSetup(Game & GameObj) {
	GameObj.SetGameState(true);
	DisableMenu();
	MenuRectangle[0].SetData(700, 576, 100, 24, IMAGE_DIRT, "Back", VGA_BG_COLOR_BLACK);
	MenuRectangle[0].DrawRectangle();
	UpdateScore(GameObj.GetScore());
	GameObj.GameSetup();
}

void Menu::GameOverMenuSetup(Game & GameObj) {
	DisableMenu();
	MenuRectangle[0].SetData(300, 300, 100, 50, IMAGE_DIRT, "Try again", VGA_BG_COLOR_BLACK);
	MenuRectangle[1].SetData(500, 300, 100, 50, IMAGE_DIRT, "Back", VGA_BG_COLOR_BLACK);
	if(GameObj.GetScore() == MAX_TAIL-1) MenuRectangle[2].SetData(400, 150, 100, 50, IMAGE_BODY, "You won!", VGA_BG_COLOR_WHITE);
	VgaText::CopyTextToMemory();
	MenuRectangle[0].DrawRectangle();
	MenuRectangle[1].DrawRectangle();
	if(GameObj.GetScore() == MAX_TAIL-1) MenuRectangle[2].DrawRectangle();
}

int Menu::CheckButtonPressed(Mouse *pMouse) {
	if(pMouse->GetLeftButtonState()) {
		pMouse->SetLeftButton(false);
		for(u8 i = 0; i < MAX_MENU_BUTTONS; i++) {
			if(MenuRectangle[i].CheckIfPointInRect(pMouse->GetXpos(), pMouse->GetYpos())) {
				return i;
			}
		}
	}
	return -1;
}

void Menu::UpdateScore(u8 Value) {
	char ScoreStr[11] = "Score: ";
	U8ToStr(Value, ScoreStr+6, 3);
	MenuRectangle[1].SetData(0, 576, 800, 24, IMAGE_DIRT, ScoreStr, VGA_BG_COLOR_BLACK);
	VgaText::CopyTextToMemory();
	MenuRectangle[1].DrawRectangle();
}

enum Menu::MenuState Menu::GetMenuState() {
	return eMenuState;
}
void Menu::SetMenuState(enum MenuState eState) {
	eMenuState = eState;
}

