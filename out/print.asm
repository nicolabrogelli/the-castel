;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module print
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CopyNo8HeightFontData
	.globl _Print_ValidatePattern
	.globl _Print_ValidateChar
	.globl _VDP_Poke_16K
	.globl _VDP_FillVRAM_16K
	.globl _VDP_WriteVRAM_16K
	.globl _g_PrintInvalid
	.globl _g_PrintData
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
	.globl _g_HexChar
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
	.globl _Print_Initialize
	.globl _Print_SetMode
	.globl _Print_SetFont
	.globl _Print_SetColor
	.globl _Print_SetColorShade
	.globl _Print_SetTextFont
	.globl _DrawChar_Layout
	.globl _Print_Clear
	.globl _Print_Backspace
	.globl _Print_DrawChar
	.globl _Print_DrawCharX
	.globl _Print_DrawText
	.globl _Print_DrawBin8
	.globl _Print_DrawHex8
	.globl _Print_DrawHex16
	.globl _Print_DrawHex32
	.globl _Print_DrawInt
	.globl _Print_DrawFormat
	.globl _Print_DrawLineH
	.globl _Print_DrawLineV
	.globl _Print_DrawBox
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
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
G$g_PrintData$0_0$0==.
_g_PrintData::
	.ds 50
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_PrintInvalid$0_0$0==.
_g_PrintInvalid::
	.ds 8
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
	G$Print_Initialize$0$0	= .
	.globl	G$Print_Initialize$0$0
	C$print.c$156$0_0$242	= .
	.globl	C$print.c$156$0_0$242
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:156: bool Print_Initialize()
;	---------------------------------
; Function Print_Initialize
; ---------------------------------
_Print_Initialize::
	C$print.c$158$1_0$242	= .
	.globl	C$print.c$158$1_0$242
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:158: Print_SetColor(0xF, 0x0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_Print_SetColor
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
	C$print.c$167$3_0$248	= .
	.globl	C$print.c$167$3_0$248
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:167: switch(VDP_GetMode()) // Screen mode specific initialization
	sub	a, #0x02
	jr	NZ, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:249: g_PrintData.TabSize = size;
	ld	hl, #(_g_PrintData + 4)
	ld	(hl), #0x03
	C$print.c$182$2_0$243	= .
	.globl	C$print.c$182$2_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:182: g_PrintData.ScreenWidth = 32;
	ld	hl, #0x0020
	ld	((_g_PrintData + 26)), hl
	C$print.c$183$2_0$243	= .
	.globl	C$print.c$183$2_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:183: break;
	jp	00103$
	C$print.c$234$2_0$243	= .
	.globl	C$print.c$234$2_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:234: default:
00102$:
	C$print.c$236$2_0$243	= .
	.globl	C$print.c$236$2_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:236: return FALSE;
	xor	a, a
	ret
	C$print.c$237$1_0$242	= .
	.globl	C$print.c$237$1_0$242
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:237: }
00103$:
	C$print.c$241$1_0$242	= .
	.globl	C$print.c$241$1_0$242
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:241: return TRUE;
	ld	a, #0x01
	C$print.c$242$1_0$242	= .
	.globl	C$print.c$242$1_0$242
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:242: }
	C$print.c$242$1_0$242	= .
	.globl	C$print.c$242$1_0$242
	XG$Print_Initialize$0$0	= .
	.globl	XG$Print_Initialize$0$0
	ret
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
G$g_HexChar$0_0$0 == .
_g_HexChar:
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	G$Print_SetMode$0$0	= .
	.globl	G$Print_SetMode$0$0
	C$print.c$246$1_0$254	= .
	.globl	C$print.c$246$1_0$254
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:246: void Print_SetMode(u8 mode)
;	---------------------------------
; Function Print_SetMode
; ---------------------------------
_Print_SetMode::
	ld	c, a
	C$print.c$248$1_0$254	= .
	.globl	C$print.c$248$1_0$254
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:248: g_PrintData.SourceMode = mode;
	ld	hl, #_g_PrintData + 25
	rrd
	ld	a, c
	rld
	C$print.c$250$1_0$254	= .
	.globl	C$print.c$250$1_0$254
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:250: switch(g_PrintData.SourceMode)
	ld	a, (hl)
	and	a, #0x0f
	sub	a, #0x04
	ret	NZ
	C$print.c$315$3_0$256	= .
	.globl	C$print.c$315$3_0$256
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:315: g_PrintData.DrawChar = DrawChar_Layout;
	ld	hl, #_DrawChar_Layout
	ld	((_g_PrintData + 23)), hl
	C$print.c$319$1_0$254	= .
	.globl	C$print.c$319$1_0$254
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:319: };
	C$print.c$320$1_0$254	= .
	.globl	C$print.c$320$1_0$254
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:320: }
	C$print.c$320$1_0$254	= .
	.globl	C$print.c$320$1_0$254
	XG$Print_SetMode$0$0	= .
	.globl	XG$Print_SetMode$0$0
	ret
	G$Print_SetFont$0$0	= .
	.globl	G$Print_SetFont$0$0
	C$print.c$325$1_0$258	= .
	.globl	C$print.c$325$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:325: void Print_SetFont(const u8* font)
;	---------------------------------
; Function Print_SetFont
; ---------------------------------
_Print_SetFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ex	de, hl
	C$print.c$327$1_0$258	= .
	.globl	C$print.c$327$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:327: if(font == NULL) // Use Bios font (if any)
	ld	a, d
	or	a, e
	jr	NZ, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:328: Print_SetFontEx(8, 8, 6, 8, 1, 255, (const u8*)g_CGTABL + 8);
	ld	bc, (_g_CGTABL)
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	bc, #_g_PrintData + 1
	ld	a, #0x08
	ld	(bc), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x06
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x08
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0xff
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #(_g_PrintData + 22)
	ld	(hl), #0xff
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 28)), de
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	((_g_PrintData + 30)), bc
	C$print.c$328$1_0$258	= .
	.globl	C$print.c$328$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:328: Print_SetFontEx(8, 8, 6, 8, 1, 255, (const u8*)g_CGTABL + 8);
	jp	00106$
