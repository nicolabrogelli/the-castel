//=============================================================================
// SEGMENT: 4
// BANK: 1
// DESCRIPTION: 
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "vdp.h"
#include "game_pawn.h"
#include "input.h"
#include "enemy.h"
#include "tiles_defs.h"
#include "character.h"
#include "level_defs.h"

//=============================================================================
// DEFINES
//=============================================================================
#define LAST_LEVEL              25  // Ultimo livello di gioco
#define START_GAME               0  // Livello di inizio gico
#define GAME_OVER               LAST_LEVEL + 1  // Livello di game over
#define GAME_WINNER             27
#define EMPTY_ITEM	0
#define TILE_EMPTY 		  	     0
#define LEVEL_WIDTH 			32


//=============================================================================
// PROTOTYPE
//=============================================================================
void drawMessageWithTimer(u8 x1, u8 y1, u8 x2, u8 y2,const char* messaggio, const char* format,	int value);   
void updateScore(u16 score);
void messageInGame(char *message);
void adjustXYEnemy(struct CharacterEnemy *genericEnemy, u8 idFirstSprite, u8 nEnemy);
void setColorTiles();
bool isOnPlatform(u8 *X, u8 *Y, u8 slideCount, struct CharacterEnemy *platform);
void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite);
void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV);
bool getItem(u8 x, u8 y);
void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape);
void hideSprite(u8 count, u8 maxElement, u8 baseSprite);
bool collisionCheck(i8 dx, i8 dy);
bool isMoveRight(u8 row8, u8 input);
bool isMoveLeft(u8 row8, u8 input);
bool isMoveJump(u8 row8, u8 input);
bool isInteractObject(u8 row8, u8 input);
void VSyncCallbackBanck();
void WaitVBlank();
void readInputControl(struct Character* player);
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, 	u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 moveHV);

//=============================================================================
// PROTOTYPE EXTERN
//=============================================================================
extern  void setTileByTileCoord(u8 x, u8 y, u8 tile);
extern u8 getTile(u8 x, u8 y);
extern void setTile(u8 x, u8 y, u8 tile);
extern void ItemsTakenForLevel(u8 x, u8 y, u8 tile, u8 visibility);
extern bool physicsCollisionEnemy(u8 x, u8 y);

//=============================================================================
// MEMORY EXTERN
//=============================================================================
extern u8 g_CurrRoomIdx;
extern u8 g_TimetoDeath;
extern bool g_RefreshInventary;
extern bool g_RefreshInventary;
extern u8 g_TimetoDeath;
extern u8 g_GameFrame;
extern u8 g_Frame;
extern u8 g_GameFrame;
extern u8 g_CountItem;

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

bool g_VBlank = FALSE;	// Vertical-synchronization flag
u8 g_6thFrameCount = 0; // Frame counter

//=============================================================================
// FUNCTIONS
//=============================================================================
/**
 * @brief Aggiorna il punteggio
 * @param void
 * @return void
 */
void updateScore(u16 score)
{
	   // Se la stanza corrente è uno degli stati non aggiornabili, esci subito.
    if (g_CurrRoomIdx == START_GAME ||
        g_CurrRoomIdx == GAME_OVER ||
        g_CurrRoomIdx == GAME_WINNER)
    {
        return;
    }

    // Visualizza il nome del livello
    drawMessageWithTimer(0, 0, 4, 0, "LVL:", "%02i", g_CurrRoomIdx);

    // Visualizza lo score del giocatore
    drawMessageWithTimer(7, 0, 13, 0, "SCORE:", "%04i", score);

    // Visualizza la vita del giocatore (senza formattazione, in quanto x2 e y2 sono entrambi 0)
    drawMessageWithTimer(18, 0, 0, 0, "LIFE:", "", 0);

    // Visualizza il timer formattato a due cifre
    drawMessageWithTimer(28, 0, 30, 0, "T:", "%02i", g_TimetoDeath);	
}

/**
 * @brief Stampa un messaggio a video
 * @param u8 x1 Coordinata x primo messaggio
 * @param u8 y1 Coordinara y primo messaggio
 * @param char* message Messaggio da stampare
 * @param u8 x2 Coordinata x secondo messaggio
 * @param u8 y2 Coordinara y secondo messaggio
 * @param int valore da stampare
 * @return void
 */
void drawMessageWithTimer(u8 x1, u8 y1, u8 x2, u8 y2,
	const char* messaggio,
	const char* format,
	int value)
{
    Print_SetPosition(x1, y1);
    Print_DrawText(messaggio);
    c8 buffer[20];  // Buffer per la formattazione
    String_Format(buffer, format, value);
    Print_SetPosition(x2, y2);
    Print_DrawText(buffer);
}

/**
 * @brief Stampa un messaggio a video
 * @param char* message Messaggio da stampare
 * @return void
 */
void messageInGame(char *message)
{
	c8 StrFormat[30];
	String_Format(StrFormat, "%s", message);
	Print_SetPosition(12, 22);
	Print_DrawText(StrFormat);

	g_RefreshInventary = TRUE;
}

//------------------------------------------------------------------------------------------------

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

//------------------------------------------------------------------------------------------------

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


void VSyncCallbackBanck()
{
	g_VBlank = TRUE;

	g_6thFrameCount++;
	if (g_6thFrameCount == 6)
		g_6thFrameCount = 0;
}


// Wait for V-Blank period
void WaitVBlank()
{
wait_loop:

	while (!g_VBlank)
	{
	} // Wait for VDP interruption
	g_VBlank = FALSE;

	// Skip the 6th frame on 60 Hz VDP
	if (!g_6thFrameCount)
		goto wait_loop; // Wait 1 more frame

	g_Frame++;
	g_GameFrame++;
}

