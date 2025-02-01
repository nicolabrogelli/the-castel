// ____________________________
// ██▀▀█▀▀██▀▀▀▀▀▀▀█▀▀█        │   ▄▄▄                ▄▄
// ██  ▀  █▄  ▀██▄ ▀ ▄█ ▄▀▀ █  │  ▀█▄  ▄▀██ ▄█▄█ ██▀▄ ██  ▄███
// █  █ █  ▀▀  ▄█  █  █ ▀▄█ █▄ │  ▄▄█▀ ▀▄██ ██ █ ██▀  ▀█▄ ▀█▄▄
// ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀────────┘                 ▀▀
//  Game module sample
//
// ─────────────────────────────────────────────────────────────────────────────

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "game.h"
#include "game_pawn.h"
#include "string.h"
#include "input.h"
#include "compress/pletter.h"
#include "version.h"
#include "tiles.h"
#include "tiles_defs.h"
#include "level_defs.h"
#include "enemy.h"
#include "debug.h"

//=============================================================================
// SEGMENT 23, BANK 1
//=============================================================================
extern bool isOnPlatform(u8 *X, u8 *Y, u8 slideCount, struct CharacterEnemy *platform);
extern bool getItem(u8 x, u8 y);
extern void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite);
extern void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 nEnemy);
extern void setColorTiles();
extern void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape);
extern void hideSprite(u8 count, u8 maxElement, u8 baseSprite);
extern void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV);
extern bool collisionCheck(i8 dx, i8 dy);
//extern void messageInGame(char *message);



//=============================================================================
// SEGMENT 16, BANK 1
//=============================================================================
extern void inizializePT3();
extern void inizializeAYFX();
extern void PlayBankSFX(u8 id, u8 prio);
extern void ChannelSFX(u8 chan);
extern void restorePT3Music();
extern void pausePT3Music();
extern void stopMusicPlayback();
extern void setChannel();

//=============================================================================
// SEGMENT 17, BANK 1
//=============================================================================
extern void initInventory();
extern bool addItemToInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
extern bool removeItemFromInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
extern void displayItemToInventory(u8 levelX, u8 levelY, u8 levelHeight);
extern bool hasItemInInventory(u8 item);


//=============================================================================
// SEGMENT 18, BANK 1
//=============================================================================
extern void initLife();
extern bool removeLife();
extern void displayLife();
extern bool addLife();
extern bool hasLives();


//=============================================================================
// SEGMENT 19, BANK 1
//=============================================================================
extern bool isMoveRight(u8 row8, u8 input);
extern bool isMoveLeft(u8 row8, u8 input);
extern bool isMoveJump(u8 row8, u8 input);
extern bool isInteractObject(u8 row8, u8 input);


//=============================================================================
// SEGMENT 20, BANK 1
//=============================================================================
extern char g_DataBackground_Patterns[];
extern char g_DataSprtLayer[];

//=============================================================================
// SEGMENT 21, BANK 1
//=============================================================================
extern const unsigned char g_Level001[223];
extern const unsigned char g_Level002[224];
extern const unsigned char g_Level003[236];
extern const unsigned char g_Level004[229];
extern const unsigned char g_Level005[192];
extern const unsigned char g_Level006[162];
extern const unsigned char g_Level007[204];
extern const unsigned char g_Level008[179];
extern const unsigned char g_Level009[206];
extern const unsigned char g_Level010[192];
extern const unsigned char g_Level011[205];
extern const unsigned char g_Level012[190];
extern const unsigned char g_Level013[191];
extern const unsigned char g_Level014[218];
extern const unsigned char g_Level015[216];
extern const unsigned char g_Level016[213];
extern const unsigned char g_Level018[220];
extern const unsigned char g_Level019[150];
extern const unsigned char g_Level020[173];
extern const unsigned char g_Level021[195];
extern const unsigned char g_Level022[205];
extern const unsigned char g_Level023[175];
extern const unsigned char g_Level024[127];
extern const unsigned char g_Level025[166];
extern const unsigned char g_Level026[214];
extern const unsigned char g_Level027[183];
extern const unsigned char g_Level028[47];
extern const unsigned char g_Level029[105];
extern const unsigned char g_Level030[177];



enum INPUT_ACTION
{
	INPUT_RIGHT = 0b00000001,
	INPUT_LEFT = 0b00000010,
	INPUT_JUMP = 0b00000100,
	INPUT_GET = 0b00001000,
};

// Gameplay character stricture
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
};


unsigned char g_LevelUncompress[768];
unsigned char g_TempLevel[300];

//=============================================================================
// INCLUDES PERSONALIZZATI
//=============================================================================
#include "the-castel.h"

//.............................................................................
// Player 1 data

// Livelli dello Sprite del giocatore
// Questo personaggio è composto da 3 livelli (3 sprite), ma i primi due sono speciali: Uno è visibile solo nei fotogrammi pari, mentre il secondo solo nei fotogrammi dispari.
// Quindi, dei tre livelli, solo due sono visibili in un determinato fotogramma. Il lampeggiamento dei primi due livelli neri viene effettuato per creare colori sfumati.
// La controparte è l'effetto sfarfallio. Il colore bianco del carattere proviene dallo sfondo e non è presente in uno sprite.

const Game_Sprite g_PlayerSpriteLayers[] =
	{
		//	Sprite ID
		//    |   Offset X
		//    |   |  Offset Y
		//    |   |  |  Pattern offset from current animation key
		//    |   |  |  |   Colore del Layer
		//    |   |  |  |   |                Layer option
		/* 		{0, 0, 0, 0, COLOR_BLACK, PAWN_SPRITE_EVEN},
				{0, 0, 0, 12, COLOR_BLACK, PAWN_SPRITE_ODD}, */
		{0, 0, 0, 4, COLOR_WHITE, 0},
		{4, 0, 0, 8, COLOR_DARK_RED, 0},
};

// Animazione Idle
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_PlayerFramesIdle[] =
	{
		//	  Pattern offset of this animation key in the sprite data
		//    |     	Durata dell' animazione
		//    |     	|   Evento da attivare durante questa animazione tasto (puntatore di funzione)
		{IDLE_PLAYER_FRAME_4, 64, NULL},
		{IDLE_PLAYER_FRAME_2, 24, NULL},
};

// Animazione Move
// Ogni riga descrive una parte dell'animazione

const Game_Frame g_PlayerFramesMove[] =
	{
		{MOVE_PLAYER_FRAME_3, 10, NULL},
};

const Game_Frame g_PlayerFramesMoveRight[] =
	{
		{MOVE_PLAYER_FRAME_7, 10, NULL},

};

// Animazione Jump
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_PlayerFramesJump[] =
	{
		{JUMP_PLAYER_FRAME_5, 4, NULL},
};

// Animazione Fall
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_PlayerFramesFall[] =
	{
		{FALL_PLAYER_FRAME_6, 4, NULL},
};

// Actions id
enum ANIM_ACTION_ID
{
	ACTION_IDLE = 0,
	ACTION_MOVE,
	ACTION_JUMP,
	ACTION_FALL,
	ACTION_MOVE_RIGHT
};

