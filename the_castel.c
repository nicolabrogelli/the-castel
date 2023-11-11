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
#include "game_menu.h"
#include "math.h"
#include "debug.h"
#include "string.h"
#include "input.h"
#include "sprite_tool.h"
#include "version.h"

//=============================================================================
// INCLUDES PERSONALIZZATI
//=============================================================================
#include "the_castel.h"
#include "data/bg_tileset.h"

#if CAVALIERE
#include "data/sprt_player.h"
#else
#include "data/sprt_player_alt.h"
#endif

#include "data/level/level001.h"
#include "data/level/level002.h"
#include "data/level/level003.h"
#include "data/level/level004.h"
#include "data/level/level005.h"
#include "data/level/level006.h"
#include "data/level/level007.h"

//=============================================================================
// DEFINES
//=============================================================================

#define FORCE 20
#define GRAVITY 1
#define GROUND 192
#define JOY_PORT_1 0b00000011
#define JOY_PORT_2 0b01001100

//
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
	u8 Score;
	u8 Life;
	Game_Pawn Pawn;
};

struct CharacterEnemy
{
	u8 X;
	u8 Y;
	i8 VelocityY;
	u8 State;
	int Direction;
};

//=============================================================================
// PROTOTIPI DELLE FUNZIONI
//=============================================================================
bool State_Initialize();
bool State_Game();
bool State_Pause();

u8 getTile(u8 x, u8 y);
void setTile(u8 x, u8 y, u8 tile);
void setTileByTileCoord(u8 x, u8 y, u8 tile);
bool physicsCollision(u8 tile);
void setColorTiles();
bool interact(u8 x, u8 y);
void drawLevel(u8 levelIdx);
void initCharacter(struct Character *ply, u8 id);
void updateCharacter(struct Character *ply);
void updateSkeleton();
void VDP_LoadSpritePattern16_VSym(const u8 *src, u8 index, u8 count);
bool isMoveRight(u8 row8);
bool isMoveLeft(u8 row8);
bool isMoveJump(u8 row8);
bool isInteractObject(u8 row8);
bool physicsCollisionEnemy(u8 x, u8 y);
void readInputControl();
bool getMoney(u8 x, u8 y);
void updateScore();
void initInventory();
bool addItemToInventory(u8 item);
bool hasItemInInventory(u8 item);
bool removeItemFromInventory(u8 item);
void displayItemToInventory();
void reorganizeInventory();
void initLife();
bool addLife();
void displayLife();
bool removeLife();
void reorganizeLife();
void physicsCollisionPlayerAndEnemy(struct Character *ply);
void replacementItemInLevel(u8 x, u8 y, u8 tile);
void changeLevel(u8 x, u8 y, u8 key, u8 door);
void updateGhost();
void physicsCollisionPlayerAndGhost(struct Character *ply);
void updateSpider();
void physicsCollisionPlayerAndSpider(struct Character *ply);
void updateBat();
void physicsCollisionPlayerAndBat(struct Character *ply);
bool isUnderTheWater(u8 x, u8 y);
void genericControl();

void callBackVSync();

//.............................................................................
// Player 1 data

// Livelli dello Sprite del giocatore
// TQuesto personaggio è composto da 3 livelli (3 sprite), ma i primi due sono speciali: Uno è visibile solo nei fotogrammi pari, mentre il secondo solo nei fotogrammi dispari.
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
		{0, 0, 0, 0, COLOR_BLACK, PAWN_SPRITE_EVEN},
		{0, 0, 0, 12, COLOR_BLACK, PAWN_SPRITE_ODD},
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

#if CAVALIERE
// Animazione Move
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_PlayerFramesMove[] =
	{
		{MOVE_PLAYER_FRAME_0, 10, NULL},
		{MOVE_PLAYER_FRAME_1, 10, NULL},
		//{MOVE_PLAYER_FRAME_2, 4, NULL},
		//{MOVE_PLAYER_FRAME_3, 4, NULL},  RIVEDERE
};
#else
const Game_Frame g_PlayerFramesMove[] =
	{
		{MOVE_PLAYER_FRAME_0, 4, NULL},
		{MOVE_PLAYER_FRAME_1, 4, NULL},
		{MOVE_PLAYER_FRAME_2, 4, NULL},
		{MOVE_PLAYER_FRAME_3, 4, NULL},
};
#endif

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
};

// Lista delle possibii azioni del Pawn
const Game_Action g_PlayerAnimActions[] =
	{
		//  Frames        Number                  Loop?  Interrupt?
		{g_PlayerFramesIdle, numberof(g_PlayerFramesIdle), TRUE, TRUE},
		{g_PlayerFramesMove, numberof(g_PlayerFramesMove), TRUE, TRUE},
		{g_PlayerFramesJump, numberof(g_PlayerFramesJump), TRUE, TRUE},
		{g_PlayerFramesFall, numberof(g_PlayerFramesFall), TRUE, TRUE},
};

//=============================================================================
// MEMORY DATA
//=============================================================================

struct Character g_Player;
struct CharacterEnemy g_Enemy[MAX_ENEMY];
struct CharacterEnemy g_Ghost[MAX_GHOST];
struct CharacterEnemy g_Spider[MAX_SPIDER];
struct CharacterEnemy g_Bat[MAX_BAT];

u8 g_PrevRow8 = 0xFF;
u8 g_PawnCount = 0;
u8 g_PrevDirection = 0;
u8 g_FrameCounter = 0;
u8 g_ReverseCount = 0;
u8 g_CurrRoomIdx = 0;
u8 g_SladePlatformCount = 0;
u8 g_GhostCount = 0;
u8 g_SpiderCount = 0;
u8 g_BatCount = 0;
u8 g_ImmunityCount = 0;
bool g_PresentPlatform = FALSE;

