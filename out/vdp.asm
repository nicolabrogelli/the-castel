;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module vdp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_VDPInitilized
	.globl _g_SpriteColorLow
	.globl _g_SpritePatternLow
	.globl _g_SpriteAttributeLow
	.globl _g_ScreenPatternLow
	.globl _g_ScreenColorLow
	.globl _g_ScreenLayoutLow
	.globl _g_VDP_Sprite
	.globl _g_VDP_Command
	.globl _g_VDP_Data
	.globl _g_VDP_REGSAV
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
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
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
	.globl _VDP_SetModeFlag
	.globl _VDP_SetModeGraphic1
	.globl _VDP_ClearVRAM
	.globl _VDP_WriteVRAM_16K
	.globl _VDP_FillVRAM_16K
	.globl _VDP_ReadVRAM_16K
	.globl _VDP_Peek_16K
	.globl _VDP_Poke_16K
	.globl _VDP_Initialize
	.globl _VDP_SetMode
	.globl _VDP_GetVersion
	.globl _VDP_RegWrite
	.globl _VDP_RegWriteBak
	.globl _VDP_RegWriteBakMask
	.globl _VDP_ReadDefaultStatus
	.globl _VDP_SetLayoutTable
	.globl _VDP_SetColorTable
	.globl _VDP_SetPatternTable
	.globl _VDP_SetSpriteAttributeTable
	.globl _VDP_SetSpritePatternTable
	.globl _VDP_LoadSpritePattern
	.globl _VDP_SetSpriteSM1
	.globl _VDP_SetSprite
	.globl _VDP_SetSpritePosition
	.globl _VDP_SetSpritePositionX
	.globl _VDP_SetSpritePositionY
	.globl _VDP_SetSpritePattern
	.globl _VDP_SetSpriteColorSM1
	.globl _VDP_DisableSpritesFrom
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
G$g_LINL40$0_0$0 == 0xf3ae
_g_LINL40	=	0xf3ae
G$g_LINL32$0_0$0 == 0xf3af
_g_LINL32	=	0xf3af
G$g_LINLEN$0_0$0 == 0xf3b0
_g_LINLEN	=	0xf3b0
G$g_CRTCNT$0_0$0 == 0xf3b1
_g_CRTCNT	=	0xf3b1
G$g_CLMLST$0_0$0 == 0xf3b2
_g_CLMLST	=	0xf3b2
G$g_TXTNAM$0_0$0 == 0xf3b3
_g_TXTNAM	=	0xf3b3
G$g_TXTCOL$0_0$0 == 0xf3b5
_g_TXTCOL	=	0xf3b5
G$g_TXTCGP$0_0$0 == 0xf3b7
_g_TXTCGP	=	0xf3b7
G$g_TXTATR$0_0$0 == 0xf3b9
_g_TXTATR	=	0xf3b9
G$g_TXTPAT$0_0$0 == 0xf3bb
_g_TXTPAT	=	0xf3bb
G$g_T32NAM$0_0$0 == 0xf3bd
_g_T32NAM	=	0xf3bd
G$g_T32COL$0_0$0 == 0xf3bf
_g_T32COL	=	0xf3bf
G$g_T32CGP$0_0$0 == 0xf3c1
_g_T32CGP	=	0xf3c1
G$g_T32ATR$0_0$0 == 0xf3c3
_g_T32ATR	=	0xf3c3
G$g_T32PAT$0_0$0 == 0xf3c5
_g_T32PAT	=	0xf3c5
G$g_GRPNAM$0_0$0 == 0xf3c7
_g_GRPNAM	=	0xf3c7
G$g_GRPCOL$0_0$0 == 0xf3c9
_g_GRPCOL	=	0xf3c9
G$g_GRPCGP$0_0$0 == 0xf3cb
_g_GRPCGP	=	0xf3cb
G$g_GRPATR$0_0$0 == 0xf3cd
_g_GRPATR	=	0xf3cd
G$g_GRPPAT$0_0$0 == 0xf3cf
_g_GRPPAT	=	0xf3cf
G$g_MLTNAM$0_0$0 == 0xf3d1
_g_MLTNAM	=	0xf3d1
G$g_MLTCOL$0_0$0 == 0xf3d3
_g_MLTCOL	=	0xf3d3
G$g_MLTCGP$0_0$0 == 0xf3d5
_g_MLTCGP	=	0xf3d5
G$g_MLTATR$0_0$0 == 0xf3d7
_g_MLTATR	=	0xf3d7
G$g_MLTPAT$0_0$0 == 0xf3d9
_g_MLTPAT	=	0xf3d9
G$g_CLIKSW$0_0$0 == 0xf3db
_g_CLIKSW	=	0xf3db
G$g_CSRY$0_0$0 == 0xf3dc
_g_CSRY	=	0xf3dc
G$g_CSRX$0_0$0 == 0xf3dd
_g_CSRX	=	0xf3dd
G$g_FORCLR$0_0$0 == 0xf3e9
_g_FORCLR	=	0xf3e9
G$g_BAKCLR$0_0$0 == 0xf3ea
_g_BAKCLR	=	0xf3ea
G$g_BDRCLR$0_0$0 == 0xf3eb
_g_BDRCLR	=	0xf3eb
G$g_ATRBYT$0_0$0 == 0xf3f2
_g_ATRBYT	=	0xf3f2
G$g_FNKSTR$0_0$0 == 0xf87f
_g_FNKSTR	=	0xf87f
G$g_CLOC$0_0$0 == 0xf92a
_g_CLOC	=	0xf92a
G$g_CMASK$0_0$0 == 0xf92c
_g_CMASK	=	0xf92c
G$g_LOGOPR$0_0$0 == 0xfb02
_g_LOGOPR	=	0xfb02
G$g_GRPACX$0_0$0 == 0xfcb7
_g_GRPACX	=	0xfcb7
G$g_GRPACY$0_0$0 == 0xfcb9
_g_GRPACY	=	0xfcb9
G$g_SLTSL$0_0$0 == 0xffff
_g_SLTSL	=	0xffff
G$g_VDP_REGSAV$0_0$0==.
_g_VDP_REGSAV::
	.ds 28
G$g_VDP_Data$0_0$0==.
_g_VDP_Data::
	.ds 2
G$g_VDP_Command$0_0$0==.
_g_VDP_Command::
	.ds 15
G$g_VDP_Sprite$0_0$0==.
_g_VDP_Sprite::
	.ds 4
G$g_ScreenLayoutLow$0_0$0==.
_g_ScreenLayoutLow::
	.ds 2
G$g_ScreenColorLow$0_0$0==.
_g_ScreenColorLow::
	.ds 2
G$g_ScreenPatternLow$0_0$0==.
_g_ScreenPatternLow::
	.ds 2
G$g_SpriteAttributeLow$0_0$0==.
_g_SpriteAttributeLow::
	.ds 2
G$g_SpritePatternLow$0_0$0==.
_g_SpritePatternLow::
	.ds 2
G$g_SpriteColorLow$0_0$0==.
_g_SpriteColorLow::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_VDPInitilized$0_0$0==.
_g_VDPInitilized::
	.ds 1
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
	G$VDP_SetModeFlag$0$0	= .
	.globl	G$VDP_SetModeFlag$0$0
	C$vdp.c$165$0_0$75	= .
	.globl	C$vdp.c$165$0_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:165: void VDP_SetModeFlag(u8 flag)
