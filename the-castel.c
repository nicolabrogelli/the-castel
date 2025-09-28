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

#include "tiles.h"
#include "tiles_defs.h"
#include "level_defs.h"
#include "enemy.h"
#include "character.h"



//=============================================================================
// SEGMENT 3, BANK 1
//=============================================================================
extern void initInventory();
extern bool addItemToInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
extern bool removeItemFromInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
extern void displayItemToInventory(u8 levelX, u8 levelY, u8 levelHeight);
extern bool hasItemInInventory(u8 item);
extern void takeActionWithCheck(u8 x, u8 y, u8 tile, u8 checkTile, u8 newTile);
extern void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask);
extern void initLife();
extern bool removeLife();
extern void displayLife();
extern bool addLife();
extern bool hasLives();
extern bool isDanger(u8 x, u8 y);
extern bool handleUnderwater(u8 PositionX, u8 PositionY);

//=============================================================================
// SEGMENT 4, BANK 1
//=============================================================================
extern void drawMessageWithTimer(u8 x1, u8 y1, u8 x2, u8 y2,const char* messaggio, const char* format,	int value);   
extern void updateScore(u16 score);
extern void messageInGame(char *message);
extern bool isOnPlatform(u8 *X, u8 *Y, u8 slideCount, struct CharacterEnemy *platform);
extern bool getItem(u8 x, u8 y);
extern void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite);
extern void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 nEnemy);
extern void setColorTiles();
extern void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape);
extern void hideSprite(u8 count, u8 maxElement, u8 baseSprite);
extern void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV);
extern bool collisionCheck(i8 dx, i8 dy);
extern bool isMoveRight(u8 row8, u8 input);
extern bool isMoveLeft(u8 row8, u8 input);
extern bool isMoveJump(u8 row8, u8 input);
extern bool isInteractObject(u8 row8, u8 input);
extern void WaitVBlank();
extern void VSyncCallbackBanck();
extern void readInputControl(struct Character* player);
extern u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, 
	u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 moveHV);

extern bool handleItemCollection(u8 x, u8 y1, u8 y2);

//=============================================================================
// SEGMENT 5, BANK 1
//=============================================================================
extern const unsigned char g_Level014[32*24];
extern const unsigned char g_Level015[32*24];
extern const unsigned char g_Level016[32*24];
extern const unsigned char g_Level018[32*24];
extern const unsigned char g_Level019[32*24];
extern const unsigned char g_Level020[32*24];
extern const unsigned char g_Level021[32*24];
extern const unsigned char g_Level022[32*24];
extern const unsigned char g_Level023[32*24];
extern const unsigned char g_Level024[32*24];
extern const unsigned char g_Level025[32*24];
extern const unsigned char g_Level026[32*24];
extern const unsigned char g_Level027[32*24];
extern const unsigned char g_Level029[32*24];
extern const unsigned char g_Level030[32*24]; 

//=============================================================================
// SEGMENT 6, BANK 1
//=============================================================================
extern const unsigned char g_Level001[32*24];
extern const unsigned char g_Level002[32*24];
extern const unsigned char g_Level003[32*24];
extern const unsigned char g_Level004[32*24];
extern const unsigned char g_Level005[32*24];
extern const unsigned char g_Level006[32*24];
extern const unsigned char g_Level007[32*24];
extern const unsigned char g_Level008[32*24];
extern const unsigned char g_Level009[32*24];
extern const unsigned char g_Level010[32*24];
extern const unsigned char g_Level011[32*24];
extern const unsigned char g_Level012[32*24];
extern const unsigned char g_Level013[32*24];

//=============================================================================
// SEGMENT 7, BANK 1
//=============================================================================
extern const char g_DataBackground_Patterns[];
extern const char g_DataSprtLayer[];
extern void InizializeFont();

//=============================================================================
// SEGMENT 8, BANK 1
//=============================================================================
extern void inizializePT3();
extern void restorePT3Music();
extern void updatePT3();
extern void stopMusicPlayback();
extern void PlayBankSFX(u8 id, u8 prio);
extern void inizializeAYFX();
extern void setChannel();
extern void updateAYFX();
extern void SetSong(u8 songId);