unsigned char g_Inventory[MAX_ITEM_INVENTORY] = {0, 0, 0, 0, 0};
unsigned char g_Lives[MAX_LIVES] = {0, 0, 0};

/** \struct
	struct: Struttura che rappresenta la stanza
*/
struct LevelDefinition
{
	u8 X;	   /** Coordinata Y della stanza */
	u8 Y;	   /** Coordinata Y della stanza */
	u8 Width;  /** Larghezza della stanza*/
	u8 Height; /** Altezza della stanza */
	// const u8 *Layout; /** Layout della stanza */
	u8 *Layout;		   /** Layout della stanza */
	const c8 *Name;	   /** Nome della stanza */
	u8 NextLvlIdx;	   /** Livello successivo */
	u8 PrevLvIdx;	   /** Livello precedente */
	u8 SkeletonNumber; /** Numero dei nemici per livello */
	u8 GhostNumber;	   /** Numero di fantasmi per livello */
	u8 SpiderNumber;   /** Numero di ragni per lovello */
	u8 BatNumber;      /** Numero di pipistrelli per livello */
};

// Elenco delle stanze e delle loro caratteristiche
const struct LevelDefinition g_Levels[] = {
	{(32 - LEVEL001_WIDTH) / 2, (24 - LEVEL001_HEIGHT) / 2, LEVEL001_WIDTH, LEVEL001_HEIGHT, g_Level001, "Livello 1", 1, 0, 2, 0, 0, 0},
	{(32 - LEVEL002_WIDTH) / 2, (24 - LEVEL002_HEIGHT) / 2, LEVEL002_WIDTH, LEVEL002_HEIGHT, g_Level002, "Livello 2", 2, 0, 0, 1, 0, 0},
	{(32 - LEVEL003_WIDTH) / 2, (24 - LEVEL003_HEIGHT) / 2, LEVEL003_WIDTH, LEVEL003_HEIGHT, g_Level003, "Livello 3", 3, 1, 2, 0, 0, 0},
	{(32 - LEVEL004_WIDTH) / 2, (24 - LEVEL004_HEIGHT) / 2, LEVEL004_WIDTH, LEVEL004_HEIGHT, g_Level004, "Livello 4", 4, 0, 2, 0, 0, 0},
	{(32 - LEVEL005_WIDTH) / 2, (24 - LEVEL005_HEIGHT) / 2, LEVEL005_WIDTH, LEVEL005_HEIGHT, g_Level005, "Livello 5", 5, 1, 2, 0, 0, 0},
	{(32 - LEVEL006_WIDTH) / 2, (24 - LEVEL006_HEIGHT) / 2, LEVEL006_WIDTH, LEVEL006_HEIGHT, g_Level006, "Livello 6", 6, 0, 1, 1, 1, 0},
	{(32 - LEVEL007_WIDTH) / 2, (24 - LEVEL007_HEIGHT) / 2, LEVEL007_WIDTH, LEVEL007_HEIGHT, g_Level007, "Livello 7", 7, 0, 0, 0, 0, 2},
};

//=============================================================================
// FUNZIONI PER LA GESTIONE DELLE VITE
//=============================================================================

/**
 * @brief Inizializza le vite
 * @param void
 * @return void
 */
void initLife()
{
	g_Player.Life = MAX_LIVES;

	for (u8 i = 0; i < MAX_LIVES; i++)
		g_Lives[i] = TILE_HEART;
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
			setTile(220 + i * 16, (u8)(4), TILE_HEART);
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * @brief Rimuove una vita
 * @param void
 * @return bool TRUE se è stata rimossa una vita
 */
bool removeLife()
{
	if (hasItemInInventory(TILE_AMPHORA))
	{
		if (g_ImmunityCount < IMMUNITY)
		{
			g_ImmunityCount++;
		}
		else
		{
			removeItemFromInventory(TILE_AMPHORA);
		}
		return FALSE;
	}

	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		// Print_DrawIntAt(23, 18, i);
		if (g_Lives[i] == TILE_HEART)
		{
			g_Lives[i] = EMPTY_ITEM;
			setTile(220 + i * 16, (u8)(4), 0);
			g_Player.Life--;
			return TRUE;
		}
	}

	return FALSE;
}

/**
 * @brief Riorganizza le vite
 * @param none
 * @return void
 */
void reorganizeLife()
{
	unsigned char life[MAX_LIVES];

	Mem_Set(EMPTY_ITEM, life, (3 * sizeof(life[0])));

	// Crea una copia delle vite
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		if (g_Lives[i] != EMPTY_ITEM)
			life[i] = g_Lives[i];
	}

	// Svuota le vite
	Mem_Set(EMPTY_ITEM, g_Lives, (3 * sizeof(g_Lives[0])));

	// Riempie le vite
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		if (life[i] != EMPTY_ITEM)
			addLife();
	}
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
		setTile(220 + i * 16, (u8)(4), g_Lives[i]);
	}
}

//=============================================================================
// FUNZIONI PER LA GESTIONE DELL'INVENTARIO
//=============================================================================

/**
 * @brief Inizializzazione dell'inventario
 * @param void
 * @return void
 */
void initInventory()
{
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		g_Inventory[i] = EMPTY_ITEM;
	}
}

