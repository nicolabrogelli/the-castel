;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module music
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_DataMusic
	.globl _ayFX_Update
	.globl _ayFX_Mute
	.globl _ayFX_PlayBank
	.globl _ayFX_InitBank
	.globl _PT3_UpdatePSG
	.globl _PT3_SetLoop
	.globl _PT3_Resume
	.globl _PT3_Pause
	.globl _PT3_InitSong
	.globl _PT3_Init
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
	.globl _g_ayfx_bank
	.globl _PT3_NT2
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
	.globl _PlayBankSFX
	.globl _ChannelSFX
	.globl _inizializePT3
	.globl _inizializeAYFX
	.globl _pausePT3Music
	.globl _restorePT3Music
	.globl _stopMusicPlayback
	.globl _setChannel
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
	G$PlayBankSFX$0$0	= .
	.globl	G$PlayBankSFX$0$0
	C$music.c$16$0_0$515	= .
	.globl	C$music.c$16$0_0$515
;./music.c:16: void PlayBankSFX(u8 id, u8 prio)
;	---------------------------------
; Function PlayBankSFX
; ---------------------------------
_PlayBankSFX::
	C$music.c$18$1_0$515	= .
	.globl	C$music.c$18$1_0$515
;./music.c:18: ayFX_PlayBank(id, prio); // Riproduzione di un suono ayFX
	ld	c, a
	C$music.c$19$1_0$515	= .
	.globl	C$music.c$19$1_0$515
;./music.c:19: }
	C$music.c$19$1_0$515	= .
	.globl	C$music.c$19$1_0$515
	XG$PlayBankSFX$0$0	= .
	.globl	XG$PlayBankSFX$0$0
	jp	_ayFX_PlayBank
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
G$PT3_NT2$0_0$0 == .
_PT3_NT2:
	.dw #0x0d10
	.dw #0x0c55
	.dw #0x0ba4
	.dw #0x0afc
	.dw #0x0a5f
	.dw #0x09ca
	.dw #0x093d
	.dw #0x08b8
	.dw #0x083b
	.dw #0x07c5
	.dw #0x0755
	.dw #0x06ec
	.dw #0x0688
	.dw #0x062a
	.dw #0x05d2
	.dw #0x057e
	.dw #0x052f
	.dw #0x04e5
	.dw #0x049e
	.dw #0x045c
	.dw #0x041d
	.dw #0x03e2
	.dw #0x03ab
	.dw #0x0376
	.dw #0x0344
	.dw #0x0315
	.dw #0x02e9
	.dw #0x02bf
	.dw #0x0298
	.dw #0x0272
	.dw #0x024f
	.dw #0x022e
	.dw #0x020f
	.dw #0x01f1
	.dw #0x01d5
	.dw #0x01bb
	.dw #0x01a2
	.dw #0x018b
	.dw #0x0174
	.dw #0x0160
	.dw #0x014c
	.dw #0x0139
	.dw #0x0128
	.dw #0x0117
	.dw #0x0107
	.dw #0x00f9
	.dw #0x00eb
	.dw #0x00dd
	.dw #0x00d1
	.dw #0x00c5
	.dw #0x00ba
	.dw #0x00b0
	.dw #0x00a6
	.dw #0x009d
	.dw #0x0094
	.dw #0x008c
	.dw #0x0084
	.dw #0x007c
	.dw #0x0075
	.dw #0x006f
	.dw #0x0069
	.dw #0x0063
	.dw #0x005d
	.dw #0x0058
	.dw #0x0053
	.dw #0x004e
	.dw #0x004a
	.dw #0x0046
	.dw #0x0042
	.dw #0x003e
	.dw #0x003b
	.dw #0x0037
	.dw #0x0034
	.dw #0x0031
	.dw #0x002f
	.dw #0x002c
	.dw #0x0029
	.dw #0x0027
	.dw #0x0025
	.dw #0x0023
	.dw #0x0021
	.dw #0x001f
	.dw #0x001d
	.dw #0x001c
	.dw #0x001a
	.dw #0x0019
	.dw #0x0017
	.dw #0x0016
	.dw #0x0015
	.dw #0x0014
	.dw #0x0012
	.dw #0x0011
	.dw #0x0010
	.dw #0x000f
	.dw #0x000e
	.dw #0x000d
