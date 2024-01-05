;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module bios
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Sys_GetPageSlot
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
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
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
	.globl _Bios_Exit
	.globl _Bios_SetHookCallback
	.globl _Bios_InterSlotRead
	.globl _Bios_InterSlotWrite
	.globl _Bios_InterSlotCall
	.globl _Bios_SwitchSlot
	.globl _Bios_WriteVDP
	.globl _Bios_WriteVRAM
	.globl _Bios_FillVRAM
	.globl _Bios_TransfertVRAMtoRAM
	.globl _Bios_TransfertRAMtoVRAM
	.globl _Bios_ChangeColor
	.globl _Bios_InitScreen0Ex
	.globl _Bios_InitScreen1Ex
	.globl _Bios_InitScreen2Ex
	.globl _Bios_InitScreen3Ex
	.globl _Bios_GetPatternTableAddress
	.globl _Bios_GetAttributeTableAddress
	.globl _Bios_GraphPrintCharEx
	.globl _Bios_WritePSG
	.globl _Bios_ClearScreen
	.globl _Bios_SetCursorPosition
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
	G$Bios_Exit$0$0	= .
	.globl	G$Bios_Exit$0$0
	C$bios.c$27$0_0$226	= .
	.globl	C$bios.c$27$0_0$226
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:27: void Bios_Exit(u8 ret)
;	---------------------------------
; Function Bios_Exit
; ---------------------------------
_Bios_Exit::
	C$bios.c$73$1_0$226	= .
	.globl	C$bios.c$73$1_0$226
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:73: __endasm;
	call	0x0000
	C$bios.c$76$1_0$226	= .
	.globl	C$bios.c$76$1_0$226
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:76: }
	C$bios.c$76$1_0$226	= .
	.globl	C$bios.c$76$1_0$226
	XG$Bios_Exit$0$0	= .
	.globl	XG$Bios_Exit$0$0
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
G$g_SUBRID$0_0$0 == 0x0000
_g_SUBRID	=	0x0000
G$g_STRSRC$0_0$0 == 0x0002
_g_STRSRC	=	0x0002
G$g_KANJTABLE$0_0$0 == 0xf30f
_g_KANJTABLE	=	0xf30f
G$g_DISKVE$0_0$0 == 0xf323
_g_DISKVE	=	0xf323
G$g_BREAKV$0_0$0 == 0xf325
_g_BREAKV	=	0xf325
G$g_RAMAD0$0_0$0 == 0xf341
_g_RAMAD0	=	0xf341
G$g_RAMAD1$0_0$0 == 0xf342
_g_RAMAD1	=	0xf342
G$g_RAMAD2$0_0$0 == 0xf343
_g_RAMAD2	=	0xf343
G$g_RAMAD3$0_0$0 == 0xf344
_g_RAMAD3	=	0xf344
G$g_MASTER$0_0$0 == 0xf348
_g_MASTER	=	0xf348
G$g_BDOS$0_0$0 == 0xf37d
_g_BDOS	=	0xf37d
Fbios$__str_0$0_0$0 == .
___str_0:
	.db 0x0a
	.db 0x0d
	.ascii "$"
	.db 0x00
	G$Bios_SetHookCallback$0$0	= .
	.globl	G$Bios_SetHookCallback$0$0
	C$bios.c$81$1_0$228	= .
	.globl	C$bios.c$81$1_0$228
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:81: void Bios_SetHookCallback(u16 hook, callback cb)
;	---------------------------------
; Function Bios_SetHookCallback
; ---------------------------------
_Bios_SetHookCallback::
	ld	c, l
	ld	b, h
	C$bios.c$83$1_0$228	= .
	.globl	C$bios.c$83$1_0$228
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:83: u8 slot = Sys_GetPageSlot((u16)cb >> 14);
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	rlca
	rlca
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_Sys_GetPageSlot
	pop	de
	pop	bc
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:84: Bios_SetHookInterSlotCallback(hook, slot, cb);
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios_hook.h:50: *((u8*)hook) = 0xF7; // RST #30
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0xf7
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios_hook.h:51: *((u8*)++hook) = slot; // Slot ID
	inc	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios_hook.h:52: *((callback*)++hook) = cb; // Callback address
	inc	bc
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	C$bios.c$84$3_0$228	= .
	.globl	C$bios.c$84$3_0$228
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:84: Bios_SetHookInterSlotCallback(hook, slot, cb);
	C$bios.c$85$3_0$228	= .
	.globl	C$bios.c$85$3_0$228
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:85: }
	C$bios.c$85$3_0$228	= .
	.globl	C$bios.c$85$3_0$228
	XG$Bios_SetHookCallback$0$0	= .
	.globl	XG$Bios_SetHookCallback$0$0
	ret
	G$Bios_InterSlotRead$0$0	= .
	.globl	G$Bios_InterSlotRead$0$0
	C$bios.c$134$3_0$233	= .
	.globl	C$bios.c$134$3_0$233
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:134: u8 Bios_InterSlotRead(u8 slot, u16 addr)
;	---------------------------------
; Function Bios_InterSlotRead
; ---------------------------------
_Bios_InterSlotRead::
	C$bios.c$143$1_0$233	= .
	.globl	C$bios.c$143$1_0$233
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:143: __endasm;
	ld	l, e
	ld	h, d
	call	0x000C
	C$bios.c$144$1_0$233	= .
	.globl	C$bios.c$144$1_0$233
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:144: }
	C$bios.c$144$1_0$233	= .
	.globl	C$bios.c$144$1_0$233
	XG$Bios_InterSlotRead$0$0	= .
	.globl	XG$Bios_InterSlotRead$0$0
	ret
	G$Bios_InterSlotWrite$0$0	= .
	.globl	G$Bios_InterSlotWrite$0$0
	C$bios.c$172$1_0$235	= .
	.globl	C$bios.c$172$1_0$235
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:172: void Bios_InterSlotWrite(u8 slot, u16 addr, u8 value)
;	---------------------------------
; Function Bios_InterSlotWrite
; ---------------------------------
_Bios_InterSlotWrite::
	C$bios.c$188$1_0$235	= .
	.globl	C$bios.c$188$1_0$235
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:188: __endasm;
	push	iy
	ld	iy, #4
	add	iy, sp
	ld	l, e
	ld	h, d
	ld	e, 0(iy)
	call	0x0014
	pop	iy
	C$bios.c$189$1_0$235	= .
	.globl	C$bios.c$189$1_0$235
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:189: }
	pop	hl
	inc	sp
	jp	(hl)
	G$Bios_InterSlotCall$0$0	= .
	.globl	G$Bios_InterSlotCall$0$0
	C$bios.c$208$1_0$237	= .
	.globl	C$bios.c$208$1_0$237
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:208: void Bios_InterSlotCall(u8 slot, u16 addr)
;	---------------------------------
; Function Bios_InterSlotCall
; ---------------------------------
_Bios_InterSlotCall::
	C$bios.c$227$1_0$237	= .
	.globl	C$bios.c$227$1_0$237
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:227: __endasm;
	push	ix
	ld	l, #0
	ld	h, a
	push	hl
	pop	iy
	push	de
	pop	ix
	call	0x001C
	ei
	pop	ix
	C$bios.c$228$1_0$237	= .
	.globl	C$bios.c$228$1_0$237
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:228: }
	C$bios.c$228$1_0$237	= .
	.globl	C$bios.c$228$1_0$237
	XG$Bios_InterSlotCall$0$0	= .
	.globl	XG$Bios_InterSlotCall$0$0
	ret
	G$Bios_SwitchSlot$0$0	= .
	.globl	G$Bios_SwitchSlot$0$0
	C$bios.c$248$1_0$239	= .
	.globl	C$bios.c$248$1_0$239
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:248: void Bios_SwitchSlot(u8 page, u8 slot)
;	---------------------------------
; Function Bios_SwitchSlot
; ---------------------------------
_Bios_SwitchSlot::
	C$bios.c$260$1_0$239	= .
	.globl	C$bios.c$260$1_0$239
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:260: __endasm;
	rrca	
	rrca 
	and a, #0xC0
	ld	b, h
	ld	h, a
	ld	a, b
	call	0x0024
	C$bios.c$261$1_0$239	= .
	.globl	C$bios.c$261$1_0$239
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:261: }
	C$bios.c$261$1_0$239	= .
	.globl	C$bios.c$261$1_0$239
	XG$Bios_SwitchSlot$0$0	= .
	.globl	XG$Bios_SwitchSlot$0$0
	ret
	G$Bios_WriteVDP$0$0	= .
	.globl	G$Bios_WriteVDP$0$0
	C$bios.c$341$1_0$241	= .
	.globl	C$bios.c$341$1_0$241
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:341: void Bios_WriteVDP(u8 reg, u8 value)
;	---------------------------------
; Function Bios_WriteVDP
; ---------------------------------
_Bios_WriteVDP::
	C$bios.c$350$1_0$241	= .
	.globl	C$bios.c$350$1_0$241
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:350: __endasm;
	ld	c, a
	ld	b, l
	call	0x0047
	C$bios.c$351$1_0$241	= .
	.globl	C$bios.c$351$1_0$241
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:351: }
	C$bios.c$351$1_0$241	= .
	.globl	C$bios.c$351$1_0$241
	XG$Bios_WriteVDP$0$0	= .
	.globl	XG$Bios_WriteVDP$0$0
	ret
	G$Bios_WriteVRAM$0$0	= .
	.globl	G$Bios_WriteVRAM$0$0
	C$bios.c$372$1_0$243	= .
	.globl	C$bios.c$372$1_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:372: void Bios_WriteVRAM(u16 addr, u8 value)
