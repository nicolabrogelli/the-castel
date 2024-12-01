//=============================================================================
// SEGMENT: 23
// BANK: 1
// DESCRIPTION: Generico
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "vdp.h"
#include "enemy.h"
#include "tiles_defs.h"

void adjustXYEnemy(struct CharacterEnemy *genericEnemy, u8 idFirstSprite, u8 nEnemy);

#define EMPTY_ITEM 0

extern bool g_RefreshInventary;
extern u8 g_TimetoDeath;
extern u8 g_GameFrame;

extern u8 getTile(u8 x, u8 y);
extern void setTile(u8 x, u8 y, u8 tile);
extern void ItemsTakenForLevel(u8 x, u8 y, u8 tile, u8 visibility);
extern bool physicsCollisionEnemy(u8 x, u8 y);
//extern void adjustXYEnemy(struct CharacterEnemy *genericEnemy, u8 idFirstSprite, u8 nEnemy);


//=============================================================================
// FUNCTIONS
//=============================================================================


/**
 * @brief Imposta i colori delle tiles
 * @param void
 * @return void
 */
void setColorTiles()
{
	VDP_FillVRAM_16K(0X80, g_ScreenColorLow + 8, 2); // VERDE 0XC0 - ROSSO CHIARO 0x60
	VDP_FillVRAM_16K(0x70, g_ScreenColorLow + 10, 1);
	VDP_FillVRAM_16K(0xA0, g_ScreenColorLow + 12, 1); // GIALLO SCURO
	VDP_FillVRAM_16K(0xE0, g_ScreenColorLow + 18, 2); // GRIGIO
}

//---------------------------------------------------------------------------------------------

/**
 * @brief Verifica che il player sia posizionato sulla piattaforma
 */
bool isOnPlatform(u8 *X, u8 *Y, u8 slideCount, struct CharacterEnemy *platform)
{
	for (u8 i = 0; i < slideCount; i++)
	{
		if ((*X < platform[i].X - 10) || (*X > platform[i].X + 10))
		{
			// TODO: Non facio nulla
		}
		else
		{
			if ((*Y + 17 > platform[i].Y) && (*Y + 17 < platform[i].Y + 8))
			{
				*Y = platform[i].Y - 16;
				return TRUE;
			}
		}
	}
	return FALSE;
}

/**
 * @brief Aggiorna la posizione di un generico nemico
 * @param struct CharacterEnemy *genericEnemy Puntatore all'array dei nemici
 * @param u8 enemyNumber Numero dei nemici nel livello
 * @param u8 idFirstSprite Primo sprite
 * @return void
 */
void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite)
{

	for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
		if (enemy->State == 1)
		{
			if (physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
			{
				enemy->Direction *= -1;
			}
			else
			{
				// TODO: Línseguimento e'dedicato solo agli scheletri
				// if (my_strcmp(genericEnemy[nEnemy].TypeEnemy, "Scheletor") == 0)
				//	pursuitCheck(&genericEnemy[0], nEnemy);
			}

			adjustXYEnemy(&genericEnemy[nEnemy], idFirstSprite, nEnemy);
		}

		enemy = null;
	}
}

/**
 *
 */
void adjustXYEnemy(struct CharacterEnemy *genericEnemy, u8 idFirstSprite, u8 nEnemy)
{
	if (genericEnemy->Direction < 0)
	{
		if (genericEnemy->MoveHV == 0)
			genericEnemy->X--;
		else
			genericEnemy->Y--;
	}
	else
	{
		if (genericEnemy->MoveHV == 0)
			genericEnemy->X++;
		else
			genericEnemy->Y++;
	}

	// Funzione: VDP_SetSpritePosition
	// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   index - Indice dello sprite nella tabella degli attributi.
	//   x     - Coordinata X iniziale dello schermo.
	//   y     - Coordinata Y iniziale dello schermo.
	VDP_SetSpritePosition(idFirstSprite + nEnemy, genericEnemy->X, genericEnemy->Y);
}

