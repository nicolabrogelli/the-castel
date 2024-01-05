;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module the_castel
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _VSyncCallback
	.globl _isOnPlatformV
	.globl _isOnPlatformH
	.globl _isPassage
	.globl _physicsEventPlayer
	.globl _restoreLevel
	.globl _setChannel
	.globl _stopMusicPlayback
	.globl _pausePT3Music
	.globl _restorePT3Music
	.globl _PlayBankSFX
	.globl _inizializeAYFX
	.globl _inizializePT3
	.globl _isInteractObject
	.globl _isMoveJump
	.globl _isMoveLeft
	.globl _isMoveRight
	.globl _displayItemToInventory
	.globl _removeItemFromInventory
	.globl _hasItemInInventory
	.globl _addItemToInventory
	.globl _initInventory
	.globl _setTileByTileCoord
	.globl _setTile
	.globl _getTile
	.globl _Pletter_UnpackToVRAM
	.globl _Pletter_UnpackToRAM
	.globl _GamePawn_InitializePhysics
	.globl _GamePawn_SetMovement
	.globl _GamePawn_Draw
	.globl _GamePawn_Update
	.globl _GamePawn_SetAction
	.globl _GamePawn_SetPosition
	.globl _GamePawn_Initialize
	.globl _Game_SetState
	.globl _Game_MainLoop
	.globl _Game_Release
	.globl _Print_DrawText
	.globl _Print_SetMode
	.globl _Print_Initialize
	.globl _String_Format
	.globl _VDP_SetSpritePositionY
	.globl _VDP_SetSpritePosition
	.globl _VDP_SetSpriteSM1
	.globl _VDP_FillVRAM_16K
	.globl _VDP_WriteVRAM_16K
	.globl _VDP_RegWriteBakMask
	.globl _VDP_RegWrite
	.globl _VDP_ClearVRAM
	.globl _Bios_Exit
	.globl _Keyboard_Read
	.globl _Mem_Set
	.globl _g_CountItem
	.globl _g_CacheLevel
	.globl _g_Lives
	.globl _g_Fire
	.globl _isCatch
	.globl _g_DelayCatchEnemy
	.globl _g_CatchEnemy
	.globl _g_IsDanger
	.globl _IsUnderWater
	.globl _g_DelayRemoveLife
	.globl _g_Frame
	.globl _g_DangerCounter
	.globl _g_SecondCounter
	.globl _g_ImmunityCount
	.globl _g_SlideCountV
	.globl _g_SlideCountH
	.globl _g_BatCount
	.globl _g_SpiderCount
	.globl _g_GhostCount
	.globl _g_CurrRoomIdx
	.globl _g_ReverseCount
	.globl _g_PrevDirection
	.globl _g_PawnCount
	.globl _g_PrevRow8
	.globl _g_platformH
	.globl _g_platformV
	.globl _g_Bat
	.globl _g_Spider
	.globl _g_Ghost
	.globl _g_Enemy
	.globl _g_Player
	.globl _g_LevelUncompress
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
	.globl _g_PlayerAnimActions
	.globl _g_PlayerFramesFall
	.globl _g_PlayerFramesJump
	.globl _g_PlayerFramesMoveRight
	.globl _g_PlayerFramesMove
	.globl _g_PlayerFramesIdle
	.globl _g_PlayerSpriteLayers
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
	.globl _readInputControl
	.globl _initLife
	.globl _addLife
	.globl _removeLife
	.globl _hasLives
	.globl _displayLife
	.globl _physicsCollision
	.globl _physicsCollisionEnemy
	.globl _physicsCollisionPlayerAndGenericEnemy
	.globl _collisionCheck
	.globl _pursuitCheck
	.globl _isUnderTheWater
	.globl _setColorTiles
	.globl _foo
	.globl _interact
	.globl _replaceAndRemoveItem
	.globl _changeLevel
	.globl _getMoney
	.globl _isDanger
	.globl _updateScore
	.globl _drawLevel
	.globl _positionGenericEnemy
	.globl _spritePosition
	.globl _hideSprite
	.globl _managementSprite
	.globl _initCharacter
	.globl _updateCharacter
	.globl _updateGenericEnemy
	.globl _genericControl
	.globl _State_Initialize
	.globl _State_Game
	.globl _State_Preset
	.globl _State_Pause
	.globl _State_GameOver
	.globl _VDP_LoadPattern_GM1_Pletter
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
G$g_PortDebugMode$0_0$0 == 0x002e
_g_PortDebugMode	=	0x002e
G$g_PortDebugData$0_0$0 == 0x002f
_g_PortDebugData	=	0x002f
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
G$g_LevelUncompress$0_0$0==.
_g_LevelUncompress::
	.ds 768
G$g_Player$0_0$0==.
_g_Player::
	.ds 28
G$g_Enemy$0_0$0==.
_g_Enemy::
	.ds 30
G$g_Ghost$0_0$0==.
_g_Ghost::
	.ds 30
G$g_Spider$0_0$0==.
_g_Spider::
	.ds 30
G$g_Bat$0_0$0==.
_g_Bat::
	.ds 30
G$g_platformV$0_0$0==.
_g_platformV::
	.ds 30
G$g_platformH$0_0$0==.
_g_platformH::
	.ds 30
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_PrevRow8$0_0$0==.
_g_PrevRow8::
	.ds 1
G$g_PawnCount$0_0$0==.
_g_PawnCount::
	.ds 1
G$g_PrevDirection$0_0$0==.
_g_PrevDirection::
	.ds 1
G$g_ReverseCount$0_0$0==.
_g_ReverseCount::
	.ds 1
G$g_CurrRoomIdx$0_0$0==.
_g_CurrRoomIdx::
	.ds 1
G$g_GhostCount$0_0$0==.
_g_GhostCount::
	.ds 1
G$g_SpiderCount$0_0$0==.
_g_SpiderCount::
	.ds 1
G$g_BatCount$0_0$0==.
_g_BatCount::
	.ds 1
G$g_SlideCountH$0_0$0==.
_g_SlideCountH::
	.ds 1
G$g_SlideCountV$0_0$0==.
_g_SlideCountV::
	.ds 1
G$g_ImmunityCount$0_0$0==.
_g_ImmunityCount::
	.ds 1
G$g_SecondCounter$0_0$0==.
_g_SecondCounter::
	.ds 1
G$g_DangerCounter$0_0$0==.
_g_DangerCounter::
	.ds 1
G$g_Frame$0_0$0==.
_g_Frame::
	.ds 1
G$g_DelayRemoveLife$0_0$0==.
_g_DelayRemoveLife::
	.ds 1
G$IsUnderWater$0_0$0==.
_IsUnderWater::
	.ds 1
G$g_IsDanger$0_0$0==.
_g_IsDanger::
	.ds 1
G$g_CatchEnemy$0_0$0==.
_g_CatchEnemy::
	.ds 1
G$g_DelayCatchEnemy$0_0$0==.
_g_DelayCatchEnemy::
	.ds 1
G$isCatch$0_0$0==.
_isCatch::
	.ds 1
G$g_Fire$0_0$0==.
_g_Fire::
	.ds 1
G$g_Lives$0_0$0==.
_g_Lives::
	.ds 3
G$g_CacheLevel$0_0$0==.
_g_CacheLevel::
	.ds 6
G$g_CountItem$0_0$0==.
_g_CountItem::
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
	G$readInputControl$0$0	= .
	.globl	G$readInputControl$0$0
	C$the_castel.c$209$0_0$553	= .
	.globl	C$the_castel.c$209$0_0$553
;./the-castel.c:209: void readInputControl()
;	---------------------------------
; Function readInputControl
; ---------------------------------
_readInputControl::
	C$the_castel.c$211$1_0$553	= .
	.globl	C$the_castel.c$211$1_0$553
;./the-castel.c:211: u8 row8 = Keyboard_Read(8);
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	c, l
	C$the_castel.c$213$1_0$553	= .
	.globl	C$the_castel.c$213$1_0$553
;./the-castel.c:213: g_Player.Input = 0;
	ld	de, #_g_Player+5
	xor	a, a
	C$the_castel.c$214$1_0$553	= .
	.globl	C$the_castel.c$214$1_0$553
;./the-castel.c:214: if (isMoveRight(row8, g_Player.Input))
	ld	(de), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, c
	call	_isMoveRight
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00102$
	C$the_castel.c$216$2_0$554	= .
	.globl	C$the_castel.c$216$2_0$554
;./the-castel.c:216: g_Player.Input |= INPUT_RIGHT;
	ld	a, (de)
	set	0, a
	ld	(de), a
00102$:
	C$the_castel.c$218$1_0$553	= .
	.globl	C$the_castel.c$218$1_0$553
;./the-castel.c:218: if (isMoveLeft(row8, g_Player.Input))
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, c
	call	_isMoveLeft
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00104$
	C$the_castel.c$220$2_0$555	= .
	.globl	C$the_castel.c$220$2_0$555
;./the-castel.c:220: g_Player.Input |= INPUT_LEFT;
	ld	a, (de)
	set	1, a
	ld	(de), a
00104$:
	C$the_castel.c$222$1_0$553	= .
	.globl	C$the_castel.c$222$1_0$553
;./the-castel.c:222: if (isMoveJump(row8, g_Player.Input))
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, c
	call	_isMoveJump
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00106$
	C$the_castel.c$224$2_0$556	= .
	.globl	C$the_castel.c$224$2_0$556
;./the-castel.c:224: g_Player.Input |= INPUT_JUMP;
	ld	a, (de)
	set	2, a
	ld	(de), a
00106$:
	C$the_castel.c$226$1_0$553	= .
	.globl	C$the_castel.c$226$1_0$553
;./the-castel.c:226: if (isInteractObject(row8, g_Player.Input))
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	a, c
	call	_isInteractObject
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00108$
	C$the_castel.c$228$2_0$557	= .
	.globl	C$the_castel.c$228$2_0$557
;./the-castel.c:228: g_Player.Input |= INPUT_GET;
	ld	a, (de)
	set	3, a
	ld	(de), a
00108$:
	C$the_castel.c$231$1_0$553	= .
	.globl	C$the_castel.c$231$1_0$553
;./the-castel.c:231: g_PrevRow8 = row8;
	ld	hl, #_g_PrevRow8
	ld	(hl), c
	C$the_castel.c$232$1_0$553	= .
	.globl	C$the_castel.c$232$1_0$553
;./the-castel.c:232: }
	C$the_castel.c$232$1_0$553	= .
	.globl	C$the_castel.c$232$1_0$553
	XG$readInputControl$0$0	= .
	.globl	XG$readInputControl$0$0
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
G$g_PlayerSpriteLayers$0_0$0 == .
_g_PlayerSpriteLayers:
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x00	; 0
G$g_PlayerFramesIdle$0_0$0 == .
_g_PlayerFramesIdle:
	.db #0x40	; 64
	.db #0x40	; 64
	.dw #0x0000
	.db #0x20	; 32
	.db #0x18	; 24
	.dw #0x0000
G$g_PlayerFramesMove$0_0$0 == .
_g_PlayerFramesMove:
	.db #0x30	; 48	'0'
	.db #0x0a	; 10
	.dw #0x0000
G$g_PlayerFramesMoveRight$0_0$0 == .
_g_PlayerFramesMoveRight:
	.db #0x70	; 112	'p'
	.db #0x0a	; 10
	.dw #0x0000
G$g_PlayerFramesJump$0_0$0 == .
_g_PlayerFramesJump:
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.dw #0x0000
G$g_PlayerFramesFall$0_0$0 == .
_g_PlayerFramesFall:
	.db #0x60	; 96
	.db #0x04	; 4
	.dw #0x0000
G$g_PlayerAnimActions$0_0$0 == .
_g_PlayerAnimActions:
	.dw _g_PlayerFramesIdle
	.db #0x02	; 2
	.db 0x03
	.dw _g_PlayerFramesMove
	.db #0x01	; 1
	.db 0x03
	.dw _g_PlayerFramesJump
	.db #0x01	; 1
	.db 0x03
	.dw _g_PlayerFramesFall
	.db #0x01	; 1
	.db 0x03
	.dw _g_PlayerFramesMoveRight
	.db #0x01	; 1
	.db 0x03
	G$initLife$0$0	= .
	.globl	G$initLife$0$0
	C$the_castel.c$243$1_0$558	= .
	.globl	C$the_castel.c$243$1_0$558
;./the-castel.c:243: void initLife()
;	---------------------------------
; Function initLife
; ---------------------------------
_initLife::
	C$the_castel.c$245$1_0$558	= .
	.globl	C$the_castel.c$245$1_0$558
;./the-castel.c:245: g_Player.Life = MAX_LIVES;
	ld	hl, #(_g_Player + 7)
	ld	(hl), #0x03
	C$the_castel.c$247$1_0$558	= .
	.globl	C$the_castel.c$247$1_0$558
;./the-castel.c:247: Mem_Set(TILE_HEART, g_Lives, (3 * sizeof(g_Lives[0])));
	ld	hl, #0x0003
	push	hl
	ld	de, #_g_Lives
	ld	a, #0x4f
	call	_Mem_Set
	C$the_castel.c$248$1_0$558	= .
	.globl	C$the_castel.c$248$1_0$558
;./the-castel.c:248: }
	C$the_castel.c$248$1_0$558	= .
	.globl	C$the_castel.c$248$1_0$558
	XG$initLife$0$0	= .
	.globl	XG$initLife$0$0
	ret
	G$addLife$0$0	= .
	.globl	G$addLife$0$0
	C$the_castel.c$255$1_0$559	= .
	.globl	C$the_castel.c$255$1_0$559
;./the-castel.c:255: bool addLife()
;	---------------------------------
; Function addLife
; ---------------------------------
_addLife::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	C$the_castel.c$257$3_0$560	= .
	.globl	C$the_castel.c$257$3_0$560
;./the-castel.c:257: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	-1 (ix), #0x00
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00103$
	C$the_castel.c$259$3_0$561	= .
	.globl	C$the_castel.c$259$3_0$561
;./the-castel.c:259: if (g_Lives[i] == EMPTY_ITEM)
	ld	de, #_g_Lives+0
	ld	a, e
	add	a, c
	ld	e, a
	jr	NC, 00124$
	inc	d
00124$:
	ld	a, (de)
	or	a, a
	jr	NZ, 00106$
	C$the_castel.c$261$4_0$562	= .
	.globl	C$the_castel.c$261$4_0$562
;./the-castel.c:261: g_Player.Life++;
	ld	bc, #_g_Player+7
	ld	a, (bc)
	inc	a
	ld	(bc), a
	C$the_castel.c$262$4_0$562	= .
	.globl	C$the_castel.c$262$4_0$562
;./the-castel.c:262: g_Lives[i] = TILE_HEART;
	ld	a, #0x4f
	ld	(de), a
	C$the_castel.c$264$4_0$562	= .
	.globl	C$the_castel.c$264$4_0$562
;./the-castel.c:264: setTile(220 + i * 16, (u8)(4), TILE_HEART);
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xdc
	ld	c, a
	ld	a, #0x4f
	push	af
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
	C$the_castel.c$265$4_0$562	= .
	.globl	C$the_castel.c$265$4_0$562
;./the-castel.c:265: return TRUE;
	ld	a, #0x01
	jp	00107$
00106$:
	C$the_castel.c$257$2_0$560	= .
	.globl	C$the_castel.c$257$2_0$560
;./the-castel.c:257: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	ld	-1 (ix), c
	jp	00105$
00103$:
	C$the_castel.c$268$1_0$559	= .
	.globl	C$the_castel.c$268$1_0$559
;./the-castel.c:268: return FALSE;
	xor	a, a
00107$:
	C$the_castel.c$269$1_0$559	= .
	.globl	C$the_castel.c$269$1_0$559
;./the-castel.c:269: }
	inc	sp
	pop	ix
	C$the_castel.c$269$1_0$559	= .
	.globl	C$the_castel.c$269$1_0$559
	XG$addLife$0$0	= .
	.globl	XG$addLife$0$0
	ret
	G$removeLife$0$0	= .
	.globl	G$removeLife$0$0
	C$the_castel.c$276$1_0$563	= .
	.globl	C$the_castel.c$276$1_0$563
;./the-castel.c:276: bool removeLife()
;	---------------------------------
; Function removeLife
; ---------------------------------
_removeLife::
	C$the_castel.c$279$1_0$563	= .
	.globl	C$the_castel.c$279$1_0$563
;./the-castel.c:279: if (hasItemInInventory(TILE_AMPHORA))
	ld	a, #0x5f
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00105$
	C$the_castel.c$281$2_0$564	= .
	.globl	C$the_castel.c$281$2_0$564
;./the-castel.c:281: if (g_ImmunityCount < IMMUNITY)
	ld	a, (_g_ImmunityCount+0)
	sub	a, #0x03
	jr	NC, 00102$
	C$the_castel.c$283$3_0$565	= .
	.globl	C$the_castel.c$283$3_0$565
;./the-castel.c:283: g_ImmunityCount++;
	ld	hl, #_g_ImmunityCount
	inc	(hl)
	jp	00103$
00102$:
	C$the_castel.c$287$3_0$566	= .
	.globl	C$the_castel.c$287$3_0$566
;./the-castel.c:287: removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	ld	bc, #_g_Levels+0
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	b, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, #0x5f
	call	_removeItemFromInventory
00103$:
	C$the_castel.c$289$2_0$564	= .
	.globl	C$the_castel.c$289$2_0$564
;./the-castel.c:289: return TRUE;
	ld	a, #0x01
	ret
00105$:
	C$the_castel.c$292$3_0$567	= .
	.globl	C$the_castel.c$292$3_0$567
;./the-castel.c:292: for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	ld	c, #0x02
	ld	e, c
00110$:
	bit	7, e
	jr	NZ, 00108$
	C$the_castel.c$295$3_0$568	= .
	.globl	C$the_castel.c$295$3_0$568
;./the-castel.c:295: if (g_Lives[i] == TILE_HEART)
	ld	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #<(_g_Lives)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_g_Lives)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	C$the_castel.c$297$4_0$569	= .
	.globl	C$the_castel.c$297$4_0$569
;./the-castel.c:297: g_Lives[i] = EMPTY_ITEM;
	sub	a,#0x4f
	jr	NZ, 00111$
	ld	(hl),a
	C$the_castel.c$298$4_0$569	= .
	.globl	C$the_castel.c$298$4_0$569
;./the-castel.c:298: setTile(220 + i * 16, (u8)(4), 0);
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xdc
	ld	b, a
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_setTile
	pop	bc
	C$the_castel.c$299$4_0$569	= .
	.globl	C$the_castel.c$299$4_0$569
;./the-castel.c:299: g_Player.Life--;
	ld	de, #_g_Player+7
	ld	a, (de)
	dec	a
	ld	(de), a
	C$the_castel.c$300$4_0$569	= .
	.globl	C$the_castel.c$300$4_0$569
;./the-castel.c:300: return (i > 0);
	xor	a, a
	sub	a, c
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	rlca
	and	a,#0x01
	ret
00111$:
	C$the_castel.c$292$2_0$567	= .
	.globl	C$the_castel.c$292$2_0$567
;./the-castel.c:292: for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	dec	e
	ld	c, e
	jp	00110$
00108$:
	C$the_castel.c$304$1_0$563	= .
	.globl	C$the_castel.c$304$1_0$563
;./the-castel.c:304: return FALSE;
	xor	a, a
	C$the_castel.c$305$1_0$563	= .
	.globl	C$the_castel.c$305$1_0$563
;./the-castel.c:305: }
	C$the_castel.c$305$1_0$563	= .
	.globl	C$the_castel.c$305$1_0$563
	XG$removeLife$0$0	= .
	.globl	XG$removeLife$0$0
	ret
	G$hasLives$0$0	= .
	.globl	G$hasLives$0$0
	C$the_castel.c$311$1_0$570	= .
	.globl	C$the_castel.c$311$1_0$570
;./the-castel.c:311: bool hasLives()
;	---------------------------------
; Function hasLives
; ---------------------------------
_hasLives::
	C$the_castel.c$313$3_0$572	= .
	.globl	C$the_castel.c$313$3_0$572
;./the-castel.c:313: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00103$
	C$the_castel.c$315$3_0$572	= .
	.globl	C$the_castel.c$315$3_0$572