00102$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:330: Print_SetFontEx(font[0] >> 4, font[0] & 0x0F, font[1] >> 4, font[1] & 0x0F, font[2], font[3], font+4);
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	push	af
	and	a, #0x0f
	ld	-2 (ix), a
	pop	af
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-1 (ix), a
	ld	a, (de)
	push	af
	and	a, #0x0f
	ld	e, a
	pop	af
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	d, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), e
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	a, -1 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	a, -2 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	a, -3 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	a, -4 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	a, -4 (ix)
	sub	a, -3 (ix)
	inc	a
	ld	(#(_g_PrintData + 22)),a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 28)), bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	push	bc
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00113$:
	add	hl, hl
	jr	NC, 00114$
	add	hl, de
00114$:
	djnz	00113$
	pop	bc
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	ld	((_g_PrintData + 30)), bc
	C$print.c$330$1_0$258	= .
	.globl	C$print.c$330$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:330: Print_SetFontEx(font[0] >> 4, font[0] & 0x0F, font[1] >> 4, font[1] & 0x0F, font[2], font[3], font+4);
00106$:
	C$print.c$331$1_0$258	= .
	.globl	C$print.c$331$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:331: }
	ld	sp, ix
	pop	ix
	C$print.c$331$1_0$258	= .
	.globl	C$print.c$331$1_0$258
	XG$Print_SetFont$0$0	= .
	.globl	XG$Print_SetFont$0$0
	ret
	G$Print_SetColor$0$0	= .
	.globl	G$Print_SetColor$0$0
	C$print.c$394$1_0$266	= .
	.globl	C$print.c$394$1_0$266
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:394: void Print_SetColor(u8 text, u8 bg)
;	---------------------------------
; Function Print_SetColor
; ---------------------------------
_Print_SetColor::
	C$print.c$424$2_0$268	= .
	.globl	C$print.c$424$2_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:424: u8 col = text << 4 | bg;
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	or	a, l
	ld	c, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/vdp.h:447: inline u8 VDP_GetMode() { return g_VDP_Data.Mode; }
	ld	a, (#_g_VDP_Data + 0)
	C$print.c$425$4_0$277	= .
	.globl	C$print.c$425$4_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:425: switch(VDP_GetMode())
	sub	a, #0x02
	ret	NZ
	C$print.c$439$3_0$269	= .
	.globl	C$print.c$439$3_0$269
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:439: VDP_FillVRAM(col, g_ScreenColorLow, 0, 32);
	ld	hl, #0x0020
	push	hl
	ld	de, (_g_ScreenColorLow)
	ld	a, c
	call	_VDP_FillVRAM_16K
	C$print.c$459$1_0$266	= .
	.globl	C$print.c$459$1_0$266
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:459: };
	C$print.c$462$1_0$266	= .
	.globl	C$print.c$462$1_0$266
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:462: }
	C$print.c$462$1_0$266	= .
	.globl	C$print.c$462$1_0$266
	XG$Print_SetColor$0$0	= .
	.globl	XG$Print_SetColor$0$0
	ret
	G$Print_SetColorShade$0$0	= .
	.globl	G$Print_SetColorShade$0$0
	C$print.c$467$1_0$280	= .
	.globl	C$print.c$467$1_0$280
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:467: void Print_SetColorShade(const u8* shade)
;	---------------------------------
; Function Print_SetColorShade
; ---------------------------------
_Print_SetColorShade::
	C$print.c$506$1_0$280	= .
	.globl	C$print.c$506$1_0$280
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:506: };
	C$print.c$509$1_0$280	= .
	.globl	C$print.c$509$1_0$280
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:509: }
	C$print.c$509$1_0$280	= .
	.globl	C$print.c$509$1_0$280
	XG$Print_SetColorShade$0$0	= .
	.globl	XG$Print_SetColorShade$0$0
	ret
	G$Print_ValidateChar$0$0	= .
	.globl	G$Print_ValidateChar$0$0
	C$print.c$523$1_0$294	= .
	.globl	C$print.c$523$1_0$294
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:523: u8 Print_ValidateChar(u8 chr)
;	---------------------------------
; Function Print_ValidateChar
; ---------------------------------
_Print_ValidateChar::
	ld	c, a
	C$print.c$525$1_0$294	= .
	.globl	C$print.c$525$1_0$294
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:525: if((chr < g_PrintData.CharFirst) || (chr > g_PrintData.CharLast))
	ld	hl, #_g_PrintData + 20
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	C, 00113$
	ld	a, (#_g_PrintData + 21)
	sub	a, c
	jr	NC, 00114$
00113$:
	C$print.c$527$2_0$295	= .
	.globl	C$print.c$527$2_0$295
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:527: if((chr >= 'a') && (chr <= 'z') && (g_PrintData.CharFirst <= 'A') && (g_PrintData.CharLast >= 'Z')) // try to remap to upper case letter
	ld	a, c
	sub	a, #0x61
	jr	C, 00108$
	ld	a, #0x7a
	sub	a, c
	jr	C, 00108$
	ld	a, #0x41
	sub	a, b
	jr	C, 00108$
	ld	a, (#_g_PrintData + 21)
	sub	a, #0x5a
	jr	C, 00108$
	C$print.c$529$3_0$296	= .
	.globl	C$print.c$529$3_0$296
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:529: chr = chr - 'a' + 'A';
	ld	a, c
	add	a, #0xe0
	ld	c, a
	jp	00114$
00108$:
	C$print.c$531$2_0$295	= .
	.globl	C$print.c$531$2_0$295
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:531: else if((chr >= 'A') && (chr <= 'Z') && (g_PrintData.CharFirst <= 'a') && (g_PrintData.CharLast >= 'z')) // try to remap to lower case letter
	ld	a, c
	sub	a, #0x41
	jr	C, 00102$
	ld	a, #0x5a
	sub	a, c
	jr	C, 00102$
	ld	a, #0x61
	sub	a, b
	jr	C, 00102$
	ld	a, (#_g_PrintData + 21)
	sub	a, #0x7a
	jr	C, 00102$
	C$print.c$533$3_0$297	= .
	.globl	C$print.c$533$3_0$297
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:533: chr = chr - 'A' + 'a';
	ld	a, c
	add	a, #0x20
	ld	c, a
	jp	00114$
00102$:
	C$print.c$536$2_0$295	= .
	.globl	C$print.c$536$2_0$295
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:536: chr = g_PrintData.CharFirst;
	ld	c, b
00114$:
	C$print.c$538$1_0$294	= .
	.globl	C$print.c$538$1_0$294
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:538: return chr;
	ld	a, c
	C$print.c$539$1_0$294	= .
	.globl	C$print.c$539$1_0$294
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:539: }
	C$print.c$539$1_0$294	= .
	.globl	C$print.c$539$1_0$294
	XG$Print_ValidateChar$0$0	= .
	.globl	XG$Print_ValidateChar$0$0
	ret
	G$Print_ValidatePattern$0$0	= .
	.globl	G$Print_ValidatePattern$0$0
	C$print.c$544$1_0$299	= .
	.globl	C$print.c$544$1_0$299
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:544: u8 Print_ValidatePattern(u8 chr, const c8** patterns)
;	---------------------------------
; Function Print_ValidatePattern
; ---------------------------------
_Print_ValidatePattern::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	c, a
	ld	-2 (ix), e
	ld	-1 (ix), d
	C$print.c$546$1_0$299	= .
	.globl	C$print.c$546$1_0$299
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:546: if((chr < g_PrintData.CharFirst) || (chr > g_PrintData.CharLast))
	ld	hl, #_g_PrintData + 20
	ld	e, (hl)
	ld	a, c
	sub	a, e
	jr	C, 00113$
	ld	a, (#_g_PrintData + 21)
	sub	a, c
	jp	NC, 00114$
00113$:
	C$print.c$548$2_0$300	= .
	.globl	C$print.c$548$2_0$300
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:548: if((chr >= 'a') && (chr <= 'z') && (g_PrintData.CharFirst <= 'A') && (g_PrintData.CharLast >= 'Z')) // try to remap to upper case letter
	ld	a, c
	sub	a, #0x61
	jr	C, 00108$
	ld	a, #0x7a
	sub	a, c
	jr	C, 00108$
	ld	a, #0x41
	sub	a, e
	jr	C, 00108$
	ld	a, (#_g_PrintData + 21)
	sub	a, #0x5a
	jr	C, 00108$
	C$print.c$550$3_0$301	= .
	.globl	C$print.c$550$3_0$301
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:550: chr = chr - 'a' + 'A';
	ld	a, c
	add	a, #0xe0
	ld	c, a
	C$print.c$551$3_0$301	= .
	.globl	C$print.c$551$3_0$301
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:551: *patterns = g_PrintData.FontPatterns + g_PrintData.PatternY * (chr - g_PrintData.CharFirst);
	ld	hl, #_g_PrintData + 28
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	hl, #_g_PrintData + 1
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
	ld	d, h
	cp	a, a
	sbc	hl, de
	ex	de, hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	pop	bc
	ld	a, e
	add	a, -4 (ix)
	ld	b, a
	ld	a, d
	adc	a, -3 (ix)
	ld	e, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), b
	inc	hl
	ld	(hl), e
	jp	00114$
00108$:
	C$print.c$553$2_0$300	= .
	.globl	C$print.c$553$2_0$300
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:553: else if((chr >= 'A') && (chr <= 'Z') && (g_PrintData.CharFirst <= 'a') && (g_PrintData.CharLast >= 'z')) // try to remap to lower case letter
	ld	a, c
	sub	a, #0x41
	jr	C, 00102$
	ld	a, #0x5a
	sub	a, c
	jr	C, 00102$
	ld	a, #0x61
	sub	a, e
	jr	C, 00102$
	ld	a, (#_g_PrintData + 21)
	sub	a, #0x7a
	jr	C, 00102$
	C$print.c$555$3_0$302	= .
	.globl	C$print.c$555$3_0$302
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:555: chr = chr - 'A' + 'a';
	ld	a, c
	add	a, #0x20
	ld	c, a
	C$print.c$556$3_0$302	= .
	.globl	C$print.c$556$3_0$302
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:556: *patterns = g_PrintData.FontPatterns + g_PrintData.PatternY * (chr - g_PrintData.CharFirst);
	ld	hl, #_g_PrintData + 28
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	hl, #_g_PrintData + 1
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
	ld	d, h
	cp	a, a
	sbc	hl, de
	ex	de, hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	__mulint
	pop	bc
	ld	a, e
	add	a, -4 (ix)
	ld	b, a
	ld	a, d
	adc	a, -3 (ix)
	ld	e, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), b
	inc	hl
	ld	(hl), e
	jp	00114$
00102$:
	C$print.c$559$2_0$300	= .
	.globl	C$print.c$559$2_0$300
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:559: *patterns = g_PrintInvalid;
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), #<(_g_PrintInvalid)
	inc	hl
	ld	(hl), #>(_g_PrintInvalid)
00114$:
	C$print.c$561$1_0$299	= .
	.globl	C$print.c$561$1_0$299
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:561: return chr;
	ld	a, c
	C$print.c$562$1_0$299	= .
	.globl	C$print.c$562$1_0$299
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:562: }
	ld	sp, ix
	pop	ix
	C$print.c$562$1_0$299	= .
	.globl	C$print.c$562$1_0$299
	XG$Print_ValidatePattern$0$0	= .
	.globl	XG$Print_ValidatePattern$0$0
	ret
	G$CopyNo8HeightFontData$0$0	= .
	.globl	G$CopyNo8HeightFontData$0$0
	C$print.c$863$1_0$305	= .
	.globl	C$print.c$863$1_0$305
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:863: void CopyNo8HeightFontData(const u8* src, u16 dst, u8 height)
;	---------------------------------
; Function CopyNo8HeightFontData
; ---------------------------------
_CopyNo8HeightFontData::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ex	(sp), hl
	ld	c, e
	ld	b, d
	C$print.c$865$2_0$305	= .
	.globl	C$print.c$865$2_0$305
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:865: for(u8 i = 0; i < g_PrintData.CharCount; ++i)
	ld	-1 (ix), #0x00
00103$:
	ld	hl, #(_g_PrintData + 22)
	ld	e, (hl)
	ld	a, -1 (ix)
	sub	a, e
	jr	NC, 00105$
	C$print.c$867$3_0$306	= .
	.globl	C$print.c$867$3_0$306
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:867: VDP_FillVRAM(0, dst, 0, 8);
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	e, c
	ld	d, b
	xor	a, a
	call	_VDP_FillVRAM_16K
	pop	bc
	C$print.c$868$3_0$306	= .
	.globl	C$print.c$868$3_0$306
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:868: VDP_WriteVRAM(src, dst, 0, height);
	ld	e, 4 (ix)
	ld	d, #0x00
	push	bc
	push	de
	ld	e, c
	ld	d, b
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	pop	bc
	C$print.c$869$3_0$306	= .
	.globl	C$print.c$869$3_0$306
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:869: src += height;
	ld	a, -3 (ix)
	add	a, 4 (ix)
	ld	-3 (ix), a
	jr	NC, 00118$
	inc	-2 (ix)
00118$:
	C$print.c$870$3_0$306	= .
	.globl	C$print.c$870$3_0$306
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:870: dst += 8;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	C$print.c$865$2_0$305	= .
	.globl	C$print.c$865$2_0$305
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:865: for(u8 i = 0; i < g_PrintData.CharCount; ++i)
	inc	-1 (ix)
	jp	00103$
00105$:
	C$print.c$872$2_0$305	= .
	.globl	C$print.c$872$2_0$305
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:872: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$Print_SetTextFont$0$0	= .
	.globl	G$Print_SetTextFont$0$0
	C$print.c$877$2_0$308	= .
	.globl	C$print.c$877$2_0$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:877: void Print_SetTextFont(const u8* fontData, u8 offset)
;	---------------------------------
; Function Print_SetTextFont
; ---------------------------------
_Print_SetTextFont::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	c, l
	ld	b, h
	C$print.c$879$1_0$308	= .
	.globl	C$print.c$879$1_0$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:879: g_PrintData.PatternOffset = offset;
	ld	hl, #(_g_PrintData + 32)
	ld	a, 4 (ix)
	ld	(hl), a
	C$print.c$882$1_0$308	= .
	.globl	C$print.c$882$1_0$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:882: if(fontData == NULL) // Use Bios font (if any)
	ld	a, b
	or	a, c
	jr	NZ, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:883: Print_SetFontEx(8, 8, 1, 1, 1, 255, (const u8*)g_CGTABL + 8); // @todo Should be [1, 255] to include all characters
	ld	de, (_g_CGTABL)
	ld	hl, #0x0008
	add	hl, de
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), #0x08
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0xff
	C$print.h$203$1_1$308	= .
	.globl	C$print.h$203$1_1$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #_g_PrintData + 22
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	(hl), #0xff
	C$print.h$204$1_1$308	= .
	.globl	C$print.h$204$1_1$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	hl, #_g_PrintData + 28
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (#(_g_PrintData + 1) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	((_g_PrintData + 30)), de
	C$print.c$883$1_0$308	= .
	.globl	C$print.c$883$1_0$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:883: Print_SetFontEx(8, 8, 1, 1, 1, 255, (const u8*)g_CGTABL + 8); // @todo Should be [1, 255] to include all characters
	jp	00103$
00102$:
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:885: Print_SetFontEx(8, 8, 1, 1, fontData[2], fontData[3], fontData+4);
	ld	hl, #0x0004
	add	hl, bc
	ex	(sp), hl
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
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	hl, #(_g_PrintData + 1)
	ld	(hl), #0x08
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), e
	C$print.h$203$1_1$308	= .
	.globl	C$print.h$203$1_1$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #_g_PrintData + 22
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, e
	sub	a, d
	inc	a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
	C$print.h$204$1_1$308	= .
	.globl	C$print.h$204$1_1$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	hl, #_g_PrintData + 28
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (#(_g_PrintData + 1) + 0)
	push	bc
	ld	e, a
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00123$:
	add	hl, hl
	jr	NC, 00124$
	add	hl, de
00124$:
	djnz	00123$
	pop	bc
	ld	a, -6 (ix)
	sub	a, l
	ld	e, a
	ld	a, -5 (ix)
	sbc	a, h
	ld	d, a
	ld	((_g_PrintData + 30)), de
	C$print.c$885$1_0$308	= .
	.globl	C$print.c$885$1_0$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:885: Print_SetFontEx(8, 8, 1, 1, fontData[2], fontData[3], fontData+4);
00103$:
	C$print.c$886$1_0$308	= .
	.globl	C$print.c$886$1_0$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:886: Print_Initialize();
	push	bc
	call	_Print_Initialize
	ld	a, #0x04
	call	_Print_SetMode
	pop	bc
	C$print.c$890$1_1$309	= .
	.globl	C$print.c$890$1_1$309
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:890: const u8* src = g_PrintData.FontPatterns;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	C$print.c$891$1_1$309	= .
	.globl	C$print.c$891$1_1$309
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:891: u16 dst = (u16)g_ScreenPatternLow + (offset * 8);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenPatternLow)
	add	hl, de
	ex	de, hl
	C$print.c$893$1_1$309	= .
	.globl	C$print.c$893$1_1$309
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:893: if(fontData != NULL)
	ld	a, b
	or	a, c
	jr	Z, 00105$
	C$print.c$894$1_1$309	= .
	.globl	C$print.c$894$1_1$309
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:894: CopyNo8HeightFontData(src, dst, fontData[0] & 0x0F);
	ld	a, (bc)
	and	a, #0x0f
	push	af
	inc	sp
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_CopyNo8HeightFontData
	jp	00111$
