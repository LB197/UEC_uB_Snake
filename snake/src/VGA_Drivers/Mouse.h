#ifndef SRC_MOUSE_H_
#define SRC_MOUSE_H_
#include "xil_types.h"

class Mouse {
private:
	u16 Xpos;
	u16 Ypos;
	bool LeftButtonPressed;
public:
	Mouse();
	void ReadCoordinates();
	u16 GetXpos();
	u16 GetYpos();
	void SetLeftButton(bool Value);
	bool GetLeftButtonState();
};

#endif /* SRC_MOUSE_H_ */
