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
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level001, "Level: 01",  { 2,  0, 0, 0}, {2, 0, 0, 1, 1, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level002, "Level: 02",  { 3,  1, 0, 6}, {2, 2, 0, 0, 1, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level003, "Level: 03",  { 4,  2, 5, 0}, {2, 1, 0, 0, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level004, "Level: 04",  { 5,  3, 0, 9}, {1, 0, 0, 1, 1, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// LA TORRE OK
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level006, "Level: 06",  { 0,  0, 0, 3}, {1, 1, 1, 0, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PIANO TERRENO LATO SININSTRO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level007, "Level: 07",  { 7,  5, 2, 7}, {0, 0, 0, 3, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level005, "Level: 05",  { 0,  0, 0, 6}, {0, 0, 0, 0, 2, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PIANO TERRNEO LATO DESTRO
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level008, "Level: 08",  { 0,  0, 0, 9}, {0, 0, 1, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level009, "Level: 09",  { 10, 0, 4, 8}, {2, 0, 0, 2, 0, 2}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level010, "Level: 10",  { 10,  8, 0, 1}, {2, 0, 0, 1, 0, 1}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	

	
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level015, "Level: 00",  { 8,  6, 0, 0}, {1, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level011, "Level: 00",  {11,  9, 0, 0}, {1, 0, 1, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	//  PIANO DELLE ACQUE
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level012, "Level: 00",  {12, 10, 0, 0}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level009, "Level: 00",  {13, 11, 0, 0}, {2, 0, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level013, "Level: 00",  {14, 12, 0, 0}, {0, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level014, "Level: 00",  {15, 13, 0, 0}, {2, 0, 0, 1, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level005, "level: 00",  {16, 14, 0, 0}, {0, 0, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	
	// PIANO DELLA LAVA
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level016, "level: 00",  {17, 15, 0, 0}, {2, 1, 0, 2, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level027, "Level: 00",  {18, 16, 0, 0}, {1, 1, 1, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level025, "Level: 00",  {19, 17, 0, 0}, {0, 0, 0, 3, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
	{(32 - LEVEL_WIDTH) / 2, (24 - LEVEL_HEIGHT) / 2, LEVEL_WIDTH, LEVEL_HEIGHT, g_Level026, "Level: 00",  {20, 18, 0, 0}, {3, 0, 0, 0, 0, 0}, {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}},
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