/**
 * @brief Aggiunta di un oggetto all'inventario
 * @param u8 item Oggetto da inserire nell'inventario
 * @return bool TRUE se l'oggetto è inserito nell'inventario
 */
bool addItemToInventory(u8 item)
{
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		if (g_Inventory[i] == EMPTY_ITEM)
		{
			g_Inventory[i] = item;
			setTile(8 + i * 16, (u8)(192 - 16), item);
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * @brief Verificare la presenza di un oggetto nell'inventario
 * @param u8 item Oggetto da verificare
 * @return bool TRUE se l'oggetto è nell'inventario
 */
bool hasItemInInventory(u8 item)
{
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		if (g_Inventory[i] == item)
		{
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * @brief Rimuove un oggetto dall'inventario
 * @param u8 item Oggetto da rimuovere
 * @return bool TRUE se l'oggetto è stato rimosso
 */
bool removeItemFromInventory(u8 item)
{
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		if (g_Inventory[i] == item)
		{
			g_Inventory[i] = EMPTY_ITEM;
			setTile(8 + i * 16, (u8)(192 - 16), 0);
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * @brief Visualizza tutti gli elementi dell'inventario
 * @param void
 * @return void
 */
void displayItemToInventory()
{
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		setTile(8 + i * 16, (u8)(192 - 16), g_Inventory[i]);
	}
}

/**
 * @brief Riorganizza l'inventario
 * @param void
 * @return void
 */
void reorganizeInventory()
{
	unsigned char inventory[MAX_ITEM_INVENTORY];

	Mem_Set(EMPTY_ITEM, inventory, (5 * sizeof(inventory[0])));

	// Crea una copia dell'inventario
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		if (g_Inventory[i] != EMPTY_ITEM)
			inventory[i] = g_Inventory[i];
	}

	// Svuota l'inventario
	Mem_Set(EMPTY_ITEM, g_Inventory, (5 * sizeof(g_Inventory[0])));

	// Riempie l'inventario
	for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	{
		if (inventory[i] != EMPTY_ITEM)
			addItemToInventory(inventory[i]);
	}
}

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
	u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + (y / 8) * 32 + (x / 8));
	return tile;
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
}

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
}

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
	// DEBUG_LOGNUM("PhysicsCollision", tile);
	return (tile > 100);
}

/**
 * @brief Si intercetta la collisione di un nemico
 * @param u8 x asse X
 * @param u8 y asse y
 * @return TRUE se si verifica la collisione
 */
bool physicsCollisionEnemy(u8 x, u8 y)
{
	return ((getTile(x, y) >= 100) /*|| getTile(x, y) == 0 */);
}

/**
 * @brief Gestisce una probabile collisione tra il Player e uno degli scheletri
 * @param void
 * @return void
 */
void physicsCollisionPlayerAndEnemy(struct Character *ply)
{
	if (g_ReverseCount > 0)
		g_ReverseCount--;
	else
	{
		Game_Pawn *pawn = &ply->Pawn;

		for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].SkeletonNumber; nEnemy++)
		{
			struct CharacterEnemy *enemy = &g_Enemy[nEnemy];

			i8 dx = enemy->X - pawn->PositionX;
			i8 dy = enemy->Y - pawn->PositionY;

			u16 sqrtDist = (dx * dx) + (dy * dy);
			if (sqrtDist < 13 * 13)
			{
				g_ReverseCount = 30;
				if (removeLife() == TRUE)
				{
					reorganizeLife();
					displayLife();
				}
				// VDP_SetColor(COLOR_DARK_RED);
			}
			else
			{
				VDP_SetColor(COLOR_BLACK);
			}
		}
	}
}

/**
 * @brief Gestisce una probabile collisione tra il Player e uno dei fantasmi
 * @param void
 * @return void
 */
void physicsCollisionPlayerAndGhost(struct Character *ply)
{
	if (g_ReverseCount > 0)
		g_ReverseCount--;
	else
	{
		Game_Pawn *pawn = &ply->Pawn;

		for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].GhostNumber; nEnemy++)
		{
			struct CharacterEnemy *enemy = &g_Ghost[nEnemy];

			i8 dx = enemy->X - pawn->PositionX;
			i8 dy = enemy->Y - pawn->PositionY;

			u16 sqrtDist = (dx * dx) + (dy * dy);
			if (sqrtDist < 13 * 13)
			{
				g_ReverseCount = 30;
				if (removeLife() == TRUE)
				{
					reorganizeLife();
					displayLife();
				}
				// VDP_SetColor(COLOR_DARK_RED);
			}
			else
			{
				VDP_SetColor(COLOR_BLACK);
			}
		}
	}
}

/**
 * @brief Gestisce una probabile collisione tra il Player e uno dei fantasmi
 * @param void
 * @return void
 */
void physicsCollisionPlayerAndSpider(struct Character *ply)
{
	if (g_ReverseCount > 0)
		g_ReverseCount--;
	else
	{
		Game_Pawn *pawn = &ply->Pawn;

		for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].SpiderNumber; nEnemy++)
		{
			struct CharacterEnemy *enemy = &g_Spider[nEnemy];

			i8 dx = enemy->X - pawn->PositionX;
			i8 dy = enemy->Y - pawn->PositionY;

			u16 sqrtDist = (dx * dx) + (dy * dy);
			if (sqrtDist < 13 * 13)
			{
				g_ReverseCount = 30;
				if (removeLife() == TRUE)
				{
					reorganizeLife();
					displayLife();
				}
				// VDP_SetColor(COLOR_DARK_RED);
			}
			else
			{
				VDP_SetColor(COLOR_BLACK);
			}
		}
	}
}


