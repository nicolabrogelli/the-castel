//=============================================================================
// SEGMENT: 3
// BANK: 1
// DESCRIPTION: Inventory and Live
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "game.h"

//=============================================================================
// DEFINE
//=============================================================================
#define EMPTY_ITEM 		  	     0
#define MAX_ITEM_INVENTORY       5
#define LEVEL_WIDTH             32
#define LEVEL_HEIGHT            24
#define LEVEL_X                  0
#define LEVEL_Y                  0

#define MAX_LIVES             3
#define TILE_HEART           79 
#define EMPTY_ITEM 		  	  0
#define MAX_ITEM_INVENTORY    5
#define OFFSET_X_LIFE         8 // Solo multipli di 8
#define BASE_X_LIFE         190
#define TILE_SKULL          114
#define TILE_BONE           115
#define TILE_DANGER1        105
#define TILE_DANGER2        106
#define TILE_DANGER3        107
#define TILE_DANGER4        108
#define TILE_LAVA            64

//=============================================================================
// PROTOTYPE EXTERN
//=============================================================================
extern void setTile(u8 x, u8 y, u8 tile);
extern void ItemsTakenForLevel(u8 x, u8 y, u8 tile, u8 visibility);
extern u8 getTile(u8 x, u8 y);
extern void drawLevel(u8 levelIdx);
extern bool State_GameOver();
extern bool isUnderTheWater(u8 x, u8 y);
extern void playerDeathAnimation();
extern void playerDeathGameOver();

//=============================================================================
// PROTOTYPE
//=============================================================================
void initInventory();
bool addItemToInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
bool removeItemFromInventory(u8 item, u8 levelX, u8 levelY, u8 levelHeight);
void displayItemToInventory(u8 levelX, u8 levelY, u8 levelHeight);
bool hasItemInInventory(u8 item);
void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask);
void takeActionWithCheck(u8 x, u8 y, u8 tile, u8 checkTile, u8 newTile);
void initLife();
bool removeLife();
void displayLife();
bool addLife();
bool hasLives();


//=============================================================================
// MEMORY EXTERN
//=============================================================================
extern u8 g_CountItem;
extern u8 g_CurrRoomIdx;
extern bool g_IsUnderWater;
extern u8 g_DelayRemoveLife;
extern u8 g_SecondCounter;

//=============================================================================
// MEMORY
//=============================================================================
unsigned char g_Inventory[MAX_ITEM_INVENTORY] = {0, 0, 0, 0, 0};
unsigned char g_Lives[MAX_LIVES] = {0, 0, 0};


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

/** 
 * Sostituisce e rimuove un elemento se non è presente nell'inventario. (OTTIMIZZATA)
 */
void takeActionWithCheck(u8 x, u8 y, u8 tile, u8 checkTile, u8 newTile)
{
	bool ckTile = hasItemInInventory(checkTile);

	if (!ckTile)
	{
		replaceAndRemoveItem(x, y, tile, newTile);
	}
}


/**
 * @brief rimuove la tile, sostituendola con una maschera e mette l'oggetto corrspondente nell'inventario.
 * 		  Questa funzione anche se ridondante mi permette di risparmiare qulache bit :)
 * @param u8 x Coordinata x
 * @param u8 y Coordinata y
 * @param u8 tile Tile da inserire nell'inventario
 * @param u8 tileMask Maschera per sostituire la tile
 * @return void
 */
void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask)
{
	ItemsTakenForLevel(x, y, tileMask, 1);
	g_CountItem++;

	setTile(x, y, EMPTY_ITEM);
	
	addItemToInventory(tile,  LEVEL_X,  LEVEL_Y, LEVEL_HEIGHT);

}

//------------------------------------------------------------------------------------------------

/**
 * @brief Inizializza le vite
 * @param void
 * @return void
 */
void initLife()
{
	//g_Player.Life = MAX_LIVES;

	Mem_Set(TILE_HEART, g_Lives, (3 * sizeof(g_Lives[0])));
}

/**
 * @brief Rimuove una vita
 * @param void
 * @return bool TRUE se è stata rimossa una vita
 */
bool removeLife()
{
	for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	{

		if (g_Lives[i] == TILE_HEART)
		{
			g_Lives[i] = EMPTY_ITEM;
			setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), 0);
			return (i > 0);
		}
	}

	return FALSE;
}


/**
 * @brief Visualizza tutte le vite disponibili
 * @param void
 * @return void
 */
void displayLife()
{
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), g_Lives[i]); // 220
	}
}



/**
 * @brief Aggiunta di una vita
 * @param void
 * @return bool TRUE se è stata aggiunta una vita
 */
bool addLife()
{
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		if (g_Lives[i] == EMPTY_ITEM)
		{
			g_Lives[i] = TILE_HEART;

			setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), TILE_HEART);
			return TRUE;
		}
	}
	return FALSE;
}


/**
 * @brief COntrolla se ci sono ancora vite disponibili
 * @return TRUE se ci sono vite disponibili
 */
bool hasLives()
{
	for (u8 i = 0; i < MAX_LIVES; i++)
	{
		if (g_Lives[i] == TILE_HEART)
		{
			return TRUE;
		}
	}
	return FALSE;
}

/**
 * @brief Verifica se siamo in una posizione di pericolo (OTTIMIZZATA)
 * @param u8 x Coordinata X
 * @param u8 y Coordinata Y
 * @param u8 t Durata immunita
 * @return TRUE se siamo in pericolo
 */
bool isDanger(u8 x, u8 y)
{
	bool isRemove = FALSE;

	switch (getTile(x, y))
	{
	case TILE_SKULL:
	case TILE_BONE:
	case TILE_DANGER1:
	case TILE_DANGER2:
	case TILE_DANGER3:
	case TILE_DANGER4:
	case TILE_LAVA:

		 isRemove = removeLife();
		if (isRemove == TRUE)
		{
			displayLife();
			playerDeathAnimation();
			drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
		}
		else
		{
			playerDeathGameOver();
		}
		return TRUE;
	default:
		return FALSE;
	}
}




bool handleUnderwater(u8 PositionX, u8 PositionY) {
    if (isUnderTheWater(PositionX, PositionY)) {
        if (g_IsUnderWater && (g_SecondCounter - g_DelayRemoveLife) > 3) {
            bool isRemove = removeLife();
            if (isRemove) {
                displayLife();
                g_IsUnderWater = FALSE;
                return true;  // Restituisce true se isRemove è true
            } else {
                Game_SetState(State_GameOver);
                return false; // Restituisce false se isRemove è false
            }
        } else if (!g_IsUnderWater) {
            g_DelayRemoveLife = g_SecondCounter;
            g_IsUnderWater = TRUE;
        }
    } else {
        g_IsUnderWater = FALSE;
        g_DelayRemoveLife = 0;
    }

    return false; // Restituisce false se nessuna delle condizioni precedenti è soddisfatta
}