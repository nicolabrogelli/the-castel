//=============================================================================
// SEGMENT: 8
// BANK: 1
// DESCRIPTION: Player audio PSG (musica a 3 canali + effetti sonori sul canale C)
//
// Tutto gira nell'interrupt VBlank (Audio_Update, chiamata da VSyncCallback):
// il codice di gioco si limita a chiedere una musica o un effetto.
// Musiche ed effetti si modificano in tools/psg_audio.py (genera data/psg/psg_data.h).
//=============================================================================

//=============================================================================
// INCLUDES
//=============================================================================
#include "msxgl.h"
#include "audio_api.h"

//=============================================================================
// DEFINES
//=============================================================================
#define AUDIO_START_GAME        0   // Stesse costanti di the-castel.h
#define AUDIO_LAST_LEVEL       25
#define AUDIO_GAME_OVER        26
#define AUDIO_GAME_WINNER      27

#define AUDIO_NO_DRUM        0xFF
#define AUDIO_SFX_CHANNEL       2   // Gli effetti usano il canale C

// Comandi nei dati dei canali
#define CMD_INSTRUMENT       0xE0
#define CMD_DRUM             0xF0
#define CMD_LOOP_POINT       0xFD
#define CMD_LOOP             0xFE
#define CMD_END              0xFF

//=============================================================================
// TIPI (usati anche dai dati generati)
//=============================================================================
typedef struct
{
	const u8* Env;      // Inviluppo del volume, 0xFF = tieni l'ultimo valore
	u8 VibDelay;        // Frame prima del vibrato
	u8 VibShift;        // Ampiezza del vibrato = periodo >> VibShift (0 = niente)
} AudioInst;

typedef struct
{
	const u8* Env;      // Inviluppo del volume
	u8 Noise;           // Periodo del rumore (0 = niente rumore)
	u16 Tone;           // Periodo del tono iniziale (0 = niente tono)
	i16 Sweep;          // Variazione del periodo per frame
} AudioDrum;

typedef struct
{
	const u8* Pos;      // Prossimo comando
	const u8* Loop;     // Punto di ripartenza
	u8 Wait;            // Frame che mancano al prossimo comando
	u8 Inst;            // Strumento corrente
	u8 Note;            // Nota corrente (0 = pausa)
	u8 Drum;            // Batteria corrente (AUDIO_NO_DRUM = nessuna)
	u8 Time;            // Frame dall'inizio della nota
	bool Ended;         // Canale terminato
} AudioChannel;

#include "data/psg/psg_data.h"

//=============================================================================
// MEMORY
//=============================================================================
__sfr __at(0xA0) g_PsgPortReg;
__sfr __at(0xA1) g_PsgPortData;

AudioChannel g_AudioChan[3];
u8 g_AudioSong = 0xFF;      // Musica corrente
bool g_AudioMusicOn = FALSE; // FALSE = musica in pausa (gli effetti suonano comunque)
bool g_AudioIngameMusic = AUDIO_INGAME_MUSIC; // Musica soft nei livelli di gioco

const u8* g_AudioSfx = NULL; // Frame corrente dell'effetto (NULL = nessuno)
u8 g_AudioSfxPrio = 0;

// Valori da scrivere nei registri del PSG in questo frame
u16 g_AudioPeriod[3];
u8 g_AudioVol[3];
u8 g_AudioMixer;            // Bit a 1 = tono/rumore spento (come il registro 7)
u8 g_AudioNoise;

//=============================================================================
// FUNZIONI INTERNE
//=============================================================================

/** Legge il volume di un inviluppo al frame t (0xFF = tieni l'ultimo valore) */
static u8 envAt(const u8* env, u8 t)
{
	u8 i = 0;
	while (i < t && env[i + 1] != 0xFF)
		i++;
	return env[i];
}