;	---------------------------------
; Function Bios_WriteVRAM
; ---------------------------------
_Bios_WriteVRAM::
	C$bios.c$383$1_0$243	= .
	.globl	C$bios.c$383$1_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:383: __endasm;
	ld	iy, #4
	add	iy, sp
	ld	a, 0(iy)
	call	0x004D
	C$bios.c$384$1_0$243	= .
	.globl	C$bios.c$384$1_0$243
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:384: }
	pop	hl
	inc	sp
	jp	(hl)
	G$Bios_FillVRAM$0$0	= .
	.globl	G$Bios_FillVRAM$0$0
	C$bios.c$416$1_0$245	= .
	.globl	C$bios.c$416$1_0$245
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:416: void Bios_FillVRAM(u16 addr, u16 length, u8 value)
;	---------------------------------
; Function Bios_FillVRAM
; ---------------------------------
_Bios_FillVRAM::
	C$bios.c$430$1_0$245	= .
	.globl	C$bios.c$430$1_0$245
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:430: __endasm;
	ld	iy, #4
	add	iy, sp
	ld	c, e
	ld	b, d
	ld	a, 0(iy)
	call	0x0056
	C$bios.c$431$1_0$245	= .
	.globl	C$bios.c$431$1_0$245
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:431: }
	pop	hl
	inc	sp
	jp	(hl)
	G$Bios_TransfertVRAMtoRAM$0$0	= .
	.globl	G$Bios_TransfertVRAMtoRAM$0$0
	C$bios.c$442$1_0$247	= .
	.globl	C$bios.c$442$1_0$247
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:442: void Bios_TransfertVRAMtoRAM(u16 vram, u16 ram, u16 length)
;	---------------------------------
; Function Bios_TransfertVRAMtoRAM
; ---------------------------------
_Bios_TransfertVRAMtoRAM::
	C$bios.c$455$1_0$247	= .
	.globl	C$bios.c$455$1_0$247
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:455: __endasm;
	ld	iy, #4
	add	iy, sp
	ld	c, 0(iy)
	ld	b, 1(iy)
	call	0x0059
	C$bios.c$456$1_0$247	= .
	.globl	C$bios.c$456$1_0$247
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:456: }
	pop	hl
	pop	af
	jp	(hl)
	G$Bios_TransfertRAMtoVRAM$0$0	= .
	.globl	G$Bios_TransfertRAMtoVRAM$0$0
	C$bios.c$467$1_0$249	= .
	.globl	C$bios.c$467$1_0$249
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:467: void Bios_TransfertRAMtoVRAM(u16 ram, u16 vram, u16 length)
;	---------------------------------
; Function Bios_TransfertRAMtoVRAM
; ---------------------------------
_Bios_TransfertRAMtoVRAM::
	C$bios.c$480$1_0$249	= .
	.globl	C$bios.c$480$1_0$249
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:480: __endasm;
	ld	iy, #4
	add	iy, sp
	ld	c, 0(iy)
	ld	b, 1(iy)
	call	0x005C
	C$bios.c$481$1_0$249	= .
	.globl	C$bios.c$481$1_0$249
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:481: }
	pop	hl
	pop	af
	jp	(hl)
	G$Bios_ChangeColor$0$0	= .
	.globl	G$Bios_ChangeColor$0$0
	C$bios.c$502$1_0$251	= .
	.globl	C$bios.c$502$1_0$251
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:502: void Bios_ChangeColor(u8 text, u8 back, u8 border)
;	---------------------------------
; Function Bios_ChangeColor
; ---------------------------------
_Bios_ChangeColor::
	C$bios.c$517$1_0$251	= .
	.globl	C$bios.c$517$1_0$251
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:517: __endasm;
	ld	iy, #4
	add	iy, sp
	ld	(0xF3E9), a
	ld	a, l
	ld	(0xF3EA), a
	ld	a, 0(iy)
	ld	(0xF3EB), a
	call	0x0062
	C$bios.c$518$1_0$251	= .
	.globl	C$bios.c$518$1_0$251
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:518: }
	pop	hl
	inc	sp
	jp	(hl)
	G$Bios_InitScreen0Ex$0$0	= .
	.globl	G$Bios_InitScreen0Ex$0$0
	C$bios.c$544$1_0$253	= .
	.globl	C$bios.c$544$1_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:544: void Bios_InitScreen0Ex(u16 pnt, u16 pgt, u8 width, u8 text, u8 bg, u8 border)