/**
 * @brief Assegna le coordinate e la direzione al nemico
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @param CharacterEnemy *genericEnemy Puntatore all'array dei nemici
 * @param u8 enemyCount Contatore dei nemici per titpo
 * @param char *type Puntatore alla descrizione del nemico
 *
 */
void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV)
{
	struct CharacterEnemy *generic = &genericEnemy[enemyCount];
	generic->X = x * 8;
	generic->Y = (y - 1) * 8;
	generic->Direction = (g_GameFrame % 2) ? 1 : -1;
	generic->TypeEnemy = type;
	generic->SpriteId = baseSprite + enemyCount;
	generic->State = 1;
	generic->MoveHV = moveHV;
}


//---------------------------------------------------------------------------------------------

/**
 * @brief Routine per raccogliere le monete
 * @param u8 x Coordinata X
 * @param u8 y Coordinata Y
 * @return TRUE se è stata raccolta una moneta
 */
bool getItem(u8 x, u8 y)
{
	switch (getTile(x, y))
	{
	case TILE_MONEY:
	case TILE_GOLD_CUP:
		setTile(x, y, EMPTY_ITEM);
		ItemsTakenForLevel(x, y, TILE_MASK_MONEY, 1); // Per il momento non posso spostare questa funzione, in quanto dovrei duplicare la chiamata the tile

		return TRUE;
	case TILE_TIME_UP:
		setTile(x, y, EMPTY_ITEM);
		if (g_TimetoDeath < 60)
		{
			u8 offset = 60 - g_TimetoDeath;
			if (offset > 10)
			{
				g_TimetoDeath += 10;
			}
			else
			{
				u8 res = 10 - offset;
				g_TimetoDeath += res;
			}
		}
		// TODO: Aggiungere 10s al tempo totale, ma non superare i 59s
		return TRUE;
	}

	return FALSE;
}

//---------------------------------------------------------------------------------------------


/**
 * @brief Setta lo sprite e lo posiziona
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @param u8 baseSprite Indice base nella tabella degli sprite
 * @param u6 enemyCount Numero dei nemici
 * @param u8 indexShape indice della figura
 */
void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape)
{
	// Funzione: VDP_SetSpriteSM1
	// Impostare l'attributo sprite per la modalità Sprite 1. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   index - Indice dello sprite nella tabella degli attributi
	//   x     - Coordinata iniziale X dello schermo
	//   y     - Coordinata iniziale Y dello schermo
	//   shape - Indice del modello di sprite (in modalità 16x16, è possibile utilizzare solo multipli di 4)
	//   color - Colore dello sprite (LSB 4 bit) + flag EC opzionale (VDP_SPRITE_EC)
	VDP_SetSpriteSM1(baseSprite + enemyCount, x, y, indexShape, COLOR_WHITE);
}


/**
 * @brief Nasconde gli sprites
 * @param u8 count
 * @param u8 maxElement numero massimo di sprite
 * @param u8 baseSprite Indice base nella tabella degli sprite
 */
void hideSprite(u8 count, u8 maxElement, u8 baseSprite)
{
	for (u8 i = count; i < maxElement; ++i)
	{
		VDP_HideSprite(baseSprite + i);
	}
}

//---------------------------------------------------------------------------------------------

/**
 * @brief Stampa un messaggio a video
 * @param char* message Messaggio da stampare
 * @return void
 */
//void messageInGame(char *message)
//{
//	c8 StrFormat[20];
//	String_Format(StrFormat, "%s", message);
//	Print_SetPosition(12, 22);
//	Print_DrawText(StrFormat);
//
//	g_RefreshInventary = TRUE;
//}

//---------------------------------------------------------------------------------------------

/**
 * @brief Effettua la verifica sulla collisione
 * @param i8 dx Coordinata X
 * @param i8 dy Coordinara Y
 * @return void
 */
bool collisionCheck(i8 dx, i8 dy)
{
	u16 sqrtDist = (dx * dx) + (dy * dy);
	if (sqrtDist < 13 * 13)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	}
}
