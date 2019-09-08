#ifndef SRC_TEXTRECTANGLE_H_
#define SRC_TEXTRECTANGLE_H_
#include "Rectangle.h"
#include "VgaText.h"

class TextRectangle : public Rectangle {
private:
	VgaText RectText;

public:
	TextRectangle();
	TextRectangle(u16 X, u16 Y, u16 Width, u16 Height, u8 Image);
	TextRectangle(u16 X, u16 Y, u16 Width, u16 Height, u8 Image, const char* Text, u16 TextColor);

	void DrawRectangle();
	void DisableRectangle();
	void SetText(const char *Text, u16 TextColor);
	void SetData(u16 X, u16 Y, u16 Width, u16 Height, u8 Image, const char* Text, u16 TextColor);

};

#endif /* SRC_TEXTRECTANGLE_H_ */
