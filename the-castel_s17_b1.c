//=============================================================================
// SEGMENT: 17
// BANK: 1
// DESCRIPTION: Inventory
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"

//=============================================================================
// DEFINE
//=============================================================================
#define EMPTY_ITEM 		  	     0
#define MAX_ITEM_INVENTORY       5

//=============================================================================
// MEMORY
//=============================================================================
unsigned char g_Inventory[MAX_ITEM_INVENTORY] = {0, 0, 0, 0, 0};



extern void setTile(u8 x, u8 y, u8 tile);




//=============================================================================
// FUNCTIONS
//=============================================================================
/**
 * @brief Inizializzazione dell'inventario
 * @param void
 * @return void
 */
void initInventory()
{
    Mem_Set(EMPTY_ITEM, g_Inventory, (5 * sizeof(g_Inventory[0])));
}


/**
 * @brief Aggiunta di un oggetto all'inventario
 * @param u8 item Oggetto da inserire nell'inventario
 * @param levelX Posizione X del livello
 * @param levelY Posizione Y del livello
 * @param levelHeight Altezza del livello
 * @return bool TRUE se l'oggetto è inserito nell'inventario
 */
bool addItemToInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight)
{
    for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
    {
        if (g_Inventory[i] == EMPTY_ITEM)
        {
            g_Inventory[i] = item;
            setTile((levelX * 8) + 8 + i * 16, (u8)((levelHeight * 8) - 16) + levelY * 8, item);
            return TRUE;
        }
    }
    return FALSE;
}


/**
 * @brief Rimuove un oggetto dall'inventario
 * @param u8 item Oggetto da rimuovere
 * @param levelX Posizione X del livello
 * @param levelY Posizione Y del livello
 * @param levelHeight Altezza del livello
 * @return bool TRUE se l'oggetto è stato rimosso
 */
bool removeItemFromInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight)
{
    for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
    {
        if (g_Inventory[i] == item)
        {
            g_Inventory[i] = EMPTY_ITEM;

            setTile((levelX * 8) + 8 + i * 16, (u8)((levelHeight * 8) - 16) + levelY * 8, 0);
            return TRUE;
        }
    }
    return FALSE;
}

/**
 * @brief Visualizza tutti gli elementi dell'inventario
 * @param levelX Posizione X del livello
 * @param levelY Posizione Y del livello
 * @param levelHeight Altezza del livello
 * @return void
 */
void displayItemToInventory(u8 levelX, u8 levelY, u8 levelHeight)
{

    for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
    {
        setTile((levelX * 8) + 8 + i * 16, (u8)((levelHeight * 8) - 16) + levelY * 8, g_Inventory[i]);
    }
}

/**
 * @brief Verificare la presenza di un oggetto nell'inventario
 * @param u8 item Oggetto da verificare
 * @return bool TRUE se l'oggetto è nell'inventario
 */
bool hasItemInInventory(u8 item)
{
    for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
    {
        if (g_Inventory[i] == item)
        {
            return TRUE;
        }
    }
    return FALSE;
}