/**
 * @brief Gestisce una probabile collisione tra il Player e uno dei pipistrelli
 * @param void
 * @return void
 */
void physicsCollisionPlayerAndBat(struct Character *ply)
{
	if (g_ReverseCount > 0)
		g_ReverseCount--;
	else
	{
		Game_Pawn *pawn = &ply->Pawn;

		for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].BatNumber; nEnemy++)
		{
			struct CharacterEnemy *enemy = &g_Bat[nEnemy];

			i8 dx = enemy->X - pawn->PositionX;
			i8 dy = enemy->Y - pawn->PositionY;

			u16 sqrtDist = (dx * dx) + (dy * dy);
			if (sqrtDist < 13 * 13)
			{
				g_ReverseCount = 30;
				if (removeLife() == TRUE)
				{
					reorganizeLife();
					displayLife();
				}
				// VDP_SetColor(COLOR_DARK_RED);
			}
			else
			{
				VDP_SetColor(COLOR_BLACK);
			}
		}
	}
}

/**
 * @brief Controlla che il player non sia sommerso dall'acqua
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return TRUE se è sotto l'acqua
 */
bool isUnderTheWater(u8 x, u8 y)
{
	return (getTile(x, y) == 80);
}

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
 * @brief Interagisce in una determinata posizione
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return bool TRUE se si compie una azione
 */
bool interact(u8 x, u8 y)
{
	u8 tile = getTile(x, y);

	DEBUG_LOGNUM("Intercat", tile);

	switch (tile)
	{
	case TILE_HEART:
		if (g_Player.Life < MAX_LIVES)
		{
			replacementItemInLevel(x, y, EMPTY_ITEM);
			setTile(x, y, EMPTY_ITEM);
			g_Player.Life++;
			addLife();
		}
		return TRUE;
	case TILE_DOOR0:
		drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
		return TRUE;
	case TILE_DOOR1:
		if (hasItemInInventory(TILE_KEY1))
		{
			changeLevel(x, y, TILE_KEY1, TILE_DOOR0);
		}
		return TRUE;
	case TILE_DOOR2:
		if (hasItemInInventory(TILE_KEY2))
		{
			changeLevel(x, y, TILE_KEY2, TILE_DOOR0);
		}
		return TRUE;
	case TILE_DOOR3:
		if (hasItemInInventory(TILE_KEY3))
		{
			changeLevel(x, y, TILE_KEY3, TILE_DOOR0);
		}
		return TRUE;
	case TILE_DOOR_PREV:
		drawLevel(g_Levels[g_CurrRoomIdx].PrevLvIdx);
		return false;
	case TILE_KEY1:
	case TILE_KEY2:
	case TILE_KEY3:
	case TILE_AMPHORA:
		/* 		Print_DrawIntAt(20, 18,x);
				Print_DrawIntAt(20, 19,(x/8));
				Print_DrawIntAt(20, 20,y);
				Print_DrawIntAt(20, 21,((y/8)*32));
				Print_DrawIntAt(20, 22,((y/8)*32) + (x/8));
				Print_DrawIntAt(20, 23,pos); */

		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replacementItemInLevel(x, y, EMPTY_ITEM);

		setTile(x, y, EMPTY_ITEM);
		addItemToInventory(tile);
		return TRUE;
	case TILE_BLOCK_TEST:
		// TODO: Fare attenzione che il blocco che andiamo a spostare non vada sopra altri oggetti
		//       inoltre si deve gestire anche la spinta che va verso sinistra.
		Print_DrawTextAt(0, 23, "                            ");
		Print_DrawIntAt(0, 23, x);
		if (g_PrevDirection == INPUT_RIGHT)
			if (getTile(x + 9, y) == 0)
			{
				setTile(x, y, EMPTY_ITEM);
				setTile(x + 9, y, TILE_BLOCK_TEST);
			}
			else if (g_PrevDirection == INPUT_LEFT)
			{
				if (getTile(x, y) == 0)
				{
					setTile(x, y, EMPTY_ITEM);
					setTile(x, y, TILE_BLOCK_TEST);
				}
			}
		return TRUE;
	}

	updateScore();

	return FALSE;
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
	removeItemFromInventory(key);
	reorganizeInventory();
	replacementItemInLevel(x, y, door);
	drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
}

/**
 * @brief Routine per raccogliere le monete
 * @param u8 x Coordinata X
 * @param u8 y Coordinata Y
 * @return TRUE se è stata raccolta una moneta
 */
bool getMoney(u8 x, u8 y)
{
	u8 tile = getTile(x, y);

	switch (tile)
	{
	case TILE_MONEY:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replacementItemInLevel(x, y, EMPTY_ITEM);

		setTile(x, y, EMPTY_ITEM);
		g_Player.Score++;
		updateScore();
		return TRUE;
	}
	return FALSE;
}

/**
 * @brief Aggiorna il punteggio
 * @param void
 * @return void
 */
void updateScore()
{
	c8 StrLevel[16];
	c8 StrScore[16];

	// Stampa il livello di gioco
	Print_SetPosition(0, 0);
	Print_DrawText("LEVEL:");
	String_Format(StrLevel, "%02i", g_CurrRoomIdx + 1);
	Print_SetPosition(6, 0);
	Print_DrawText(StrLevel);

	// Stampa il punteggio
	Print_SetPosition(10, 0);
	Print_DrawText("SCORE:");
	String_Format(StrScore, "%04i", g_Player.Score);
	Print_SetPosition(16, 0);
	Print_DrawText(StrScore);

	// Stampa il punteggio
	Print_SetPosition(22, 0);
	Print_DrawText("LIFE:");
}

