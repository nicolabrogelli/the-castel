;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module system
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
	.globl _Sys_GetPageSlot
	.globl _Sys_SetPageSlot
	.globl _Sys_SetPage0Slot
	.globl _Sys_CheckSlot
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
	G$Sys_GetPageSlot$0$0	= .
	.globl	G$Sys_GetPageSlot$0$0
	C$system.c$12$0_0$36	= .
	.globl	C$system.c$12$0_0$36
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:12: u8 Sys_GetPageSlot(u8 page)
;	---------------------------------
; Function Sys_GetPageSlot
; ---------------------------------
_Sys_GetPageSlot::
	ld	e, a
	C$system.c$15$1_0$36	= .
	.globl	C$system.c$15$1_0$36
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:15: u8 slot = (g_PortPrimarySlot >> (page * 2)) & 0x03;
	sla	e
	ld	b, e
	in	a, (_g_PortPrimarySlot)
	ld	c, a
	inc	b
	jp	00113$
00112$:
	srl	c
00113$:
	djnz	00112$
	ld	a, c
	and	a, #0x03
	ld	c, a
	C$system.c$18$1_0$36	= .
	.globl	C$system.c$18$1_0$36
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:18: if(g_EXPTBL[slot] & SLOT_EXP)
	ld	hl, #_g_EXPTBL+0
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	rlca
	jr	NC, 00102$
	C$system.c$20$3_0$37	= .
	.globl	C$system.c$20$3_0$37
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:20: u8 prevSlot = g_PortPrimarySlot; // Backup current primary slots register
	in	a, (_g_PortPrimarySlot)
	ld	b, a
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.h:156: inline void DisableInterrupt() { __asm__("di"); }
	di
	C$system.c$22$2_0$37	= .
	.globl	C$system.c$22$2_0$37
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:22: g_PortPrimarySlot = (prevSlot & 0x3F) | (slot << 6); // Select primary slot in page 3
	ld	a, b
	and	a, #0x3f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	rrca
	rrca
	and	a, #0xc0
	or	a, l
	out	(_g_PortPrimarySlot), a
	C$system.c$23$2_0$37	= .
	.globl	C$system.c$23$2_0$37
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:23: slot |= SLOT_EXP;
	set	7, c
	C$system.c$24$2_0$37	= .
	.globl	C$system.c$24$2_0$37
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:24: slot |= (((~g_SLTSL) >> (page * 2)) & 0x03) << 2;
	ld	a, (_g_SLTSL+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	cpl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	cpl
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	e
	jp	00116$
00115$:
	sra	h
	rr	l
00116$:
	dec	e
	jr	NZ, 00115$
	ld	a, l
	and	a, #0x03
	add	a, a
	add	a, a
	or	a, c
	ld	c, a
	C$system.c$25$2_0$37	= .
	.globl	C$system.c$25$2_0$37
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:25: g_PortPrimarySlot = prevSlot; // Restore primary slots register
	ld	a, b
	out	(_g_PortPrimarySlot), a
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.h:152: inline void EnableInterrupt() { __asm__("ei"); }
	ei
	C$system.c$26$1_0$36	= .
	.globl	C$system.c$26$1_0$36
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:26: EnableInterrupt();
00102$:
	C$system.c$28$1_0$36	= .
	.globl	C$system.c$28$1_0$36
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:28: return slot;
	ld	a, c
	C$system.c$29$1_0$36	= .
	.globl	C$system.c$29$1_0$36
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:29: }
	C$system.c$29$1_0$36	= .
	.globl	C$system.c$29$1_0$36
	XG$Sys_GetPageSlot$0$0	= .
	.globl	XG$Sys_GetPageSlot$0$0
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
	G$Sys_SetPageSlot$0$0	= .
	.globl	G$Sys_SetPageSlot$0$0
	C$system.c$33$1_0$45	= .
	.globl	C$system.c$33$1_0$45
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:33: void Sys_SetPageSlot(u8 page, u8 slotId)
;	---------------------------------
; Function Sys_SetPageSlot
; ---------------------------------
_Sys_SetPageSlot::
	C$system.c$36$1_0$45	= .
	.globl	C$system.c$36$1_0$45
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:36: slotId;
	C$system.c$60$1_0$45	= .
	.globl	C$system.c$60$1_0$45
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:60: }
	C$system.c$60$1_0$45	= .
	.globl	C$system.c$60$1_0$45
	XG$Sys_SetPageSlot$0$0	= .
	.globl	XG$Sys_SetPageSlot$0$0
	ret
	G$Sys_SetPage0Slot$0$0	= .
	.globl	G$Sys_SetPage0Slot$0$0
	C$system.c$64$1_0$47	= .
	.globl	C$system.c$64$1_0$47
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:64: void Sys_SetPage0Slot(u8 slotId)
;	---------------------------------
; Function Sys_SetPage0Slot
; ---------------------------------
_Sys_SetPage0Slot::
	C$system.c$134$1_0$47	= .
	.globl	C$system.c$134$1_0$47
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:134: __endasm;
	ld	c, a
	and	#0b10000000
	jp	z, SetNonExpendedSlot
	 SetExpendedSlot:
	ld	a, c
	and	#0b00000011
	ld	d, a
	rrca	
	rrca 
	and a, #0xC0
	or	d
	ld	d, a
	in	a, (0xA8)
	ld	b, a
	and	#0b00111100
	or	d
	di
	out	(0xA8), a
	ld	a, c
	rrca	
	rrca 
	and a, #0x3F
	and	#0b00000011
	ld	d, a
	ld	a,(0xFFFF)
	cpl
	and	#0b11111100
	or	d
	ld	(0xFFFF), a
	ld	a, b
	and	#0b11000000
	ld	b, a
	in	a, (0xA8)
	and	#0b00111111
	or	b
	out	(0xA8), a
	ret
	 SetNonExpendedSlot:
	ld	a, c
	and	#0b00000011
	ld	d, a
	in	a, (0xA8)
	ld	b, a
	and	#0b11111100
	or	d
	di
	out	(0xA8), a
	ret
	C$system.c$136$1_0$47	= .
	.globl	C$system.c$136$1_0$47
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:136: }
	C$system.c$136$1_0$47	= .
	.globl	C$system.c$136$1_0$47
	XG$Sys_SetPage0Slot$0$0	= .
	.globl	XG$Sys_SetPage0Slot$0$0
	ret
	G$Sys_CheckSlot$0$0	= .
	.globl	G$Sys_CheckSlot$0$0
	C$system.c$140$1_0$49	= .
	.globl	C$system.c$140$1_0$49
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:140: u8 Sys_CheckSlot(CheckSlotCallback cb)
;	---------------------------------
; Function Sys_CheckSlot
; ---------------------------------
_Sys_CheckSlot::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$system.c$142$3_0$50	= .
	.globl	C$system.c$142$3_0$50
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:142: for(u8 slot = 0; slot < 4; ++slot)
	ld	bc, #0x0
