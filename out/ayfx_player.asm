;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module ayfx_player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ayFX_Finish
	.globl _ayFX_Channel
	.globl _ayFX_Priority
	.globl _ayFX_Mode
	.globl _ayFX_Volume
	.globl _ayFX_Noise
	.globl _ayFX_Tone
	.globl _ayFX_Pointer
	.globl _ayFX_Bank
	.globl _ayFX_InitBank
	.globl _ayFX_PlayBank
	.globl _ayFX_Play
	.globl _ayFX_Update
	.globl _ayFX_Mute
	.globl _ayFX_Stop
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
G$g_PortPrimarySlot$0_0$0 == 0x00a8
_g_PortPrimarySlot	=	0x00a8
G$g_PortReadKeyboard$0_0$0 == 0x00a9
_g_PortReadKeyboard	=	0x00a9
G$g_PortAccessKeyboard$0_0$0 == 0x00aa
_g_PortAccessKeyboard	=	0x00aa
G$g_PortControl$0_0$0 == 0x00ab
_g_PortControl	=	0x00ab
G$g_VDP_DataPort$0_0$0 == 0x0098
_g_VDP_DataPort	=	0x0098
G$g_VDP_RegPort$0_0$0 == 0x0099
_g_VDP_RegPort	=	0x0099
G$g_VDP_AddrPort$0_0$0 == 0x0099
_g_VDP_AddrPort	=	0x0099
G$g_VDP_StatPort$0_0$0 == 0x0099
_g_VDP_StatPort	=	0x0099
G$g_PSG_RegPort$0_0$0 == 0x00a0
_g_PSG_RegPort	=	0x00a0
G$g_PSG_DataPort$0_0$0 == 0x00a1
_g_PSG_DataPort	=	0x00a1
G$g_PSG_StatPort$0_0$0 == 0x00a2
_g_PSG_StatPort	=	0x00a2
G$g_PSG_Ext_RegPort$0_0$0 == 0x0010
_g_PSG_Ext_RegPort	=	0x0010
G$g_PSG_Ext_DataPort$0_0$0 == 0x0011
_g_PSG_Ext_DataPort	=	0x0011
G$g_PSG_Ext_StatPort$0_0$0 == 0x0012
_g_PSG_Ext_StatPort	=	0x0012
G$g_MSXMusic_IndexPort$0_0$0 == 0x007c
_g_MSXMusic_IndexPort	=	0x007c
G$g_MSXMusic_DataPort$0_0$0 == 0x007d
_g_MSXMusic_DataPort	=	0x007d
G$g_MSXAudio_IndexPort$0_0$0 == 0x00c0
_g_MSXAudio_IndexPort	=	0x00c0
G$g_MSXAudio_DataPort$0_0$0 == 0x00c1
_g_MSXAudio_DataPort	=	0x00c1
G$g_MSXAudio_IndexPort2$0_0$0 == 0x00c2
_g_MSXAudio_IndexPort2	=	0x00c2
G$g_MSXAudio_DataPort2$0_0$0 == 0x00c3
_g_MSXAudio_DataPort2	=	0x00c3
G$g_RTC_AddrPort$0_0$0 == 0x00b4
_g_RTC_AddrPort	=	0x00b4
G$g_RTC_DataPort$0_0$0 == 0x00b5
_g_RTC_DataPort	=	0x00b5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$ayFX_Bank$0_0$0==.
_ayFX_Bank::
	.ds 2
G$ayFX_Pointer$0_0$0==.
_ayFX_Pointer::
	.ds 2
G$ayFX_Tone$0_0$0==.
_ayFX_Tone::
	.ds 2
G$ayFX_Noise$0_0$0==.
_ayFX_Noise::
	.ds 1
G$ayFX_Volume$0_0$0==.
_ayFX_Volume::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$ayFX_Mode$0_0$0==.
_ayFX_Mode::
	.ds 1
G$ayFX_Priority$0_0$0==.
_ayFX_Priority::
	.ds 1
G$ayFX_Channel$0_0$0==.
_ayFX_Channel::
	.ds 1
