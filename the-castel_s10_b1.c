//=============================================================================
// SEGMENT: 10
// BANK: 1
// DESCRIPTION: Driver grafico V9990 (GFX9000) - modo P1
//
// La VRAM del TMS9918 resta la "mappa logica" del gioco (collisioni, porte,
// oggetti, testo): qui la si replica sulla V9990, che e' l'unica uscita video.
// Tutte le funzioni sono raggiunte da v9Call() (the-castel.c), che salva e
// ripristina il segmento attivo del banco 1.
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"

// Il modulo v9990 di MSXgl viene compilato dentro questo segmento perche' il
// segmento fisso (main) non ha spazio sufficiente.
#include "v9990.c"

#include "data/v9990/v9_tables.h"
#include "v9_api.h"

//=============================================================================
// DEFINES
//=============================================================================
#define V9_OFFSET_Y         10  // Le 192 righe del gioco centrate nelle 212 del P1
#define V9_MAX_SPRITE       32
#define V9_NO_KIND        0xFF
#define V9_SGT_ADDR    0x08000

#define V9_PAL_BRICK         2  // Indici 2-4: rampa mattoni (per livello)
#define V9_PAL_WATER         5  // Indici 5-7: acqua (ruotano)
#define V9_PAL_LAVA          8  // Indici 8-10: lava e fiamme (ruotano)
#define V9_PAL_BG            3  // Palette 3 (colori 48-63): fondale sul layer B
#define V9_PAL_PLAYER       16  // Palette 1 (colori 16-31): giocatore

// Animazione della morte del giocatore (posizione Y in 1/4 di pixel)
#define V9_DEATH_FLASH      24  // Frame di lampeggio bianco/rosso
#define V9_DEATH_MAX       130  // Durata massima dell'animazione
#define V9_DEATH_JUMP     (-14) // Velocita' iniziale del balzo verso l'alto
#define V9_DEATH_VMAX       20  // Velocita' massima di caduta
#define V9_ANIM_JUMP         4  // Offset animazione salto  (destra, +1 sinistra)
#define V9_ANIM_FALL         6  // Offset animazione caduta (destra, +1 sinistra)

//=============================================================================
// EXTERN
//=============================================================================
extern void v9Blit(u8 seg, const u8 *src, u16 count);
extern const unsigned char g_V9Tiles[];
extern const unsigned char g_V9Sprites[];
extern const unsigned char g_V9BgTiles[];
extern const unsigned char g_V9BgMap[];

//=============================================================================
// MEMORY
//=============================================================================
u8 g_V9Kind[V9_MAX_SPRITE];   // Tipo di nemico assegnato ad ogni sprite (0-7)
u8 g_V9X[V9_MAX_SPRITE];      // Ultima X (per capire la direzione)
u8 g_V9Y[V9_MAX_SPRITE];      // Ultima Y
u8 g_V9Left[V9_MAX_SPRITE];   // 1 = rivolto a sinistra
u8 g_V9Tick;                  // Contatore frame per animazioni e palette
u8 g_V9Row[32];               // Buffer di una riga della name table TMS
u8 g_V9PlayerLeft;            // 1 = il giocatore guarda a sinistra
u8 g_V9DeathX;                // Animazione morte: X dello sprite
i16 g_V9DeathY;               // Animazione morte: Y in 1/4 di pixel
i8 g_V9DeathVY;               // Animazione morte: velocita' verticale

const u8 g_V9DeathWhite[] = { 0x1F, 0x1F, 0x1F };
const u8 g_V9DeathRed[]   = { 0x1F, 0x03, 0x02 };

//=============================================================================
// FUNZIONI
//=============================================================================

/** Scrive un elemento della tabella attributi sprite */
void v9WriteSprite(u8 id, u8 y, u8 pattern, u8 x, u8 info)
{
	V9_SetWriteAddress(V9_P1_SPAT + ((u16)id * 4));
	V9_Poke_CurrentAddr(y);
	V9_Poke_CurrentAddr(pattern);
	V9_Poke_CurrentAddr(x);
	V9_Poke_CurrentAddr(info);
}

