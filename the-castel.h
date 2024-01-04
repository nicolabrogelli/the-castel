//=============================================================================
// DEFINES
//=============================================================================

#define COMPRESSO             1


#define TILE_EMPTY 		  	     0

#define MAX_ENEMY                3
#define MAX_GHOST                3
#define MAX_SPIDER               3
#define MAX_BAT                  3
#define MAX_SLIDING_PLATFORM     3
#define MAX_NUMBRER_SPRITE_HIDE 25
#define FIRST_ID_SPRITE          6

#define FIRST_ID_SKELETOR        6
#define FIRST_ID_GHOST           9 //10
#define FIRST_ID_SPIDER         12 //15
#define FIRST_ID_BAT            15 //20
#define FIRST_ID_SLIDE_H        18 //30
#define FIRST_ID_SLIDE_V        21 //30

#define MAX_LIVES                3
#define IMMUNITY                 3
#define LAST_LEVEL              19  // Ultimo livello di gioco
#define START_GAME               0  // Livello di inizio gico
#define GAME_OVER               LAST_LEVEL + 1  // Livello di game over
#define OFFSET_TILE_COLLISION   50
#define MIN_DISTANCE_MAGNENT   100
#define MAX_DISTANCE_MAGNENT  1000
#define DELAY_CATCH_ENEMY        1
#define MAX_CACHE_OBJECT         5

#define FRAME_1             128
#define FRAME_4             512
#define FRAME_9            1024

#define FORCE 15
#define GRAVITY 1
#define GROUND 192
#define JOY_PORT_1 0b00000011
#define JOY_PORT_2 0b01001100

// ----------------  PLAYER

// DEFINIZIONE DEI FRAME PER IL MOVIMENTO DEL PLAYER
#define MOVE_PLAYER_FRAME_0 0*16
#define MOVE_PLAYER_FRAME_1 1*16
#define MOVE_PLAYER_FRAME_2 2*16
#define MOVE_PLAYER_FRAME_3 3*16
#define MOVE_PLAYER_FRAME_4 4*16
#define MOVE_PLAYER_FRAME_5 5*16
#define MOVE_PLAYER_FRAME_7 7*16

// DEFINIZIONE DEI FRAME PER FALL DEL PLAYER
#define FALL_PLAYER_FRAME_6 6*16

// DEFINIZIONE DI FRAME PE JUMP DEL PLAYER
#define JUMP_PLAYER_FRAME_5 5*16

// DEFINIZIONE DEI FRAME PER IDLE DEL PLAYER
#define IDLE_PLAYER_FRAME_4 4*16 
#define IDLE_PLAYER_FRAME_2 2*16

// ----------------  ENEMY

// DEFINIZIONE DEI FRAME PER IDLE DEL ENEMY
#define IDLE_ENEMY_FRAME_12 5*16+7*16
#define IDLE_ENEMY_FRAME_11 4*16+7*16

// TODO: Questo è solo un esempio, deve essere cambiato
#define IDLE_ENEMY_FRAME_12  5*16+7*16
#define IDLE_ENEMY_FRAME_11  4*16+7*16

// DEFINIZIONE DEI FRAME PER FALL DEL ENEMY
#define FALL_ENEMY_FRAME_11  4*16+7*16
#define JUMP_ENEMY_FRAME_11 4*16+7*16




//=============================================================================
// PROTOTIPI DELLE FUNZIONI
//=============================================================================
bool State_Initialize();
bool State_Game();
bool State_Pause();
bool State_GameOver();
bool State_Preset();
bool physicsCollision(u8 tile);
void setColorTiles();
bool interact(u8 x, u8 y);
void drawLevel(u8 levelIdx);
void initCharacter(struct Character *ply, u8 id);
void updateCharacter(struct Character *ply);
void readInputControl();
bool physicsCollisionEnemy(u8 x, u8 y);

bool getMoney(u8 x, u8 y);
void updateScore();
void initLife();
bool addLife();
void displayLife();
bool removeLife();
bool hasLives();
void physicsCollisionPlayerAndEnemy(struct Character *ply);
void changeLevel(u8 x, u8 y, u8 key, u8 door);
bool isUnderTheWater(u8 x, u8 y);
void genericControl();
bool collisionCheck(i8 dx, i8 dy);
void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber);
void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite);
void hideSprite(u8 count, u8 maxElement, u8 baseSprite);
void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape);
void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV);
void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset);
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 bo, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 movHV);
bool isDanger(u8 x, u8 y, u8 t);
u8 isUnderDunger(u8 x, u8 y);

void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask);
void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 enemyNumber);




//=============================================================================
// MEMORY DATA EXTERN
//=============================================================================
extern unsigned char g_Level001[];
extern unsigned char g_Level002[];
extern unsigned char g_Level003[];
extern unsigned char g_Level004[];
extern unsigned char g_Level005[];
extern unsigned char g_Level006[];
extern unsigned char g_Level007[];
extern unsigned char g_Level008[];
extern unsigned char g_Level009[];
extern unsigned char g_Level010[];
extern unsigned char g_Level011[];
extern unsigned char g_Level012[];
extern unsigned char g_Level013[];
extern unsigned char g_Level014[];
extern unsigned char g_Level015[];
extern unsigned char g_Level016[];
extern unsigned char g_Level017[];
extern unsigned char g_Level018[];
extern unsigned char g_Level019[];
extern unsigned char g_Level020[];
extern unsigned char g_Level021[];
extern unsigned char g_Level022[];
extern unsigned char g_Level023[];
extern unsigned char g_Level024[];
extern unsigned char g_Level025[];
extern unsigned char g_Level026[];
extern unsigned char g_Level027[];
extern unsigned char g_Level028[];
extern unsigned char g_Level029[];
extern unsigned char g_Level030[];

extern const unsigned char g_DataSprtLayer[];
extern const unsigned char g_DataBackground_Patterns[];
