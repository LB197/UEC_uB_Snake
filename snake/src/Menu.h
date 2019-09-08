#ifndef SRC_MENU_H_
#define SRC_MENU_H_
#include "xil_types.h"
#include "VGA_Drivers/TextRectangle.h"
#include "VGA_Drivers/VgaText.h"
#include "VGA_Drivers/Mouse.h"
#include "Game.h"
#include "defines.h"

class Menu {
public:
	enum BackgroundType {PLAIN, IMAGE};
	enum MenuState {MAINMENU, SETTINGS, GAME, GAMEOVER};
private:
	TextRectangle MenuRectangle[MAX_MENU_BUTTONS];
	enum MenuState eMenuState;
public:
	Menu(enum BackgroundType eType, u16 ColorOrImage);
	void DrawBackground(enum BackgroundType eType, u16 ColorOrImage);
	void MainMenuSetup();
	void SettingsMenuSetup();
	void GameMenuSetup(Game & GameObj);
	void GameOverMenuSetup(Game & GameObj);
	void DisableMenu();
	int CheckButtonPressed(Mouse *pMouse);
	void UpdateScore(u8 Value);
	enum MenuState GetMenuState();
	void SetMenuState(enum MenuState eState);

};

#endif /* SRC_MENU_H_ */