;	---------------------------------
; Function Bios_InitScreen0Ex
; ---------------------------------
_Bios_InitScreen0Ex::
	ld	(_g_TXTNAM), hl
	ld	(_g_TXTCGP), de
	C$bios.c$548$1_0$253	= .
	.globl	C$bios.c$548$1_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:548: g_LINL40 = width;  // Character per line
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(_g_LINL40+0), a
	C$bios.c$549$1_0$253	= .
	.globl	C$bios.c$549$1_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:549: g_FORCLR = text;   // Text color
	ld	a, 1 (iy)
	inc	iy
	ld	(_g_FORCLR+0), a
	C$bios.c$550$1_0$253	= .
	.globl	C$bios.c$550$1_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:550: g_BAKCLR = bg;     // Background color
	ld	a, 1 (iy)
	inc	iy
	ld	(_g_BAKCLR+0), a
	C$bios.c$551$1_0$253	= .
	.globl	C$bios.c$551$1_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:551: g_BDRCLR = border; // Border colour
	ld	a, 1 (iy)
	ld	(_g_BDRCLR+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/system.h:171: inline u8 Call(u16 addr) { ((void(*)(void))addr)(); }
	call	0x006c
	C$bios.c$552$3_0$253	= .
	.globl	C$bios.c$552$3_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:552: Call(R_INITXT);
	C$bios.c$553$3_0$253	= .
	.globl	C$bios.c$553$3_0$253
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:553: }
	pop	hl
	pop	af
	pop	af
	jp	(hl)
	G$Bios_InitScreen1Ex$0$0	= .
	.globl	G$Bios_InitScreen1Ex$0$0
	C$bios.c$569$3_0$258	= .
	.globl	C$bios.c$569$3_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:569: void Bios_InitScreen1Ex(u16 pnt, u16 ct, u16 pgt, u16 sat, u16 sgt, u8 text, u8 bg, u8 border)