/** Disabilita uno sprite */
void v9HideSprite(u8 id)
{
	V9_Poke(V9_P1_SPAT + 3 + ((u16)id * 4), V9_SPAT_INFO_DISABLE);
}

/** Restituisce la cella corrente di un'animazione */
u8 v9AnimCell(u8 anim)
{
	const u8 *a = &g_V9AnimTable[anim * 3];
	u8 frame = (g_V9Tick / V9_ANIM_SPEED) % a[1];
	return g_V9Cells[a[0] + frame];
}

/** Restituisce il byte info (palette) di un'animazione */
u8 v9AnimInfo(u8 anim)
{
	return V9_SPAT_INFO_PALETTE(g_V9AnimTable[anim * 3 + 2] & 3);
}

/** Ridisegna uno sprite nemico con il frame corretto */
void v9DrawEnemy(u8 id)
{
	u8 anim = V9_ANIM_ENEMY + g_V9Kind[id] * 2 + g_V9Left[id];
	// -1 come per il giocatore: la V9990 visualizza lo sprite una riga sotto la Y indicata
	v9WriteSprite(id, g_V9Y[id] - 1 + V9_OFFSET_Y, v9AnimCell(anim), g_V9X[id], v9AnimInfo(anim));
}

/** Imposta una voce della palette (RGB 5 bit) */
void v9SetColor(u8 index, const u8 *rgb)
{
	V9_SetPaletteEntry(index, rgb);
}

/** Inizializza la V9990. Restituisce FALSE se la scheda non e' presente */
bool v9Init()
{
	if (!V9_Detect())
	{
		// Senza scheda il gioco non puo' girare: messaggio sullo schermo TMS e stop
		Print_SetPosition(8, 11);
		Print_DrawText("GFX9000 REQUIRED");
		VDP_EnableDisplay(TRUE);
		while (1) {}
	}

	V9_SetScreenMode(V9_MODE_P1);
	V9_SetDisplayEnable(FALSE);
	V9_SetInterrupt(V9_INT_NONE);
	V9_SetBackgroundColor(0);
	V9_SelectPaletteP1(0, V9_PAL_BG);

	// Palette: 0-15 tile, 16-47 sprite, 48-63 fondale
	for (u8 i = 0; i < 64; i++)
		v9SetColor(i, &g_V9Palette[i * 3]);

	// Pattern del layer A (tile) e degli sprite, copiati dai segmenti dati
	V9_SetWriteAddress(V9_P1_PGT_A);
	v9Blit(11, g_V9Tiles, V9_TILES_SIZE);
	V9_SetWriteAddress(V9_SGT_ADDR);
	v9Blit(12, g_V9Sprites, V9_SPRITES_SIZE);
	V9_SetSpritePatternAddr(V9_P1_SGT_08000);

	// Layer B: fondale (muro di pietre dietro al livello)
	V9_FillVRAM16(V9_P1_PNT_B, 0, 64 * 64);
	V9_SetWriteAddress(V9_P1_PGT_B);
	v9Blit(11, g_V9BgTiles, V9_BGTILES_SIZE);
	for (u8 r = 0; r < 24; r++)
	{
		V9_SetWriteAddress(V9_P1_PNT_B + (u32)r * 128);
		v9Blit(11, g_V9BgMap + (u16)r * 64, 64);
	}
	V9_FillVRAM16(V9_P1_PNT_A, 0, 64 * 64);

	// Centra verticalmente l'area di gioco
	V9_SetScrollingY(512 - V9_OFFSET_Y);
	V9_SetScrollingX(0);
	V9_SetScrollingBY(512 - V9_OFFSET_Y);
	V9_SetScrollingBX(0);

	// Tutti gli sprite disabilitati
	for (u8 i = 0; i < 125; i++)
		v9HideSprite(i);
	for (u8 i = 0; i < V9_MAX_SPRITE; i++)
	{
		g_V9Kind[i] = V9_NO_KIND;
		g_V9Left[i] = 0;
	}

	// La RAM non viene azzerata all'avvio: senza questa riga la direzione del
	// giocatore e' casuale e, finche' non si muove, lo sprite usa un'animazione
	// (e una palette) sbagliata
	g_V9PlayerLeft = 0;
	g_V9Tick = 0;

	V9_SetSpriteEnable(TRUE);
	return TRUE;
}