G$g_ayfx_bank$0_0$0 == .
_g_ayfx_bank:
	.db #0x13	; 19
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0xb6	; 182
	.db #0x00	; 0
	.db #0xca	; 202
	.db #0x00	; 0
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x01	; 1
	.db #0x99	; 153
	.db #0x01	; 1
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0xd4	; 212
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x02	; 2
	.db #0x59	; 89	'Y'
	.db #0x02	; 2
	.db #0x89	; 137
	.db #0x02	; 2
	.db #0xba	; 186
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x2f	; 47
	.db #0x03	; 3
	.db #0x62	; 98	'b'
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0xb4	; 180
	.db #0x03	; 3
	.db #0xef	; 239
	.db #0x6f	; 111	'o'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xae	; 174
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0xad	; 173
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0xa6	; 166
	.db #0xe9	; 233
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0xdd	; 221
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xa4	; 164
	.db #0x4b	; 75	'K'
	.db #0x01	; 1
	.db #0xab	; 171
	.db #0x1a	; 26
	.db #0x01	; 1
	.db #0xa9	; 169
	.db #0xac	; 172
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x4a	; 74	'J'
	.db #0x00	; 0
	.db #0xa2	; 162
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0xa1	; 161
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0x31	; 49	'1'
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x6f	; 111	'o'
	.db #0x94	; 148
	.db #0x01	; 1
	.db #0x1a	; 26
	.db #0x6e	; 110	'n'
	.db #0x1a	; 26
	.db #0x02	; 2
	.db #0x18	; 24
	.db #0xec	; 236
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0xeb	; 235
	.db #0xc6	; 198
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0xea	; 234
	.db #0x40	; 64
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0xe9	; 233
	.db #0x35	; 53	'5'
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0xec	; 236
	.db #0x05	; 5
	.db #0x13	; 19
	.db #0xe7	; 231
	.db #0xe1	; 225
	.db #0x06	; 6
	.db #0x11	; 17
	.db #0xe5	; 229
	.db #0x67	; 103	'g'
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0xe4	; 228
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0xe3	; 227
	.db #0x80	; 128
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0xe2	; 226
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0xe2	; 226
	.db #0x38	; 56	'8'
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0x69	; 105	'i'
	.db #0x09	; 9
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0xa6	; 166
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x44	; 68	'D'
	.db #0x1f	; 31
	.db #0x44	; 68	'D'
	.db #0x11	; 17
	.db #0xea	; 234
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0xc9	; 201
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0xa1	; 161
	.db #0x2e	; 46
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x60	; 96
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaf	; 175
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x81	; 129
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x6f	; 111	'o'
	.db #0xab	; 171
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xe8	; 232
	.db #0x6e	; 110	'n'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0xa4	; 164
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0xa9	; 169
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0xa8	; 168
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xa8	; 168
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xa7	; 167
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xa6	; 166
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0xa6	; 166
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0xa5	; 165
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xa5	; 165
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xa5	; 165
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xa5	; 165
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xa4	; 164
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xa4	; 164
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xa4	; 164
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xa4	; 164
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xa3	; 163
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa2	; 162
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xa2	; 162
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xa3	; 163
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa1	; 161
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xa1	; 161
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xa1	; 161
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x6f	; 111	'o'
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x4e	; 78	'N'
	.db #0x15	; 21
	.db #0x4c	; 76	'L'
	.db #0x14	; 20
	.db #0x0b	; 11
	.db #0x4a	; 74	'J'
	.db #0x12	; 18
	.db #0x49	; 73	'I'
	.db #0x11	; 17
	.db #0x68	; 104	'h'
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x67	; 103	'g'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x06	; 6
	.db #0x26	; 38
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x65	; 101	'e'
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x63	; 99	'c'
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x62	; 98	'b'
	.db #0x29	; 41
	.db #0x00	; 0
	.db #0x19	; 25
	.db #0x22	; 34
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xac	; 172
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xa8	; 168
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0xa4	; 164
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xa5	; 165
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xa2	; 162
	.db #0x94	; 148
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xec	; 236
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x87	; 135
	.db #0x86	; 134
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0xaf	; 175
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xaf	; 175
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xaf	; 175
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0xaf	; 175
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xaf	; 175
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xaf	; 175
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0xaf	; 175
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xaf	; 175
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xaf	; 175
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0xab	; 171
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xab	; 171
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x8b	; 139
	.db #0xa7	; 167
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xa7	; 167
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0xa5	; 165
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xa5	; 165
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x85	; 133
	.db #0xa3	; 163
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xa3	; 163
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0xa1	; 161
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa1	; 161
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0xd0	; 208
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0xaf	; 175
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0xad	; 173
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x8d	; 141
	.db #0xad	; 173
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0xac	; 172
	.db #0xb4	; 180
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0xac	; 172
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0xa7	; 167
	.db #0xd0	; 208
	.db #0x02	; 2
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0xb4	; 180
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0xad	; 173
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0xab	; 171
	.db #0xb4	; 180
	.db #0x00	; 0
	.db #0x8a	; 138
	.db #0xa9	; 169
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xa7	; 167
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xa0	; 160
	.db #0xb4	; 180
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xa7	; 167
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0xa6	; 166
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0xa5	; 165
	.db #0xb4	; 180
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xa4	; 164
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0xa2	; 162
	.db #0xb4	; 180
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x68	; 104	'h'
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xaf	; 175
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xad	; 173
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xac	; 172
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0xab	; 171
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xaa	; 170
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0xa9	; 169
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0xa8	; 168
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0xa7	; 167
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa6	; 166
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0xa5	; 165
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa4	; 164
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xa4	; 164
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0xa2	; 162
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xa2	; 162
	.db #0xaf	; 175
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x6f	; 111	'o'
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x02	; 2
	.db #0x08	; 8
	.db #0xec	; 236
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xac	; 172
	.db #0xbc	; 188
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0xa8	; 168
	.db #0x46	; 70	'F'
	.db #0x01	; 1
	.db #0xa6	; 166
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0xa6	; 166
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0xa4	; 164
	.db #0x35	; 53	'5'
	.db #0x02	; 2
	.db #0xa4	; 164
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0xa6	; 166
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0xa6	; 166
	.db #0x46	; 70	'F'
	.db #0x01	; 1
	.db #0xa4	; 164
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0xa4	; 164
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0xa2	; 162
	.db #0x35	; 53	'5'
	.db #0x02	; 2
	.db #0xa2	; 162
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0xa4	; 164
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0xa4	; 164
	.db #0x46	; 70	'F'
	.db #0x01	; 1
	.db #0xa3	; 163
	.db #0x92	; 146
	.db #0x01	; 1
	.db #0xa3	; 163
	.db #0xab	; 171
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x35	; 53	'5'
	.db #0x02	; 2
	.db #0xa1	; 161
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xad	; 173
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xa9	; 169
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xa3	; 163
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x88	; 136
	.db #0xa7	; 167
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xa6	; 166
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xa2	; 162
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x85	; 133
	.db #0xa4	; 164
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xa2	; 162
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0x6f	; 111	'o'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x4e	; 78	'N'
	.db #0x10	; 16
	.db #0x4d	; 77	'M'
	.db #0x0b	; 11
	.db #0x4d	; 77	'M'
	.db #0x10	; 16
	.db #0x0c	; 12
	.db #0x6b	; 107	'k'
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x4a	; 74	'J'
	.db #0x0f	; 15
	.db #0x68	; 104	'h'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x48	; 72	'H'
	.db #0x10	; 16
	.db #0x47	; 71	'G'
	.db #0x0b	; 11
	.db #0x46	; 70	'F'
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0x64	; 100	'd'
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x44	; 68	'D'
	.db #0x0f	; 15
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x45	; 69	'E'
	.db #0x10	; 16
	.db #0x44	; 68	'D'
	.db #0x0b	; 11
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x62	; 98	'b'
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x41	; 65	'A'
	.db #0x0f	; 15
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xef	; 239
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xae	; 174
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x8a	; 138
	.db #0x89	; 137
	.db #0xa8	; 168
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xed	; 237
	.db #0xb3	; 179
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0xb5	; 181
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0xb7	; 183
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xad	; 173
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0xad	; 173
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0xab	; 171
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0xad	; 173
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x89	; 137
	.db #0x8d	; 141
	.db #0xad	; 173
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x8b	; 139
	.db #0x89	; 137
	.db #0x87	; 135
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0x85	; 133
	.db #0xa9	; 169
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x85	; 133
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xa7	; 167
	.db #0x6b	; 107	'k'
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x47	; 71	'G'
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x83	; 131
	.db #0x82	; 130
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xec	; 236
	.db #0x5c	; 92
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xaf	; 175
	.db #0x5a	; 90	'Z'
	.db #0x01	; 1
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x86	; 134
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x84	; 132
	.db #0x82	; 130
	.db #0xd0	; 208
	.db #0x20	; 32
	G$ChannelSFX$0$0	= .
	.globl	G$ChannelSFX$0$0
	C$music.c$26$1_0$517	= .
	.globl	C$music.c$26$1_0$517