;./the-castel.c:315: if (g_Lives[i] == TILE_HEART)
	ld	hl, #_g_Lives
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x4f
	jr	NZ, 00106$
	C$the_castel.c$317$4_0$573	= .
	.globl	C$the_castel.c$317$4_0$573
;./the-castel.c:317: return TRUE;
	ld	a, #0x01
	ret
00106$:
	C$the_castel.c$313$2_0$571	= .
	.globl	C$the_castel.c$313$2_0$571
;./the-castel.c:313: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	jp	00105$
00103$:
	C$the_castel.c$320$1_0$570	= .
	.globl	C$the_castel.c$320$1_0$570
;./the-castel.c:320: return FALSE;
	xor	a, a
	C$the_castel.c$321$1_0$570	= .
	.globl	C$the_castel.c$321$1_0$570
;./the-castel.c:321: }
	C$the_castel.c$321$1_0$570	= .
	.globl	C$the_castel.c$321$1_0$570
	XG$hasLives$0$0	= .
	.globl	XG$hasLives$0$0
	ret
	G$displayLife$0$0	= .
	.globl	G$displayLife$0$0
	C$the_castel.c$328$1_0$575	= .
	.globl	C$the_castel.c$328$1_0$575
;./the-castel.c:328: void displayLife()
;	---------------------------------
; Function displayLife
; ---------------------------------
_displayLife::
	C$the_castel.c$330$3_0$576	= .
	.globl	C$the_castel.c$330$3_0$576
;./the-castel.c:330: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
	C$the_castel.c$332$3_0$576	= .
	.globl	C$the_castel.c$332$3_0$576
;./the-castel.c:332: setTile(220 + i * 16, (u8)(4), g_Lives[i]);
	ld	hl, #_g_Lives
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xdc
	ld	e, a
	push	bc
	push	bc
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_setTile
	pop	bc
	C$the_castel.c$330$2_0$575	= .
	.globl	C$the_castel.c$330$2_0$575
;./the-castel.c:330: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	C$the_castel.c$334$2_0$575	= .
	.globl	C$the_castel.c$334$2_0$575
;./the-castel.c:334: }
	C$the_castel.c$334$2_0$575	= .
	.globl	C$the_castel.c$334$2_0$575
	XG$displayLife$0$0	= .
	.globl	XG$displayLife$0$0
	jp	00103$
	G$physicsEventPlayer$0$0	= .
	.globl	G$physicsEventPlayer$0$0
	C$the_castel.c$346$2_0$578	= .
	.globl	C$the_castel.c$346$2_0$578
;./the-castel.c:346: void physicsEventPlayer(u8 event, u8 tile)
;	---------------------------------
; Function physicsEventPlayer
; ---------------------------------
_physicsEventPlayer::
	C$the_castel.c$349$1_0$578	= .
	.globl	C$the_castel.c$349$1_0$578
;./the-castel.c:349: switch (event)
	or	a,a
	jr	Z, 00102$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x05
	ret	NZ
	C$the_castel.c$352$2_0$579	= .
	.globl	C$the_castel.c$352$2_0$579
;./the-castel.c:352: case PAWN_PHYSICS_COL_DOWN:
00102$:
	C$the_castel.c$353$2_0$579	= .
	.globl	C$the_castel.c$353$2_0$579
;./the-castel.c:353: g_Player.bInAir = FALSE;
	ld	hl, #(_g_Player + 1)
	ld	(hl), #0x00
	C$the_castel.c$354$2_0$579	= .
	.globl	C$the_castel.c$354$2_0$579
;./the-castel.c:354: break;
	ret
	C$the_castel.c$356$2_0$579	= .
	.globl	C$the_castel.c$356$2_0$579
;./the-castel.c:356: case PAWN_PHYSICS_FALL: // Handle falling
00103$:
	C$the_castel.c$357$2_0$579	= .
	.globl	C$the_castel.c$357$2_0$579
;./the-castel.c:357: if (!g_Player.bInAir)
	ld	hl, #_g_Player + 1
	ld	a, (hl)
	or	a, a
	ret	NZ
	C$the_castel.c$359$3_0$580	= .
	.globl	C$the_castel.c$359$3_0$580
;./the-castel.c:359: g_Player.bInAir = TRUE;
	ld	(hl), #0x01
	C$the_castel.c$360$3_0$580	= .
	.globl	C$the_castel.c$360$3_0$580
;./the-castel.c:360: g_Player.VelocityY = 0;
	ld	hl, #(_g_Player + 2)
	ld	(hl), #0x00
	C$the_castel.c$363$1_0$578	= .
	.globl	C$the_castel.c$363$1_0$578
;./the-castel.c:363: };
	C$the_castel.c$364$1_0$578	= .
	.globl	C$the_castel.c$364$1_0$578
;./the-castel.c:364: }
	C$the_castel.c$364$1_0$578	= .
	.globl	C$the_castel.c$364$1_0$578
	XG$physicsEventPlayer$0$0	= .
	.globl	XG$physicsEventPlayer$0$0
	ret
	G$physicsCollision$0$0	= .
	.globl	G$physicsCollision$0$0
	C$the_castel.c$371$1_0$582	= .
	.globl	C$the_castel.c$371$1_0$582
;./the-castel.c:371: bool physicsCollision(u8 tile)
;	---------------------------------
; Function physicsCollision
; ---------------------------------
_physicsCollision::
	ld	c, a
	C$the_castel.c$373$1_0$582	= .
	.globl	C$the_castel.c$373$1_0$582
;./the-castel.c:373: return (tile > 110 && tile < 184);
	ld	a, #0x6e
	sub	a, c
	jr	NC, 00103$
	ld	a, c
	sub	a, #0xb8
	jr	C, 00104$
00103$:
	xor	a, a
	ret
00104$:
	ld	a, #0x01
	C$the_castel.c$374$1_0$582	= .
	.globl	C$the_castel.c$374$1_0$582
;./the-castel.c:374: }
	C$the_castel.c$374$1_0$582	= .
	.globl	C$the_castel.c$374$1_0$582
	XG$physicsCollision$0$0	= .
	.globl	XG$physicsCollision$0$0
	ret
	G$physicsCollisionEnemy$0$0	= .
	.globl	G$physicsCollisionEnemy$0$0
	C$the_castel.c$382$1_0$584	= .
	.globl	C$the_castel.c$382$1_0$584
;./the-castel.c:382: bool physicsCollisionEnemy(u8 x, u8 y)
;	---------------------------------
; Function physicsCollisionEnemy
; ---------------------------------
_physicsCollisionEnemy::
	C$the_castel.c$384$1_0$584	= .
	.globl	C$the_castel.c$384$1_0$584
;./the-castel.c:384: return ((getTile(x, y) >= 100) /*|| getTile(x, y) == 0 */);
	call	_getTile
	sub	a, #0x64
	ld	a, #0x00
	rla
	xor	a, #0x01
	C$the_castel.c$385$1_0$584	= .
	.globl	C$the_castel.c$385$1_0$584
;./the-castel.c:385: }
	C$the_castel.c$385$1_0$584	= .
	.globl	C$the_castel.c$385$1_0$584
	XG$physicsCollisionEnemy$0$0	= .
	.globl	XG$physicsCollisionEnemy$0$0
	ret
	G$physicsCollisionPlayerAndGenericEnemy$0$0	= .
	.globl	G$physicsCollisionPlayerAndGenericEnemy$0$0
	C$the_castel.c$394$1_0$586	= .
	.globl	C$the_castel.c$394$1_0$586
;./the-castel.c:394: void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber)
;	---------------------------------
; Function physicsCollisionPlayerAndGenericEnemy
; ---------------------------------
_physicsCollisionPlayerAndGenericEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	c, l
	ld	b, h
	ld	-3 (ix), e
	ld	-2 (ix), d
	C$the_castel.c$396$1_0$586	= .
	.globl	C$the_castel.c$396$1_0$586
;./the-castel.c:396: if (g_ReverseCount > 0)
	ld	a, (_g_ReverseCount+0)
	or	a, a
	jr	Z, 00115$
	C$the_castel.c$397$1_0$586	= .
	.globl	C$the_castel.c$397$1_0$586
;./the-castel.c:397: g_ReverseCount--;
	ld	iy, #_g_ReverseCount
	dec	0 (iy)
	jp	00121$
00115$:
	C$the_castel.c$400$2_0$587	= .
	.globl	C$the_castel.c$400$2_0$587
;./the-castel.c:400: Game_Pawn *pawn = &ply->Pawn;
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
	C$the_castel.c$402$7_0$592	= .
	.globl	C$the_castel.c$402$7_0$592
;./the-castel.c:402: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	sp
	inc	sp
	push	de
	ld	-1 (ix), #0x00
00119$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jp	NC, 00121$
	C$the_castel.c$404$4_0$589	= .
	.globl	C$the_castel.c$404$4_0$589
;./the-castel.c:404: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	add	hl, bc
	push	hl
	pop	iy
	C$the_castel.c$405$4_0$589	= .
	.globl	C$the_castel.c$405$4_0$589
;./the-castel.c:405: if (enemy->State == 1)
	push	iy
	pop	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	dec	a
	jp	NZ,00120$
	C$the_castel.c$407$5_0$590	= .
	.globl	C$the_castel.c$407$5_0$590
;./the-castel.c:407: if (collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY))
	push	iy
	pop	hl
	inc	hl
	ld	a, (hl)
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0006
	add	hl, bc
	pop	bc
	ld	l, (hl)
;	spillPairReg hl
	sub	a, l
	ld	-4 (ix), a
	ld	a, 0 (iy)
	ld	hl, #5
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	sub	a, l
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	iy
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_collisionCheck
	pop	iy
	pop	de
	pop	bc
	or	a, a
	jp	Z, 00120$
	C$the_castel.c$409$6_0$591	= .
	.globl	C$the_castel.c$409$6_0$591
;./the-castel.c:409: if (hasItemInInventory(TILE_CRUCIFIX))
	push	bc
	push	de
	push	iy
	ld	a, #0x68
	call	_hasItemInInventory
	pop	iy
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00107$
;./the-castel.c:412: VDP_HideSprite(enemy->SpriteId);
	push	iy
	pop	hl
	push	bc
	ld	bc, #0x0008
	add	hl, bc
	pop	bc
	ld	h, (hl)
;	spillPairReg hl
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:1213: inline void VDP_HideSprite(u8 index) { VDP_SetSpritePositionY(index, VDP_SPRITE_HIDE); }
	push	bc
	push	de
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_VDP_SetSpritePositionY
	pop	de
	pop	bc
	C$the_castel.c$413$7_0$592	= .
	.globl	C$the_castel.c$413$7_0$592
;./the-castel.c:413: enemy->State = 0;
	xor	a, a
	ld	(bc), a
	C$the_castel.c$414$7_0$592	= .
	.globl	C$the_castel.c$414$7_0$592
;./the-castel.c:414: removeItemFromInventory(TILE_CRUCIFIX, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_g_Levels
	add	hl,bc
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	push	af
	ld	a, (bc)
	ld	c, a
	pop	af
	push	de
	push	af
	ld	a, l
	inc	sp
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x68
	call	_removeItemFromInventory
	pop	de
	jp	00120$
00107$:
	C$the_castel.c$418$7_0$593	= .
	.globl	C$the_castel.c$418$7_0$593
;./the-castel.c:418: g_ReverseCount = 60;
	ld	hl, #_g_ReverseCount
	ld	(hl), #0x3c
	C$the_castel.c$419$7_0$593	= .
	.globl	C$the_castel.c$419$7_0$593
;./the-castel.c:419: if (removeLife() == TRUE)
	push	de
	call	_removeLife
	pop	de
	dec	a
	jr	NZ, 00104$
	C$the_castel.c$421$8_0$594	= .
	.globl	C$the_castel.c$421$8_0$594
;./the-castel.c:421: displayLife();
	push	de
	call	_displayLife
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
	pop	de
	jp	00120$
00104$:
	C$the_castel.c$426$8_0$595	= .
	.globl	C$the_castel.c$426$8_0$595
;./the-castel.c:426: if (!hasLives())
	push	de
	call	_hasLives
	pop	de
	or	a, a
	jr	NZ, 00120$
	C$the_castel.c$428$9_0$596	= .
	.globl	C$the_castel.c$428$9_0$596
;./the-castel.c:428: stopMusicPlayback();
	push	de
	call	_stopMusicPlayback
	ld	hl, #_State_GameOver
	call	_Game_SetState
	pop	de
00120$:
	C$the_castel.c$402$3_0$588	= .
	.globl	C$the_castel.c$402$3_0$588
;./the-castel.c:402: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	-1 (ix)
	jp	00119$
00121$:
	C$the_castel.c$437$1_0$586	= .
	.globl	C$the_castel.c$437$1_0$586
;./the-castel.c:437: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$collisionCheck$0$0	= .
	.globl	G$collisionCheck$0$0
	C$the_castel.c$445$1_0$601	= .
	.globl	C$the_castel.c$445$1_0$601
;./the-castel.c:445: bool collisionCheck(i8 dx, i8 dy)
;	---------------------------------
; Function collisionCheck
; ---------------------------------
_collisionCheck::
	ld	c, a
	ld	b, l
	C$the_castel.c$447$1_0$601	= .
	.globl	C$the_castel.c$447$1_0$601
;./the-castel.c:447: u16 sqrtDist = (dx * dx) + (dy * dy);
	push	bc
;	spillPairReg hl
;	spillPairReg hl
	ld	a,c
	ld	l,a
	call	__mulschar
	pop	bc
	push	de
;	spillPairReg hl
;	spillPairReg hl
	ld	a,b
	ld	l,a
	call	__mulschar
	ex	de, hl
	pop	de
	add	hl, de
	C$the_castel.c$448$1_0$601	= .
	.globl	C$the_castel.c$448$1_0$601
;./the-castel.c:448: if (sqrtDist < 13 * 13)
	ld	de, #0x00a9
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
	C$the_castel.c$450$2_0$602	= .
	.globl	C$the_castel.c$450$2_0$602
;./the-castel.c:450: return TRUE;
	ld	a, #0x01
	ret
00102$:
	C$the_castel.c$454$2_0$603	= .
	.globl	C$the_castel.c$454$2_0$603
;./the-castel.c:454: return FALSE;
	xor	a, a
	C$the_castel.c$456$1_0$601	= .
	.globl	C$the_castel.c$456$1_0$601
;./the-castel.c:456: }
	C$the_castel.c$456$1_0$601	= .
	.globl	C$the_castel.c$456$1_0$601
	XG$collisionCheck$0$0	= .
	.globl	XG$collisionCheck$0$0
	ret
	G$pursuitCheck$0$0	= .
	.globl	G$pursuitCheck$0$0
	C$the_castel.c$465$1_0$606	= .
	.globl	C$the_castel.c$465$1_0$606
;./the-castel.c:465: void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 enemyNumber)
;	---------------------------------
; Function pursuitCheck
; ---------------------------------
_pursuitCheck::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$the_castel.c$467$1_0$605	= .
	.globl	C$the_castel.c$467$1_0$605
;./the-castel.c:467: Game_Pawn *pawn = &g_Player.Pawn;
	C$the_castel.c$469$3_0$607	= .
	.globl	C$the_castel.c$469$3_0$607
;./the-castel.c:469: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	ld	a, (#(_g_Player + 8) + 6)
	ld	-5 (ix), a
	ld	c, #0x00
00117$:
	ld	a, c
	sub	a, 4 (ix)
	jp	NC, 00119$
	C$the_castel.c$471$3_0$607	= .
	.globl	C$the_castel.c$471$3_0$607
;./the-castel.c:471: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	add	hl, de
	ex	de, hl
	C$the_castel.c$472$3_0$607	= .
	.globl	C$the_castel.c$472$3_0$607
;./the-castel.c:472: i8 dx = enemy->X - pawn->PositionX;
	ld	a, (de)
	ld	-4 (ix), a
	ld	a, (#(_g_Player + 8) + 5)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sub	a, -3 (ix)
	ld	b, a
	C$the_castel.c$473$3_0$607	= .
	.globl	C$the_castel.c$473$3_0$607
;./the-castel.c:473: i8 dy = enemy->Y - pawn->PositionY;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	sub	a, -5 (ix)
	C$the_castel.c$475$3_0$607	= .
	.globl	C$the_castel.c$475$3_0$607
;./the-castel.c:475: if (dy == 0 && (((dx * dx) > MIN_DISTANCE_MAGNENT) && ((dx * dx) < MAX_DISTANCE_MAGNENT)))
	or	a, a
	jp	NZ, 00111$
	push	bc
	push	de
;	spillPairReg hl
;	spillPairReg hl
	ld	a,b
	ld	l,a
	call	__mulschar
	ex	de, hl
	pop	de
	pop	bc
	ld	a, #0x64
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00161$
	xor	a, #0x80
00161$:
	jp	P, 00111$
	ld	a, l
	sub	a, #0xe8
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x83
	jr	NC, 00111$
	C$the_castel.c$477$4_0$608	= .
	.globl	C$the_castel.c$477$4_0$608
;./the-castel.c:477: if (isCatch)
	ld	a, (_isCatch+0)
	or	a, a
	jr	Z, 00108$
	C$the_castel.c$479$5_0$609	= .
	.globl	C$the_castel.c$479$5_0$609
;./the-castel.c:479: if (g_CatchEnemy - g_DelayCatchEnemy > DELAY_CATCH_ENEMY)
	ld	a, (_g_CatchEnemy+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_DelayCatchEnemy+0)
	ld	c, a
	ld	b, #0x00
	cp	a, a
	sbc	hl, bc
	ld	a, #0x01
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	P, 00105$
	C$the_castel.c$482$2_0$606	= .
	.globl	C$the_castel.c$482$2_0$606
;./the-castel.c:482: enemy->Direction = 1;
	ld	hl, #0x0004
	add	hl, de
	C$the_castel.c$481$6_0$610	= .
	.globl	C$the_castel.c$481$6_0$610
;./the-castel.c:481: if (pawn->PositionX > enemy->X)
	ld	a, -4 (ix)
	sub	a, -3 (ix)
	jr	NC, 00102$
	C$the_castel.c$482$6_0$610	= .
	.globl	C$the_castel.c$482$6_0$610
;./the-castel.c:482: enemy->Direction = 1;
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	jp	00103$
00102$:
	C$the_castel.c$484$6_0$610	= .
	.globl	C$the_castel.c$484$6_0$610
;./the-castel.c:484: enemy->Direction = -1;
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
00103$:
	C$the_castel.c$486$6_0$610	= .
	.globl	C$the_castel.c$486$6_0$610
;./the-castel.c:486: isCatch = FALSE;
	ld	iy, #_isCatch
	ld	0 (iy), #0x00
	jp	00119$
00105$:
	C$the_castel.c$490$6_0$611	= .
	.globl	C$the_castel.c$490$6_0$611
;./the-castel.c:490: g_DelayCatchEnemy--;
	ld	iy, #_g_DelayCatchEnemy
	dec	0 (iy)
	jp	00119$
00108$:
	C$the_castel.c$495$5_0$612	= .
	.globl	C$the_castel.c$495$5_0$612
;./the-castel.c:495: isCatch = TRUE;
	ld	iy, #_isCatch
	ld	0 (iy), #0x01
	C$the_castel.c$498$4_0$608	= .
	.globl	C$the_castel.c$498$4_0$608
;./the-castel.c:498: break;
	jp	00119$
00111$:
	C$the_castel.c$502$4_0$613	= .
	.globl	C$the_castel.c$502$4_0$613
;./the-castel.c:502: g_DelayCatchEnemy = g_CatchEnemy;
	ld	a, (_g_CatchEnemy+0)
	ld	(_g_DelayCatchEnemy+0), a
	C$the_castel.c$503$4_0$613	= .
	.globl	C$the_castel.c$503$4_0$613
;./the-castel.c:503: isCatch = FALSE;
	ld	iy, #_isCatch
	ld	0 (iy), #0x00
	C$the_castel.c$469$2_0$606	= .
	.globl	C$the_castel.c$469$2_0$606
;./the-castel.c:469: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	c
	jp	00117$
00119$:
	C$the_castel.c$506$2_0$606	= .
	.globl	C$the_castel.c$506$2_0$606
;./the-castel.c:506: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$isUnderTheWater$0$0	= .
	.globl	G$isUnderTheWater$0$0
	C$the_castel.c$514$2_0$615	= .
	.globl	C$the_castel.c$514$2_0$615
;./the-castel.c:514: bool isUnderTheWater(u8 x, u8 y)
;	---------------------------------
; Function isUnderTheWater
; ---------------------------------
_isUnderTheWater::
	C$the_castel.c$516$1_0$615	= .
	.globl	C$the_castel.c$516$1_0$615
;./the-castel.c:516: return (getTile(x, y) == TILE_WATER);
	call	_getTile
	sub	a, #0x50
	ld	a, #0x01
	ret	Z
	xor	a, a
	C$the_castel.c$517$1_0$615	= .
	.globl	C$the_castel.c$517$1_0$615
;./the-castel.c:517: }
	C$the_castel.c$517$1_0$615	= .
	.globl	C$the_castel.c$517$1_0$615
	XG$isUnderTheWater$0$0	= .
	.globl	XG$isUnderTheWater$0$0
	ret
	G$setColorTiles$0$0	= .
	.globl	G$setColorTiles$0$0
	C$the_castel.c$524$1_0$616	= .
	.globl	C$the_castel.c$524$1_0$616
;./the-castel.c:524: void setColorTiles()
;	---------------------------------
; Function setColorTiles
; ---------------------------------
_setColorTiles::
	C$the_castel.c$526$1_0$616	= .
	.globl	C$the_castel.c$526$1_0$616
;./the-castel.c:526: VDP_FillVRAM_16K(0X80, g_ScreenColorLow + 8, 2); // VERDE 0XC0 - ROSSO CHIARO 0x60
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0008
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x80
	call	_VDP_FillVRAM_16K
	C$the_castel.c$527$1_0$616	= .
	.globl	C$the_castel.c$527$1_0$616
;./the-castel.c:527: VDP_FillVRAM_16K(0x70, g_ScreenColorLow + 10, 1);
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x000a
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x70
	call	_VDP_FillVRAM_16K
	C$the_castel.c$528$1_0$616	= .
	.globl	C$the_castel.c$528$1_0$616
;./the-castel.c:528: VDP_FillVRAM_16K(0xA0, g_ScreenColorLow + 12, 1); // GIALLO SCURO
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x000c
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0xa0
	call	_VDP_FillVRAM_16K
	C$the_castel.c$529$1_0$616	= .
	.globl	C$the_castel.c$529$1_0$616
;./the-castel.c:529: VDP_FillVRAM_16K(0xE0, g_ScreenColorLow + 18, 2); // GRIGIO
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0012
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0xe0
	call	_VDP_FillVRAM_16K
	C$the_castel.c$530$1_0$616	= .
	.globl	C$the_castel.c$530$1_0$616
;./the-castel.c:530: }
	C$the_castel.c$530$1_0$616	= .
	.globl	C$the_castel.c$530$1_0$616
	XG$setColorTiles$0$0	= .
	.globl	XG$setColorTiles$0$0
	ret
	G$foo$0$0	= .
	.globl	G$foo$0$0
	C$the_castel.c$544$1_0$619	= .
	.globl	C$the_castel.c$544$1_0$619