// Lista delle possibii azioni del Pawn
const Game_Action g_PlayerAnimActions[] =
	{
		//  Frames        Number                  Loop?  Interrupt?
		{g_PlayerFramesIdle, numberof(g_PlayerFramesIdle), TRUE, TRUE},
		{g_PlayerFramesMove, numberof(g_PlayerFramesMove), TRUE, TRUE},
		{g_PlayerFramesJump, numberof(g_PlayerFramesJump), TRUE, TRUE},
		{g_PlayerFramesFall, numberof(g_PlayerFramesFall), TRUE, TRUE},
		{g_PlayerFramesMoveRight, numberof(g_PlayerFramesMoveRight), TRUE, TRUE},
};

//=============================================================================
// MEMORY DATA
//=============================================================================

struct Character g_Player;
struct CharacterEnemy g_Enemy[MAX_ENEMY];
struct CharacterEnemy g_Ghost[MAX_GHOST];
struct CharacterEnemy g_Spider[MAX_SPIDER];
struct CharacterEnemy g_Bat[MAX_BAT];
struct CharacterEnemy g_platformV[MAX_SLIDING_PLATFORM];
struct CharacterEnemy g_platformH[MAX_SLIDING_PLATFORM];

u8 g_PrevRow8 = 0xFF;
u8 g_PawnCount = 0;
// u8 g_PrevDirection = 0;
u8 g_ReverseCount = 0;
u8 g_CurrRoomIdx = 0;
u8 g_GhostCount = 0;
u8 g_SpiderCount = 0;
u8 g_BatCount = 0;
u8 g_SlideCountH = 0;
u8 g_SlideCountV = 0;
u8 g_ImmunityCount = 0;
u8 g_SecondCounter = 0;
u8 g_DangerCounter = 0;
u8 g_Frame = 0;
u8 g_DelayRemoveLife = 0;
bool IsUnderWater = FALSE;
// bool g_IsDanger = FALSE;

/*
 u8 g_CatchEnemy = 0;
 u8 g_DelayCatchEnemy = 0;
 bool isCatch = FALSE;
*/

bool g_RefreshInventary = FALSE;
u8 g_TimetoDeath = TIME_TO_DEATH;
u8 g_LevelPrev = 0; // 0 = livello successivo da porta , 1 = livello precedente da porta, 2 = licello scucceivo da scensore, 3 = livello precedente da ascensore

u8 g_GameFrame = 0;
u8 g_PreviousSegment = 0;

unsigned char g_Lives[MAX_LIVES] = {0, 0, 0};

/**
 * \struct
 * struttura: rappresenata il livello cache
 */
struct CacheLevel
{
	u8 X;		/** Coordinata Y della stanza */
	u8 Y;		/** Coordinata Y della stanza */
	u8 Width;	/** Larghezza della stanza*/
	u8 Height;	/** Altezza della stanza */
	u8 *Layout; /** Layout della stanza */
};

/**
 * \struct
 * struttura: Contenitore del livello cahce
 */
struct CacheLevel g_CacheLevel[] = {
	{0, 0, 32, 24, g_LevelUncompress},
};



/**
 * @brief Switch dei segmenti nel banco 1
 *
 * @param u8 segment, imposta il numero del segmento da assegnare. Se il valore è0, viene ripristinato il segmento precedente
 */
void SetActiveSegment(u8 segment) {
	if(segment == 0) {
		SET_BANK_SEGMENT(1,g_PreviousSegment);
	} else {
		g_PreviousSegment = GET_BANK_SEGMENT(1);
		SET_BANK_SEGMENT(1,segment);
	}
}



/**
 * @brief Si effettua la lettura della tastiera
 * @param void
 * @return void
 */
void readInputControl()
{
	u8 row8 = Keyboard_Read(8);

	g_Player.Input = 0;

	SetActiveSegment(19);
	if (isMoveRight(row8, g_Player.Input))
	{
		g_Player.Input |= INPUT_RIGHT;
	}
	if (isMoveLeft(row8, g_Player.Input))
	{
		g_Player.Input |= INPUT_LEFT;
	}
	if (isMoveJump(row8, g_Player.Input))
	{
		g_Player.Input |= INPUT_JUMP;
	}
	if (isInteractObject(row8, g_Player.Input))
	{
		g_Player.Input |= INPUT_GET;
	}
	SetActiveSegment(0);

	g_PrevRow8 = row8;
}

//
//=============================================================================
// FUNZIONI DI LIBRERIA PER LA GESTIONE DELLA FISICA
//=============================================================================

/**
 * @brief Gestione degli eventi fisici
 * @param u8 event Evento da gestire
 * @param u8 title Tile sulla quale si deve gestire l'evento
 * @return void
 */
void physicsEventPlayer(u8 event, u8 tile)
{
	tile;
	switch (event)
	{
	case PAWN_PHYSICS_BORDER_DOWN: // Handle downward collisions
	case PAWN_PHYSICS_COL_DOWN:
		g_Player.bInAir = FALSE;
		break;

	case PAWN_PHYSICS_FALL: // Handle falling
		if (!g_Player.bInAir)
		{
			g_Player.bInAir = TRUE;
			g_Player.VelocityY = 0;
		}
		break;
	};
}

/**
 * @brief Si intercetta la collisione
 * @param u8 tile Tile sulla quale verificare se si deve gestire una collisione
 * @return bool TRUE se si verifica la collisione
 */
bool physicsCollision(u8 tile)
{
	return (tile > 115 && tile < 184); // 100
}

/**
 * @brief Si intercetta la collisione di un nemico con una tiles
 * @param u8 x asse X
 * @param u8 y asse y
 * @return TRUE se si verifica la collisione
 */
bool physicsCollisionEnemy(u8 x, u8 y)
{
	return ((getTile(x, y) >= 100) /*|| getTile(x, y) == 0 */);
}

/**
 * @brief Gestisce una probabile collisione tra il Player e un generico nemico
 * @param struct Character *ply Puntatore al player
 * @param struct CharacterEnemy *genericEnemy Puntatore all'array dei nemici
 * @param u8 enemyNumber Numero dei nemici nel livello
 * @return void
 */