;./music.c:26: void ChannelSFX(u8 chan)
;	---------------------------------
; Function ChannelSFX
; ---------------------------------
_ChannelSFX::
	ld	c, a
	C$music.c$28$1_0$517	= .
	.globl	C$music.c$28$1_0$517
;./music.c:28: ayFX_Mute();           // Arresta la riproduzione dell'audio e disattiva il canale
	push	bc
	call	_ayFX_Mute
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/ayfx/ayfx_player.h:121: inline void ayFX_SetChannel(u8 chan) { ayFX_Channel = 3 - chan; }
	ld	hl, #_ayFX_Channel
	ld	a, #0x03
	sub	a, c
	ld	(hl), a
	C$music.c$29$3_0$517	= .
	.globl	C$music.c$29$3_0$517
;./music.c:29: ayFX_SetChannel(chan); // Impostare il canale da utilizzare per la riproduzione del suono
	C$music.c$30$3_0$517	= .
	.globl	C$music.c$30$3_0$517
;./music.c:30: }
	C$music.c$30$3_0$517	= .
	.globl	C$music.c$30$3_0$517
	XG$ChannelSFX$0$0	= .
	.globl	XG$ChannelSFX$0$0
	ret
	G$inizializePT3$0$0	= .
	.globl	G$inizializePT3$0$0
	C$music.c$37$3_0$521	= .
	.globl	C$music.c$37$3_0$521