;./the-castel.c:544: void foo(u8 x, u8 y, u8 tile, u8 visible)
;	---------------------------------
; Function foo
; ---------------------------------
_foo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	b, a
	ld	c, l
	C$the_castel.c$546$1_0$619	= .
	.globl	C$the_castel.c$546$1_0$619
;./the-castel.c:546: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].x = x;
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0012
	add	hl, de
	ld	a, (_g_CountItem+0)
	add	a, a
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	ld	(hl), b
	C$the_castel.c$547$1_0$619	= .
	.globl	C$the_castel.c$547$1_0$619
;./the-castel.c:547: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].y = y;
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0012
	add	hl, de
	ld	a, (_g_CountItem+0)
	add	a, a
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	inc	hl
	ld	(hl), c
	C$the_castel.c$548$1_0$619	= .
	.globl	C$the_castel.c$548$1_0$619
;./the-castel.c:548: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].tile = tile;
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	bc, #0x0012
	add	hl, bc
	ld	a, (_g_CountItem+0)
	add	a, a
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	a, 4 (ix)
	ld	(hl), a
	C$the_castel.c$549$1_0$619	= .
	.globl	C$the_castel.c$549$1_0$619
;./the-castel.c:549: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].visible = visible;
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	bc, #0x0012
	add	hl, bc
	ld	a, (_g_CountItem+0)
	add	a, a
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	inc	hl
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
	C$the_castel.c$550$1_0$619	= .
	.globl	C$the_castel.c$550$1_0$619
;./the-castel.c:550: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$interact$0$0	= .
	.globl	G$interact$0$0
	C$the_castel.c$558$1_0$621	= .
	.globl	C$the_castel.c$558$1_0$621
;./the-castel.c:558: bool interact(u8 x, u8 y)
;	---------------------------------
; Function interact
; ---------------------------------
_interact::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	-1 (ix), a
	C$the_castel.c$560$1_0$621	= .
	.globl	C$the_castel.c$560$1_0$621
;./the-castel.c:560: u8 tile = getTile(x, y);
	ld	-2 (ix), l
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_getTile
	C$the_castel.c$564$1_0$621	= .
	.globl	C$the_castel.c$564$1_0$621
;./the-castel.c:564: switch (tile)
	ld	-3 (ix), a
	sub	a, #0x41
	jp	Z,00164$
	ld	a, -3 (ix)
	sub	a, #0x42
	jp	Z,00164$
	ld	a, -3 (ix)
	sub	a, #0x43
	jp	Z,00164$
	ld	a, -3 (ix)
	sub	a, #0x44
	jp	Z,00164$
	ld	a, -3 (ix)
	sub	a, #0x45
	jp	Z,00108$
	ld	a, -3 (ix)
	sub	a, #0x46
	jp	Z,00111$
	ld	a, -3 (ix)
	sub	a, #0x47
	jp	Z,00170$
	ld	a, -3 (ix)
	sub	a, #0x4a
	jp	Z,00117$
	ld	a, -3 (ix)
	sub	a, #0x4e
	jp	Z,00172$
	ld	a, -3 (ix)
	sub	a, #0x4f
	jr	Z, 00101$
	ld	a, -3 (ix)
	sub	a, #0x5f
	jp	Z,00125$
	ld	a, -3 (ix)
	sub	a, #0x60
	jp	Z,00122$
	ld	a, -3 (ix)
	sub	a, #0x61
	jp	Z,00123$
	ld	a, -3 (ix)
	sub	a, #0x62
	jp	Z,00124$
	ld	a, -3 (ix)
	sub	a, #0x68
	jp	Z,00128$
	jp	00129$
	C$the_castel.c$566$2_0$622	= .
	.globl	C$the_castel.c$566$2_0$622
;./the-castel.c:566: case TILE_HEART:
00101$:
	C$the_castel.c$567$2_0$622	= .
	.globl	C$the_castel.c$567$2_0$622
;./the-castel.c:567: if (addLife())
	call	_addLife
	or	a, a
	jr	Z, 00103$
	C$the_castel.c$569$3_0$623	= .
	.globl	C$the_castel.c$569$3_0$623
;./the-castel.c:569: foo(x, y, TILE_MASK_HEART, 1);
	ld	hl, #0x1bb
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_foo
	C$the_castel.c$570$3_0$623	= .
	.globl	C$the_castel.c$570$3_0$623
;./the-castel.c:570: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
	C$the_castel.c$572$3_0$623	= .
	.globl	C$the_castel.c$572$3_0$623
;./the-castel.c:572: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_setTile
	C$the_castel.c$573$3_0$623	= .
	.globl	C$the_castel.c$573$3_0$623
;./the-castel.c:573: PlayBankSFX(10, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_PlayBankSFX
00103$:
	C$the_castel.c$575$2_0$622	= .
	.globl	C$the_castel.c$575$2_0$622
;./the-castel.c:575: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$1222$1_0$621	= .
	.globl	C$the_castel.c$1222$1_0$621
;./the-castel.c:1222: else if (ply->bMoving)
00164$:
	ld	c, #0x00
00137$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00131$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00137$
;./the-castel.c:580: VDP_HideAllSprites();
00131$:
	C$the_castel.c$581$2_0$622	= .
	.globl	C$the_castel.c$581$2_0$622
;./the-castel.c:581: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	(sp), hl
	ld	a, #<(_g_Levels)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, #>(_g_Levels)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
	C$the_castel.c$582$2_0$622	= .
	.globl	C$the_castel.c$582$2_0$622
;./the-castel.c:582: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$583$2_0$622	= .
	.globl	C$the_castel.c$583$2_0$622
;./the-castel.c:583: case TILE_DOOR1:
00108$:
	C$the_castel.c$584$2_0$622	= .
	.globl	C$the_castel.c$584$2_0$622
;./the-castel.c:584: if (hasItemInInventory(TILE_KEY1))
	ld	a, #0x60
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00110$
	C$the_castel.c$586$3_0$624	= .
	.globl	C$the_castel.c$586$3_0$624
;./the-castel.c:586: changeLevel(x, y, TILE_KEY1, TILE_MASK_DOOR1);
	ld	hl, #0x4160
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_changeLevel
00110$:
	C$the_castel.c$588$2_0$622	= .
	.globl	C$the_castel.c$588$2_0$622
;./the-castel.c:588: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$589$2_0$622	= .
	.globl	C$the_castel.c$589$2_0$622
;./the-castel.c:589: case TILE_DOOR2:
00111$:
	C$the_castel.c$590$2_0$622	= .
	.globl	C$the_castel.c$590$2_0$622
;./the-castel.c:590: if (g_CurrRoomIdx == LAST_LEVEL)
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x13
	jr	NZ, 00115$
	C$the_castel.c$592$3_0$625	= .
	.globl	C$the_castel.c$592$3_0$625
;./the-castel.c:592: stopMusicPlayback();
	call	_stopMusicPlayback
	C$the_castel.c$593$3_0$625	= .
	.globl	C$the_castel.c$593$3_0$625
;./the-castel.c:593: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00116$
00115$:
	C$the_castel.c$597$3_0$626	= .
	.globl	C$the_castel.c$597$3_0$626
;./the-castel.c:597: if (hasItemInInventory(TILE_KEY2))
	ld	a, #0x61
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00116$
	C$the_castel.c$599$4_0$627	= .
	.globl	C$the_castel.c$599$4_0$627
;./the-castel.c:599: changeLevel(x, y, TILE_KEY2, TILE_MASK_DOOR2);
	ld	hl, #0x4261
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_changeLevel
00116$:
	C$the_castel.c$602$2_0$622	= .
	.globl	C$the_castel.c$602$2_0$622
;./the-castel.c:602: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$603$2_0$622	= .
	.globl	C$the_castel.c$603$2_0$622
;./the-castel.c:603: case TILE_DOOR3:
00117$:
	C$the_castel.c$604$2_0$622	= .
	.globl	C$the_castel.c$604$2_0$622
;./the-castel.c:604: if (hasItemInInventory(TILE_KEY3))
	ld	a, #0x62
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00119$
	C$the_castel.c$606$3_0$628	= .
	.globl	C$the_castel.c$606$3_0$628
;./the-castel.c:606: changeLevel(x, y, TILE_KEY3, TILE_MASK_DOOR3);
	ld	hl, #0x4362
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_changeLevel
00119$:
	C$the_castel.c$608$2_0$622	= .
	.globl	C$the_castel.c$608$2_0$622
;./the-castel.c:608: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$1222$1_0$621	= .
	.globl	C$the_castel.c$1222$1_0$621
;./the-castel.c:1222: else if (ply->bMoving)
00170$:
	ld	c, #0x00
00140$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00133$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00140$
;./the-castel.c:610: VDP_HideAllSprites();
00133$:
	C$the_castel.c$611$2_0$622	= .
	.globl	C$the_castel.c$611$2_0$622
;./the-castel.c:611: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.PrevDoorLevel);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	(sp), hl
	ld	a, #<(_g_Levels)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, #>(_g_Levels)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
	C$the_castel.c$612$2_0$622	= .
	.globl	C$the_castel.c$612$2_0$622
;./the-castel.c:612: return false;
	xor	a, a
	jp	00145$
	C$the_castel.c$1222$1_0$621	= .
	.globl	C$the_castel.c$1222$1_0$621
;./the-castel.c:1222: else if (ply->bMoving)
00172$:
	ld	c, #0x00
00143$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00135$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00143$
;./the-castel.c:614: VDP_HideAllSprites();
00135$:
	C$the_castel.c$615$2_0$622	= .
	.globl	C$the_castel.c$615$2_0$622
;./the-castel.c:615: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	(sp), hl
	ld	a, #<(_g_Levels)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, #>(_g_Levels)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
	C$the_castel.c$616$2_0$622	= .
	.globl	C$the_castel.c$616$2_0$622
;./the-castel.c:616: return false;
	xor	a, a
	jp	00145$
	C$the_castel.c$618$2_0$622	= .
	.globl	C$the_castel.c$618$2_0$622
;./the-castel.c:618: case TILE_KEY1:
00122$:
	C$the_castel.c$621$2_0$622	= .
	.globl	C$the_castel.c$621$2_0$622
;./the-castel.c:621: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY1);
	ld	h, #0xbd
	ld	l, -3 (ix)
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_replaceAndRemoveItem
	C$the_castel.c$622$2_0$622	= .
	.globl	C$the_castel.c$622$2_0$622
;./the-castel.c:622: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
	C$the_castel.c$624$2_0$622	= .
	.globl	C$the_castel.c$624$2_0$622
;./the-castel.c:624: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$625$2_0$622	= .
	.globl	C$the_castel.c$625$2_0$622
;./the-castel.c:625: case TILE_KEY2:
00123$:
	C$the_castel.c$628$2_0$622	= .
	.globl	C$the_castel.c$628$2_0$622
;./the-castel.c:628: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY2);
	ld	h, #0xbe
	ld	l, -3 (ix)
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_replaceAndRemoveItem
	C$the_castel.c$629$2_0$622	= .
	.globl	C$the_castel.c$629$2_0$622
;./the-castel.c:629: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
	C$the_castel.c$631$2_0$622	= .
	.globl	C$the_castel.c$631$2_0$622
;./the-castel.c:631: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$632$2_0$622	= .
	.globl	C$the_castel.c$632$2_0$622
;./the-castel.c:632: case TILE_KEY3:
00124$:
	C$the_castel.c$635$2_0$622	= .
	.globl	C$the_castel.c$635$2_0$622
;./the-castel.c:635: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY3);
	ld	h, #0xbf
	ld	l, -3 (ix)
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_replaceAndRemoveItem
	C$the_castel.c$636$2_0$622	= .
	.globl	C$the_castel.c$636$2_0$622
;./the-castel.c:636: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
	C$the_castel.c$638$2_0$622	= .
	.globl	C$the_castel.c$638$2_0$622
;./the-castel.c:638: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$639$2_0$622	= .
	.globl	C$the_castel.c$639$2_0$622
;./the-castel.c:639: case TILE_AMPHORA:
00125$:
	C$the_castel.c$642$2_0$622	= .
	.globl	C$the_castel.c$642$2_0$622
;./the-castel.c:642: if (!hasItemInInventory(TILE_AMPHORA))
	ld	a, #0x5f
	call	_hasItemInInventory
	or	a, a
	jr	NZ, 00127$
	C$the_castel.c$644$3_0$629	= .
	.globl	C$the_castel.c$644$3_0$629
;./the-castel.c:644: replaceAndRemoveItem(x, y, tile, TILE_MASK_AMPHORA);
	ld	h, #0xbc
	ld	l, -3 (ix)
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_replaceAndRemoveItem
	C$the_castel.c$645$3_0$629	= .
	.globl	C$the_castel.c$645$3_0$629
;./the-castel.c:645: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
00127$:
	C$the_castel.c$648$2_0$622	= .
	.globl	C$the_castel.c$648$2_0$622
;./the-castel.c:648: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$649$2_0$622	= .
	.globl	C$the_castel.c$649$2_0$622
;./the-castel.c:649: case TILE_CRUCIFIX:
00128$:
	C$the_castel.c$652$2_0$622	= .
	.globl	C$the_castel.c$652$2_0$622
;./the-castel.c:652: replaceAndRemoveItem(x, y, tile, TILE_EMPTY);
	xor	a, a
	push	af
	inc	sp
	ld	a, -3 (ix)
	push	af
	inc	sp
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_replaceAndRemoveItem
	C$the_castel.c$653$2_0$622	= .
	.globl	C$the_castel.c$653$2_0$622
;./the-castel.c:653: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
	C$the_castel.c$655$2_0$622	= .
	.globl	C$the_castel.c$655$2_0$622
;./the-castel.c:655: return TRUE;
	ld	a, #0x01
	jp	00145$
	C$the_castel.c$673$1_0$621	= .
	.globl	C$the_castel.c$673$1_0$621
;./the-castel.c:673: }
00129$:
	C$the_castel.c$675$1_0$621	= .
	.globl	C$the_castel.c$675$1_0$621
;./the-castel.c:675: updateScore();
	call	_updateScore
	C$the_castel.c$677$1_0$621	= .
	.globl	C$the_castel.c$677$1_0$621
;./the-castel.c:677: return FALSE;
	xor	a, a
00145$:
	C$the_castel.c$678$1_0$621	= .
	.globl	C$the_castel.c$678$1_0$621
;./the-castel.c:678: }
	ld	sp, ix
	pop	ix
	C$the_castel.c$678$1_0$621	= .
	.globl	C$the_castel.c$678$1_0$621
	XG$interact$0$0	= .
	.globl	XG$interact$0$0
	ret
	G$replaceAndRemoveItem$0$0	= .
	.globl	G$replaceAndRemoveItem$0$0
	C$the_castel.c$688$1_0$643	= .
	.globl	C$the_castel.c$688$1_0$643
;./the-castel.c:688: void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask)
;	---------------------------------
; Function replaceAndRemoveItem
; ---------------------------------
_replaceAndRemoveItem::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	b, l
	C$the_castel.c$690$1_0$643	= .
	.globl	C$the_castel.c$690$1_0$643
;./the-castel.c:690: foo(x, y, tileMask, 1);
	push	bc
	ld	h, #0x01
	ld	l, 5 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_foo
	pop	bc
	C$the_castel.c$691$1_0$643	= .
	.globl	C$the_castel.c$691$1_0$643
;./the-castel.c:691: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
	C$the_castel.c$693$1_0$643	= .
	.globl	C$the_castel.c$693$1_0$643
;./the-castel.c:693: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
	C$the_castel.c$694$1_0$643	= .
	.globl	C$the_castel.c$694$1_0$643