/**
 * @brief Sostituisce la tile nell'array del livello partendo dalle coordinate
 * @param u8 x Coordinata X
 * @param u8 y Coordinata y
 * @param u8 tile Tile da inserire nell'arrya
 * @return void
 */
void replacementItemInLevel(u8 x, u8 y, u8 tile)
{
	u16 pos = ((y / 8) * 32) + (x / 8);
	g_Levels[g_CurrRoomIdx].Layout[pos] = tile;
}

/**
 * @brief Si disegna il livello di gioco
 * @param u8 levelIdx Indice del livello da visualizzare
 * @return void
 */
void drawLevel(u8 levelIdx)
{
	g_CurrRoomIdx = levelIdx;
	g_PawnCount = 0;
	g_GhostCount = 0;
	g_SpiderCount = 0;
	g_BatCount = 0;
	g_SladePlatformCount = 0;

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

	// Disegnare il livello riga per riga
	for (u8 riga = 0; riga < g_Levels[levelIdx].Height; ++riga)
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
		VDP_WriteVRAM_16K(g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga,
						  g_ScreenLayoutLow + (32 * (riga + g_Levels[levelIdx].Y)) + (g_Levels[levelIdx].X), g_Levels[levelIdx].Width);

		for (u8 colonna = 0; colonna < g_Levels[levelIdx].Width; ++colonna)
		{
			// Recupera la tile nella poszione indicata
			u8 tile = g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna];

			if (tile == TILE_START_POS) // Rilevamento della posizione iniziale del giocatore
			{
				u8 x = g_Levels[levelIdx].X + colonna;
				u8 y = g_Levels[levelIdx].Y + riga;

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
			else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < MAX_ENEMY)) // Rilevamento della posizione iniziale del nemico
			{
				if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_STAR_POS_ENEMY)
				{
					if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_STAR_POS_ENEMY)
					{

						u8 x = g_Levels[levelIdx].X + colonna;
						u8 y = g_Levels[levelIdx].Y + riga;

						// Funzione: VDP_SetSpriteSM1
						// Impostare l'attributo sprite per la modalità Sprite 1. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi
						//   x     - Coordinata iniziale X dello schermo
						//   y     - Coordinata iniziale Y dello schermo
						//   shape - Indice del modello di sprite (in modalità 16x16, è possibile utilizzare solo multipli di 4)
						//   color - Colore dello sprite (LSB 4 bit) + flag EC opzionale (VDP_SPRITE_EC)
						VDP_SetSpriteSM1(6 + g_PawnCount, x, y, 196, COLOR_WHITE);

						// Funzione: VDP_SetSpritePosition
						// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi.
						//   x     - Coordinata X iniziale dello schermo.
						//   y     - Coordinata Y iniziale dello schermo.
						VDP_SetSpritePosition(6 + g_PawnCount, x * 8, (y - 1) * 8);

						struct CharacterEnemy *enemy = &g_Enemy[g_PawnCount];
						enemy->X = x * 8;
						enemy->Y = (y - 1) * 8;
						enemy->Direction = -1;

						setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
						g_PawnCount++;
					}
				}
			}
			else if ((tile == TILE_POS_GHOST) && (g_Levels[levelIdx].GhostNumber < MAX_GHOST)) // Rilevamento della posizione iniziale del nemico
			{
				if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_GHOST)
				{
					if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_GHOST)
					{
						// TODO: Posiziona lo sprite della Slied Platform nell'livello di gioco
						//		 C'è un bug da risolvere, la slide si presenta anche nei livelli
						//		 dove non risulta configurata.
						// 		 Per aggiungerla ad un livello è necessario inserire la tile 128
						//		 e le tile 100 per dare il range di escursione

						u8 x = g_Levels[levelIdx].X + colonna;
						u8 y = g_Levels[levelIdx].Y + riga;

						// Funzione: VDP_SetSpriteSM1
						// Impostare l'attributo sprite per la modalità Sprite 1. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi
						//   x     - Coordinata iniziale X dello schermo
						//   y     - Coordinata iniziale Y dello schermo
						//   shape - Indice del modello di sprite (in modalità 16x16, è possibile utilizzare solo multipli di 4)
						//   color - Colore dello sprite (LSB 4 bit) + flag EC opzionale (VDP_SPRITE_EC)
						VDP_SetSpriteSM1(10 + g_GhostCount, x, y, 200, COLOR_WHITE);

						// Funzione: VDP_SetSpritePosition
						// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi.
						//   x     - Coordinata X iniziale dello schermo.
						//   y     - Coordinata Y iniziale dello schermo.
						VDP_SetSpritePosition(10 + g_GhostCount, x * 8, (y - 1) * 8);

						struct CharacterEnemy *ghost = &g_Ghost[g_GhostCount];
						ghost->X = x * 8;
						ghost->Y = (y - 1) * 8;
						ghost->Direction = -1;

						setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
						g_GhostCount++;
					}
				}
			}
			else if ((tile == TILE_POS_SPIDER) && (g_Levels[levelIdx].SpiderNumber < MAX_SPIDER)) // Rilevamento della posizione iniziale del nemico
			{
				if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_SPIDER)
				{
					if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_SPIDER)
					{
						// TODO: Posiziona lo sprite della Slied Platform nell'livello di gioco
						//		 C'è un bug da risolvere, la slide si presenta anche nei livelli
						//		 dove non risulta configurata.
						// 		 Per aggiungerla ad un livello è necessario inserire la tile 128
						//		 e le tile 100 per dare il range di escursione

						u8 x = g_Levels[levelIdx].X + colonna;
						u8 y = g_Levels[levelIdx].Y + riga;

						// Funzione: VDP_SetSpriteSM1
						// Impostare l'attributo sprite per la modalità Sprite 1. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi
						//   x     - Coordinata iniziale X dello schermo
						//   y     - Coordinata iniziale Y dello schermo
						//   shape - Indice del modello di sprite (in modalità 16x16, è possibile utilizzare solo multipli di 4)
						//   color - Colore dello sprite (LSB 4 bit) + flag EC opzionale (VDP_SPRITE_EC)
						VDP_SetSpriteSM1(15 + g_SpiderCount, x, y, 192, COLOR_WHITE);

						// Funzione: VDP_SetSpritePosition
						// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi.
						//   x     - Coordinata X iniziale dello schermo.
						//   y     - Coordinata Y iniziale dello schermo.
						VDP_SetSpritePosition(15 + g_SpiderCount, x * 8, (y - 1) * 8);

						struct CharacterEnemy *spider = &g_Spider[g_SpiderCount];
						spider->X = x * 8;
						spider->Y = (y - 1) * 8;
						spider->Direction = -1;

						setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
						g_SpiderCount++;
					}
				}
			}
			else if ((tile == TILE_POS_BAT) && (g_Levels[levelIdx].BatNumber < MAX_BAT)) // Rilevamento della posizione iniziale del nemico
			{
				if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_BAT)
				{
					if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_BAT)
					{
						// TODO: Posiziona lo sprite della Slied Platform nell'livello di gioco
						//		 C'è un bug da risolvere, la slide si presenta anche nei livelli
						//		 dove non risulta configurata.
						// 		 Per aggiungerla ad un livello è necessario inserire la tile 128
						//		 e le tile 100 per dare il range di escursione

						u8 x = g_Levels[levelIdx].X + colonna;
						u8 y = g_Levels[levelIdx].Y + riga;

						// Funzione: VDP_SetSpriteSM1
						// Impostare l'attributo sprite per la modalità Sprite 1. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi
						//   x     - Coordinata iniziale X dello schermo
						//   y     - Coordinata iniziale Y dello schermo
						//   shape - Indice del modello di sprite (in modalità 16x16, è possibile utilizzare solo multipli di 4)
						//   color - Colore dello sprite (LSB 4 bit) + flag EC opzionale (VDP_SPRITE_EC)
						VDP_SetSpriteSM1(20 + g_BatCount, x, y, 204, COLOR_WHITE);

						// Funzione: VDP_SetSpritePosition
						// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
						//
						// Parametri:
						//   index - Indice dello sprite nella tabella degli attributi.
						//   x     - Coordinata X iniziale dello schermo.
						//   y     - Coordinata Y iniziale dello schermo.
						VDP_SetSpritePosition(20 + g_BatCount, x * 8, (y - 1) * 8);

						struct CharacterEnemy *bat = &g_Bat[g_BatCount];
						bat->X = x * 8;
						bat->Y = (y - 1) * 8;
						bat->Direction = -1;

						setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
						g_BatCount++;
					}
				}
			}
		}
	}

	// Nasconde gli sprite dei nemici
	for (u8 i = g_PawnCount; i < MAX_ENEMY; ++i)
	{
		VDP_HideSprite(6 + i);
	}

	for (u8 i = g_GhostCount; i < MAX_GHOST; ++i)
	{
		VDP_HideSprite(10 + i);
	}

	for (u8 i = g_SpiderCount; i < MAX_SPIDER; ++i)
	{
		VDP_HideSprite(15 + i);
	}

	for (u8 i = g_BatCount; i < MAX_BAT; ++i)
	{
		VDP_HideSprite(20 + i);
	}

	// VDP_HideSpriteFrom(6 + g_PawnCount);

	updateScore();

	displayItemToInventory();
	displayLife();
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
		GamePawn_SetPosition(pawn, 255 - 16 - 16, 128);
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
	ply->DX = 0;
	ply->DY = 0;

	if (ply->Input & INPUT_RIGHT)
	{
		ply->DX++;
		ply->bMoving = TRUE;

		// TODO: imposta direzione destra
		//		 solo se è impostata la direzione sinistra
		if (g_PrevDirection != INPUT_RIGHT)
		{
			g_PrevDirection = INPUT_RIGHT;

#if CAVALIERE
			// TODO: Impiega troppo tempo per eseguire queste tre operazioni!!!
			// TODO: Vedere se reimplementare
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer, 4 * 4 * 0, 4 * 4 * 2);
			// VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
			// VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);
#else
			VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_1, 4 * 4 * 0, 4 * 4 * 2);
			VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
			VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);