G$ayFX_Finish$0_0$0==.
_ayFX_Finish::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$ayFX_InitBank$0$0	= .
	.globl	G$ayFX_InitBank$0$0
	C$ayfx_player.c$71$0_0$25	= .
	.globl	C$ayfx_player.c$71$0_0$25
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:71: void ayFX_InitBank(void* bank)
;	---------------------------------
; Function ayFX_InitBank
; ---------------------------------
_ayFX_InitBank::
	C$ayfx_player.c$84$1_0$25	= .
	.globl	C$ayfx_player.c$84$1_0$25
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:84: __endasm;
	ld	(_ayFX_Bank), hl
	C$ayfx_player.c$85$1_0$25	= .
	.globl	C$ayfx_player.c$85$1_0$25
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:85: }	
	C$ayfx_player.c$85$1_0$25	= .
	.globl	C$ayfx_player.c$85$1_0$25
	XG$ayFX_InitBank$0$0	= .
	.globl	XG$ayFX_InitBank$0$0
	ret
	G$ayFX_PlayBank$0$0	= .
	.globl	G$ayFX_PlayBank$0$0
	C$ayfx_player.c$92$1_0$27	= .
	.globl	C$ayfx_player.c$92$1_0$27
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:92: u8 ayFX_PlayBank(u8 id, u8 prio) __NAKED
;	---------------------------------
; Function ayFX_PlayBank
; ---------------------------------
_ayFX_PlayBank::
	C$ayfx_player.c$172$1_0$27	= .
	.globl	C$ayfx_player.c$172$1_0$27
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:172: __endasm;
	ld	c, l
	ld	b, a
	ld	hl, (_ayFX_Bank)
	ld	a, (hl)
	or	a
	jr	z, CHECK_PRIO
	 CHECK_INDEX:
	ld	a, b
	cp	(hl)
	ld	a, #2
	jr	nc, INIT_END
	 CHECK_PRIO:
	ld	a, b
	ld	a, (_ayFX_Priority)
	cp	c
	ld	a, #1
	jr	c, INIT_END
	ld	a, c
	and	#0x0F
	ld	(_ayFX_Priority), a
	ld	de, (_ayFX_Bank)
	inc	de
	ld	l, b
	ld	h, #0
	add	hl, hl
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	add	hl, de
	ld	(_ayFX_Pointer), hl
	xor	a
	 INIT_END:
	ret
	C$ayfx_player.c$173$1_0$27	= .
	.globl	C$ayfx_player.c$173$1_0$27
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:173: }
	G$ayFX_Play$0$0	= .
	.globl	G$ayFX_Play$0$0
	C$ayfx_player.c$178$1_0$29	= .
	.globl	C$ayfx_player.c$178$1_0$29
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:178: void ayFX_Play(void* data)
;	---------------------------------
; Function ayFX_Play
; ---------------------------------
_ayFX_Play::
	C$ayfx_player.c$185$1_0$29	= .
	.globl	C$ayfx_player.c$185$1_0$29
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:185: __endasm;
	ld	(_ayFX_Pointer), hl
	xor	a
	ld	(_ayFX_Priority), a
	C$ayfx_player.c$186$1_0$29	= .
	.globl	C$ayfx_player.c$186$1_0$29
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:186: }
	C$ayfx_player.c$186$1_0$29	= .
	.globl	C$ayfx_player.c$186$1_0$29
	XG$ayFX_Play$0$0	= .
	.globl	XG$ayFX_Play$0$0
	ret
	G$ayFX_Update$0$0	= .
	.globl	G$ayFX_Update$0$0
	C$ayfx_player.c$190$1_0$30	= .
	.globl	C$ayfx_player.c$190$1_0$30
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:190: void ayFX_Update()
;	---------------------------------
; Function ayFX_Update
; ---------------------------------
_ayFX_Update::
	C$ayfx_player.c$322$1_0$30	= .
	.globl	C$ayfx_player.c$322$1_0$30
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:322: __endasm;
	ld	a, (_ayFX_Priority)
	or	a
	ret	m
	ld	a, (_ayFX_Mode)
	and	#1
	jr	z, TAKECB
	 CHANNEL_SWITCH:
	ld	hl, #_ayFX_Channel
	dec	(hl)
	jr	nz, TAKECB
	ld	(hl), #3
	 TAKECB:
	ld	hl, (_ayFX_Pointer)
	ld	c, (hl)
	inc	hl
	bit	5, c
	jr	z, CHECK_NN
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	(_ayFX_Tone), de
	 CHECK_NN:
	bit	6, c
	jr	z, SETPOINTER
	ld	a, (hl)
	inc	hl
	cp	#0x20
	jr	nz, CONTINUE
	ld	hl, (_ayFX_Finish)
	jp	(hl)
	 CONTINUE:
	ld	(_ayFX_Noise), a
	 SETPOINTER:
	ld	(_ayFX_Pointer), hl
	ld	a, c
	and	#0x0F
	ld	(_ayFX_Volume), a
	ret	z
	bit	7, c
	jr	nz, SETMASKS
	ld	a, (_ayFX_Noise)
	ld	(_PT3_Regs+6), a
	 SETMASKS:
	ld	a, c
	and	#0x90
	cp	#0x90
	ret	z
	rrca
	rrca
	ld	d, #0xDB
	ld	hl, #_ayFX_Channel
	ld	b, (hl)
	 CHK1:
	djnz	CHK2
	 PLAY_C:
	call	SETMIXER
	ld	(_PT3_Regs+10), a
	bit	2, c
	ret	nz
	ld	(_PT3_Regs+4), hl
	ret
	 CHK2:
	rrc	d
	rrca
	djnz	CHK3
	 PLAY_B:
	call	SETMIXER
	ld	(_PT3_Regs+9), a
	bit	1, c
	ret	nz
	ld	(_PT3_Regs+2), hl
	ret
	 CHK3:
	rrc	d
	rrca
	 PLAY_A:
	call	SETMIXER
	ld	(_PT3_Regs+8), a
	bit	0, c
	ret	nz
	ld	(_PT3_Regs+0), hl
	ret
	 SETMIXER:
	ld	c, a
	ld	a, (_PT3_Regs+7)
	and	d
	or	c
	ld	(_PT3_Regs+7), a
	ld	a, (_ayFX_Volume)
	ld	hl, (_ayFX_Tone)
	ret
	C$ayfx_player.c$323$1_0$30	= .
	.globl	C$ayfx_player.c$323$1_0$30
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:323: }
	C$ayfx_player.c$323$1_0$30	= .
	.globl	C$ayfx_player.c$323$1_0$30
	XG$ayFX_Update$0$0	= .
	.globl	XG$ayFX_Update$0$0
	ret
	G$ayFX_Mute$0$0	= .
	.globl	G$ayFX_Mute$0$0
	C$ayfx_player.c$327$1_0$31	= .
	.globl	C$ayfx_player.c$327$1_0$31
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:327: void ayFX_Mute()
;	---------------------------------
; Function ayFX_Mute
; ---------------------------------
_ayFX_Mute::
	C$ayfx_player.c$352$1_0$31	= .
	.globl	C$ayfx_player.c$352$1_0$31
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:352: __endasm;
	ld	a, #255
	ld	(_ayFX_Priority), a
	ld	hl, #_ayFX_Channel
	ld	b, (hl)
	xor	a
	 StopCheck1:
	djnz	StopCheck2
	ld	(_PT3_Regs+10), a
	ret
	 StopCheck2:
	djnz	StopCheck3
	ld	(_PT3_Regs+9), a
	ret
	 StopCheck3:
	ld	(_PT3_Regs+8), a
	C$ayfx_player.c$353$1_0$31	= .
	.globl	C$ayfx_player.c$353$1_0$31
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:353: }
	C$ayfx_player.c$353$1_0$31	= .
	.globl	C$ayfx_player.c$353$1_0$31
	XG$ayFX_Mute$0$0	= .
	.globl	XG$ayFX_Mute$0$0
	ret
	G$ayFX_Stop$0$0	= .
	.globl	G$ayFX_Stop$0$0
	C$ayfx_player.c$357$1_0$32	= .
	.globl	C$ayfx_player.c$357$1_0$32
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:357: void ayFX_Stop()
;	---------------------------------
; Function ayFX_Stop
; ---------------------------------
_ayFX_Stop::
	C$ayfx_player.c$363$1_0$32	= .
	.globl	C$ayfx_player.c$363$1_0$32
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:363: __endasm;
	ld	a, #255
	ld	(_ayFX_Priority), a
	C$ayfx_player.c$364$1_0$32	= .
	.globl	C$ayfx_player.c$364$1_0$32
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/ayfx/ayfx_player.c:364: }
	C$ayfx_player.c$364$1_0$32	= .
	.globl	C$ayfx_player.c$364$1_0$32
	XG$ayFX_Stop$0$0	= .
	.globl	XG$ayFX_Stop$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fayfx_player$__xinit_ayFX_Mode$0_0$0 == .
__xinit__ayFX_Mode:
	.db #0x00	; 0
Fayfx_player$__xinit_ayFX_Priority$0_0$0 == .
__xinit__ayFX_Priority:
	.db #0xff	; 255
Fayfx_player$__xinit_ayFX_Channel$0_0$0 == .
__xinit__ayFX_Channel:
	.db #0x01	; 1
Fayfx_player$__xinit_ayFX_Finish$0_0$0 == .
__xinit__ayFX_Finish:
	.dw _ayFX_Mute
	.area _CABS (ABS)
