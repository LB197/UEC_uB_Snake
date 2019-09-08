#include "VgaText.h"
#include "xil_io.h"
#include "xparameters.h"
#include "stdlib.h"
#include "string.h"
#include "../defines.h"

u8 VgaText::TextObjCtr = 0;
VgaText *pObjectInstance[MAX_MENU_BUTTONS];

VgaText::VgaText() : ptrToText(NULL), TextId(TextObjCtr++) {
	pObjectInstance[TextId] = this;
}

VgaText::VgaText(u16 X, u16 Y) : Xpos(X), Ypos(Y), ptrToText(NULL), TextId(TextObjCtr++) {
	pObjectInstance[TextId] = this;
}

VgaText::VgaText(u16 X, u16 Y, const char *Text, u16 Color) : Xpos(X), Ypos(Y), ptrToText(NULL), TextId(TextObjCtr++) {
	pObjectInstance[TextId] = this;
	SetText(Text, Color);
}

void VgaText::SetData(u16 X, u16 Y, const char *Text, u16 Color) {
	Xpos = X;
	Ypos = Y;
	SetText(Text, Color);
}

void VgaText::DrawText() {
	Xil_Out64(XPAR_VGA_VGA_DRAWRECT_CHAR_0_S_AXI_CHAR_CTRL_BASEADDR+(8*TextId),
			( (1ULL << 56) + ((u64)TextColor << 44) + ((u64)TextAddr << 37) + ((u64)(TextLength * 8) << 24) + ((u32)Ypos << 12) + Xpos) );

}

void VgaText::DisableText() {
	Xil_Out8(XPAR_VGA_VGA_DRAWRECT_CHAR_0_S_AXI_CHAR_CTRL_BASEADDR+(8*TextId)+7, 0b00000000);
}

void VgaText::SetTextColor(u16 Color) {
	TextColor = Color;
}

void VgaText::SetText(const char *Text, u16 Color) {
	TextColor = Color;
	free(ptrToText);
	TextLength = strlen(Text);
	ptrToText = (char*)malloc(TextLength + 1);
	strcpy(ptrToText, Text);
}

void VgaText::CopyTextToMemory() {
	u8 CharCounter = 0;
	for(u8 i = 0; i < MAX_MENU_BUTTONS; i++) {
		if(pObjectInstance[i] != NULL) {
			strcpy((char*)XPAR_VGA_VGA_DRAWRECT_CHAR_0_S_AXI_TEXT_MEM_BASEADDR + CharCounter, pObjectInstance[i]->ptrToText);
			pObjectInstance[i]->TextAddr = CharCounter;
			CharCounter = CharCounter + pObjectInstance[i]->TextLength;
		}
	}
}