00114$:
	ld	a, b
	sub	a, #0x04
	jr	NC, 00109$
	C$system.c$144$3_0$51	= .
	.globl	C$system.c$144$3_0$51
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:144: if(g_EXPTBL[slot] & SLOT_EXP)
	ld	de, #_g_EXPTBL+0
	ld	a, e
	add	a, b
	ld	e, a
	jr	NC, 00153$
	inc	d
00153$:
	ld	a, (de)
	rlca
	jr	NC, 00107$
	C$system.c$146$6_0$54	= .
	.globl	C$system.c$146$6_0$54
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:146: for(u8 sub = 0; sub < 4; ++sub)
	ld	a, b
	and	a, #0x03
	ld	-1 (ix), a
	ld	c, #0x00
00111$:
	C$system.c$148$6_0$54	= .
	.globl	C$system.c$148$6_0$54
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:148: u8 slotId = SLOTEX(slot, sub);
	ld	a,c
	cp	a,#0x04
	jr	NC, 00115$
	and	a, #0x03
	add	a, a
	add	a, a
	or	a, -1 (ix)
	ld	e, a
	set	7, e
	C$system.c$149$6_0$54	= .
	.globl	C$system.c$149$6_0$54
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:149: if(cb(slotId))
	push	hl
	push	bc
	push	de
	ld	a, e
	call	___sdcc_call_hl
	pop	de
	pop	bc
	pop	hl
	or	a, a
	jr	Z, 00112$
	C$system.c$150$6_0$54	= .
	.globl	C$system.c$150$6_0$54
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:150: return slotId;
	ld	a, e
	jp	00116$
00112$:
	C$system.c$146$5_0$53	= .
	.globl	C$system.c$146$5_0$53
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:146: for(u8 sub = 0; sub < 4; ++sub)
	inc	c
	jp	00111$
00107$:
	C$system.c$153$3_0$51	= .
	.globl	C$system.c$153$3_0$51
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:153: else if(cb(slot))
	push	hl
	push	bc
	ld	a, b
	call	___sdcc_call_hl
	pop	bc
	pop	hl
	or	a, a
	jr	Z, 00115$
	C$system.c$154$3_0$51	= .
	.globl	C$system.c$154$3_0$51
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:154: return slot;
	ld	a, c
	jp	00116$
00115$:
	C$system.c$142$2_0$50	= .
	.globl	C$system.c$142$2_0$50
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:142: for(u8 slot = 0; slot < 4; ++slot)
	inc	b
	ld	c, b
	jp	00114$
00109$:
	C$system.c$156$1_0$49	= .
	.globl	C$system.c$156$1_0$49
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:156: return SLOT_NOTFOUND;
	ld	a, #0xff
00116$:
	C$system.c$157$1_0$49	= .
	.globl	C$system.c$157$1_0$49
;C:\Users\87003101\msxgl-workspace\the-castel\MSXgl\engine/src/system.c:157: }
	inc	sp
	pop	ix
	C$system.c$157$1_0$49	= .
	.globl	C$system.c$157$1_0$49
	XG$Sys_CheckSlot$0$0	= .
	.globl	XG$Sys_CheckSlot$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
