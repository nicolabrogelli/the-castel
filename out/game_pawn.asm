;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module game_pawn
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Mem_Set
	.globl _VDP_SetSpriteColorSM1
	.globl _VDP_Peek_16K
	.globl _VDP_WriteVRAM_16K
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
	.globl _GamePawn_Initialize
	.globl _GamePawn_SetPosition
	.globl _GamePawn_SetAction
	.globl _GamePawn_Update
	.globl _GamePawn_Draw
	.globl _GamePawn_SetMovement
	.globl _GamePawn_InitializePhysics
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
_g_Game_DrawY:
	.ds 1
_g_Game_DrawX:
	.ds 1
_g_Game_DrawPattern:
	.ds 1
_g_Pawn:
	.ds 2
_g_Sprite:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:33: void GamePawn_Initialize(Game_Pawn* pawn, const Game_Sprite* sprtList, u8 sprtNum, u8 sprtID, const Game_Action* actList)
;	---------------------------------
; Function GamePawn_Initialize
; ---------------------------------
_GamePawn_Initialize::
	push	ix
	ld	ix,#0
	add	ix,sp
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:38: Mem_Set(0x00, g_Pawn, sizeof(Game_Pawn));
	ld	(_g_Pawn), hl
	push	de
	ld	bc, #0x0014
	push	bc
	ex	de, hl
	xor	a, a
	call	_Mem_Set
	pop	de
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:39: g_Pawn->SpriteList = sprtList;
	ld	hl, (_g_Pawn)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:40: g_Pawn->SpriteNum = sprtNum;
	ld	hl, (_g_Pawn)
	inc	hl
	inc	hl
	ld	a, 4 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:44: g_Pawn->ActionList = actList;
	ld	hl, (_g_Pawn)
	inc	hl
	inc	hl
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:47: GamePawn_SetAction(g_Pawn, 0);
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	hl, (_g_Pawn)
	call	_GamePawn_SetAction
	pop	de
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:53: g_Sprite = sprtList;
	ld	(_g_Sprite), de
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:54: loop(i, g_Pawn->SpriteNum)
	ld	c, #0x00
00103$:
	ld	hl, (_g_Pawn)
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NC, 00105$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:57: u8 sprtIdx = g_Sprite->SpriteID;
	ld	hl, (_g_Sprite)
	ld	b, (hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:60: VDP_SetSpriteColorSM1(sprtIdx, g_Sprite->Color);
	ld	de, #0x0004
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	ld	a, b
	call	_VDP_SetSpriteColorSM1
	pop	bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:70: g_Sprite++;
	ld	hl, #_g_Sprite
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
	jr	NC, 00118$
	inc	hl
	inc	(hl)
00118$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:54: loop(i, g_Pawn->SpriteNum)
	inc	c
	jp	00103$
00105$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:73: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
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
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:77: void GamePawn_SetPosition(Game_Pawn* pawn, u8 x, u8 y)
;	---------------------------------
; Function GamePawn_SetPosition
; ---------------------------------
_GamePawn_SetPosition::
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:79: pawn->PositionX = x;
	ld	hl, #0x0005
	add	hl, de
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:80: pawn->PositionY = y;
	ld	hl, #0x0006
	add	hl, de
	ld	a, 1 (iy)
	inc	iy
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:81: pawn->MoveX = 0;
	ld	hl, #0x000d
	add	hl, de
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:82: pawn->MoveY = 0;
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:83: pawn->Update |= PAWN_UPDATE_POSITION;
	ld	hl, #0x000b
	add	hl, de
	set	0, (hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:84: }
	pop	hl
	pop	af
	jp	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:89: void GamePawn_SetAction(Game_Pawn* pawn, u8 id)
;	---------------------------------
; Function GamePawn_SetAction
; ---------------------------------
_GamePawn_SetAction::
	dec	sp
	ld	c, l
	ld	b, h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:91: if(pawn->ActionId != id)
	ld	hl, #0x0007
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	ld	a, 3 (iy)
	sub	a, 0 (iy)
	jr	Z, 00103$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:93: pawn->ActionId = id;
	ld	a, 3 (iy)
	inc	iy
	inc	iy
	inc	iy
	ld	(de), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:94: pawn->AnimTimer = 0;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:95: pawn->AnimStep = 0;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:96: pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	hl, #0x000b
	add	hl, bc
	set	1, (hl)
	ld	a, (hl)
00103$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:98: }
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:102: void GamePawn_Update(Game_Pawn* pawn)
;	---------------------------------
; Function GamePawn_Update
; ---------------------------------
_GamePawn_Update::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-9
	add	iy, sp
	ld	sp, iy
	ld	(_g_Pawn), hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	bc, (_g_Pawn)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	pop	iy
	ld	l, 7 (iy)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	-5 (ix), l
	ld	-4 (ix), h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:108: if(g_Pawn->AnimTimer >= act->FrameList[g_Pawn->AnimStep].Duration)
	ld	hl, #0x000a
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	-3 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #9
	add	hl, bc
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	add	hl, bc
	inc	hl
	ld	a,-3 (ix)
	sub	a,(hl)
	jr	C, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:110: g_Pawn->AnimTimer = 0;
	xor	a, a
	ld	(de), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:111: g_Pawn->AnimStep++;
	ld	hl, (_g_Pawn)
	ld	bc, #0x0009
	add	hl, bc
	inc	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	bc, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:112: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	hl, #0x000b
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	set	1, a
	ld	(de), a