#endif
		}
	}
	else if (ply->Input & INPUT_LEFT)
	{
		ply->DX--;
		ply->bMoving = TRUE;

		if (g_PrevDirection != INPUT_LEFT)
		{
			g_PrevDirection = INPUT_LEFT;

#if CAVALIERE
			// Funzione: VDP_LoadSpritePattern
			// Carica lo sprite nella VRAM. [MSX1/2/2+/TR]
			//
			// Parametri:
			//   addr  - Indirizzo dello sprite patterns (in RAM/ROM).
			//   index - Indice del primo modello di sprite VRAM da copiare (in modalità 16x16, si possono usare solo multipli di 4).
			//   count - Numero di patterns to copy (in modalità 16x16, si possono usare solo multipli di 4).
			VDP_LoadSpritePattern(g_DataSprtLayer, 4 * 4 * 0, 4 * 4 * 2);
			// VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
			// VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);
#else
			// TODO: Vedere se reimplementare
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_1, 4 * 4 * 0, 4 * 4 * 2);
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);

#endif
		}
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
		// TODO:  Da ottimizzare
		// Attenzione l'aggiunta dell'iterazione crea dei rallentamenti al gioco
		// 1) Il primo rigo si utilizza nteagire com gli elementi che is trovano sul piano di gioco
		// 2) La seconda riga si utilizza per inteagire com gli elementi che is trovano una tile sopra il piano di gioco
		// 3,4,5,6) Sono solamente per test, non devono essere abilitate per il momento

		if (interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) /*||
			interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4)  ||
			interact(g_Player.Pawn.PositionX + 16, g_Player.Pawn.PositionY + 12) ||
			interact(g_Player.Pawn.PositionX + 16, g_Player.Pawn.PositionY + 4) ||
			interact(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY + 12) ||
			interact(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY + 4) */
		)
		{
			// TODO: non faccio nulla!
		}
	}

	// Update player animation & physics
	u8 act = ACTION_IDLE;
	if (ply->bInAir && (ply->VelocityY >= 0))
		act = ACTION_JUMP;
	else if (ply->bInAir)
		act = ACTION_FALL;
	else if (ply->bMoving)
		act = ACTION_MOVE;

	Game_Pawn *pawn = &ply->Pawn;
	GamePawn_SetAction(pawn, act);
	GamePawn_SetMovement(pawn, ply->DX, ply->DY);
	GamePawn_Update(pawn);
}

