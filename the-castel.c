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
#include "debug.h"
#include "string.h"
#include "input.h"
#include "pt3/pt3_player.h"
#include "pt3/pt3_notetable2.h"
#include "ayfx/ayfx_player.h"
#include "compress/pletter.h"
#include "version.h"

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
	const c8 *TypeEnemy;
};

unsigned char g_LevelUncompress[768];

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

u8 g_PrevRow8 = 0xFF;
u8 g_PawnCount = 0;
u8 g_PrevDirection = 0;
u8 g_FrameCounter = 0;
u8 g_ReverseCount = 0;
u8 g_CurrRoomIdx = 0;
u8 g_GhostCount = 0;
u8 g_SpiderCount = 0;
u8 g_BatCount = 0;
u8 g_ImmunityCount = 0;
u8 g_SecondCounter = 0;
u8 g_DangerCounter = 0;
u8 g_Frame = 0;
u8 g_DelayRemoveLife = 0;
bool IsUnderWater = FALSE;
bool g_IsDanger = FALSE;
u8 g_CatchEnemy = 0;
u8 g_DelayCatchEnemy = 0;
bool isCatch = FALSE;

unsigned char g_Inventory[MAX_ITEM_INVENTORY] = {0, 0, 0, 0, 0};
unsigned char g_Lives[MAX_LIVES] = {0, 0, 0};

/**
 * \struct
 * struct: La struttura rappresenta la posizione e la visibilitòà di un oggetto
 */
typedef struct
{
	u8 x;
	u8 y;
	u8 visible;
	u8 tile;
} ObjectItem;

/** \struct
 * struct: Struttura che rappresenta il numero di nemici per livello
 */
typedef struct
{
	u8 SkeletonNumber; /** Numero di scheletri nel livello*/
	u8 GhostNumber;	   /** Numero di fantasmi nel livello */
	u8 SpiderNumber;   /** Numero di ragni nel livello */
	u8 BatNumber;	   /** Numero di pipistrelli nel livello */
} EnemyType;

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

/** \struct
	struct: Struttura che rappresenta la stanza
*/
struct LevelDefinition
{
	u8 X;					/** Coordinata Y della stanza */
	u8 Y;					/** Coordinata Y della stanza */
	u8 Width;				/** Larghezza della stanza*/
	u8 Height;				/** Altezza della stanza */
	u8 *Layout;				/** Layout della stanza */
	const c8 *Name;			/** Nome della stanza */
	u8 NextLvlIdx;			/** Livello successivo */
	u8 PrevLvIdx;			/** Livello precedente */
	EnemyType MyEnemyType;	/** Rappresenta il numero di nemici per livello */
	ObjectItem MyItems[10]; /** Rappresenta gli oggetti utilizzati nel livello */
};

