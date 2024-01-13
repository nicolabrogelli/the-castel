#pragma once
#include "core.h"


enum INPUT_ACTION
{
	INPUT_RIGHT = 0b00000001,
	INPUT_LEFT = 0b00000010,
	INPUT_JUMP = 0b00000100,
	INPUT_GET = 0b00001000,
};


bool isMoveRight(u8 row8, u8 input);
bool isMoveLeft(u8 row8, u8 input);
bool isMoveJump(u8 row8, u8 input);
bool isInteractObject(u8 row8, u8 input);