;./music.c:37: void inizializePT3()
;	---------------------------------
; Function inizializePT3
; ---------------------------------
_inizializePT3::
	C$music.c$39$1_0$521	= .
	.globl	C$music.c$39$1_0$521
;./music.c:39: PT3_Init();                // Inizializza il Player PT3
	call	_PT3_Init
;./music.c:40: PT3_SetNoteTable(PT3_NT2); // Setta la tabella delle note
	ld	hl, #_PT3_NT2+0
	ld	(_PT3_NoteTable), hl
	C$music.c$41$1_0$521	= .
	.globl	C$music.c$41$1_0$521
;./music.c:41: PT3_SetLoop(TRUE);
	ld	a, #0x01
	call	_PT3_SetLoop
	C$music.c$42$1_0$521	= .
	.globl	C$music.c$42$1_0$521
;./music.c:42: PT3_InitSong(g_DataMusic);
	ld	hl, #_g_DataMusic
	C$music.c$43$1_0$521	= .
	.globl	C$music.c$43$1_0$521
;./music.c:43: }
	C$music.c$43$1_0$521	= .
	.globl	C$music.c$43$1_0$521
	XG$inizializePT3$0$0	= .
	.globl	XG$inizializePT3$0$0
	jp	_PT3_InitSong
	G$inizializeAYFX$0$0	= .
	.globl	G$inizializeAYFX$0$0
	C$music.c$50$1_0$525	= .
	.globl	C$music.c$50$1_0$525