// Elenco delle stanze e delle loro caratteristiche
struct LevelDefinition g_Levels[] = {
	{(32 - LEVEL030_WIDTH) / 2, (24 - LEVEL030_HEIGHT) / 2, LEVEL030_WIDTH, LEVEL030_HEIGHT, g_Level030, "STRAT GAME", 1, 0, {0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL001_WIDTH) / 2, (24 - LEVEL001_HEIGHT) / 2, LEVEL001_WIDTH, LEVEL001_HEIGHT, g_Level001, "Level: 01", 2, 0, {2, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL002_WIDTH) / 2, (24 - LEVEL002_HEIGHT) / 2, LEVEL002_WIDTH, LEVEL002_HEIGHT, g_Level002, "Level: 02", 3, 1, {2, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL003_WIDTH) / 2, (24 - LEVEL003_HEIGHT) / 2, LEVEL003_WIDTH, LEVEL003_HEIGHT, g_Level003, "Level: 03", 4, 2, {2, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL004_WIDTH) / 2, (24 - LEVEL004_HEIGHT) / 2, LEVEL004_WIDTH, LEVEL004_HEIGHT, g_Level004, "Level: 04", 5, 3, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL006_WIDTH) / 2, (24 - LEVEL006_HEIGHT) / 2, LEVEL006_WIDTH, LEVEL006_HEIGHT, g_Level006, "Level: 05", 6, 4, {1, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL007_WIDTH) / 2, (24 - LEVEL007_HEIGHT) / 2, LEVEL007_WIDTH, LEVEL007_HEIGHT, g_Level007, "Level: 06", 7, 5, {0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL015_WIDTH) / 2, (24 - LEVEL015_HEIGHT) / 2, LEVEL015_WIDTH, LEVEL015_HEIGHT, g_Level015, "Level: 07", 8, 6, {1, 1, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL008_WIDTH) / 2, (24 - LEVEL008_HEIGHT) / 2, LEVEL008_WIDTH, LEVEL008_HEIGHT, g_Level008, "Level: 08", 9, 7, {0, 0, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL010_WIDTH) / 2, (24 - LEVEL010_HEIGHT) / 2, LEVEL010_WIDTH, LEVEL010_HEIGHT, g_Level010, "Level: 09", 10, 8, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL011_WIDTH) / 2, (24 - LEVEL011_HEIGHT) / 2, LEVEL011_WIDTH, LEVEL011_HEIGHT, g_Level011, "Level: 10", 11, 9, {1, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL012_WIDTH) / 2, (24 - LEVEL012_HEIGHT) / 2, LEVEL012_WIDTH, LEVEL012_HEIGHT, g_Level012, "Level: 11", 12, 10, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL009_WIDTH) / 2, (24 - LEVEL009_HEIGHT) / 2, LEVEL009_WIDTH, LEVEL009_HEIGHT, g_Level009, "Level: 12", 13, 11, {1, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL013_WIDTH) / 2, (24 - LEVEL013_HEIGHT) / 2, LEVEL013_WIDTH, LEVEL013_HEIGHT, g_Level013, "Level: 13", 14, 12, {0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL014_WIDTH) / 2, (24 - LEVEL014_HEIGHT) / 2, LEVEL014_WIDTH, LEVEL014_HEIGHT, g_Level014, "Level: 14", 15, 13, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL005_WIDTH) / 2, (24 - LEVEL005_HEIGHT) / 2, LEVEL005_WIDTH, LEVEL005_HEIGHT, g_Level005, "level: 15", 0, 14, {0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL029_WIDTH) / 2, (24 - LEVEL029_HEIGHT) / 2, LEVEL029_WIDTH, LEVEL029_HEIGHT, g_Level029, "GAME OVER", 0, 9, {0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
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

	Mem_Set(TILE_HEART, g_Lives, (3 * sizeof(g_Lives[0])));
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
			g_Player.Life++;
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
	// Controlla se nell'inventario è presente la pozione per l'immunità
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

	for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	{

		if (g_Lives[i] == TILE_HEART)
		{
			g_Lives[i] = EMPTY_ITEM;
			setTile(220 + i * 16, (u8)(4), 0);
			g_Player.Life--;
			return (i > 0);
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
	Mem_Set(EMPTY_ITEM, g_Inventory, (5 * sizeof(g_Inventory[0])));
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
			setTile((g_Levels[g_CurrRoomIdx].X * 8) + 8 + i * 16, (u8)((g_Levels[g_CurrRoomIdx].Height * 8) - 16) + g_Levels[g_CurrRoomIdx].Y * 8, item);
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

			setTile((g_Levels[g_CurrRoomIdx].X * 8) + 8 + i * 16, (u8)((g_Levels[g_CurrRoomIdx].Height * 8) - 16) + g_Levels[g_CurrRoomIdx].Y * 8, 0);
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
	if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	{
		for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
		{
			setTile((g_Levels[g_CurrRoomIdx].X * 8) + 8 + i * 16, (u8)((g_Levels[g_CurrRoomIdx].Height * 8) - 16) + g_Levels[g_CurrRoomIdx].Y * 8, g_Inventory[i]);
		}
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
	return (tile > 110 && tile < 184);
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
	if (g_ReverseCount > 0)
		g_ReverseCount--;
	else
	{
		Game_Pawn *pawn = &ply->Pawn;

		for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
		{
			struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
			collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY);
		}
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
	// u16 sqrtDist = (dx * dx) + (dy * dy);
	if ((dx * dx) + (dy * dy) < 13 * 13)
	{
		g_ReverseCount = 60;
		if (removeLife() == TRUE)
		{
			displayLife();

			PlayBankSFX(9, 0);

			return TRUE;
		}
		else
		{
			if (!hasLives())
			{
				stopMusicPlayback();
				Game_SetState(State_GameOver);
			}
		}
	}
	else
	{
		/* VDP_SetColor */ (COLOR_BLACK);

		return FALSE;
	}
}

/**
 * @brief La funzione verifica se il nemico è in grado di inseguriti
 * @param struct Character *ply Puntatore al player
 * @param struct CharacterEnemy *genericEnemy Puntatore all'array dei nemici
 * @param u8 enemyNumber Numero dei nemici nel livello
 * @return TRUE se il nemico può ineguirti
 */
void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 enemyNumber)
{
	Game_Pawn *pawn = &g_Player.Pawn;

	for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	{
		struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
		i8 dx = enemy->X - pawn->PositionX;
		i8 dy = enemy->Y - pawn->PositionY;

		if (dy == 0 && (((dx * dx) > MIN_DISTANCE_MAGNENT) && ((dx * dx) < MAX_DISTANCE_MAGNENT)))
		{
			if (isCatch)
			{
				if (g_CatchEnemy - g_DelayCatchEnemy > DELAY_CATCH_ENEMY)
				{
					if (pawn->PositionX > enemy->X)
						enemy->Direction = 1;
					else
						enemy->Direction = -1;

					isCatch = FALSE;
					// Print_DrawIntAt(22,20, 1);
				}
				else
				{
					g_DelayCatchEnemy--;
					// Print_DrawIntAt(22,20, 2);
				}
			}
			else
			{
				isCatch = TRUE;
				// Print_DrawIntAt(22,20, 0);
			}

			break;
		}
		else
		{
			g_DelayCatchEnemy = g_CatchEnemy;
			isCatch = FALSE;
			// Print_DrawIntAt(22,20, 3);
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
	return (getTile(x, y) == TILE_WATER);
}

/**
 * @brief Controlla che il player non sia sommerso dall'acqua
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return TRUE se è sotto l'acqua
 */
u8 isUnderDunger(u8 x, u8 y)
{
	return getTile(x, y);
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

void foo(u8 x, u8 y, u8 tile, u8 visibility);
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
void foo(u8 x, u8 y, u8 tile, u8 visible)
{
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].x = x;
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].y = y;
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].tile = tile;
	g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].visible = visible;

	// Print_DrawIntAt(20, 23, g_CurrRoomIdx);
	// Print_DrawIntAt(20, 22, g_CountItem);
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

	/* 	c8 StrFormat[5];
		Print_SetPosition(29, 23);
		String_Format(StrFormat, "%03i", tile);
		Print_DrawText(StrFormat); */

	DEBUG_LOGNUM("Intercat", tile);

	// TODO: Ottimizzare il case!!
	switch (tile)
	{
	case TILE_HEART:
		if (addLife())
		{
			foo(x, y, TILE_MASK_HEART, 1);
			g_CountItem++;

			setTile(x, y, EMPTY_ITEM);
			PlayBankSFX(10, 0);
		}
		return TRUE;
	case TILE_DOOR0:
	case TILE_MASK_DOOR1:
	case TILE_MASK_DOOR2:
	case TILE_MASK_DOOR3:
		drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
		return TRUE;
	case TILE_DOOR1:
		if (hasItemInInventory(TILE_KEY1))
		{
			changeLevel(x, y, TILE_KEY1, TILE_MASK_DOOR1);
		}
		return TRUE;
	case TILE_DOOR2:
		if (g_CurrRoomIdx == LAST_LEVEL)
		{
			stopMusicPlayback();
			Game_SetState(State_GameOver);
		}
		else
		{
			if (hasItemInInventory(TILE_KEY2))
			{
				changeLevel(x, y, TILE_KEY2, TILE_MASK_DOOR2);
			}
		}
		return TRUE;
	case TILE_DOOR3:
		if (hasItemInInventory(TILE_KEY3))
		{
			changeLevel(x, y, TILE_KEY3, TILE_MASK_DOOR3);
		}
		return TRUE;
	case TILE_DOOR_PREV:
		drawLevel(g_Levels[g_CurrRoomIdx].PrevLvIdx);
		return false;
	case TILE_DOOR_NEXT:
		drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
		return false;

	case TILE_KEY1:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY1);
		PlayBankSFX(5, 0);

		return TRUE;
	case TILE_KEY2:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY2);
		PlayBankSFX(5, 0);

		return TRUE;
	case TILE_KEY3:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY3);
		PlayBankSFX(5, 0);

		return TRUE;
	case TILE_AMPHORA:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		if (!hasItemInInventory(TILE_AMPHORA))
		{
			replaceAndRemoveItem(x, y, tile, TILE_MASK_AMPHORA);
			PlayBankSFX(5, 0);
		}

		return TRUE;
		/* 	case TILE_CRUCIFIX:
				// Modifico al volo il livello di gioco, cosi non sono costretto
				// a creare una cache dei livelli.
				replaceAndRemoveItem(x, y, tile, TILE_MASK_CRUCIFIX);
				PlayBankSFX(5, 0);

				return TRUE;
			case TILE_BLOCK_TEST:
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
				return TRUE; */
	}

	updateScore();

	return FALSE;
}