;	---------------------------------
; Function Bios_InitScreen1Ex
; ---------------------------------
_Bios_InitScreen1Ex::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	(_g_T32NAM), hl
	ld	(_g_T32COL), de
	C$bios.c$573$1_0$258	= .
	.globl	C$bios.c$573$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:573: g_T32CGP = pgt;    // Address of pattern generator table
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_g_T32CGP), hl
	C$bios.c$574$1_0$258	= .
	.globl	C$bios.c$574$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:574: g_T32ATR = sat;    // Address of sprite attribute table
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	(_g_T32ATR), hl
	C$bios.c$575$1_0$258	= .
	.globl	C$bios.c$575$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:575: g_T32PAT = sgt;    // Address of sprite generator table
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	(_g_T32PAT), hl
	C$bios.c$576$1_0$258	= .
	.globl	C$bios.c$576$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:576: g_FORCLR = text;   // Text color
	ld	a, 10 (ix)
	ld	(_g_FORCLR+0), a
	C$bios.c$577$1_0$258	= .
	.globl	C$bios.c$577$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:577: g_BAKCLR = bg;     // Background color
	ld	a, 11 (ix)
	ld	(_g_BAKCLR+0), a
	C$bios.c$578$1_0$258	= .
	.globl	C$bios.c$578$1_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:578: g_BDRCLR = border; // Border color
	ld	a, 12 (ix)
	ld	(_g_BDRCLR+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/system.h:171: inline u8 Call(u16 addr) { ((void(*)(void))addr)(); }
	call	0x006f
	C$bios.c$579$3_0$258	= .
	.globl	C$bios.c$579$3_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:579: Call(R_INIT32);
	C$bios.c$580$3_0$258	= .
	.globl	C$bios.c$580$3_0$258
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:580: }
	pop	ix
	pop	hl
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	jp	(hl)
	G$Bios_InitScreen2Ex$0$0	= .
	.globl	G$Bios_InitScreen2Ex$0$0
	C$bios.c$596$3_0$263	= .
	.globl	C$bios.c$596$3_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:596: void Bios_InitScreen2Ex(u16 pnt, u16 ct, u16 pgt, u16 sat, u16 sgt, u8 text, u8 bg, u8 border)