/** Copia una riga della name table TMS sulla V9990 */
void v9SyncRow(u8 row)
{
	VDP_ReadVRAM_16K(g_ScreenLayoutLow + (u16)row * 32, g_V9Row, 32);
	V9_SetWriteAddress(V9_P1_PNT_A + (u32)row * 128);
	for (u8 i = 0; i < 32; i++)
		V9_Poke16_CurrentAddr(g_V9Row[i]);
}

/** Rampa dei mattoni in base al colore TMS del livello */
void v9SetLevelColor(u8 color)
{
	u8 r;
	switch (color >> 4)
	{
	case 0x5: r = 1; break; // blu
	case 0x6: r = 2; break; // marrone
	default:  r = 0; break; // grigio
	}
	const u8 *ramp = &g_V9BrickRamps[r * 9];
	for (u8 i = 0; i < 3; i++)
		v9SetColor(V9_PAL_BRICK + i, ramp + i * 3);
}

/** Ruota tre voci consecutive della palette */
void v9CyclePalette(u8 first, u8 step)
{
	for (u8 i = 0; i < 3; i++)
		v9SetColor(first + i, &g_V9Palette[(first + ((i + step) % 3)) * 3]);
}

/** Aggiornamento per frame: palette animate e animazioni dei nemici */
void v9Tick(u8 frame)
{
	g_V9Tick = frame;

	if ((frame & 7) == 0)
	{
		u8 step = (frame >> 3) % 3;
		v9CyclePalette(V9_PAL_WATER, step);
		v9CyclePalette(V9_PAL_LAVA, 2 - step);
	}

	if ((frame % V9_ANIM_SPEED) == 0)
	{
		for (u8 id = 0; id < V9_MAX_SPRITE; id++)
			if (g_V9Kind[id] != V9_NO_KIND)
				v9DrawEnemy(id);
	}
}

/** Colora tutto lo sprite del giocatore con un unico colore (l'indice 0 resta trasparente) */
void v9PlayerFlash(const u8 *rgb)
{
	for (u8 i = 1; i < 16; i++)
		v9SetColor(V9_PAL_PLAYER + i, rgb);
}

/** Ripristina i colori originali del giocatore */
void v9PlayerRestore()
{
	for (u8 i = 1; i < 16; i++)
		v9SetColor(V9_PAL_PLAYER + i, &g_V9Palette[(V9_PAL_PLAYER + i) * 3]);
}

/**
 * Un passo dell'animazione della morte (da chiamare una volta per frame).
 *  1) il giocatore resta fermo e lampeggia bianco/rosso;
 *  2) fa un balzo verso l'alto e cade fuori dallo schermo girando su se stesso.
 * Restituisce 0 quando l'animazione e' terminata (sprite nascosto, palette ripristinata).
 */
