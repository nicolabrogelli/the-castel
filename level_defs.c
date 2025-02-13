//=============================================================================
// INCLUDES
//=============================================================================
#include "level_defs.h"
#include "colors.h"

//=============================================================================
// DEFINES EXTERN SEGMENT 21, BANK 1
//=============================================================================
extern const unsigned char g_Level001[];
extern const unsigned char g_Level002[];
extern const unsigned char g_Level003[];
extern const unsigned char g_Level004[];
extern const unsigned char g_Level005[];
extern const unsigned char g_Level006[];
extern const unsigned char g_Level007[];
extern const unsigned char g_Level008[];
extern const unsigned char g_Level009[];
extern const unsigned char g_Level010[];
extern const unsigned char g_Level011[];
extern const unsigned char g_Level012[];
extern const unsigned char g_Level013[];
extern const unsigned char g_Level014[];
extern const unsigned char g_Level015[];
extern const unsigned char g_Level016[];
extern const unsigned char g_Level018[];
extern const unsigned char g_Level019[];
extern const unsigned char g_Level020[];
extern const unsigned char g_Level021[];
extern const unsigned char g_Level022[];
extern const unsigned char g_Level023[];
extern const unsigned char g_Level024[];
extern const unsigned char g_Level025[];
extern const unsigned char g_Level026[];
extern const unsigned char g_Level027[];
extern const unsigned char g_Level028[];
extern const unsigned char g_Level029[];
extern const unsigned char g_Level030[];

//=============================================================================
// DEFINE
//=============================================================================

//=============================================================================
// MEMORY DATA 
//=============================================================================

// Elenco delle stanze e delle loro caratteristiche
// Non modificare l'ordinamento dell'array pena la non corretta navigazione nelle stanze di gioco
struct LevelDefinition g_Levels[] = {

	{g_Level030, "STRAT GAME", /* 00 */ {1, 0, 0, 0}, {0, 0, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PRIMO PIANO OK
	{g_Level001, "LVL:01", /* 01 */ {2, 0, 0, 0}, {2, 0, 0, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level002, "LVL:02", /* 02 */ {3, 1, 0, 6}, {2, 2, 0, 0, 1, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level003, "LVL:03", /* 03 */ {4, 2, 5, 0}, {2, 1, 0, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level004, "LVL:04", /* 04 */ {0, 3, 0, 8}, {1, 0, 0, 1, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// LA TORRE OK
	{g_Level006, "LVL:06", /* 05 */ {0, 0, 0, 3}, {1, 1, 1, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PIANO TERRENO LATO SININSTRO
	{g_Level007, "LVL:07", /* 06 */ {7, 0, 2, 0}, {0, 0, 0, 3, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{g_Level005, "LVL:05", /* 07 */ {0, 6, 0, 0}, {0, 0, 0, 0, 2, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},

	// PIANO TERRNEO LATO DESTRO
	{g_Level008, "LVL:08", /* 08 */ {9, 0, 4, 0}, {0, 0, 1, 2, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{g_Level009, "LVL:09", /* 09 */ {10, 8, 4, 18}, {2, 0, 0, 2, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{g_Level010, "LVL:10", /* 10 */ {0, 9, 0, 11}, {2, 0, 0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PIANO - DA FARE
	{g_Level011, "LVL:11", /* 11 */ {12, 0, 10, 0}, {1, 0, 1, 2, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{g_Level012, "LVL:12", /* 12 */ {0, 11, 0, 13}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// PIANO DELLA LAVA
	{g_Level013, "LVL:13", /* 13 */ {14, 0, 12, 0}, {0, 1, 0, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{g_Level014, "LVL:14", /* 14 */ {0, 13, 12, 15}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{g_Level015, "LVL:15", /* 15 */ {16, 0, 14, 0}, {1, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},
	{g_Level016, "LVL:16", /* 16 */ {0, 15, 17, 0}, {2, 1, 0, 2, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BLUE_LEVEL},

	// PIANO - IN REALTA QUESTI SONO LIVELLLI SPARSI, MA NON POSTO SPOSTARLI PENA RIMAPPATURA DELL'ARRAY
	{g_Level027, "LVL:27", /* 17 */ {19, 0, 0, 16}, {1, 1, 1, 0, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{g_Level025, "LVL:25", /* 18 */ {0, 0, 9, 0}, {0, 0, 0, 3, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},
	{g_Level026, "LVL:26", /* 19 */ {0, 17, 20, 0}, {3, 0, 0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, BROWN_LEVEL},

	// PIANO
	{g_Level018, "LVL:18", /* 20 */ {21, 0, 19, 0}, {3, 0, 0, 0, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level019, "LVL:19", /* 21 */ {22, 20, 0, 0}, {1, 1, 0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level020, "LVL:20", /* 22 */ {23, 21, 0, 0}, {0, 0, 0, 2, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},

	// DA FARE
	{g_Level021, "LVL:21", /* 23 */ {24, 22, 0, 0}, {1, 0, 0, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level022, "LVL:22", /* 24 */ {25, 23, 0, 0}, {3, 0, 0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL},
	{g_Level023, "LVL:23", /* 25 */ {1, 24, 0, 0}, {2, 0, 0, 1, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, GREY_LEVEL}, 
	
	{g_Level029, "GAME OVER", /* 26 */ {0, 9, 0, 0}, {0, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, 0xE0},
	{g_Level024, "WINNER", /* 27 */ {0, 9, 0, 0}, {0, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}, 0xE0},

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