/**
 * @brief rimuove la tile, sostituendola con una maschera e mette l'oggetto corrspondente nell'inventario.
 * 		  Questa funzione anche se ridondante mi permette di risparmiare qulache bit :)
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @param u8 tile Tile da inserire nell'inventario
 * @param u8 tileMask Maschera per sostituire la tile
 */
void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask)
{
	foo(x, y, tileMask, 1);
	g_CountItem++;

	setTile(x, y, EMPTY_ITEM);
	addItemToInventory(tile);
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
	foo(x, y, door, 1);
	g_CountItem++;

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
	switch (getTile(x, y))
	{
	case TILE_MONEY:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		foo(x, y, TILE_MASK_MONEY, 1);
		g_CountItem++;

		setTile(x, y, EMPTY_ITEM);

		g_Player.Score++;
		updateScore();

		PlayBankSFX(11, 15);
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
bool isDanger(u8 x, u8 y, u8 t)
{
	switch (isUnderDunger(x, y))
	{
	case TILE_DANGE1:
	case TILE_DANGE2:
	case TILE_DANGE3:
	case TILE_DANGE4:
		if (g_IsDanger)
		{

			c8 StrFormat[5];
			Print_SetPosition(29, 23);
			String_Format(StrFormat, "%03i", y);
			Print_DrawText(StrFormat);

			{
				if (!hasLives())
				{
					stopMusicPlayback();
					Game_SetState(State_GameOver);
				}
				else
				{
					if ((g_DangerCounter - g_DelayRemoveLife) > t)
					{
						removeLife();
						displayLife();

						PlayBankSFX(9, 0);

						g_IsDanger = FALSE;
						g_DelayRemoveLife--;
					}
				}
			}
		}
		else
		{
			g_DangerCounter = 0;
			g_IsDanger = TRUE;
		}
		return TRUE;
	case TILE_LAVA:
		if (!hasLives())
		{
			stopMusicPlayback();
			Game_SetState(State_GameOver);
		}
		else
		{
			if (removeLife() == TRUE)
			{
				displayLife();
				PlayBankSFX(9, 0);
				drawLevel(1);
			}
		}
		return TRUE;

	default:
		g_DangerCounter = 0;
		g_IsDanger = FALSE;
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
		Print_SetPosition(10, 0);
		Print_DrawText("SCORE:");
		String_Format(StrFormat, "%04i", g_Player.Score);
		Print_SetPosition(16, 0);
		Print_DrawText(StrFormat);

		// Stampa il punteggio
		Print_SetPosition(22, 0);
		Print_DrawText("LIFE:");
	}
}

/**
 * @brief Si disegna il livello di gioco
 * @param u8 levelIdx Indice del livello da visualizzare
 * @return void
 */
void drawLevel(u8 levelIdx)
{
	pausePT3Music();

	VDP_EnableDisplay(FALSE);

	g_CurrRoomIdx = levelIdx;
	g_PawnCount = 0;
	g_GhostCount = 0;
	g_SpiderCount = 0;
	g_BatCount = 0;
	g_SecondCounter = 0;
	g_DangerCounter = 0;
	g_CountItem = 0; // Iniziaizza il cobtatore degli oggetti raccolti

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

	Pletter_UnpackToRAM(g_Levels[levelIdx].Layout, g_CacheLevel[0].Layout);

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

			if (tile == TILE_START_POS) // Rilevamento della posizione iniziale del giocatore
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
			else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < MAX_ENEMY)) // Rilevamento della posizione iniziale del nemico
			{
				g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Enemy[0], 196, 6, riga, colonna, 0);
			}
			else if ((tile == TILE_POS_GHOST) && (g_Levels[0].MyEnemyType.GhostNumber < MAX_GHOST)) // Rilevamento della posizione iniziale del nemico
			{
				g_GhostCount = positionGenericEnemy(TILE_POS_GHOST, g_GhostCount, &g_Ghost[0], 200, 10, riga, colonna, 0);
			}
			else if ((tile == TILE_POS_SPIDER) && (g_Levels[0].MyEnemyType.SpiderNumber < MAX_SPIDER)) // Rilevamento della posizione iniziale del nemico
			{
				g_SpiderCount = positionGenericEnemy(TILE_POS_SPIDER, g_SpiderCount, &g_Spider[0], 192, 15, riga, colonna, 0);
			}
			else if ((tile == TILE_POS_BAT) && (g_Levels[0].MyEnemyType.BatNumber < MAX_BAT)) // Rilevamento della posizione iniziale del nemico
			{
				g_BatCount = positionGenericEnemy(TILE_POS_BAT, g_BatCount, &g_Bat[0], 204, 20, riga, colonna, 0);
			}
		}
	}

	hideSprite(g_PawnCount, MAX_ENEMY, 6);
	hideSprite(g_GhostCount, MAX_GHOST, 10);
	hideSprite(g_SpiderCount, MAX_SPIDER, 15);
	hideSprite(g_BatCount, MAX_BAT, 20);

	if (levelIdx == 0)
	{
		// TODO: non visualizzo i dati del risultato della partita
	}
	else
	{
		updateScore();

		displayItemToInventory();
		displayLife();
	}

	// Terminato il disegno del livello elimino gli oggetti già recuperati
	for (u8 i = 0; i < 10; i++)
	{
		if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
		{
			setTile(g_Levels[g_CurrRoomIdx].MyItems[i].x, g_Levels[g_CurrRoomIdx].MyItems[i].y, g_Levels[g_CurrRoomIdx].MyItems[i].tile);
		}
	}

	VDP_EnableDisplay(TRUE);

	restorePT3Music();
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
 */
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 bo, u8 riga, u8 colonna, u8 levelIdx)
{
	if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_GENERIC_ENEMY)
	{
		if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_GENERIC_ENEMY)
		{
			// TODO: Posiziona lo sprite della Slied Platform nell'livello di gioco
			//		 C'è un bug da risolvere, la slide si presenta anche nei livelli
			//		 dove non risulta configurata.
			// 		 Per aggiungerla ad un livello è necessario inserire la tile 128
			//		 e le tile 100 per dare il range di escursione

			u8 x = g_Levels[levelIdx].X + colonna;
			u8 y = g_Levels[levelIdx].Y + riga;

			managementSprite(x, y, bo, enemyCount, idxSprite);

			spritePosition(x, y, &enemy[0], enemyCount, "---");

			setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
			enemyCount++;
		}
	}

	return enemyCount;
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
void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 enemyCount, char *type)
{
	struct CharacterEnemy *generic = &genericEnemy[enemyCount];
	generic->X = x * 8;
	generic->Y = (y - 1) * 8;
	generic->Direction = (g_FrameCounter % 2) ? 1 : -1;
	generic->TypeEnemy = type;
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

	// Funzione: VDP_SetSpritePosition
	// Aggiorna la posizione dello sprite. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   index - Indice dello sprite nella tabella degli attributi.
	//   x     - Coordinata X iniziale dello schermo.
	//   y     - Coordinata Y iniziale dello schermo.
	VDP_SetSpritePosition(baseSprite + enemyCount, x * 8, (y - 1) * 8);
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

		if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1) // 7
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
		VDP_SetSpritePosition(idFirstSprite + nEnemy, enemy->X, enemy->Y);

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
		if (IsUnderWater)
		{
			if ((g_SecondCounter - g_DelayRemoveLife) > 3)
			{
				if (removeLife() == TRUE)
				{
					displayLife();

					PlayBankSFX(9, 0);

					IsUnderWater = FALSE;
				}
				else
				{
					stopMusicPlayback();
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
	if (getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
		getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	{
		// TODO: non faccio nulla!
	}

	// Controllo se il player è in una situazione di pericola
	// Print_DrawIntAt(23,20,g_Player.Pawn.PositionY);
	/* 			c8 StrFormat[5];
				Print_SetPosition(29, 21);
				String_Format(StrFormat, "%03i", g_Player.Pawn.PositionY - 31);
				Print_DrawText(StrFormat); */
	if ((isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12, 2)) || isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY - 100, 2))
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
	inizializePT3();

	// Funzione: inizializeAYFX
	// Impostazione del riproduttore ayfx e del canale audio
	inizializeAYFX();

	ChannelSFX(PSG_CHANNEL_A);
	PlayBankSFX(0, 0);

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
	VDP_LoadPattern_GM1_Pletter(g_DataBackground_Patterns, 0);

	// Inizializza i caratteri personalizzati
	Print_SetMode(PRINT_MODE_TEXT);
	Print_SetFontEx(8, 8, 1, 1, ' ', '_', g_DataBackground_Patterns + 192);
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

	Pletter_UnpackToVRAM(g_DataSprtLayer, g_SpritePatternLow);

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
	// TODO: Da rivedere la porzione del codice seguente vedere di implemetare la sincronizzazione
	//		 tramite le funzioni:
	//		 void Game_SetVSyncCallback(callback cb); // Set the function to be called each frame
	//		 void Game_WaitVSync(); // Wait V-Synch function
	Halt();
	PT3_Decode();	 // Update data to write to the PSG regiters from the music
	ayFX_Update();	 // Overwrite PSG registers data for the SFX
	PT3_UpdatePSG(); // Update PSG registers

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
		g_CatchEnemy++;
		g_Frame = 0;
	}

	if (g_FrameCounter % 2 == 0)
	{
		g_DangerCounter++;

		pursuitCheck(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);

		// Funzione: updateSkeleton
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber, 6);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndEnemy
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);

		pursuitCheck(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber, 10);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);

		pursuitCheck(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber, 15);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);

		pursuitCheck(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber, 20);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);
	}
	g_FrameCounter++;
	g_Frame++;

	/* 	if (Keyboard_IsKeyPressed(KEY_ESC))
			Game_Exit(); */

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
	initInventory();

	// Funzione: initLife
	// Inizializza le vite del giocatore
	initLife();

	// Funzione: DrawLevel
	// Inizzializza il livello di gioco
	//
	// Parametri:
	//  u8 levelIdx - rappresenta l'id del livello
	// VDP_EnableDisplay(FALSE);
	drawLevel(0);

	// VDP_EnableDisplay(TRUE);

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

	VDP_HideAllSprites();

	drawLevel(GAME_OVER); // -1

	// Attende la pressione di un tasto
	while (Keyboard_Read(8) != 254)
	{
	}

	Game_SetState(State_Preset);

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
// MUSICA
//=============================================================================