void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber)
{
	// if (g_ReverseCount > 0)
	//	g_ReverseCount--;
	// else
	//{
	Game_Pawn *pawn = &ply->Pawn;

	for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
		if (enemy->State == 1)
		{	
			SetActiveSegment(23);
			bool isCollison = collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY);
			SetActiveSegment(0);
			if (isCollison)
			{
				SetActiveSegment(17);
				bool hasAmphora = hasItemInInventory(TILE_AMPHORA);
				SetActiveSegment(0);

				if (hasAmphora)
				{
					if (g_ImmunityCount < IMMUNITY)
					{
						g_ImmunityCount++;
					}
					else
					{
						SetActiveSegment(17);
						removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
						SetActiveSegment(0);
						g_ImmunityCount = 0;
					}
				}
				else
				{
					SetActiveSegment(17);
					bool hasCrucifix = hasItemInInventory(TILE_CRUCIFIX);
					SetActiveSegment(0);
					if (hasCrucifix)
					{
						// TODO: elimina il nemico
						SetActiveSegment(23);
						VDP_HideSprite(enemy->SpriteId);
						SetActiveSegment(0);
						enemy->State = 0;
						SetActiveSegment(17);
						removeItemFromInventory(TILE_CRUCIFIX, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
						SetActiveSegment(0);

						g_Player.Score += 500;
						updateScore();
					}
					else
					{
						// g_ReverseCount = 60;
						SetActiveSegment(18);
						bool isRemove = removeLife();
						SetActiveSegment(0);
						if (isRemove == TRUE)
						{
							g_Player.Life--;

							SetActiveSegment(18);
							displayLife();
							SetActiveSegment(0);

							SetActiveSegment(16);
							PlayBankSFX(9, 0);
							SetActiveSegment(0);

							// TODO: Messo per verificare l'effettivo funzionamento della gestione delle vite 2024.04.18
							drawLevel(g_CurrRoomIdx);
						}
						else
						{
							SetActiveSegment(18);
							bool hl = hasLives();
							SetActiveSegment(0);
							if (!hl)
							{
								SetActiveSegment(16);
								stopMusicPlayback();
								SetActiveSegment(0);
								Game_SetState(State_GameOver);
							}
						}
					}
				}
			}
		}
	}
	//}
}


/**
 * @brief Controlla che il player non sia sommerso dall'acqua
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return TRUE se è sotto l'acqua
 */
bool isUnderTheWater(u8 x, u8 y)
{
	return (getTile(x, y) == TILE_WATER);
}


void ItemsTakenForLevel(u8 x, u8 y, u8 tile, u8 visibility);
u8 g_CountItem = 0;

/**
 * @brief aggiunge un oggetto all'array degli oggetti presi.
 * C'è da capire su che base incrementare il contatore degli oggetti.
 *
 * @param u8 x Coordinata X
 * @param U8 y Coordinara y
 * @param u8 tile Tile da scrivere
 * @param u8 visibile Criterio di visualizzazione.
 * @return void
 */
void ItemsTakenForLevel(u8 x, u8 y, u8 tile, u8 visible)
{
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].x = x;
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].y = y;
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].tile = tile;
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].visible = visible;
}

/**
 * @brief Interagisce in una determinata posizione
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return bool TRUE se si compie una azione
 */
bool interact(u8 x, u8 y)
{
	u8 tile = getTile(x, y);
	if (tile < 60)
		return FALSE;
	// DEBUG_LOGNUM("Intercat", tile);

	// TODO: Ottimizzare il case!!
	switch (tile)
	{
	case TILE_HEART:
		SetActiveSegment(18);
		bool life = addLife();
		SetActiveSegment(0);

		if (life)
		{
			g_Player.Life++;
			ItemsTakenForLevel(x, y, TILE_MASK_HEART, 1);
			g_CountItem++;

			setTile(x, y, EMPTY_ITEM);

			SetActiveSegment(16);
			PlayBankSFX(10, 0);
			SetActiveSegment(0);

		}
		return TRUE;
	case TILE_DOOR0:
	case TILE_MASK_DOOR1:
	case TILE_MASK_DOOR2:
	case TILE_MASK_DOOR3:
		g_LevelPrev = 0;
		drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
		return TRUE;
	case TILE_DOOR1:
		SetActiveSegment(17);
		bool hasKey1 = hasItemInInventory(TILE_KEY1);
		SetActiveSegment(0);
		if (hasKey1)
		{
			changeLevel(x, y, TILE_KEY1, TILE_MASK_DOOR1);
		}
		else
		{
			//SetActiveSegment(23);
			messageInGame("is colosed");
			//SetActiveSegment(0);
		}

		return TRUE;
	case TILE_DOOR2:
		SetActiveSegment(17);
		bool hasKey2 = hasItemInInventory(TILE_KEY2);
		SetActiveSegment(0);
		if (hasKey2)
		{
			changeLevel(x, y, TILE_KEY2, TILE_MASK_DOOR2);
		}
		else
		{
			//SetActiveSegment(23);
			messageInGame("is colosed");
			//SetActiveSegment(0);
		}

		return TRUE;
	case TILE_DOOR3:
		if (g_CurrRoomIdx == 1)
		{
			SetActiveSegment(17);
			bool hasKey1 = hasItemInInventory(TILE_KEY1);
			SetActiveSegment(0);
			if (hasKey1)
			{
				SetActiveSegment(16);
				stopMusicPlayback();
				SetActiveSegment(0);
				Game_SetState(State_GameOver);
			}
			else
			{
				//SetActiveSegment(23);
				messageInGame("is colosed");
				//SetActiveSegment(0);
			}
		}
		else
		{
			SetActiveSegment(17);
			bool hasKey3 = hasItemInInventory(TILE_KEY3);
			SetActiveSegment(0);
			if (hasKey3)
			{
				changeLevel(x, y, TILE_KEY3, TILE_MASK_DOOR3);
			}
			else
			{
			//SetActiveSegment(23);
			messageInGame("is colosed");
			//SetActiveSegment(0);
			}
		}
		return TRUE;
	case TILE_DOOR_PREV:
		g_LevelPrev = 1;
		drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.PrevDoorLevel);
		return false;
	case TILE_DOOR_NEXT:
		g_LevelPrev = 0;
		drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
		return false;

	case TILE_KEY1:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY1);

		SetActiveSegment(16);
		PlayBankSFX(5, 0);
		SetActiveSegment(0);


		return TRUE;
	case TILE_KEY2:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY2);

		SetActiveSegment(16);
		PlayBankSFX(5, 0);
		SetActiveSegment(0);

		return TRUE;
	case TILE_KEY3:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY3);

		SetActiveSegment(16);
		PlayBankSFX(5, 0);
		SetActiveSegment(0);


		return TRUE;
	case TILE_AMPHORA:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		takeActionWithCheck(x, y, tile, TILE_AMPHORA, TILE_MASK_AMPHORA);

		return TRUE;
	case TILE_CRUCIFIX:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		takeActionWithCheck(x, y, tile, TILE_CRUCIFIX, TILE_EMPTY);

		return TRUE;
	}

	updateScore();

	return FALSE;
}

void takeActionWithCheck(u8 x, u8 y, u8 tile, u8 checkTile, u8 newTile)
{
	SetActiveSegment(17);
	bool ckTile = hasItemInInventory(checkTile);
	SetActiveSegment(0);
	if (!ckTile)
	{
		replaceAndRemoveItem(x, y, tile, newTile);

		SetActiveSegment(16);
		PlayBankSFX(5, 0);
		SetActiveSegment(0);
	}
}

/**
 * @brief Stampa un messaggio a video
 * @param char* message Messaggio da stampare
 * @return void
 */
void messageInGame(char *message)
{
	c8 StrFormat[20];
	String_Format(StrFormat, "%s", message);
	Print_SetPosition(12, 22);
	Print_DrawText(StrFormat);

	g_RefreshInventary = TRUE;
}

