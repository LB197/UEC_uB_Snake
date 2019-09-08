#include <stdlib.h>
#include "Food.h"
#include "defines.h"

Food::Food() : SeedSet(false) {}

void Food::Generate() {
	Xpos = rand() % WIDTH;
	Ypos = rand() % HEIGHT;
}

void Food::SetSeed(u32 Seed) {
	if(!SeedSet) {
		srand(Seed);
		SeedSet = true;
		Generate();
	}
}

u8 Food::GetXpos() {
	return Xpos;
}
u8 Food::GetYpos() {
	return Ypos;
}