00105$:
	C$print.c$897$1_1$309	= .
	.globl	C$print.c$897$1_1$309
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:897: VDP_WriteVRAM(src, dst, 0, g_PrintData.CharCount * 8);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
	C$print.c$924$1_1$308	= .
	.globl	C$print.c$924$1_1$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:924: };
00111$:
	C$print.c$925$1_1$308	= .
	.globl	C$print.c$925$1_1$308
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:925: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$DrawChar_Layout$0$0	= .
	.globl	G$DrawChar_Layout$0$0
	C$print.c$930$1_1$321	= .
	.globl	C$print.c$930$1_1$321
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:930: void DrawChar_Layout(u8 chr)
;	---------------------------------
; Function DrawChar_Layout
; ---------------------------------
_DrawChar_Layout::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$print.c$933$1_0$321	= .
	.globl	C$print.c$933$1_0$321
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:933: chr = Print_ValidateChar(chr);
	call	_Print_ValidateChar
	ld	c, a
	C$print.c$935$1_1$322	= .
	.globl	C$print.c$935$1_1$322
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:935: u8 shape = chr - g_PrintData.CharFirst + g_PrintData.PatternOffset;
	ld	hl, #_g_PrintData + 20
	ld	b, (hl)
	ld	a, c
	sub	a, b
	ld	hl, #_g_PrintData + 32
	ld	c, (hl)
	add	a, c
	ld	-1 (ix), a
	C$print.c$936$1_1$322	= .
	.globl	C$print.c$936$1_1$322
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:936: u16 dst = (u16)g_ScreenLayoutLow + (g_PrintData.CursorY * g_PrintData.ScreenWidth) + g_PrintData.CursorX;
	ld	hl, #_g_PrintData + 6
	ld	c, (hl)
	ld	de, (#_g_PrintData + 26)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	ld	iy, (_g_ScreenLayoutLow)
	add	iy, de
	ld	a, (#_g_PrintData + 5)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	iy
	pop	bc
	add	hl, bc
	ex	de, hl
	C$print.c$937$1_1$322	= .
	.globl	C$print.c$937$1_1$322
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:937: VDP_Poke(shape, dst, g_ScreenLayoutHigh);
	ld	a, -1 (ix)
	call	_VDP_Poke_16K
	C$print.c$938$1_1$321	= .
	.globl	C$print.c$938$1_1$321
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:938: }
	inc	sp
	pop	ix
	C$print.c$938$1_1$321	= .
	.globl	C$print.c$938$1_1$321
	XG$DrawChar_Layout$0$0	= .
	.globl	XG$DrawChar_Layout$0$0
	ret
	G$Print_Clear$0$0	= .
	.globl	G$Print_Clear$0$0
	C$print.c$1103$1_1$323	= .
	.globl	C$print.c$1103$1_1$323
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1103: void Print_Clear()
;	---------------------------------
; Function Print_Clear
; ---------------------------------
_Print_Clear::
	C$print.c$1116$2_0$325	= .
	.globl	C$print.c$1116$2_0$325
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1116: VDP_FillVRAM(0, g_ScreenLayoutLow, g_ScreenLayoutHigh, 24 * g_PrintData.ScreenWidth);
	ld	hl, (#(_g_PrintData + 26) + 0)
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
	C$print.c$1119$1_0$323	= .
	.globl	C$print.c$1119$1_0$323
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1119: }
	C$print.c$1119$1_0$323	= .
	.globl	C$print.c$1119$1_0$323
	XG$Print_Clear$0$0	= .
	.globl	XG$Print_Clear$0$0
	ret
	G$Print_Backspace$0$0	= .
	.globl	G$Print_Backspace$0$0
	C$print.c$1124$1_0$333	= .
	.globl	C$print.c$1124$1_0$333
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1124: void Print_Backspace(u8 num)
;	---------------------------------
; Function Print_Backspace
; ---------------------------------
_Print_Backspace::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
	C$print.c$1144$2_0$335	= .
	.globl	C$print.c$1144$2_0$335
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1144: u16 dst = g_ScreenLayoutLow + (g_PrintData.CursorY * g_PrintData.ScreenWidth) + g_PrintData.CursorX - num;
	ld	hl, #_g_PrintData + 6
	ld	c, (hl)
	ld	de, (#_g_PrintData + 26)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	ld	hl, (_g_ScreenLayoutLow)
	add	hl, de
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	e, -1 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	ex	de, hl
	C$print.c$1145$2_0$335	= .
	.globl	C$print.c$1145$2_0$335
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1145: VDP_FillVRAM(0, dst, g_ScreenLayoutHigh, num);
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	xor	a, a
	call	_VDP_FillVRAM_16K
	pop	bc
	C$print.c$1146$2_0$335	= .
	.globl	C$print.c$1146$2_0$335
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1146: g_PrintData.CursorX -= num;
	ld	a, (bc)
	sub	a, -1 (ix)
	ld	(bc), a
	C$print.c$1149$1_0$333	= .
	.globl	C$print.c$1149$1_0$333
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1149: }
	inc	sp
	pop	ix
	C$print.c$1149$1_0$333	= .
	.globl	C$print.c$1149$1_0$333
	XG$Print_Backspace$0$0	= .
	.globl	XG$Print_Backspace$0$0
	ret
	G$Print_DrawChar$0$0	= .
	.globl	G$Print_DrawChar$0$0
	C$print.c$1154$1_0$343	= .
	.globl	C$print.c$1154$1_0$343
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1154: void Print_DrawChar(u8 chr)
;	---------------------------------
; Function Print_DrawChar
; ---------------------------------
_Print_DrawChar::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
	C$print.c$1157$1_0$343	= .
	.globl	C$print.c$1157$1_0$343
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1157: if(g_PrintData.CursorX + PRINT_W(g_PrintData.UnitX) > g_PrintData.ScreenWidth) // Handle automatic new-line when 
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	ld	e, a
	ld	d, #0x00
	inc	de
	ld	hl, (#_g_PrintData + 26)
	xor	a, a
	sbc	hl, de
	jr	NC, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:431: g_PrintData.CursorX = 0;
	xor	a, a
	ld	(bc), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:432: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	de, #_g_PrintData + 6
	ld	a, (de)
	inc	a
	ld	(de), a
	C$print.c$1158$1_0$343	= .
	.globl	C$print.c$1158$1_0$343
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1158: Print_Return();
00102$:
	C$print.c$1163$1_0$343	= .
	.globl	C$print.c$1163$1_0$343
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1163: g_PrintData.DrawChar(chr);
	ld	hl, (#_g_PrintData + 23)
	push	bc
	ld	a, -1 (ix)
	call	___sdcc_call_hl
	pop	bc
	C$print.c$1166$1_0$343	= .
	.globl	C$print.c$1166$1_0$343
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1166: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX);
	ld	a, (bc)
	inc	a
	ld	(bc), a
	C$print.c$1167$1_0$343	= .
	.globl	C$print.c$1167$1_0$343
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1167: }
	inc	sp
	pop	ix
	C$print.c$1167$1_0$343	= .
	.globl	C$print.c$1167$1_0$343
	XG$Print_DrawChar$0$0	= .
	.globl	XG$Print_DrawChar$0$0
	ret
	G$Print_DrawCharX$0$0	= .
	.globl	G$Print_DrawCharX$0$0
	C$print.c$1173$1_0$349	= .
	.globl	C$print.c$1173$1_0$349
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1173: void Print_DrawCharX(c8 chr, u8 num)
;	---------------------------------
; Function Print_DrawCharX
; ---------------------------------
_Print_DrawCharX::
	ld	c, a
	C$print.c$1175$2_0$349	= .
	.globl	C$print.c$1175$2_0$349
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1175: for(u8 i = 0; i < num; ++i)
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, l
	ret	NC
	C$print.c$1176$2_0$349	= .
	.globl	C$print.c$1176$2_0$349
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1176: Print_DrawChar(chr);
	push	hl
	push	bc
	ld	a, c
	call	_Print_DrawChar
	pop	bc
	pop	hl
	C$print.c$1175$2_0$349	= .
	.globl	C$print.c$1175$2_0$349
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1175: for(u8 i = 0; i < num; ++i)
	inc	b
	C$print.c$1177$2_0$349	= .
	.globl	C$print.c$1177$2_0$349
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1177: }
	C$print.c$1177$2_0$349	= .
	.globl	C$print.c$1177$2_0$349
	XG$Print_DrawCharX$0$0	= .
	.globl	XG$Print_DrawCharX$0$0
	jp	00103$
	G$Print_DrawText$0$0	= .
	.globl	G$Print_DrawText$0$0
	C$print.c$1182$2_0$351	= .
	.globl	C$print.c$1182$2_0$351
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1182: void Print_DrawText(const c8* str)
;	---------------------------------
; Function Print_DrawText
; ---------------------------------
_Print_DrawText::
	ex	de, hl
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1184: while(*str != 0)
00107$:
	ld	a, (de)
	C$print.c$1186$2_0$352	= .
	.globl	C$print.c$1186$2_0$352
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1186: if(*str == '\t')
	ld	c,a
	or	a,a
	ret	Z
	sub	a, #0x09
	jr	NZ, 00105$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:423: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX) + g_PrintData.TabSize - 1;
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	ld	hl, #(_g_PrintData + 4)
	ld	l, (hl)