/**
 * @brief rimuove la tile, sostituendola con una maschera e mette l'oggetto corrspondente nell'inventario.
 * 		  Questa funzione anche se ridondante mi permette di risparmiare qulache bit :)
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @param u8 tile Tile da inserire nell'inventario
 * @param u8 tileMask Maschera per sostituire la tile
 * @return void
 */
void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask)
{
	ItemsTakenForLevel(x, y, tileMask, 1);
	g_CountItem++;

	setTile(x, y, EMPTY_ITEM);

	SetActiveSegment(17);
	addItemToInventory(tile, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	SetActiveSegment(0);

}

/**
 * @brief Effettua il cambio di livello
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @param u8 key Tile della chiave
 * @param u8 door Tile della porta
 * @return void
 */
void changeLevel(u8 x, u8 y, u8 key, u8 door)
{
	SetActiveSegment(17);
	removeItemFromInventory(key, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	SetActiveSegment(0);
	ItemsTakenForLevel(x, y, door, 1);
	g_CountItem++;

	g_LevelPrev = 0;
	drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
}


/**
 * @brief Routine per verificare se è oresente un varco per il passaggio di livello
 * @param u8 x Coordinata X
 * @param u8 y Coordinata Y
 * @return TRUE se è presente
 */
bool isPassage(u8 x, u8 y)
{
	switch (getTile(x, y))
	{
	case TILE_UP_DOOR:
		g_LevelPrev = 3;
		drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.UpDoorLevel);
		return TRUE;

	case TILE_DOWN_DOOR:
		g_LevelPrev = 3;
		drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.DownDoorLevel);
		return TRUE;
	}
	return FALSE;
}

/**
 * @brief Verifica se siamo in una posizione di pericolo
 * @param u8 x Coordinata X
 * @param u8 y Coordinata Y
 * @param u8 t Durata immunita
 * @return TRUE se siamo in pericolo
 */
bool isDanger(u8 x, u8 y)
{
	switch (getTile(x, y))
	{
	case TILE_SKULL:
	case TILE_BONE:
	case TILE_DANGER1:
	case TILE_DANGER2:
	case TILE_DANGER3:
	case TILE_DANGER4:
	case TILE_LAVA:
		SetActiveSegment(18);
		bool isRemove = removeLife();
		SetActiveSegment(0);
		if (isRemove == TRUE)
		{
			g_Player.Life--;

			SetActiveSegment(18);
			displayLife();
			SetActiveSegment(0);

			SetActiveSegment(16);
			PlayBankSFX(9, 0);
			SetActiveSegment(0);

			drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
		}
		else
		{
			SetActiveSegment(16);
			stopMusicPlayback();
			SetActiveSegment(0);
			Game_SetState(State_GameOver);
		}
		return TRUE;
	default:
		return FALSE;
	}
}

/**
 * @brief Aggiorna il punteggio
 * @param void
 * @return void
 */
void updateScore()
{
	if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	{

		c8 StrFormat[5];

		// Stampa il livello di gioco
		Print_SetPosition(0, 0);
		Print_DrawText(g_Levels[g_CurrRoomIdx].Name);

		// Stampa il punteggio
		Print_SetPosition(7, 0);
		Print_DrawText("SCORE:");
		String_Format(StrFormat, "%04i", g_Player.Score);
		Print_SetPosition(13, 0);
		Print_DrawText(StrFormat);

		// Stampa il punteggio
		Print_SetPosition(18, 0);
		Print_DrawText("LIFE:");

		Print_SetPosition(28, 0);
		Print_DrawText("T:");
		String_Format(StrFormat, "%02i", g_TimetoDeath);
		Print_SetPosition(30, 0);
		Print_DrawText(StrFormat);
	}
}

/**
 * @brief Effettua una copia temporanea dell'array del livello. Questa funzione non servira piu dopo l'elimiazione di Pletter
 * @param unsigned char* g_TempLevel Array copia
 * @param int g_CurrRoomIdx Numero della stanza
 * @param int size Dimensione della stanza
 */
void updateLevel(unsigned char* g_TempLevel, int g_CurrRoomIdx, int size) {
    SetActiveSegment(21);

    unsigned char* source = NULL;

    switch (g_CurrRoomIdx) {
        case 0:  source = g_Level030; break;
        case 1:  source = g_Level001; break;
        case 2:  source = g_Level002; break;
        case 3:  source = g_Level003; break;
        case 4:  source = g_Level004; break;
        case 5:  source = g_Level006; break;
        case 6:  source = g_Level007; break;
        case 7:  source = g_Level005; break;
        case 8:  source = g_Level008; break;
        case 9:  source = g_Level009; break;
        case 10: source = g_Level010; break;
        case 11: source = g_Level011; break;
        case 12: source = g_Level012; break;
        case 13: source = g_Level013; break;
        case 14: source = g_Level014; break;
        case 15: source = g_Level015; break;
        case 16: source = g_Level016; break;
        case 17: source = g_Level027; break;
        case 18: source = g_Level025; break;
        case 19: source = g_Level026; break;
        case 20: source = g_Level018; break;
        case 21: source = g_Level019; break;
        case 22: source = g_Level020; break;
        case 23: source = g_Level021; break;
        case 24: source = g_Level022; break;
        case 25: source = g_Level023; break;
        case 26: source = g_Level029; break;
        default: source = NULL; break;
    }

    if (source != NULL) {
        for (int i = 0; i < size; i++) {
            g_TempLevel[i] = source[i];
        }
    }

    SetActiveSegment(0);
}

/**
 * @brief Si disegna il livello di gioco
 * @param u8 levelIdx Indice del livello da visualizzare
 * @return void
 */
