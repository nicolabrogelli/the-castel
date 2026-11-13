//=============================================================================
// API del player audio PSG (segmento 8, the-castel_s8_b1.c)
// Le funzioni stanno nel segmento 8: dal codice di gioco chiamarle con il
// segmento 8 attivo nel banco 1 (SetActiveSegment(8) ... SetActiveSegment(0)),
// oppure tramite playEffect() in the-castel.c per gli effetti.
//=============================================================================
#pragma once

#include "audio_ids.h"   // MUS_* e SFX_* (generato da tools/psg_audio.py)

void Audio_Init();
void Audio_PlaySong(u8 id);
void Audio_PauseMusic();
void Audio_ResumeMusic();
void Audio_PlaySFX(u8 id);
void Audio_OnRoom(u8 levelIdx);
void Audio_Update();
