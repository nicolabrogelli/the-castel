//=============================================================================
// SEGMENT: 19
// BANK: 1
// DESCRIPTION: Control management via keyboard and Joy
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "game_pawn.h"

//=============================================================================
// MEMORY
//=============================================================================

enum INPUT_ACTION
{
	INPUT_RIGHT = 0b00000001,
	INPUT_LEFT = 0b00000010,
	INPUT_JUMP = 0b00000100,
	INPUT_GET = 0b00001000,
};


//=============================================================================
// FUNCTIONS
//=============================================================================

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @param u8 input direzione
 * @return bool TRUE se il tasto RIGHT o il joy è nella direzione destra
 */
bool isMoveRight(u8 row8, u8 input)
{
	bool isRight = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_RIGHT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_RIGHT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_RIGHT))
	{
		input |= INPUT_RIGHT;
		isRight = TRUE;
	}

	return isRight;
}


/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @param u8 input direzione
 * @return bool TRUE se il tasto LEFT o il joy è nella direzione sinistra
 */
bool isMoveLeft(u8 row8, u8 input)
{
	bool isLeft = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_LEFT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_LEFT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_LEFT))
	{
		input |= INPUT_LEFT;
		isLeft = TRUE;
	}

	return isLeft;
}

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @param u8 input direzione
 * @return bool TRUE se il tasto UP o il pulsante A è stato premuto
 */
bool isMoveJump(u8 row8, u8 input)
{
	bool isJump = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_UP) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_A)))
	{
		input |= INPUT_JUMP;
		isJump = TRUE;
	}

	return isJump;
}

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @param u8 input direzione
 * @return bool TRUE se il tasto SPACE o il pulsante B è stato premuto
 */
bool isInteractObject(u8 row8, u8 input)
{
	bool isGet = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_SPACE) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_B)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_B)))
	{
		input |= INPUT_GET;
		isGet = TRUE;
	}

	return isGet;
}