;	spillPairReg hl
	add	a, l
	ld	(bc), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:424: g_PrintData.CursorX &= ~(g_PrintData.TabSize - 1);
	ld	hl, #(_g_PrintData + 4)
	ld	l, (hl)
;	spillPairReg hl
	dec	l
	push	af
	ld	a, l
	cpl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	and	a, l
	ld	(bc), a
	C$print.c$1187$2_0$352	= .
	.globl	C$print.c$1187$2_0$352
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1187: Print_Tab();
	jp	00106$
00105$:
	C$print.c$1188$2_0$352	= .
	.globl	C$print.c$1188$2_0$352
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1188: else if(*str == '\n')
	ld	a, c
	sub	a, #0x0a
	jr	NZ, 00102$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:431: g_PrintData.CursorX = 0;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:432: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	bc, #_g_PrintData + 6
	ld	a, (bc)
	inc	a
	ld	(bc), a
	C$print.c$1189$2_0$352	= .
	.globl	C$print.c$1189$2_0$352
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1189: Print_Return();
	jp	00106$
00102$:
	C$print.c$1195$2_0$352	= .
	.globl	C$print.c$1195$2_0$352
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1195: Print_DrawChar(*str);
	push	de
	ld	a, c
	call	_Print_DrawChar
	pop	de
00106$:
	C$print.c$1196$2_0$352	= .
	.globl	C$print.c$1196$2_0$352
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1196: str++;
	inc	de
	C$print.c$1198$1_0$351	= .
	.globl	C$print.c$1198$1_0$351
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1198: }
	C$print.c$1198$1_0$351	= .
	.globl	C$print.c$1198$1_0$351
	XG$Print_DrawText$0$0	= .
	.globl	XG$Print_DrawText$0$0
	jp	00107$
	G$Print_DrawBin8$0$0	= .
	.globl	G$Print_DrawBin8$0$0
	C$print.c$1203$1_0$361	= .
	.globl	C$print.c$1203$1_0$361
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1203: void Print_DrawBin8(u8 value)
;	---------------------------------
; Function Print_DrawBin8
; ---------------------------------
_Print_DrawBin8::
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$print.c$1205$2_0$361	= .
	.globl	C$print.c$1205$2_0$361
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1205: u8 flag = (u8)(1 << 7);
	C$print.c$1206$2_0$361	= .
	.globl	C$print.c$1206$2_0$361
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1206: for(u8 i = 0; i < 8; ++i)
	ld	bc, #0x80
00103$:
	ld	a, b
	sub	a, #0x08
	ret	NC
	C$print.c$1208$3_0$362	= .
	.globl	C$print.c$1208$3_0$362
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1208: Print_DrawChar((value & flag) ? '1' : '0');
	ld	a, l
	and	a,c
	jr	Z, 00107$
	ld	de, #0x0031
	jp	00108$
00107$:
	ld	de, #0x0030