;./music.c:50: void inizializeAYFX()
;	---------------------------------
; Function inizializeAYFX
; ---------------------------------
_inizializeAYFX::
	C$music.c$52$1_0$525	= .
	.globl	C$music.c$52$1_0$525
;./music.c:52: ayFX_InitBank(g_ayfx_bank);     // Impostazione del riproduttore ayFX tramite l'array g_ayfx_bank
	ld	hl, #_g_ayfx_bank
	call	_ayFX_InitBank
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/ayfx/ayfx_player.h:121: inline void ayFX_SetChannel(u8 chan) { ayFX_Channel = 3 - chan; }
	ld	hl, #_ayFX_Channel
	ld	(hl), #0x03
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/ayfx/ayfx_player.h:114: inline void ayFX_SetMode(u8 mode) { ayFX_Mode = mode; }
	ld	hl, #_ayFX_Mode
	ld	(hl), #0x00
	C$music.c$54$3_0$525	= .
	.globl	C$music.c$54$3_0$525
;./music.c:54: ayFX_SetMode(AYFX_MODE_FIXED);  // Set channel mode
	C$music.c$55$3_0$525	= .
	.globl	C$music.c$55$3_0$525
;./music.c:55: }
	C$music.c$55$3_0$525	= .
	.globl	C$music.c$55$3_0$525
	XG$inizializeAYFX$0$0	= .
	.globl	XG$inizializeAYFX$0$0
	ret
	G$pausePT3Music$0$0	= .
	.globl	G$pausePT3Music$0$0
	C$music.c$62$3_0$532	= .
	.globl	C$music.c$62$3_0$532
;./music.c:62: void pausePT3Music()
;	---------------------------------
; Function pausePT3Music
; ---------------------------------
_pausePT3Music::
	C$music.c$64$1_0$532	= .
	.globl	C$music.c$64$1_0$532
;./music.c:64: PT3_Pause();
	call	_PT3_Pause
	C$music.c$65$1_0$532	= .
	.globl	C$music.c$65$1_0$532
;./music.c:65: PT3_UpdatePSG();
	C$music.c$66$1_0$532	= .
	.globl	C$music.c$66$1_0$532
;./music.c:66: }
	C$music.c$66$1_0$532	= .
	.globl	C$music.c$66$1_0$532
	XG$pausePT3Music$0$0	= .
	.globl	XG$pausePT3Music$0$0
	jp	_PT3_UpdatePSG
	G$restorePT3Music$0$0	= .
	.globl	G$restorePT3Music$0$0
	C$music.c$73$1_0$533	= .
	.globl	C$music.c$73$1_0$533
;./music.c:73: void restorePT3Music()
;	---------------------------------
; Function restorePT3Music
; ---------------------------------
_restorePT3Music::
	C$music.c$75$1_0$533	= .
	.globl	C$music.c$75$1_0$533
;./music.c:75: PT3_Resume();
	call	_PT3_Resume
	C$music.c$76$1_0$533	= .
	.globl	C$music.c$76$1_0$533
;./music.c:76: PT3_UpdatePSG();
	C$music.c$77$1_0$533	= .
	.globl	C$music.c$77$1_0$533
;./music.c:77: }
	C$music.c$77$1_0$533	= .
	.globl	C$music.c$77$1_0$533
	XG$restorePT3Music$0$0	= .
	.globl	XG$restorePT3Music$0$0
	jp	_PT3_UpdatePSG
	G$stopMusicPlayback$0$0	= .
	.globl	G$stopMusicPlayback$0$0
	C$music.c$84$1_0$534	= .
	.globl	C$music.c$84$1_0$534
