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
#include "math.h"
#include "debug.h"
#include "string.h"
#include "input.h"
#include "version.h"

//=============================================================================
// INCLUDES PERSONALIZZATI
//=============================================================================
#include "the_castel.h"
#include "data/level/level018.h"
#include "data/bg_tileset.h"
#include "data/sprt_player.h"

//=============================================================================
// DEFINES
//=============================================================================

#define FORCE 20
#define GRAVITY 1
#define GROUND 192
#define JOY_PORT_1	0b00000011
#define JOY_PORT_2	0b01001100

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
	Game_Pawn Pawn;
};

// Prototypes
bool State_Initialize();
bool State_Game();
bool State_Pause();

u8 getTile(u8 x, u8 y);
void setTile(u8 x, u8 y, u8 tile);
void setTileByTileCoord(u8 x, u8 y, u8 tile);
void PhysicsEventEnemy(u8 event, u8 tile);
bool PhysicsCollision(u8 tile);
void SetColorTiles();
bool Interact(u8 x, u8 y);
void DrawLevel(/*u8 levelIdx*/);
void InitCharacter(struct Character *ply, u8 id);
void UpdateCharacter(struct Character *ply);
void UpdateCharacterEnemy(struct Character *ply);
void VDP_LoadSpritePattern16_VSym(const u8 *src, u8 index, u8 count);
bool isMoveRight(u8 row8);
bool isMoveLeft(u8 row8);
bool isMoveJump(u8 row8);
bool isInteractObject(u8 row8);

//.............................................................................
// Player 1 data

// Player's sprite layers
// This character is made by 3 layers (3 sprites) but the first two are special: One is only visible on even frames while the second only on odd frames.
// So, on the 3 layers, only two are visible at a given frame. The blinking of the first two black layers is done to create shaded colors.
// The counterpart is the flickering effect. The character white color comes from the background and is not in a sprite.
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