00108$:
	push	hl
	push	bc
	ld	a, e
	call	_Print_DrawChar
	pop	bc
	pop	hl
	C$print.c$1209$3_0$362	= .
	.globl	C$print.c$1209$3_0$362
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1209: flag >>= 1;
	srl	c
	C$print.c$1206$2_0$361	= .
	.globl	C$print.c$1206$2_0$361
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1206: for(u8 i = 0; i < 8; ++i)
	inc	b
	C$print.c$1214$2_0$361	= .
	.globl	C$print.c$1214$2_0$361
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1214: }
	C$print.c$1214$2_0$361	= .
	.globl	C$print.c$1214$2_0$361
	XG$Print_DrawBin8$0$0	= .
	.globl	XG$Print_DrawBin8$0$0
	jp	00103$
	G$Print_DrawHex8$0$0	= .
	.globl	G$Print_DrawHex8$0$0
	C$print.c$1219$2_0$364	= .
	.globl	C$print.c$1219$2_0$364
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1219: void Print_DrawHex8(u8 value)
;	---------------------------------
; Function Print_DrawHex8
; ---------------------------------
_Print_DrawHex8::
	ld	e, a
	C$print.c$1221$1_0$364	= .
	.globl	C$print.c$1221$1_0$364
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1221: Print_DrawChar(g_HexChar[(value >> 4) & 0x000F]);
	ld	bc, #_g_HexChar+0
	ld	a, e
	rlca
	rlca
	rlca
	rlca
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0xf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	d, (hl)
	push	bc
	push	de
	ld	a, d
	call	_Print_DrawChar
	pop	de
	pop	bc
	C$print.c$1222$1_0$364	= .
	.globl	C$print.c$1222$1_0$364
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1222: Print_DrawChar(g_HexChar[value & 0x000F]);
	ld	d, #0x00
	ld	a, e
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, (hl)
	ld	a, c
	C$print.c$1226$1_0$364	= .
	.globl	C$print.c$1226$1_0$364
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1226: }
	C$print.c$1226$1_0$364	= .
	.globl	C$print.c$1226$1_0$364
	XG$Print_DrawHex8$0$0	= .
	.globl	XG$Print_DrawHex8$0$0
	jp	_Print_DrawChar
	G$Print_DrawHex16$0$0	= .
	.globl	G$Print_DrawHex16$0$0
	C$print.c$1231$1_0$366	= .
	.globl	C$print.c$1231$1_0$366
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1231: void Print_DrawHex16(u16 value)
;	---------------------------------
; Function Print_DrawHex16
; ---------------------------------
_Print_DrawHex16::
	C$print.c$1233$1_0$366	= .
	.globl	C$print.c$1233$1_0$366
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1233: Print_DrawHex8(value >> 8);
	ld	c, h
	push	hl
	ld	a, c
	call	_Print_DrawHex8
	pop	hl
	C$print.c$1234$1_0$366	= .
	.globl	C$print.c$1234$1_0$366
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1234: Print_DrawHex8((u8)value);
	ld	a, l
	C$print.c$1235$1_0$366	= .
	.globl	C$print.c$1235$1_0$366
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1235: }
	C$print.c$1235$1_0$366	= .
	.globl	C$print.c$1235$1_0$366
	XG$Print_DrawHex16$0$0	= .
	.globl	XG$Print_DrawHex16$0$0
	jp	_Print_DrawHex8
	G$Print_DrawHex32$0$0	= .
	.globl	G$Print_DrawHex32$0$0
	C$print.c$1241$1_0$368	= .
	.globl	C$print.c$1241$1_0$368
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1241: void Print_DrawHex32(u32 value)
;	---------------------------------
; Function Print_DrawHex32
; ---------------------------------
_Print_DrawHex32::
	C$print.c$1243$1_0$368	= .
	.globl	C$print.c$1243$1_0$368
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1243: Print_DrawHex16(value >> 16);
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	_Print_DrawHex16
	pop	de
	pop	bc
	C$print.c$1244$1_0$368	= .
	.globl	C$print.c$1244$1_0$368
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1244: Print_DrawHex16((u16)value);
	ex	de, hl
	C$print.c$1245$1_0$368	= .
	.globl	C$print.c$1245$1_0$368
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1245: }
	C$print.c$1245$1_0$368	= .
	.globl	C$print.c$1245$1_0$368
	XG$Print_DrawHex32$0$0	= .
	.globl	XG$Print_DrawHex32$0$0
	jp	_Print_DrawHex16
	G$Print_DrawInt$0$0	= .
	.globl	G$Print_DrawInt$0$0
	C$print.c$1252$1_0$370	= .
	.globl	C$print.c$1252$1_0$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1252: void Print_DrawInt(i32 value)
;	---------------------------------
; Function Print_DrawInt
; ---------------------------------
_Print_DrawInt::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$print.c$1259$1_0$370	= .
	.globl	C$print.c$1259$1_0$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1259: if(value < 0)
	bit	7, -1 (ix)
	jr	Z, 00102$
	C$print.c$1261$2_0$371	= .
	.globl	C$print.c$1261$2_0$371
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1261: Print_DrawChar('-');
	ld	a, #0x2d
	call	_Print_DrawChar
	C$print.c$1262$2_0$371	= .
	.globl	C$print.c$1262$2_0$371
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1262: value = -value;
	xor	a, a
	sub	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, #0x00
	sbc	a, -3 (ix)
	ld	-3 (ix), a
	ld	a, #0x00
	sbc	a, -2 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -1 (ix)
	ld	-1 (ix), a
00102$:
	C$print.c$1266$2_0$372	= .
	.globl	C$print.c$1266$2_0$372
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1266: c8* ptr = str;
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
	C$print.c$1267$1_1$372	= .
	.globl	C$print.c$1267$1_1$372
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1267: *ptr = 0;
	xor	a, a
	ld	(bc), a
	C$print.c$1268$1_1$370	= .
	.globl	C$print.c$1268$1_1$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1268: while(value >= 10)
00103$:
	C$print.c$1270$1_1$370	= .
	.globl	C$print.c$1270$1_1$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1270: *++ptr = '0' + (value % 10);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	C$print.c$1268$1_1$372	= .
	.globl	C$print.c$1268$1_1$372
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1268: while(value >= 10)
	ld	a, -4 (ix)
	sub	a, #0x0a
	ld	a, -3 (ix)
	sbc	a, #0x00
	ld	a, -2 (ix)
	sbc	a, #0x00
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00105$
	C$print.c$1270$2_1$373	= .
	.globl	C$print.c$1270$2_1$373
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1270: *++ptr = '0' + (value % 10);
	ld	c, l
	ld	b, h
	push	hl
	push	bc
	ld	de, #0x0000
	push	de
	ld	e, #0x0a
	push	de
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modslong
	pop	af
	ex	(sp),hl
	pop	iy
	pop	bc
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
	C$print.c$1271$1_1$370	= .
	.globl	C$print.c$1271$1_1$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1271: value /= 10;
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divslong
	pop	af
	pop	af
	pop	bc
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00103$
00105$:
	C$print.c$1273$1_1$372	= .
	.globl	C$print.c$1273$1_1$372
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1273: *++ptr = '0' + value;
	ld	a, -4 (ix)
	add	a, #0x30
	ld	(hl), a
	C$print.c$1274$1_1$370	= .
	.globl	C$print.c$1274$1_1$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1274: while(*ptr != 0)
00106$:
	ld	a, (hl)
	or	a, a
	jr	Z, 00109$
	C$print.c$1275$1_1$372	= .
	.globl	C$print.c$1275$1_1$372
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1275: Print_DrawChar(*ptr--);	
	dec	hl
	ld	c, a
	push	hl
	ld	a, c
	call	_Print_DrawChar
	pop	hl
	jp	00106$
00109$:
	C$print.c$1276$1_1$370	= .
	.globl	C$print.c$1276$1_1$370
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1276: }
	ld	sp, ix
	pop	ix
	C$print.c$1276$1_1$370	= .
	.globl	C$print.c$1276$1_1$370
	XG$Print_DrawInt$0$0	= .
	.globl	XG$Print_DrawInt$0$0
	ret
	G$Print_DrawFormat$0$0	= .
	.globl	G$Print_DrawFormat$0$0
	C$print.c$1285$1_1$375	= .
	.globl	C$print.c$1285$1_1$375
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1285: void Print_DrawFormat(const c8* format, ...)
;	---------------------------------
; Function Print_DrawFormat
; ---------------------------------
_Print_DrawFormat::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
	C$print.c$1290$2_0$376	= .
	.globl	C$print.c$1290$2_0$376
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1290: va_start(args, format);
	ld	hl, #26
	add	hl, sp
	ld	-8 (ix), l
	ld	-7 (ix), h
	C$print.c$1292$2_0$377	= .
	.globl	C$print.c$1292$2_0$377
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1292: const c8* ptr = format;
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
	C$print.c$1293$4_3$386	= .
	.globl	C$print.c$1293$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1293: while(*ptr != 0)