enum INPUT_ACTION
{
	INPUT_RIGHT = 0b00000001,
	INPUT_LEFT = 0b00000010,
	INPUT_JUMP = 0b00000100,
	INPUT_GET = 0b00001000,
};

//=============================================================================
// INCLUDES PERSONALIZZATI
//=============================================================================
#include "the-castel.h"

unsigned char g_LevelUncompress[LEVEL_SIZE];

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
struct CharacterEnemy g_Skeletor[MAX_ENEMY];
struct CharacterEnemy g_Ghost[MAX_GHOST];
struct CharacterEnemy g_Spider[MAX_SPIDER];
struct CharacterEnemy g_Bat[MAX_BAT];
struct CharacterEnemy g_platformV[MAX_SLIDING_PLATFORM];
struct CharacterEnemy g_platformH[MAX_SLIDING_PLATFORM];

//u8 g_PrevRow8 = 0xFF;
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
bool g_IsUnderWater = FALSE;
// bool g_IsDanger = FALSE;

u8 testCountPosition = 0;
bool g_PlayerDiedFromFall = FALSE;
bool g_WasOnPlatform = FALSE;
u8 g_LastSafeY = 0;

// Oppure un sistema unificato
typedef enum {
	DIFFICULTY_EASY = 0,    // Nessun danno da caduta
	DIFFICULTY_NORMAL = 1,  // Solo danno da altezza
	DIFFICULTY_HARD = 2     // Tutti i danni
} DifficultyLevel;

DifficultyLevel g_GameDifficulty = DIFFICULTY_EASY;

/*
 u8 g_CatchEnemy = 0;
 u8 g_DelayCatchEnemy = 0;
 bool isCatch = FALSE;
*/

bool g_RefreshInventary = FALSE;
u8 g_TimetoDeath = TIME_TO_DEATH;
u8 g_LevelPrev = 0; // 0 = livello successivo da porta , 1 = livello precedente da porta, 2 = livello scucceivo da scensore, 3 = livello precedente da ascensore
u8 g_GameFrame = 0;
u8 g_PreviousSegment = 0;
u8 b_act = ACTION_IDLE;