u8 v9DeathStep(u8 step, u8 x, u8 y)
{
	u8 anim;

	if (step == 0)
	{
		g_V9DeathX = x;
		g_V9DeathY = (i16)y * 4;
		g_V9DeathVY = V9_DEATH_JUMP;
	}

	if (step < V9_DEATH_FLASH)
	{
		if ((step & 3) == 0)
			v9PlayerFlash((step & 4) ? g_V9DeathWhite : g_V9DeathRed);
		anim = V9_ANIM_PLAYER + g_V9PlayerLeft; // Fermo nella posa "idle"
	}
	else
	{
		if (step == V9_DEATH_FLASH)
			v9PlayerRestore();

		g_V9DeathY += g_V9DeathVY;
		if (g_V9DeathVY < V9_DEATH_VMAX)
			g_V9DeathVY++;

		// Posa di salto in salita, di caduta in discesa; cambia verso ogni 4 frame
		anim = V9_ANIM_PLAYER + ((g_V9DeathVY < 0) ? V9_ANIM_JUMP : V9_ANIM_FALL) + ((step >> 2) & 1);
	}

	i16 sy = (g_V9DeathY >> 2) - 1 + V9_OFFSET_Y;
	if ((sy >= 212) || (step >= V9_DEATH_MAX))
	{
		v9HideSprite(0);
		v9PlayerRestore();
		return 0;
	}

	v9WriteSprite(0, (u8)sy, v9AnimCell(anim), g_V9DeathX, v9AnimInfo(anim));
	return 1;
}

/** Dispatcher chiamato da v9Call() */
u8 v9Dispatch(u8 op, u8 a, u8 b, u8 c)
{
	switch (op)
	{
	case V9OP_INIT:
		return v9Init();

	case V9OP_CELL:
		V9_Poke16(V9_P1_PNT_A + (((u16)b * 64 + a) * 2), c);
		break;

	case V9OP_SYNC_ROW:
		v9SyncRow(a);
		break;

	case V9OP_BEGIN_DRAW:
		VDP_HideAllSprites();
		VDP_EnableDisplay(FALSE);
		V9_SetDisplayEnable(FALSE);
		for (u8 i = 0; i < V9_MAX_SPRITE; i++)
		{
			v9HideSprite(i);
			g_V9Kind[i] = V9_NO_KIND;
		}
		break;

	case V9OP_END_DRAW:
		for (u8 r = 0; r < 24; r++)
			v9SyncRow(r);
		VDP_EnableDisplay(TRUE);
		V9_SetDisplayEnable(TRUE);
		break;

	case V9OP_LEVEL_COLOR:
		v9SetLevelColor(a);
		break;

	case V9OP_SPR_SHOW:
		// a = id sprite, b = ADDRESS_xxx del nemico (192, 196, ...)
		if (a < V9_MAX_SPRITE)
		{
			g_V9Kind[a] = ((b - 192) >> 2) & 7;
			g_V9Left[a] = 0;
			v9HideSprite(a); // Visibile al primo posizionamento
		}
		break;

	case V9OP_SPR_POS:
		if ((a < V9_MAX_SPRITE) && (g_V9Kind[a] != V9_NO_KIND))
		{
			if (b < g_V9X[a])
				g_V9Left[a] = 1;
			else if (b > g_V9X[a])
				g_V9Left[a] = 0;
			g_V9X[a] = b;
			g_V9Y[a] = c;
			v9DrawEnemy(a);
		}
		break;

	case V9OP_SPR_HIDE:
		if (a < V9_MAX_SPRITE)
			g_V9Kind[a] = V9_NO_KIND;
		v9HideSprite(a);
		break;

	case V9OP_PLAYER:
	{
		// a = X, b = Y, c = indice frame TMS (AnimFrame / 16)
		u8 m = g_V9PlayerMap[c & 7];
		if (m & 0x80)
			g_V9PlayerLeft = 1;
		else if (m & 0x40)
			g_V9PlayerLeft = 0;
		u8 anim = V9_ANIM_PLAYER + (m & 0x3F) + g_V9PlayerLeft;
		v9WriteSprite(0, b - 1 + V9_OFFSET_Y, v9AnimCell(anim), a, v9AnimInfo(anim));
		break;
	}

	case V9OP_TICK:
		v9Tick(a);
		break;

	case V9OP_DEATH:
		return v9DeathStep(a, b, c);
	}
	return 0;
}