;./the-castel.c:694: addItemToInventory(tile, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	ld	bc, #_g_Levels+0
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	c, h
	push	bc
	ld	a, 4 (ix)
	call	_addItemToInventory
	C$the_castel.c$695$1_0$643	= .
	.globl	C$the_castel.c$695$1_0$643
;./the-castel.c:695: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$changeLevel$0$0	= .
	.globl	G$changeLevel$0$0
	C$the_castel.c$705$1_0$645	= .
	.globl	C$the_castel.c$705$1_0$645
;./the-castel.c:705: void changeLevel(u8 x, u8 y, u8 key, u8 door)
;	---------------------------------
; Function changeLevel
; ---------------------------------
_changeLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	b, l
	C$the_castel.c$707$1_0$645	= .
	.globl	C$the_castel.c$707$1_0$645
;./the-castel.c:707: removeItemFromInventory(key, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	push	bc
	push	af
	inc	sp
	push	hl
	inc	sp
	ld	a, 4 (ix)
	call	_removeItemFromInventory
	pop	bc
	C$the_castel.c$708$1_0$645	= .
	.globl	C$the_castel.c$708$1_0$645
;./the-castel.c:708: foo(x, y, door, 1);
	ld	h, #0x01
	ld	l, 5 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_foo
	C$the_castel.c$709$1_0$645	= .
	.globl	C$the_castel.c$709$1_0$645
;./the-castel.c:709: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
	C$the_castel.c$1222$1_0$645	= .
	.globl	C$the_castel.c$1222$1_0$645
;./the-castel.c:1222: else if (ply->bMoving)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00102$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00104$
;./the-castel.c:711: VDP_HideAllSprites();
00102$:
	C$the_castel.c$712$1_0$645	= .
	.globl	C$the_castel.c$712$1_0$645
;./the-castel.c:712: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
	C$the_castel.c$713$1_0$645	= .
	.globl	C$the_castel.c$713$1_0$645
;./the-castel.c:713: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$getMoney$0$0	= .
	.globl	G$getMoney$0$0
	C$the_castel.c$721$1_0$651	= .
	.globl	C$the_castel.c$721$1_0$651
;./the-castel.c:721: bool getMoney(u8 x, u8 y)
;	---------------------------------
; Function getMoney
; ---------------------------------
_getMoney::
	ld	c, a
	ld	b, l
	C$the_castel.c$723$1_0$651	= .
	.globl	C$the_castel.c$723$1_0$651
;./the-castel.c:723: switch (getTile(x, y))
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_getTile
	pop	bc
	sub	a, #0x63
	jr	NZ, 00102$
	C$the_castel.c$726$2_0$652	= .
	.globl	C$the_castel.c$726$2_0$652
;./the-castel.c:726: setTile(x, y, EMPTY_ITEM);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
	pop	bc
	C$the_castel.c$727$2_0$652	= .
	.globl	C$the_castel.c$727$2_0$652
;./the-castel.c:727: foo(x, y, TILE_MASK_MONEY, 1); // Per il momento non posso spostare questa funzione, in quanto dovrei duplicare la chiamata the tile
	ld	hl, #0x1c0
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_foo
	C$the_castel.c$729$2_0$652	= .
	.globl	C$the_castel.c$729$2_0$652
;./the-castel.c:729: return TRUE;
	ld	a, #0x01
	ret
	C$the_castel.c$730$1_0$651	= .
	.globl	C$the_castel.c$730$1_0$651
;./the-castel.c:730: }
00102$:
	C$the_castel.c$731$1_0$651	= .
	.globl	C$the_castel.c$731$1_0$651
;./the-castel.c:731: return FALSE;
	xor	a, a
	C$the_castel.c$732$1_0$651	= .
	.globl	C$the_castel.c$732$1_0$651
;./the-castel.c:732: }
	C$the_castel.c$732$1_0$651	= .
	.globl	C$the_castel.c$732$1_0$651
	XG$getMoney$0$0	= .
	.globl	XG$getMoney$0$0
	ret
	G$isPassage$0$0	= .
	.globl	G$isPassage$0$0
	C$the_castel.c$740$1_0$654	= .
	.globl	C$the_castel.c$740$1_0$654
;./the-castel.c:740: bool isPassage(u8 x, u8 y)
;	---------------------------------
; Function isPassage
; ---------------------------------
_isPassage::
	C$the_castel.c$742$1_0$654	= .
	.globl	C$the_castel.c$742$1_0$654
;./the-castel.c:742: switch (getTile(x, y))
	call	_getTile
	ld	c, a
	sub	a, #0x51
	jr	Z, 00119$
	ld	a, c
	sub	a, #0x52
	jr	Z, 00121$
	jp	00103$
	C$the_castel.c$1222$1_0$654	= .
	.globl	C$the_castel.c$1222$1_0$654
;./the-castel.c:1222: else if (ply->bMoving)
00119$:
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00105$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00109$
;./the-castel.c:745: VDP_HideAllSprites();
00105$:
	C$the_castel.c$746$2_0$655	= .
	.globl	C$the_castel.c$746$2_0$655
;./the-castel.c:746: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.UpDoorLevel);
	ld	bc, #_g_Levels+0
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
	C$the_castel.c$747$2_0$655	= .
	.globl	C$the_castel.c$747$2_0$655
;./the-castel.c:747: return TRUE;
	ld	a, #0x01
	ret
	C$the_castel.c$1222$1_0$654	= .
	.globl	C$the_castel.c$1222$1_0$654
;./the-castel.c:1222: else if (ply->bMoving)
00121$:
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00107$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00112$
;./the-castel.c:750: VDP_HideAllSprites();
00107$:
	C$the_castel.c$751$2_0$655	= .
	.globl	C$the_castel.c$751$2_0$655
;./the-castel.c:751: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.DownDoorLevel);
	ld	bc, #_g_Levels+0
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000b
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
	C$the_castel.c$752$2_0$655	= .
	.globl	C$the_castel.c$752$2_0$655
;./the-castel.c:752: return TRUE;
	ld	a, #0x01
	ret
	C$the_castel.c$753$1_0$654	= .
	.globl	C$the_castel.c$753$1_0$654
;./the-castel.c:753: }
00103$:
	C$the_castel.c$754$1_0$654	= .
	.globl	C$the_castel.c$754$1_0$654
;./the-castel.c:754: return FALSE;
	xor	a, a
	C$the_castel.c$755$1_0$654	= .
	.globl	C$the_castel.c$755$1_0$654
;./the-castel.c:755: }
	C$the_castel.c$755$1_0$654	= .
	.globl	C$the_castel.c$755$1_0$654
	XG$isPassage$0$0	= .
	.globl	XG$isPassage$0$0
	ret
	G$isDanger$0$0	= .
	.globl	G$isDanger$0$0
	C$the_castel.c$764$1_0$665	= .
	.globl	C$the_castel.c$764$1_0$665
;./the-castel.c:764: bool isDanger(u8 x, u8 y, u8 t)
;	---------------------------------
; Function isDanger
; ---------------------------------
_isDanger::
	C$the_castel.c$766$1_0$665	= .
	.globl	C$the_castel.c$766$1_0$665
;./the-castel.c:766: switch (getTile(x, y))
	call	_getTile
	cp	a, #0x40
	jr	Z, 00105$
	cp	a, #0x69
	jr	Z, 00105$
	cp	a, #0x6a
	jr	Z, 00105$
	cp	a, #0x6b
	jr	Z, 00105$
	sub	a, #0x6c
	jr	NZ, 00109$
	C$the_castel.c$772$2_0$666	= .
	.globl	C$the_castel.c$772$2_0$666
;./the-castel.c:772: case TILE_LAVA:
00105$:
	C$the_castel.c$773$2_0$666	= .
	.globl	C$the_castel.c$773$2_0$666
;./the-castel.c:773: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00107$
	C$the_castel.c$775$3_0$667	= .
	.globl	C$the_castel.c$775$3_0$667
;./the-castel.c:775: displayLife();
	call	_displayLife
	C$the_castel.c$776$3_0$667	= .
	.globl	C$the_castel.c$776$3_0$667
;./the-castel.c:776: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
	C$the_castel.c$1222$1_0$665	= .
	.globl	C$the_castel.c$1222$1_0$665
;./the-castel.c:1222: else if (ply->bMoving)
	ld	c, #0x00
00114$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00112$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00114$
;./the-castel.c:777: VDP_HideAllSprites();
00112$:
	C$the_castel.c$778$3_0$667	= .
	.globl	C$the_castel.c$778$3_0$667
;./the-castel.c:778: drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
	ld	a, (_g_CurrRoomIdx+0)
	call	_drawLevel
	jp	00108$
00107$:
	C$the_castel.c$782$3_0$668	= .
	.globl	C$the_castel.c$782$3_0$668
;./the-castel.c:782: stopMusicPlayback();
	call	_stopMusicPlayback
	C$the_castel.c$783$3_0$668	= .
	.globl	C$the_castel.c$783$3_0$668
;./the-castel.c:783: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
00108$:
	C$the_castel.c$785$2_0$666	= .
	.globl	C$the_castel.c$785$2_0$666
;./the-castel.c:785: return TRUE;
	ld	a, #0x01
	jp	00116$
	C$the_castel.c$786$2_0$666	= .
	.globl	C$the_castel.c$786$2_0$666
;./the-castel.c:786: default:
00109$:
	C$the_castel.c$787$2_0$666	= .
	.globl	C$the_castel.c$787$2_0$666
;./the-castel.c:787: return FALSE;
	xor	a, a
	C$the_castel.c$788$1_0$665	= .
	.globl	C$the_castel.c$788$1_0$665
;./the-castel.c:788: }
00116$:
	C$the_castel.c$789$1_0$665	= .
	.globl	C$the_castel.c$789$1_0$665
;./the-castel.c:789: }
	pop	hl
	inc	sp
	jp	(hl)
	G$updateScore$0$0	= .
	.globl	G$updateScore$0$0
	C$the_castel.c$796$1_0$673	= .
	.globl	C$the_castel.c$796$1_0$673
;./the-castel.c:796: void updateScore()
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	C$the_castel.c$798$1_0$673	= .
	.globl	C$the_castel.c$798$1_0$673
;./the-castel.c:798: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	jr	Z, 00108$
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x14
	jr	Z, 00108$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	bc, #_g_PrintData + 6
	xor	a, a
	ld	(bc), a
	C$the_castel.c$805$2_0$674	= .
	.globl	C$the_castel.c$805$2_0$674
;./the-castel.c:805: Print_DrawText(g_Levels[g_CurrRoomIdx].Name);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0006
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ex	de, hl
	call	_Print_DrawText
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
	C$the_castel.c$809$2_0$674	= .
	.globl	C$the_castel.c$809$2_0$674
;./the-castel.c:809: Print_DrawText("SCORE:");
	push	bc
	ld	hl, #___str_0
	call	_Print_DrawText
	pop	bc
	C$the_castel.c$810$2_0$674	= .
	.globl	C$the_castel.c$810$2_0$674
;./the-castel.c:810: String_Format(StrFormat, "%04i", g_Player.Score);
	ld	a, (#(_g_Player + 6) + 0)
	ld	e, a
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_1
	push	hl
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_String_Format
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x10
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
	C$the_castel.c$812$2_0$674	= .
	.globl	C$the_castel.c$812$2_0$674
;./the-castel.c:812: Print_DrawText(StrFormat);
	push	bc
	ld	hl, #2
	add	hl, sp
	call	_Print_DrawText
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x16
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
	C$the_castel.c$816$2_0$674	= .
	.globl	C$the_castel.c$816$2_0$674
;./the-castel.c:816: Print_DrawText("LIFE:");
	ld	hl, #___str_2
	call	_Print_DrawText
00108$:
	C$the_castel.c$818$1_0$673	= .
	.globl	C$the_castel.c$818$1_0$673
;./the-castel.c:818: }
	ld	sp, ix
	pop	ix
	C$the_castel.c$818$1_0$673	= .
	.globl	C$the_castel.c$818$1_0$673
	XG$updateScore$0$0	= .
	.globl	XG$updateScore$0$0
	ret
Fthe_castel$__str_0$0_0$0 == .
___str_0:
	.ascii "SCORE:"
	.db 0x00
Fthe_castel$__str_1$0_0$0 == .
___str_1:
	.ascii "%04i"
	.db 0x00
Fthe_castel$__str_2$0_0$0 == .
___str_2:
	.ascii "LIFE:"
	.db 0x00
	G$drawLevel$0$0	= .
	.globl	G$drawLevel$0$0
	C$the_castel.c$825$1_0$688	= .
	.globl	C$the_castel.c$825$1_0$688
;./the-castel.c:825: void drawLevel(u8 levelIdx)
;	---------------------------------
; Function drawLevel
; ---------------------------------
_drawLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	-2 (ix), a
	C$the_castel.c$827$1_0$688	= .
	.globl	C$the_castel.c$827$1_0$688
;./the-castel.c:827: pausePT3Music();
	call	_pausePT3Music
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
	xor	a, a
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
	C$the_castel.c$830$1_0$688	= .
	.globl	C$the_castel.c$830$1_0$688
;./the-castel.c:830: g_CurrRoomIdx = levelIdx;
	ld	a, -2 (ix)
	ld	(_g_CurrRoomIdx+0), a
	C$the_castel.c$831$1_0$688	= .
	.globl	C$the_castel.c$831$1_0$688
;./the-castel.c:831: g_PawnCount = 0;
	ld	hl, #_g_PawnCount
	ld	(hl), #0x00
	C$the_castel.c$832$1_0$688	= .
	.globl	C$the_castel.c$832$1_0$688
;./the-castel.c:832: g_GhostCount = 0;
	ld	hl, #_g_GhostCount
	ld	(hl), #0x00
	C$the_castel.c$833$1_0$688	= .
	.globl	C$the_castel.c$833$1_0$688
;./the-castel.c:833: g_SpiderCount = 0;
	ld	hl, #_g_SpiderCount
	ld	(hl), #0x00
	C$the_castel.c$834$1_0$688	= .
	.globl	C$the_castel.c$834$1_0$688
;./the-castel.c:834: g_BatCount = 0;
	ld	hl, #_g_BatCount
	ld	(hl), #0x00
	C$the_castel.c$835$1_0$688	= .
	.globl	C$the_castel.c$835$1_0$688
;./the-castel.c:835: g_SecondCounter = 0;
	ld	hl, #_g_SecondCounter
	ld	(hl), #0x00
	C$the_castel.c$836$1_0$688	= .
	.globl	C$the_castel.c$836$1_0$688
;./the-castel.c:836: g_DangerCounter = 0;
	ld	hl, #_g_DangerCounter
	ld	(hl), #0x00
	C$the_castel.c$837$1_0$688	= .
	.globl	C$the_castel.c$837$1_0$688
;./the-castel.c:837: g_CountItem = 0; // Iniziaizza il cobtatore degli oggetti raccolti
	ld	hl, #_g_CountItem
	ld	(hl), #0x00
	C$the_castel.c$838$1_0$688	= .
	.globl	C$the_castel.c$838$1_0$688
;./the-castel.c:838: g_SlideCountH = 0;
	ld	hl, #_g_SlideCountH
	ld	(hl), #0x00
	C$the_castel.c$839$1_0$688	= .
	.globl	C$the_castel.c$839$1_0$688
;./the-castel.c:839: g_SlideCountV = 0;
	ld	hl, #_g_SlideCountV
	ld	(hl), #0x00
;./the-castel.c:841: DEBUG_LOGNUM("----- Livello", g_CurrRoomIdx);
	ld	a, (_g_CurrRoomIdx+0)
	ld	c, a
	ld	de, #___str_3+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00144$:
	ld	a, (de)
	or	a, a
	jr	Z, 00147$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	de
	jp	00144$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00147$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, c
	out	(_g_PortDebugData), a