00102$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	hl, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:116: if(g_Pawn->AnimStep >= act->FrameNum)
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	bc,#9
	add	hl,bc
	ld	a, (hl)
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	sub	a, c
	jr	C, 00107$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:118: if(act->Loop) // restart action
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	and	a,#0x01
	jr	Z, 00104$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:120: g_Pawn->AnimTimer = 0;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:121: g_Pawn->AnimStep = 0;
	ld	hl, (_g_Pawn)
	ld	bc, #0x0009
	add	hl, bc
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	bc, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:112: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	hl, #0x000b
	add	hl, bc
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:122: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	a, (de)
	set	1, a
	ld	(de), a
	jp	00107$
00104$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:126: GamePawn_SetAction(g_Pawn, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, (_g_Pawn)
	call	_GamePawn_SetAction
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:127: return;
	jp	00158$
00107$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:132: const Game_Frame* frame = &act->FrameList[g_Pawn->AnimStep];
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	iy, (_g_Pawn)
	ld	l, 9 (iy)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:133: if(frame->Event != 0)
;	spillPairReg hl
;	spillPairReg hl
	ld	-2 (ix), l
	ld	-1 (ix), h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	jr	Z, 00109$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:134: frame->Event();
	ex	de, hl
	call	___sdcc_call_hl
00109$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:137: g_Pawn->AnimFrame = frame->Id;
	ld	bc, (_g_Pawn)
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	(de), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:138: g_Pawn->AnimTimer++;
	ld	hl, (_g_Pawn)
	ld	bc, #0x000a
	add	hl, bc
	inc	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:139: g_Pawn->Counter++;
	ld	hl, (_g_Pawn)
	ld	bc, #0x000c
	add	hl, bc
	inc	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	hl, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:142: if(g_Pawn->Update & PAWN_UPDATE_COLLISION)
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	bc,#11
	add	hl,bc
	bit	4, (hl)
	jp	Z,00158$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:144: u8 targetX = g_Pawn->PositionX + g_Pawn->MoveX;
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -1 (ix)
	add	a, -3 (ix)
	ld	-1 (ix), a
	ld	-7 (ix), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:145: u8 targetY = g_Pawn->PositionY + g_Pawn->MoveY;
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	ld	-8 (ix), a
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	add	a, -2 (ix)
	ld	-1 (ix), a
	ld	-6 (ix), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:149: if(g_Pawn->MoveY > 0)
	xor	a, a
	sub	a, -2 (ix)
	jp	PO, 00343$
	xor	a, #0x80
00343$:
	jp	P, 00138$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:152: if(targetY + GET_BOUND_Y >= GAMEPAWN_BORDER_MAX_Y)
	ld	c, -6 (ix)
	ld	b, #0x00
	ld	hl, #0x0010
	add	hl, bc
	ld	a, l
	sub	a, #0xb8
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00119$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:155: g_Pawn->PhysicsCB(PAWN_PHYSICS_BORDER_DOWN, 0);
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	hl, #16
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	push	bc
	pop	iy
	call	___sdcc_call_iy
	jp	00140$
00119$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:164: u8 cellY = (targetY + GET_BOUND_Y) / 8;
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00160$
	ld	hl, #0x0017
	add	hl, bc
	ex	de, hl
00160$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-4 (ix), e
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:165: u8 cellX, lastCell = 0xFF;
	ld	-3 (ix), #0xff
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:181: cellX = (targetX + (GET_BOUND_X / 4)) / 8;
	ld	c, -7 (ix)
	ld	b, #0x00
	ld	hl, #0x0004
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	bit	7, h
	jr	Z, 00161$
	ld	hl, #0x000b
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
00161$:
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -1 (ix)
	sra	e
	rr	l
	sra	e
	rr	l
	sra	e
	rr	l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:182: if(cellX != lastCell)
	ld	a, l
	inc	a
	jr	Z, 00113$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:184: lastCell = cellX;
	ld	-3 (ix), l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:185: u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	e, -4 (ix)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, (_g_ScreenLayoutLow)
	add	iy, de
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	iy
	pop	de
	add	hl, de
	call	_VDP_Peek_16K
	ld	e, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:186: if(g_Pawn->CollisionCB(tile))
	ld	iy, (_g_Pawn)
	ld	l, 18 (iy)
;	spillPairReg hl
	ld	h, 19 (iy)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, e
	call	___sdcc_call_hl
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00113$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:188: g_Pawn->PhysicsCB(PAWN_PHYSICS_COL_DOWN, tile);
	ld	hl, (_g_Pawn)
	ld	bc, #0x0010
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	push	bc
	pop	iy
	call	___sdcc_call_iy
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:189: targetY = (cellY * 8) - GET_BOUND_Y;
	ld	a, -4 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xf0
	ld	-6 (ix), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:190: goto skipVertival;
	jp	00140$
00113$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:209: cellX = (targetX + GET_BOUND_X - (GET_BOUND_X / 4)) / 8;
	ld	hl, #0x000c
	add	hl, bc
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00162$
	ld	hl, #0x0013
	add	hl, bc
	ex	de, hl
00162$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:210: if(cellX != lastCell)
	ld	a, -3 (ix)
	sub	a, e
	jp	Z,00140$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:213: u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_ScreenLayoutLow)
	add	hl, bc
	ld	d, #0x00
	add	hl, de
	call	_VDP_Peek_16K
	ld	e, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:214: if(g_Pawn->CollisionCB(tile))
	ld	iy, (_g_Pawn)
	ld	l, 18 (iy)