00194$:
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z, 00200$
	C$print.c$1295$2_1$378	= .
	.globl	C$print.c$1295$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1295: if(*ptr == '%')
	ld	a, -1 (ix)
	sub	a, #0x25
	jp	NZ,00192$
	C$print.c$1297$3_1$379	= .
	.globl	C$print.c$1297$3_1$379
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1297: ptr++;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	inc	bc
	C$print.c$1300$4_1$380	= .
	.globl	C$print.c$1300$4_1$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1300: u8 len = 0;
	ld	-1 (ix), #0x00
	C$print.c$1301$3_2$380	= .
	.globl	C$print.c$1301$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1301: if((*ptr >= '0') && (*ptr <= '9'))
	ld	a, (bc)
	ld	e, a
	sub	a, #0x30
	jr	C, 00208$
	ld	a, #0x39
	sub	a, e
	jr	C, 00208$
	C$print.c$1303$4_2$381	= .
	.globl	C$print.c$1303$4_2$381
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1303: len = *ptr - '0';
	ld	a, e
	add	a, #0xd0
	ld	-1 (ix), a
	C$print.c$1304$4_2$381	= .
	.globl	C$print.c$1304$4_2$381
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1304: ptr++;
	inc	bc
	C$print.c$1306$2_1$375	= .
	.globl	C$print.c$1306$2_1$375
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1306: while((*ptr >= '0') && (*ptr <= '9'))
00208$:
	ld	-10 (ix), c
	ld	-9 (ix), b
00105$:
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	sub	a, #0x30
	jr	C, 00244$
	ld	a, #0x39
	sub	a, -2 (ix)
	jr	C, 00244$
	C$print.c$1308$4_2$382	= .
	.globl	C$print.c$1308$4_2$382
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1308: len *= 10;
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	C$print.c$1309$4_2$382	= .
	.globl	C$print.c$1309$4_2$382
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1309: len += *ptr - '0';
	ld	a, -2 (ix)
	add	a, #0xd0
	add	a, l
	ld	-1 (ix), a
	C$print.c$1310$4_2$382	= .
	.globl	C$print.c$1310$4_2$382
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1310: ptr++;
	inc	-10 (ix)
	jr	NZ, 00105$
	inc	-9 (ix)
	jp	00105$
00244$:
	ld	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	ld	-3 (ix), a
	C$print.c$1314$3_2$380	= .
	.globl	C$print.c$1314$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1314: if((*ptr == 'i') || (*ptr == 'd'))
	ld	a, -2 (ix)
	sub	a, #0x69
	jr	Z, 00178$
	ld	a, -2 (ix)
	sub	a, #0x64
	jr	NZ, 00179$
