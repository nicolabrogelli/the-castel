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

#include "compress/pletter.h"
#include "version.h"

#include "tiles.h"
#include "tiles_defs.h"
#include "inventory.h"
#include "control.h"
#include "music.h"
#include "level_defs.h"

//

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
	u8 SpriteId;
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
struct CharacterEnemy g_platform[1];

u8 g_PrevRow8 = 0xFF;
u8 g_PawnCount = 0;
u8 g_PrevDirection = 0;
u8 g_ReverseCount = 0;
u8 g_CurrRoomIdx = 0;
u8 g_GhostCount = 0;
u8 g_SpiderCount = 0;
u8 g_BatCount = 0;
u8 g_SlideCount = 0;
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
u8 g_Fire = 1;

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
 * @brief Si effettua la lettura della tastiera
 * @param void
 * @return void
 */
void readInputControl()
{
	u8 row8 = Keyboard_Read(8);

	g_Player.Input = 0;
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

	g_PrevRow8 = row8;
}

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
			removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
			if (enemy->State == 1)
			{
				if (collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY))
				{
					if (hasItemInInventory(TILE_CRUCIFIX))
					{
						// TODO: elimina il nemico
						VDP_HideSprite(enemy->SpriteId);
						enemy->State = 0;
						removeItemFromInventory(TILE_CRUCIFIX, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
					}
					else
					{
						g_ReverseCount = 60;
						if (removeLife() == TRUE)
						{
							displayLife();
							PlayBankSFX(9, 0);
							/* 							Print_DrawTextAt(20,21,"ENEMY!!! ");
														Print_DrawTextAt(20,22,enemy->TypeEnemy);
														Print_DrawIntAt(20,23,enemy->SpriteId); */
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
				}
			}
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
	case TILE_CRUCIFIX:
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		replaceAndRemoveItem(x, y, tile, TILE_EMPTY);
		PlayBankSFX(5, 0);

		return TRUE;
		/*
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
	addItemToInventory(tile, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	removeItemFromInventory(key, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
		setTile(x, y, EMPTY_ITEM);
		foo(x, y, TILE_MASK_MONEY, 1); // Per il momento non posso spostare questa funzione, in quanto dovrei duplicare la chiamata the tile

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
	/* 	Print_DrawIntAt(20,22,g_DangerCounter);
		Print_DrawIntAt(20,23,g_DelayRemoveLife); */
	switch (getTile(x, y))
	{
	case TILE_DANGE1:
	case TILE_DANGE2:
	case TILE_DANGE3:
	case TILE_DANGE4:
		if (hasLives())
		{
			removeLife();
			displayLife();
			PlayBankSFX(9, 0);
			drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
		}
		else
		{
			stopMusicPlayback();
			Game_SetState(State_GameOver);
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
				drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
				Print_DrawTextAt(20, 22, "LAVA!!!  ");
			}
		}
		return TRUE;

	default:
		g_DelayRemoveLife = g_DangerCounter;
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
	g_SlideCount = 0;

	// Ad ogni cambio di livello rimuove l'amphora dall'inventario, in modo da ridurlo ad un aiuto momntaneo
	if (hasItemInInventory(TILE_AMPHORA))
		removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);

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
				g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Enemy[0], 196, FIRST_ID_SKELETOR, riga, colonna, 0, "Scheletor");
				DEBUG_LOG("Scheletor");
			}
			else if ((tile == TILE_POS_GHOST) && (g_Levels[0].MyEnemyType.GhostNumber < MAX_GHOST)) // Rilevamento della posizione iniziale del nemico
			{
				g_GhostCount = positionGenericEnemy(TILE_POS_GHOST, g_GhostCount, &g_Ghost[0], 200, FIRST_ID_GHOST, riga, colonna, 0, "Ghost");
				DEBUG_LOG("Ghost");
			}
			else if ((tile == TILE_POS_SPIDER) && (g_Levels[0].MyEnemyType.SpiderNumber < MAX_SPIDER)) // Rilevamento della posizione iniziale del nemico
			{
				g_SpiderCount = positionGenericEnemy(TILE_POS_SPIDER, g_SpiderCount, &g_Spider[0], 192, FIRST_ID_SPIDER, riga, colonna, 0, "Spider");
				DEBUG_LOG("Spider");
			}
			else if ((tile == TILE_POS_BAT) && (g_Levels[0].MyEnemyType.BatNumber < MAX_BAT)) // Rilevamento della posizione iniziale del nemico
			{
				g_BatCount = positionGenericEnemy(TILE_POS_BAT, g_BatCount, &g_Bat[0], 204, FIRST_ID_BAT, riga, colonna, 0, "Bat");
				DEBUG_LOG("Bat");
			}
			else if (tile == TILE_POS_PLATFORM) // Rilevamento piattaforma mobile
			{
				g_SlideCount = positionGenericEnemy(TILE_POS_PLATFORM, g_SlideCount, &g_platform[0], 208, FIRST_ID_SLIDE, riga, colonna, 0, "platform");
				DEBUG_LOG("Platform");
			}
		}
	}

	hideSprite(0, MAX_NUMBRER_SPRITE_HIDE, FIRST_ID_SPRITE);
