//=============================================================================
// SEGMENT: 18
// BANK: 1
// DESCRIPTION: Life
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"

//=============================================================================
// DEFINE
//=============================================================================
#define MAX_LIVES             3
#define TILE_HEART           79 
#define EMPTY_ITEM 		  	  0
#define MAX_ITEM_INVENTORY    5
#define OFFSET_X_LIFE         8 // Solo multipli di 8
#define BASE_X_LIFE         190


extern void setTile(u8 x, u8 y, u8 tile);
extern unsigned char g_Lives[MAX_LIVES];

//=============================================================================
// FUNCTION
//=============================================================================

/**
 * @brief Inizializza le vite
 * @param void
 * @return void
 */
void initLife()
{
	//g_Player.Life = MAX_LIVES;

	Mem_Set(TILE_HEART, g_Lives, (3 * sizeof(g_Lives[0])));
}

/**
 * @brief Rimuove una vita
 * @param void
 * @return bool TRUE se è stata rimossa una vita
 */
bool removeLife()
{
	for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	{

		if (g_Lives[i] == TILE_HEART)
		{
			g_Lives[i] = EMPTY_ITEM;
			setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), 0);
			return (i > 0);
		}
	}

	return FALSE;
}


/**
 * @brief Visualizza tutte le vite disponibili
 * @param void
 * @return void
 */
void displayLife()
{
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), g_Lives[i]); // 220
	}
}



/**
 * @brief Aggiunta di una vita
 * @param void
 * @return bool TRUE se è stata aggiunta una vita
 */
bool addLife()
{
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		if (g_Lives[i] == EMPTY_ITEM)
		{
			g_Lives[i] = TILE_HEART;

			setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), TILE_HEART);
			return TRUE;
		}
	}
	return FALSE;
}


/**
 * @brief COntrolla se ci sono ancora vite disponibili
 * @return TRUE se ci sono vite disponibili
 */
bool hasLives()
{
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		if (g_Lives[i] == TILE_HEART)
		{
			return TRUE;
		}
	}
	return FALSE;
}