00178$:
	C$print.c$1316$4_2$383	= .
	.globl	C$print.c$1316$4_2$383
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1316: i16 val = (i16)va_arg(args, i16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	C$print.c$1317$4_2$383	= .
	.globl	C$print.c$1317$4_2$383
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1317: Print_DrawInt(val);
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00179$:
	C$print.c$1319$3_2$380	= .
	.globl	C$print.c$1319$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1319: else if(*ptr == 'u')
	ld	a, -2 (ix)
	sub	a, #0x75
	jr	NZ, 00176$
	C$print.c$1321$4_2$384	= .
	.globl	C$print.c$1321$4_2$384
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1321: u16 val = (u16)va_arg(args, u16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -6 (ix)
	add	a, #0xfe
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	C$print.c$1322$4_2$384	= .
	.globl	C$print.c$1322$4_2$384
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1322: Print_DrawInt(val);
	ld	a, -2 (ix)
	ld	-12 (ix), a
	ld	a, -1 (ix)
	ld	-11 (ix), a
	xor	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00176$:
	C$print.c$1324$3_2$380	= .
	.globl	C$print.c$1324$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1324: else if(*ptr == 'x')
	ld	a, -2 (ix)
	sub	a, #0x78
	jp	NZ,00173$
	C$print.c$1326$4_2$385	= .
	.globl	C$print.c$1326$4_2$385
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1326: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00109$
	C$print.c$1327$4_2$385	= .
	.globl	C$print.c$1327$4_2$385
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1327: len = 4;
	ld	-1 (ix), #0x04
00109$:
	C$print.c$1328$4_3$386	= .
	.globl	C$print.c$1328$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1328: u16 val = (u16)va_arg(args, u16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-10 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
	C$print.c$1329$4_3$386	= .
	.globl	C$print.c$1329$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1329: if(len > 3)
	ld	a, #0x03
	sub	a, -1 (ix)
	jr	NC, 00111$
	C$print.c$1330$4_3$386	= .
	.globl	C$print.c$1330$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1330: Print_DrawChar(g_HexChar[(val >> 12) & 0x000F]);
	ld	a, -11 (ix)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x0f
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	and	a, #0x0f
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -9 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
00111$:
	C$print.c$1331$4_3$386	= .
	.globl	C$print.c$1331$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1331: if(len > 2)
	ld	a, #0x02
	sub	a, -1 (ix)
	jr	NC, 00113$
	C$print.c$1332$4_3$386	= .
	.globl	C$print.c$1332$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1332: Print_DrawChar(g_HexChar[(val >> 8) & 0x000F]);
	ld	a, -11 (ix)
	ld	-2 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, -6 (ix)
	and	a, #0x0f
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -9 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
00113$:
	C$print.c$1333$4_3$386	= .
	.globl	C$print.c$1333$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1333: if(len > 1)
	ld	a, #0x01
	sub	a, -1 (ix)
	jr	NC, 00115$
	C$print.c$1334$4_3$386	= .
	.globl	C$print.c$1334$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1334: Print_DrawChar(g_HexChar[(val >> 4) & 0x000F]);
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, -11 (ix)
	ld	-1 (ix), a
	srl	-1 (ix)
	rr	-2 (ix)
	srl	-1 (ix)
	rr	-2 (ix)
	srl	-1 (ix)
	rr	-2 (ix)
	srl	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
00115$:
	C$print.c$1335$4_3$386	= .
	.globl	C$print.c$1335$4_3$386
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1335: Print_DrawChar(g_HexChar[val & 0x000F]);
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, -11 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	and	a, #0x0f
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	ld	a, #<(_g_HexChar)
	add	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_HexChar)
	adc	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	call	_Print_DrawChar
	jp	00193$
00173$:
	C$print.c$1337$3_2$380	= .
	.globl	C$print.c$1337$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1337: else if(*ptr == 'b')
	ld	a, -2 (ix)
	sub	a, #0x62
	jp	NZ,00170$
	C$print.c$1339$4_2$387	= .
	.globl	C$print.c$1339$4_2$387
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1339: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00117$
	C$print.c$1340$4_2$387	= .
	.globl	C$print.c$1340$4_2$387
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1340: len = 16;
	ld	-1 (ix), #0x10
00117$:
	C$print.c$1341$4_3$388	= .
	.globl	C$print.c$1341$4_3$388
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1341: u16 val = (u16)va_arg(args, u16);
	ld	a, -8 (ix)
	add	a, #0x02
	ld	-10 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, -9 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	C$print.c$1342$4_3$388	= .
	.globl	C$print.c$1342$4_3$388
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1342: u16 bit = 1 << (len - 1);
	dec	-1 (ix)
	ld	b, -1 (ix)
	ld	-2 (ix), #0x01
	ld	-1 (ix), #0
	inc	b
	jp	00426$
00425$:
	sla	-2 (ix)
	rl	-1 (ix)
00426$:
	djnz	00425$
	C$print.c$1343$4_3$388	= .
	.globl	C$print.c$1343$4_3$388
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1343: while(bit)
00121$:
	ld	a, -1 (ix)
	or	a, -2 (ix)
	jp	Z, 00193$
	C$print.c$1345$5_3$389	= .
	.globl	C$print.c$1345$5_3$389
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1345: if(val & bit)
	ld	a, -6 (ix)
	and	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	and	a, -1 (ix)
	ld	-9 (ix), a
	or	a, -10 (ix)
	jr	Z, 00119$
	C$print.c$1346$5_3$389	= .
	.globl	C$print.c$1346$5_3$389
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1346: Print_DrawChar('1');
	ld	a, #0x31
	call	_Print_DrawChar
	jp	00120$
00119$:
	C$print.c$1348$5_3$389	= .
	.globl	C$print.c$1348$5_3$389
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1348: Print_DrawChar('0');
	ld	a, #0x30
	call	_Print_DrawChar
00120$:
	C$print.c$1349$5_3$389	= .
	.globl	C$print.c$1349$5_3$389
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1349: bit >>= 1;
	srl	-1 (ix)
	rr	-2 (ix)
	jp	00121$
00170$:
	C$print.c$1353$3_2$380	= .
	.globl	C$print.c$1353$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1353: else if((*ptr == 'I') || (*ptr == 'D'))
	ld	a, -2 (ix)
	sub	a, #0x49
	jr	Z, 00165$
	ld	a, -2 (ix)
	sub	a, #0x44
	jr	NZ, 00166$
00165$:
	C$print.c$1355$4_2$390	= .
	.globl	C$print.c$1355$4_2$390
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1355: i32 val = (i32)va_arg(args, i32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	C$print.c$1356$4_2$390	= .
	.globl	C$print.c$1356$4_2$390
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1356: Print_DrawInt(val);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00166$:
	C$print.c$1358$3_2$380	= .
	.globl	C$print.c$1358$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1358: else if(*ptr == 'U')
	ld	a, -2 (ix)
	sub	a, #0x55
	jr	NZ, 00163$
	C$print.c$1360$4_2$391	= .
	.globl	C$print.c$1360$4_2$391
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1360: u32 val = (u32)va_arg(args, u32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	C$print.c$1361$4_2$391	= .
	.globl	C$print.c$1361$4_2$391
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1361: Print_DrawInt(val);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawInt
	jp	00193$
00163$:
	C$print.c$1363$3_2$380	= .
	.globl	C$print.c$1363$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1363: else if(*ptr == 'X')
	ld	a, -2 (ix)
	sub	a, #0x58
	jp	NZ,00160$
	C$print.c$1365$4_2$392	= .
	.globl	C$print.c$1365$4_2$392
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1365: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00125$
	C$print.c$1366$4_2$392	= .
	.globl	C$print.c$1366$4_2$392
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1366: len = 8;
	ld	-1 (ix), #0x08
00125$:
	C$print.c$1367$4_3$393	= .
	.globl	C$print.c$1367$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1367: u32 val = (u32)va_arg(args, u32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, l
	add	a, #0xfc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	C$print.c$1369$4_3$393	= .
	.globl	C$print.c$1369$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1369: if(len > 7)
	ld	a, #0x07
	sub	a, -1 (ix)
	jr	NC, 00127$
	C$print.c$1370$4_3$393	= .
	.globl	C$print.c$1370$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1370: Print_DrawChar(g_HexChar[(val >> 28) & 0xF]);
	ld	-12 (ix), d
	xor	a, a
	ld	-11 (ix), a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	a, #0x04
00434$:
	srl	-12 (ix)
	dec	a
	jr	NZ, 00434$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00127$:
	C$print.c$1371$4_3$393	= .
	.globl	C$print.c$1371$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1371: if(len > 6)
	ld	a, #0x06
	sub	a, -1 (ix)
	jr	NC, 00129$
	C$print.c$1372$4_3$393	= .
	.globl	C$print.c$1372$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1372: Print_DrawChar(g_HexChar[(val >> 24) & 0xF]);
	ld	a, d
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00129$:
	C$print.c$1373$4_3$393	= .
	.globl	C$print.c$1373$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1373: if(len > 5)
	ld	a, #0x05
	sub	a, -1 (ix)
	jr	NC, 00131$
	C$print.c$1374$4_3$393	= .
	.globl	C$print.c$1374$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1374: Print_DrawChar(g_HexChar[(val >> 20) & 0xF]);
	ld	-12 (ix), e
	ld	-11 (ix), d
	xor	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	ld	a, #0x04
00436$:
	srl	-11 (ix)
	rr	-12 (ix)
	dec	a
	jr	NZ, 00436$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00131$:
	C$print.c$1375$4_3$393	= .
	.globl	C$print.c$1375$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1375: if(len > 4)
	ld	a, #0x04
	sub	a, -1 (ix)
	jr	NC, 00133$
	C$print.c$1376$4_3$393	= .
	.globl	C$print.c$1376$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1376: Print_DrawChar(g_HexChar[(val >> 16) & 0xF]);
	ld	a, e
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00133$:
	C$print.c$1377$4_3$393	= .
	.globl	C$print.c$1377$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1377: if(len > 3)
	ld	a, #0x03
	sub	a, -1 (ix)
	jr	NC, 00135$
	C$print.c$1378$4_3$393	= .
	.globl	C$print.c$1378$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1378: Print_DrawChar(g_HexChar[(val >> 12) & 0xF]);
	ld	-12 (ix), b
	ld	-11 (ix), e
	ld	-10 (ix), d
	ld	-9 (ix), #0x00
	ld	a, #0x04
00438$:
	srl	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	dec	a
	jr	NZ, 00438$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	de
	ld	de, #_g_HexChar
	add	hl, de
	pop	de
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00135$:
	C$print.c$1379$4_3$393	= .
	.globl	C$print.c$1379$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1379: if(len > 2)
	ld	a, #0x02
	sub	a, -1 (ix)
	jr	NC, 00137$
	C$print.c$1380$4_3$393	= .
	.globl	C$print.c$1380$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1380: Print_DrawChar(g_HexChar[(val >> 8) & 0xF]);
	ld	a, b
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00137$:
	C$print.c$1381$4_3$393	= .
	.globl	C$print.c$1381$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1381: if(len > 1)
	ld	a, #0x01
	sub	a, -1 (ix)
	jr	NC, 00139$
	C$print.c$1382$4_3$393	= .
	.globl	C$print.c$1382$4_3$393
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1382: Print_DrawChar(g_HexChar[(val >> 4) & 0xF]);
	ld	-12 (ix), c
	ld	-11 (ix), b
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	a, #0x04
00440$:
	srl	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	dec	a
	jr	NZ, 00440$
	ld	a, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x0f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #<(_g_HexChar)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #>(_g_HexChar)
	ld	h, a
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Print_DrawChar
	pop	de
	pop	bc
00139$:
	C$print.c$1383$2_1$375	= .
	.globl	C$print.c$1383$2_1$375
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1383: Print_DrawChar(g_HexChar[val & 0xF]);
	ld	a, c
	and	a, #0x0f
	ld	c, a
	ld	b, #0x00
	ld	hl, #_g_HexChar
	add	hl, bc
	ld	a, (hl)
	call	_Print_DrawChar
	jp	00193$
00160$:
	C$print.c$1385$3_2$380	= .
	.globl	C$print.c$1385$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1385: else if(*ptr == 'B')
	ld	a, -2 (ix)
	sub	a, #0x42
	jp	NZ,00157$
	C$print.c$1387$4_2$394	= .
	.globl	C$print.c$1387$4_2$394
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1387: if(len == 0)
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00141$
	C$print.c$1388$4_2$394	= .
	.globl	C$print.c$1388$4_2$394
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1388: len = 16;
	ld	-1 (ix), #0x10
00141$:
	C$print.c$1389$4_3$395	= .
	.globl	C$print.c$1389$4_3$395
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1389: u32 val = (u32)va_arg(args, u32);
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	de, #0xfffc
	add	hl, de
	ex	de,hl
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	C$print.c$1390$4_3$395	= .
	.globl	C$print.c$1390$4_3$395
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1390: u32 bit = 1 << (len - 1);
	ld	b, -1 (ix)
	dec	b
	ld	hl, #0x0001
	inc	b
	jp	00445$
00444$:
	add	hl, hl
00445$:
	djnz	00444$
	ld	-12 (ix), l
	ld	a, h
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	-9 (ix), a
	C$print.c$1391$4_3$395	= .
	.globl	C$print.c$1391$4_3$395
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1391: while(bit)
00145$:
	ld	a, -9 (ix)
	or	a, -10 (ix)
	or	a, -11 (ix)
	or	a, -12 (ix)
	jp	Z, 00193$
	C$print.c$1393$5_3$396	= .
	.globl	C$print.c$1393$5_3$396
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1393: if(val & bit)
	ld	a, -16 (ix)
	and	a, -12 (ix)
	ld	-20 (ix), a
	ld	a, -15 (ix)
	and	a, -11 (ix)
	ld	-19 (ix), a
	ld	a, -14 (ix)
	and	a, -10 (ix)
	ld	-18 (ix), a
	ld	a, -13 (ix)
	and	a, -9 (ix)
	ld	-17 (ix), a
	or	a, -18 (ix)
	or	a, -19 (ix)
	or	a, -20 (ix)
	jr	Z, 00143$
	C$print.c$1394$5_3$396	= .
	.globl	C$print.c$1394$5_3$396
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1394: Print_DrawChar('1');
	ld	a, #0x31
	call	_Print_DrawChar
	jp	00144$
00143$:
	C$print.c$1396$5_3$396	= .
	.globl	C$print.c$1396$5_3$396
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1396: Print_DrawChar('0');
	ld	a, #0x30
	call	_Print_DrawChar
00144$:
	C$print.c$1397$5_3$396	= .
	.globl	C$print.c$1397$5_3$396
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1397: bit >>= 1;
	srl	-9 (ix)
	rr	-10 (ix)
	rr	-11 (ix)
	rr	-12 (ix)
	jp	00145$
00157$:
	C$print.c$1401$3_2$380	= .
	.globl	C$print.c$1401$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1401: else if(*ptr == 'c')
	ld	a, -2 (ix)
	sub	a, #0x63
	jr	NZ, 00154$
	C$print.c$1403$4_2$397	= .
	.globl	C$print.c$1403$4_2$397
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1403: c8 val = (c8)va_arg(args, u16);
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	-8 (ix), l
	ld	-7 (ix), h
	dec	hl
	dec	hl
	C$print.c$1404$4_2$397	= .
	.globl	C$print.c$1404$4_2$397
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1404: Print_DrawChar(val);
	ld	a, (hl)
	call	_Print_DrawChar
	jp	00193$
00154$:
	C$print.c$1406$3_2$380	= .
	.globl	C$print.c$1406$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1406: else if(*ptr == 's')
	ld	a, -2 (ix)
	sub	a, #0x73
	jr	NZ, 00151$
	C$print.c$1408$4_2$398	= .
	.globl	C$print.c$1408$4_2$398
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1408: const c8* val = (const c8*)va_arg(args, const c8*);
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	-8 (ix), l
	ld	-7 (ix), h
	dec	hl
	dec	hl
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	C$print.c$1409$4_2$398	= .
	.globl	C$print.c$1409$4_2$398
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1409: Print_DrawText(val);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	_Print_DrawText
	jp	00193$
00151$:
	C$print.c$1411$3_2$380	= .
	.globl	C$print.c$1411$3_2$380
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1411: else if(*ptr == '%')
	ld	a, -2 (ix)
	sub	a, #0x25
	jr	NZ, 00193$
	C$print.c$1413$4_2$399	= .
	.globl	C$print.c$1413$4_2$399
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1413: Print_DrawChar('%');
	ld	a, #0x25
	call	_Print_DrawChar
	jp	00193$
00192$:
	C$print.c$1417$2_1$378	= .
	.globl	C$print.c$1417$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1417: else if(*ptr == '\t')
	ld	a, -1 (ix)
	sub	a, #0x09
	jr	NZ, 00189$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:423: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX) + g_PrintData.TabSize - 1;
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	ld	hl, #(_g_PrintData + 4)
	ld	e, (hl)
	add	a, e
	ld	e, a
	ld	(bc), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:424: g_PrintData.CursorX &= ~(g_PrintData.TabSize - 1);
	ld	a, (#(_g_PrintData + 4) + 0)
	dec	a
	cpl
	and	a, e
	ld	(bc), a
	C$print.c$1418$2_1$378	= .
	.globl	C$print.c$1418$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1418: Print_Tab();
	jp	00193$
00189$:
	C$print.c$1419$2_1$378	= .
	.globl	C$print.c$1419$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1419: else if(*ptr == '\n')
	ld	a, -1 (ix)
	sub	a, #0x0a
	jr	NZ, 00186$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:431: g_PrintData.CursorX = 0;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:432: g_PrintData.CursorY += PRINT_H(g_PrintData.UnitY);
	ld	bc, #_g_PrintData + 6
	ld	a, (bc)
	inc	a
	ld	(bc), a
	C$print.c$1420$2_1$378	= .
	.globl	C$print.c$1420$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1420: Print_Return();
	jp	00193$
00186$:
	C$print.c$1421$2_1$378	= .
	.globl	C$print.c$1421$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1421: else if(*ptr == ' ')
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	NZ, 00183$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:416: g_PrintData.CursorX += PRINT_W(g_PrintData.UnitX);
	ld	bc, #_g_PrintData + 5
	ld	a, (bc)
	inc	a
	ld	(bc), a
	C$print.c$1422$2_1$378	= .
	.globl	C$print.c$1422$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1422: Print_Space();
	jp	00193$
00183$:
	C$print.c$1424$2_1$378	= .
	.globl	C$print.c$1424$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1424: Print_DrawChar(*ptr);
	ld	a, -1 (ix)
	call	_Print_DrawChar
00193$:
	C$print.c$1426$2_1$378	= .
	.globl	C$print.c$1426$2_1$378
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1426: ptr++;
	inc	-4 (ix)
	jp	NZ,00194$
	inc	-3 (ix)
	jp	00194$
	C$print.c$1429$2_1$375	= .
	.globl	C$print.c$1429$2_1$375
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1429: va_end(args);
00200$:
	C$print.c$1430$2_1$375	= .
	.globl	C$print.c$1430$2_1$375
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1430: }
	ld	sp, ix
	pop	ix
	C$print.c$1430$2_1$375	= .
	.globl	C$print.c$1430$2_1$375
	XG$Print_DrawFormat$0$0	= .
	.globl	XG$Print_DrawFormat$0$0
	ret
	G$Print_DrawLineH$0$0	= .
	.globl	G$Print_DrawLineH$0$0
	C$print.c$1440$2_1$411	= .
	.globl	C$print.c$1440$2_1$411
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1440: void Print_DrawLineH(u8 x, u8 y, u8 len)
;	---------------------------------
; Function Print_DrawLineH
; ---------------------------------
_Print_DrawLineH::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	b, a
	ld	c, l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), b
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), c
	C$print.c$1443$1_0$411	= .
	.globl	C$print.c$1443$1_0$411
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1443: Print_DrawCharX(0x17, len);
	ld	l, 4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x17
	call	_Print_DrawCharX
	C$print.c$1444$1_0$411	= .
	.globl	C$print.c$1444$1_0$411
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1444: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$Print_DrawLineV$0$0	= .
	.globl	G$Print_DrawLineV$0$0
	C$print.c$1448$1_0$417	= .
	.globl	C$print.c$1448$1_0$417
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1448: void Print_DrawLineV(u8 x, u8 y, u8 len)
;	---------------------------------
; Function Print_DrawLineV
; ---------------------------------
_Print_DrawLineV::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
	ld	-1 (ix), l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1450: for(u8 i = 0; i < len; i++)
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, 4 (ix)
	jr	NC, 00106$
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1452: Print_SetPosition(x, y + i);
	ld	a, -1 (ix)
	add	a, b
	ld	e, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), c
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), e
	C$print.c$1453$3_0$418	= .
	.globl	C$print.c$1453$3_0$418
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1453: Print_DrawChar(0x16);
	push	bc
	ld	a, #0x16
	call	_Print_DrawChar
	pop	bc
	C$print.c$1450$2_0$417	= .
	.globl	C$print.c$1450$2_0$417
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1450: for(u8 i = 0; i < len; i++)
	inc	b
	jp	00104$
