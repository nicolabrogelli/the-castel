;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _VDP_InterruptHandler
	.globl _VDP_SetMode
	.globl _g_GameVSyncCB
	.globl _g_GameFrame
	.globl _g_GameVSync
	.globl _g_GamePrevState
	.globl _g_GameState
	.globl _g_GameExit
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _Game_Initialize
	.globl _Game_Update
	.globl _Game_Release
	.globl _Game_MainLoop
	.globl _Game_Exit
	.globl _Game_SetState
	.globl _Game_RestoreState
	.globl _Game_UpdateState
	.globl _Game_DefaultVSyncCB
	.globl _Game_WaitVSync
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_GameExit::
	.ds 1
_g_GameState::
	.ds 2
_g_GamePrevState::
	.ds 2
_g_GameVSync::
	.ds 1
_g_GameFrame::
	.ds 1
_g_GameVSyncCB::
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
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:22: void Game_Initialize(u8 screenMode)
;	---------------------------------
; Function Game_Initialize
; ---------------------------------
_Game_Initialize::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:24: VDP_SetMode(screenMode);
	ld	c, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:29: }
	jp	_VDP_SetMode
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:33: void Game_Update()
;	---------------------------------
; Function Game_Update
; ---------------------------------
_Game_Update::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:36: Game_WaitVSync();
	call	_Game_WaitVSync
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:39: Game_UpdateState();
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:41: }
	jp	_Game_UpdateState
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:45: void Game_Release()
;	---------------------------------
; Function Game_Release
; ---------------------------------
_Game_Release::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:50: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:70: void Game_MainLoop(u8 screenMode)
;	---------------------------------
; Function Game_MainLoop
; ---------------------------------
_Game_MainLoop::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:72: Game_Initialize(screenMode);
	call	_Game_Initialize
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:73: while(!g_GameExit)
00101$:
	ld	a, (_g_GameExit+0)
	or	a, a
	jp	NZ,_Game_Release
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:74: Game_Update();
	call	_Game_Update
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:75: Game_Release();
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:76: }
	jp	00101$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:80: void Game_Exit()
;	---------------------------------
; Function Game_Exit
; ---------------------------------
_Game_Exit::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:82: g_GameExit = TRUE;
	ld	hl, #_g_GameExit
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:83: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:106: void Game_SetState(State newState)
;	---------------------------------
; Function Game_SetState
; ---------------------------------
_Game_SetState::
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:108: g_GamePrevState = g_GameState;
	ld	hl, (_g_GameState)
	ld	(_g_GamePrevState), hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:109: g_GameState = newState;
	ld	(_g_GameState), de
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:110: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:114: void Game_RestoreState()
;	---------------------------------
; Function Game_RestoreState
; ---------------------------------
_Game_RestoreState::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:116: State prev = g_GamePrevState;
	ld	bc, (_g_GamePrevState)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:117: g_GamePrevState = g_GameState;
	ld	hl, (_g_GameState)
	ld	(_g_GamePrevState), hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:118: g_GameState = prev;
	ld	(_g_GameState), bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:119: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:123: void Game_UpdateState()
;	---------------------------------
; Function Game_UpdateState
; ---------------------------------
_Game_UpdateState::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:125: bool bFrameFinish = FALSE;
	ld	c, #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:126: while((g_GameState != NULL) && !bFrameFinish)
00102$:
	ld	a, (_g_GameState+1)
	ld	hl, #_g_GameState
	or	a, (hl)
	ret	Z
	ld	a, c
	or	a, a
	ret	NZ
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:128: bFrameFinish = g_GameState();
	ld	hl, (_g_GameState)
	call	___sdcc_call_hl
	ld	c, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:130: }
	jp	00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:160: void Game_DefaultVSyncCB() {}
;	---------------------------------
; Function Game_DefaultVSyncCB
; ---------------------------------
_Game_DefaultVSyncCB::
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:165: void VDP_InterruptHandler()
;	---------------------------------
; Function VDP_InterruptHandler
; ---------------------------------
_VDP_InterruptHandler::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:170: g_GameFrame++;
	ld	hl, #_g_GameFrame
	inc	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:171: g_GameVSyncCB();
	ld	hl, (_g_GameVSyncCB)
	call	___sdcc_call_hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:172: g_GameVSync = TRUE;
	ld	hl, #_g_GameVSync
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:173: }
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:177: void Game_WaitVSync()
;	---------------------------------
; Function Game_WaitVSync
; ---------------------------------
_Game_WaitVSync::
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:179: while(g_GameVSync == FALSE) {}
00101$:
	ld	a, (_g_GameVSync+0)
	or	a, a
	jr	Z, 00101$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:180: g_GameVSync = FALSE;
	ld	hl, #_g_GameVSync
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game.c:181: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_GameExit:
	.db #0x00	; 0
__xinit__g_GameState:
	.dw #0x0000
__xinit__g_GamePrevState:
	.dw #0x0000
__xinit__g_GameVSync:
	.db #0x00	; 0
__xinit__g_GameFrame:
	.db #0x00	; 0
__xinit__g_GameVSyncCB:
	.dw _Game_DefaultVSyncCB
	.area _CABS (ABS)