/** Esegue i comandi del canale fino alla prossima nota/pausa */
static void channelStep(AudioChannel* c)
{
	while (1)
	{
		u8 b = *c->Pos++;
		if (b == CMD_END)
		{
			c->Pos--;
			c->Ended = TRUE;
			c->Note = 0;
			c->Drum = AUDIO_NO_DRUM;
			return;
		}
		if (b == CMD_LOOP)
		{
			c->Pos = c->Loop;
			continue;
		}
		if (b == CMD_LOOP_POINT)
		{
			c->Loop = c->Pos;
			continue;
		}
		if ((b & 0xF0) == CMD_INSTRUMENT)
		{
			c->Inst = b & 0x0F;
			continue;
		}
		if ((b & 0xF0) == CMD_DRUM)
		{
			c->Drum = b & 0x0F;
			c->Note = 0;
		}
		else
		{
			c->Drum = AUDIO_NO_DRUM;
			c->Note = b;
		}
		c->Wait = *c->Pos++;
		c->Time = 0;
		return;
	}
}

/** Calcola l'uscita di un canale musicale */
static void channelUpdate(u8 ch)
{
	AudioChannel* c = &g_AudioChan[ch];
	u8 toneBit = 1 << ch;
	u8 noiseBit = 8 << ch;

	if (!c->Ended && c->Wait == 0)
		channelStep(c);

	g_AudioVol[ch] = 0;

	if (c->Drum != AUDIO_NO_DRUM)
	{
		const AudioDrum* d = &g_PsgDrum[c->Drum];
		g_AudioVol[ch] = envAt(d->Env, c->Time);
		if (d->Tone)
		{
			g_AudioPeriod[ch] = d->Tone + (i16)c->Time * d->Sweep;
			g_AudioMixer &= ~toneBit;
		}
		if (d->Noise)
		{
			g_AudioNoise = d->Noise;
			g_AudioMixer &= ~noiseBit;
		}
	}
	else if (c->Note)
	{
		const AudioInst* in = &g_PsgInst[c->Inst];
		u16 p = g_PsgNotes[c->Note];
		if (in->VibShift && c->Time >= in->VibDelay)
		{
			u16 d = p >> in->VibShift;
			u8 phase = (c->Time >> 1) & 3;
			if (phase == 1)
				p += d;
			else if (phase == 3)
				p -= d;
		}
		g_AudioPeriod[ch] = p;
		g_AudioVol[ch] = envAt(in->Env, c->Time);
		g_AudioMixer &= ~toneBit;
	}

	if (c->Time < 0xFF)
		c->Time++;
	if (c->Wait)
		c->Wait--;
}

/** Scrive un registro del PSG */
static void psgWrite(u8 reg, u8 value)
{
	g_PsgPortReg = reg;
	g_PsgPortData = value;
}

//=============================================================================
// FUNZIONI PUBBLICHE
//=============================================================================

/**
 * @brief Inizializza il player e spegne il PSG
 */
void Audio_Init()
{
	g_AudioSong = 0xFF;
	g_AudioMusicOn = FALSE;
	g_AudioSfx = NULL;
	for (u8 i = 0; i < 3; i++)
	{
		g_AudioChan[i].Ended = TRUE;
		g_AudioChan[i].Note = 0;
		g_AudioChan[i].Drum = AUDIO_NO_DRUM;
		psgWrite(8 + i, 0);
	}
}

/**
 * @brief Fa partire una musica dall'inizio (MUS_*)
 */
void Audio_PlaySong(u8 id)
{
	__asm__("di");
	for (u8 i = 0; i < 3; i++)
	{
		AudioChannel* c = &g_AudioChan[i];
		c->Pos = c->Loop = g_PsgSongs[id][i];
		c->Wait = 0;
		c->Inst = 0;
		c->Note = 0;
		c->Drum = AUDIO_NO_DRUM;
		c->Time = 0;
		c->Ended = FALSE;
	}
	g_AudioSong = id;
	g_AudioMusicOn = TRUE;
	__asm__("ei");
}

