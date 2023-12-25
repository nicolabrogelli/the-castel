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
struct LevelDefinition g_Levels[] = {
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level030, "STRAT GAME", 1, 0, {0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level001, "Level: 01", 2, 0, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level002, "Level: 02", 3, 1, {2, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level003, "Level: 03", 4, 2, {3, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level004, "Level: 04", 5, 3, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level006, "Level: 05", 6, 4, {1, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level007, "Level: 06", 7, 5, {0, 0, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level015, "Level: 07", 8, 6, {1, 1, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level008, "Level: 08", 9, 7, {0, 0, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level010, "Level: 09", 10, 8, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level011, "Level: 10", 11, 9, {1, 0, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level012, "Level: 11", 12, 10, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level009, "Level: 12", 13, 11, {2, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level013, "Level: 13", 14, 12, {0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level014, "Level: 14", 15, 13, {2, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level005, "level: 15", 16, 14, {0, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level016, "level: 16", 17, 15, {2, 1, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level027, "Level: 17", 18, 16, {1, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level025, "Level: 18", 19, 17, {0, 0, 0, 3}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level026, "Level: 19", 20, 18, {3, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level029, "GAME OVER", 0, 9, {0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},

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