/**
 * @brief Riproduce il suono
 * @param u8 id
 * @param u8 prio
 * @return void
 */
void PlayBankSFX(u8 id, u8 prio)
{
	ayFX_PlayBank(id, prio); // Riproduzione di un suono ayFX
}

/**
 * @brief Seleziona una canale dovs SFX riproduce il suono
 * @param u8 chan Canale
 * @return void
 */
void ChannelSFX(u8 chan)
{
	ayFX_Mute();		   // Arresta la riproduzione dell'audio e disattiva il canale
	ayFX_SetChannel(chan); // Impostare il canale da utilizzare per la riproduzione del suono
}

/**
 * @brief Inizializzaione del Player PT3 e impostazione della tabella delle note
 * @parm void
 * @return void
 */
void inizializePT3()
{
	PT3_Init();				   // Inizializza il Player PT3
	PT3_SetNoteTable(PT3_NT2); // Setta la tabella delle note
	PT3_SetLoop(TRUE);
	PT3_InitSong(g_DataMusic);
}

/**
 * @brief Impostazione del riproduttore ayfx e del canale audio
 * @param void
 * @return void
 */
void inizializeAYFX()
{
	ayFX_InitBank(g_ayfx_bank);		// Impostazione del riproduttore ayFX tramite l'array g_ayfx_bank
	ayFX_SetChannel(PSG_CHANNEL_A); // Impostare il canale da utilizzare per la riproduzione del suono
	ayFX_SetMode(AYFX_MODE_FIXED);	// Set channel mode
}