;./music.c:84: void stopMusicPlayback()
;	---------------------------------
; Function stopMusicPlayback
; ---------------------------------
_stopMusicPlayback::
	C$music.c$86$1_0$534	= .
	.globl	C$music.c$86$1_0$534
;./music.c:86: ayFX_Mute();
	call	_ayFX_Mute
	C$music.c$87$1_0$534	= .
	.globl	C$music.c$87$1_0$534
;./music.c:87: ayFX_Update();
	call	_ayFX_Update
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/pt3/pt3_player.h:301: PT3_State |= 1 << (chan + 1);
	ld	a, (_PT3_State+0)
	or	a, #0x08
	ld	(_PT3_State+0), a
	C$music.c$89$1_0$534	= .
	.globl	C$music.c$89$1_0$534
;./music.c:89: PT3_Pause();
	call	_PT3_Pause
	C$music.c$90$1_0$534	= .
	.globl	C$music.c$90$1_0$534
;./music.c:90: PT3_UpdatePSG();
	C$music.c$91$1_0$534	= .
	.globl	C$music.c$91$1_0$534
;./music.c:91: }
	C$music.c$91$1_0$534	= .
	.globl	C$music.c$91$1_0$534
	XG$stopMusicPlayback$0$0	= .
	.globl	XG$stopMusicPlayback$0$0
	jp	_PT3_UpdatePSG
	G$setChannel$0$0	= .
	.globl	G$setChannel$0$0
	C$music.c$93$1_0$538	= .
	.globl	C$music.c$93$1_0$538
;./music.c:93: void setChannel()
;	---------------------------------
; Function setChannel
; ---------------------------------
_setChannel::
	C$music.c$95$1_0$538	= .
	.globl	C$music.c$95$1_0$538
;./music.c:95: ChannelSFX(PSG_CHANNEL_A);
	xor	a, a
	call	_ChannelSFX
	C$music.c$96$1_0$538	= .
	.globl	C$music.c$96$1_0$538
;./music.c:96: PlayBankSFX(0, 0);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	C$music.c$97$1_0$538	= .
	.globl	C$music.c$97$1_0$538
;./music.c:97: }
	C$music.c$97$1_0$538	= .
	.globl	C$music.c$97$1_0$538
	XG$setChannel$0$0	= .
	.globl	XG$setChannel$0$0
	jp	_PlayBankSFX
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
	.org 0x3924
