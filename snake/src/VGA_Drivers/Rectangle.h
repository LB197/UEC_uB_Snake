#ifndef SRC_RECTANGLE_H_
#define SRC_RECTANGLE_H_
#include "xil_types.h"

class Rectangle {
private:
	u16 Xpos;
	u16 Ypos;
	u16 Width;
	u16 Height;
	u8 Image;
	u8 Id;
	bool Enabled;

	static u8 ObjCtr;

protected:
	bool Pressed;
public:
	Rectangle();
	Rectangle(u16 X, u16 Y, u16 Width, u16 Height, u8 Image);
	void SetPos(u16 X, u16 Y);
	void SetDim(u16 W, u16 H);
	void SetImage(u8 Img);
	void DrawRectangle();
	void DisableRectangle();
	bool CheckIfPointInRect(u16 X, u16 Y);
	void UnPressButton();
	bool GetEnableState();
};

#endif /* SRC_RECTANGLE_H_ */