;./the-castel.c:842: DEBUG_LOGNUM("----- CONFIGURATO Skeletor Number", g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	hl, #_g_Levels
	add	hl, de
	ex	de, hl
	push	de
	pop	iy
	ld	l, 12 (iy)
;	spillPairReg hl
	ld	bc, #___str_4+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00149$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00152$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00149$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00152$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, l
	out	(_g_PortDebugData), a
;./the-castel.c:843: DEBUG_LOGNUM("----- CONFIGURATO Ghost Number", g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);
	push	de
	pop	iy
	ld	l, 13 (iy)
;	spillPairReg hl
	ld	bc, #___str_5+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00154$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00157$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00154$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00157$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, l
	out	(_g_PortDebugData), a
;./the-castel.c:844: DEBUG_LOGNUM("----- CONFIGURATO Spider Number", g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);
	push	de
	pop	iy
	ld	l, 14 (iy)
;	spillPairReg hl
	ld	bc, #___str_6+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00159$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00162$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00159$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00162$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, l
	out	(_g_PortDebugData), a
;./the-castel.c:845: DEBUG_LOGNUM("----- CONFIGURATO Bat Number", g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);
	push	de
	pop	iy
	ld	l, 15 (iy)
;	spillPairReg hl
	ld	bc, #___str_7+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00164$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00167$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00164$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00167$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, l
	out	(_g_PortDebugData), a
;./the-castel.c:846: DEBUG_LOGNUM("----- CONFIGURATO Slide Number H", g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH);
	push	de
	pop	iy
	ld	l, 16 (iy)
;	spillPairReg hl
	ld	bc, #___str_8+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00169$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00172$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00169$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00172$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, l
	out	(_g_PortDebugData), a
;./the-castel.c:847: DEBUG_LOGNUM("----- CONFIGURATO Slide Number V", g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV);
	ld	hl, #17
	add	hl, de
	ld	c, (hl)
	ld	de, #___str_9+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$688	= .
	.globl	C$debug.h$103$1_0$688
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00174$:
	ld	a, (de)
	or	a, a
	jr	Z, 00177$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	de
	jp	00174$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00177$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, c
	out	(_g_PortDebugData), a
	C$the_castel.c$850$1_0$688	= .
	.globl	C$the_castel.c$850$1_0$688
;./the-castel.c:850: if (hasItemInInventory(TILE_AMPHORA))
	ld	a, #0x5f
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00216$
	C$the_castel.c$851$1_0$688	= .
	.globl	C$the_castel.c$851$1_0$688
;./the-castel.c:851: removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	b, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, #0x5f
	call	_removeItemFromInventory
	C$the_castel.c$853$1_0$688	= .
	.globl	C$the_castel.c$853$1_0$688
;./the-castel.c:853: for (u8 i = 0; i < MAX_CACHE_OBJECT; i++)
00216$:
	ld	-1 (ix), #0x00
00181$:
	ld	a, -1 (ix)
	sub	a, #0x05
	jr	NC, 00105$
	C$the_castel.c$855$3_0$690	= .
	.globl	C$the_castel.c$855$3_0$690
;./the-castel.c:855: if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	bc, #0x0012
	add	hl, bc
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	ld	e, a
	ld	d, #0x00
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00182$
	C$the_castel.c$856$3_0$690	= .
	.globl	C$the_castel.c$856$3_0$690
;./the-castel.c:856: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
00182$:
	C$the_castel.c$853$2_0$689	= .
	.globl	C$the_castel.c$853$2_0$689
;./the-castel.c:853: for (u8 i = 0; i < MAX_CACHE_OBJECT; i++)
	inc	-1 (ix)
	jp	00181$
00105$:
	C$the_castel.c$868$1_0$688	= .
	.globl	C$the_castel.c$868$1_0$688
;./the-castel.c:868: VDP_FillVRAM_16K(0, g_ScreenLayoutLow, 32 * 24);
	ld	hl, #0x0300
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
	C$the_castel.c$872$1_0$688	= .
	.globl	C$the_castel.c$872$1_0$688
;./the-castel.c:872: Pletter_UnpackToRAM(g_Levels[levelIdx].Layout, g_CacheLevel[0].Layout);
	ld	de, (#(_g_CacheLevel + 4) + 0)
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc, #_g_Levels
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	call	_Pletter_UnpackToRAM
	C$the_castel.c$875$3_0$692	= .
	.globl	C$the_castel.c$875$3_0$692
;./the-castel.c:875: for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	ld	c, #0x00
00187$:
	ld	hl, #_g_CacheLevel + 3
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	NC, 00133$
	C$the_castel.c$899$3_0$692	= .
	.globl	C$the_castel.c$899$3_0$692
;./the-castel.c:899: g_ScreenLayoutLow + (32 * (riga + g_CacheLevel[0].Y)) + (g_CacheLevel[0].X), g_CacheLevel[0].Width);
	ld	hl, #(_g_CacheLevel + 2)
	ld	b, (hl)
	ld	-4 (ix), b
	ld	-3 (ix), #0x00
	ld	e, c
	ld	d, #0x00
	ld	a, (#(_g_CacheLevel + 1) + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	iy, (_g_ScreenLayoutLow)
	ex	de, hl
	add	iy, de
	ld	a, (#_g_CacheLevel + 0)
	ld	e, a
	ld	d, #0x00
	add	iy, de
	C$the_castel.c$898$3_0$692	= .
	.globl	C$the_castel.c$898$3_0$692
;./the-castel.c:898: VDP_WriteVRAM_16K(g_CacheLevel[0].Layout + g_CacheLevel[0].Width * riga,
	ld	de, (#(_g_CacheLevel + 4) + 0)
	push	de
	ld	e, c
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00418$:
	add	hl, hl
	jr	NC, 00419$
	add	hl, de
00419$:
	djnz	00418$
	pop	de
	add	hl, de
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	de
	push	iy
	pop	de
	call	_VDP_WriteVRAM_16K
	pop	bc
	C$the_castel.c$901$1_0$688	= .
	.globl	C$the_castel.c$901$1_0$688
;./the-castel.c:901: for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
	ld	b, #0x00
00184$:
	ld	hl, #(_g_CacheLevel + 2)
	ld	e, (hl)
	ld	a, b
	sub	a, e
	jp	NC, 00188$
	C$the_castel.c$904$5_0$694	= .
	.globl	C$the_castel.c$904$5_0$694
;./the-castel.c:904: u8 tile = g_CacheLevel[0].Layout[g_CacheLevel[0].Width * riga + colonna];
	ld	hl, #(_g_CacheLevel + 4)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	push	bc
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00420$:
	add	hl, hl
	jr	NC, 00421$
	add	hl, de
00421$:
	djnz	00420$
	pop	bc
	ld	e, b
	ld	d, #0x00
	add	hl, de
	pop	de
	push	de
	add	hl, de
	ld	a, (hl)
	C$the_castel.c$906$5_0$694	= .
	.globl	C$the_castel.c$906$5_0$694
;./the-castel.c:906: if (tile == TILE_START_POS) // Rilevamento della posizione iniziale del giocatore
	ld	-1 (ix), a
	sub	a, #0x7f
	jr	NZ, 00130$
	C$the_castel.c$908$6_0$695	= .
	.globl	C$the_castel.c$908$6_0$695
;./the-castel.c:908: u8 x = g_CacheLevel[0].X + colonna;
	ld	a, (#_g_CacheLevel + 0)
	add	a, b
	ld	e, a
	C$the_castel.c$909$6_0$695	= .
	.globl	C$the_castel.c$909$6_0$695
;./the-castel.c:909: u8 y = g_CacheLevel[0].Y + riga;
	ld	a, (#(_g_CacheLevel + 1) + 0)
	add	a, c
	C$the_castel.c$918$6_0$695	= .
	.globl	C$the_castel.c$918$6_0$695
;./the-castel.c:918: GamePawn_SetPosition(&g_Player.Pawn, x * 8, (y - 3) * 8);
	ld	d, a
	add	a, #0xfd
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	push	bc
	push	de
	ld	h, l
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #(_g_Player + 8)
	call	_GamePawn_SetPosition
	pop	de
	xor	a, a
	push	af
	inc	sp
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_setTileByTileCoord
	pop	bc
	jp	00185$
00130$:
	C$the_castel.c$921$5_0$694	= .
	.globl	C$the_castel.c$921$5_0$694
;./the-castel.c:921: else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x7c
	jr	NZ, 00126$
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000c
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_PawnCount+0)
	sub	a, e
	jr	NC, 00126$
	C$the_castel.c$923$6_0$696	= .
	.globl	C$the_castel.c$923$6_0$696
;./the-castel.c:923: g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Enemy[0], 196, FIRST_ID_SKELETOR, riga, colonna, 0, "Scheletor", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_10
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x06
	push	hl
	ld	a, #0xc4
	push	af
	inc	sp
	ld	hl, #_g_Enemy
	push	hl
	ld	a, (_g_PawnCount+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x7c
	call	_positionGenericEnemy
	pop	bc
	ld	(_g_PawnCount+0), a
	jp	00185$
00126$:
	C$the_castel.c$925$5_0$694	= .
	.globl	C$the_castel.c$925$5_0$694
;./the-castel.c:925: else if ((tile == TILE_POS_GHOST) && (g_GhostCount < g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x80
	jr	NZ, 00122$
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000d
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_GhostCount+0)
	sub	a, e
	jr	NC, 00122$
	C$the_castel.c$927$6_0$697	= .
	.globl	C$the_castel.c$927$6_0$697
;./the-castel.c:927: g_GhostCount = positionGenericEnemy(TILE_POS_GHOST, g_GhostCount, &g_Ghost[0], 200, FIRST_ID_GHOST, riga, colonna, 0, "Ghost", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_11
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x09
	push	hl
	ld	a, #0xc8
	push	af
	inc	sp
	ld	hl, #_g_Ghost
	push	hl
	ld	a, (_g_GhostCount+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x80
	call	_positionGenericEnemy
	pop	bc
	ld	(_g_GhostCount+0), a
	jp	00185$
00122$:
	C$the_castel.c$929$5_0$694	= .
	.globl	C$the_castel.c$929$5_0$694
;./the-castel.c:929: else if ((tile == TILE_POS_SPIDER) && (g_SpiderCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x81
	jr	NZ, 00118$
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_SpiderCount+0)
	sub	a, e
	jr	NC, 00118$
	C$the_castel.c$931$6_0$698	= .
	.globl	C$the_castel.c$931$6_0$698
;./the-castel.c:931: g_SpiderCount = positionGenericEnemy(TILE_POS_SPIDER, g_SpiderCount, &g_Spider[0], 192, FIRST_ID_SPIDER, riga, colonna, 0, "Spider", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_12
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x0c
	push	hl
	ld	a, #0xc0
	push	af
	inc	sp
	ld	hl, #_g_Spider
	push	hl
	ld	a, (_g_SpiderCount+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x81
	call	_positionGenericEnemy
	pop	bc
	ld	(_g_SpiderCount+0), a
	jp	00185$
00118$:
	C$the_castel.c$933$5_0$694	= .
	.globl	C$the_castel.c$933$5_0$694
;./the-castel.c:933: else if ((tile == TILE_POS_BAT) && (g_BatCount < g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x82
	jr	NZ, 00114$
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000f
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_BatCount+0)
	sub	a, e
	jr	NC, 00114$
	C$the_castel.c$935$6_0$699	= .
	.globl	C$the_castel.c$935$6_0$699
;./the-castel.c:935: g_BatCount = positionGenericEnemy(TILE_POS_BAT, g_BatCount, &g_Bat[0], 204, FIRST_ID_BAT, riga, colonna, 0, "Bat", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_13
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x0f
	push	hl
	ld	a, #0xcc
	push	af
	inc	sp
	ld	hl, #_g_Bat
	push	hl
	ld	a, (_g_BatCount+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x82
	call	_positionGenericEnemy
	pop	bc
	ld	(_g_BatCount+0), a
	jp	00185$
00114$:
	C$the_castel.c$937$5_0$694	= .
	.globl	C$the_castel.c$937$5_0$694
;./the-castel.c:937: else if ((tile == TILE_POS_PLATFORM_O) && (g_SlideCountH < g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH)) // Rilevamento piattaforma mobile
	ld	a, -1 (ix)
	sub	a, #0x84
	jr	NZ, 00110$
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0010
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_SlideCountH+0)
	sub	a, e
	jr	NC, 00110$
	C$the_castel.c$939$6_0$700	= .
	.globl	C$the_castel.c$939$6_0$700
;./the-castel.c:939: g_SlideCountH = positionGenericEnemy(TILE_POS_PLATFORM_O, g_SlideCountH, &g_platformH[0], 208, FIRST_ID_SLIDE_H, riga, colonna, 0, "platform H", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_14
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x12
	push	hl
	ld	a, #0xd0
	push	af
	inc	sp
	ld	hl, #_g_platformH
	push	hl
	ld	a, (_g_SlideCountH+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x84
	call	_positionGenericEnemy
	pop	bc
	ld	(_g_SlideCountH+0), a
	jp	00185$
00110$:
	C$the_castel.c$941$5_0$694	= .
	.globl	C$the_castel.c$941$5_0$694
;./the-castel.c:941: else if ((tile == TILE_POS_PLATFORM_V) && (g_SlideCountV < g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV)) // Rilevamento piattaforma mobile
	ld	a, -1 (ix)
	sub	a, #0x85
	jr	NZ, 00185$
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0011
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_SlideCountV+0)
	sub	a, e
	jr	NC, 00185$
	C$the_castel.c$943$6_0$701	= .
	.globl	C$the_castel.c$943$6_0$701
;./the-castel.c:943: g_SlideCountV = positionGenericEnemy(TILE_POS_PLATFORM_V, g_SlideCountV, &g_platformV[0], 208, FIRST_ID_SLIDE_V, riga, colonna, 0, "platform V", 1);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #___str_15
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	h, c
	ld	l, #0x15
	push	hl
	ld	a, #0xd0
	push	af
	inc	sp
	ld	hl, #_g_platformV
	push	hl
	ld	a, (_g_SlideCountV+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x85
	call	_positionGenericEnemy
	pop	bc
	ld	(_g_SlideCountV+0), a
00185$:
	C$the_castel.c$901$4_0$693	= .
	.globl	C$the_castel.c$901$4_0$693
;./the-castel.c:901: for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
	inc	b
	jp	00184$
00188$:
	C$the_castel.c$875$2_0$691	= .
	.globl	C$the_castel.c$875$2_0$691
;./the-castel.c:875: for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	inc	c
	jp	00187$
00133$:
	C$the_castel.c$949$1_0$688	= .
	.globl	C$the_castel.c$949$1_0$688
;./the-castel.c:949: hideSprite(g_PawnCount, MAX_ENEMY, FIRST_ID_SKELETOR);
	ld	a, #0x06
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_PawnCount+0)
	call	_hideSprite
	C$the_castel.c$950$1_0$688	= .
	.globl	C$the_castel.c$950$1_0$688
;./the-castel.c:950: hideSprite(g_GhostCount, MAX_GHOST, FIRST_ID_GHOST);
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_GhostCount+0)
	call	_hideSprite
	C$the_castel.c$951$1_0$688	= .
	.globl	C$the_castel.c$951$1_0$688
;./the-castel.c:951: hideSprite(g_SpiderCount, MAX_SPIDER, FIRST_ID_SPIDER);
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SpiderCount+0)
	call	_hideSprite
	C$the_castel.c$952$1_0$688	= .
	.globl	C$the_castel.c$952$1_0$688
;./the-castel.c:952: hideSprite(g_BatCount, MAX_BAT, FIRST_ID_BAT);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_BatCount+0)
	call	_hideSprite
	C$the_castel.c$953$1_0$688	= .
	.globl	C$the_castel.c$953$1_0$688
;./the-castel.c:953: hideSprite(g_SlideCountH, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_H);
	ld	a, #0x12
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SlideCountH+0)
	call	_hideSprite
	C$the_castel.c$954$1_0$688	= .
	.globl	C$the_castel.c$954$1_0$688
;./the-castel.c:954: hideSprite(g_SlideCountV, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_V);
	ld	a, #0x15
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SlideCountV+0)
	call	_hideSprite
	C$the_castel.c$956$1_0$688	= .
	.globl	C$the_castel.c$956$1_0$688
;./the-castel.c:956: if (levelIdx == 0)
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00239$
	C$the_castel.c$962$2_0$703	= .
	.globl	C$the_castel.c$962$2_0$703
;./the-castel.c:962: updateScore();
	call	_updateScore
	C$the_castel.c$964$2_0$703	= .
	.globl	C$the_castel.c$964$2_0$703
;./the-castel.c:964: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	jr	Z, 00135$
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x14
	jr	Z, 00135$
	C$the_castel.c$965$2_0$703	= .
	.globl	C$the_castel.c$965$2_0$703
;./the-castel.c:965: displayItemToInventory(g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, (de)
	ld	c, a
	push	bc
	inc	sp
	ld	a, c
	call	_displayItemToInventory
00135$:
	C$the_castel.c$967$2_0$703	= .
	.globl	C$the_castel.c$967$2_0$703
;./the-castel.c:967: displayLife();
	call	_displayLife
	C$the_castel.c$971$1_0$688	= .
	.globl	C$the_castel.c$971$1_0$688
;./the-castel.c:971: for (u8 i = 0; i < 10; i++)
00239$:
	ld	-1 (ix), #0x00
00190$:
	ld	a, -1 (ix)
	sub	a, #0x0a
	jr	NC, 00197$
	C$the_castel.c$973$3_0$705	= .
	.globl	C$the_castel.c$973$3_0$705
;./the-castel.c:973: if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	bc, #0x0012
	add	hl, bc
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	dec	a
	jr	NZ, 00191$
	C$the_castel.c$975$4_0$706	= .
	.globl	C$the_castel.c$975$4_0$706
;./the-castel.c:975: setTile(g_Levels[g_CurrRoomIdx].MyItems[i].x, g_Levels[g_CurrRoomIdx].MyItems[i].y, g_Levels[g_CurrRoomIdx].MyItems[i].tile);
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
	ld	l, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	c, a
	ld	a, e
	push	af
	inc	sp
	ld	a, c
	call	_setTile
00191$:
	C$the_castel.c$971$2_0$704	= .
	.globl	C$the_castel.c$971$2_0$704
;./the-castel.c:971: for (u8 i = 0; i < 10; i++)
	inc	-1 (ix)
	jp	00190$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
00197$:
	ld	a, #0x40
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
	C$the_castel.c$981$1_0$688	= .
	.globl	C$the_castel.c$981$1_0$688
;./the-castel.c:981: restorePT3Music();
	call	_restorePT3Music
	C$the_castel.c$982$1_0$688	= .
	.globl	C$the_castel.c$982$1_0$688
;./the-castel.c:982: }
	ld	sp, ix
	pop	ix
	C$the_castel.c$982$1_0$688	= .
	.globl	C$the_castel.c$982$1_0$688
	XG$drawLevel$0$0	= .
	.globl	XG$drawLevel$0$0
	ret
Fthe_castel$__str_3$0_0$0 == .
___str_3:
	.ascii "----- Livello"
	.db 0x00
Fthe_castel$__str_4$0_0$0 == .
___str_4:
	.ascii "----- CONFIGURATO Skeletor Number"
	.db 0x00
Fthe_castel$__str_5$0_0$0 == .
___str_5:
	.ascii "----- CONFIGURATO Ghost Number"
	.db 0x00
Fthe_castel$__str_6$0_0$0 == .
___str_6:
	.ascii "----- CONFIGURATO Spider Number"
	.db 0x00
Fthe_castel$__str_7$0_0$0 == .
___str_7:
	.ascii "----- CONFIGURATO Bat Number"
	.db 0x00
Fthe_castel$__str_8$0_0$0 == .
___str_8:
	.ascii "----- CONFIGURATO Slide Number H"
	.db 0x00
Fthe_castel$__str_9$0_0$0 == .
___str_9:
	.ascii "----- CONFIGURATO Slide Number V"
	.db 0x00
Fthe_castel$__str_10$0_0$0 == .
___str_10:
	.ascii "Scheletor"
	.db 0x00
Fthe_castel$__str_11$0_0$0 == .
___str_11:
	.ascii "Ghost"
	.db 0x00
Fthe_castel$__str_12$0_0$0 == .
___str_12:
	.ascii "Spider"
	.db 0x00
Fthe_castel$__str_13$0_0$0 == .
___str_13:
	.ascii "Bat"
	.db 0x00
Fthe_castel$__str_14$0_0$0 == .
___str_14:
	.ascii "platform H"
	.db 0x00
Fthe_castel$__str_15$0_0$0 == .
___str_15:
	.ascii "platform V"
	.db 0x00
	G$positionGenericEnemy$0$0	= .
	.globl	G$positionGenericEnemy$0$0
	C$the_castel.c$996$1_0$756	= .
	.globl	C$the_castel.c$996$1_0$756
;./the-castel.c:996: u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 moveHV)
;	---------------------------------
; Function positionGenericEnemy
; ---------------------------------
_positionGenericEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-7
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
	C$the_castel.c$998$1_0$756	= .
	.globl	C$the_castel.c$998$1_0$756
;./the-castel.c:998: if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_GENERIC_ENEMY)
	ld	bc, #_g_Levels+0
	ld	e, 10 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	push	bc
	pop	iy
	ld	a, 4 (iy)
	ld	-7 (ix), a
	ld	a, 5 (iy)
	ld	-6 (ix), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
	push	bc
	ld	e, 8 (ix)
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00117$:
	add	hl, hl
	jr	NC, 00118$
	add	hl, de
00118$:
	djnz	00117$
	pop	bc
	ld	a, 9 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	e, a
	ld	d, #0x00
	add	hl, de
	dec	hl
	pop	de
	push	de
	add	hl, de
	ld	e, (hl)
	ld	a, -1 (ix)
	sub	a, e
	jr	Z, 00104$
	C$the_castel.c$1000$2_0$757	= .
	.globl	C$the_castel.c$1000$2_0$757
;./the-castel.c:1000: if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_GENERIC_ENEMY)
	ld	e, 8 (ix)
	ld	d, #0x00
	dec	de
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	__mulint
	pop	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, de
	pop	de
	push	de
	add	hl, de
	ld	e, (hl)
	ld	a, -1 (ix)
	sub	a, e
	jr	Z, 00104$
	C$the_castel.c$1008$3_0$758	= .
	.globl	C$the_castel.c$1008$3_0$758
;./the-castel.c:1008: u8 x = g_Levels[levelIdx].X + colonna;
	ld	a, (bc)
	add	a, 9 (ix)
	ld	e, a
	C$the_castel.c$1009$3_0$758	= .
	.globl	C$the_castel.c$1009$3_0$758
;./the-castel.c:1009: u8 y = g_Levels[levelIdx].Y + riga;
	inc	bc
	ld	a, (bc)
	add	a, 8 (ix)
	ld	d, a
	C$the_castel.c$1011$3_0$758	= .
	.globl	C$the_castel.c$1011$3_0$758
;./the-castel.c:1011: managementSprite(x, y, baseSprite, enemyCount, idxSprite);
	push	de
	ld	h, 6 (ix)
	ld	l, -2 (ix)
	push	hl
	ld	a, 7 (ix)
	push	af
	inc	sp
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_managementSprite
	pop	de
	C$the_castel.c$1013$3_0$758	= .
	.globl	C$the_castel.c$1013$3_0$758
;./the-castel.c:1013: spritePosition(x, y, &enemy[0], baseSprite, enemyCount, Name, moveHV);
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	push	de
	ld	a, 13 (ix)
	push	af
	inc	sp
	ld	l, 11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, 12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	h, -2 (ix)
	ld	l, 7 (ix)
	push	hl
	push	bc
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_spritePosition
	pop	de
	C$the_castel.c$1015$3_0$758	= .
	.globl	C$the_castel.c$1015$3_0$758
;./the-castel.c:1015: setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
	xor	a, a
	push	af
	inc	sp
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_setTileByTileCoord
	C$the_castel.c$1016$3_0$758	= .
	.globl	C$the_castel.c$1016$3_0$758
;./the-castel.c:1016: enemyCount++;
	inc	-2 (ix)
00104$:
	C$the_castel.c$1020$1_0$756	= .
	.globl	C$the_castel.c$1020$1_0$756
;./the-castel.c:1020: return enemyCount;
	ld	a, -2 (ix)
	C$the_castel.c$1021$1_0$756	= .
	.globl	C$the_castel.c$1021$1_0$756
;./the-castel.c:1021: }
	ld	sp, ix
	pop	ix
	pop	hl
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	jp	(hl)
	G$spritePosition$0$0	= .
	.globl	G$spritePosition$0$0
	C$the_castel.c$1032$1_0$760	= .
	.globl	C$the_castel.c$1032$1_0$760
;./the-castel.c:1032: void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV)
;	---------------------------------
; Function spritePosition
; ---------------------------------
_spritePosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	b, a
	ld	c, l
	C$the_castel.c$1034$1_0$760	= .
	.globl	C$the_castel.c$1034$1_0$760
;./the-castel.c:1034: struct CharacterEnemy *generic = &genericEnemy[enemyCount];
	ld	e, 7 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, de
	ex	de, hl
	C$the_castel.c$1035$1_0$760	= .
	.globl	C$the_castel.c$1035$1_0$760
;./the-castel.c:1035: generic->X = x * 8;
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
	C$the_castel.c$1036$1_0$760	= .
	.globl	C$the_castel.c$1036$1_0$760
;./the-castel.c:1036: generic->Y = (y - 1) * 8;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, c
	dec	a
	add	a, a
	add	a, a
	add	a, a
	ld	(hl), a
	C$the_castel.c$1037$1_0$760	= .
	.globl	C$the_castel.c$1037$1_0$760
;./the-castel.c:1037: generic->Direction = (g_GameFrame % 2) ? 1 : -1;
	ld	hl, #0x0004
	add	hl, de
	ld	iy, #_g_GameFrame
	bit	0, 0 (iy)
	jr	Z, 00103$
	ld	bc, #0x0001
	jp	00104$
00103$:
	ld	bc, #0xffff
00104$:
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$the_castel.c$1038$1_0$760	= .
	.globl	C$the_castel.c$1038$1_0$760
;./the-castel.c:1038: generic->TypeEnemy = type;
	ld	hl, #0x0006
	add	hl, de
	ld	a, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
	C$the_castel.c$1039$1_0$760	= .
	.globl	C$the_castel.c$1039$1_0$760
;./the-castel.c:1039: generic->SpriteId = baseSprite + enemyCount;
	ld	hl, #0x0008
	add	hl, de
	ld	a, 6 (ix)
	add	a, 7 (ix)
	ld	(hl), a
	C$the_castel.c$1040$1_0$760	= .
	.globl	C$the_castel.c$1040$1_0$760
;./the-castel.c:1040: generic->State = 1;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
	C$the_castel.c$1041$1_0$760	= .
	.globl	C$the_castel.c$1041$1_0$760
;./the-castel.c:1041: generic->MoveHV = moveHV;
	ld	hl, #0x0009
	add	hl, de
	ld	a, 10 (ix)
	ld	(hl), a
	C$the_castel.c$1042$1_0$760	= .
	.globl	C$the_castel.c$1042$1_0$760
;./the-castel.c:1042: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	pop	af
	inc	sp
	jp	(hl)
	G$hideSprite$0$0	= .
	.globl	G$hideSprite$0$0
	C$the_castel.c$1050$1_0$763	= .
	.globl	C$the_castel.c$1050$1_0$763
;./the-castel.c:1050: void hideSprite(u8 count, u8 maxElement, u8 baseSprite)
;	---------------------------------
; Function hideSprite
; ---------------------------------
_hideSprite::
	ld	c, a
	ld	b, l
	C$the_castel.c$1052$2_0$763	= .
	.globl	C$the_castel.c$1052$2_0$763
;./the-castel.c:1052: for (u8 i = count; i < maxElement; ++i)
00104$:
	ld	a, c
	sub	a, b
	jr	NC, 00106$
;./the-castel.c:1054: VDP_HideSprite(baseSprite + i);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	add	a, c
	ld	e, a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:1213: inline void VDP_HideSprite(u8 index) { VDP_SetSpritePositionY(index, VDP_SPRITE_HIDE); }
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_VDP_SetSpritePositionY
	pop	bc
	C$the_castel.c$1052$2_0$763	= .
	.globl	C$the_castel.c$1052$2_0$763
;./the-castel.c:1052: for (u8 i = count; i < maxElement; ++i)
	inc	c
	jp	00104$
00106$:
	C$the_castel.c$1056$2_0$763	= .
	.globl	C$the_castel.c$1056$2_0$763
;./the-castel.c:1056: }
	pop	hl
	inc	sp
	jp	(hl)
	G$managementSprite$0$0	= .
	.globl	G$managementSprite$0$0
	C$the_castel.c$1066$2_0$769	= .
	.globl	C$the_castel.c$1066$2_0$769
;./the-castel.c:1066: void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape)
;	---------------------------------
; Function managementSprite
; ---------------------------------
_managementSprite::
	ld	b, a
	ld	d, l
	C$the_castel.c$1077$1_0$769	= .
	.globl	C$the_castel.c$1077$1_0$769
;./the-castel.c:1077: VDP_SetSpriteSM1(baseSprite + enemyCount, x, y, indexShape, COLOR_WHITE);
	ld	hl, #3
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	h, #0x0f
	ld	l, 2 (iy)
	push	hl
	push	de
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpriteSM1
	C$the_castel.c$1087$1_0$769	= .
	.globl	C$the_castel.c$1087$1_0$769
;./the-castel.c:1087: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
	G$initCharacter$0$0	= .
	.globl	G$initCharacter$0$0
	C$the_castel.c$1095$1_0$771	= .
	.globl	C$the_castel.c$1095$1_0$771
;./the-castel.c:1095: void initCharacter(struct Character *ply, u8 id)
;	---------------------------------
; Function initCharacter
; ---------------------------------
_initCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
	C$the_castel.c$1097$1_0$771	= .
	.globl	C$the_castel.c$1097$1_0$771
;./the-castel.c:1097: Mem_Set(0, ply, sizeof(struct Character));
	ld	e, l
	ld	d, h
	push	hl
	ld	bc, #0x001c
	push	bc
	xor	a, a
	call	_Mem_Set
	pop	hl
	C$the_castel.c$1099$1_1$772	= .
	.globl	C$the_castel.c$1099$1_1$772
;./the-castel.c:1099: Game_Pawn *pawn = &ply->Pawn;
	ld	bc, #0x0008
	add	hl, bc
	C$the_castel.c$1101$1_1$772	= .
	.globl	C$the_castel.c$1101$1_1$772
;./the-castel.c:1101: if (id == 0)
	ld	a, 4 (ix)
	or	a, a
	jr	NZ, 00103$
	C$the_castel.c$1103$2_1$773	= .
	.globl	C$the_castel.c$1103$2_1$773
;./the-castel.c:1103: GamePawn_Initialize(pawn, g_PlayerSpriteLayers, numberof(g_PlayerSpriteLayers), 0, g_PlayerAnimActions);
	ld	bc, #_g_PlayerAnimActions+0
	ld	de, #_g_PlayerSpriteLayers+0
	push	hl
	push	bc
	ld	bc, #0x02
	push	bc
	call	_GamePawn_Initialize
	pop	hl
	C$the_castel.c$1104$2_1$773	= .
	.globl	C$the_castel.c$1104$2_1$773
;./the-castel.c:1104: GamePawn_SetPosition(pawn, 255 - 16 - 16, 128);
	push	hl
	ld	de, #0x80df
	push	de
	call	_GamePawn_SetPosition
	pop	hl
	C$the_castel.c$1105$2_1$773	= .
	.globl	C$the_castel.c$1105$2_1$773
;./the-castel.c:1105: GamePawn_InitializePhysics(pawn, physicsEventPlayer, physicsCollision, 16, 16);
	ld	a, #0x10
	push	af
	inc	sp
	ld	a, #0x10
	push	af
	inc	sp
	ld	de, #_physicsCollision
	push	de
	ld	de, #_physicsEventPlayer
	call	_GamePawn_InitializePhysics
00103$:
	C$the_castel.c$1107$1_1$771	= .
	.globl	C$the_castel.c$1107$1_1$771
;./the-castel.c:1107: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$isOnPlatformH$0$0	= .
	.globl	G$isOnPlatformH$0$0
	C$the_castel.c$1112$1_1$775	= .
	.globl	C$the_castel.c$1112$1_1$775
;./the-castel.c:1112: bool isOnPlatformH(u8 *X, u8 *Y)
;	---------------------------------
; Function isOnPlatformH
; ---------------------------------
_isOnPlatformH::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	c, e
	ld	b, d
	C$the_castel.c$1114$4_0$779	= .
	.globl	C$the_castel.c$1114$4_0$779
;./the-castel.c:1114: for (u8 i = 0; i < g_SlideCountH; i++)
	ld	a, (bc)
	ld	-4 (ix), a
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-1 (ix), #0x00
00110$:
	ld	hl, #_g_SlideCountH
	ld	a, -1 (ix)
	sub	a, (hl)
	jp	NC, 00108$
	C$the_castel.c$1116$3_0$777	= .
	.globl	C$the_castel.c$1116$3_0$777
;./the-castel.c:1116: if ((*X < g_platformH[i].X - 16) || (*X > g_platformH[i].X + 16))
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	iy, #_g_platformH
	add	iy, de
	ld	e, 0 (iy)
	ld	d, #0x00
	ld	a, e
	add	a, #0xf0
	ld	-6 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	M, 00111$
	ld	a, e
	add	a, #0x10
	ld	e, a
	jr	NC, 00145$
	inc	d
00145$:
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00146$
	xor	a, #0x80
00146$:
	jp	M, 00111$
	C$the_castel.c$1122$4_0$779	= .
	.globl	C$the_castel.c$1122$4_0$779
;./the-castel.c:1122: if ((*Y + 17 > g_platformH[i].Y) && (*Y + 17 < g_platformH[i].Y + 8))
	ld	e, -4 (ix)
	ld	d, #0x00
	ld	hl, #0x0011
	add	hl, de
	push	iy
	ex	de, hl
	pop	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	P, 00111$
	push	de
	ld	de, #0x0008
	add	hl, de
	pop	de
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00148$
	xor	a, #0x80
00148$:
	jp	P, 00111$
	C$the_castel.c$1124$5_0$780	= .
	.globl	C$the_castel.c$1124$5_0$780
;./the-castel.c:1124: *Y = g_platformH[i].Y - 16;
	ld	a, -2 (ix)
	add	a, #0xf0
	ld	(bc), a
	C$the_castel.c$1125$5_0$780	= .
	.globl	C$the_castel.c$1125$5_0$780
;./the-castel.c:1125: return TRUE;
	ld	a, #0x01
	jp	00112$
00111$:
	C$the_castel.c$1114$2_0$776	= .
	.globl	C$the_castel.c$1114$2_0$776
;./the-castel.c:1114: for (u8 i = 0; i < g_SlideCountH; i++)
	inc	-1 (ix)
	jp	00110$
00108$:
	C$the_castel.c$1129$1_0$775	= .
	.globl	C$the_castel.c$1129$1_0$775
;./the-castel.c:1129: return FALSE;
	xor	a, a
00112$:
	C$the_castel.c$1130$1_0$775	= .
	.globl	C$the_castel.c$1130$1_0$775
;./the-castel.c:1130: }
	ld	sp, ix
	pop	ix
	C$the_castel.c$1130$1_0$775	= .
	.globl	C$the_castel.c$1130$1_0$775
	XG$isOnPlatformH$0$0	= .
	.globl	XG$isOnPlatformH$0$0
	ret
	G$isOnPlatformV$0$0	= .
	.globl	G$isOnPlatformV$0$0
	C$the_castel.c$1135$1_0$782	= .
	.globl	C$the_castel.c$1135$1_0$782
;./the-castel.c:1135: bool isOnPlatformV(u8 *X, u8 *Y)
;	---------------------------------
; Function isOnPlatformV
; ---------------------------------
_isOnPlatformV::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	push	af
	ld	c, e
	ld	b, d
	C$the_castel.c$1137$4_0$786	= .
	.globl	C$the_castel.c$1137$4_0$786
;./the-castel.c:1137: for (u8 i = 0; i < g_SlideCountV; i++)
	ld	a, (bc)
	ld	-4 (ix), a
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-1 (ix), #0x00
00110$:
	ld	hl, #_g_SlideCountV
	ld	a, -1 (ix)
	sub	a, (hl)
	jp	NC, 00108$
	C$the_castel.c$1139$3_0$784	= .
	.globl	C$the_castel.c$1139$3_0$784
;./the-castel.c:1139: if ((*X < g_platformV[i].X - 16) || (*X > g_platformV[i].X + 16))
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	iy, #_g_platformV
	add	iy, de
	ld	e, 0 (iy)
	ld	d, #0x00
	ld	a, e
	add	a, #0xf0
	ld	-6 (ix), a
	ld	a, d
	adc	a, #0xff
	ld	-5 (ix), a
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	M, 00111$
	ld	a, e
	add	a, #0x10
	ld	e, a
	jr	NC, 00145$
	inc	d
00145$:
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00146$
	xor	a, #0x80
00146$:
	jp	M, 00111$
	C$the_castel.c$1145$4_0$786	= .
	.globl	C$the_castel.c$1145$4_0$786
;./the-castel.c:1145: if ((*Y + 17 > g_platformV[i].Y) && (*Y + 17 < g_platformV[i].Y + 8))
	ld	e, -4 (ix)
	ld	d, #0x00
	ld	hl, #0x0011
	add	hl, de
	push	iy
	ex	de, hl
	pop	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	P, 00111$
	push	de
	ld	de, #0x0008
	add	hl, de
	pop	de
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	PO, 00148$
	xor	a, #0x80
00148$:
	jp	P, 00111$
	C$the_castel.c$1147$5_0$787	= .
	.globl	C$the_castel.c$1147$5_0$787
;./the-castel.c:1147: *Y = g_platformV[i].Y - 16;
	ld	a, -2 (ix)
	add	a, #0xf0
	ld	(bc), a
	C$the_castel.c$1148$5_0$787	= .
	.globl	C$the_castel.c$1148$5_0$787
;./the-castel.c:1148: return TRUE;
	ld	a, #0x01
	jp	00112$
00111$:
	C$the_castel.c$1137$2_0$783	= .
	.globl	C$the_castel.c$1137$2_0$783
;./the-castel.c:1137: for (u8 i = 0; i < g_SlideCountV; i++)
	inc	-1 (ix)
	jp	00110$
00108$:
	C$the_castel.c$1152$1_0$782	= .
	.globl	C$the_castel.c$1152$1_0$782
;./the-castel.c:1152: return FALSE;
	xor	a, a
00112$:
	C$the_castel.c$1153$1_0$782	= .
	.globl	C$the_castel.c$1153$1_0$782
;./the-castel.c:1153: }
	ld	sp, ix
	pop	ix
	C$the_castel.c$1153$1_0$782	= .
	.globl	C$the_castel.c$1153$1_0$782
	XG$isOnPlatformV$0$0	= .
	.globl	XG$isOnPlatformV$0$0
	ret
	G$updateCharacter$0$0	= .
	.globl	G$updateCharacter$0$0
	C$the_castel.c$1160$1_0$789	= .
	.globl	C$the_castel.c$1160$1_0$789
;./the-castel.c:1160: void updateCharacter(struct Character *ply)
;	---------------------------------
; Function updateCharacter
; ---------------------------------
_updateCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
	C$the_castel.c$1163$2_0$789	= .
	.globl	C$the_castel.c$1163$2_0$789
;./the-castel.c:1163: u8 dir = 0;
	ld	-12 (ix), #0x00
	C$the_castel.c$1164$1_0$789	= .
	.globl	C$the_castel.c$1164$1_0$789
;./the-castel.c:1164: ply->DX = 0;
	ld	a, -2 (ix)
	add	a, #0x03
	ld	-11 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x00
	C$the_castel.c$1165$1_0$789	= .
	.globl	C$the_castel.c$1165$1_0$789
;./the-castel.c:1165: ply->DY = 0;
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-9 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x00
	C$the_castel.c$1168$1_0$789	= .
	.globl	C$the_castel.c$1168$1_0$789
;./the-castel.c:1168: if (ply->Input & INPUT_RIGHT)
	ld	a, -2 (ix)
	add	a, #0x05
	ld	-5 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	bit	0, -3 (ix)
	jr	Z, 00105$
	C$the_castel.c$1170$2_0$790	= .
	.globl	C$the_castel.c$1170$2_0$790
;./the-castel.c:1170: ply->DX++;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	inc	(hl)
	C$the_castel.c$1171$2_0$790	= .
	.globl	C$the_castel.c$1171$2_0$790
;./the-castel.c:1171: ply->bMoving = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	C$the_castel.c$1172$2_0$790	= .
	.globl	C$the_castel.c$1172$2_0$790
;./the-castel.c:1172: dir = 1;
	ld	-12 (ix), #0x01
	jp	00106$
00105$:
	C$the_castel.c$1174$1_0$789	= .
	.globl	C$the_castel.c$1174$1_0$789
;./the-castel.c:1174: else if (ply->Input & INPUT_LEFT)
	bit	1, -3 (ix)
	jr	Z, 00102$
	C$the_castel.c$1176$2_0$791	= .
	.globl	C$the_castel.c$1176$2_0$791
;./the-castel.c:1176: ply->DX--;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	dec	a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
	C$the_castel.c$1177$2_0$791	= .
	.globl	C$the_castel.c$1177$2_0$791
;./the-castel.c:1177: ply->bMoving = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	C$the_castel.c$1178$2_0$791	= .
	.globl	C$the_castel.c$1178$2_0$791
;./the-castel.c:1178: dir = 0;
	ld	-12 (ix), #0x00
	jp	00106$
00102$:
	C$the_castel.c$1181$1_0$789	= .
	.globl	C$the_castel.c$1181$1_0$789
;./the-castel.c:1181: ply->bMoving = FALSE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
00106$:
	C$the_castel.c$1183$1_0$789	= .
	.globl	C$the_castel.c$1183$1_0$789
;./the-castel.c:1183: if (ply->bInAir) // Jump/fall
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
	ld	a, (bc)
	or	a, a
	jr	Z, 00117$
	C$the_castel.c$1185$2_0$792	= .
	.globl	C$the_castel.c$1185$2_0$792
;./the-castel.c:1185: ply->DY -= ply->VelocityY / 4;
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	inc	de
	inc	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	-4 (ix), l
	ld	-3 (ix), h
	bit	7, h
	jr	Z, 00140$
	inc	hl
	inc	hl
	inc	hl
	ld	-4 (ix), l
	ld	-3 (ix), h
00140$:
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	sra	h
	rr	l
	sra	h
	rr	l
	ld	a, -5 (ix)
	sub	a, l
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), a
	C$the_castel.c$1186$2_0$792	= .
	.globl	C$the_castel.c$1186$2_0$792
;./the-castel.c:1186: ply->VelocityY -= GRAVITY;
	ld	a, (de)
	dec	a
	ld	-3 (ix), a
	ld	(de), a
	C$the_castel.c$1188$2_0$792	= .
	.globl	C$the_castel.c$1188$2_0$792
;./the-castel.c:1188: if (ply->VelocityY < -FORCE)
	ld	a, -3 (ix)
	xor	a, #0x80
	sub	a, #0x71
	jr	NC, 00118$
	C$the_castel.c$1189$2_0$792	= .
	.globl	C$the_castel.c$1189$2_0$792
;./the-castel.c:1189: ply->VelocityY = -FORCE;
	ld	a, #0xf1
	ld	(de), a
	jp	00118$
00117$:
	C$the_castel.c$1191$1_0$789	= .
	.globl	C$the_castel.c$1191$1_0$789
;./the-castel.c:1191: else if (ply->Input & INPUT_JUMP)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	bit	2, a
	jr	Z, 00114$
	C$the_castel.c$1193$2_0$793	= .
	.globl	C$the_castel.c$1193$2_0$793
;./the-castel.c:1193: ply->bInAir = TRUE;
	ld	a, #0x01
	ld	(bc), a
	C$the_castel.c$1194$2_0$793	= .
	.globl	C$the_castel.c$1194$2_0$793
;./the-castel.c:1194: ply->VelocityY = FORCE;
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x0f
	jp	00118$
00114$:
	C$the_castel.c$1196$1_0$789	= .
	.globl	C$the_castel.c$1196$1_0$789
;./the-castel.c:1196: else if (ply->Input & INPUT_GET)
	bit	3, a
	jr	Z, 00118$
	C$the_castel.c$1198$2_0$794	= .
	.globl	C$the_castel.c$1198$2_0$794
;./the-castel.c:1198: if (interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12))
	ld	a, (#_g_Player + 14)
	add	a, #0x0c
	ld	e, a
	ld	a, (#_g_Player + 13)
	add	a, #0x08
	ld	d, a
	push	bc
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_interact
	pop	bc
00118$:
	C$the_castel.c$1205$2_0$796	= .
	.globl	C$the_castel.c$1205$2_0$796
;./the-castel.c:1205: u8 act = ACTION_IDLE;
	ld	-3 (ix), #0x00
	C$the_castel.c$1183$1_2$789	= .
	.globl	C$the_castel.c$1183$1_2$789
;./the-castel.c:1183: if (ply->bInAir) // Jump/fall
	ld	a, (bc)
	C$the_castel.c$1206$1_1$796	= .
	.globl	C$the_castel.c$1206$1_1$796
;./the-castel.c:1206: if (ply->bInAir && (ply->VelocityY >= 0))
	ld	c, a
	or	a, a
	jr	Z, 00135$
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	bit	7, (hl)
	jr	NZ, 00135$
	C$the_castel.c$1208$2_1$797	= .
	.globl	C$the_castel.c$1208$2_1$797
;./the-castel.c:1208: act = ACTION_JUMP;
	ld	-3 (ix), #0x02
	jp	00136$
00135$:
	C$the_castel.c$1210$1_1$796	= .
	.globl	C$the_castel.c$1210$1_1$796
;./the-castel.c:1210: else if (ply->bInAir)
	ld	a, c
	or	a, a
	jr	Z, 00132$
	C$the_castel.c$1212$2_1$798	= .
	.globl	C$the_castel.c$1212$2_1$798
;./the-castel.c:1212: if (((g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH) || (g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV)) > 0 && (isOnPlatformH(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY) || isOnPlatformV(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY)))
	ld	bc, #_g_Levels+0
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #16
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00142$
	ld	hl, #17
	add	hl, de
	ld	a, (hl)
	or	a,a
	jr	NZ, 00142$
	ld	c,a
	jp	00143$
00142$:
	ld	c, #0x01
00143$:
	xor	a, a
	sub	a, c
	jp	PO, 00233$
	xor	a, #0x80
00233$:
	jp	P, 00120$
	ld	de, #(_g_Player + 14)
	ld	hl, #(_g_Player + 13)
	call	_isOnPlatformH
	or	a, a
	jr	NZ, 00119$
	ld	de, #(_g_Player + 14)
	ld	hl, #(_g_Player + 13)
	call	_isOnPlatformV
	or	a, a
	jr	Z, 00120$
00119$:
	C$the_castel.c$1214$3_1$799	= .
	.globl	C$the_castel.c$1214$3_1$799
;./the-castel.c:1214: act = ACTION_IDLE;
	ld	-3 (ix), #0x00
	C$the_castel.c$1215$3_1$799	= .
	.globl	C$the_castel.c$1215$3_1$799
;./the-castel.c:1215: ply->DY += 2;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	add	a, #0x02
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	jp	00136$
00120$:
	C$the_castel.c$1219$3_1$800	= .
	.globl	C$the_castel.c$1219$3_1$800
;./the-castel.c:1219: act = ACTION_FALL;
	ld	-3 (ix), #0x03
	jp	00136$
00132$:
	C$the_castel.c$1222$1_1$796	= .
	.globl	C$the_castel.c$1222$1_1$796
;./the-castel.c:1222: else if (ply->bMoving)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00136$
	C$the_castel.c$1224$2_1$801	= .
	.globl	C$the_castel.c$1224$2_1$801
;./the-castel.c:1224: if (dir == 1)
	ld	a, -12 (ix)
	dec	a
	jr	NZ, 00127$
	C$the_castel.c$1226$3_1$802	= .
	.globl	C$the_castel.c$1226$3_1$802
;./the-castel.c:1226: act = ACTION_MOVE_RIGHT;
	ld	-3 (ix), #0x04
	jp	00136$
00127$:
	C$the_castel.c$1228$2_1$801	= .
	.globl	C$the_castel.c$1228$2_1$801
;./the-castel.c:1228: else if (dir == 0)
	ld	a, -12 (ix)
	or	a, a
	jr	NZ, 00136$
	C$the_castel.c$1229$2_1$801	= .
	.globl	C$the_castel.c$1229$2_1$801
;./the-castel.c:1229: act = ACTION_MOVE;
	ld	-3 (ix), #0x01
00136$:
	C$the_castel.c$1232$1_2$803	= .
	.globl	C$the_castel.c$1232$1_2$803
;./the-castel.c:1232: Game_Pawn *pawn = &ply->Pawn;
	ld	a, -2 (ix)
	add	a, #0x08
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	C$the_castel.c$1233$1_2$803	= .
	.globl	C$the_castel.c$1233$1_2$803
;./the-castel.c:1233: GamePawn_SetAction(pawn, act);
	push	de
	ld	a, -3 (ix)
	push	af
	inc	sp
;	spillPairReg hl
;	spillPairReg hl
	ex	de,hl
;	spillPairReg hl
;	spillPairReg hl
	call	_GamePawn_SetAction
	pop	de
	C$the_castel.c$1234$1_2$803	= .
	.globl	C$the_castel.c$1234$1_2$803
;./the-castel.c:1234: GamePawn_SetMovement(pawn, ply->DX, ply->DY);
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	b, (hl)
	push	de
	push	af
	inc	sp
	push	bc
	inc	sp
;	spillPairReg hl
;	spillPairReg hl
	ex	de,hl
;	spillPairReg hl
;	spillPairReg hl
	call	_GamePawn_SetMovement
	pop	de
	C$the_castel.c$1235$1_2$803	= .
	.globl	C$the_castel.c$1235$1_2$803
;./the-castel.c:1235: GamePawn_Update(pawn);
	ex	de, hl
	call	_GamePawn_Update
	C$the_castel.c$1236$1_2$789	= .
	.globl	C$the_castel.c$1236$1_2$789
;./the-castel.c:1236: }
	ld	sp, ix
	pop	ix
	C$the_castel.c$1236$1_2$789	= .
	.globl	C$the_castel.c$1236$1_2$789
	XG$updateCharacter$0$0	= .
	.globl	XG$updateCharacter$0$0
	ret
	G$updateGenericEnemy$0$0	= .
	.globl	G$updateGenericEnemy$0$0
	C$the_castel.c$1245$1_2$806	= .
	.globl	C$the_castel.c$1245$1_2$806
;./the-castel.c:1245: void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite)
;	---------------------------------
; Function updateGenericEnemy
; ---------------------------------
_updateGenericEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-12
	add	iy, sp
	ld	sp, iy
	ex	de, hl
	C$the_castel.c$1248$2_0$806	= .
	.globl	C$the_castel.c$1248$2_0$806
