#include "TextRectangle.h"
#include "string.h"

TextRectangle::TextRectangle() : Rectangle(), RectText() {}

TextRectangle::TextRectangle(u16 X, u16 Y, u16 Width, u16 Height, u8 Image) : Rectangle(X, Y, Width, Height, Image), RectText() {}

TextRectangle::TextRectangle(u16 X, u16 Y, u16 Width, u16 Height, u8 Image, const char* Text, u16 TextColor) :
		Rectangle(X, Y, Width, Height, Image), RectText( (X + (Width/2) - strlen(Text)*4), (Y + (Height/2) - 8), Text, TextColor ) {}

void TextRectangle::DrawRectangle() {
	Rectangle::DrawRectangle();
	RectText.DrawText();
}

void TextRectangle::DisableRectangle() {
	Rectangle::DisableRectangle();
	RectText.DisableText();
}

void TextRectangle::SetText(const char *Text, u16 TextColor) {
	RectText.SetText(Text, TextColor);
}

void TextRectangle::SetData(u16 X, u16 Y, u16 Width, u16 Height, u8 Image, const char* Text, u16 TextColor) {
	SetPos(X, Y);
	SetDim(Width, Height);
	SetImage(Image);
	RectText.SetData((X + (Width/2) - strlen(Text)*4), (Y + (Height/2) - 8), Text, TextColor);
}
