#pragma once
#include "core.h"

#define EMPTY_ITEM 		  	     0
#define MAX_ITEM_INVENTORY       5

void initInventory();
bool addItemToInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
bool hasItemInInventory(u8 item);
bool removeItemFromInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
void displayItemToInventory(u8 levelX, u8 levelY, u8 levelHeight);