;./the-castel.c:1248: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	ld	c, #0x00
00126$:
	ld	a, c
	sub	a, 4 (ix)
	jp	NC, 00128$
	C$the_castel.c$1250$3_0$807	= .
	.globl	C$the_castel.c$1250$3_0$807
;./the-castel.c:1250: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, de
	ex	(sp), hl
	C$the_castel.c$1251$3_0$807	= .
	.globl	C$the_castel.c$1251$3_0$807
;./the-castel.c:1251: if (enemy->State == 1)
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	a
	jp	NZ,00123$
	C$the_castel.c$1253$4_0$808	= .
	.globl	C$the_castel.c$1253$4_0$808
;./the-castel.c:1253: if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1) // 7
	ld	a, -12 (ix)
	add	a, #0x01
	ld	-10 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	b, (hl)
	pop	hl
	push	hl
	ld	a, (hl)
	add	a, #0x07
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_physicsCollisionEnemy
	ld	b, a
	pop	de
	ld	a, b
	pop	bc
	ld	b, a
	C$the_castel.c$1255$2_0$806	= .
	.globl	C$the_castel.c$1255$2_0$806
;./the-castel.c:1255: if (enemy->Direction < 0)
	ld	a, -12 (ix)
	add	a, #0x04
	ld	-8 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	C$the_castel.c$1257$2_0$806	= .
	.globl	C$the_castel.c$1257$2_0$806