;	---------------------------------
; Function VDP_SetModeFlag
; ---------------------------------
_VDP_SetModeFlag::
	ld	e, a
	C$vdp.c$168$1_0$75	= .
	.globl	C$vdp.c$168$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:168: u8 reg1 = g_VDP_REGSAV[1];
	ld	a, (#_g_VDP_REGSAV + 1)
	C$vdp.c$169$1_0$75	= .
	.globl	C$vdp.c$169$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:169: reg1 &= 0b11100111;
	and	a, #0xe7
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$vdp.c$170$1_0$75	= .
	.globl	C$vdp.c$170$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:170: if(flag & 0b00001)
	bit	0, e
	jr	Z, 00102$
	C$vdp.c$171$1_0$75	= .
	.globl	C$vdp.c$171$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:171: reg1 |= 0b00010000;
	set	4, l
00102$:
	C$vdp.c$172$1_0$75	= .
	.globl	C$vdp.c$172$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:172: if(flag & 0b00010)
	bit	1, e
	jr	Z, 00104$
	C$vdp.c$173$1_0$75	= .
	.globl	C$vdp.c$173$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:173: reg1 |= 0b00001000;
	set	3, l
00104$:
	C$vdp.c$174$1_0$75	= .
	.globl	C$vdp.c$174$1_0$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:174: VDP_RegWriteBak(1, reg1);
	ld	a, #0x01
	call	_VDP_RegWriteBak
	C$vdp.c$177$1_1$76	= .
	.globl	C$vdp.c$177$1_1$76
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:177: u8 reg0 = g_VDP_REGSAV[0];
	ld	a, (#_g_VDP_REGSAV + 0)
	C$vdp.c$178$1_1$76	= .
	.globl	C$vdp.c$178$1_1$76
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:178: reg0 &= 0b11110001;
	and	a, #0xf1
	ld	c, a
	C$vdp.c$179$1_1$76	= .
	.globl	C$vdp.c$179$1_1$76
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:179: flag >>= 1;
	ld	a, e
	srl	a
	C$vdp.c$180$1_1$76	= .
	.globl	C$vdp.c$180$1_1$76
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:180: flag &= 0b00001110;
	and	a, #0x0e
	C$vdp.c$181$1_1$76	= .
	.globl	C$vdp.c$181$1_1$76
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:181: reg0 |= flag;
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$vdp.c$182$1_1$76	= .
	.globl	C$vdp.c$182$1_1$76
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:182: VDP_RegWriteBak(0, reg0);
	xor	a, a
	C$vdp.c$183$1_1$75	= .
	.globl	C$vdp.c$183$1_1$75
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:183: }
	C$vdp.c$183$1_1$75	= .
	.globl	C$vdp.c$183$1_1$75
	XG$VDP_SetModeFlag$0$0	= .
	.globl	XG$VDP_SetModeFlag$0$0
	jp	_VDP_RegWriteBak
G$g_RDPRIM$0_0$0 == 0xf380
_g_RDPRIM	=	0xf380
G$g_WRPRIM$0_0$0 == 0xf385
_g_WRPRIM	=	0xf385
G$g_CLPRIM$0_0$0 == 0xf38c
_g_CLPRIM	=	0xf38c
G$g_USRTAB$0_0$0 == 0xf39a
_g_USRTAB	=	0xf39a
G$g_CNSDFG$0_0$0 == 0xf3de
_g_CNSDFG	=	0xf3de
G$g_RG0SAV$0_0$0 == 0xf3df
_g_RG0SAV	=	0xf3df
G$g_RG1SAV$0_0$0 == 0xf3e0
_g_RG1SAV	=	0xf3e0
G$g_RG2SAV$0_0$0 == 0xf3e1
_g_RG2SAV	=	0xf3e1
G$g_RG3SAV$0_0$0 == 0xf3e2
_g_RG3SAV	=	0xf3e2
G$g_RG4SAV$0_0$0 == 0xf3e3
_g_RG4SAV	=	0xf3e3
G$g_RG5SAV$0_0$0 == 0xf3e4
_g_RG5SAV	=	0xf3e4
G$g_RG6SAV$0_0$0 == 0xf3e5
_g_RG6SAV	=	0xf3e5
G$g_RG7SAV$0_0$0 == 0xf3e6
_g_RG7SAV	=	0xf3e6
G$g_STATFL$0_0$0 == 0xf3e7
_g_STATFL	=	0xf3e7
G$g_TRGFLG$0_0$0 == 0xf3e8
_g_TRGFLG	=	0xf3e8
G$g_MAXUPD$0_0$0 == 0xf3ec
_g_MAXUPD	=	0xf3ec
G$g_MINUPD$0_0$0 == 0xf3ef
_g_MINUPD	=	0xf3ef
G$g_QUEUES$0_0$0 == 0xf3f3
_g_QUEUES	=	0xf3f3
G$g_FRCNEW$0_0$0 == 0xf3f5
_g_FRCNEW	=	0xf3f5
G$g_SCNCNT$0_0$0 == 0xf3f6
_g_SCNCNT	=	0xf3f6
G$g_REPCNT$0_0$0 == 0xf3f7
_g_REPCNT	=	0xf3f7
G$g_PUTPNT$0_0$0 == 0xf3f8
_g_PUTPNT	=	0xf3f8
G$g_GETPNT$0_0$0 == 0xf3fa
_g_GETPNT	=	0xf3fa
G$g_CS120$0_0$0 == 0xf3fc
_g_CS120	=	0xf3fc
G$g_CS240$0_0$0 == 0xf401
_g_CS240	=	0xf401
G$g_LOW$0_0$0 == 0xf406
_g_LOW	=	0xf406
G$g_HIGH$0_0$0 == 0xf408
_g_HIGH	=	0xf408
G$g_HEADER$0_0$0 == 0xf40a
_g_HEADER	=	0xf40a
G$g_ASPCT1$0_0$0 == 0xf40b
_g_ASPCT1	=	0xf40b
G$g_ASPCT2$0_0$0 == 0xf40d
_g_ASPCT2	=	0xf40d
G$g_QUETAB$0_0$0 == 0xf959
_g_QUETAB	=	0xf959
G$g_QUEBAK$0_0$0 == 0xf971
_g_QUEBAK	=	0xf971
G$g_VOICAQ$0_0$0 == 0xf975
_g_VOICAQ	=	0xf975
G$g_VOICBQ$0_0$0 == 0xf9f5
_g_VOICBQ	=	0xf9f5
G$g_VOICCQ$0_0$0 == 0xfa75
_g_VOICCQ	=	0xfa75
G$g_RS2IQ$0_0$0 == 0xfaf5
_g_RS2IQ	=	0xfaf5
G$g_DPPAGE$0_0$0 == 0xfaf5
_g_DPPAGE	=	0xfaf5
G$g_ACPAGE$0_0$0 == 0xfaf6
_g_ACPAGE	=	0xfaf6
G$g_AVCSAV$0_0$0 == 0xfaf7
_g_AVCSAV	=	0xfaf7
G$g_EXBRSA$0_0$0 == 0xfaf8
_g_EXBRSA	=	0xfaf8
G$g_CHRCNT$0_0$0 == 0xfaf9
_g_CHRCNT	=	0xfaf9
G$g_ROMA$0_0$0 == 0xfafa
_g_ROMA	=	0xfafa
G$g_MODE$0_0$0 == 0xfafc
_g_MODE	=	0xfafc
G$g_NORUSE$0_0$0 == 0xfafd
_g_NORUSE	=	0xfafd
G$g_XSAVE$0_0$0 == 0xfafe
_g_XSAVE	=	0xfafe
G$g_YSAVE$0_0$0 == 0xfb00
_g_YSAVE	=	0xfb00
G$g_RSTMP$0_0$0 == 0xfb03
_g_RSTMP	=	0xfb03
G$g_TOCNT$0_0$0 == 0xfb03
_g_TOCNT	=	0xfb03
G$g_RSFCB$0_0$0 == 0xfb04
_g_RSFCB	=	0xfb04
G$g_RSIQLN$0_0$0 == 0xfb06
_g_RSIQLN	=	0xfb06
G$g_MEXBIh$0_0$0 == 0xfb07
_g_MEXBIh	=	0xfb07
G$g_OLDSTT$0_0$0 == 0xfb0c
_g_OLDSTT	=	0xfb0c
G$g_OLDINT$0_0$0 == 0xfb0c
_g_OLDINT	=	0xfb0c
G$g_DEVNUM$0_0$0 == 0xfb16
_g_DEVNUM	=	0xfb16
G$g_DATCNT$0_0$0 == 0xfb17
_g_DATCNT	=	0xfb17
G$g_ERRORS$0_0$0 == 0xfb1a
_g_ERRORS	=	0xfb1a
G$g_FLAGS$0_0$0 == 0xfb1b
_g_FLAGS	=	0xfb1b
G$g_ESTBLS$0_0$0 == 0xfb1c
_g_ESTBLS	=	0xfb1c
G$g_COMMSK$0_0$0 == 0xfb1d
_g_COMMSK	=	0xfb1d
G$g_LSTCOM$0_0$0 == 0xfb1e
_g_LSTCOM	=	0xfb1e
G$g_LSTMOD$0_0$0 == 0xfb1f
_g_LSTMOD	=	0xfb1f
G$g_PRSCNT$0_0$0 == 0xfb35
_g_PRSCNT	=	0xfb35
G$g_SAVSP$0_0$0 == 0xfb36
_g_SAVSP	=	0xfb36
G$g_VOICEN$0_0$0 == 0xfb38
_g_VOICEN	=	0xfb38
G$g_SAVVOL$0_0$0 == 0xfb39
_g_SAVVOL	=	0xfb39
G$g_MCLLEN$0_0$0 == 0xfb3b
_g_MCLLEN	=	0xfb3b
G$g_MCLPTR$0_0$0 == 0xfb3c
_g_MCLPTR	=	0xfb3c
G$g_QUEUEN$0_0$0 == 0xfb3e
_g_QUEUEN	=	0xfb3e
G$g_MUSICF$0_0$0 == 0xfb3f
_g_MUSICF	=	0xfb3f
G$g_PLYCNT$0_0$0 == 0xfb40
_g_PLYCNT	=	0xfb40
G$g_VCBA$0_0$0 == 0xfb41
_g_VCBA	=	0xfb41
G$g_VCBB$0_0$0 == 0xfb66
_g_VCBB	=	0xfb66
G$g_VCBC$0_0$0 == 0xfb8b
_g_VCBC	=	0xfb8b
G$g_ENSTOP$0_0$0 == 0xfbb0
_g_ENSTOP	=	0xfbb0
G$g_BASROM$0_0$0 == 0xfbb1
_g_BASROM	=	0xfbb1
G$g_LINTTB$0_0$0 == 0xfbb2
_g_LINTTB	=	0xfbb2
G$g_FSTPOS$0_0$0 == 0xfbca
_g_FSTPOS	=	0xfbca
G$g_CODSAV$0_0$0 == 0xfbcc
_g_CODSAV	=	0xfbcc
G$g_FNKSWI$0_0$0 == 0xfbcd
_g_FNKSWI	=	0xfbcd
G$g_FNKFLG$0_0$0 == 0xfbce
_g_FNKFLG	=	0xfbce
G$g_ONGSBF$0_0$0 == 0xfbd8
_g_ONGSBF	=	0xfbd8
G$g_CLIKFL$0_0$0 == 0xfbd9
_g_CLIKFL	=	0xfbd9
G$g_OLDKEY$0_0$0 == 0xfbda
_g_OLDKEY	=	0xfbda
G$g_NEWKEY$0_0$0 == 0xfbe5
_g_NEWKEY	=	0xfbe5
G$g_KEYBUF$0_0$0 == 0xfbf0
_g_KEYBUF	=	0xfbf0
G$g_LINWRK$0_0$0 == 0xfc18
_g_LINWRK	=	0xfc18
G$g_PATWRK$0_0$0 == 0xfc40
_g_PATWRK	=	0xfc40
G$g_BOTTOM$0_0$0 == 0xfc48
_g_BOTTOM	=	0xfc48
G$g_HIMEM$0_0$0 == 0xfc4a
_g_HIMEM	=	0xfc4a
G$g_TRPTBL$0_0$0 == 0xfc4c
_g_TRPTBL	=	0xfc4c
G$g_RTYCNT$0_0$0 == 0xfc9a
_g_RTYCNT	=	0xfc9a
G$g_INTFLG$0_0$0 == 0xfc9b
_g_INTFLG	=	0xfc9b
G$g_PADY$0_0$0 == 0xfc9c
_g_PADY	=	0xfc9c
G$g_PADX$0_0$0 == 0xfc9d
_g_PADX	=	0xfc9d
G$g_JIFFY$0_0$0 == 0xfc9e
_g_JIFFY	=	0xfc9e
G$g_INTVAL$0_0$0 == 0xfca0
_g_INTVAL	=	0xfca0
G$g_INTCNT$0_0$0 == 0xfca2
_g_INTCNT	=	0xfca2
G$g_LOWLIM$0_0$0 == 0xfca4
_g_LOWLIM	=	0xfca4
G$g_WINWID$0_0$0 == 0xfca5
_g_WINWID	=	0xfca5
G$g_GRPHED$0_0$0 == 0xfca6
_g_GRPHED	=	0xfca6
G$g_ESCCNT$0_0$0 == 0xfca7
_g_ESCCNT	=	0xfca7
G$g_INSFLG$0_0$0 == 0xfca8
_g_INSFLG	=	0xfca8
G$g_CSRSW$0_0$0 == 0xfca9
_g_CSRSW	=	0xfca9
G$g_CSTYLE$0_0$0 == 0xfcaa
_g_CSTYLE	=	0xfcaa
G$g_CAPST$0_0$0 == 0xfcab
_g_CAPST	=	0xfcab
G$g_KANAST$0_0$0 == 0xfcac
_g_KANAST	=	0xfcac
G$g_KANAMD$0_0$0 == 0xfcad
_g_KANAMD	=	0xfcad
G$g_FLBMEM$0_0$0 == 0xfcae
_g_FLBMEM	=	0xfcae
G$g_SCRMOD$0_0$0 == 0xfcaf
_g_SCRMOD	=	0xfcaf
G$g_OLDSCR$0_0$0 == 0xfcb0
_g_OLDSCR	=	0xfcb0
G$g_CASPRV$0_0$0 == 0xfcb1
_g_CASPRV	=	0xfcb1
G$g_BRDATR$0_0$0 == 0xfcb2
_g_BRDATR	=	0xfcb2
G$g_GXPOS$0_0$0 == 0xfcb3
_g_GXPOS	=	0xfcb3
G$g_GYPOS$0_0$0 == 0xfcb5
_g_GYPOS	=	0xfcb5
G$g_DRWFLG$0_0$0 == 0xfcbb
_g_DRWFLG	=	0xfcbb
G$g_DRWSCL$0_0$0 == 0xfcbc
_g_DRWSCL	=	0xfcbc
G$g_DRWANG$0_0$0 == 0xfcbd
_g_DRWANG	=	0xfcbd
G$g_MNROM$0_0$0 == 0xfcc1
_g_MNROM	=	0xfcc1
G$g_EXPTBL$0_0$0 == 0xfcc1
_g_EXPTBL	=	0xfcc1
G$g_SLTTBL$0_0$0 == 0xfcc5
_g_SLTTBL	=	0xfcc5
G$g_SLTATR$0_0$0 == 0xfcc9
_g_SLTATR	=	0xfcc9
G$g_SLTWRK$0_0$0 == 0xfd09
_g_SLTWRK	=	0xfd09
G$g_PROCNM$0_0$0 == 0xfd89
_g_PROCNM	=	0xfd89
G$g_RG08SAV$0_0$0 == 0xffe7
_g_RG08SAV	=	0xffe7
G$g_RG09SAV$0_0$0 == 0xffe8
_g_RG09SAV	=	0xffe8
G$g_RG10SAV$0_0$0 == 0xffe9
_g_RG10SAV	=	0xffe9
G$g_RG11SAV$0_0$0 == 0xffea
_g_RG11SAV	=	0xffea
G$g_RG12SAV$0_0$0 == 0xffeb
_g_RG12SAV	=	0xffeb
G$g_RG13SAV$0_0$0 == 0xffec
_g_RG13SAV	=	0xffec
G$g_RG14SAV$0_0$0 == 0xffed
_g_RG14SAV	=	0xffed
G$g_RG15SAV$0_0$0 == 0xffee
_g_RG15SAV	=	0xffee
G$g_RG16SAV$0_0$0 == 0xffef
_g_RG16SAV	=	0xffef
G$g_RG17SAV$0_0$0 == 0xfff0
_g_RG17SAV	=	0xfff0
G$g_RG18SAV$0_0$0 == 0xfff1
_g_RG18SAV	=	0xfff1
G$g_RG19SAV$0_0$0 == 0xfff2
_g_RG19SAV	=	0xfff2
G$g_RG20SAV$0_0$0 == 0xfff3
_g_RG20SAV	=	0xfff3
G$g_RG21SAV$0_0$0 == 0xfff4
_g_RG21SAV	=	0xfff4
G$g_RG22SAV$0_0$0 == 0xfff5
_g_RG22SAV	=	0xfff5
G$g_RG23SAV$0_0$0 == 0xfff6
_g_RG23SAV	=	0xfff6
G$g_MINROM$0_0$0 == 0xfff7
_g_MINROM	=	0xfff7
G$g_SVFFF8$0_0$0 == 0xfff8
_g_SVFFF8	=	0xfff8
G$g_RG25SAV$0_0$0 == 0xfffa
_g_RG25SAV	=	0xfffa
G$g_RG26SAV$0_0$0 == 0xfffb
_g_RG26SAV	=	0xfffb
G$g_RG27SAV$0_0$0 == 0xfffc
_g_RG27SAV	=	0xfffc
G$g_SVFFFD$0_0$0 == 0xfffd
_g_SVFFFD	=	0xfffd
G$g_CGTABL$0_0$0 == 0x0004
_g_CGTABL	=	0x0004
G$g_VDP_DR$0_0$0 == 0x0006
_g_VDP_DR	=	0x0006
G$g_VDP_DW$0_0$0 == 0x0007
_g_VDP_DW	=	0x0007
G$g_BASRVN$0_0$0 == 0x002b
_g_BASRVN	=	0x002b
G$g_ROMVersion$0_0$0 == 0x002b
_g_ROMVersion	=	0x002b
G$g_MSXVER$0_0$0 == 0x002d
_g_MSXVER	=	0x002d
G$g_MSXMID$0_0$0 == 0x002e
_g_MSXMID	=	0x002e
G$g_CHAR_16$0_0$0 == 0x0034
_g_CHAR_16	=	0x0034
	G$VDP_SetModeGraphic1$0$0	= .
	.globl	G$VDP_SetModeGraphic1$0$0
	C$vdp.c$214$1_1$77	= .
	.globl	C$vdp.c$214$1_1$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:214: void VDP_SetModeGraphic1()
;	---------------------------------
; Function VDP_SetModeGraphic1
; ---------------------------------
_VDP_SetModeGraphic1::
	C$vdp.c$216$1_0$77	= .
	.globl	C$vdp.c$216$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:216: VDP_SetModeFlag(VDP_G1_MODE);
	xor	a, a
	call	_VDP_SetModeFlag
	C$vdp.c$217$1_0$77	= .
	.globl	C$vdp.c$217$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:217: VDP_SetLayoutTable(VDP_G1_ADDR_NT);
	ld	hl, #0x1800
	call	_VDP_SetLayoutTable
	C$vdp.c$218$1_0$77	= .
	.globl	C$vdp.c$218$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:218: VDP_SetColorTable(VDP_G1_ADDR_CT);
	ld	hl, #0x2000
	call	_VDP_SetColorTable
	C$vdp.c$219$1_0$77	= .
	.globl	C$vdp.c$219$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:219: VDP_SetPatternTable(VDP_G1_ADDR_PT);
	ld	hl, #0x0000
	call	_VDP_SetPatternTable
	C$vdp.c$221$1_0$77	= .
	.globl	C$vdp.c$221$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:221: VDP_SetSpriteAttributeTable(VDP_G1_ADDR_SAT);
	ld	hl, #0x1b00
	call	_VDP_SetSpriteAttributeTable
	C$vdp.c$222$1_0$77	= .
	.globl	C$vdp.c$222$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:222: VDP_SetSpritePatternTable(VDP_G1_ADDR_SPT);
	ld	hl, #0x3800
	C$vdp.c$224$1_0$77	= .
	.globl	C$vdp.c$224$1_0$77
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:224: }
	C$vdp.c$224$1_0$77	= .
	.globl	C$vdp.c$224$1_0$77
	XG$VDP_SetModeGraphic1$0$0	= .
	.globl	XG$VDP_SetModeGraphic1$0$0
	jp	_VDP_SetSpritePatternTable
	G$VDP_ClearVRAM$0$0	= .
	.globl	G$VDP_ClearVRAM$0$0
	C$vdp.c$251$1_0$78	= .
	.globl	C$vdp.c$251$1_0$78
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:251: void VDP_ClearVRAM()
;	---------------------------------
; Function VDP_ClearVRAM
; ---------------------------------
_VDP_ClearVRAM::
	C$vdp.c$254$1_0$78	= .
	.globl	C$vdp.c$254$1_0$78
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:254: VDP_FillVRAM_16K(0, 0x0000, 0x4000);  // Clear 16 KB of VRAM
	ld	hl, #0x4000
	push	hl
	ld	de, #0x0000
	xor	a, a
	call	_VDP_FillVRAM_16K
	C$vdp.c$261$1_0$78	= .
	.globl	C$vdp.c$261$1_0$78
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:261: }
	C$vdp.c$261$1_0$78	= .
	.globl	C$vdp.c$261$1_0$78
	XG$VDP_ClearVRAM$0$0	= .
	.globl	XG$VDP_ClearVRAM$0$0
	ret
	G$VDP_WriteVRAM_16K$0$0	= .
	.globl	G$VDP_WriteVRAM_16K$0$0
	C$vdp.c$272$1_0$80	= .
	.globl	C$vdp.c$272$1_0$80
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:272: void VDP_WriteVRAM_16K(const u8* src, u16 dest, u16 count)
;	---------------------------------
; Function VDP_WriteVRAM_16K
; ---------------------------------
_VDP_WriteVRAM_16K::
	C$vdp.c$341$1_0$80	= .
	.globl	C$vdp.c$341$1_0$80
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:341: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	a, e
	di
	out	(0x99), a
	ld	a, d
	and	a, #0x3F
	or	a, #0x40
	ei
	out	(0x99), a
	ld	e, 0(iy)
	ld	d, 1(iy)
	ld	c, #0x98
	ld	b, e
	dec	de
	inc	d
	 wrt16_loop_start:
	outi
	jp	nz, wrt16_loop_start
	dec	d
	jp	nz, wrt16_loop_start
	 wrt16_loop_end:
	C$vdp.c$342$1_0$80	= .
	.globl	C$vdp.c$342$1_0$80
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:342: }
	pop	hl
	pop	af
	jp	(hl)
	G$VDP_FillVRAM_16K$0$0	= .
	.globl	G$VDP_FillVRAM_16K$0$0
	C$vdp.c$351$1_0$82	= .
	.globl	C$vdp.c$351$1_0$82
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:351: void VDP_FillVRAM_16K(u8 value, u16 dest, u16 count) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function VDP_FillVRAM_16K
; ---------------------------------
_VDP_FillVRAM_16K::
	C$vdp.c$402$1_0$82	= .
	.globl	C$vdp.c$402$1_0$82
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:402: __endasm;
	ld	c, a
	ld	a, e
	di
	out	(0x99), a
	ld	a, d
	and	a, #0x3F
	or	a, #0x40
	out	(0x99), a
	pop	iy
	pop	de
	ld	a, c
	ld	b, e
	dec	de
	inc	d
	 fll16_loop_start:
	out	(0x98), a
	nop
	djnz	fll16_loop_start
	dec	d
	jp	nz, fll16_loop_start
	 fll16_loop_end:
	ei
	jp	(iy)
	C$vdp.c$403$1_0$82	= .
	.globl	C$vdp.c$403$1_0$82
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:403: }
	G$VDP_ReadVRAM_16K$0$0	= .
	.globl	G$VDP_ReadVRAM_16K$0$0
	C$vdp.c$516$1_0$84	= .
	.globl	C$vdp.c$516$1_0$84
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:516: void VDP_ReadVRAM_16K(u16 src, u8* dest, u16 count)
;	---------------------------------
; Function VDP_ReadVRAM_16K
; ---------------------------------
_VDP_ReadVRAM_16K::
	C$vdp.c$586$1_0$84	= .
	.globl	C$vdp.c$586$1_0$84
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:586: __endasm;
	ld	iy, #2
	add	iy, sp
	ld	a, l
	di
	out	(0x99), a
	ld	a, h
	and	a, #0x3F
	ei
	out	(0x99), a
	ex	de, hl
	ld	e, 0(iy)
	ld	d, 1(iy)
	ld	c, #0x98
	ld	b, e
	dec	de
	inc	d
	 rd16_loop_start:
	ini
	jp	nz, rd16_loop_start
	dec	d
	jp	nz, rd16_loop_start
	 rd16_loop_end:
	C$vdp.c$587$1_0$84	= .
	.globl	C$vdp.c$587$1_0$84
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:587: }
	pop	hl
	pop	af
	jp	(hl)
	G$VDP_Peek_16K$0$0	= .
	.globl	G$VDP_Peek_16K$0$0
	C$vdp.c$597$1_0$86	= .
	.globl	C$vdp.c$597$1_0$86
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:597: u8 VDP_Peek_16K(u16 dest) __PRESERVES(b, c, d, e, iyl, iyh)
;	---------------------------------
; Function VDP_Peek_16K
; ---------------------------------
_VDP_Peek_16K::
	C$vdp.c$632$1_0$86	= .
	.globl	C$vdp.c$632$1_0$86
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:632: __endasm;
	ld	a, l
	di
	out	(0x99), a
	ld	a, h
	and	a, #0x3F
	out	(0x99), a
	add	hl, hl
	ei
	in	a, (0x98)
	C$vdp.c$633$1_0$86	= .
	.globl	C$vdp.c$633$1_0$86
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:633: }
	C$vdp.c$633$1_0$86	= .
	.globl	C$vdp.c$633$1_0$86
	XG$VDP_Peek_16K$0$0	= .
	.globl	XG$VDP_Peek_16K$0$0
	ret
	G$VDP_Poke_16K$0$0	= .
	.globl	G$VDP_Poke_16K$0$0
	C$vdp.c$641$1_0$88	= .
	.globl	C$vdp.c$641$1_0$88
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:641: void VDP_Poke_16K(u8 val, u16 dest) __PRESERVES(c, h, l, iyl, iyh)
;	---------------------------------
; Function VDP_Poke_16K
; ---------------------------------
_VDP_Poke_16K::
	C$vdp.c$678$1_0$88	= .
	.globl	C$vdp.c$678$1_0$88
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:678: __endasm;
	ld	b, a
	ld	a, e
	di
	out	(0x99), a
	ld	a, d
	and	a, #0x3F
	or	a, #0x40
	out	(0x99), a
	inc	de
	ld	a, b
	ei
	out	(0x98), a
	C$vdp.c$679$1_0$88	= .
	.globl	C$vdp.c$679$1_0$88
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:679: }
	C$vdp.c$679$1_0$88	= .
	.globl	C$vdp.c$679$1_0$88
	XG$VDP_Poke_16K$0$0	= .
	.globl	XG$VDP_Poke_16K$0$0
	ret
	G$VDP_Initialize$0$0	= .
	.globl	G$VDP_Initialize$0$0
	C$vdp.c$1447$1_0$89	= .
	.globl	C$vdp.c$1447$1_0$89
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1447: void VDP_Initialize()
;	---------------------------------
; Function VDP_Initialize
; ---------------------------------
_VDP_Initialize::
	C$vdp.c$1455$1_0$89	= .
	.globl	C$vdp.c$1455$1_0$89
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1455: __endasm;
	ld	hl, #0xF3DF
	ld	de, #_g_VDP_REGSAV+0
	ld	bc, #8
	ldir
	C$vdp.c$1478$1_0$89	= .
	.globl	C$vdp.c$1478$1_0$89
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1478: g_VDPInitilized = TRUE;
	ld	hl, #_g_VDPInitilized
	ld	(hl), #0x01
	C$vdp.c$1480$1_0$89	= .
	.globl	C$vdp.c$1480$1_0$89
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1480: }
	C$vdp.c$1480$1_0$89	= .
	.globl	C$vdp.c$1480$1_0$89
	XG$VDP_Initialize$0$0	= .
	.globl	XG$VDP_Initialize$0$0
	ret
	G$VDP_SetMode$0$0	= .
	.globl	G$VDP_SetMode$0$0
	C$vdp.c$1488$1_0$91	= .
	.globl	C$vdp.c$1488$1_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1488: void VDP_SetMode(const u8 mode)
