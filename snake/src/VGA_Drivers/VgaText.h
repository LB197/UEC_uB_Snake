#ifndef SRC_VGATEXT_H_
#define SRC_VGATEXT_H_
#include "xil_types.h"

class VgaText {
private:
	u16 Xpos;
	u16 Ypos;
	char *ptrToText;
	u8 TextLength;
	u8 TextAddr;
	u16 TextColor;
	u8 TextId;

	static u8 TextObjCtr;

public:
	VgaText();
	VgaText(u16 X, u16 Y);
	VgaText(u16 X, u16 Y, const char *Text, u16 Color);
	void SetData(u16 X, u16 Y, const char *Text, u16 Color);
	void DrawText();
	void DisableText();
	void SetText(const char *Text, u16 Color);
	void SetTextColor(u16 Color);
	static void CopyTextToMemory();
};

#endif /* SRC_VGATEXT_H_ */