;	spillPairReg hl
	ld	h, 19 (iy)
;	spillPairReg hl
	push	de
	ld	a, e
	call	___sdcc_call_hl
	pop	de
	or	a, a
	jp	Z, 00140$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:216: g_Pawn->PhysicsCB(PAWN_PHYSICS_COL_DOWN, tile);
	ld	hl, (_g_Pawn)
	ld	bc, #0x0010
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	push	bc
	pop	iy
	call	___sdcc_call_iy
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:217: targetY = (cellY * 8) - GET_BOUND_Y;
	ld	a, -4 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xf0
	ld	-6 (ix), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:218: goto skipVertival;
	jp	00140$
00138$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:240: else if(g_Pawn->MoveY < 0)
	bit	7, -2 (ix)
	jp	Z, 00135$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:246: if(targetY > g_Pawn->PositionY)
	ld	a, -3 (ix)
	sub	a, -6 (ix)
	jr	NC, 00124$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:253: targetY = GAMEPAWN_BORDER_MIN_Y;
	ld	-6 (ix), #0x00
	jp	00140$
00124$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:259: u8 cellX = (targetX + (GET_BOUND_X / 2)) / 8;
	ld	c, -7 (ix)
	ld	b, #0x00
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00163$
	ld	hl, #0x000f
	add	hl, bc
	ex	de, hl
