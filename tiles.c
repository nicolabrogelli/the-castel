#include "tiles.h"
#include "msxgl.h"
#include "v9_api.h"

//=============================================================================
// FUNZIONI DI LIBRERIA PER LA GESTIONE DELLE TILES
//=============================================================================

/**
 * @brief Recuperare la tile dalla posizione indicata
 * @param u8 x Posizione x della tile
 * @param u8 y Posizione y della tile
 * @return u8 Codice che rappresenta la tile
 */
u8 getTile(u8 x, u8 y)
{
	return VDP_Peek_16K(g_ScreenLayoutLow + (y / 8) * 32 + (x / 8));
}

/**
 * @brief Modifica la tile nella posizione indicata
 * @param u8 x Posizione x della tile
 * @param u8 y Posizione y della tile
 * @param u8 tile Codice che rappresenta la tile
 * @return void
 */
void setTile(u8 x, u8 y, u8 tile)
{
	VDP_Poke_16K(tile, g_ScreenLayoutLow + (y / 8) * 32 + (x / 8));
	v9Call(V9OP_CELL, x / 8, y / 8, tile);
}

/**
 * @brief Legge la tile alle coordinate specificate
 * @param u8 x Posizione x della tile
 * @param u8 y Posizione y della tile
 * @return tile

u8 getTileByTileCoord(u8 x, u8 y)
{
	u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + y * 32 + x);
	return tile;
} 
*/

/**
 * @brief Sostituisce la tile nella posizione indicata con una tile vuota con le coordinate della tile stessa.
 * @param u8 x Posizione x della tile
 * @param u8 y Posizione y della tile
 * @param u8 tile Codice che rappresenta la tile
 * @return void
 */
void setTileByTileCoord(u8 x, u8 y, u8 tile)
{
	VDP_Poke_16K(tile, g_ScreenLayoutLow + y * 32 + x);
	v9Call(V9OP_CELL, x, y, tile);
}