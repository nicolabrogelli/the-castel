#include "level_defs.h"


#include "data/level/level001.h"
#include "data/level/level002.h"
#include "data/level/level003.h"
#include "data/level/level004.h"
#include "data/level/level005.h"
#include "data/level/level006.h"
#include "data/level/level007.h"
#include "data/level/level008.h"
#include "data/level/level009.h"
#include "data/level/level010.h"
#include "data/level/level011.h"
#include "data/level/level012.h"
#include "data/level/level013.h"
#include "data/level/level014.h"
#include "data/level/level015.h"
#include "data/level/level016.h"
#include "data/level/level017.h"
#include "data/level/level018.h"
#include "data/level/level019.h"
#include "data/level/level020.h"
#include "data/level/level021.h"
#include "data/level/level022.h"
#include "data/level/level023.h"
#include "data/level/level024.h"
#include "data/level/level025.h"
#include "data/level/level026.h"
#include "data/level/level027.h"
#include "data/level/level028.h"
#include "data/level/level029.h"
#include "data/level/level030.h"

// DEFINIZIONE DIMENSIONI LIVELLI DI GIOCO
#define LEVEL_WIDTH 32
#define LEVEL_HEIGHT 24

// Elenco delle stanze e delle loro caratteristiche
// Non modificare l'ordinamento dell'array pena la non corretta navigazione nelle stanze di gioco
struct LevelDefinition g_Levels[] = {
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level030, "STRAT GAME", { 1,  0, 0 ,0}, {0, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PRIMO PIANO OK
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level001, "LVL:01",  { 2,  0, 0, 0}, {2, 0, 0, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level002, "LVL:02",  { 3,  1, 0, 6}, {2, 2, 0, 0, 1, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level003, "LVL:03",  { 4,  2, 5, 0}, {2, 1, 0, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level004, "LVL:04",  { 5,  3, 0, 9}, {1, 0, 0, 1, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// LA TORRE OK
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level006, "LVL:06",  { 0,  0, 0, 3}, {1, 1, 1, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PIANO TERRENO LATO SININSTRO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level007, "LVL:07",  { 7,  5, 2, 7}, {0, 0, 0, 3, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level005, "LVL:05",  { 0,  0, 0, 6}, {0, 0, 0, 0, 2, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PIANO TERRNEO LATO DESTRO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level008, "LVL:08",  { 0,  0, 0, 9}, {0, 0, 1, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level009, "LVL:09",  { 10, 0, 4, 8}, {2, 0, 0, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level010, "LVL:10",  { 10, 8, 0, 11}, {2, 0, 0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PIANO - DA FARE
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level011, "LVL:11",  {11,  9, 10, 12}, {1, 0, 1, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level012, "LVL:12",  { 0, 0, 11, 14}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},

	// PIANO DELLA LAVA	- DA FARE
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level013, "LVL:13",  { 0, 14, 0, 0}, {0, 1, 0, 2, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level014, "LVL:14",  { 0, 13, 11, 15}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level015, "LVL:15",  { 16,  0, 14, 0}, {1, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level016, "LVL:16",  {17, 15, 0, 0}, {2, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},	
	

	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level027, "LVL:27",  {18, 16, 0, 0}, {1, 1, 1, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level025, "LVL:25",  {19, 17, 0, 0}, {0, 0, 0, 3, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level026, "LVL:26",  {20, 18, 0, 0}, {3, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level029, "GAME OVER",  { 0,  9, 0, 0}, {0, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},

};


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

