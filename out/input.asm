;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module input
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.globl _Joystick_Read
	.globl _Keyboard_Read
	.globl _Keyboard_IsKeyPressed
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
	G$Joystick_Read$0$0	= .
	.globl	G$Joystick_Read$0$0
	C$input.c$40$0_0$33	= .
	.globl	C$input.c$40$0_0$33
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:40: u8 Joystick_Read(u8 port) __FASTCALL __PRESERVES(b, c, d, e, h, iyl, iyh)
;	---------------------------------
; Function Joystick_Read
; ---------------------------------
_Joystick_Read::
	C$input.c$57$1_0$33	= .
	.globl	C$input.c$57$1_0$33
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:57: __endasm;
	ld	a, #15
	di
	out	(0xA0), a
	in	a, (0xA2)
	res	6, a
	or	a, l
	out	(0xA1), a
	ld	a, #14
	out	(0xA0), a
	ei
	in	a, (0xA2)
	ld	l, a
	C$input.c$58$1_0$33	= .
	.globl	C$input.c$58$1_0$33
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:58: }
	C$input.c$58$1_0$33	= .
	.globl	C$input.c$58$1_0$33
	XG$Joystick_Read$0$0	= .
	.globl	XG$Joystick_Read$0$0
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
	G$Keyboard_Read$0$0	= .
	.globl	G$Keyboard_Read$0$0
	C$input.c$239$1_0$35	= .
	.globl	C$input.c$239$1_0$35
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:239: u8 Keyboard_Read(u8 row) __FASTCALL __PRESERVES(b, c, d, e, h, iyl, iyh)
;	---------------------------------
; Function Keyboard_Read
; ---------------------------------
_Keyboard_Read::
	C$input.c$249$1_0$35	= .
	.globl	C$input.c$249$1_0$35
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:249: __endasm;
	in	a, (0xAA)
	and	#0xF0
	or	l
	out	(0xAA), a
	in	a, (0xA9)
	ld	l, a
	C$input.c$250$1_0$35	= .
	.globl	C$input.c$250$1_0$35
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:250: }
	C$input.c$250$1_0$35	= .
	.globl	C$input.c$250$1_0$35
	XG$Keyboard_Read$0$0	= .
	.globl	XG$Keyboard_Read$0$0
	ret
	G$Keyboard_IsKeyPressed$0$0	= .
	.globl	G$Keyboard_IsKeyPressed$0$0
	C$input.c$291$1_0$37	= .
	.globl	C$input.c$291$1_0$37
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:291: u8 Keyboard_IsKeyPressed(u8 key)
;	---------------------------------
; Function Keyboard_IsKeyPressed
; ---------------------------------
_Keyboard_IsKeyPressed::
	C$input.c$293$1_0$37	= .
	.globl	C$input.c$293$1_0$37
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:293: return (Keyboard_Read(KEY_ROW(key)) & (1 << KEY_IDX(key))) == 0;
	ld	e, a
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	c, l
	srl	e
	srl	e
	srl	e
	srl	e
	ld	hl, #0x0001
	inc	e
	jp	00104$
00103$:
	add	hl, hl
00104$:
	dec	e
	jr	NZ,00103$
	ld	b, #0x00
	ld	a, l
	and	a, c
	ld	c, a
	ld	a, h
	and	a, b
	ld	b, a
	ld	a, c
	or	a, a
	or	a, b
	ld	a, #0x01
	ret	Z
	xor	a, a
	C$input.c$294$1_0$37	= .
	.globl	C$input.c$294$1_0$37
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/input.c:294: }
	C$input.c$294$1_0$37	= .
	.globl	C$input.c$294$1_0$37
	XG$Keyboard_IsKeyPressed$0$0	= .
	.globl	XG$Keyboard_IsKeyPressed$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
