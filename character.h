#include "msxgl.h"

struct Character
{
	bool bMoving;
	bool bInAir;
	i8 VelocityY;
	i8 DX;
	i8 DY;
	u8 Input;
	u16 Score;
	u8 Life;
	Game_Pawn Pawn;
	i16 FallStartY; // Coordinata Y dove è iniziata la caduta
    u8 FallDamageThreshold; // Soglia di altezza per i danni da caduta
};