/* 	hideSprite(g_SlideCount, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE);
	hideSprite(g_PawnCount, MAX_ENEMY, FIRST_ID_SKELETOR);
	hideSprite(g_GhostCount, MAX_GHOST, FIRST_ID_GHOST);
	hideSprite(g_SpiderCount, MAX_SPIDER, FIRST_ID_SPIDER);
	hideSprite(g_BatCount, MAX_BAT, FIRST_ID_BAT); */

	if (levelIdx == 0)
	{
		// TODO: non visualizzo i dati del risultato della partita
	}
	else
	{
		updateScore();

		if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
			displayItemToInventory(g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);

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
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name)
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

			managementSprite(x, y, baseSprite, enemyCount, idxSprite);

			spritePosition(x, y, &enemy[0], baseSprite, enemyCount, Name);

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
void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type)
{
	struct CharacterEnemy *generic = &genericEnemy[enemyCount];
	generic->X = x * 8;
	generic->Y = (y - 1) * 8;
	generic->Direction = (g_GameFrame % 2) ? 1 : -1;
	generic->TypeEnemy = type;
	generic->SpriteId = baseSprite + enemyCount;
	generic->State = 1;
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
 * @brief Verifica che il player sia posizionato sulla piattaforma
 */
bool isOnPlatform(u8 *X, u8 *Y)
{

	if ((*X < g_platform[0].X - 16) || (*X > g_platform[0].X + 16))
	{
		// TODO: Non facio nulla
	}
	else
	{
		if ((*Y + 17 > g_platform[0].Y) && (*Y + 17 < g_platform[0].Y + 8))
		{
			*Y = g_platform[0].Y - 16;
			return TRUE;
		}
	}
	return FALSE;
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

	/* 	bool onPlatform = FALSE;

		onPlatform = isOnPlatform(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY);

		if (onPlatform)
		{
			//bFalling = FALSE;
			g_Player.VelocityY = 0;
		}
	 */

	// Update player animation & physics
	u8 act = ACTION_IDLE;
	if (ply->bInAir && (ply->VelocityY >= 0))
	{
		act = ACTION_JUMP;
	}
	else if (ply->bInAir)
	{
		if (isOnPlatform(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY))
		{
			act = ACTION_IDLE;
			ply->DY +=2;
		}
		else
		{
			act = ACTION_FALL;
		}
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
		}

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
		// Modifico al volo il livello di gioco, cosi non sono costretto
		// a creare una cache dei livelli.
		g_CountItem++;
		g_Player.Score++;
		updateScore();

		PlayBankSFX(11, 15);
	}

	// Controllo se il player è in una situazione di pericola
	// Print_DrawIntAt(23,20,g_Player.Pawn.PositionY);
	if (isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12, 1) ||
		isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4, 1))
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

	setChannel();

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

	if (g_GameFrame % 2 == 0)
	{

		/* 		// Controllo se è stato premuto fire
				u8 row3 = Keyboard_Read(3);
				u8 fireMask = 0;
				if (row3 == 247)
				{
					Game_Pawn *pawn = &g_Player.Pawn;
					if (getTile(pawn->PositionX + g_Fire, pawn->PositionY) == 0)
					{
						setTile(pawn->PositionX + g_Fire, pawn->PositionY, TILE_CRUCIFIX);
						fireMask = g_Fire - 1;
						g_Fire++;
						setTile(pawn->PositionX + fireMask, pawn->PositionY, 0);

					}
				}  */

		g_DangerCounter++;

		// pursuitCheck(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);

		// Funzione: updateSkeleton
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber, FIRST_ID_SKELETOR);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndEnemy
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);

		// pursuitCheck(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber, FIRST_ID_GHOST);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);

		// pursuitCheck(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber, FIRST_ID_SPIDER);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);

		// pursuitCheck(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);

		// Funzione: updateGhost
		// Aggiorna il rendering dei nemici.
		updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber, FIRST_ID_BAT);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndGhost
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);

		// Funzione: updateGenericEnemy
		// Aggiorna il rendering della piattaforma.
		updateGenericEnemy(&g_platform[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumber, FIRST_ID_SLIDE);
	}
	g_Frame++;

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
// PLETTER
//=============================================================================
void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset)
{
	Pletter_UnpackToVRAM(src, g_ScreenPatternLow + (offset * 8));
}

//=============================================================================
// MAIN LOOP
//=============================================================================

void VSyncCallback()
{
	PT3_Decode();	 // Update data to write to the PSG regiters from the music
	ayFX_Update();	 // Overwrite PSG registers data for the SFX
	PT3_UpdatePSG(); // Update PSG registers
}

void main()
{
	DEBUG_INIT();
	DEBUG_LOG("Start debug session!");

	Game_SetVSyncCallback(VSyncCallback);

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