00163$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-1 (ix), e
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:260: u8 cellY = (targetY) / 8;
	ld	c, -6 (ix)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00164$
	ld	hl, #0x0007
	add	hl, bc
00164$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:261: u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	c,l
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	e, -1 (ix)
	ld	d, #0x00
	add	hl, de
	call	_VDP_Peek_16K
	ld	b, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:262: if(g_Pawn->CollisionCB(tile))
	ld	hl, (_g_Pawn)
	ld	de, #0x0012
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	a, b
	ex	de, hl
	call	___sdcc_call_hl
	pop	bc
	or	a, a
	jp	Z, 00140$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:264: g_Pawn->PhysicsCB(PAWN_PHYSICS_COL_UP, tile);
	ld	hl, (_g_Pawn)
	ld	de, #0x0010
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	push	de
	pop	iy
	call	___sdcc_call_iy
	pop	bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:265: targetY = (cellY * 8) + 8;
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ld	-6 (ix), a
	jp	00140$
00135$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:277: u8 tile = 0;
	ld	-5 (ix), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:278: u8 cellY = (targetY + GET_BOUND_Y) / 8;
	ld	c, -6 (ix)
	ld	b, #0x00
	ld	hl, #0x0010
	add	hl, bc
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00165$
	ld	hl, #0x0017
	add	hl, bc
	ex	de, hl
00165$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-4 (ix), e
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:279: u8 cellX, lastCell = 0xFF;
	ld	-3 (ix), #0xff
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:291: cellX = (targetX + (GET_BOUND_X / 4)) / 8;
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00166$
	ld	a, -9 (ix)
	add	a, #0x0b
	ld	c, a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	b, a
00166$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:292: if(cellX != lastCell)
	ld	a, c
	inc	a
	jr	Z, 00129$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:294: lastCell = cellX;
	ld	-3 (ix), c
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:295: tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ld	b, #0x00
	add	hl, bc
	call	_VDP_Peek_16K
	ld	-5 (ix), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:296: if(g_Pawn->CollisionCB(tile))
	ld	hl, (_g_Pawn)
	ld	de, #0x0012
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, -5 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	or	a, a
	jp	NZ, 00140$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:297: goto skipVertival;
00129$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:311: cellX = (targetX + GET_BOUND_X - (GET_BOUND_X / 4)) / 8;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	bit	7, h
	jr	Z, 00167$
	ld	a, -9 (ix)
	add	a, #0x13
	ld	-2 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
00167$:
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:312: if(cellX != lastCell)
	ld	-1 (ix), a
	sub	a, -3 (ix)
	jp	Z,00133$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:315: tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	a, -4 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	b, #0x05
00348$:
	sla	-3 (ix)
	rl	-2 (ix)
	djnz	00348$
	ld	hl, (_g_ScreenLayoutLow)
	ex	(sp), hl
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	add	a, -9 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	adc	a, -8 (ix)
	ld	-2 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	a, -5 (ix)
	add	a, -3 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	adc	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-2 (ix), a
	ld	a, -8 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_Peek_16K
	ld	-1 (ix), a
	ld	-5 (ix), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:316: if(g_Pawn->CollisionCB(tile))
	ld	hl, (_g_Pawn)
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	de, #0x0012
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -5 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
	ld	-1 (ix), a
	or	a, a
	jr	NZ, 00140$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:317: goto skipVertival;
