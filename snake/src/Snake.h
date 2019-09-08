#ifndef SNAKE_H_
#define SNAKE_H_
#include "xil_types.h"
#include "defines.h"

enum Direction{UP, LEFT, DOWN, RIGHT};

class Sssssnake {
private:
	u8 HeadPosX;
	u8 HeadPosY;
	enum Direction eDirection;
	u8 TailX[MAX_TAIL];
	u8 TailY[MAX_TAIL];
	u8 TailNumber;
	bool NewDirectionSet;
public:
	Sssssnake();
	void MoveSnake();
	bool bCheckIfTailHit();
	bool bCheckIfSnakeOnPoint(u8 X, u8 Y);
	void AddTail();
	void CalcTail();
	void SetDirection(enum Direction eNewDirection);
	bool CheckIfCanChangeDirection();
	void CanChangeDirection(bool Value);
	enum Direction GetDirection();
	u8 GetTailNumber();
	u8 GetHeadPosX();
	u8 GetHeadPosY();
	u8 * GetTailX();
	u8 * GetTailY();
	void Reset();
};

#endif /* SNAKE_H_ */
