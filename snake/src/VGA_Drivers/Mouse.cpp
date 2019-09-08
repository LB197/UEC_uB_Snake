#include "Mouse.h"
#include "xparameters.h"
#include "xil_io.h"

Mouse::Mouse() : LeftButtonPressed(false) {}

void Mouse::ReadCoordinates() {
	u32 Coord = Xil_In32(XPAR_VGA_MOUSE_CONTROLLER_0_S00_AXI_BASEADDR);
	Xpos = Coord & 0xFFF;
	Ypos = (Coord & 0xFFF000) >> 12;
}

u16 Mouse::GetXpos() {
	return Xpos;
}

u16 Mouse::GetYpos() {
	return Ypos;
}

bool Mouse::GetLeftButtonState() {
	return LeftButtonPressed;
}

void Mouse::SetLeftButton(bool Value) {
	LeftButtonPressed = Value;
}


