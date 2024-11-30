//=============================================================================
// INCLUDES
//=============================================================================
#include "level_defs.h"
#include "colors.h"

//=============================================================================
// DEFINES EXTERN SEGMENT 21, BANK 1
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

//=============================================================================
// DEFINE
//=============================================================================
#define LEVEL_WIDTH 32
#define LEVEL_HEIGHT 24

//=============================================================================
// MEMORY DATA 
//=============================================================================

// Elenco delle stanze e delle loro caratteristiche
// Non modificare l'ordinamento dell'array pena la non corretta navigazione nelle stanze di gioco
struct LevelDefinition g_Levels[] = {

	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level030, "STRAT GAME", {1, 0, 0, 0}, {0, 0, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PRIMO PIANO OK
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level001, "LVL:01", /* 01 */ {2, 0, 0, 0}, {2, 0, 0, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level002, "LVL:02", /* 02 */ {3, 1, 0, 6}, {2, 2, 0, 0, 1, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level003, "LVL:03", /* 03 */ {4, 2, 5, 0}, {2, 1, 0, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level004, "LVL:04", /* 04 */ {0, 3, 0, 8}, {1, 0, 0, 1, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// LA TORRE OK
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level006, "LVL:06", /* 05 */ {0, 0, 0, 3}, {1, 1, 1, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PIANO TERRENO LATO SININSTRO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level007, "LVL:07", /* 06 */ {7, 0, 2, 0}, {0, 0, 0, 3, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level005, "LVL:05", /* 07 */ {0, 6, 0, 0}, {0, 0, 0, 0, 2, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},

	// PIANO TERRNEO LATO DESTRO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level008, "LVL:08", /* 08 */ {9, 0, 4, 0}, {0, 0, 1, 2, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level009, "LVL:09", /* 09 */ {10, 8, 4, 18}, {2, 0, 0, 2, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level010, "LVL:10", /* 10 */ {0, 9, 0, 11}, {2, 0, 0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PIANO - DA FARE
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level011, "LVL:11", /* 11 */ {13, 0, 10, 0}, {1, 0, 1, 2, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level012, "LVL:12", /* 12 */ {0, 11, 0, 13}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PIANO DELLA LAVA
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level013, "LVL:13", /* 13 */ {14, 0, 12, 0}, {0, 1, 0, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level014, "LVL:14", /* 14 */ {0, 13, 12, 15}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level015, "LVL:15", /* 15 */ {16, 0, 14, 0}, {1, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level016, "LVL:16", /* 16 */ {0, 15, 17, 0}, {2, 1, 0, 2, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},

	// PIANO - IN REALTA QUESTI SONO LIVELLLI SPARSI, MA NON POSTO SPOSTARLI PENA RIMAPPATURA DELL'ARRAY
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level027, "LVL:27", /* 17 */ {19, 0, 0, 16}, {1, 1, 1, 0, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level025, "LVL:25", /* 18 */ {0, 0, 9, 0}, {0, 0, 0, 3, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level026, "LVL:26", /* 19 */ {0, 17, 20, 0}, {3, 0, 0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},

	// PIANO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level018, "LVL:18", /* 20 */ {21, 0, 19, 0}, {3, 0, 0, 0, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level019, "LVL:19", /* 21 */ {22, 20, 0, 0}, {2, 2, 0, 2, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level020, "LVL:20", /* 22 */ {23, 21, 0, 0}, {0, 0, 0, 2, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// DA FARE
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level021, "LVL:21", /* 23 */ {24, 22, 0, 0}, {1, 0, 0, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level022, "LVL:22", /* 24 */ {25, 23, 0, 0}, {3, 0, 0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level023, "LVL:23", /* 25 */ {26, 24, 0, 0}, {2, 0, 0, 1, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level024, "LVL:24", /* 26 */ {0, 25, 0, 0}, {0, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level029, "GAME OVER", {0, 9, 0, 0}, {0, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, 0xE0},

};


//=============================================================================
// FUNCTION
//=============================================================================

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