void drawLevel(u8 levelIdx)
{
	//levelIdx =1;

	SetActiveSegment(16);
	if (levelIdx > 0)
	{
		pausePT3Music();
	}
	else
	{
		restorePT3Music();
	}
	SetActiveSegment(0);

	VDP_HideAllSprites();
	// pausePT3Music();
	VDP_EnableDisplay(FALSE);

	VDP_FillVRAM_16K(g_Levels[levelIdx].ColorLevel, g_ScreenColorLow + 18, 2);

	g_CurrRoomIdx = levelIdx;
	g_PawnCount = 0;
	g_GhostCount = 0;
	g_SpiderCount = 0;
	g_BatCount = 0;
	g_SecondCounter = 0;
	g_DangerCounter = 0;
	g_CountItem = 0; // Iniziaizza il cobtatore degli oggetti raccolti
	g_SlideCountH = 0;
	g_SlideCountV = 0;
	g_TimetoDeath = TIME_TO_DEATH;

	/*
		DEBUG_LOGNUM("----- Livello", g_CurrRoomIdx);
		DEBUG_LOGNUM("----- CONFIGURATO Skeletor Number", g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);
		DEBUG_LOGNUM("----- CONFIGURATO Ghost Number", g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);
		DEBUG_LOGNUM("----- CONFIGURATO Spider Number", g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);
		DEBUG_LOGNUM("----- CONFIGURATO Bat Number", g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);
		DEBUG_LOGNUM("----- CONFIGURATO Slide Number H", g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH);
		DEBUG_LOGNUM("----- CONFIGURATO Slide Number V", g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV);
	*/

	// Ad ogni cambio di livello rimuove l'amphora dall'inventario, in modo da ridurlo ad un aiuto momntaneo
	SetActiveSegment(17);
	bool hasAmphora = hasItemInInventory(TILE_AMPHORA);

	if (hasAmphora) {

		removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);

	}
	SetActiveSegment(0);

	for (u8 i = 0; i < MAX_CACHE_OBJECT; i++)
	{
		if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
			g_CountItem++;
	}

	// Riempire l'area VRAM con un valore dato [MSX1/2/2+/TR]
	//
	// Parametri:
	//   value	- Valore del Byte da copiare nella VRAM
	//   dest	- Indirizzo di destinazione della VRAM  (indirizzo a 14 bit per 16 KB di VRAM)
	//   count	- Numero di Byte da copiare nella VRAN
	//
	// Nota:
	//   Puliza dello schermo
	VDP_FillVRAM_16K(0, g_ScreenLayoutLow, 32 * 24);

	updateLevel(g_TempLevel, g_CurrRoomIdx, 300);

	// Scompatta il livello di gioco da mostrare sullo schermo nella cache
	// Altrimenti non sarebbe possibile mnipolare gli oggetti del livello
	//Pletter_UnpackToRAM(g_Levels[levelIdx].Layout, g_CacheLevel[0].Layout);
	
	
	Pletter_UnpackToRAM(g_TempLevel, g_CacheLevel[0].Layout);

	//DEBUG_LOG("PRIMA DEL DISEGNO DEL LIVELLO");
	
	// Disegnare il livello riga per riga
	for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	{		
		// Funzione: VDP_WriteVRAM_16K
		// Scrivere dati dalla RAM alla VRAM. [MSX1/2/2+/TR]
		//
		// Parametri:
		//   src   - Indirizzo dei dati sorgente nella RAM
		//   dest  - Indirizzo di destianzione nella VRAM (indirizzo a 14 bit per 16KB VRAM)
		//   count - Numero di byte da copiare nella VRAM. Nota: Un valore 0 significa 65536
		//
		// Nota:
		//    Ad ogni iterazione copia una riga del livello di gioco per, per chiarezza riporto i vari parametri utilizzati dalla funzione
		//	  perchè g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga scarta la parte già copiata in precedentza e lascia tutto
		//    il resto del livello.
		//
		//    src   - g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga
		//    dest  - g_ScreenLayoutLow + (32 * (riga + g_Levels[levelIdx].Y)) + (g_Levels[levelIdx].X)
		//    count - g_Levels[levelIdx].Width il numero di byte da copiare
		//
		// Attenzione alla prima iterazione viene preso tutto il layout , ma visto che la massima lunghezza della copia è espressa da g_Levels[levelIdx].Width
		// viene copiata solamente la proma riga. Nelle iterazioni successive, il valore di riga incrementa e di conseguenza viene scartata la porzione del layout
		// precedente (di dimesnione g_Levels[levelIdx].Width), e quindi viene copiata la parte che ci interessa. Tutto questo fino a che non si è completata
		// la copia.
		VDP_WriteVRAM_16K(g_CacheLevel[0].Layout + g_CacheLevel[0].Width * riga,
						  g_ScreenLayoutLow + (32 * (riga + g_CacheLevel[0].Y)) + (g_CacheLevel[0].X), g_CacheLevel[0].Width);

		for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
		{
			// Recupera la tile nella poszione indicata
			u8 tile = g_CacheLevel[0].Layout[g_CacheLevel[0].Width * riga + colonna];

			// if (tile == TILE_START_POS) // Rilevamento della posizione iniziale del giocatore
			if (((tile == TILE_START_POS) && (g_LevelPrev == 0)) || ((tile == TILE_BACK_POS_PLYER) && (g_LevelPrev == 1)) || ((tile == TILE_BACK_POS_PLY_PLATFOTM) && (g_LevelPrev == 3))) // Rilevamento della posizione iniziale del giocatore
			{
				u8 x = g_CacheLevel[0].X + colonna;
				u8 y = g_CacheLevel[0].Y + riga;

				// Funzione: GamePawn_SetPosition
				// Imposta la posizione del pedone. Forza il movimento anche se è attivata la collisione.
				//
				// Parametri:
				//   pawn - Indirizzo della struttura del pedone da inizializzare.
				//   x - Nuova coordinata X in pixel.
				//   y - Nuova coordinata Y in pixel.
				GamePawn_SetPosition(&g_Player.Pawn, x * 8, (y - 3) * 8);
				setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
			}
			else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber)) // Rilevamento della posizione iniziale del nemico
			{
				g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Enemy[0], ADDRESS_SHELETOR, FIRST_ID_SKELETOR, riga, colonna, 0, "Scheletor", 0);
			}
			else if ((tile == TILE_POS_GHOST) && (g_GhostCount < g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber)) // Rilevamento della posizione iniziale del nemico
			{
				g_GhostCount = positionGenericEnemy(TILE_POS_GHOST, g_GhostCount, &g_Ghost[0], ADDRESS_GHOST, FIRST_ID_GHOST, riga, colonna, 0, "Ghost", 0);
			}
			else if ((tile == TILE_POS_SPIDER) && (g_SpiderCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber)) // Rilevamento della posizione iniziale del nemico
			{
				g_SpiderCount = positionGenericEnemy(TILE_POS_SPIDER, g_SpiderCount, &g_Spider[0], ADDRESS_SPIDER, FIRST_ID_SPIDER, riga, colonna, 0, "Spider", 0);
			}
			else if ((tile == TILE_POS_BAT) && (g_BatCount < g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber)) // Rilevamento della posizione iniziale del nemico
			{
				g_BatCount = positionGenericEnemy(TILE_POS_BAT, g_BatCount, &g_Bat[0], ADDRESS_BAT, FIRST_ID_BAT, riga, colonna, 0, "Bat", 0);
			}
			else if ((tile == TILE_POS_PLATFORM_O) && (g_SlideCountH < g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH)) // Rilevamento piattaforma mobile
			{
				g_SlideCountH = positionGenericEnemy(TILE_POS_PLATFORM_O, g_SlideCountH, &g_platformH[0], ADDRESS_PLATFORM, FIRST_ID_SLIDE_H, riga, colonna, 0, "platform H", 0);
			}
			else if ((tile == TILE_POS_PLATFORM_V) && (g_SlideCountV < g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV)) // Rilevamento piattaforma mobile
			{
				g_SlideCountV = positionGenericEnemy(TILE_POS_PLATFORM_V, g_SlideCountV, &g_platformV[0], ADDRESS_PLATFORM, FIRST_ID_SLIDE_V, riga, colonna, 0, "platform V", 1);
			}
		}
	}

	SetActiveSegment(23);
	hideSprite(g_PawnCount, MAX_ENEMY, FIRST_ID_SKELETOR);
	hideSprite(g_GhostCount, MAX_GHOST, FIRST_ID_GHOST);
	hideSprite(g_SpiderCount, MAX_SPIDER, FIRST_ID_SPIDER);
	hideSprite(g_BatCount, MAX_BAT, FIRST_ID_BAT);
	hideSprite(g_SlideCountH, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_H);
	hideSprite(g_SlideCountV, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_V);
	SetActiveSegment(0);

	if (levelIdx == 0)
	{
		// TODO: non visualizzo i dati del risultato della partita
	}
	else
	{
		updateScore();

		if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
		{
			SetActiveSegment(17);
			displayItemToInventory(g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
			SetActiveSegment(0);

			SetActiveSegment(18);
			displayLife();
			SetActiveSegment(0);
		}
	}

	// Terminato il disegno del livello elimino gli oggetti già recuperati
	for (u8 i = 0; i < 10; i++)
	{
		if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
		{
			setTile(g_Levels[g_CurrRoomIdx].MyItems[i].x, g_Levels[g_CurrRoomIdx].MyItems[i].y, g_Levels[g_CurrRoomIdx].MyItems[i].tile);
		}
	}

	// TODO: Brutto!!! sto ciclando nuovamente il livello per non rendere visible la tile
	//		 di poszionamento del Player non utilzzata!!!!!!
	for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	{
		for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
		{
			// Recupera la tile nella poszione indicata
			u8 tile = g_CacheLevel[0].Layout[g_CacheLevel[0].Width * riga + colonna];

			// if (tile == TILE_START_POS) // Rilevamento della posizione iniziale del giocatore
			if ((tile == TILE_START_POS) || (tile == TILE_BACK_POS_PLYER) || (tile == TILE_BACK_POS_PLY_PLATFOTM)) // Rilevamento della posizione iniziale del giocatore
			{
				u8 x = g_CacheLevel[0].X + colonna;
				u8 y = g_CacheLevel[0].Y + riga;
				setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
			}
		}
	}

	VDP_EnableDisplay(TRUE);

	// restorePT3Music();
}