;	---------------------------------
; Function VDP_SetMode
; ---------------------------------
_VDP_SetMode::
	ld	c, a
	C$vdp.c$1491$1_0$91	= .
	.globl	C$vdp.c$1491$1_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1491: if(!g_VDPInitilized)
	ld	a, (_g_VDPInitilized+0)
	or	a, a
	jr	NZ, 00102$
	C$vdp.c$1492$1_0$91	= .
	.globl	C$vdp.c$1492$1_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1492: VDP_Initialize();
	push	bc
	call	_VDP_Initialize
	pop	bc
00102$:
	C$vdp.c$1499$1_0$91	= .
	.globl	C$vdp.c$1499$1_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1499: g_VDP_Data.Mode = mode;
	ld	hl, #_g_VDP_Data
	C$vdp.c$1500$1_0$91	= .
	.globl	C$vdp.c$1500$1_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1500: switch(mode)
	ld	a,c
	ld	(hl),a
	sub	a, #0x02
	jr	NZ, 00110$
	C$vdp.c$1517$2_0$92	= .
	.globl	C$vdp.c$1517$2_0$92
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1517: case VDP_MODE_GRAPHIC1:		VDP_SetModeGraphic1(); break;
	call	_VDP_SetModeGraphic1
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
00110$:
	ld	a, #0x40
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.h:681: inline void VDP_EnableVBlank(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_IE0, enable ? R01_IE0 : 0); }
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, #0xdf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
	C$vdp.c$1605$3_0$91	= .
	.globl	C$vdp.c$1605$3_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1605: VDP_EnableVBlank(TRUE);
	C$vdp.c$1628$3_0$91	= .
	.globl	C$vdp.c$1628$3_0$91
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1628: }
	C$vdp.c$1628$3_0$91	= .
	.globl	C$vdp.c$1628$3_0$91
	XG$VDP_SetMode$0$0	= .
	.globl	XG$VDP_SetMode$0$0
	ret
	G$VDP_GetVersion$0$0	= .
	.globl	G$VDP_GetVersion$0$0
	C$vdp.c$1634$3_0$99	= .
	.globl	C$vdp.c$1634$3_0$99
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1634: u8 VDP_GetVersion() __NAKED
;	---------------------------------
; Function VDP_GetVersion
; ---------------------------------
_VDP_GetVersion::
	C$vdp.c$1703$1_0$99	= .
	.globl	C$vdp.c$1703$1_0$99
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1703: __endasm;
	 VDP_GetVersionAsm:
	call	VDP_IsTMS9918A
	ret	z
	ld	a, #1
	di
	out	(0x99), a
	ld	a, #(0x80 | 15)
	out	(0x99), a
	in	a, (0x99)
	and	#0b00111110
	rrca
	ex	af, af'					; '
	xor	a
	out	(0x99), a
	ld	a, #(0x80 | 15)
	ei
	out	(0x99), a
	ex	af, af'					; '
	ret	nz
	inc	a
	ret
	 VDP_IsTMS9918A:
	xor	a
	di
	out	(0x99), a
	ld	a, #(0x80 | 15)
	out	(0x99), a
	in	a, (0x99)
	 VDP_IsTMS9918A_Wait:
	in	a,(0x99)
	and	a
	jp	p, VDP_IsTMS9918A_Wait
	ld	a, #2
	out	(0x99), a
	ld	a, #(0x80 | 15)
	out	(0x99), a
	in	a, (0x99)
	ex	af, af'					; '
	xor	a
	out	(0x99), a
	ld	a, #(0x80 | 15)
	out	(0x99), a
	ld	a, (0xF3E6)
	out	(0x99), a
	ld	a, #(0x80 | 7)
	ei
	out	(0x99), a
	ex	af, af'					; '
	and	#0b01000000
	ret
	C$vdp.c$1704$1_0$99	= .
	.globl	C$vdp.c$1704$1_0$99
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1704: }
	G$VDP_RegWrite$0$0	= .
	.globl	G$VDP_RegWrite$0$0
	C$vdp.c$1712$1_0$101	= .
	.globl	C$vdp.c$1712$1_0$101
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1712: void VDP_RegWrite(u8 reg, u8 value) __PRESERVES(b, c, d, e, iyl, iyh)
;	---------------------------------
; Function VDP_RegWrite
; ---------------------------------
_VDP_RegWrite::
	C$vdp.c$1726$1_0$101	= .
	.globl	C$vdp.c$1726$1_0$101
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1726: __endasm;
	ld	h, a
	ld	a, l
	di
	out	(0x99), a
	ld	a, h
	add	#0x80
	ei
	out	(0x99), a
	C$vdp.c$1727$1_0$101	= .
	.globl	C$vdp.c$1727$1_0$101
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1727: }
	C$vdp.c$1727$1_0$101	= .
	.globl	C$vdp.c$1727$1_0$101
	XG$VDP_RegWrite$0$0	= .
	.globl	XG$VDP_RegWrite$0$0
	ret
	G$VDP_RegWriteBak$0$0	= .
	.globl	G$VDP_RegWriteBak$0$0
	C$vdp.c$1735$1_0$103	= .
	.globl	C$vdp.c$1735$1_0$103
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1735: void VDP_RegWriteBak(u8 reg, u8 value) __PRESERVES(d, e, iyl, iyh)
;	---------------------------------
; Function VDP_RegWriteBak
; ---------------------------------
_VDP_RegWriteBak::
	C$vdp.c$1755$1_0$103	= .
	.globl	C$vdp.c$1755$1_0$103
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1755: __endasm;
	ld	c, a
	ld	a, l
	ld	b, #0
	ld	hl, #_g_VDP_REGSAV
	add	hl, bc
	ld	(hl), a
	di
	out	(0x99), a
	ld	a, c
	add	#0x80
	ei
	out	(0x99), a
	C$vdp.c$1756$1_0$103	= .
	.globl	C$vdp.c$1756$1_0$103
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1756: }
	C$vdp.c$1756$1_0$103	= .
	.globl	C$vdp.c$1756$1_0$103
	XG$VDP_RegWriteBak$0$0	= .
	.globl	XG$VDP_RegWriteBak$0$0
	ret
	G$VDP_RegWriteBakMask$0$0	= .
	.globl	G$VDP_RegWriteBakMask$0$0
	C$vdp.c$1765$1_0$105	= .
	.globl	C$vdp.c$1765$1_0$105
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1765: void VDP_RegWriteBakMask(u8 reg, u8 mask, u8 flag)
;	---------------------------------
; Function VDP_RegWriteBakMask
; ---------------------------------
_VDP_RegWriteBakMask::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	e, l
	C$vdp.c$1767$1_0$105	= .
	.globl	C$vdp.c$1767$1_0$105
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1767: u8 value = g_VDP_REGSAV[reg];
	ld	hl, #_g_VDP_REGSAV+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	C$vdp.c$1768$1_0$105	= .
	.globl	C$vdp.c$1768$1_0$105
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1768: value &= mask;
	and	a, e
	C$vdp.c$1769$1_0$105	= .
	.globl	C$vdp.c$1769$1_0$105
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1769: value |= flag;
	or	a, 4 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$vdp.c$1770$1_0$105	= .
	.globl	C$vdp.c$1770$1_0$105
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1770: VDP_RegWriteBak(reg, value);
	ld	a, c
	call	_VDP_RegWriteBak
	C$vdp.c$1771$1_0$105	= .
	.globl	C$vdp.c$1771$1_0$105
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1771: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$VDP_ReadDefaultStatus$0$0	= .
	.globl	G$VDP_ReadDefaultStatus$0$0
	C$vdp.c$1775$1_0$106	= .
	.globl	C$vdp.c$1775$1_0$106
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1775: u8 VDP_ReadDefaultStatus() __PRESERVES(b, c, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function VDP_ReadDefaultStatus
; ---------------------------------
_VDP_ReadDefaultStatus::
	C$vdp.c$1779$1_0$106	= .
	.globl	C$vdp.c$1779$1_0$106
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1779: __endasm;
	in	a, (0x99)
	C$vdp.c$1780$1_0$106	= .
	.globl	C$vdp.c$1780$1_0$106
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1780: }
	C$vdp.c$1780$1_0$106	= .
	.globl	C$vdp.c$1780$1_0$106
	XG$VDP_ReadDefaultStatus$0$0	= .
	.globl	XG$VDP_ReadDefaultStatus$0$0
	ret
	G$VDP_SetLayoutTable$0$0	= .
	.globl	G$VDP_SetLayoutTable$0$0
	C$vdp.c$1797$1_0$108	= .
	.globl	C$vdp.c$1797$1_0$108
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1797: void VDP_SetLayoutTable(VADDR addr)
;	---------------------------------
; Function VDP_SetLayoutTable
; ---------------------------------
_VDP_SetLayoutTable::
	C$vdp.c$1799$1_0$108	= .
	.globl	C$vdp.c$1799$1_0$108
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1799: g_ScreenLayoutLow = (u16)addr;
	ld	(_g_ScreenLayoutLow), hl
	C$vdp.c$1802$1_1$109	= .
	.globl	C$vdp.c$1802$1_1$109
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1802: reg = (u8)(addr >> 10);
	ld	a, h
	rrca
	rrca
	and	a, #0x3f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	C$vdp.c$1823$1_1$109	= .
	.globl	C$vdp.c$1823$1_1$109
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1823: VDP_RegWrite(2, reg);
	ld	a, #0x02
	C$vdp.c$1828$1_1$108	= .
	.globl	C$vdp.c$1828$1_1$108
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1828: }
	C$vdp.c$1828$1_1$108	= .
	.globl	C$vdp.c$1828$1_1$108
	XG$VDP_SetLayoutTable$0$0	= .
	.globl	XG$VDP_SetLayoutTable$0$0
	jp	_VDP_RegWrite
	G$VDP_SetColorTable$0$0	= .
	.globl	G$VDP_SetColorTable$0$0
	C$vdp.c$1832$1_1$111	= .
	.globl	C$vdp.c$1832$1_1$111
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1832: void VDP_SetColorTable(VADDR addr)
;	---------------------------------
; Function VDP_SetColorTable
; ---------------------------------
_VDP_SetColorTable::
	C$vdp.c$1834$1_0$111	= .
	.globl	C$vdp.c$1834$1_0$111
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1834: g_ScreenColorLow = (u16)addr;
	ld	(_g_ScreenColorLow), hl
	C$vdp.c$1837$1_1$112	= .
	.globl	C$vdp.c$1837$1_1$112
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1837: reg = (u8)(addr >> 6);
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	srl	h
	rr	l
	ld	c, l
	C$vdp.c$1838$1_1$112	= .
	.globl	C$vdp.c$1838$1_1$112
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1838: switch(g_VDP_Data.Mode)
	ld	a, (#_g_VDP_Data + 0)
	sub	a, #0x03
	jr	NZ, 00102$
	C$vdp.c$1858$2_1$113	= .
	.globl	C$vdp.c$1858$2_1$113
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1858: reg |= 0b1111111;
	ld	a, c
	or	a, #0x7f
	ld	c, a
	C$vdp.c$1860$1_1$112	= .
	.globl	C$vdp.c$1860$1_1$112
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1860: };	
00102$:
	C$vdp.c$1861$1_1$112	= .
	.globl	C$vdp.c$1861$1_1$112
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1861: VDP_RegWrite(3, reg);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x03
	C$vdp.c$1869$1_1$111	= .
	.globl	C$vdp.c$1869$1_1$111
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1869: }
	C$vdp.c$1869$1_1$111	= .
	.globl	C$vdp.c$1869$1_1$111
	XG$VDP_SetColorTable$0$0	= .
	.globl	XG$VDP_SetColorTable$0$0
	jp	_VDP_RegWrite
	G$VDP_SetPatternTable$0$0	= .
	.globl	G$VDP_SetPatternTable$0$0
	C$vdp.c$1873$1_1$115	= .
	.globl	C$vdp.c$1873$1_1$115
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1873: void VDP_SetPatternTable(VADDR addr)
;	---------------------------------
; Function VDP_SetPatternTable
; ---------------------------------
_VDP_SetPatternTable::
	C$vdp.c$1875$1_0$115	= .
	.globl	C$vdp.c$1875$1_0$115
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1875: g_ScreenPatternLow = (u16)addr;
	ld	(_g_ScreenPatternLow), hl
	C$vdp.c$1878$1_1$116	= .
	.globl	C$vdp.c$1878$1_1$116
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1878: reg = (u8)(addr >> 11);
	ld	a, h
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	c, a
	ld	b, #0x00
	C$vdp.c$1879$1_1$116	= .
	.globl	C$vdp.c$1879$1_1$116
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1879: switch(g_VDP_Data.Mode)
	ld	a, (#_g_VDP_Data + 0)
	sub	a, #0x03
	jr	NZ, 00102$
	C$vdp.c$1893$2_1$117	= .
	.globl	C$vdp.c$1893$2_1$117
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1893: reg |= 0b11;
	ld	a, c
	or	a, #0x03
	ld	c, a
	C$vdp.c$1894$1_1$116	= .
	.globl	C$vdp.c$1894$1_1$116
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1894: };
00102$:
	C$vdp.c$1895$1_1$116	= .
	.globl	C$vdp.c$1895$1_1$116
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1895: VDP_RegWrite(4, reg);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
	C$vdp.c$1900$1_1$115	= .
	.globl	C$vdp.c$1900$1_1$115
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1900: }
	C$vdp.c$1900$1_1$115	= .
	.globl	C$vdp.c$1900$1_1$115
	XG$VDP_SetPatternTable$0$0	= .
	.globl	XG$VDP_SetPatternTable$0$0
	jp	_VDP_RegWrite
	G$VDP_SetSpriteAttributeTable$0$0	= .
	.globl	G$VDP_SetSpriteAttributeTable$0$0
	C$vdp.c$1914$1_1$119	= .
	.globl	C$vdp.c$1914$1_1$119
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1914: void VDP_SetSpriteAttributeTable(VADDR addr)
;	---------------------------------
; Function VDP_SetSpriteAttributeTable
; ---------------------------------
_VDP_SetSpriteAttributeTable::
	ex	de, hl
	C$vdp.c$1916$1_0$119	= .
	.globl	C$vdp.c$1916$1_0$119
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1916: g_SpriteAttributeLow = (u16)addr;
	ld	(_g_SpriteAttributeLow), de
	C$vdp.c$1919$1_1$120	= .
	.globl	C$vdp.c$1919$1_1$120
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1919: reg = (u8)(addr >> 7);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	c, d
	srl	c
	rr	l
	srl	c
	rr	l
	srl	c
	rr	l
	srl	c
	rr	l
	srl	c
	rr	l
	srl	c
	rr	l
	srl	c
	rr	l
	C$vdp.c$1942$1_1$120	= .
	.globl	C$vdp.c$1942$1_1$120
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1942: VDP_RegWrite(5, reg);
	ld	a, #0x05
	call	_VDP_RegWrite
	C$vdp.c$1951$1_1$120	= .
	.globl	C$vdp.c$1951$1_1$120
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1951: addr -= 0x200;
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	ld	a,d
	add	a,#0xfe
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	(_g_SpriteColorLow), hl
	C$vdp.c$1952$1_1$119	= .
	.globl	C$vdp.c$1952$1_1$119
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1952: g_SpriteColorLow = (u16)addr;
	C$vdp.c$1956$1_1$119	= .
	.globl	C$vdp.c$1956$1_1$119
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1956: }
	C$vdp.c$1956$1_1$119	= .
	.globl	C$vdp.c$1956$1_1$119
	XG$VDP_SetSpriteAttributeTable$0$0	= .
	.globl	XG$VDP_SetSpriteAttributeTable$0$0
	ret
	G$VDP_SetSpritePatternTable$0$0	= .
	.globl	G$VDP_SetSpritePatternTable$0$0
	C$vdp.c$1962$1_1$122	= .
	.globl	C$vdp.c$1962$1_1$122
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1962: void VDP_SetSpritePatternTable(VADDR addr)
;	---------------------------------
; Function VDP_SetSpritePatternTable
; ---------------------------------
_VDP_SetSpritePatternTable::
	C$vdp.c$1964$1_0$122	= .
	.globl	C$vdp.c$1964$1_0$122
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1964: g_SpritePatternLow  = (u16)addr;
	ld	(_g_SpritePatternLow), hl
	C$vdp.c$1969$1_1$123	= .
	.globl	C$vdp.c$1969$1_1$123
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1969: u8 reg = (u8)(addr >> 11);
	ld	a, h
	rrca
	rrca
	rrca
	and	a, #0x1f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	C$vdp.c$1970$1_1$123	= .
	.globl	C$vdp.c$1970$1_1$123
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1970: VDP_RegWrite(6, reg);
	ld	a, #0x06
	C$vdp.c$1972$1_1$122	= .
	.globl	C$vdp.c$1972$1_1$122
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1972: }
	C$vdp.c$1972$1_1$122	= .
	.globl	C$vdp.c$1972$1_1$122
	XG$VDP_SetSpritePatternTable$0$0	= .
	.globl	XG$VDP_SetSpritePatternTable$0$0
	jp	_VDP_RegWrite
	G$VDP_LoadSpritePattern$0$0	= .
	.globl	G$VDP_LoadSpritePattern$0$0
	C$vdp.c$1976$1_1$125	= .
	.globl	C$vdp.c$1976$1_1$125
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1976: void VDP_LoadSpritePattern(const u8* addr, u8 index, u8 count)
;	---------------------------------
; Function VDP_LoadSpritePattern
; ---------------------------------
_VDP_LoadSpritePattern::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	C$vdp.c$1978$2_0$125	= .
	.globl	C$vdp.c$1978$2_0$125
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1978: u16 low = g_SpritePatternLow;
	ld	de, (_g_SpritePatternLow)
	C$vdp.c$1979$1_0$125	= .
	.globl	C$vdp.c$1979$1_0$125
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1979: low += (index * 8);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	C$vdp.c$1980$1_0$125	= .
	.globl	C$vdp.c$1980$1_0$125
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1980: VDP_WriteVRAM(addr, low, g_SpritePatternHigh, count * 8);
	ld	l, 5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	C$vdp.c$1981$1_0$125	= .
	.globl	C$vdp.c$1981$1_0$125
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1981: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$VDP_SetSpriteSM1$0$0	= .
	.globl	G$VDP_SetSpriteSM1$0$0
	C$vdp.c$1985$1_0$127	= .
	.globl	C$vdp.c$1985$1_0$127
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1985: void VDP_SetSpriteSM1(u8 index, u8 x, u8 y, u8 shape, u8 color)
;	---------------------------------
; Function VDP_SetSpriteSM1
; ---------------------------------
_VDP_SetSpriteSM1::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
	ld	c, l
	C$vdp.c$1987$1_0$127	= .
	.globl	C$vdp.c$1987$1_0$127
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1987: g_VDP_Sprite.Y = y;				// Y coordinate on screen (all lower priority sprite will be disable if equal to 216 or 0xD0)
	ld	hl, #_g_VDP_Sprite
	ld	a, 4 (ix)
	ld	(hl), a
	C$vdp.c$1988$1_0$127	= .
	.globl	C$vdp.c$1988$1_0$127
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1988: g_VDP_Sprite.X = x;				// X coordinate of the sprite
	ld	hl, #(_g_VDP_Sprite + 1)
	ld	(hl), c
	C$vdp.c$1989$1_0$127	= .
	.globl	C$vdp.c$1989$1_0$127
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1989: g_VDP_Sprite.Pattern = shape;	// Pattern index
	ld	hl, #(_g_VDP_Sprite + 2)
	ld	a, 5 (ix)
	ld	(hl), a
	C$vdp.c$1990$1_0$127	= .
	.globl	C$vdp.c$1990$1_0$127
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1990: g_VDP_Sprite.Color = color;		// Color index (Sprite Mode 1 only) + Early clock
	ld	hl, #(_g_VDP_Sprite + 3)
	ld	a, 6 (ix)
	ld	(hl), a
	C$vdp.c$1992$2_0$128	= .
	.globl	C$vdp.c$1992$2_0$128
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1992: u16 low = g_SpriteAttributeLow;
	ld	bc, (_g_SpriteAttributeLow)
	C$vdp.c$1993$1_1$128	= .
	.globl	C$vdp.c$1993$1_1$128
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1993: low += (index * 4);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	C$vdp.c$1994$1_1$128	= .
	.globl	C$vdp.c$1994$1_1$128
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1994: VDP_WriteVRAM((u8*)&g_VDP_Sprite, low, g_SpriteAtributeHigh, 4);
	ld	hl, #0x0004
	push	hl
	ld	hl, #_g_VDP_Sprite
	call	_VDP_WriteVRAM_16K
	C$vdp.c$1995$1_1$127	= .
	.globl	C$vdp.c$1995$1_1$127
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1995: }
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
	G$VDP_SetSprite$0$0	= .
	.globl	G$VDP_SetSprite$0$0
	C$vdp.c$1999$1_1$130	= .
	.globl	C$vdp.c$1999$1_1$130
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:1999: void VDP_SetSprite(u8 index, u8 x, u8 y, u8 shape)
;	---------------------------------
; Function VDP_SetSprite
; ---------------------------------
_VDP_SetSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
	ld	c, l
	C$vdp.c$2001$1_0$130	= .
	.globl	C$vdp.c$2001$1_0$130
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2001: g_VDP_Sprite.Y = y;				// Y coordinate on screen (all lower priority sprite will be disable if equal to 216 or 0xD0)
	ld	hl, #_g_VDP_Sprite
	ld	a, 4 (ix)
	ld	(hl), a
	C$vdp.c$2002$1_0$130	= .
	.globl	C$vdp.c$2002$1_0$130
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2002: g_VDP_Sprite.X = x;				// X coordinate of the sprite
	ld	hl, #(_g_VDP_Sprite + 1)
	ld	(hl), c
	C$vdp.c$2003$1_0$130	= .
	.globl	C$vdp.c$2003$1_0$130
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2003: g_VDP_Sprite.Pattern = shape;	// Pattern index
	ld	hl, #(_g_VDP_Sprite + 2)
	ld	a, 5 (ix)
	ld	(hl), a
	C$vdp.c$2005$2_0$131	= .
	.globl	C$vdp.c$2005$2_0$131
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2005: u16 low = g_SpriteAttributeLow;
	ld	bc, (_g_SpriteAttributeLow)
	C$vdp.c$2006$1_1$131	= .
	.globl	C$vdp.c$2006$1_1$131
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2006: low += (index * 4);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	C$vdp.c$2007$1_1$131	= .
	.globl	C$vdp.c$2007$1_1$131
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2007: VDP_WriteVRAM((u8*)&g_VDP_Sprite, low, g_SpriteAtributeHigh, 3);
	ld	hl, #0x0003
	push	hl
	ld	hl, #_g_VDP_Sprite
	call	_VDP_WriteVRAM_16K
	C$vdp.c$2008$1_1$130	= .
	.globl	C$vdp.c$2008$1_1$130
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2008: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$VDP_SetSpritePosition$0$0	= .
	.globl	G$VDP_SetSpritePosition$0$0
	C$vdp.c$2046$1_1$133	= .
	.globl	C$vdp.c$2046$1_1$133
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2046: void VDP_SetSpritePosition(u8 index, u8 x, u8 y)
;	---------------------------------
; Function VDP_SetSpritePosition
; ---------------------------------
_VDP_SetSpritePosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
	ld	c, l
	C$vdp.c$2048$1_0$133	= .
	.globl	C$vdp.c$2048$1_0$133
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2048: g_VDP_Sprite.Y = y;				// Y coordinate on screen (all lower priority sprite will be disable if equal to 216 or 0xD0)
	ld	hl, #_g_VDP_Sprite
	ld	a, 4 (ix)
	ld	(hl), a
	C$vdp.c$2049$1_0$133	= .
	.globl	C$vdp.c$2049$1_0$133
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2049: g_VDP_Sprite.X = x;				// X coordinate of the sprite
	ld	hl, #(_g_VDP_Sprite + 1)
	ld	(hl), c
	C$vdp.c$2051$2_0$134	= .
	.globl	C$vdp.c$2051$2_0$134
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2051: u16 low = g_SpriteAttributeLow;
	ld	bc, (_g_SpriteAttributeLow)
	C$vdp.c$2052$1_1$134	= .
	.globl	C$vdp.c$2052$1_1$134
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2052: low += (index * 4);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	C$vdp.c$2053$1_1$134	= .
	.globl	C$vdp.c$2053$1_1$134
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2053: VDP_WriteVRAM((u8*)&g_VDP_Sprite, low, g_SpriteAtributeHigh, 2);
	ld	hl, #0x0002
	push	hl
	ld	hl, #_g_VDP_Sprite
	call	_VDP_WriteVRAM_16K
	C$vdp.c$2054$1_1$133	= .
	.globl	C$vdp.c$2054$1_1$133
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2054: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$VDP_SetSpritePositionX$0$0	= .
	.globl	G$VDP_SetSpritePositionX$0$0
	C$vdp.c$2058$1_1$136	= .
	.globl	C$vdp.c$2058$1_1$136
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2058: void VDP_SetSpritePositionX(u8 index, u8 x)
;	---------------------------------
; Function VDP_SetSpritePositionX
; ---------------------------------
_VDP_SetSpritePositionX::
	ld	b, a
	ld	c, l
	C$vdp.c$2060$2_0$136	= .
	.globl	C$vdp.c$2060$2_0$136
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2060: u16 low = g_SpriteAttributeLow;
	ld	de, (_g_SpriteAttributeLow)
	C$vdp.c$2061$1_0$136	= .
	.globl	C$vdp.c$2061$1_0$136
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2061: low += (index * 4);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	C$vdp.c$2062$1_0$136	= .
	.globl	C$vdp.c$2062$1_0$136
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2062: VDP_Poke(x, ++low, g_SpriteAtributeHigh);
	inc	de
	ld	a, c
	C$vdp.c$2063$1_0$136	= .
	.globl	C$vdp.c$2063$1_0$136
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2063: }
	C$vdp.c$2063$1_0$136	= .
	.globl	C$vdp.c$2063$1_0$136
	XG$VDP_SetSpritePositionX$0$0	= .
	.globl	XG$VDP_SetSpritePositionX$0$0
	jp	_VDP_Poke_16K
	G$VDP_SetSpritePositionY$0$0	= .
	.globl	G$VDP_SetSpritePositionY$0$0
	C$vdp.c$2067$1_0$138	= .
	.globl	C$vdp.c$2067$1_0$138
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2067: void VDP_SetSpritePositionY(u8 index, u8 y)
;	---------------------------------
; Function VDP_SetSpritePositionY
; ---------------------------------
_VDP_SetSpritePositionY::
	ld	b, a
	ld	c, l
	C$vdp.c$2069$2_0$138	= .
	.globl	C$vdp.c$2069$2_0$138
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2069: u16 low = g_SpriteAttributeLow;
	ld	de, (_g_SpriteAttributeLow)
	C$vdp.c$2070$1_0$138	= .
	.globl	C$vdp.c$2070$1_0$138
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2070: low += (index * 4);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	C$vdp.c$2071$1_0$138	= .
	.globl	C$vdp.c$2071$1_0$138
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2071: VDP_Poke(y, low, g_SpriteAtributeHigh);
	ld	a, c
	C$vdp.c$2072$1_0$138	= .
	.globl	C$vdp.c$2072$1_0$138
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2072: }
	C$vdp.c$2072$1_0$138	= .
	.globl	C$vdp.c$2072$1_0$138
	XG$VDP_SetSpritePositionY$0$0	= .
	.globl	XG$VDP_SetSpritePositionY$0$0
	jp	_VDP_Poke_16K
	G$VDP_SetSpritePattern$0$0	= .
	.globl	G$VDP_SetSpritePattern$0$0
	C$vdp.c$2076$1_0$140	= .
	.globl	C$vdp.c$2076$1_0$140
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2076: void VDP_SetSpritePattern(u8 index, u8 shape)
;	---------------------------------
; Function VDP_SetSpritePattern
; ---------------------------------
_VDP_SetSpritePattern::
	ld	b, a
	ld	c, l
	C$vdp.c$2078$1_0$140	= .
	.globl	C$vdp.c$2078$1_0$140
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2078: u16 low = g_SpriteAttributeLow + 2;
	ld	de, (_g_SpriteAttributeLow)
	inc	de
	inc	de
	C$vdp.c$2079$1_0$140	= .
	.globl	C$vdp.c$2079$1_0$140
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2079: low += (index * 4);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	C$vdp.c$2080$1_0$140	= .
	.globl	C$vdp.c$2080$1_0$140
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2080: VDP_Poke(shape, low, g_SpriteAtributeHigh);
	ld	a, c
	C$vdp.c$2081$1_0$140	= .
	.globl	C$vdp.c$2081$1_0$140
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2081: }
	C$vdp.c$2081$1_0$140	= .
	.globl	C$vdp.c$2081$1_0$140
	XG$VDP_SetSpritePattern$0$0	= .
	.globl	XG$VDP_SetSpritePattern$0$0
	jp	_VDP_Poke_16K
	G$VDP_SetSpriteColorSM1$0$0	= .
	.globl	G$VDP_SetSpriteColorSM1$0$0
	C$vdp.c$2085$1_0$142	= .
	.globl	C$vdp.c$2085$1_0$142
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2085: void VDP_SetSpriteColorSM1(u8 index, u8 color)
;	---------------------------------
; Function VDP_SetSpriteColorSM1
; ---------------------------------
_VDP_SetSpriteColorSM1::
	ld	b, a
	ld	c, l
	C$vdp.c$2087$1_0$142	= .
	.globl	C$vdp.c$2087$1_0$142
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2087: u16 low = g_SpriteAttributeLow + 3;
	ld	de, (_g_SpriteAttributeLow)
	inc	de
	inc	de
	inc	de
	C$vdp.c$2088$1_0$142	= .
	.globl	C$vdp.c$2088$1_0$142
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2088: low += (index * 4);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	C$vdp.c$2089$1_0$142	= .
	.globl	C$vdp.c$2089$1_0$142
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2089: VDP_Poke(color, low, g_SpriteAtributeHigh);
	ld	a, c
	C$vdp.c$2090$1_0$142	= .
	.globl	C$vdp.c$2090$1_0$142
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2090: }
	C$vdp.c$2090$1_0$142	= .
	.globl	C$vdp.c$2090$1_0$142
	XG$VDP_SetSpriteColorSM1$0$0	= .
	.globl	XG$VDP_SetSpriteColorSM1$0$0
	jp	_VDP_Poke_16K
	G$VDP_DisableSpritesFrom$0$0	= .
	.globl	G$VDP_DisableSpritesFrom$0$0
	C$vdp.c$2123$1_0$144	= .
	.globl	C$vdp.c$2123$1_0$144
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2123: void VDP_DisableSpritesFrom(u8 index)
;	---------------------------------
; Function VDP_DisableSpritesFrom
; ---------------------------------
_VDP_DisableSpritesFrom::
	ld	c, a
	C$vdp.c$2130$1_0$144	= .
	.globl	C$vdp.c$2130$1_0$144
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2130: VDP_SetSpritePositionY(index, y);
	ld	l, #0xd0
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	C$vdp.c$2131$1_0$144	= .
	.globl	C$vdp.c$2131$1_0$144
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.c:2131: }
	C$vdp.c$2131$1_0$144	= .
	.globl	C$vdp.c$2131$1_0$144
	XG$VDP_DisableSpritesFrom$0$0	= .
	.globl	XG$VDP_DisableSpritesFrom$0$0
	jp	_VDP_SetSpritePositionY
	.area _CODE
	.area _INITIALIZER
Fvdp$__xinit_g_VDPInitilized$0_0$0 == .
__xinit__g_VDPInitilized:
	.db #0x00	; 0
	.area _CABS (ABS)
