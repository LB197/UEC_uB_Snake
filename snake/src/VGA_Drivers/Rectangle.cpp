#include "Rectangle.h"
#include "xil_io.h"
#include "xparameters.h"

u8 Rectangle::ObjCtr = 0;

Rectangle::Rectangle() : Id(ObjCtr++), Enabled(false), Pressed(false) {}

Rectangle::Rectangle(u16 X, u16 Y, u16 Width, u16 Height, u8 Image) : Xpos(X), Ypos(Y), Width(Width), Height(Height), Image(Image), Id(ObjCtr++), Enabled(false), Pressed(false) {}

void Rectangle::SetPos(u16 X, u16 Y) {
	Xpos = X;
	Ypos = Y;
}

void Rectangle::SetDim(u16 W, u16 H) {
	Width = W;
	Height = H;
}
void Rectangle::SetImage(u8 Img) {
	Image = Img;
}
void Rectangle::DrawRectangle() {
	Enabled = true;
	Xil_Out64(XPAR_VGA_VGA_DRAWRECT_0_S00_AXI_BASEADDR+(8*Id),
			(((u64)Image << 49) + (1ULL << 48) + ((u64)Width << 36) + ((u64)Height << 24) + ((u32)Ypos << 12) + Xpos));
}

void Rectangle::DisableRectangle() {
	Enabled = false;
	Xil_Out8(XPAR_VGA_VGA_DRAWRECT_0_S00_AXI_BASEADDR+(8*Id)+6,
			( Xil_In8(XPAR_VGA_VGA_DRAWRECT_0_S00_AXI_BASEADDR+(8*Id)+6) & 0b11111110 ) );
}

bool Rectangle::CheckIfPointInRect(u16 X, u16 Y) {
	if(Enabled && X >= Xpos && X <= Xpos + Width && Y >= Ypos && Y <= Ypos + Height) {
		Pressed = true;
		return true;
	}
	return false;
}

void Rectangle::UnPressButton() {
	Pressed = false;
}

bool Rectangle::GetEnableState() {
	return Enabled;
}
