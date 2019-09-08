#include "Snake.h"

Sssssnake::Sssssnake() {
	Reset();
}

void Sssssnake::MoveSnake() {
	CalcTail();
	switch(eDirection) {
	case UP:
		if(HeadPosY == 0) {
			HeadPosY = HEIGHT-1;
		} else {
			HeadPosY = (HeadPosY-1) % HEIGHT;
		}
		break;
	case LEFT:
		if(HeadPosX == 0) {
			HeadPosX = WIDTH-1;
		} else {
			HeadPosX = (HeadPosX-1) % WIDTH;
		}
		break;
	case DOWN:
		HeadPosY = (HeadPosY+1) % HEIGHT;
		break;
	case RIGHT:
		HeadPosX = (HeadPosX+1) % WIDTH;
		break;
	default:
		break;
	}
}

void Sssssnake::AddTail() {
	if(TailNumber < MAX_TAIL-1) {
		TailNumber++;
		TailX[TailNumber] = TailX[TailNumber-1];
		TailY[TailNumber] = TailY[TailNumber-1];
	}
}

void Sssssnake::SetDirection(enum Direction eNewDirection) {
	switch(eNewDirection){
		case UP:
			if(eDirection != DOWN) {
				NewDirectionSet = true;
				eDirection = UP;
			}
			break;
		case LEFT:
			if(eDirection != RIGHT) {
				NewDirectionSet = true;
				eDirection = LEFT;
			}
			break;
		case DOWN:
			if(eDirection != UP) {
				NewDirectionSet = true;
				eDirection = DOWN;
			}
			break;
		case RIGHT:
			if(eDirection != LEFT) {
				NewDirectionSet = true;
				eDirection = RIGHT;
			}
			break;
		default:
			break;
		}
}

bool Sssssnake::CheckIfCanChangeDirection() {
	return !NewDirectionSet;
}

void Sssssnake::CanChangeDirection(bool Value) {
	NewDirectionSet = !Value;
}

enum Direction Sssssnake::GetDirection() {
	return eDirection;
}

u8 Sssssnake::GetTailNumber() {
	return TailNumber;
}

void Sssssnake::CalcTail() {
	for(u8 i = TailNumber; i > 0; i--) {
		TailX[i] = TailX[i-1];
		TailY[i] = TailY[i-1];
	}
	TailX[0] = HeadPosX;
	TailY[0] = HeadPosY;
}

void Sssssnake::Reset() {
	HeadPosX = WIDTH/2;
	HeadPosY = HEIGHT/2;
	eDirection = RIGHT;
	TailX[0] = WIDTH/2 - 1;
	TailY[0] = HEIGHT/2;
	TailNumber = 0;
	NewDirectionSet = false;
}

bool Sssssnake::bCheckIfTailHit() {
	for(uint8_t i = 0; i <= TailNumber; i++) {
		if(TailX[i] == HeadPosX && TailY[i] == HeadPosY) {
			return true;
		}
	}
	return false;
}

bool Sssssnake::bCheckIfSnakeOnPoint(u8 X, u8 Y) {
	if(HeadPosX == X && HeadPosY == Y) {
		return true;
	}
	for(uint8_t i = 0; i < TailNumber; i++) {
		if(TailX[i] == X && TailY[i] == Y) {
			return true;
		}
	}
	return false;
}

u8 Sssssnake::GetHeadPosX() {
	return HeadPosX;
}
u8 Sssssnake::GetHeadPosY() {
	return HeadPosY;
}
u8 * Sssssnake::GetTailX() {
	return TailX;
}
u8 * Sssssnake::GetTailY() {
	return TailY;
}