;	---------------------------------
; Function Bios_InitScreen2Ex
; ---------------------------------
_Bios_InitScreen2Ex::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	(_g_GRPNAM), hl
	ld	(_g_GRPCOL), de
	C$bios.c$600$1_0$263	= .
	.globl	C$bios.c$600$1_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:600: g_GRPCGP = pgt;    // Address of pattern generator table
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_g_GRPCGP), hl
	C$bios.c$601$1_0$263	= .
	.globl	C$bios.c$601$1_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:601: g_GRPATR = sat;    // Address of sprite attribute table
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	(_g_GRPATR), hl
	C$bios.c$602$1_0$263	= .
	.globl	C$bios.c$602$1_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:602: g_GRPPAT = sgt;    // Address of sprite generator table
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	(_g_GRPPAT), hl
	C$bios.c$603$1_0$263	= .
	.globl	C$bios.c$603$1_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:603: g_FORCLR = text;   // Text color
	ld	a, 10 (ix)
	ld	(_g_FORCLR+0), a
	C$bios.c$604$1_0$263	= .
	.globl	C$bios.c$604$1_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:604: g_BAKCLR = bg;     // Background color
	ld	a, 11 (ix)
	ld	(_g_BAKCLR+0), a
	C$bios.c$605$1_0$263	= .
	.globl	C$bios.c$605$1_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:605: g_BDRCLR = border; // Border color
	ld	a, 12 (ix)
	ld	(_g_BDRCLR+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/system.h:171: inline u8 Call(u16 addr) { ((void(*)(void))addr)(); }
	call	0x0072
	C$bios.c$606$3_0$263	= .
	.globl	C$bios.c$606$3_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:606: Call(R_INIGRP);
	C$bios.c$607$3_0$263	= .
	.globl	C$bios.c$607$3_0$263
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:607: }
	pop	ix
	pop	hl
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	jp	(hl)
	G$Bios_InitScreen3Ex$0$0	= .
	.globl	G$Bios_InitScreen3Ex$0$0
	C$bios.c$623$3_0$268	= .
	.globl	C$bios.c$623$3_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:623: void Bios_InitScreen3Ex(u16 pnt, u16 ct, u16 pgt, u16 sat, u16 sgt, u8 text, u8 bg, u8 border)
