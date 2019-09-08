#include "Food.h"
#include "Snake.h"
#include "Menu.h"
#include "Game.h"

Sssssnake Snake;
Food SnakeFood;
Menu SnakeMenu(Menu::IMAGE, VGA_BG_IMAGE_GRASSDARK);
Game SnakeGame(&Snake, &SnakeFood);

int main() {
	SnakeMenu.MainMenuSetup();
	SnakeGame.DisableGameRectangles();
	while(1) {
		switch(SnakeMenu.GetMenuState()) {
/***************************************************************************/
		case Menu::MAINMENU:
			switch(SnakeMenu.CheckButtonPressed(&(SnakeGame.MouseObj))) {
				case 0://Play
					SnakeGame.DisableGameRectangles();
					SnakeGame.SetScore(0);
					Snake.Reset();
					SnakeGame.SetGameState(true);
					SnakeMenu.SetMenuState(Menu::GAME);
					SnakeMenu.GameMenuSetup(SnakeGame);
					break;
				case 1://Settings
					SnakeMenu.SetMenuState(Menu::SETTINGS);
					SnakeMenu.SettingsMenuSetup();
					break;
				case 2://Exit
					SnakeMenu.DisableMenu();
					SnakeGame.DisableGameRectangles();
					SnakeMenu.DrawBackground(Menu::PLAIN, VGA_BG_COLOR_BLACK);
					return 0;
				case 3://Continue
					if(SnakeGame.GetGameState()) {
						SnakeGame.DisableGameRectangles();
						SnakeMenu.SetMenuState(Menu::GAME);
						SnakeMenu.GameMenuSetup(SnakeGame);
					}
					break;
				default:
					SnakeMenu.SetMenuState(Menu::MAINMENU);
					break;
			}
			break;
/***************************************************************************/
		case Menu::SETTINGS:
			SnakeMenu.SetMenuState(Menu::SETTINGS);
			switch(SnakeMenu.CheckButtonPressed(&(SnakeGame.MouseObj))) {
				case 0://Back
					SnakeMenu.SetMenuState(Menu::MAINMENU);
					SnakeMenu.MainMenuSetup();
					break;
				case 1://PushButtons
					SnakeGame.SetMoveSettings(Game::BUTTONS);
					break;
				case 2://Keyboard/UART
					SnakeGame.SetMoveSettings(Game::UART);
					break;
				case 3://Easy
					SnakeGame.SetDifficulty(Game::EASY);
					break;
				case 4://Medium
					SnakeGame.SetDifficulty(Game::MEDIUM);
					break;
				case 5://Hard
					SnakeGame.SetDifficulty(Game::HARD);
					break;
				default:
					break;
			}
			break;
/***************************************************************************/
		case Menu::GAME:
			SnakeMenu.SetMenuState(Menu::GAME);
			switch(SnakeMenu.CheckButtonPressed(&(SnakeGame.MouseObj))) {
				case 0://Back
					SnakeMenu.SetMenuState(Menu::MAINMENU);
					SnakeGame.PauseGame();
					SnakeMenu.MainMenuSetup();
					break;
				default:
					SnakeMenu.UpdateScore(SnakeGame.GetScore());
					if(!(SnakeGame.GetGameState()) || (SnakeGame.GetScore() == MAX_TAIL-1)) {
						SnakeGame.SetGameState(false);
						SnakeMenu.SetMenuState(Menu::GAMEOVER);
						SnakeMenu.GameOverMenuSetup(SnakeGame);
					}
					break;
				}
			break;
/***************************************************************************/
		case Menu::GAMEOVER:
			SnakeMenu.SetMenuState(Menu::GAMEOVER);
			switch(SnakeMenu.CheckButtonPressed(&(SnakeGame.MouseObj))) {
				case 0: //Try again
					SnakeGame.DisableGameRectangles();
					SnakeGame.SetScore(0);
					Snake.Reset();
					SnakeGame.SetGameState(true);
					SnakeMenu.SetMenuState(Menu::GAME);
					SnakeMenu.GameMenuSetup(SnakeGame);
					break;
				case 1: //Back
					SnakeMenu.SetMenuState(Menu::MAINMENU);
					SnakeMenu.MainMenuSetup();
					break;
				default:
					break;
			}
			break;
/***************************************************************************/
		default:
			break;
/***************************************************************************/
		}
	}
}
