#pragma once
//=============================================================================
// API del driver V9990 (segmento 10). Usare sempre v9Call(): salva e
// ripristina il segmento del banco 1, quindi e' sicura anche da codice banked.
//=============================================================================
#include "core.h"

enum V9_OPERATION
{
	V9OP_INIT = 0,      // inizializza la V9990 (se manca: messaggio e stop)
	V9OP_CELL,          // a = x tile, b = y tile, c = tile
	V9OP_SYNC_ROW,      // a = riga da copiare dalla mappa TMS
	V9OP_BEGIN_DRAW,    // spegne il display e nasconde gli sprite
	V9OP_END_DRAW,      // copia tutta la mappa TMS e riaccende il display
	V9OP_LEVEL_COLOR,   // a = ColorLevel del livello
	V9OP_SPR_SHOW,      // a = id sprite, b = ADDRESS_xxx del nemico
	V9OP_SPR_POS,       // a = id sprite, b = x, c = y (come VDP_SetSpritePosition)
	V9OP_SPR_HIDE,      // a = id sprite
	V9OP_PLAYER,        // a = x, b = y, c = AnimFrame/16
	V9OP_TICK,          // a = contatore frame
	V9OP_DEATH,         // a = passo (0 = inizio), b = x, c = y; restituisce 0 a fine animazione
};

u8 v9Call(u8 op, u8 a, u8 b, u8 c);