00133$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:330: g_Pawn->PhysicsCB(PAWN_PHYSICS_FALL, tile);
	ld	hl, (_g_Pawn)
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
	push	iy
	ex	(sp), hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ex	(sp), hl
	ex	(sp), hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ex	(sp), hl
	pop	iy
	call	___sdcc_call_iy
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:333: skipVertival:
00140$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	hl, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:144: u8 targetX = g_Pawn->PositionX + g_Pawn->MoveX;
	ld	-3 (ix), l
	ld	-2 (ix), h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:336: if(g_Pawn->MoveX > 0)
	ld	bc,#13
	add	hl,bc
	ld	a, (hl)
	ld	-1 (ix), a
	xor	a, a
	sub	a, -1 (ix)
	jp	PO, 00349$
	xor	a, #0x80
00349$:
	jp	P, 00154$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:339: if((u8)(targetX + GET_BOUND_X) < g_Pawn->PositionX)
	ld	a, -7 (ix)
	add	a, #0x10
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #5
	add	hl, bc
	ld	c, (hl)
	sub	a, c
	jr	NC, 00144$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:342: g_Pawn->PhysicsCB(PAWN_PHYSICS_BORDER_RIGHT, 0);
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #16
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	push	bc
	pop	iy
	call	___sdcc_call_iy
	jp	00155$
00144$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:351: u8 cellX = (targetX + GET_BOUND_X) / 8;
	ld	c, -7 (ix)
	ld	b, #0x00
	ld	hl, #0x0010
	add	hl, bc
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00168$
	ld	hl, #0x0017
	add	hl, bc
	ex	de, hl
00168$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-1 (ix), e
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:352: u8 cellY = (targetY + (GET_BOUND_Y / 2)) / 8;
	ld	c, -6 (ix)
	ld	b, #0x00
	ld	hl, #0x0008
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00169$
	ld	hl, #0x000f
	add	hl, bc
00169$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:353: u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_ScreenLayoutLow)
	add	hl, bc
	ld	c, -1 (ix)
	ld	b, #0x00
	add	hl, bc
	call	_VDP_Peek_16K
	ld	e, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:354: if(g_Pawn->CollisionCB(tile))
	ld	iy, (_g_Pawn)
	ld	l, 18 (iy)
;	spillPairReg hl
	ld	h, 19 (iy)
;	spillPairReg hl
	push	de
	ld	a, e
	call	___sdcc_call_hl
	pop	de
	or	a, a
	jp	Z, 00155$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:356: g_Pawn->PhysicsCB(PAWN_PHYSICS_COL_RIGHT, tile);
	ld	hl, (_g_Pawn)
	ld	bc, #0x0010
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	push	bc
	pop	iy
	call	___sdcc_call_iy
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:357: targetX = (cellX * 8) - GET_BOUND_X;
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xf0
	ld	-7 (ix), a
	jp	00155$
00154$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:363: else if(g_Pawn->MoveX < 0)
	bit	7, -1 (ix)
	jp	Z, 00155$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:366: if(targetX > g_Pawn->PositionX)
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
	sub	a, -7 (ix)
	jr	NC, 00149$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:369: g_Pawn->PhysicsCB(PAWN_PHYSICS_BORDER_LEFT, 0);
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #16
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	push	bc
	pop	iy
	call	___sdcc_call_iy
	jp	00155$
00149$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:378: u8 cellX = (targetX) / 8;
	ld	c, -7 (ix)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00170$
	ld	hl, #0x0007
	add	hl, bc
00170$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	ld	-1 (ix), l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:379: u8 cellY = (targetY + (GET_BOUND_Y / 2)) / 8;
	ld	c, -6 (ix)
	ld	b, #0x00
	ld	hl, #0x0008
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00171$
	ld	hl, #0x000f
	add	hl, bc