;	---------------------------------
; Function Bios_InitScreen3Ex
; ---------------------------------
_Bios_InitScreen3Ex::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	(_g_MLTNAM), hl
	ld	(_g_MLTCOL), de
	C$bios.c$627$1_0$268	= .
	.globl	C$bios.c$627$1_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:627: g_MLTCGP = pgt;    // Address of pattern generator table
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	ld	(_g_MLTCGP), hl
	C$bios.c$628$1_0$268	= .
	.globl	C$bios.c$628$1_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:628: g_MLTATR = sat;    // Address of sprite attribute table
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	ld	(_g_MLTATR), hl
	C$bios.c$629$1_0$268	= .
	.globl	C$bios.c$629$1_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:629: g_MLTPAT = sgt;    // Address of sprite generator table
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	ld	(_g_MLTPAT), hl
	C$bios.c$630$1_0$268	= .
	.globl	C$bios.c$630$1_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:630: g_FORCLR = text;   // Text color
	ld	a, 10 (ix)
	ld	(_g_FORCLR+0), a
	C$bios.c$631$1_0$268	= .
	.globl	C$bios.c$631$1_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:631: g_BAKCLR = bg;     // Background color
	ld	a, 11 (ix)
	ld	(_g_BAKCLR+0), a
	C$bios.c$632$1_0$268	= .
	.globl	C$bios.c$632$1_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:632: g_BDRCLR = border; // Border color
	ld	a, 12 (ix)
	ld	(_g_BDRCLR+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/system.h:171: inline u8 Call(u16 addr) { ((void(*)(void))addr)(); }
	call	0x0075
	C$bios.c$633$3_0$268	= .
	.globl	C$bios.c$633$3_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:633: Call(R_INIMLT);
	C$bios.c$634$3_0$268	= .
	.globl	C$bios.c$634$3_0$268
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:634: }
	pop	ix
	pop	hl
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	jp	(hl)
	G$Bios_GetPatternTableAddress$0$0	= .
	.globl	G$Bios_GetPatternTableAddress$0$0
	C$bios.c$675$3_0$273	= .
	.globl	C$bios.c$675$3_0$273
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:675: u16 Bios_GetPatternTableAddress(u8 id) __FASTCALL
;	---------------------------------
; Function Bios_GetPatternTableAddress
; ---------------------------------
_Bios_GetPatternTableAddress::
	C$bios.c$682$1_0$273	= .
	.globl	C$bios.c$682$1_0$273
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:682: __endasm;
	ld	a, l
	call	0x0084
	C$bios.c$683$1_0$273	= .
	.globl	C$bios.c$683$1_0$273
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:683: }
	C$bios.c$683$1_0$273	= .
	.globl	C$bios.c$683$1_0$273
	XG$Bios_GetPatternTableAddress$0$0	= .
	.globl	XG$Bios_GetPatternTableAddress$0$0
	ret
	G$Bios_GetAttributeTableAddress$0$0	= .
	.globl	G$Bios_GetAttributeTableAddress$0$0
	C$bios.c$692$1_0$275	= .
	.globl	C$bios.c$692$1_0$275
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:692: u16 Bios_GetAttributeTableAddress(u8 id) __FASTCALL
;	---------------------------------
; Function Bios_GetAttributeTableAddress
; ---------------------------------
_Bios_GetAttributeTableAddress::
	C$bios.c$699$1_0$275	= .
	.globl	C$bios.c$699$1_0$275
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:699: __endasm;
	ld	a, l
	call	0x0087
	C$bios.c$700$1_0$275	= .
	.globl	C$bios.c$700$1_0$275
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:700: }
	C$bios.c$700$1_0$275	= .
	.globl	C$bios.c$700$1_0$275
	XG$Bios_GetAttributeTableAddress$0$0	= .
	.globl	XG$Bios_GetAttributeTableAddress$0$0
	ret
	G$Bios_GraphPrintCharEx$0$0	= .
	.globl	G$Bios_GraphPrintCharEx$0$0
	C$bios.c$724$1_0$277	= .
	.globl	C$bios.c$724$1_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:724: void Bios_GraphPrintCharEx(u8 chr, u16 x, u8 y, u8 color, u8 op)