;./the-castel.c:1257: if (enemy->MoveHV == 0)
	ld	a, -12 (ix)
	add	a, #0x09
	ld	-6 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	C$the_castel.c$1255$2_0$806	= .
	.globl	C$the_castel.c$1255$2_0$806
;./the-castel.c:1255: if (enemy->Direction < 0)
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	C$the_castel.c$1253$4_0$808	= .
	.globl	C$the_castel.c$1253$4_0$808
;./the-castel.c:1253: if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1) // 7
	ld	a, b
	or	a, a
	jr	NZ, 00120$
	C$the_castel.c$1257$2_0$806	= .
	.globl	C$the_castel.c$1257$2_0$806
;./the-castel.c:1257: if (enemy->MoveHV == 0)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	b, (hl)
	C$the_castel.c$1255$5_0$809	= .
	.globl	C$the_castel.c$1255$5_0$809
;./the-castel.c:1255: if (enemy->Direction < 0)
	bit	7, -3 (ix)
	jr	Z, 00108$
	C$the_castel.c$1257$6_0$810	= .
	.globl	C$the_castel.c$1257$6_0$810
;./the-castel.c:1257: if (enemy->MoveHV == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00102$
	C$the_castel.c$1258$6_0$810	= .
	.globl	C$the_castel.c$1258$6_0$810
;./the-castel.c:1258: enemy->X--;
	pop	hl
	push	hl
	ld	a, (hl)
	dec	a
	pop	hl
	push	hl
	ld	(hl), a
	jp	00121$
00102$:
	C$the_castel.c$1260$6_0$810	= .
	.globl	C$the_castel.c$1260$6_0$810
;./the-castel.c:1260: enemy->Y--;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	dec	a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), a
	jp	00121$
00108$:
	C$the_castel.c$1264$6_0$811	= .
	.globl	C$the_castel.c$1264$6_0$811
;./the-castel.c:1264: if (enemy->MoveHV == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00105$
	C$the_castel.c$1265$6_0$811	= .
	.globl	C$the_castel.c$1265$6_0$811
;./the-castel.c:1265: enemy->X++;
	pop	hl
	push	hl
	ld	a, (hl)
	inc	a
	pop	hl
	push	hl
	ld	(hl), a
	jp	00121$
00105$:
	C$the_castel.c$1267$6_0$811	= .
	.globl	C$the_castel.c$1267$6_0$811
;./the-castel.c:1267: enemy->Y++;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	inc	(hl)
	jp	00121$
00120$:
	C$the_castel.c$1272$5_0$812	= .
	.globl	C$the_castel.c$1272$5_0$812
;./the-castel.c:1272: enemy->Direction *= -1;
	xor	a, a
	sub	a, -4 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -3 (ix)
	ld	-1 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	C$the_castel.c$1257$2_0$806	= .
	.globl	C$the_castel.c$1257$2_0$806
;./the-castel.c:1257: if (enemy->MoveHV == 0)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	b, (hl)
	C$the_castel.c$1273$5_0$812	= .
	.globl	C$the_castel.c$1273$5_0$812
;./the-castel.c:1273: if (enemy->Direction < 0)
	bit	7, -1 (ix)
	jr	Z, 00117$
	C$the_castel.c$1275$6_0$813	= .
	.globl	C$the_castel.c$1275$6_0$813
;./the-castel.c:1275: if (enemy->MoveHV == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00111$
	C$the_castel.c$1276$6_0$813	= .
	.globl	C$the_castel.c$1276$6_0$813
;./the-castel.c:1276: enemy->X--;
	pop	hl
	push	hl
	ld	a, (hl)
	dec	a
	pop	hl
	push	hl
	ld	(hl), a
	jp	00121$
00111$:
	C$the_castel.c$1278$6_0$813	= .
	.globl	C$the_castel.c$1278$6_0$813
;./the-castel.c:1278: enemy->Y--;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	dec	a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), a
	jp	00121$
00117$:
	C$the_castel.c$1282$6_0$814	= .
	.globl	C$the_castel.c$1282$6_0$814
;./the-castel.c:1282: if (enemy->MoveHV == 0)
	ld	a, b
	or	a, a
	jr	NZ, 00114$
	C$the_castel.c$1283$6_0$814	= .
	.globl	C$the_castel.c$1283$6_0$814
;./the-castel.c:1283: enemy->X++;
	pop	hl
	push	hl
	ld	a, (hl)
	inc	a
	pop	hl
	push	hl
	ld	(hl), a
	jp	00121$
00114$:
	C$the_castel.c$1285$6_0$814	= .
	.globl	C$the_castel.c$1285$6_0$814
;./the-castel.c:1285: enemy->Y++;
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	inc	(hl)
00121$:
	C$the_castel.c$1296$4_0$808	= .
	.globl	C$the_castel.c$1296$4_0$808
;./the-castel.c:1296: VDP_SetSpritePosition(idFirstSprite + nEnemy, enemy->X, enemy->Y);
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	b, (hl)
	pop	hl
	push	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, 5 (ix)
	add	a, c
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	push	bc
	inc	sp
	ld	a, h
	call	_VDP_SetSpritePosition
	pop	de
	pop	bc
00123$:
	C$the_castel.c$1248$2_0$806	= .
	.globl	C$the_castel.c$1248$2_0$806
;./the-castel.c:1248: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	c
	jp	00126$
00128$:
	C$the_castel.c$1301$2_0$806	= .
	.globl	C$the_castel.c$1301$2_0$806
;./the-castel.c:1301: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
	G$genericControl$0$0	= .
	.globl	G$genericControl$0$0
	C$the_castel.c$1308$2_0$815	= .
	.globl	C$the_castel.c$1308$2_0$815
;./the-castel.c:1308: void genericControl()
;	---------------------------------
; Function genericControl
; ---------------------------------
_genericControl::
	C$the_castel.c$1312$1_0$815	= .
	.globl	C$the_castel.c$1312$1_0$815
;./the-castel.c:1312: if (isUnderTheWater(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY))
	ld	hl, #(_g_Player + 14)
	ld	b, (hl)
	ld	hl, #(_g_Player + 13)
	ld	c, (hl)
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_isUnderTheWater
	or	a, a
	jr	Z, 00110$
	C$the_castel.c$1314$2_0$816	= .
	.globl	C$the_castel.c$1314$2_0$816
;./the-castel.c:1314: if (IsUnderWater)
	ld	a, (_IsUnderWater+0)
	or	a, a
	jr	Z, 00107$
	C$the_castel.c$1316$3_0$817	= .
	.globl	C$the_castel.c$1316$3_0$817
;./the-castel.c:1316: if ((g_SecondCounter - g_DelayRemoveLife) > 3)
	ld	a, (_g_SecondCounter+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_DelayRemoveLife+0)
	ld	c, a
	ld	b, #0x00
	cp	a, a
	sbc	hl, bc
	ld	a, #0x03
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00158$
	xor	a, #0x80
00158$:
	jp	P, 00111$
	C$the_castel.c$1318$4_0$818	= .
	.globl	C$the_castel.c$1318$4_0$818
;./the-castel.c:1318: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00102$
	C$the_castel.c$1320$5_0$819	= .
	.globl	C$the_castel.c$1320$5_0$819
;./the-castel.c:1320: displayLife();
	call	_displayLife
	C$the_castel.c$1322$5_0$819	= .
	.globl	C$the_castel.c$1322$5_0$819
;./the-castel.c:1322: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
	C$the_castel.c$1324$5_0$819	= .
	.globl	C$the_castel.c$1324$5_0$819
;./the-castel.c:1324: IsUnderWater = FALSE;
	ld	hl, #_IsUnderWater
	ld	(hl), #0x00
	jp	00111$
00102$:
	C$the_castel.c$1328$5_0$820	= .
	.globl	C$the_castel.c$1328$5_0$820
;./the-castel.c:1328: stopMusicPlayback();
	call	_stopMusicPlayback
	C$the_castel.c$1329$5_0$820	= .
	.globl	C$the_castel.c$1329$5_0$820
;./the-castel.c:1329: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00111$
00107$:
	C$the_castel.c$1335$3_0$821	= .
	.globl	C$the_castel.c$1335$3_0$821
;./the-castel.c:1335: g_DelayRemoveLife = g_SecondCounter;
	ld	a, (_g_SecondCounter+0)
	ld	(_g_DelayRemoveLife+0), a
	C$the_castel.c$1336$3_0$821	= .
	.globl	C$the_castel.c$1336$3_0$821
;./the-castel.c:1336: IsUnderWater = TRUE;
	ld	hl, #_IsUnderWater
	ld	(hl), #0x01
	jp	00111$
00110$:
	C$the_castel.c$1342$2_0$822	= .
	.globl	C$the_castel.c$1342$2_0$822
;./the-castel.c:1342: IsUnderWater = FALSE;  // Non siamo più in collisione
	ld	hl, #_IsUnderWater
	ld	(hl), #0x00
	C$the_castel.c$1343$2_0$822	= .
	.globl	C$the_castel.c$1343$2_0$822
;./the-castel.c:1343: g_DelayRemoveLife = 0; // Azzera il tempo dopo il quale si va a rimuovere una vita
	ld	hl, #_g_DelayRemoveLife
	ld	(hl), #0x00
00111$:
	C$the_castel.c$1351$1_0$815	= .
	.globl	C$the_castel.c$1351$1_0$815
;./the-castel.c:1351: if (getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_getMoney
	or	a, a
	jr	NZ, 00112$
	C$the_castel.c$1352$1_0$815	= .
	.globl	C$the_castel.c$1352$1_0$815
;./the-castel.c:1352: getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x04
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_getMoney
	or	a, a
	jr	Z, 00113$
00112$:
	C$the_castel.c$1356$2_0$823	= .
	.globl	C$the_castel.c$1356$2_0$823
;./the-castel.c:1356: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
	C$the_castel.c$1357$2_0$823	= .
	.globl	C$the_castel.c$1357$2_0$823
;./the-castel.c:1357: g_Player.Score++;
	ld	bc, #_g_Player + 6
	ld	a, (bc)
	inc	a
	ld	(bc), a
	C$the_castel.c$1358$2_0$823	= .
	.globl	C$the_castel.c$1358$2_0$823
;./the-castel.c:1358: updateScore();
	call	_updateScore
	C$the_castel.c$1360$2_0$823	= .
	.globl	C$the_castel.c$1360$2_0$823
;./the-castel.c:1360: PlayBankSFX(11, 15);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_PlayBankSFX
00113$:
	C$the_castel.c$1364$1_0$815	= .
	.globl	C$the_castel.c$1364$1_0$815
;./the-castel.c:1364: if (isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12, 1) ||
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isDanger
	or	a, a
	jr	NZ, 00116$
	C$the_castel.c$1365$1_0$815	= .
	.globl	C$the_castel.c$1365$1_0$815
;./the-castel.c:1365: isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4, 1))
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x04
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	a, #0x01
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isDanger
00116$:
	C$the_castel.c$1371$1_0$815	= .
	.globl	C$the_castel.c$1371$1_0$815
;./the-castel.c:1371: if (isPassage(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isPassage
	or	a, a
	ret	NZ
	C$the_castel.c$1372$1_0$815	= .
	.globl	C$the_castel.c$1372$1_0$815
;./the-castel.c:1372: isPassage(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x04
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	C$the_castel.c$1376$1_0$815	= .
	.globl	C$the_castel.c$1376$1_0$815
;./the-castel.c:1376: }
	C$the_castel.c$1376$1_0$815	= .
	.globl	C$the_castel.c$1376$1_0$815
	XG$genericControl$0$0	= .
	.globl	XG$genericControl$0$0
	jp	_isPassage
	G$State_Initialize$0$0	= .
	.globl	G$State_Initialize$0$0
	C$the_castel.c$1383$1_0$826	= .
	.globl	C$the_castel.c$1383$1_0$826
;./the-castel.c:1383: bool State_Initialize()
;	---------------------------------
; Function State_Initialize
; ---------------------------------
_State_Initialize::
	C$the_castel.c$1387$1_0$826	= .
	.globl	C$the_castel.c$1387$1_0$826
;./the-castel.c:1387: inizializePT3();
	call	_inizializePT3
	C$the_castel.c$1391$1_0$826	= .
	.globl	C$the_castel.c$1391$1_0$826
;./the-castel.c:1391: inizializeAYFX();
	call	_inizializeAYFX
	C$the_castel.c$1393$1_0$826	= .
	.globl	C$the_castel.c$1393$1_0$826
;./the-castel.c:1393: setChannel();
	call	_setChannel
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
	xor	a, a
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:688: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
	C$the_castel.c$1409$1_0$826	= .
	.globl	C$the_castel.c$1409$1_0$826
;./the-castel.c:1409: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
	C$the_castel.c$1421$1_0$826	= .
	.globl	C$the_castel.c$1421$1_0$826
;./the-castel.c:1421: VDP_LoadPattern_GM1_Pletter(g_DataBackground_Patterns, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_DataBackground_Patterns
	call	_VDP_LoadPattern_GM1_Pletter
	C$the_castel.c$1424$1_0$826	= .
	.globl	C$the_castel.c$1424$1_0$826
;./the-castel.c:1424: Print_SetMode(PRINT_MODE_TEXT);
	ld	a, #0x04
	call	_Print_SetMode
;./the-castel.c:1425: Print_SetFontEx(8, 8, 1, 1, ' ', '_', g_DataBackground_Patterns + 192);
	ld	bc, #_g_DataBackground_Patterns + 192
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	de, #_g_PrintData + 1
	ld	a, #0x08
	ld	(de), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), #0x20
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0x5f
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #(_g_PrintData + 22)
	ld	(hl), #0x40
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 28)), bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
	ld	a, (de)
	ld	e, a
	ld	d, #0x00
	ex	de,hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	ld	((_g_PrintData + 30)), bc
	C$the_castel.c$1426$1_0$826	= .
	.globl	C$the_castel.c$1426$1_0$826
;./the-castel.c:1426: Print_Initialize();
	call	_Print_Initialize
	C$the_castel.c$1427$1_0$826	= .
	.globl	C$the_castel.c$1427$1_0$826
;./the-castel.c:1427: g_PrintData.PatternOffset = 192;
	ld	hl, #(_g_PrintData + 32)
	ld	(hl), #0xc0
	C$the_castel.c$1430$1_0$826	= .
	.globl	C$the_castel.c$1430$1_0$826
