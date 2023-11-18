#define CAVALIERE             1


#define EMPTY_ITEM 		  	  0
#define TILE_EMPTY 		  	  0
#define TILE_MASK_DOOR1      65
#define TILE_MASK_DOOR2      66
#define TILE_MASK_DOOR3      67
#define TILE_DOOR0           68
#define TILE_DOOR1           69
#define TILE_DOOR2 		 	 70
#define TILE_DOOR3           74
#define TILE_DOOR_PREV       71
#define TILE_HEART           79 
#define TILE_AMPHORA         95
#define TILE_KEY1            96
#define TILE_KEY2            97
#define TILE_KEY3            98
#define TILE_MONEY           99
#define TILE_STAR_POS_ENEMY 124
#define TILE_START_POS 		127
#define TILE_POS_GHOST      128
#define TILE_POS_SPIDER     129
#define TILE_POS_BAT        130
#define TILE_BLOCK_TEST     144
#define TILE_MASK_HEART     187    
#define TILE_MASK_AMPHORA   188
#define TILE_MASK_KEY1      189
#define TILE_MASK_KEY2      190
#define TILE_MASK_KEY3      191
#define TILE_MASK_MONEY     192

#define MAX_ENEMY             3
#define MAX_GHOST             3
#define MAX_SPIDER            3
#define MAX_BAT               3
#define MAX_SLIDING_PLATFORM  3
#define MAX_ITEM_INVENTORY    5
#define MAX_LIVES             3
#define IMMUNITY              3

#define GAME_OVER             9

#define FRAME_1             128
#define FRAME_4             512
#define FRAME_9            1024


// ----------------  PLAYER

// DEFINIZIONE DEI FRAME PER IL MOVIMENTO DEL PLAYER
#define MOVE_PLAYER_FRAME_0 0*16
#define MOVE_PLAYER_FRAME_1 1*16
#define MOVE_PLAYER_FRAME_2 2*16
#define MOVE_PLAYER_FRAME_3 3*16
#define MOVE_PLAYER_FRAME_4 4*16
#define MOVE_PLAYER_FRAME_5 5*16

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

// DEFINIZIONE DEI FRAME PER IL MOVIMENTO DEL ENEMY
/* #define MOVE_ENEMY_FRAME_7  0*16+7*16
#define MOVE_ENEMY_FRAME_8  1*16+7*16
#define MOVE_ENEMY_FRAME_9  2*16+7*16
#define MOVE_ENEMY_FRAME_10  3*16+7*16 */

// TODO: Questo è solo un esempio, deve essere cambiato
#define IDLE_ENEMY_FRAME_12  5*16+7*16
#define IDLE_ENEMY_FRAME_11  4*16+7*16

// DEFINIZIONE DEI FRAME PER FALL DEL ENEMY
#define FALL_ENEMY_FRAME_11  4*16+7*16


#define JUMP_ENEMY_FRAME_11 4*16+7*16


extern unsigned char g_Level001[];
extern unsigned char g_Level002[];
extern unsigned char g_Level003[];
extern unsigned char g_Level004[];
extern unsigned char g_Level005[];
extern unsigned char g_Level006[];
extern unsigned char g_Level007[];
extern unsigned char g_Level008[];
extern unsigned char g_Level009[];
extern unsigned char g_Level018[];
extern unsigned char g_Level099[];

#define LEVEL001_WIDTH 32
#define LEVEL001_HEIGHT 24
#define LEVEL002_WIDTH 32
#define LEVEL002_HEIGHT 24
#define LEVEL003_WIDTH 32
#define LEVEL003_HEIGHT 24
#define LEVEL004_WIDTH 32
#define LEVEL004_HEIGHT 24
#define LEVEL005_WIDTH 32
#define LEVEL005_HEIGHT 24
#define LEVEL006_WIDTH 32
#define LEVEL006_HEIGHT 24
#define LEVEL007_WIDTH 32
#define LEVEL007_HEIGHT 24
#define LEVEL008_WIDTH 32
#define LEVEL008_HEIGHT 24
#define LEVEL009_WIDTH 32
#define LEVEL009_HEIGHT 19


#define LEVEL018_WIDTH 32
#define LEVEL018_HEIGHT 24
#define LEVEL099_WIDTH 9
#define LEVEL099_HEIGHT 1