// Animazione Move
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_PlayerFramesMove[] =
	{
		{MOVE_PLAYER_FRAME_0, 4, NULL},
		{MOVE_PLAYER_FRAME_1, 4, NULL},
		{MOVE_PLAYER_FRAME_2, 4, NULL},
		{MOVE_PLAYER_FRAME_3, 4, NULL},
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

//.............................................................................
// Enemy data

// Pawn sprite layers
const Game_Sprite g_EnemySpriteLayers[] =
	{
		{1, 0, 0, 0, COLOR_BLACK, PAWN_SPRITE_EVEN},
		{1, 0, 0, 12, COLOR_BLACK, PAWN_SPRITE_ODD},
		{1, 0, 0, 4, COLOR_WHITE, 0},
		{5, 0, 0, 8, COLOR_DARK_RED, 0},
};

// Animazione Idle
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_EnemyFramesIdle[] =
	{
		{IDLE_ENEMY_FRAME_12, 64, NULL},
		{IDLE_ENEMY_FRAME_11, 24, NULL},
};

// Animazione Move
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_EnemyFramesMove[] =
	{
		/* 		{MOVE_ENEMY_FRAME_7, 4, NULL},
				{MOVE_ENEMY_FRAME_8, 4, NULL},
				{MOVE_ENEMY_FRAME_9, 4, NULL},
				{MOVE_ENEMY_FRAME_10, 4, NULL}, */
		{IDLE_ENEMY_FRAME_12, 10, NULL},
		{IDLE_ENEMY_FRAME_11, 10, NULL},
};

// Animazione Jump
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_EnemyFramesJump[] =
	{
		{JUMP_ENEMY_FRAME_11, 4, NULL},
};

// Animazione Fall
// Ogni riga descrive una parte dell'animazione
const Game_Frame g_EnemyFramesFall[] =
	{
		{FALL_ENEMY_FRAME_11, 4, NULL},
};

// Lista di tutte le animazioni dei nemici
const Game_Action g_EnemyAnimActions[] =
	{
		//  Frames        Number                  Loop?  Interrupt?
		{g_EnemyFramesIdle, numberof(g_EnemyFramesIdle), TRUE, TRUE},
		{g_EnemyFramesMove, numberof(g_EnemyFramesMove), TRUE, TRUE},
		{g_EnemyFramesJump, numberof(g_EnemyFramesJump), TRUE, TRUE},
		{g_EnemyFramesFall, numberof(g_EnemyFramesFall), TRUE, TRUE},
};

//=============================================================================
// MEMORY DATA
//=============================================================================

struct Character g_Player;
struct Character g_Enemy;

// bool g_bFlicker = TRUE;
u8 g_PrevRow3 = 0xFF;
u8 g_PrevRow8 = 0xFF;

u8 prevDirection = 0;

/** \struct
	struct: Struttura che rappresenta la stanza
*/
struct LevelDefinition
{
	u8 X;			  /** Coordinata Y della stanza */
	u8 Y;			  /** Coordinata Y della stanza */
	u8 Width;		  /** Larghezza della stanza*/
	u8 Height;		  /** Altezza della stanza */
	const u8 *Layout; /** Layout della stanza */
	const c8 *Name;	  /** Nome della stanza */
	u8 NextLvlIdx;	  /** Livello successivo */
	u8 PrevLvIdx;	  /** Livello precedente */
};

// Elenco delle stanze e delle loro caratteristiche
const struct LevelDefinition g_Levels[] = {
	{(32 - LEVEL018_WIDTH) / 2, (24 - LEVEL018_HEIGHT) / 2, LEVEL018_WIDTH, LEVEL018_HEIGHT, g_Level018, "Livello 0", 1, 0},
};

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
void PhysicsEventPlayer(u8 event, u8 tile)
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
 * @brief Gestione degli eventi fisici
 * @param u8 event Evento da gestire
 * @param u8 title Tile sulla quale si deve gestire l'evento
 * @return void
 */
void PhysicsEventEnemy(u8 event, u8 tile)
{
	tile;
	switch (event)
	{
	case PAWN_PHYSICS_BORDER_DOWN: // Handle downward collisions
	case PAWN_PHYSICS_COL_DOWN:
		g_Enemy.bInAir = FALSE;
		break;

	case PAWN_PHYSICS_FALL: // Handle falling
		if (!g_Enemy.bInAir)
		{
			g_Enemy.bInAir = TRUE;
			g_Enemy.VelocityY = 0;
		}
		break;
	};
}

/**
 * @brief Si intercetta la collisione
 * @param u8 tile Tile sulla quale verificare se si deve gestire una collisione
 * @return bool TRUE se si verifica la collisione
 */
bool PhysicsCollision(u8 tile)
{
	return (tile > 100);
}

/**
 * @brief Imposta i colori delle tiles
 * @param void
 * @return void
 */
void SetColorTiles()
{
	VDP_FillVRAM_16K(0x60, g_ScreenColorLow + 9, 1);  // ROSSO CHIARO
	VDP_FillVRAM_16K(0xA0, g_ScreenColorLow + 12, 1); // GIALLO SCURO
	VDP_FillVRAM_16K(0xE0, g_ScreenColorLow + 18, 1); // GRIGIO
}

/**
 * @brief Interagisce in una determinata posizione
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return
 */
bool Interact(u8 x, u8 y)
{
	u8 tile = getTile(x, y);

	DEBUG_LOGNUM("Intercat", tile);

	switch (tile)
	{
	case TILE_HEART:
		setTile(x, y, EMPTY_ITEM);
		Print_DrawTextAt(0, 23, "                            ");
		Print_DrawTextAt(0, 23, "LOVE!!");
		return TRUE;
	case TILE_DOOR1:
	case TILE_DOOR:
		Print_DrawTextAt(0, 23, "                            ");
		Print_DrawTextAt(0, 23, "PORTA!!");
		// DrawLevel();
		return FALSE;
	case TILE_KEY3:
		Print_DrawTextAt(0, 23, "                            ");
		Print_DrawTextAt(0, 23, "CHIAVE!!");
		return TRUE;
	}
	return FALSE;
}

/**
 * @brief Si disegna il livello di gioco
 * @param u8 levelIdx Indice del livello da visualizzare
 */
void DrawLevel(/*u8 levelIdx*/)
{
	u8 levelIdx = 0;

	// g_CurrLevelIdx = levelIdx;

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
			else if (tile == TILE_STAR_POS_ENEMY) // Rilevamento della posizione iniziale del nemico
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
				GamePawn_SetPosition(&g_Enemy.Pawn, x * 8, (y - 3) * 8);

				setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
			}
		}
	}
}