G$g_DataMusic$0_0$0 == .
_g_DataMusic:
	.db #0x05	; 5
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7b	; 123
	.db #0x05	; 5
	.db #0x91	; 145
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x06	; 6
	.db #0x8c	; 140
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x94	; 148
	.db #0x06	; 6
	.db #0x9c	; 156
	.db #0x06	; 6
	.db #0xa4	; 164
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x12	; 18
	.db #0x15	; 21
	.db #0x12	; 18
	.db #0x15	; 21
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x53	; 83	'S'
	.db #0x01	; 1
	.db #0x57	; 87	'W'
	.db #0x01	; 1
	.db #0x86	; 134
	.db #0x01	; 1
	.db #0xbc	; 188
	.db #0x01	; 1
	.db #0xdf	; 223
	.db #0x01	; 1
	.db #0x93	; 147
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0x02	; 2
	.db #0xee	; 238
	.db #0x02	; 2
	.db #0x1b	; 27
	.db #0x03	; 3
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0xaf	; 175
	.db #0x03	; 3
	.db #0xeb	; 235
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x34	; 52	'4'
	.db #0x04	; 4
	.db #0x70	; 112	'p'
	.db #0x04	; 4
	.db #0x8b	; 139
	.db #0x04	; 4
	.db #0x13	; 19
	.db #0x05	; 5
	.db #0xcd	; 205
	.db #0x02	; 2
	.db #0xee	; 238
	.db #0x02	; 2
	.db #0x33	; 51	'3'
	.db #0x05	; 5
	.db #0x57	; 87	'W'
	.db #0x03	; 3
	.db #0x82	; 130
	.db #0x03	; 3
	.db #0x93	; 147
	.db #0x02	; 2
	.db #0xb9	; 185
	.db #0x04	; 4
	.db #0xe5	; 229
	.db #0x04	; 4
	.db #0x0d	; 13
	.db #0x02	; 2
	.db #0x43	; 67	'C'
	.db #0x02	; 2
	.db #0x65	; 101	'e'
	.db #0x02	; 2
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x72	; 114	'r'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x45	; 69	'E'
	.db #0x7b	; 123
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x72	; 114	'r'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x77	; 119	'w'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x08	; 8
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x72	; 114	'r'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xc0	; 192
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x79	; 121	'y'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x7b	; 123
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x68	; 104	'h'
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x45	; 69	'E'
	.db #0x7b	; 123
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xb0	; 176
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xb0	; 176
	.db #0x74	; 116	't'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x68	; 104	'h'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x74	; 116	't'
	.db #0xd4	; 212
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x2e	; 46
	.db #0xcd	; 205
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x77	; 119	'w'
	.db #0x7b	; 123
	.db #0xc8	; 200
	.db #0x77	; 119	'w'
	.db #0xcd	; 205
	.db #0x74	; 116	't'
	.db #0xc8	; 200
	.db #0x7b	; 123
	.db #0xcd	; 205
	.db #0x72	; 114	'r'
	.db #0x71	; 113	'q'
	.db #0xc8	; 200
	.db #0x72	; 114	'r'
	.db #0xcd	; 205
	.db #0x6f	; 111	'o'
	.db #0xc8	; 200
	.db #0x71	; 113	'q'
	.db #0x6f	; 111	'o'
	.db #0xcd	; 205
	.db #0x76	; 118	'v'
	.db #0x7e	; 126
	.db #0xc8	; 200
	.db #0x76	; 118	'v'
	.db #0xcd	; 205
	.db #0x7d	; 125
	.db #0xc8	; 200
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x44	; 68	'D'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x6f	; 111	'o'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x76	; 118	'v'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xb0	; 176
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x68	; 104	'h'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x74	; 116	't'
	.db #0xd4	; 212
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x2e	; 46
	.db #0xcd	; 205
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0xc8	; 200
	.db #0xd0	; 208
	.db #0x7e	; 126
	.db #0xc4	; 196
	.db #0xd0	; 208
	.db #0xcd	; 205
	.db #0x80	; 128
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0xc8	; 200
	.db #0x80	; 128
	.db #0xcd	; 205
	.db #0x85	; 133
	.db #0xc8	; 200
	.db #0x82	; 130
	.db #0xcd	; 205
	.db #0x87	; 135
	.db #0xc8	; 200
	.db #0x85	; 133
	.db #0xcd	; 205
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x8a	; 138
	.db #0xc8	; 200
	.db #0x87	; 135
	.db #0x8a	; 138
	.db #0xcd	; 205
	.db #0x85	; 133
	.db #0x8a	; 138
	.db #0xc8	; 200
	.db #0x85	; 133
	.db #0xcd	; 205
	.db #0x89	; 137
	.db #0xc8	; 200
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x80	; 128
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x80	; 128
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xb0	; 176
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x3b	; 59
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x68	; 104	'h'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x74	; 116	't'
	.db #0xd4	; 212
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x7b	; 123
	.db #0xcc	; 204
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0xd0	; 208
	.db #0xcb	; 203
	.db #0xd0	; 208
	.db #0xca	; 202
	.db #0xd0	; 208
	.db #0xc9	; 201
	.db #0xd0	; 208
	.db #0xc8	; 200
	.db #0xd0	; 208
	.db #0xc7	; 199
	.db #0xd0	; 208
	.db #0xc6	; 198
	.db #0xd0	; 208
	.db #0xc5	; 197
	.db #0xb1	; 177
	.db #0x03	; 3
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x45	; 69	'E'
	.db #0x7b	; 123
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x0c	; 12
	.db #0x40	; 64
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xb0	; 176
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x68	; 104	'h'
	.db #0xc0	; 192
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x74	; 116	't'
	.db #0xc0	; 192
	.db #0xd6	; 214
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x68	; 104	'h'
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x68	; 104	'h'
	.db #0xd7	; 215
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x74	; 116	't'
	.db #0xd4	; 212
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x74	; 116	't'
	.db #0xcc	; 204
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0xd0	; 208
	.db #0xcb	; 203
	.db #0xd0	; 208
	.db #0xca	; 202
	.db #0xd0	; 208
	.db #0xc9	; 201
	.db #0xd0	; 208
	.db #0xc8	; 200
	.db #0xd0	; 208
	.db #0xc7	; 199
	.db #0xd0	; 208
	.db #0xc6	; 198
	.db #0xd0	; 208
	.db #0xc5	; 197
	.db #0xb1	; 177
	.db #0x03	; 3
	.db #0xd0	; 208
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0x16	; 22
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x45	; 69	'E'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x74	; 116	't'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x45	; 69	'E'
	.db #0x74	; 116	't'
	.db #0x44	; 68	'D'
	.db #0x74	; 116	't'
	.db #0x45	; 69	'E'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x45	; 69	'E'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x2e	; 46
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0xca	; 202
	.db #0xd0	; 208
	.db #0xd7	; 215
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x73	; 115	's'
	.db #0xe7	; 231
	.db #0xc6	; 198
	.db #0x74	; 116	't'
	.db #0xd6	; 214
	.db #0xcf	; 207
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x67	; 103	'g'
	.db #0xe7	; 231
	.db #0xc4	; 196
	.db #0x74	; 116	't'
	.db #0xd7	; 215
	.db #0xcf	; 207
	.db #0x73	; 115	's'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x73	; 115	's'
	.db #0xd6	; 214
	.db #0x67	; 103	'g'
	.db #0xd7	; 215
	.db #0x73	; 115	's'
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0xd7	; 215
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x16	; 22
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x74	; 116	't'
	.db #0x44	; 68	'D'
	.db #0x80	; 128
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0xdb	; 219
	.db #0x4f	; 79	'O'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5a	; 90	'Z'
	.db #0xdb	; 219
	.db #0x4e	; 78	'N'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x45	; 69	'E'
	.db #0x7b	; 123
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x63	; 99	'c'
	.db #0xdb	; 219
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x76	; 118	'v'
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x61	; 97	'a'
	.db #0xdb	; 219
	.db #0x4d	; 77	'M'
	.db #0x74	; 116	't'
	.db #0xde	; 222
	.db #0x40	; 64
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0x2e	; 46
	.db #0xc9	; 201
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x77	; 119	'w'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x7b	; 123
	.db #0x74	; 116	't'
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x72	; 114	'r'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x71	; 113	'q'
	.db #0xb1	; 177
	.db #0x06	; 6
	.db #0x6f	; 111	'o'
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x76	; 118	'v'
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x7e	; 126
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x03	; 3
	.db #0xd0	; 208
	.db #0xf0	; 240
	.db #0x2e	; 46
	.db #0xc9	; 201
	.db #0xb1	; 177
	.db #0x08	; 8
	.db #0x7e	; 126
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x82	; 130
	.db #0x85	; 133
	.db #0x87	; 135
	.db #0xb1	; 177
	.db #0x06	; 6
	.db #0x8a	; 138
	.db #0xb1	; 177
	.db #0x02	; 2
	.db #0x85	; 133
	.db #0xb1	; 177
	.db #0x04	; 4
	.db #0x8a	; 138
	.db #0xb1	; 177
	.db #0x01	; 1
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8c	; 140
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8a	; 138
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x84	; 132
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x03	; 3