00106$:
	C$print.c$1455$2_0$417	= .
	.globl	C$print.c$1455$2_0$417
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1455: }
	inc	sp
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$Print_DrawBox$0$0	= .
	.globl	G$Print_DrawBox$0$0
	C$print.c$1459$2_0$423	= .
	.globl	C$print.c$1459$2_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1459: void Print_DrawBox(u8 x, u8 y, u8 width, u8 height)
;	---------------------------------
; Function Print_DrawBox
; ---------------------------------
_Print_DrawBox::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	d, a
	ld	e, l
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), e
	C$print.c$1463$1_0$423	= .
	.globl	C$print.c$1463$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1463: Print_DrawChar(0x18);
	push	de
	ld	a, #0x18
	call	_Print_DrawChar
	pop	de
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1464: Print_SetPosition(x + width - 1, y);
	ld	a, d
	add	a, 4 (ix)
	dec	a
	ld	c, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	(#(_g_PrintData + 5)),a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), e
	C$print.c$1465$1_0$423	= .
	.globl	C$print.c$1465$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1465: Print_DrawChar(0x19);
	push	bc
	push	de
	ld	a, #0x19
	call	_Print_DrawChar
	pop	de
	pop	bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1466: Print_SetPosition(x, y + height - 1);
	ld	a, e
	add	a, 5 (ix)
	dec	a
	ld	b, a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), d
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	(#(_g_PrintData + 6)),a
	C$print.c$1467$1_0$423	= .
	.globl	C$print.c$1467$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1467: Print_DrawChar(0x1A);
	push	bc
	push	de
	ld	a, #0x1a
	call	_Print_DrawChar
	pop	de
	pop	bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), c
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), b
	C$print.c$1469$1_0$423	= .
	.globl	C$print.c$1469$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1469: Print_DrawChar(0x1B);
	push	bc
	push	de
	ld	a, #0x1b
	call	_Print_DrawChar
	pop	de
	pop	bc
	C$print.c$1472$1_0$423	= .
	.globl	C$print.c$1472$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1472: Print_DrawLineH(x + 1, y,              width - 2);
	ld	a, 4 (ix)
	add	a, #0xfe
	ld	-1 (ix), a
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	h
	push	hl
	push	bc
	push	de
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_Print_DrawLineH
	pop	de
	pop	bc
	pop	hl
	C$print.c$1473$1_0$423	= .
	.globl	C$print.c$1473$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1473: Print_DrawLineH(x + 1, y + height - 1, width - 2);
	push	bc
	push	de
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_Print_DrawLineH
	pop	de
	pop	bc
	C$print.c$1476$1_0$423	= .
	.globl	C$print.c$1476$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1476: Print_DrawLineV(x,             y + 1, height - 2);
	ld	b, 5 (ix)
	dec	b
	dec	b
	inc	e
	push	bc
	push	de
	push	bc
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_Print_DrawLineV
	pop	de
	pop	bc
	C$print.c$1477$1_0$423	= .
	.globl	C$print.c$1477$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1477: Print_DrawLineV(x + width - 1, y + 1, height - 2);
	push	bc
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_Print_DrawLineV
	C$print.c$1478$1_0$423	= .
	.globl	C$print.c$1478$1_0$423
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/print.c:1478: }
	inc	sp
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
Fprint$__xinit_g_PrintInvalid$0_0$0 == .
__xinit__g_PrintInvalid:
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.area _CABS (ABS)