;./the-castel.c:1430: setColorTiles();
	call	_setColorTiles
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:1051: inline void VDP_SetSpriteFlag(u8 flag) { VDP_RegWriteBakMask(1, (u8)~(R01_ST|R01_MAG), flag); }
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, #0xfc
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
	C$the_castel.c$1464$1_0$826	= .
	.globl	C$the_castel.c$1464$1_0$826
;./the-castel.c:1464: Pletter_UnpackToVRAM(g_DataSprtLayer, g_SpritePatternLow);
	ld	de, (_g_SpritePatternLow)
	ld	hl, #_g_DataSprtLayer
	call	_Pletter_UnpackToVRAM
	C$the_castel.c$1466$1_0$826	= .
	.globl	C$the_castel.c$1466$1_0$826
;./the-castel.c:1466: Game_SetState(State_Preset);
	ld	hl, #_State_Preset
	call	_Game_SetState
	C$the_castel.c$1468$1_0$826	= .
	.globl	C$the_castel.c$1468$1_0$826
;./the-castel.c:1468: return FALSE; // Frame finished
	xor	a, a
	C$the_castel.c$1469$1_0$826	= .
	.globl	C$the_castel.c$1469$1_0$826
;./the-castel.c:1469: }
	C$the_castel.c$1469$1_0$826	= .
	.globl	C$the_castel.c$1469$1_0$826
	XG$State_Initialize$0$0	= .
	.globl	XG$State_Initialize$0$0
	ret
	G$State_Game$0$0	= .
	.globl	G$State_Game$0$0
	C$the_castel.c$1476$1_0$839	= .
	.globl	C$the_castel.c$1476$1_0$839
;./the-castel.c:1476: bool State_Game()
;	---------------------------------
; Function State_Game
; ---------------------------------
_State_Game::
	C$the_castel.c$1483$1_0$839	= .
	.globl	C$the_castel.c$1483$1_0$839
;./the-castel.c:1483: GamePawn_Draw(&g_Player.Pawn);
	ld	hl, #(_g_Player + 8)
	call	_GamePawn_Draw
	C$the_castel.c$1490$1_0$839	= .
	.globl	C$the_castel.c$1490$1_0$839
;./the-castel.c:1490: updateCharacter(&g_Player);
	ld	hl, #_g_Player
	call	_updateCharacter
	C$the_castel.c$1496$1_0$839	= .
	.globl	C$the_castel.c$1496$1_0$839
;./the-castel.c:1496: genericControl();
	call	_genericControl
	C$the_castel.c$1500$1_0$839	= .
	.globl	C$the_castel.c$1500$1_0$839
;./the-castel.c:1500: readInputControl();
	call	_readInputControl
	C$the_castel.c$1503$1_0$839	= .
	.globl	C$the_castel.c$1503$1_0$839
;./the-castel.c:1503: if (g_Frame == 50)
	ld	a, (_g_Frame+0)
	sub	a, #0x32
	jr	NZ, 00102$
	C$the_castel.c$1505$2_0$840	= .
	.globl	C$the_castel.c$1505$2_0$840
;./the-castel.c:1505: g_SecondCounter++;
	ld	hl, #_g_SecondCounter
	inc	(hl)
	C$the_castel.c$1506$2_0$840	= .
	.globl	C$the_castel.c$1506$2_0$840
;./the-castel.c:1506: g_CatchEnemy++;
	ld	hl, #_g_CatchEnemy
	inc	(hl)
	C$the_castel.c$1507$2_0$840	= .
	.globl	C$the_castel.c$1507$2_0$840
;./the-castel.c:1507: g_Frame = 0;
	ld	hl, #_g_Frame
	ld	(hl), #0x00
00102$:
	C$the_castel.c$1518$1_0$839	= .
	.globl	C$the_castel.c$1518$1_0$839
;./the-castel.c:1518: if (g_GameFrame % 2 == 0)
	ld	hl, #_g_GameFrame
	bit	0, (hl)
	jp	NZ,00104$
	C$the_castel.c$1537$2_0$841	= .
	.globl	C$the_castel.c$1537$2_0$841
;./the-castel.c:1537: g_DangerCounter++;
	ld	hl, #_g_DangerCounter
	inc	(hl)
	C$the_castel.c$1543$2_0$841	= .
	.globl	C$the_castel.c$1543$2_0$841
;./the-castel.c:1543: updateGenericEnemy(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber, FIRST_ID_SKELETOR);
	ld	bc, #_g_Levels+0
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000c
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x06
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Enemy
	call	_updateGenericEnemy
	pop	bc
	C$the_castel.c$1551$2_0$841	= .
	.globl	C$the_castel.c$1551$2_0$841
;./the-castel.c:1551: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000c
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	de, #_g_Enemy
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
	C$the_castel.c$1557$2_0$841	= .
	.globl	C$the_castel.c$1557$2_0$841
;./the-castel.c:1557: updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber, FIRST_ID_GHOST);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000d
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x09
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Ghost
	call	_updateGenericEnemy
	pop	bc
	C$the_castel.c$1565$2_0$841	= .
	.globl	C$the_castel.c$1565$2_0$841
;./the-castel.c:1565: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	de, #_g_Ghost
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
	C$the_castel.c$1571$2_0$841	= .
	.globl	C$the_castel.c$1571$2_0$841
;./the-castel.c:1571: updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber, FIRST_ID_SPIDER);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000e
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x0c
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Spider
	call	_updateGenericEnemy
	pop	bc
	C$the_castel.c$1579$2_0$841	= .
	.globl	C$the_castel.c$1579$2_0$841
;./the-castel.c:1579: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	de, #_g_Spider
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
	C$the_castel.c$1585$2_0$841	= .
	.globl	C$the_castel.c$1585$2_0$841
;./the-castel.c:1585: updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber, FIRST_ID_BAT);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000f
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x0f
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Bat
	call	_updateGenericEnemy
	pop	bc
	C$the_castel.c$1593$2_0$841	= .
	.globl	C$the_castel.c$1593$2_0$841
;./the-castel.c:1593: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000f
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	de, #_g_Bat
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
	C$the_castel.c$1597$2_0$841	= .
	.globl	C$the_castel.c$1597$2_0$841
;./the-castel.c:1597: updateGenericEnemy(&g_platformH[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH, FIRST_ID_SLIDE_H);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x0010
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x12
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_platformH
	call	_updateGenericEnemy
	pop	bc
	C$the_castel.c$1598$2_0$841	= .
	.globl	C$the_castel.c$1598$2_0$841
;./the-castel.c:1598: updateGenericEnemy(&g_platformV[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV, FIRST_ID_SLIDE_V);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x0011
	add	hl, de
	ld	b, (hl)
	ld	a, #0x15
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl, #_g_platformV
	call	_updateGenericEnemy
00104$:
	C$the_castel.c$1600$1_0$839	= .
	.globl	C$the_castel.c$1600$1_0$839
;./the-castel.c:1600: g_Frame++;
	ld	hl, #_g_Frame
	inc	(hl)
	C$the_castel.c$1602$1_0$839	= .
	.globl	C$the_castel.c$1602$1_0$839
;./the-castel.c:1602: return TRUE;
	ld	a, #0x01
	C$the_castel.c$1603$1_0$839	= .
	.globl	C$the_castel.c$1603$1_0$839
;./the-castel.c:1603: }
	C$the_castel.c$1603$1_0$839	= .
	.globl	C$the_castel.c$1603$1_0$839
	XG$State_Game$0$0	= .
	.globl	XG$State_Game$0$0
	ret
	G$State_Preset$0$0	= .
	.globl	G$State_Preset$0$0
	C$the_castel.c$1610$1_0$842	= .
	.globl	C$the_castel.c$1610$1_0$842
;./the-castel.c:1610: bool State_Preset()
;	---------------------------------
; Function State_Preset
; ---------------------------------
_State_Preset::
	C$the_castel.c$1613$1_0$842	= .
	.globl	C$the_castel.c$1613$1_0$842
;./the-castel.c:1613: restoreLevel();
	call	_restoreLevel
	C$the_castel.c$1621$1_0$842	= .
	.globl	C$the_castel.c$1621$1_0$842
;./the-castel.c:1621: initCharacter(&g_Player, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_Player
	call	_initCharacter
	C$the_castel.c$1625$1_0$842	= .
	.globl	C$the_castel.c$1625$1_0$842
;./the-castel.c:1625: initInventory();
	call	_initInventory
	C$the_castel.c$1629$1_0$842	= .
	.globl	C$the_castel.c$1629$1_0$842
;./the-castel.c:1629: initLife();
	call	_initLife
	C$the_castel.c$1222$1_0$842	= .
	.globl	C$the_castel.c$1222$1_0$842
;./the-castel.c:1222: else if (ply->bMoving)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00102$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00104$
;./the-castel.c:1637: VDP_HideAllSprites();
00102$:
	C$the_castel.c$1638$1_0$842	= .
	.globl	C$the_castel.c$1638$1_0$842
;./the-castel.c:1638: drawLevel(0);
	xor	a, a
	call	_drawLevel
	C$the_castel.c$1640$1_0$842	= .
	.globl	C$the_castel.c$1640$1_0$842
;./the-castel.c:1640: Game_SetState(State_Game);
	ld	hl, #_State_Game
	call	_Game_SetState
	C$the_castel.c$1642$1_0$842	= .
	.globl	C$the_castel.c$1642$1_0$842
;./the-castel.c:1642: return TRUE;
	ld	a, #0x01
	C$the_castel.c$1643$1_0$842	= .
	.globl	C$the_castel.c$1643$1_0$842
;./the-castel.c:1643: }
	C$the_castel.c$1643$1_0$842	= .
	.globl	C$the_castel.c$1643$1_0$842
	XG$State_Preset$0$0	= .
	.globl	XG$State_Preset$0$0
	ret
	G$State_Pause$0$0	= .
	.globl	G$State_Pause$0$0
	C$the_castel.c$1650$1_0$847	= .
	.globl	C$the_castel.c$1650$1_0$847
;./the-castel.c:1650: bool State_Pause()
;	---------------------------------
; Function State_Pause
; ---------------------------------
_State_Pause::
	C$the_castel.c$1652$1_0$847	= .
	.globl	C$the_castel.c$1652$1_0$847
;./the-castel.c:1652: return TRUE;
	ld	a, #0x01
	C$the_castel.c$1653$1_0$847	= .
	.globl	C$the_castel.c$1653$1_0$847
;./the-castel.c:1653: }
	C$the_castel.c$1653$1_0$847	= .
	.globl	C$the_castel.c$1653$1_0$847
	XG$State_Pause$0$0	= .
	.globl	XG$State_Pause$0$0
	ret
	G$State_GameOver$0$0	= .
	.globl	G$State_GameOver$0$0
	C$the_castel.c$1660$1_0$848	= .
	.globl	C$the_castel.c$1660$1_0$848
;./the-castel.c:1660: bool State_GameOver()
;	---------------------------------
; Function State_GameOver
; ---------------------------------
_State_GameOver::
	C$the_castel.c$1222$1_0$848	= .
	.globl	C$the_castel.c$1222$1_0$848
;./the-castel.c:1222: else if (ply->bMoving)
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00105$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00107$
;./the-castel.c:1663: VDP_HideAllSprites();
00105$:
	C$the_castel.c$1665$1_0$848	= .
	.globl	C$the_castel.c$1665$1_0$848
;./the-castel.c:1665: drawLevel(GAME_OVER); // -1
	ld	a, #0x14
	call	_drawLevel
	C$the_castel.c$1668$1_0$848	= .
	.globl	C$the_castel.c$1668$1_0$848
;./the-castel.c:1668: while (Keyboard_Read(8) != 254)
00101$:
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	a, l
	sub	a, #0xfe
	jr	NZ, 00101$
	C$the_castel.c$1672$1_0$848	= .
	.globl	C$the_castel.c$1672$1_0$848
;./the-castel.c:1672: Game_SetState(State_Preset);
	ld	hl, #_State_Preset
	call	_Game_SetState
	C$the_castel.c$1674$1_0$848	= .
	.globl	C$the_castel.c$1674$1_0$848
;./the-castel.c:1674: return TRUE;
	ld	a, #0x01
	C$the_castel.c$1675$1_0$848	= .
	.globl	C$the_castel.c$1675$1_0$848
;./the-castel.c:1675: }
	C$the_castel.c$1675$1_0$848	= .
	.globl	C$the_castel.c$1675$1_0$848
	XG$State_GameOver$0$0	= .
	.globl	XG$State_GameOver$0$0
	ret
	G$VDP_LoadPattern_GM1_Pletter$0$0	= .
	.globl	G$VDP_LoadPattern_GM1_Pletter$0$0
	C$the_castel.c$1680$1_0$855	= .
	.globl	C$the_castel.c$1680$1_0$855
;./the-castel.c:1680: void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset)
;	---------------------------------
; Function VDP_LoadPattern_GM1_Pletter
; ---------------------------------
_VDP_LoadPattern_GM1_Pletter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
	C$the_castel.c$1682$1_0$855	= .
	.globl	C$the_castel.c$1682$1_0$855
;./the-castel.c:1682: Pletter_UnpackToVRAM(src, g_ScreenPatternLow + (offset * 8));
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
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_Pletter_UnpackToVRAM
	C$the_castel.c$1683$1_0$855	= .
	.globl	C$the_castel.c$1683$1_0$855
;./the-castel.c:1683: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
	G$VSyncCallback$0$0	= .
	.globl	G$VSyncCallback$0$0
	C$the_castel.c$1689$1_0$856	= .
	.globl	C$the_castel.c$1689$1_0$856
;./the-castel.c:1689: void VSyncCallback()
;	---------------------------------
; Function VSyncCallback
; ---------------------------------
_VSyncCallback::
	C$the_castel.c$1691$1_0$856	= .
	.globl	C$the_castel.c$1691$1_0$856
;./the-castel.c:1691: PT3_Decode();	 // Update data to write to the PSG regiters from the music
	call	_PT3_Decode
	C$the_castel.c$1692$1_0$856	= .
	.globl	C$the_castel.c$1692$1_0$856
;./the-castel.c:1692: ayFX_Update();	 // Overwrite PSG registers data for the SFX
	call	_ayFX_Update
	C$the_castel.c$1693$1_0$856	= .
	.globl	C$the_castel.c$1693$1_0$856
;./the-castel.c:1693: PT3_UpdatePSG(); // Update PSG registers
	C$the_castel.c$1694$1_0$856	= .
	.globl	C$the_castel.c$1694$1_0$856
;./the-castel.c:1694: }
	C$the_castel.c$1694$1_0$856	= .
	.globl	C$the_castel.c$1694$1_0$856
	XG$VSyncCallback$0$0	= .
	.globl	XG$VSyncCallback$0$0
	jp	_PT3_UpdatePSG
	G$main$0$0	= .
	.globl	G$main$0$0
	C$the_castel.c$1696$1_0$857	= .
	.globl	C$the_castel.c$1696$1_0$857
;./the-castel.c:1696: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./the-castel.c:1699: DEBUG_LOG("Start debug session!");
	ld	bc, #___str_16+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$857	= .
	.globl	C$debug.h$103$1_0$857
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00102$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00105$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00102$
;./the-castel.c:1699: DEBUG_LOG("Start debug session!");
00105$:
;./the-castel.c:1701: Game_SetVSyncCallback(VSyncCallback);
	ld	iy, #_g_GameVSyncCB
	ld	0 (iy), #<(_VSyncCallback)
	ld	1 (iy), #>(_VSyncCallback)
	C$the_castel.c$1708$1_0$857	= .
	.globl	C$the_castel.c$1708$1_0$857
;./the-castel.c:1708: Game_SetState(State_Initialize);
	ld	hl, #_State_Initialize
	call	_Game_SetState
	C$the_castel.c$1715$1_0$857	= .
	.globl	C$the_castel.c$1715$1_0$857
;./the-castel.c:1715: Game_MainLoop(VDP_MODE_GRAPHIC1);
	ld	a, #0x02
	call	_Game_MainLoop
	C$the_castel.c$1719$1_0$857	= .
	.globl	C$the_castel.c$1719$1_0$857
;./the-castel.c:1719: Game_Release();
	call	_Game_Release
;./the-castel.c:1721: DEBUG_LOG("End debug session!");
	ld	bc, #___str_17+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
	C$debug.h$103$1_0$857	= .
	.globl	C$debug.h$103$1_0$857
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00107$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00110$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00107$
;./the-castel.c:1721: DEBUG_LOG("End debug session!");
00110$:
	C$the_castel.c$1723$1_0$857	= .
	.globl	C$the_castel.c$1723$1_0$857
;./the-castel.c:1723: Bios_Exit(0);
	xor	a, a
	C$the_castel.c$1724$1_0$857	= .
	.globl	C$the_castel.c$1724$1_0$857
;./the-castel.c:1724: }
	C$the_castel.c$1724$1_0$857	= .
	.globl	C$the_castel.c$1724$1_0$857
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jp	_Bios_Exit
Fthe_castel$__str_16$0_0$0 == .
___str_16:
	.ascii "Start debug session!"
	.db 0x00
Fthe_castel$__str_17$0_0$0 == .
___str_17:
	.ascii "End debug session!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
Fthe_castel$__xinit_g_PrevRow8$0_0$0 == .
__xinit__g_PrevRow8:
	.db #0xff	; 255
Fthe_castel$__xinit_g_PawnCount$0_0$0 == .
__xinit__g_PawnCount:
	.db #0x00	; 0
Fthe_castel$__xinit_g_PrevDirection$0_0$0 == .
__xinit__g_PrevDirection:
	.db #0x00	; 0
Fthe_castel$__xinit_g_ReverseCount$0_0$0 == .
__xinit__g_ReverseCount:
	.db #0x00	; 0
Fthe_castel$__xinit_g_CurrRoomIdx$0_0$0 == .
__xinit__g_CurrRoomIdx:
	.db #0x00	; 0
Fthe_castel$__xinit_g_GhostCount$0_0$0 == .
__xinit__g_GhostCount:
	.db #0x00	; 0
Fthe_castel$__xinit_g_SpiderCount$0_0$0 == .
__xinit__g_SpiderCount:
	.db #0x00	; 0
Fthe_castel$__xinit_g_BatCount$0_0$0 == .
__xinit__g_BatCount:
	.db #0x00	; 0
Fthe_castel$__xinit_g_SlideCountH$0_0$0 == .
__xinit__g_SlideCountH:
	.db #0x00	; 0
Fthe_castel$__xinit_g_SlideCountV$0_0$0 == .
__xinit__g_SlideCountV:
	.db #0x00	; 0
Fthe_castel$__xinit_g_ImmunityCount$0_0$0 == .
__xinit__g_ImmunityCount:
	.db #0x00	; 0
Fthe_castel$__xinit_g_SecondCounter$0_0$0 == .
__xinit__g_SecondCounter:
	.db #0x00	; 0
Fthe_castel$__xinit_g_DangerCounter$0_0$0 == .
__xinit__g_DangerCounter:
	.db #0x00	; 0
Fthe_castel$__xinit_g_Frame$0_0$0 == .
__xinit__g_Frame:
	.db #0x00	; 0
Fthe_castel$__xinit_g_DelayRemoveLife$0_0$0 == .
__xinit__g_DelayRemoveLife:
	.db #0x00	; 0
Fthe_castel$__xinit_IsUnderWater$0_0$0 == .
__xinit__IsUnderWater:
	.db #0x00	; 0
Fthe_castel$__xinit_g_IsDanger$0_0$0 == .
__xinit__g_IsDanger:
	.db #0x00	; 0
Fthe_castel$__xinit_g_CatchEnemy$0_0$0 == .
__xinit__g_CatchEnemy:
	.db #0x00	; 0
Fthe_castel$__xinit_g_DelayCatchEnemy$0_0$0 == .
__xinit__g_DelayCatchEnemy:
	.db #0x00	; 0
Fthe_castel$__xinit_isCatch$0_0$0 == .
__xinit__isCatch:
	.db #0x00	; 0
Fthe_castel$__xinit_g_Fire$0_0$0 == .
__xinit__g_Fire:
	.db #0x01	; 1
Fthe_castel$__xinit_g_Lives$0_0$0 == .
__xinit__g_Lives:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
Fthe_castel$__xinit_g_CacheLevel$0_0$0 == .
__xinit__g_CacheLevel:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_LevelUncompress
Fthe_castel$__xinit_g_CountItem$0_0$0 == .
__xinit__g_CountItem:
	.db #0x00	; 0
	.area _CABS (ABS)