/**
 * @brief Aggiorna la posizione dei nemici
 * @param void
 * @return void
 */
void updateSkeleton()
{

	for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].SkeletonNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &g_Enemy[nEnemy];

		if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
		{
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}
		else
		{
			enemy->Direction *= -1;
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}

		// Funzione: VDP_SetSpritePosition
		// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
		//
		// Parametri:
		//   index - Indice dello sprite nella tabella degli attributi.
		//   x     - Coordinata X iniziale dello schermo.
		//   y     - Coordinata Y iniziale dello schermo.
		VDP_SetSpritePosition(6 + nEnemy, enemy->X, enemy->Y);

		enemy = null;
	}
}

/**
 * @brief Aggiorna la posizione dei nemici
 * @param void
 * @return void
 */
void updateGhost()
{

	for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].GhostNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &g_Ghost[nEnemy];

		if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
		{
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}
		else
		{
			enemy->Direction *= -1;
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}

		// Funzione: VDP_SetSpritePosition
		// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
		//
		// Parametri:
		//   index - Indice dello sprite nella tabella degli attributi.
		//   x     - Coordinata X iniziale dello schermo.
		//   y     - Coordinata Y iniziale dello schermo.
		VDP_SetSpritePosition(10 + nEnemy, enemy->X, enemy->Y);

		enemy = null;
	}
}

/**
 * @brief Aggiorna la posizione dei nemici
 * @param void
 * @return void
 */
void updateSpider()
{

	for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].SpiderNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &g_Spider[nEnemy];

		if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
		{
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}
		else
		{
			enemy->Direction *= -1;
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}

		// Funzione: VDP_SetSpritePosition
		// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
		//
		// Parametri:
		//   index - Indice dello sprite nella tabella degli attributi.
		//   x     - Coordinata X iniziale dello schermo.
		//   y     - Coordinata Y iniziale dello schermo.
		VDP_SetSpritePosition(15 + nEnemy, enemy->X, enemy->Y);

		enemy = null;
	}
}


/**
 * @brief Aggiorna la posizione dei nemici
 * @param void
 * @return void
 */
void updateBat()
{

	for (u8 nEnemy = 0; nEnemy < g_Levels[g_CurrRoomIdx].BatNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &g_Bat[nEnemy];

		if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
		{
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}
		else
		{
			enemy->Direction *= -1;
			if (enemy->Direction < 0)
			{
				enemy->X--;
			}
			else
			{
				enemy->X++;
			}
		}

		// Funzione: VDP_SetSpritePosition
		// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
		//
		// Parametri:
		//   index - Indice dello sprite nella tabella degli attributi.
		//   x     - Coordinata X iniziale dello schermo.
		//   y     - Coordinata Y iniziale dello schermo.
		VDP_SetSpritePosition(20 + nEnemy, enemy->X, enemy->Y);

		enemy = null;
	}
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
		VDP_SetColor(COLOR_DARK_RED);
	}
	else
		VDP_SetColor(COLOR_BLACK);

	// Valuta se è presente una manota ed eventualmente la raccoglie
	// TODO: Da ottimizzare
	// Attenzione l'aggiunta dell'iterazione crea dei rallentamenti al gioco
	// 1) La prima parte si utilizza per inteagire com gli elementi che is trovano una tile sopra il piano di gioco
	// 2) La seconda parte si utilizza nteagire com gli elementi che is trovano sul piano di gioco
	if (getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
		getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	{
		// TODO: non faccio nulla!
	}
}

/**
 * @brief VDP_LoadSpritePattern16_VSym
 * @param u8 src Indirizzo dello sprite pattern
 * @param u8 index Indice del primo modello di sprite VRAM da copiare (in modalità 16x16, si possono usare solo multipli di 4).
 * @param u8 count Numero di patterns to copy (in modalità 16x16, si possono usare solo multipli di 4).
 * @return void
 */
