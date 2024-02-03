#pragma once
#include "core.h"


/**
 * \struct
 * struct: La struttura rappresenta la posizione e la visibilitòà di un oggetto
 */
typedef struct
{
	u8 x;
	u8 y;
	u8 visible;
	u8 tile;
} ObjectItem;

/** \struct
 * struct: Struttura che rappresenta il numero di nemici per livello
 */
typedef struct
{
	u8 SkeletonNumber; /** Numero di scheletri nel livello*/
	u8 GhostNumber;	   /** Numero di fantasmi nel livello */
	u8 SpiderNumber;   /** Numero di ragni nel livello */
	u8 BatNumber;	   /** Numero di pipistrelli nel livello */
	u8 SliderNumberH;  /** Piattaforma Orizzontale */
	u8 SliderNumberV;  /** Piattaforma Verticale */
} EnemyType;


typedef struct 
{
	u8 NextDoorLevel;
	u8 PrevDoorLevel;
	u8 UpDoorLevel;
	u8 DownDoorLevel;
} DoorLevel;


/** \struct
	struct: Struttura che rappresenta la stanza
*/
struct LevelDefinition
{
	u8 X;					/** Coordinata Y della stanza */
	u8 Y;					/** Coordinata Y della stanza */
	u8 Width;				/** Larghezza della stanza*/
	u8 Height;				/** Altezza della stanza */
	u8 *Layout;				/** Layout della stanza */
	const c8 *Name;			/** Nome della stanza */
	DoorLevel DoorLevel;
// 	u8 NextLvlIdx;			/** Livello successivo */
//	u8 PrevLvIdx;			/** Livello precedente */
	EnemyType MyEnemyType;	/** Rappresenta il numero di nemici per livello */
	ObjectItem MyItems[10]; /** Rappresenta gli oggetti utilizzati nel livello */
	u8 ColorLevel;			/** Colore delle tiles */
};

extern struct LevelDefinition g_Levels[];


void restoreLevel();