//unsigned char g_Lives[MAX_LIVES] = {0, 0, 0};

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


        // TODO: Check for fall damage
	    // Non mi piace tenerla qui, vediamo se la posso spostare nel loop pronciapale
        if ((g_GameDifficulty >= DIFFICULTY_HARD) && g_Player.FallStartY > 0 && (g_Player.Pawn.PositionY - g_Player.FallStartY) > g_Player.FallDamageThreshold) {
            SetActiveSegment(3);
            bool isRemove = removeLife();
            if(isRemove)
            {
                g_Player.Life--;
				g_PlayerDiedFromFall = TRUE;
                g_Player.FallStartY = 0;
                g_Player.FallDamageThreshold = FALL_DEAD;


            } else {
            	bool hasLivesLeft = hasLives();
            	if (!hasLivesLeft)
            	{
            		Game_SetState(State_GameOver);
            	}
            }
        	SetActiveSegment(0);
        }
		break;

	case PAWN_PHYSICS_FALL: // Handle falling
		if (!g_Player.bInAir)
		{
			g_Player.bInAir = TRUE;
			g_Player.VelocityY = 0;

			// TODO: Check for fall damage
			g_Player.FallStartY = g_Player.Pawn.PositionY; // Registra l'inizio della caduta
            g_Player.FallDamageThreshold = FALL_DEAD; // Example: 8 tiles high fall causes damage. Adjust as needed
`
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
 * @brief Si intercetta la collisione di un nemico con una tiles (OTTIMIZZATA)
 * @param u8 x asse X
 * @param u8 y asse y
 * @return TRUE se si verifica la collisione
 */
bool physicsCollisionEnemy(u8 x, u8 y)
{
	return (( getTile(x, y) >= 100) /*|| getTile(x, y) == 0 */);
}

/**
 * @brief Gestisce una probabile collisione tra il Player e un generico nemico (OTTIMIZZATA)
 * @param struct Character *ply Puntatore al player
 * @param struct CharacterEnemy *genericEnemy Puntatore all'array dei nemici
 * @param u8 enemyNumber Numero dei nemici nel livello
 * @return void
 */
void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber)
{
    Game_Pawn *pawn = &ply->Pawn;

    for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
    {
        struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
        if (enemy->State != 1)
            continue;

        SetActiveSegment(4);
        bool isCollision = collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY);
        SetActiveSegment(0);

        if (!isCollision)
            continue;

        SetActiveSegment(3);
        bool hasAmphora = hasItemInInventory(TILE_AMPHORA);

        if (hasAmphora)
        {
            if (g_ImmunityCount < IMMUNITY)
            {
                g_ImmunityCount++;
            }
            else
            {
                removeItemFromInventory(TILE_AMPHORA,  LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);
                g_ImmunityCount = 0;
            }
            continue;
        }
        bool hasCrucifix = hasItemInInventory(TILE_CRUCIFIX);
        SetActiveSegment(0);

        if (hasCrucifix)
        {
            SetActiveSegment(4);
            VDP_HideSprite(enemy->SpriteId);
			updateScore(g_Player.Score); // g_Levels[g_CurrRoomIdx].Name
            SetActiveSegment(0);
            enemy->State = 0;
            
            SetActiveSegment(3);
            removeItemFromInventory(TILE_CRUCIFIX,  LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);
            SetActiveSegment(0);

            g_Player.Score += 500;
			
            continue;
        }

        SetActiveSegment(3);
        bool isRemove = removeLife();
        if (isRemove)
        {
            g_Player.Life--;
            displayLife();
            drawLevel(g_CurrRoomIdx);
        }
        else
        {
            bool hasLivesLeft = hasLives();
            if (!hasLivesLeft)
            {
                Game_SetState(State_GameOver);
            }
        }

		// Qui funziona ma il suono è ritardato rispetto all'azione
		if (isRemove) {
			SetActiveSegment(8);
			PlayBankSFX(9,0);
			SetActiveSegment(0);
		}

		SetActiveSegment(0);
    }
}

/**
 * @brief Controlla che il player non sia sommerso dall'acqua (OTTIMIZZATA)
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
 * @brief Suona l'effetto impostato
 * @param u8 Effetto da suonare
 * @return void
 */
void playEffect(u8 idEffect) {
	SetActiveSegment(8);
	PlayBankSFX(idEffect,0);
	SetActiveSegment(0);
}

/**
 * @brief Interagisce in una determinata posizione (OTTIMIZZATA)
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @return bool TRUE se si compie una azione
 */
bool interact(u8 x, u8 y)
{
    u8 tile = getTile(x, y);
    if (tile < 60)
        return FALSE;

    switch (tile)
    {
    case TILE_HEART:
        SetActiveSegment(3);
        if (addLife())
        {
            SetActiveSegment(0);
            g_Player.Life++;
            ItemsTakenForLevel(x, y, TILE_MASK_HEART, 1);
            g_CountItem++;
            setTile(x, y, EMPTY_ITEM);
        }
        return TRUE;
    
    case TILE_DOOR0:
    case TILE_MASK_DOOR1:
    case TILE_MASK_DOOR2:
    case TILE_MASK_DOOR3:
    case TILE_DOOR_NEXT:
        g_LevelPrev = 0;
        drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
        return FALSE; //(tile == TILE_DOOR_NEXT) ? FALSE : TRUE;
    
    case TILE_DOOR_PREV:
        g_LevelPrev = 1;
        drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.PrevDoorLevel);
        return FALSE;
    
    case TILE_DOOR1:
    case TILE_DOOR2:
    case TILE_DOOR3:
    {
        u8 requiredKey = (tile == TILE_DOOR1) ? TILE_KEY1 : (tile == TILE_DOOR2) ? TILE_KEY2 : TILE_KEY3;
        u8 doorMask = (tile == TILE_DOOR1) ? TILE_MASK_DOOR1 : (tile == TILE_DOOR2) ? TILE_MASK_DOOR2 : TILE_MASK_DOOR3;
        
        if (tile == TILE_DOOR3 && g_CurrRoomIdx == 1)
        {
            SetActiveSegment(3);
            bool hasKey = hasItemInInventory(TILE_KEY1);
            SetActiveSegment(0);
            if (hasKey)
                Game_SetState(State_GameWinner);
            else {
				SetActiveSegment(4);
				messageInGame("Oops!");
				SetActiveSegment(0);
			}
        }
        else
        {
            SetActiveSegment(3);
            bool hasKey = hasItemInInventory(requiredKey);
            SetActiveSegment(0);
            
            if (hasKey)
                changeLevel(x, y, requiredKey, doorMask);
            else {
				SetActiveSegment(4);
				messageInGame("Is Closed!");
				SetActiveSegment(0);
			}
        }
        return FALSE; //TRUE;
    }
    
    case TILE_KEY1:
    case TILE_KEY2:
    case TILE_KEY3:
    {
        u8 keyMask = (tile == TILE_KEY1) ? TILE_MASK_KEY1 : (tile == TILE_KEY2) ? TILE_MASK_KEY2 : TILE_MASK_KEY3;
        SetActiveSegment(3);
		replaceAndRemoveItem(x, y, tile, keyMask);
		SetActiveSegment(0);

		playEffect(5);
        return TRUE;
    }
    
    case TILE_AMPHORA:
		SetActiveSegment(3);
        takeActionWithCheck(x, y, tile, TILE_AMPHORA, TILE_MASK_AMPHORA);
		SetActiveSegment(0);

		playEffect(17);
        return TRUE;
    
    case TILE_CRUCIFIX:
		SetActiveSegment(3);
        takeActionWithCheck(x, y, tile, TILE_CRUCIFIX, TILE_EMPTY);
        SetActiveSegment(0);

		playEffect(10);
		return TRUE;
    }

	SetActiveSegment(4);
    updateScore(g_Player.Score);
	SetActiveSegment(0);
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
	SetActiveSegment(3);
	removeItemFromInventory(key,  LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);
	SetActiveSegment(0);
	ItemsTakenForLevel(x, y, door, 1);
	g_CountItem++;

	g_LevelPrev = 0;
	drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
}


/**
 * @brief Routine per verificare se è oresente un varco per il passaggio di livello (OTTIMiZZATA)
 * @param u8 x Coordinata X
 * @param u8 y Coordinata Y
 * @return TRUE se è presente
 */
bool isPassage(u8 x, u8 y)
{
    u8 tile = getTile(x, y);

    if (tile == TILE_UP_DOOR || tile == TILE_DOWN_DOOR)
    {
        g_LevelPrev = 3;
        drawLevel(tile == TILE_UP_DOOR ? g_Levels[g_CurrRoomIdx].DoorLevel.UpDoorLevel : g_Levels[g_CurrRoomIdx].DoorLevel.DownDoorLevel);
        return TRUE;
    }
    
    return FALSE;
}


/**
 * @brief Effettua una copia temporanea dell'array del livello. Questa funzione non servira piu dopo l'elimiazione di Pletter
 * @param unsigned char* g_TempLevel Array copia
 * @param int g_CurrRoomIdx Numero della stanza
 * @param int size Dimensione della stanza
 */
void updateLevel(int g_CurrRoomIdx, int size) {

	int seg = 0;
	
	if(g_CurrRoomIdx < 14) 
		seg = 6;
	else
		seg = 5;

    SetActiveSegment(seg);

	Mem_Copy(g_Levels[g_CurrRoomIdx].Layout, g_CacheLevel[0].Layout,size); 
	
	
    SetActiveSegment(0);
}

/**
 * @brief Si disegna il livello di gioco
 * @param u8 levelIdx Indice del livello da visualizzare
 * @return void
 */
void drawLevel(u8 levelIdx)
{

	SetActiveSegment(8);
	if(levelIdx > START_GAME && levelIdx < LAST_LEVEL + 1)
		stopMusicPlayback();	
	else
		restorePT3Music();	
	
	SetActiveSegment(0);


	VDP_HideAllSprites();
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
	SetActiveSegment(3);
	bool hasAmphora = hasItemInInventory(TILE_AMPHORA);

	if (hasAmphora) {

		removeItemFromInventory(TILE_AMPHORA,  LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);

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

	updateLevel(g_CurrRoomIdx, LEVEL_SIZE);

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

		SetActiveSegment(4);
		for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
		{
			// Recupera la tile nella poszione indicata
			u8 tile = g_CacheLevel[0].Layout[g_CacheLevel[0].Width * riga + colonna];
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
				//Print_DrawIntAt(20,20,x*8);
				//Print_DrawIntAt(23,20,(y - 3) * 8);
				//Print_DrawIntAt(20,20,testCountPosition++);

				setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
				
			}
			else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber)) // Rilevamento della posizione iniziale del nemico
			{
				g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Skeletor[0], ADDRESS_SHELETOR, FIRST_ID_SKELETOR, riga, colonna, 0, "Scheletor", 0);
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


	hideSprite(g_PawnCount, MAX_ENEMY, FIRST_ID_SKELETOR);
	hideSprite(g_GhostCount, MAX_GHOST, FIRST_ID_GHOST);
	hideSprite(g_SpiderCount, MAX_SPIDER, FIRST_ID_SPIDER);
	hideSprite(g_BatCount, MAX_BAT, FIRST_ID_BAT);
	hideSprite(g_SlideCountH, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_H);
	hideSprite(g_SlideCountV, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_V);
	SetActiveSegment(0);

	if (levelIdx > 0)
	{
		SetActiveSegment(4);
		updateScore(g_Player.Score);
		SetActiveSegment(0);

		if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER && g_CurrRoomIdx != GAME_WINNER)
		{
			SetActiveSegment(3);
			displayItemToInventory( LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);
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

				//GamePawn_SetPosition(&g_Player.Pawn, x * 8, (y - 3) * 8);
				setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
			}
		}
	}

	VDP_EnableDisplay(TRUE);

}

/**
 * @brief Inizializza il pawn (OTTIMIZZATA)
 * @param struct Character *ply
 * @param u8 id Numero del Player
 * @return void
 */
void initCharacter(struct Character *ply, u8 id)
{
	Mem_Set(0, ply, sizeof(*ply));

	if (id == 0)
	{
		Game_Pawn *pawn = &ply->Pawn;
		GamePawn_Initialize(pawn, g_PlayerSpriteLayers, numberof(g_PlayerSpriteLayers), 0, g_PlayerAnimActions);
		GamePawn_SetPosition(pawn, 223, 128);
		GamePawn_InitializePhysics(pawn, physicsEventPlayer, physicsCollision, 16, 16);
	}
}


/**
 * @brief Aggiorna il pawn (OTTIMIZZATA)
 * @param struct Character *ply
 * @return void
 */
void updateCharacter(struct Character *ply) 
{
    // Reset movement
    ply->DX = 0;
    ply->DY = 0;
    u8 dir = 0, act = ACTION_IDLE;
    
    // Handle horizontal movement
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
    }
    else
    {
        ply->bMoving = FALSE;
    }

    // Handle vertical movement
    if (ply->bInAir) 
    {
 		ply->DY -= ply->VelocityY / 4;
		//ply->VelocityY = (ply->VelocityY - GRAVITY < -FORCE) ? -FORCE : ply->VelocityY - GRAVITY;

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
        //interactayFX_Update(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12);
		if(interact(ply->Pawn.PositionX + 8, ply->Pawn.PositionY + 12)) {
			//SetActiveSegment(8);
			//PlayBankSFX(5,0);
			//SetActiveSegment(0);
		}
    }

    // Determine animation state
    if (ply->bInAir)
    {
        if (ply->VelocityY >= 0)
        {
            act = ACTION_JUMP;
        }
        else
        {
            SetActiveSegment(4);
            if (((g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH || g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV) > 0) && 
                (isOnPlatform(&ply->Pawn.PositionX, &ply->Pawn.PositionY, g_SlideCountV, g_platformV) || 
                 isOnPlatform(&ply->Pawn.PositionX, &ply->Pawn.PositionY, g_SlideCountH, g_platformH)))
            {
                act = ACTION_IDLE;
                ply->DY += 2;

            	// AGGIORNA la posizione Y sicura quando sei su una piattaforma
				g_LastSafeY = ply->Pawn.PositionY;
            	if (!g_WasOnPlatform) {
                	g_Player.FallStartY = 0; // Reset solo se non stava già cadendo
            	}
            	g_WasOnPlatform = TRUE;
            }
            else
            {
                act = ACTION_FALL;
    			g_WasOnPlatform = FALSE;

            	// SE non c'era FallStartY impostato E la caduta è significativa
            	if ((g_GameDifficulty == DIFFICULTY_HARD) && g_Player.FallStartY == 0 && g_LastSafeY > 0) {
            		g_Player.FallStartY = g_LastSafeY; // Usa l'ultima posizione sicura
            		g_Player.FallDamageThreshold = FALL_DEAD;
            	}
            }
            SetActiveSegment(0);
        }
    }
    else //if (ply->bMoving)
    {
   		// IMPORTANTE: Reset quando non è in aria
        g_WasOnPlatform = FALSE;

        if (ply->bMoving)
        {
            act = (dir == 1) ? ACTION_MOVE_RIGHT : ACTION_MOVE;
        }
    }

    // Update character
    GamePawn_SetAction(&ply->Pawn, act);
    GamePawn_SetMovement(&ply->Pawn, ply->DX, ply->DY);
    GamePawn_Update(&ply->Pawn);

}

/**
 * @brief Raggruppo una serie di fuznioni (OTTIMIZZATA)
 * @param void
 * @return void
 */
void genericControl()
{
    u8 x = g_Player.Pawn.PositionX + 8;
    u8 y1 = g_Player.Pawn.PositionY + 12;
    u8 y2 = g_Player.Pawn.PositionY + 4;
	bool isSound = false;

	SetActiveSegment(3);
	if(handleUnderwater(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY)) {
		g_Player.Life--;
		isSound = true;
	}

	// Controllo pericolo e passaggi di livello
	if (isDanger(x, y1) || isDanger(x, y2))
	{
		g_Player.Life--;
		isSound = true;
	}

	SetActiveSegment(0);

    // Controllo se il player raccoglie un oggetto
    SetActiveSegment(4);

	if(handleItemCollection(x, y1, y2)) {
		g_Player.Score += 100;
		updateScore(g_Player.Score);

		playEffect(10);
	}

    SetActiveSegment(0);
    
    if (isPassage(x, y1) || isPassage(x, y2))
    {
        // TODO: non faccio nulla!
    }

	// TODO: Mettere qui il suono
	if(isSound) {
		isSound = false;
		playEffect(9);
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

	SetActiveSegment(7);
	InizializeFont();

	// Funzione: VDP_WriteVRAM_16K
	// Scrivere dati dalla RAM alla VRAM. [MSX1/2/2+/TR]
	//
	// Parametri:
	//   src   - Indirizzo dei dati sorgente nella RAM
	//   dest  - Indirizzo di destianzione nella VRAM (indirizzo a 14 bit per 16KB VRAM)
	//   count - Numero di byte da copiare nella VRAM. Nota: Un valore 0 significa 65536
	VDP_WriteVRAM_16K(g_DataSprtLayer, g_SpritePatternLow,1792);
	

	SetActiveSegment(0);

	// Initialize color
	SetActiveSegment(4);
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

	Game_SetState(State_Preset);

	return FALSE; // Frame finished
}

/**
 * @brief Aggirona lo stato del giocatore e dei nemici (OTTIMIZZATA)
 * @param void
 * @return void
 */
bool State_Game()
{

    // All'inizio della funzione, controlla se il player è morto per caduta
    if (g_PlayerDiedFromFall) {
		SetActiveSegment(3);
        g_PlayerDiedFromFall = FALSE;
        g_LevelPrev = 0;
        displayLife();
        SetActiveSegment(0);
		drawLevel(g_CurrRoomIdx);
        return TRUE;
    }

	SetActiveSegment(4);
	WaitVBlank();
	SetActiveSegment(0);

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
	SetActiveSegment(4);
	readInputControl(&g_Player);
	SetActiveSegment(0);

	// TODO: Aggiornamento della posizione dei nemici, da migliorare!!! g_FrameCounter
	if (g_Frame == 50)
	{
		g_SecondCounter++;
		// g_CatchEnemy++;
		g_Frame = 0;

		// TODO: Serve per aggiorare il tempo rimanente per terminare il livello senza perdere una vita
		if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER && g_CurrRoomIdx != GAME_WINNER)
		{
			g_TimetoDeath--;

			SetActiveSegment(4);
			drawMessageWithTimer(28, 0, 30, 0, "T:", "%02i", g_TimetoDeath);
			SetActiveSegment(0);

			SetActiveSegment(3);
			if (g_TimetoDeath == 0)
			{
				bool isRemove = removeLife();
			
				if (isRemove == TRUE)
				{
					g_Player.Life--;
					displayLife();
					drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
				}
				else
				{
					Game_SetState(State_GameOver);
				}
			}

			// TODO: FUnziona ma l'aggiornamento non è constante. Vedere se possiamo migliorare
			if (g_RefreshInventary)
			{
				VDP_ReplacementPartialArea(22);		
				displayItemToInventory( LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);
				g_RefreshInventary = FALSE;
			}

			SetActiveSegment(0);
		}
	}

	if (g_GameFrame % 2 == 0)
	{
		g_DangerCounter++;

		// Funzione: update enmy
		// Aggiorna il rendering dei nemici.
		SetActiveSegment(4);
		updateGenericEnemy(&g_Skeletor[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber, FIRST_ID_SKELETOR);
		updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber, FIRST_ID_GHOST);
		updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber, FIRST_ID_SPIDER);
		updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber, FIRST_ID_BAT);
		updateGenericEnemy(&g_platformH[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH, FIRST_ID_SLIDE_H);
		updateGenericEnemy(&g_platformV[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV, FIRST_ID_SLIDE_V);
		SetActiveSegment(0);

		// TODO: Test della collisione tra il Player ed un Enemy, da migliorare!!!
		// Funzione: physicsCollisionPlayerAndEnemy
		// Gestisce la collisione tra il pedone e i vari nemici
		//
		// Parametri:
		//   charatter - Indirizzo della struttura Pawn del pedone da aggiornare
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Skeletor[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);
		physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);

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

	SetActiveSegment(8);
	SetSong(0);
	SetActiveSegment(0);

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
	SetActiveSegment(3);
	initInventory();
	initLife();
	SetActiveSegment(0);

	// Funzione: initLife
	// Inizializza le vite del giocatore
	g_Player.Life = MAX_LIVES;

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

	SetActiveSegment(8);
	SetSong(1);
	SetActiveSegment(0);

	// Attende la pressione di un tasto
	while (Keyboard_Read(8) != 254)
	{
	}

	Game_SetState(State_Preset);

	//TODO: vediamo se posso mettere qui il cambio musica

	return TRUE;
}


bool State_GameWinner()
{

	drawLevel(27); // -1

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
// MAIN LOOP
//=============================================================================

void VSyncCallback() {
	SetActiveSegment(4);
	VSyncCallbackBanck();
	SetActiveSegment(0);

	// Vediamo se lasciaro qui
	SetActiveSegment(8);
	updatePT3();
	updateAYFX();
	SetActiveSegment(0);
}

void main()
{
	//DEBUG_INIT();
	//DEBUG_LOG("Start debug session!");
	SetActiveSegment(8);
	inizializePT3();
    SetSong(0);
	inizializeAYFX();
	restorePT3Music();
	SetActiveSegment(0);

	VDP_EnableVBlank(TRUE);

	Bios_SetHookCallback(H_TIMI, VSyncCallback);


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