/**
 * @brief Posiziona nel livello di gioco un nemico generico
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
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 moveHV)
{
	if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_GENERIC_ENEMY)
	{
		if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_GENERIC_ENEMY)
		{
			// TODO: Posiziona lo sprite della Slied Platform nell'livello di gioco
			// 		 Per aggiungerla ad un livello è necessario inserire la tile 128
			//		 e le tile 100 per dare il range di escursione

			u8 x = g_Levels[levelIdx].X + colonna;
			u8 y = g_Levels[levelIdx].Y + riga;

			SetActiveSegment(23);
			managementSprite(x, y, baseSprite, enemyCount, idxSprite);
			spritePosition(x, y, &enemy[0], baseSprite, enemyCount, Name, moveHV);
			SetActiveSegment(0);

			

			setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
			enemyCount++;
		}
	}

	return enemyCount;
}


/**
 * @brief Inizializza il pawn
 * @param struct Character *ply
 * @param u8 id Numero del Player
 * @return void
 */
void initCharacter(struct Character *ply, u8 id)
{
	Mem_Set(0, ply, sizeof(struct Character));

	Game_Pawn *pawn = &ply->Pawn;

	if (id == 0)
	{
		GamePawn_Initialize(pawn, g_PlayerSpriteLayers, numberof(g_PlayerSpriteLayers), 0, g_PlayerAnimActions);
		GamePawn_SetPosition(pawn, 223, 128);
		GamePawn_InitializePhysics(pawn, physicsEventPlayer, physicsCollision, 16, 16);
	}
}


/**
 * @brief Aggiorna il pawn
 * @param struct Character *ply
 * @return void
 */
void updateCharacter(struct Character *ply)
{
	// Update movement
	u8 dir = 0;
	ply->DX = 0;
	ply->DY = 0;

	// Print_DrawIntAt(20, 18, ply->Input);
	if (ply->Input & INPUT_RIGHT)
	{
		ply->DX++;
		ply->bMoving = TRUE;
		dir = 1;
	}
	else if (ply->Input & INPUT_LEFT)
	{
		ply->DX--;
		ply->bMoving = TRUE;
		dir = 0;
	}
	else
		ply->bMoving = FALSE;

	if (ply->bInAir) // Jump/fall
	{
		ply->DY -= ply->VelocityY / 4;
		ply->VelocityY -= GRAVITY;

		if (ply->VelocityY < -FORCE)
			ply->VelocityY = -FORCE;
	}
	else if (ply->Input & INPUT_JUMP)
	{
		ply->bInAir = TRUE;
		ply->VelocityY = FORCE;
	}
	else if (ply->Input & INPUT_GET)
	{
		if (interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12))
		{
			// TODO: non faccio nulla!
		}
	}

	// Update player animation & physics
	u8 act = ACTION_IDLE;
	if (ply->bInAir && (ply->VelocityY >= 0))
	{
		act = ACTION_JUMP;
	}
	else if (ply->bInAir)
	{
		SetActiveSegment(23);
		if (((g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH) || (g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV)) > 0 && (isOnPlatform(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY, g_SlideCountV, &g_platformV[0]) || isOnPlatform(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY, g_SlideCountH, &g_platformH[0])))
		{
			act = ACTION_IDLE;
			ply->DY += 2;
		}
		else
		{
			act = ACTION_FALL;
		}
		SetActiveSegment(0);
	}
	else if (ply->bMoving)
	{
		if (dir == 1)
		{
			act = ACTION_MOVE_RIGHT;
		}
		else if (dir == 0)
			act = ACTION_MOVE;
	}

	Game_Pawn *pawn = &ply->Pawn;
	GamePawn_SetAction(pawn, act);
	GamePawn_SetMovement(pawn, ply->DX, ply->DY);
	GamePawn_Update(pawn);
}


int my_strcmp(const c8 *a, const c8 *b)
{
	while (*a && *a == *b)
	{
		++a;
		++b;
	}
	return (int)(unsigned char)(*a) - (int)(unsigned char)(*b);
}


/**
 * @brief Raggruppo una serie di fuznioni
 * @param void
 * @return void
 */