void VDP_LoadSpritePattern16_VSym(const u8 *src, u8 index, u8 count)
{
	u16 dest = g_SpritePatternLow + (index * 8);
	for (u16 i = 0; i < count * 8; i++)
	{
		u8 val = Math_Flip(*src++);
		u16 addr = dest++;
		if (i & 0x10) // Spostamento ogni 16 byte per capovolgere i 4 blocchi dello sprite 16x16
			addr -= 16;
		else
			addr += 16;
		VDP_Poke_16K(val, addr);
	}
}

/**
 * @brief Inizializza lo stato del gioco
 * @param void
 * @return bool è sempre FALSE
 */
bool State_Initialize()
{
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
	VDP_WriteVRAM_16K(g_DataBackground, g_ScreenPatternLow, sizeof(g_DataBackground));

	// Inizializza i caratteri personalizzati
	Print_SetMode(PRINT_MODE_TEXT);
	Print_SetFontEx(8, 8, 1, 1, ' ', '_', g_DataBackground + 192);
	Print_Initialize();
	g_PrintData.PatternOffset = 192;

	// Initialize color
	setColorTiles();

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
	VDP_WriteVRAM_16K(g_DataSprtLayer, g_SpritePatternLow, sizeof(g_DataSprtLayer));

	// Funzione: InitCharacter
	// Inizzializza lo sprite del giocatore
	//
	// Parametri:
	//  Character - indirizzo della truruttura che rappresenta il giocatore
	//  id del giorcatore
	initCharacter(&g_Player, 0);

	// Funzione: initInventory
	// Inizializza l'inventario
	initInventory();

	// Funzione: initLife
	// Inizializza le vite del giocatore
	initLife();

	// TODO: Quando importo le funzionalità della libreria clock
	//		 viene gnerato un errore del tipo ?ASlink-Warning-Undefined Global
	//       chiedere se è possibili utilizzarle su msx 1
	// Funzione: rtcInizialize
	// Inizializza il modulo RTC
	// rtcInizialize();

	// Funzione: DrawLevel
	// Inizzializza il livello di gioco
	//
	// Parametri:
	//  u8 levelIdx - rappresenta l'id del livello
	drawLevel(0);

	VDP_EnableDisplay(TRUE);

	Game_SetState(State_Game);
	return FALSE; // Frame finished
}

/**
 * @brief Aggirona lo stato del giocatore e dei nemici
 * @param void
 * @return void
 */
bool State_Game()
{
	// TODO: Con la funzione Game_WaitSync il gioco sull'emulatore sembra molto rallentato
	//		 Si può comunque tornare alla versione precednte commentando la funzione
	//		 e ripristinando if (g_FrameCounter % 2 == 0)

	// Funzione: Game_WaitVSync
	// Attende la sincronizzazione verticale
	// Game_WaitVSync();

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
	if (g_FrameCounter % 2 == 0)
	{
		// Funzione: updateSkeleton
		// Aggiorna il rendering dei nemici.
		updateSkeleton();

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndEnemy
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndEnemy(&g_Player);

		updateGhost();

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGhost(&g_Player);

		updateSpider();

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndSpider(&g_Player);

		updateBat();

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndBat(&g_Player);

	}
	g_FrameCounter++;

	if (Keyboard_IsKeyPressed(KEY_ESC))
		Game_Exit();

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

//=============================================================================
// GESTIONE DELLA TATIERA E JOY
//=============================================================================

/**
 * @brief Si effettua la lettura della tastiera
 * @param void
 * @return void
 */
void readInputControl()
{
	u8 row8 = Keyboard_Read(8);

	g_Player.Input = 0;
	if (isMoveRight(row8))
	{
		g_Player.Input |= INPUT_RIGHT;
	}
	if (isMoveLeft(row8))
	{
		g_Player.Input |= INPUT_LEFT;
	}
	if (isMoveJump(row8))
	{
		g_Player.Input |= INPUT_JUMP;
	}
	if (isInteractObject(row8))
	{
		g_Player.Input |= INPUT_GET;
	}

	g_PrevRow8 = row8;
}

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @return bool TRUE se il tasto RIGHT o il joy è nella direzione destra
 */
bool isMoveRight(u8 row8)
{
	bool isRight = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_RIGHT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_RIGHT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_RIGHT))
	{
		g_Player.Input |= INPUT_RIGHT;
		isRight = TRUE;
	}

	return isRight;
}

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @return bool TRUE se il tasto LEFT o il joy è nella direzione sinistra
 */
bool isMoveLeft(u8 row8)
{
	bool isLeft = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_LEFT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_LEFT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_LEFT))
	{
		g_Player.Input |= INPUT_LEFT;
		isLeft = TRUE;
	}

	return isLeft;
}

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @return bool TRUE se il tasto UP o il pulsante A è stato premuto
 */
bool isMoveJump(u8 row8)
{
	bool isJump = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_UP) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_A)))
	{
		g_Player.Input |= INPUT_JUMP;
		isJump = TRUE;
	}

	return isJump;
}

/**
 * @brief Aggiorna la direzione del Player
 * @param u8 row8
 * @return bool TRUE se il tasto SPACE o il pulsante B è stato premuto
 */
bool isInteractObject(u8 row8)
{
	bool isGet = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_SPACE) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_B)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_B)))
	{
		g_Player.Input |= INPUT_GET;
		isGet = TRUE;
	}

	return isGet;
}

//=============================================================================
// MAIN LOOP
//=============================================================================

void main()
{
	DEBUG_INIT();
	DEBUG_LOG("Start debug session!");

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

	DEBUG_LOG("End debug session!");

	Bios_Exit(0);
}