/**
 * @brief Inizializza il pawn
 * @param struct Character *ply
 * @param u8 id - id del
 */
void InitCharacter(struct Character *ply, u8 id)
{
	Mem_Set(0, ply, sizeof(struct Character));

	Game_Pawn *pawn = &ply->Pawn;

	if (id == 0)
	{
		GamePawn_Initialize(pawn, g_PlayerSpriteLayers, numberof(g_PlayerSpriteLayers), 0, g_PlayerAnimActions);
		GamePawn_SetPosition(pawn, 255 - 16 - 16, 128);
		GamePawn_InitializePhysics(pawn, PhysicsEventPlayer, PhysicsCollision, 16, 16);
	}
	else
	{
		GamePawn_Initialize(pawn, g_EnemySpriteLayers, numberof(g_EnemySpriteLayers), 0, g_EnemyAnimActions);
		GamePawn_SetPosition(pawn, 16, 128);
		GamePawn_InitializePhysics(pawn, PhysicsEventEnemy, PhysicsCollision, 16, 16);
	}
}

/**
 * @brief Aggiorna il pawn
 * @param struct Character *ply
 */
void UpdateCharacter(struct Character *ply)
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
		if (prevDirection != INPUT_RIGHT)
		{
			prevDirection = INPUT_RIGHT;
			VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_1, 4 * 4 * 0, 4 * 4 * 2);
			VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
			VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);
		}
	}
	else if (ply->Input & INPUT_LEFT)
	{
		ply->DX--;
		ply->bMoving = TRUE;

		// TODO: imposta direzione sinistra, solo se
		//		 è impostata la direzione destra
		if (prevDirection != INPUT_LEFT)
		{
			prevDirection = INPUT_LEFT;
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_1, 4 * 4 * 0, 4 * 4 * 2);
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
			VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);
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
		if (Interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) || Interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
		{
			// TODO: vediamo!
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
 * @brief Aggiorna il pawn
 * @param struct Character *ply
 */
void UpdateCharacterEnemy(struct Character *ply)
{
	// Update movement
	ply->DX = 0;
	ply->DY = 0;

	if (ply->Input & INPUT_RIGHT)
	{
		ply->DX++;
		ply->bMoving = TRUE;
	}
	else if (ply->Input & INPUT_LEFT)
	{
		ply->DX--;
		ply->bMoving = TRUE;
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
 * @brief VDP_LoadSpritePattern16_VSym
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
 * @return void
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
	SetColorTiles();

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

	// TDOD: sprite Player , direzone sx
	//                           Source data                      SprtID     Num
	/*  	VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_1, 4 * 4 * 0, 4 * 4 * 2);
		VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_4, 4 * 4 * 2, 4 * 4 * 3);
		VDP_LoadSpritePattern16_VSym(g_DataSprtLayer + FRAME_9, 4 * 4 * 5, 4 * 4 * 2);  */

	// Function: VDP_LoadSpritePattern
	// Carica i dati dei modelli di sprite nella VRAM. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   addr  - Indirizzo di origine per i modelli di sprite (in RAM/ROM).
	//   index - Indice del primo modello di sprite VRAM da copiare (in modalità 16x16, si possono usare solo multipli di 4).
	//   count - Numero di modelli da copiare (la modalità 8x8 usa 1 per ogni forma di sprite, mentre la modalità 16x16 ne usa 4).
	//
	// Sprite Pattern Table = 0x3800
	// TDOD: sprite Enemy
	//                    Source data                      SprtID      Num
	/* 	VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_1, 4 * 4 * 7, 4 * 4 * 2);
		VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_4, 4 * 4 * 9, 4 * 4 * 3);
		VDP_LoadSpritePattern(g_DataSprtLayer + FRAME_9, 4 * 4 * 12, 4 * 4 * 2);  */

	VDP_WriteVRAM_16K(g_DataSprtLayer, g_SpritePatternLow, sizeof(g_DataSprtLayer));

	// Funzione: InitCharacter
	// Inizzializza lo sprite del giocatore
	//
	// Parametri:
	//  Character - indirizzo della truruttura che rappresenta il giocatore
	//  id del giorcatore
	InitCharacter(&g_Player, 0);

	// Funzione: InitCharacter
	// Inizzializza lo sprite del nemico
	//
	// Parametri:
	//  Character - indirizzo della truruttura che rappresenta il nemico
	InitCharacter(&g_Enemy, 1);

	// Funzione: DrawLevel
	// Inizzializza il livello di gioco
	//
	// Parametri:
	//  u8 levelIdx - rappresenta l'id del livello
	DrawLevel();

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
	// Funzione: GamePawn_Draw
	// Aggiorna il rendering del pedone. Deve essere richiamato una volta per fotogramma.
	//
	// Parametri:
	//   pawn - Indirizzo della struttura Pawn del pedone da aggiornare (spostamento, collisione, ecc.).
	GamePawn_Draw(&g_Player.Pawn);

	// Funzione: GamePawn_Draw
	// Aggiorna il rendering del pedone. Deve essere richiamato una volta per fotogramma.
	//
	// Parametri:
	//   pawn - Indirizzo della struttura Pawn del pedone da aggiornare (spostamento, collisione, ecc.).
	GamePawn_Draw(&g_Enemy.Pawn);

	// Funzione: UpdateCharacter(&g_Player);
	// Aggiorna il rendering del pedone. Deve essere richiamato una volta per fotogramma.
	//
	// Parametri:
	//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
	UpdateCharacter(&g_Player);

	// Funzione: UpdateCharacter(&g_Enemy);
	// Aggiorna il rendering del pedone. Deve essere richiamato una volta per fotogramma.
	//
	// Parametri:
	//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
	UpdateCharacterEnemy(&g_Enemy);

	// Print_DrawTextAt(0,23,&g_Player.Pawn.PhysicsState);

	// Aggiurnamento input da tastiera
	u8 row3 = Keyboard_Read(3);
	u8 row8 = Keyboard_Read(8);

	g_Player.Input = 0;
	if (isMoveRight(row8))
	{
		g_Player.Input |= INPUT_RIGHT;
	}
	if (isMoveLeft(row8)) {
		g_Player.Input |= INPUT_LEFT;
	}
	if(isMoveJump(row8)) {
		g_Player.Input |= INPUT_JUMP;
	}
	if(isInteractObject(row8)) {
		g_Player.Input |= INPUT_GET;
	}


	/* 		u8 frameCounter = 0;
			if (frameCounter % 4 == 0)
			{
				g_Enemy.Input |= INPUT_RIGHT;
				UpdateCharacterEnemy(&g_Enemy);
			}
			frameCounter++; */

	// TODO: questa parte di codice dovrà poi essere sostituita
	//		 con un automatismo che permetta di far muovere lo
	//	     sprite del nemico
	g_Enemy.Input = 0;
	if (IS_KEY_PRESSED(row3, KEY_D))
		g_Enemy.Input |= INPUT_LEFT;
	if (IS_KEY_PRESSED(row3, KEY_G))
		g_Enemy.Input |= INPUT_RIGHT;
	if (IS_KEY_PRESSED(row3, KEY_F))
		g_Enemy.Input |= INPUT_JUMP;

	g_PrevRow3 = row3;
	g_PrevRow8 = row8;

	if (Keyboard_IsKeyPressed(KEY_ESC))
		Game_Exit();

	return TRUE;
}

//=============================================================================
// GESTIONE DELLA TATIERA E JOY
//=============================================================================

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
bool isMoveJump(u8 row8) {
	bool isJump = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_UP) || (Joystick_IsButtonPressed(JOY_PORT_1,JOY_INPUT_TRIGGER_A) ) || (Joystick_IsButtonPressed(JOY_PORT_2,JOY_INPUT_TRIGGER_A)))
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
bool isInteractObject(u8 row8) {
	bool isGet = FALSE;
	if (IS_KEY_PRESSED(row8, KEY_SPACE) || (Joystick_IsButtonPressed(JOY_PORT_1,JOY_INPUT_TRIGGER_B) ) || (Joystick_IsButtonPressed(JOY_PORT_2,JOY_INPUT_TRIGGER_B)))
	{
		g_Player.Input |= INPUT_GET;
		isGet = TRUE;
	}

	return isGet;
}

//-----------------------------------------------------------------------------
//
bool State_Pause()
{
	return TRUE;
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