/**
 * @brief Mette in pausa la musica
 * @param void
 * @return void
 */
void pausePT3Music()
{
	PT3_Pause();
	PT3_UpdatePSG();
}

/**
 * @brief Fa ripartire la musica dal punto dove si è interrotta
 * @param void
 * @return void
 */
void restorePT3Music()
{
	PT3_Resume();
	PT3_UpdatePSG();
}

/**
 * @brief Arresta la riproduzione della musica e degli effetti sonori
 * @param void
 * @return void
 */
void stopMusicPlayback()
{
	ayFX_Mute();
	ayFX_Update();
	PT3_Mute(PT3_STATE_MUTE_A, TRUE);
	PT3_Pause();
	PT3_UpdatePSG();
}

/**
 * @brief Effettua il restore dei livelli di gioco
 * @param void
 * @return void
 */
void restoreLevel()
{
	for (u8 level = 0; level < (int)(sizeof(g_Levels) / sizeof(g_Levels[0])) - 1; level++)
	{
		for (u8 element = 0; element < 10; element++)
		{
			g_Levels[level].MyItems[element].x = 0;
			g_Levels[level].MyItems[element].y = 0;
			g_Levels[level].MyItems[element].tile = 0;
			g_Levels[level].MyItems[element].visible = 0;
		}
	}
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