void genericControl()
{

	// Verifica se in player è sommerso dall'acqua
	if (isUnderTheWater(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY))
	{
		if (IsUnderWater)
		{
			if ((g_SecondCounter - g_DelayRemoveLife) > 3)
			{
				SetActiveSegment(18);
				bool isRemove = removeLife();
				SetActiveSegment(0);
				if (isRemove == TRUE)
				{
					g_Player.Life--;

					SetActiveSegment(18);
					displayLife();
					SetActiveSegment(0);

					SetActiveSegment(16);
					PlayBankSFX(9, 0);
					SetActiveSegment(0);

					IsUnderWater = FALSE;
				}
				else
				{
					SetActiveSegment(16);
					stopMusicPlayback();
					SetActiveSegment(0);
					Game_SetState(State_GameOver);
				}
			}
		}
		else
		{
			g_DelayRemoveLife = g_SecondCounter;
			IsUnderWater = TRUE;
		}
	}
	else
	{
		/* 		VDP_SetColor(COLOR_BLACK); */
		IsUnderWater = FALSE;  // Non siamo più in collisione
		g_DelayRemoveLife = 0; // Azzera il tempo dopo il quale si va a rimuovere una vita
	}

	// Valuta se è presente una manota ed eventualmente la raccoglie
	// TODO: Da ottimizzare
	// Attenzione l'aggiunta dell'iterazione crea dei rallentamenti al gioco
	// 1) La prima parte si utilizza per inteagire com gli elementi che is trovano una tile sopra il piano di gioco
	// 2) La seconda parte si utilizza nteagire com gli elementi che is trovano sul piano di gioco

	SetActiveSegment(23);
	bool isElement = getItem(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) || 	getItem(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4);
	SetActiveSegment(0);
	if (isElement)
	{
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		g_CountItem++;
		g_Player.Score += 100;
		updateScore();

		SetActiveSegment(16);
		PlayBankSFX(11, 15);
		SetActiveSegment(0);


		// messageInGame("Get Money!");
	}

	// Controllo se il player è in una situazione di pericola
	if (isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
		isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	{
		// TODO: non faccio nulla!
	}

	// Verifica se è presente un varco per passare a un livello successivo
	if (isPassage(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
		isPassage(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	{
		// TODO: non faccio nulla!
	}
}

/**
 * @brief Inizializza lo stato del gioco
 * @param void
 * @return bool è sempre FALSE
 */
bool State_Initialize()
{
	// Funzione: inizializePT3
	// Inizializzazione del Player PT3 e della tabella delle note
	SetActiveSegment(16);
	inizializePT3();


	// Funzione: inizializeAYFX
	// Impostazione del riproduttore ayfx e del canale audio
	inizializeAYFX();


	setChannel();
	SetActiveSegment(0);

	// Funzione: VDP_EnableDisplay
	// Abilita/disabilita la visualizzazione dello schermo (registro 1). [MSX1/2/2+/TR]
	//
	// Parametri:
	//   enable - bool TRUE abilita, FALSE  disabilita
	VDP_EnableDisplay(FALSE);

	// Funzionr: VDP_SetColor
	// Impostare il colore predefinito del testo e dei bordi (registro 7). [MSX1/2/2+/TR]
	//
	// Parametri:
	//   color - Colore di Defaut (Formato: [TXT:4|BG:4])
	VDP_SetColor(COLOR_BLACK); //

	VDP_ClearVRAM();

	// Funzione: VDP_WriteVRAM_16K
	// Scrivere dati dalla RAM alla VRAM. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   src   - Indirizzo dei dati sorgente nella RAM
	//   dest  - Indirizzo di destianzione nella VRAM (indirizzo a 14 bit per 16KB VRAM)
	//   count - Numero di byte da copiare nella VRAM. Nota: Un valore 0 significa 65536
	//
	// Nota:
	//    Effettua la copia dei tiles contenuti in g_DataBackground (definiti nel file bg_tileset.h) nella VRAM a partire dall'indirizzo 0x0000
	//SetActiveSegment(20);
	VDP_LoadPattern_GM1_Pletter(g_DataBackground_Patterns, 0);
	//SetActiveSegment(0);

	// Inizializza i caratteri personalizzati
	Print_SetMode(PRINT_MODE_TEXT);
	//SetActiveSegment(20);
	Print_SetFontEx(8, 8, 1, 1, ' ', '_', g_DataBackground_Patterns + 192);
	//SetActiveSegment(0);
	Print_Initialize();
	g_PrintData.PatternOffset = 192;

	// Initialize color
	SetActiveSegment(23);
	setColorTiles();
	SetActiveSegment(0);

	// Funzione: VDP_SetSpriteFlag
	// Impostare i parametri di rendering degli sprite. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   flag - Flag Srptie da impostare. Può essere una combinazione di:
	//          VDP_SPRITE_SIZE_8 (Use 8x8 sprite size)
	//          VDP_SPRITE_SIZE_16 (Use 16x16 sprite size)
	//          VDP_SPRITE_SCALE_1 (Normal size of the sprite; 1 dot = 1 px)
	//          VDP_SPRITE_SCALE_2 (Double the size of the sprite; 1 dot = 2 px)
	//
	// NOTE:
	//	Dimensione dello sprite 16x16
	VDP_SetSpriteFlag(VDP_SPRITE_SIZE_16);

	// Funzione: VDP_WriteVRAM_16K
	// Scrivere dati dalla RAM alla VRAM. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   src   - Indirizzo dei dati sorgente nella RAM
	//   dest  - Indirizzo di destianzione nella VRAM (indirizzo a 14 bit per 16KB VRAM)
	//   count - Numero di byte da copiare nella VRAM. Nota: Un valore 0 significa 65536
	//
	// Nota:
	//    Ad ogni iterazione copia una riga del livello di gioco per, per chiarezza riporto i vari parametri utilizzati dalla funzione
	//	  perchè g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga scarta la parte già copiata in precedentza e lascia tutto
	//    il resto del livello.
	//
	//    src   - g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga
	//    dest  - g_ScreenLayoutLow + (32 * (riga + g_Levels[levelIdx].Y)) + (g_Levels[levelIdx].X)
	//    count - g_Levels[levelIdx].Width il numero di byte da copiare
	//
	//SetActiveSegment(20);
	Pletter_UnpackToVRAM(g_DataSprtLayer, g_SpritePatternLow);
	//SetActiveSegment(0);

	Game_SetState(State_Preset);

	return FALSE; // Frame finished
}

/**
 * @brief Aggirona lo stato del giocatore e dei nemici
 * @param void
 * @return void
 */
bool State_Game()
{
	WaitVBlank();


	// Funzione: GamePawn_Draw
	// Aggiorna il rendering del pedone. Deve essere richiamato una volta per fotogramma.
	//
	// Parametri:
	//   pawn - Indirizzo della struttura Pawn del pedone da aggiornare (spostamento, collisione, ecc.).
	GamePawn_Draw(&g_Player.Pawn);

	// Funzione: UpdateCharacter(&g_Player);
	// Aggiorna il rendering del pedone. Deve essere richiamato una volta per fotogramma.
	//
	// Parametri:
	//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare

	updateCharacter(&g_Player);

	// Funzione geericControl()
	// Eseguo qui i seguenti controlli, per evitare di rendere meno leggibile il codice
	// a) Verifico se il Giocatore si trova sotto l'acqu
	// b) Se ci sono delle monete che il giocatore può raccogliere lo fa
	genericControl();

	// Funzione: ReadInputControl
	// Aggiurnamento input da tastiera
	readInputControl();

	// TODO: Aggiornamento della posizione dei nemici, da migliorare!!! g_FrameCounter
	if (g_Frame == 50)
	{
		g_SecondCounter++;
		// g_CatchEnemy++;
		g_Frame = 0;

		// TODO: Serve per aggiorare il tempo rimanente per terminare il livello senza perdere una vita
		if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
		{
			g_TimetoDeath--;

			c8 StrFormat[20];
			Print_SetPosition(28, 0);
			Print_DrawText("T:");
			String_Format(StrFormat, "%02i", g_TimetoDeath);
			Print_SetPosition(30, 0);
			Print_DrawText(StrFormat);

			if (g_TimetoDeath == 0)
			{
				SetActiveSegment(18);
				bool isRemove = removeLife();
				SetActiveSegment(0);
				if (isRemove == TRUE)
				{
					g_Player.Life--;

					SetActiveSegment(18);
					displayLife();
					SetActiveSegment(0);

					SetActiveSegment(16);
					PlayBankSFX(9, 0);
					SetActiveSegment(0);

					drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
				}
				else
				{
					SetActiveSegment(16);
					stopMusicPlayback();
					SetActiveSegment(0);
					Game_SetState(State_GameOver);
				}
			}

			// TODO: FUnziona ma l'aggiornamento non è constante. Vedere se possiamo migliorare
			if (g_RefreshInventary)
			{
				u8 riga = 22;
				VDP_ReplacementPartialArea(riga);
				SetActiveSegment(17);
				displayItemToInventory(g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
				SetActiveSegment(0);
				g_RefreshInventary = FALSE;
			}
		}
	}

	if (g_GameFrame % 2 == 0)
	{
		g_DangerCounter++;

		// Funzione: updateSkeleton
		// Aggiorna il rendering dei nemici.
		SetActiveSegment(23);
		updateGenericEnemy(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber, FIRST_ID_SKELETOR);
		SetActiveSegment(0);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndEnemy
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		SetActiveSegment(23);
		updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber, FIRST_ID_GHOST);
		SetActiveSegment(0);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		SetActiveSegment(23);
		updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber, FIRST_ID_SPIDER);
		SetActiveSegment(0);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		SetActiveSegment(23);
		updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber, FIRST_ID_BAT);
		SetActiveSegment(0);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);

		// Funzione: updateGenericEnemy
		// Aggiorna il rendering della piattaforma.
		SetActiveSegment(23);
		updateGenericEnemy(&g_platformH[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH, FIRST_ID_SLIDE_H);
		updateGenericEnemy(&g_platformV[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV, FIRST_ID_SLIDE_V);
		SetActiveSegment(0);
	}

	return TRUE;
}

/**
 * @brief Effettua il presete del gioco
 * @param void
 * @return void
 */
bool State_Preset()
{

	restoreLevel();

	// Funzione: InitCharacter
	// Inizzializza lo sprite del giocatore
	//
	// Parametri:
	//  Character - indirizzo della truruttura che rappresenta il giocatore
	//  id del giorcatore
	initCharacter(&g_Player, 0);

	// Funzione: initInventory
	// Inizializza l'inventario
	SetActiveSegment(17);
	initInventory();
	SetActiveSegment(0);

	// Funzione: initLife
	// Inizializza le vite del giocatore
	g_Player.Life = MAX_LIVES;

	SetActiveSegment(18);
	initLife();
	SetActiveSegment(0);

	// Funzione: DrawLevel
	// Inizzializza il livello di gioco
	//
	// Parametri:
	//  u8 levelIdx - rappresenta l'id del livello
	// VDP_EnableDisplay(FALSE);
	drawLevel(0);

	Game_SetState(State_Game);

	return TRUE;
}

/**
 * @brief Stato di pausa del gioco
 * @param void
 * @return bool è sempre TRUE
 */
bool State_Pause()
{
	return TRUE;
}

/**
 * @brief Stato di fine partita del gioco
 * @param void
 * @return bool Sempre a TRUE
 */
bool State_GameOver()
{

	drawLevel(GAME_OVER); // -1

	// Attende la pressione di un tasto
	while (Keyboard_Read(8) != 254)
	{
	}

	Game_SetState(State_Preset);

	return TRUE;
}

/**
 * @brief Ripristina la riga dello schermo specificata
 * @param u8 riga Numero di riga
 * @return void
 */
void VDP_ReplacementPartialArea(u8 riga)
{
	// Funzione: VDP_WriteVRAM_16K
	// Scrivere dati dalla RAM alla VRAM. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   src   - Indirizzo dei dati sorgente nella RAM
	//   dest  - Indirizzo di destianzione nella VRAM (indirizzo a 14 bit per 16KB VRAM)
	//   count - Numero di byte da copiare nella VRAM. Nota: Un valore 0 significa 65536
	//
	// Nota:
	//    Ad ogni iterazione copia una riga del livello di gioco per, per chiarezza riporto i vari parametri utilizzati dalla funzione
	//	  perchè g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga scarta la parte già copiata in precedentza e lascia tutto
	//    il resto del livello.
	//
	//    src   - g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga
	//    dest  - g_ScreenLayoutLow + (32 * (riga + g_Levels[levelIdx].Y)) + (g_Levels[levelIdx].X)
	//    count - g_Levels[levelIdx].Width il numero di byte da copiare
	//
	// Attenzione alla prima iterazione viene preso tutto il layout , ma visto che la massima lunghezza della copia è espressa da g_Levels[levelIdx].Width
	// viene copiata solamente la proma riga. Nelle iterazioni successive, il valore di riga incrementa e di conseguenza viene scartata la porzione del layout
	// precedente (di dimesnione g_Levels[levelIdx].Width), e quindi viene copiata la parte che ci interessa. Tutto questo fino a che non si è completata
	// la copia.
	VDP_WriteVRAM_16K(g_CacheLevel[0].Layout + g_CacheLevel[0].Width * riga,
					  g_ScreenLayoutLow + (32 * (riga + g_CacheLevel[0].Y)) + (g_CacheLevel[0].X), g_CacheLevel[0].Width);
}

//=============================================================================
// PLETTER
//=============================================================================
void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset)
{
	Pletter_UnpackToVRAM(src, g_ScreenPatternLow + (offset * 8));
}

//=============================================================================
// MAIN LOOP
//=============================================================================
bool g_VBlank = FALSE;	// Vertical-synchronization flag
u8 g_6thFrameCount = 0; // Frame counter

void VSyncCallback()
{
	g_VBlank = TRUE;

	g_6thFrameCount++;
	if (g_6thFrameCount == 6)
		g_6thFrameCount = 0;

	if (g_6thFrameCount)
	{
		PT3_Decode();	 // Update data to write to the PSG regiters from the music
		ayFX_Update();	 // Overwrite PSG registers data for the SFX
		PT3_UpdatePSG(); // Update PSG registers
	}
}

//-----------------------------------------------------------------------------
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

void main()
{
	DEBUG_INIT();
	DEBUG_LOG("Start debug session!");

	VDP_EnableVBlank(TRUE);
	Bios_SetHookCallback(H_TIMI, VSyncCallback /*VDP_InterruptHandler*/);

	// Funzione: Game_SetState
	// Impostare lo stato successivo (la modifica sarà effettiva al prossimo aggiornamento dello stato)
	//
	// Parametri:
	//   state - Il uovo stato del gioco
	Game_SetState(State_Initialize);


	// Funzione: Game_MainLoop
	// Loop del gioco
	//
	// Parametri:
	//   screenMode - La modalità dello schermo da selezionare all'avvio del gioco. Vedere VDP_MODE
	Game_MainLoop(VDP_MODE_GRAPHIC1);

	// Funzione: Game_Release
	// Release game module
	Game_Release();

	// DEBUG_LOG("End debug session!");

	// Bios_ClearHook(H_TIMI); // Needed only if you want to allow
	Bios_Exit(0);
}