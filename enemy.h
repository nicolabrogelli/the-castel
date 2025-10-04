#include "msxgl.h"

struct CharacterEnemy
{
	u8 X;				 /** Spostamento su asse X */
	u8 Y;				 /** Spostamento su asse Y */
	i8 VelocityY;		 /** Velocità di spostamento */
	u8 State;			 /** Stato 1 = visibile, 0 = invisibile */
	int Direction;		 /** Direzione di spostamento 1 = destra, -1 = sinistra */
	const c8 *TypeEnemy; /** Descrizione del tipo di nemico */
	u8 SpriteId;		 /** Numero dello sprite del nemico */
	u8 MoveHV;			 /** Definisce il tipo di movimento  0 = orizzontale, 1 = verticale */
};