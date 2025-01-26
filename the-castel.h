//=============================================================================
// DEFINES
//=============================================================================

#define COMPRESSO                1

#define EMPTY_ITEM 		  	     0

#define BASE_X_LIFE            190
#define OFFSET_X_LIFE            8 // Solo multipli di 8
#define TILE_EMPTY 		  	     0
#define TIME_TO_DEATH           60 // Tempo iniziale 

#define MAX_ENEMY                3
#define MAX_GHOST                3
#define MAX_SPIDER               3
#define MAX_BAT                  3
#define MAX_SLIDING_PLATFORM     3
#define MAX_NUMBRER_SPRITE_HIDE 25
#define FIRST_ID_SPRITE          6

#define ADDRESS_SPIDER          192 // Sprite[192] (offset:1536)
#define ADDRESS_SHELETOR        196 // Sprite[196] (offset:1568)
#define ADDRESS_GHOST           200 // Sprite[200] (offset:1600)
#define ADDRESS_BAT             204 // Sprite[204] (offset:1632)
#define ADDRESS_PLATFORM        208 // Sprite[208] (offset:1664)
#define ADDRESS_SNAKE           212 // Sprite[212] (offset:1696)
#define ADDRESS_MAGICIAN        216 // Sprite[216] (offset:1728)
#define ADDRESS_FIRE            220 // Sprite[220] (offset:1760)

#define FIRST_ID_SKELETOR        6
#define FIRST_ID_GHOST           9 //10
#define FIRST_ID_SPIDER         12 //15
#define FIRST_ID_BAT            15 //20
#define FIRST_ID_SLIDE_H        18 //30
#define FIRST_ID_SLIDE_V        21 //30

#define MAX_LIVES                3
#define IMMUNITY                50
#define LAST_LEVEL              25  // Ultimo livello di gioco
#define START_GAME               0  // Livello di inizio gico
#define GAME_OVER               LAST_LEVEL + 1  // Livello di game over
#define OFFSET_TILE_COLLISION   50
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

// DEFINIZIONE DEI FRAME PER JUMP DEL PLAYER
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
bool physicsCollisionEnemy(u8 x, u8 y);
void physicsCollisionPlayerAndEnemy(struct Character *ply);
void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber);
u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 bo, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 movHV);
bool interact(u8 x, u8 y);
void drawLevel(u8 levelIdx);
void initCharacter(struct Character *ply, u8 id);
void updateCharacter(struct Character *ply);
void readInputControl();
void updateScore();
void changeLevel(u8 x, u8 y, u8 key, u8 door);
bool isUnderTheWater(u8 x, u8 y);
void genericControl();
void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset);
bool isDanger(u8 x, u8 y);
u8 isUnderDunger(u8 x, u8 y);
void messageInGame(char *message);
void VDP_ReplacementPartialArea(u8 riga);
void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask);
void takeActionWithCheck(u8 x, u8 y, u8 tile, u8 checkTile, u8 newTile);
int my_strcmp(const c8 *a, const c8 *b);



//=============================================================================
// SEGMENT 16, BANK 1
//=============================================================================
void inizializePT3();
void inizializeAYFX();
void PlayBankSFX(u8 id, u8 prio);
void ChannelSFX(u8 chan);
void restorePT3Music();
void pausePT3Music();
void stopMusicPlayback();
void setChannel();

//=============================================================================
// SEGMENT 17, BANK 1
//=============================================================================
void initInventory();
bool addItemToInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
bool removeItemFromInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
void displayItemToInventory(u8 levelX, u8 levelY, u8 levelHeight);
bool hasItemInInventory(u8 item);

//=============================================================================
// SEGMENT 18, BANK 1
//=============================================================================
void initLife();
bool removeLife();
void displayLife();
bool addLife();
bool hasLives();

//=============================================================================
// SEGMENT 19, BANK 1
//=============================================================================
bool isMoveRight(u8 row8, u8 input);
bool isMoveLeft(u8 row8, u8 input);
bool isMoveJump(u8 row8, u8 input);
bool isInteractObject(u8 row8, u8 input);

//=============================================================================
// SEGMENT 23, BANK 1
//=============================================================================
bool isOnPlatform(u8 *X, u8 *Y, u8 slideCount, struct CharacterEnemy *platform);
bool getItem(u8 x, u8 y);
void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite);
void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 nEnemy);
void setColorTiles();
void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape);
void hideSprite(u8 count, u8 maxElement, u8 baseSprite);
void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV);
bool collisionCheck(i8 dx, i8 dy);
void adjustXYEnemy(struct CharacterEnemy *genericEnemy, u8 idFirstSprite, u8 nEnemy);