;	---------------------------------
; Function Bios_GraphPrintCharEx
; ---------------------------------
_Bios_GraphPrintCharEx::
	ld	c, a
	C$bios.c$726$1_0$277	= .
	.globl	C$bios.c$726$1_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:726: g_GRPACX = x;
	ld	hl, #_g_GRPACX
	ld	(hl), e
	C$bios.c$727$1_0$277	= .
	.globl	C$bios.c$727$1_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:727: g_GRPACY = y;
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(_g_GRPACY+0), a
	C$bios.c$728$1_0$277	= .
	.globl	C$bios.c$728$1_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:728: g_ATRBYT = color;
	ld	a, 1 (iy)
	inc	iy
	ld	(_g_ATRBYT+0), a
	C$bios.c$729$1_0$277	= .
	.globl	C$bios.c$729$1_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:729: g_LOGOPR = op;
	ld	a, 1 (iy)
	ld	(_g_LOGOPR+0), a
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.h:271: inline void Bios_GraphPrintChar(u8 chr) { ((void(*)(u8))R_GRPPRT)(chr); }
	ld	a, c
	call	0x008d
	C$bios.c$730$3_0$277	= .
	.globl	C$bios.c$730$3_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:730: Bios_GraphPrintChar(chr);
	C$bios.c$731$3_0$277	= .
	.globl	C$bios.c$731$3_0$277
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:731: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
	G$Bios_WritePSG$0$0	= .
	.globl	G$Bios_WritePSG$0$0
	C$bios.c$759$3_0$282	= .
	.globl	C$bios.c$759$3_0$282
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:759: void Bios_WritePSG(u8 reg, u8 value)
;	---------------------------------
; Function Bios_WritePSG
; ---------------------------------
_Bios_WritePSG::
	C$bios.c$767$1_0$282	= .
	.globl	C$bios.c$767$1_0$282
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:767: __endasm;	
	ld	e, l
	call	0x0093
	C$bios.c$768$1_0$282	= .
	.globl	C$bios.c$768$1_0$282
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:768: }
	C$bios.c$768$1_0$282	= .
	.globl	C$bios.c$768$1_0$282
	XG$Bios_WritePSG$0$0	= .
	.globl	XG$Bios_WritePSG$0$0
	ret
	G$Bios_ClearScreen$0$0	= .
	.globl	G$Bios_ClearScreen$0$0
	C$bios.c$903$1_0$283	= .
	.globl	C$bios.c$903$1_0$283
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:903: void Bios_ClearScreen()
;	---------------------------------
; Function Bios_ClearScreen
; ---------------------------------
_Bios_ClearScreen::
	C$bios.c$908$1_0$283	= .
	.globl	C$bios.c$908$1_0$283
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:908: __endasm;
	xor	a, a
	call	0x00C3
	C$bios.c$909$1_0$283	= .
	.globl	C$bios.c$909$1_0$283
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:909: }
	C$bios.c$909$1_0$283	= .
	.globl	C$bios.c$909$1_0$283
	XG$Bios_ClearScreen$0$0	= .
	.globl	XG$Bios_ClearScreen$0$0
	ret
	G$Bios_SetCursorPosition$0$0	= .
	.globl	G$Bios_SetCursorPosition$0$0
	C$bios.c$918$1_0$285	= .
	.globl	C$bios.c$918$1_0$285
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:918: void Bios_SetCursorPosition(u8 X, u8 Y)
;	---------------------------------
; Function Bios_SetCursorPosition
; ---------------------------------
_Bios_SetCursorPosition::
	C$bios.c$926$1_0$285	= .
	.globl	C$bios.c$926$1_0$285
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:926: __endasm;	
	ld	h, a
	call	0x00C6
	C$bios.c$927$1_0$285	= .
	.globl	C$bios.c$927$1_0$285
;C:\Users\nicol\msxgl-workspace\the-castel\MSXgl\engine/src/bios.c:927: }
	C$bios.c$927$1_0$285	= .
	.globl	C$bios.c$927$1_0$285
	XG$Bios_SetCursorPosition$0$0	= .
	.globl	XG$Bios_SetCursorPosition$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
