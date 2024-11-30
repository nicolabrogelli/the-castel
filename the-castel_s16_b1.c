//=============================================================================
// SEGMENT: 17
// BANK: 1
// DESCRIPTION: Inventory
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "pt3/pt3_player.h"
#include "pt3/pt3_notetable2.h"
#include "ayfx/ayfx_player.h"

//=============================================================================
// SEGMENT 21, BANK 1
//=============================================================================
extern unsigned char g_ayfx_bank[];
extern unsigned char g_DataMusic[];

//=============================================================================
// FUNCTION
//=============================================================================
/**
 * @brief Riproduce il suono
 * @param u8 id
 * @param u8 prio
 * @return void
 */
void PlayBankSFX(u8 id, u8 prio)
{
    ayFX_PlayBank(id, prio); // Riproduzione di un suono ayFX
}

/**
 * @brief Seleziona una canale dovs SFX riproduce il suono
 * @param u8 chan Canale
 * @return void
 */
void ChannelSFX(u8 chan)
{
    ayFX_Mute();           // Arresta la riproduzione dell'audio e disattiva il canale
    ayFX_SetChannel(chan); // Impostare il canale da utilizzare per la riproduzione del suono
}

/**
 * @brief Inizializzaione del Player PT3 e impostazione della tabella delle note
 * @param void
 * @return void
 */
void inizializePT3()
{
    PT3_Init();                // Inizializza il Player PT3
    PT3_SetNoteTable(PT3_NT2); // Setta la tabella delle note
    PT3_SetLoop(TRUE);
    PT3_InitSong(g_DataMusic);
}

/**
 * @brief Impostazione del riproduttore ayfx e del canale audio
 * @param void
 * @return void
 */
void inizializeAYFX()
{
    ayFX_InitBank(g_ayfx_bank);     // Impostazione del riproduttore ayFX tramite l'array g_ayfx_bank
    ayFX_SetChannel(PSG_CHANNEL_A); // Impostare il canale da utilizzare per la riproduzione del suono
    ayFX_SetMode(AYFX_MODE_FIXED);  // Set channel mode
}

/**
 * @brief Mette in pausa la musica
 * @param void
 * @return void
 */
void pausePT3Music()
{
    PT3_Pause();
    PT3_UpdatePSG();
}

/**
 * @brief Fa ripartire la musica dal punto dove si è interrotta
 * @param void
 * @return void
 */
void restorePT3Music()
{
    PT3_Resume();
    PT3_UpdatePSG();
}

/**
 * @brief Arresta la riproduzione della musica e degli effetti sonori
 * @param void
 * @return void
 */
void stopMusicPlayback()
{
    ayFX_Mute();
    ayFX_Update();
    PT3_Mute(PT3_STATE_MUTE_A, TRUE);
    PT3_Pause();
    PT3_UpdatePSG();
}

void setChannel()
{
    ChannelSFX(PSG_CHANNEL_A);
    PlayBankSFX(0, 0);
}