00171$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:380: u8 tile = VDP_Peek_16K(g_ScreenLayoutLow + (cellY * 32) + cellX);
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_ScreenLayoutLow)
	add	hl, bc
	ld	c, -1 (ix)
	ld	b, #0x00
	add	hl, bc
	call	_VDP_Peek_16K
	ld	e, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:381: if(g_Pawn->CollisionCB(tile))
	ld	iy, (_g_Pawn)
	ld	l, 18 (iy)
;	spillPairReg hl
	ld	h, 19 (iy)
;	spillPairReg hl
	push	de
	ld	a, e
	call	___sdcc_call_hl
	pop	de
	or	a, a
	jr	Z, 00155$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:383: g_Pawn->PhysicsCB(PAWN_PHYSICS_COL_LEFT, tile);
	ld	hl, (_g_Pawn)
	ld	bc, #0x0010
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x03
	push	bc
	pop	iy
	call	___sdcc_call_iy
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:384: targetX = (cellX * 8) + 8;
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ld	-7 (ix), a
00155$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:389: g_Pawn->PositionX = targetX;
	ld	hl, (_g_Pawn)
	ld	bc, #0x0005
	add	hl, bc
	ld	a, -7 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:390: g_Pawn->PositionY = targetY;
	ld	hl, (_g_Pawn)
	ld	bc, #0x0006
	add	hl, bc
	ld	a, -6 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	hl, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:112: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	bc, #0x000b
	add	hl, bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:391: g_Pawn->Update |= PAWN_UPDATE_POSITION;
	set	0, (hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:105: const Game_Action* act = &g_Pawn->ActionList[g_Pawn->ActionId];
	ld	bc, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:112: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	hl, #0x000b
	add	hl, bc
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:392: g_Pawn->Update &= ~PAWN_UPDATE_COLLISION;
	ld	a, (de)
	res	4, a
	ld	(de), a
00158$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:395: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:399: void GamePawn_Draw(Game_Pawn* pawn)
;	---------------------------------
; Function GamePawn_Draw
; ---------------------------------
_GamePawn_Draw::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	(_g_Pawn), hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:402: if(g_Pawn->Update == 0)
	ld	bc, (_g_Pawn)
	push	bc
	pop	iy
	ld	a, 11 (iy)
	or	a, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:403: return;
	jp	Z,00121$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:405: g_Sprite = g_Pawn->SpriteList;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	(_g_Sprite+0), a
	ld	a, (hl)
	ld	(_g_Sprite+1), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:409: loop(i, g_Pawn->SpriteNum)
	ld	-1 (ix), #0x00
00119$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:402: if(g_Pawn->Update == 0)
	ld	bc, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:409: loop(i, g_Pawn->SpriteNum)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NC, 00117$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:411: if(g_Sprite->Flag & PAWN_SPRITE_EVEN) // Skip odd frames
	ld	hl, (_g_Sprite)
	ld	de, #0x0005
	add	hl, de
	ld	e, (hl)
	bit	0, e
	jr	Z, 00112$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:413: if((g_Pawn->Counter & 1) != 0)
	ld	e, c
	ld	d, b
	ld	hl, #12
	add	hl, de
	ld	a, (hl)
	rrca
	jp	C,00116$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:402: if(g_Pawn->Update == 0)
	ld	hl, #0x000b
	add	hl, bc
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:416: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	ld	a, (de)
	set	1, a
	ld	(de), a
	jp	00113$
00112$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:418: else if(g_Sprite->Flag & PAWN_SPRITE_ODD) // Skip even frames
	bit	1, e
	jr	Z, 00113$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:420: if((g_Pawn->Counter & 1) == 0)
	ld	e, c
	ld	d, b
	ld	hl, #12
	add	hl, de
	ld	a, (hl)
	rrca
	jr	NC, 00116$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:402: if(g_Pawn->Update == 0)
	ld	hl, #0x000b
	add	hl, bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:423: g_Pawn->Update |= PAWN_UPDATE_PATTERN;
	set	1, (hl)
00113$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:402: if(g_Pawn->Update == 0)
	ld	de, (_g_Pawn)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:426: g_Game_DrawY = g_Pawn->PositionY + g_Sprite->OffsetY - 1; // Decrement Y to fit screen coordinate
	push	de
	pop	iy
	ld	a, 6 (iy)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:411: if(g_Sprite->Flag & PAWN_SPRITE_EVEN) // Skip odd frames
	ld	bc, (_g_Sprite)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:426: g_Game_DrawY = g_Pawn->PositionY + g_Sprite->OffsetY - 1; // Decrement Y to fit screen coordinate
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	add	a, l
	ld	hl, #_g_Game_DrawY
	dec	a
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:427: g_Game_DrawX = g_Pawn->PositionX + g_Sprite->OffsetX;
	push	de
	pop	iy
	ld	a, 5 (iy)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	add	a, l
	ld	(_g_Game_DrawX+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:428: u8 size = 2;
	ld	-2 (ix), #0x02
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:430: if(g_Pawn->Update & PAWN_UPDATE_PATTERN)
	push	de
	pop	iy
	bit	1, 11 (iy)
	jr	Z, 00115$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:432: g_Game_DrawPattern = g_Pawn->AnimFrame + g_Sprite->DataOffset;
	ld	hl, #8
	add	hl, de
	ld	a, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	add	a, e
	ld	(_g_Game_DrawPattern+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:433: size++;
	ld	-2 (ix), #0x03
00115$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:437: u16 dest = g_SpriteAtributeLow + (g_Sprite->SpriteID * 4);
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, (_g_SpriteAttributeLow)
	add	hl, bc
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:439: VDP_WriteVRAM((u8*)&g_Game_DrawY, dest, g_SpriteAtributeHigh, size);
	ld	c, -2 (ix)
	ld	b, #0x00
	push	bc
	ld	hl, #_g_Game_DrawY
	call	_VDP_WriteVRAM_16K
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:444: SkipDrawing:
00116$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:446: g_Sprite = (const Game_Sprite*)((u8*)g_Sprite + sizeof(Game_Sprite));
	ld	hl, (_g_Sprite)
	ld	bc, #0x0006
	add	hl, bc
	ld	(_g_Sprite), hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:409: loop(i, g_Pawn->SpriteNum)
	inc	-1 (ix)
	jp	00119$
00117$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:448: g_Pawn->Update = 0;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x00
00121$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:449: }
	ld	sp, ix
	pop	ix
	ret
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:455: void GamePawn_SetMovement(Game_Pawn* pawn, i8 dx, i8 dy) 
;	---------------------------------
; Function GamePawn_SetMovement
; ---------------------------------
_GamePawn_SetMovement::
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:457: pawn->MoveX = dx;
	ld	hl, #0x000d
	add	hl, de
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:458: pawn->MoveY = dy;
	ld	hl, #0x000e
	add	hl, de
	ld	a, 1 (iy)
	inc	iy
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:459: pawn->Update |= PAWN_UPDATE_COLLISION;
	ld	hl, #0x000b
	add	hl, de
	set	4, (hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:460: }
	pop	hl
	pop	af
	jp	(hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:464: void GamePawn_InitializePhysics(Game_Pawn* pawn, Game_PhysicsCB pcb, Game_CollisionCB ccb, u8 boundX, u8 boundY)
;	---------------------------------
; Function GamePawn_InitializePhysics
; ---------------------------------
_GamePawn_InitializePhysics::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:468: pawn->PhysicsCB = pcb; 
	ld	hl, #0x0010
	add	hl, bc
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:469: pawn->CollisionCB = ccb;
	ld	hl, #0x0012
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/game_pawn.c:476: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