/**
 * @brief Mette in pausa / riprende la musica dal punto in cui era
 */
void Audio_PauseMusic()  { g_AudioMusicOn = FALSE; }
void Audio_ResumeMusic() { g_AudioMusicOn = TRUE; }

/**
 * @brief Suona un effetto (SFX_*) sul canale C. Non interrompe un effetto
 *        con priorita' piu' alta ancora in corso.
 */
void Audio_PlaySFX(u8 id)
{
	u8 prio = g_PsgSfxPrio[id];
	if (g_AudioSfx && prio < g_AudioSfxPrio)
		return;
	__asm__("di");
	g_AudioSfx = g_PsgSfx[id];
	g_AudioSfxPrio = prio;
	__asm__("ei");
}

/**
 * @brief Sceglie la musica in base alla stanza che si sta disegnando:
 *        musica soft nei livelli di gioco (o silenzio se g_AudioIngameMusic e' FALSE),
 *        musica dedicata per game over e vittoria
 */
void Audio_OnRoom(u8 levelIdx)
{
	if (levelIdx > AUDIO_START_GAME && levelIdx <= AUDIO_LAST_LEVEL)
	{
		if (!g_AudioIngameMusic)
			Audio_PauseMusic();
		else if (g_AudioSong != MUS_INGAME)
			Audio_PlaySong(MUS_INGAME);  // Entrando nel primo livello
		else
			Audio_ResumeMusic();         // Cambio stanza o morte: continua senza ripartire
	}
	else if (levelIdx == AUDIO_GAME_OVER)
		Audio_PlaySong(MUS_GAMEOVER);
	else if (levelIdx == AUDIO_GAME_WINNER)
		Audio_PlaySong(MUS_WINNER);
	else
		Audio_ResumeMusic();
}

/**
 * @brief Avanza musica ed effetti di un frame e aggiorna i registri del PSG.
 *        Va chiamata una volta per frame dall'interrupt VBlank.
 */
void Audio_Update()
{
	g_AudioMixer = 0x3F; // tutto spento
	g_AudioNoise = 0;

	if (g_AudioMusicOn && g_AudioSong != 0xFF)
	{
		channelUpdate(0);
		channelUpdate(1);
		channelUpdate(2);
	}
	else
	{
		g_AudioVol[0] = g_AudioVol[1] = g_AudioVol[2] = 0;
	}

	// L'effetto sostituisce il canale C della musica
	if (g_AudioSfx)
	{
		u8 ctrl = g_AudioSfx[0];
		if (ctrl == 0xFF)
		{
			g_AudioSfx = NULL;
		}
		else
		{
			g_AudioMixer |= 0x24; // canale C: tono e rumore spenti, poi si riaccendono sotto
			g_AudioVol[AUDIO_SFX_CHANNEL] = ctrl & 0x0F;
			if (ctrl & 0x10)
			{
				g_AudioPeriod[AUDIO_SFX_CHANNEL] = g_AudioSfx[2] | ((u16)g_AudioSfx[3] << 8);
				g_AudioMixer &= ~0x04;
			}
			if (ctrl & 0x20)
			{
				g_AudioNoise = g_AudioSfx[1];
				g_AudioMixer &= ~0x20;
			}
			g_AudioSfx += 4;
		}
	}

	// Registri 0-10: periodi, rumore, mixer, volumi
	for (u8 i = 0; i < 3; i++)
	{
		psgWrite(i * 2, g_AudioPeriod[i] & 0xFF);
		psgWrite(i * 2 + 1, (g_AudioPeriod[i] >> 8) & 0x0F);
	}
	psgWrite(6, g_AudioNoise & 0x1F);
	psgWrite(7, g_AudioMixer | 0x80); // bit 7 = porta B in uscita, bit 6 = porta A in ingresso (joystick)
	psgWrite(8, g_AudioVol[0]);
	psgWrite(9, g_AudioVol[1]);
	psgWrite(10, g_AudioVol[2]);
}