/**
 * @brief Si effettua la lettura della tastiera (OTTIMIZZATA)
 * @param void
 * @return void
 */
void readInputControl(struct Character* player)
{
	u8 row8 = Keyboard_Read(8);

	player->Input = 0;

	if (isMoveRight(row8, player->Input))
	{
		player->Input |= INPUT_RIGHT;
	}
	if (isMoveLeft(row8, player->Input))
	{
		player->Input |= INPUT_LEFT;
	}
	if (isMoveJump(row8, player->Input))
	{
		player->Input |= INPUT_JUMP;
	}
	if (isInteractObject(row8, player->Input))
	{
		player->Input |= INPUT_GET;
	}
}


//#include "level_defs.h"
//
//#define FORCE 15
//#define GRAVITY 1
//#define MAX_SLIDING_PLATFORM     3
//#define MAX_NUMBRER_SPRITE_HIDE 25
//
//enum ANIM_ACTION_ID
//{
//	ACTION_IDLE = 0,
//	ACTION_MOVE,
//	ACTION_JUMP,
//	ACTION_FALL,
//	ACTION_MOVE_RIGHT
//};
//extern u8 g_SlideCountH;
//extern u8 g_SlideCountV;
//extern u8 b_act;
//extern struct CharacterEnemy g_platformV[MAX_SLIDING_PLATFORM];
//extern struct CharacterEnemy g_platformH[MAX_SLIDING_PLATFORM];
//
//extern bool interact(u8 x, u8 y);
////extern void checkPlatform(struct Character *ply);
//
///**
// * @brief Aggiorna il pawn (OTTIMIZZATA)
// * @param struct Character *ply
// * @return void
// */
//void updateCharacter1(struct Character *ply) 
//{
//    // Reset movement
//    ply->DX = 0;
//    ply->DY = 0;
//    u8 dir = 0;
//	b_act = ACTION_IDLE;
//    
//    // Handle horizontal movement
//    if (ply->Input & INPUT_RIGHT)
//    {
//        ply->DX++;
//        ply->bMoving = TRUE;
//        dir = 1;
//    }
//    else if (ply->Input & INPUT_LEFT)
//    {
//        ply->DX--;
//        ply->bMoving = TRUE;
//    }
//    else
//    {
//        ply->bMoving = FALSE;
//    }
//
//    // Handle vertical movement
//    if (ply->bInAir) 
//    {
// 		ply->DY -= ply->VelocityY / 4;
//		ply->VelocityY -= GRAVITY;
//		if (ply->VelocityY < -FORCE)
//			ply->VelocityY = -FORCE;		
//    }
//    else if (ply->Input & INPUT_JUMP)
//    {
//        ply->bInAir = TRUE;
//        ply->VelocityY = FORCE;
//    }
//    else if (ply->Input & INPUT_GET)
//    {
//		interact(ply->Pawn.PositionX + 8, ply->Pawn.PositionY + 12);
//    }
//
//    // Determine animation state
//    if (ply->bInAir)
//    {
//        if (ply->VelocityY >= 0)
//        {
//            b_act = ACTION_JUMP;
//        }
//        else
//        {
//			if (((g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH || g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV) > 0) && 
//			(isOnPlatform(&ply->Pawn.PositionX, &ply->Pawn.PositionY, g_SlideCountV, g_platformV) || 
//			isOnPlatform(&ply->Pawn.PositionX, &ply->Pawn.PositionY, g_SlideCountH, g_platformH)))
//			{
//				b_act = ACTION_IDLE;
//				ply->DY += 2;
//			}
//			else
//			{
//				b_act = ACTION_FALL;
//			}
//        }
//    }
//    else if (ply->bMoving)
//    {
//        b_act = (dir == 1) ? ACTION_MOVE_RIGHT : ACTION_MOVE;
//    }
//
//    // Update character
//    GamePawn_SetAction(&ply->Pawn, b_act);
//    GamePawn_SetMovement(&ply->Pawn, ply->DX, ply->DY);
//    GamePawn_Update(&ply->Pawn);
//
//}


/**
 * @brief Posiziona nel livello di gioco un nemico generico (OTTIMIZZATA)
 * @param u8 TILE_POS_GENERIC_ENEMY tile segnaposto per il posizionamento del nemico
 * @param u8 enemyCount numero del nemico da posizionare
 * @param struct CharacterEnemy *enemy nemico da posizinare
 * @param u8 idxSprite indirizzo delle sprite in memoria
 * @param u8 u8 bo non mi ricordo :)
 * @param u8 u8 riga riga del livello
 * @param u8 colonna colonna del livello
 * @param u8 levelIdx numero del livello di gioco
 * @param u8 moveHV movimento orizzontale o verticale
 */
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, 
	u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 moveHV) 
{
	u8 *layout = g_Levels[levelIdx].Layout;
	u8 width = LEVEL_WIDTH;

	if (layout[width * riga + colonna - 1] != TILE_POS_GENERIC_ENEMY &&
	layout[width * (riga - 1) + colonna] != TILE_POS_GENERIC_ENEMY) 
	{
		managementSprite(colonna, riga, baseSprite, enemyCount, idxSprite);
		spritePosition(colonna, riga, enemy, baseSprite, enemyCount, Name, moveHV);

		setTileByTileCoord(colonna, riga, TILE_EMPTY); // Rimuove la tile iniziale
		enemyCount++;
	}

	return enemyCount;
}




bool handleItemCollection(u8 x, u8 y1, u8 y2) {
    bool isElement = getItem(x, y1) || getItem(x, y2);
    if (isElement) {
        g_CountItem++;
       
		return TRUE;
    }
	
	return FALSE;
}