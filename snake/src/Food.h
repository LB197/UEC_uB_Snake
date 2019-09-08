#ifndef FOOD_H_
#define FOOD_H_
#include "xil_types.h"

class Food {
private:
	u8 Xpos;
	u8 Ypos;
	bool SeedSet;
public:
	Food();
	void Generate();
	void SetSeed(u32 Seed);
	u8 GetXpos();
	u8 GetYpos();

};

#endif /* FOOD_H_ */
