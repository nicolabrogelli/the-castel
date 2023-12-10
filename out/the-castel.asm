;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module the_castel
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_DataMusic
	.globl _main
	.globl _physicsEventPlayer
	.globl _Pletter_UnpackToVRAM
	.globl _ayFX_Update
	.globl _ayFX_Mute
	.globl _ayFX_PlayBank
	.globl _ayFX_InitBank
	.globl _PT3_UpdatePSG
	.globl _PT3_Decode
	.globl _PT3_SetLoop
	.globl _PT3_Resume
	.globl _PT3_Pause
	.globl _PT3_InitSong
	.globl _PT3_Init
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
	.globl _VDP_Peek_16K
	.globl _VDP_Poke_16K
	.globl _VDP_FillVRAM_16K
	.globl _VDP_WriteVRAM_16K
	.globl _VDP_RegWriteBakMask
	.globl _VDP_RegWrite
	.globl _VDP_ClearVRAM
	.globl _Bios_Exit
	.globl _Keyboard_Read
	.globl _Joystick_Read
	.globl _Mem_Set
	.globl _g_Lives
	.globl _g_Inventory
	.globl _g_IsDanger
	.globl _IsUnderWater
	.globl _g_DelayRemoveLife
	.globl _g_Frame
	.globl _g_DangerCounter
	.globl _g_SecondCounter
	.globl _g_ImmunityCount
	.globl _g_BatCount
	.globl _g_SpiderCount
	.globl _g_GhostCount
	.globl _g_CurrRoomIdx
	.globl _g_ReverseCount
	.globl _g_FrameCounter
	.globl _g_PrevDirection
	.globl _g_PawnCount
	.globl _g_PrevRow8
	.globl _g_Level029
	.globl _g_Level012
	.globl _g_Level009
	.globl _g_Level000
	.globl _g_Bat
	.globl _g_Spider
	.globl _g_Ghost
	.globl _g_Enemy
	.globl _g_Player
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
	.globl _g_Levels
	.globl _g_PlayerAnimActions
	.globl _g_PlayerFramesFall
	.globl _g_PlayerFramesJump
	.globl _g_PlayerFramesMoveRight
	.globl _g_PlayerFramesMove
	.globl _g_PlayerFramesIdle
	.globl _g_PlayerSpriteLayers
	.globl _g_DataSprtLayer
	.globl _g_ayfx_bank
	.globl _g_DataBackground_Colors
	.globl _g_DataBackground_Patterns
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
	.globl _initLife
	.globl _addLife
	.globl _removeLife
	.globl _hasLives
	.globl _displayLife
	.globl _initInventory
	.globl _addItemToInventory
	.globl _hasItemInInventory
	.globl _removeItemFromInventory
	.globl _displayItemToInventory
	.globl _getTile
	.globl _setTile
	.globl _setTileByTileCoord
	.globl _physicsCollision
	.globl _physicsCollisionEnemy
	.globl _physicsCollisionPlayerAndGenericEnemy
	.globl _collisionCheck
	.globl _isUnderTheWater
	.globl _isUnderDunger
	.globl _setColorTiles
	.globl _interact
	.globl _replaceAndRemoveItem
	.globl _changeLevel
	.globl _getMoney
	.globl _isDanger
	.globl _updateScore
	.globl _replacementItemInLevel
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
	.globl _readInputControl
	.globl _isMoveRight
	.globl _isMoveLeft
	.globl _isMoveJump
	.globl _isInteractObject
	.globl _PlayBankSFX
	.globl _ChannelSFX
	.globl _inizializePT3
	.globl _inizializeAYFX
	.globl _pausePT3Music
	.globl _restorePT3Music
	.globl _stopMusicPlayback
	.globl _restoreLevel
	.globl _adjustLevel
	.globl _VDP_LoadPattern_GM1_Pletter
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_MSXMusic_IndexPort	=	0x007c
_g_MSXMusic_DataPort	=	0x007d
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
_g_PortDebugMode	=	0x002e
_g_PortDebugData	=	0x002f
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
_g_Player::
	.ds 28
_g_Enemy::
	.ds 24
_g_Ghost::
	.ds 24
_g_Spider::
	.ds 24
_g_Bat::
	.ds 24
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_Level000::
	.ds 768
_g_Level009::
	.ds 768
_g_Level012::
	.ds 768
_g_Level029::
	.ds 768
_g_PrevRow8::
	.ds 1
_g_PawnCount::
	.ds 1
_g_PrevDirection::
	.ds 1
_g_FrameCounter::
	.ds 1
_g_ReverseCount::
	.ds 1
_g_CurrRoomIdx::
	.ds 1
_g_GhostCount::
	.ds 1
_g_SpiderCount::
	.ds 1
_g_BatCount::
	.ds 1
_g_ImmunityCount::
	.ds 1
_g_SecondCounter::
	.ds 1
_g_DangerCounter::
	.ds 1
_g_Frame::
	.ds 1
_g_DelayRemoveLife::
	.ds 1
_IsUnderWater::
	.ds 1
_g_IsDanger::
	.ds 1
_g_Inventory::
	.ds 5
_g_Lives::
	.ds 3
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
;./the-castel.c:299: void initLife()
;	---------------------------------
; Function initLife
; ---------------------------------
_initLife::
;./the-castel.c:301: g_Player.Life = MAX_LIVES;
	ld	hl, #(_g_Player + 7)
	ld	(hl), #0x03
;./the-castel.c:303: Mem_Set(TILE_HEART, g_Lives, (3 * sizeof(g_Lives[0])));
	ld	hl, #0x0003
	push	hl
	ld	de, #_g_Lives
	ld	a, #0x4f
	call	_Mem_Set
;./the-castel.c:304: }
	ret
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
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
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
_g_DataBackground_Patterns:
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xae	; 174
	.db #0xa0	; 160
	.db #0xbe	; 190
	.db #0xbf	; 191
	.db #0xed	; 237
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x2f	; 47
	.db #0x5f	; 95
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xe8	; 232
	.db #0xf4	; 244
	.db #0xfa	; 250
	.db #0xfd	; 253
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x71	; 113	'q'
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0xfd	; 253
	.db #0xd0	; 208
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0xaf	; 175
	.db #0x3d	; 61
	.db #0xad	; 173
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0x92	; 146
	.db #0x82	; 130
	.db #0x0f	; 15
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0xb5	; 181
	.db #0x7f	; 127
	.db #0xfe	; 254
	.db #0xd7	; 215
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x67	; 103	'g'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x76	; 118	'v'
	.db #0x7e	; 126
	.db #0x82	; 130
	.db #0x24	; 36
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0xb9	; 185
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0x6c	; 108	'l'
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x3c	; 60
	.db #0xeb	; 235
	.db #0x1d	; 29
	.db #0x25	; 37
	.db #0x58	; 88	'X'
	.db #0xa7	; 167
	.db #0xa4	; 164
	.db #0xbb	; 187
	.db #0x02	; 2
	.db #0xdd	; 221
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0xf1	; 241
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0xe6	; 230
	.db #0x48	; 72	'H'
	.db #0x3a	; 58
	.db #0x0b	; 11
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x70	; 112	'p'
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xd2	; 210
	.db #0x06	; 6
	.db #0x4c	; 76	'L'
	.db #0xfd	; 253
	.db #0x51	; 81	'Q'
	.db #0xd7	; 215
	.db #0x14	; 20
	.db #0x81	; 129
	.db #0xbf	; 191
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xd9	; 217
	.db #0x07	; 7
	.db #0xbf	; 191
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x87	; 135
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0xb9	; 185
	.db #0xa1	; 161
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xa8	; 168
	.db #0xf7	; 247
	.db #0x74	; 116	't'
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x97	; 151
	.db #0x9b	; 155
	.db #0xff	; 255
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf7	; 247
	.db #0xf5	; 245
	.db #0x1a	; 26
	.db #0x6f	; 111	'o'
	.db #0xfb	; 251
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x7f	; 127
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xcf	; 207
	.db #0xc0	; 192
	.db #0xed	; 237
	.db #0x30	; 48	'0'
	.db #0x6d	; 109	'm'
	.db #0x1f	; 31
	.db #0x9c	; 156
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0xf7	; 247
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x69	; 105	'i'
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x07	; 7
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xf5	; 245
	.db #0xd6	; 214
	.db #0x9f	; 159
	.db #0xc0	; 192
	.db #0xc9	; 201
	.db #0xc9	; 201
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x94	; 148
	.db #0x42	; 66	'B'
	.db #0x94	; 148
	.db #0xf9	; 249
	.db #0xd3	; 211
	.db #0x61	; 97	'a'
	.db #0x8f	; 143
	.db #0xe3	; 227
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x72	; 114	'r'
	.db #0x22	; 34
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x72	; 114	'r'
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x69	; 105	'i'
	.db #0x89	; 137
	.db #0xa9	; 169
	.db #0x6d	; 109	'm'
	.db #0x01	; 1
	.db #0xae	; 174
	.db #0xa2	; 162
	.db #0xa7	; 167
	.db #0x69	; 105	'i'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x0d	; 13
	.db #0x06	; 6
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x48	; 72	'H'
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x09	; 9
	.db #0x15	; 21
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x14	; 20
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0x68	; 104	'h'
	.db #0xa8	; 168
	.db #0xc2	; 194
	.db #0x20	; 32
	.db #0x2c	; 44
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x34	; 52	'4'
	.db #0xad	; 173
	.db #0x17	; 23
	.db #0x0d	; 13
	.db #0x3c	; 60
	.db #0x27	; 39
	.db #0xd8	; 216
	.db #0xb6	; 182
	.db #0x06	; 6
	.db #0xd5	; 213
	.db #0x8f	; 143
	.db #0x10	; 16
	.db #0x59	; 89	'Y'
	.db #0x11	; 17
	.db #0xd3	; 211
	.db #0x28	; 40
	.db #0xda	; 218
	.db #0x18	; 24
	.db #0x5f	; 95
	.db #0x97	; 151
	.db #0x36	; 54	'6'
	.db #0x5c	; 92
	.db #0x2c	; 44
	.db #0x6e	; 110	'n'
	.db #0x7c	; 124
	.db #0x19	; 25
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x64	; 100	'd'
	.db #0x23	; 35
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0xae	; 174
	.db #0xca	; 202
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0xce	; 206
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x17	; 23
	.db #0x19	; 25
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x7c	; 124
	.db #0x57	; 87	'W'
	.db #0x0e	; 14
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0xa5	; 165
	.db #0x17	; 23
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0x07	; 7
	.db #0x75	; 117	'u'
	.db #0x0f	; 15
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x5d	; 93
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0xce	; 206
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0x1f	; 31
	.db #0xee	; 238
	.db #0x5b	; 91
	.db #0x02	; 2
	.db #0xda	; 218
	.db #0x07	; 7
	.db #0x49	; 73	'I'
	.db #0xa8	; 168
	.db #0x26	; 38
	.db #0x41	; 65	'A'
	.db #0x9b	; 155
	.db #0x34	; 52	'4'
	.db #0x04	; 4
	.db #0x7e	; 126
	.db #0xe1	; 225
	.db #0x80	; 128
	.db #0xd9	; 217
	.db #0x0c	; 12
	.db #0x12	; 18
	.db #0xd5	; 213
	.db #0x5f	; 95
	.db #0x06	; 6
	.db #0x5d	; 93
	.db #0xc3	; 195
	.db #0x07	; 7
	.db #0x34	; 52	'4'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0x75	; 117	'u'
	.db #0x02	; 2
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x0d	; 13
	.db #0x70	; 112	'p'
	.db #0x9e	; 158
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0x60	; 96
	.db #0x07	; 7
	.db #0xb7	; 183
	.db #0x9c	; 156
	.db #0x03	; 3
	.db #0x4c	; 76	'L'
	.db #0x77	; 119	'w'
	.db #0x44	; 68	'D'
	.db #0xf2	; 242
	.db #0x37	; 55	'7'
	.db #0xa1	; 161
	.db #0x3a	; 58
	.db #0x7b	; 123
	.db #0xc8	; 200
	.db #0xd7	; 215
	.db #0xf1	; 241
	.db #0x85	; 133
	.db #0x8a	; 138
	.db #0xa2	; 162
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x09	; 9
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x17	; 23
	.db #0x40	; 64
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x0f	; 15
	.db #0x6c	; 108	'l'
	.db #0x38	; 56	'8'
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x27	; 39
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x17	; 23
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x4c	; 76	'L'
	.db #0x39	; 57	'9'
	.db #0x1c	; 28
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xbb	; 187
	.db #0x27	; 39
	.db #0x6c	; 108	'l'
	.db #0x4c	; 76	'L'
	.db #0x4f	; 79	'O'
	.db #0x1c	; 28
	.db #0xe3	; 227
	.db #0xd7	; 215
	.db #0xb3	; 179
	.db #0x7f	; 127
	.db #0x44	; 68	'D'
	.db #0x9c	; 156
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0xcf	; 207
	.db #0x3b	; 59
	.db #0xdc	; 220
	.db #0xf0	; 240
	.db #0xe7	; 231
	.db #0xef	; 239
	.db #0x3c	; 60
	.db #0x06	; 6
	.db #0x6f	; 111	'o'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xd0	; 208
	.db #0x0f	; 15
	.db #0xb7	; 183
	.db #0x66	; 102	'f'
	.db #0x28	; 40
	.db #0x07	; 7
	.db #0x1e	; 30
	.db #0xef	; 239
	.db #0x57	; 87	'W'
	.db #0xba	; 186
	.db #0x07	; 7
	.db #0x27	; 39
	.db #0x2f	; 47
	.db #0xe1	; 225
	.db #0xdd	; 221
	.db #0xc7	; 199
	.db #0xbf	; 191
	.db #0x44	; 68	'D'
	.db #0xcf	; 207
	.db #0x38	; 56	'8'
	.db #0xac	; 172
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x9a	; 154
	.db #0x4b	; 75	'K'
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x45	; 69	'E'
	.db #0x9e	; 158
	.db #0x44	; 68	'D'
	.db #0x0f	; 15
	.db #0x80	; 128
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0xd6	; 214
	.db #0x87	; 135
	.db #0x57	; 87	'W'
	.db #0x27	; 39
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
_g_DataBackground_Colors:
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x71	; 113	'q'
	.db #0xf1	; 241
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xf1	; 241
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
_g_DataSprtLayer:
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfb	; 251
	.db #0x03	; 3
	.db #0x9c	; 156
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x06	; 6
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0x8c	; 140
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x0e	; 14
	.db #0x4c	; 76	'L'
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x5c	; 92
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x2c	; 44
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x98	; 152
	.db #0x03	; 3
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x6a	; 106	'j'
	.db #0xe8	; 232
	.db #0xb6	; 182
	.db #0x5e	; 94
	.db #0xbf	; 191
	.db #0x35	; 53	'5'
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x78	; 120	'x'
	.db #0x7f	; 127
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0xf6	; 246
	.db #0x7f	; 127
	.db #0x35	; 53	'5'
	.db #0x08	; 8
	.db #0xe0	; 224
	.db #0x5c	; 92
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x24	; 36
	.db #0x27	; 39
	.db #0x26	; 38
	.db #0x23	; 35
	.db #0x27	; 39
	.db #0x06	; 6
	.db #0x3c	; 60
	.db #0x37	; 55	'7'
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x7f	; 127
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xf4	; 244
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x71	; 113	'q'
	.db #0x63	; 99	'c'
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0xbe	; 190
	.db #0x7f	; 127
	.db #0x68	; 104	'h'
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0xf6	; 246
	.db #0x7f	; 127
	.db #0xbb	; 187
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xfe	; 254
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xdd	; 221
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0xbe	; 190
	.db #0xb3	; 179
	.db #0x10	; 16
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0x26	; 38
	.db #0x0c	; 12
	.db #0x3e	; 62
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x86	; 134
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x85	; 133
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x7f	; 127
	.db #0xe8	; 232
	.db #0x80	; 128
	.db #0x7d	; 125
	.db #0xd2	; 210
	.db #0x7f	; 127
	.db #0x7b	; 123
	.db #0xb0	; 176
	.db #0x7f	; 127
	.db #0xfe	; 254
	.db #0x9b	; 155
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0xea	; 234
	.db #0x46	; 70	'F'
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xcb	; 203
	.db #0xff	; 255
	.db #0xb9	; 185
	.db #0x75	; 117	'u'
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x2e	; 46
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0xb5	; 181
	.db #0x7e	; 126
	.db #0x75	; 117	'u'
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x3f	; 63
	.db #0x47	; 71	'G'
	.db #0x1d	; 29
	.db #0x27	; 39
	.db #0x4a	; 74	'J'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xd8	; 216
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xe2	; 226
	.db #0xb8	; 184
	.db #0xe4	; 228
	.db #0x50	; 80	'P'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0xca	; 202
	.db #0x96	; 150
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0xe4	; 228
	.db #0xcb	; 203
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0xfd	; 253
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x0a	; 10
	.db #0xc8	; 200
	.db #0x88	; 136
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0xe8	; 232
	.db #0x24	; 36
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xc1	; 193
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0xe7	; 231
	.db #0x63	; 99	'c'
	.db #0x0b	; 11
	.db #0xf0	; 240
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x24	; 36
	.db #0xf8	; 248
	.db #0x42	; 66	'B'
	.db #0x11	; 17
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0x87	; 135
	.db #0x33	; 51	'3'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xbb	; 187
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0xfa	; 250
	.db #0x69	; 105	'i'
	.db #0xb5	; 181
	.db #0xa0	; 160
	.db #0x44	; 68	'D'
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0x6a	; 106	'j'
	.db #0x90	; 144
	.db #0xbf	; 191
	.db #0x0f	; 15
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
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
_g_PlayerFramesIdle:
	.db #0x40	; 64
	.db #0x40	; 64
	.dw #0x0000
	.db #0x20	; 32
	.db #0x18	; 24
	.dw #0x0000
_g_PlayerFramesMove:
	.db #0x30	; 48	'0'
	.db #0x0a	; 10
	.dw #0x0000
_g_PlayerFramesMoveRight:
	.db #0x70	; 112	'p'
	.db #0x0a	; 10
	.dw #0x0000
_g_PlayerFramesJump:
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.dw #0x0000
_g_PlayerFramesFall:
	.db #0x60	; 96
	.db #0x04	; 4
	.dw #0x0000
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
_g_Levels:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level000
	.dw __str_0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level001
	.dw __str_1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level002
	.dw __str_2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x10	; 16
	.dw _g_Level014
	.dw __str_3
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level003
	.dw __str_4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level004
	.dw __str_5
	.db #0x06	; 6
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level006
	.dw __str_6
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level007
	.dw __str_7
	.db #0x08	; 8
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level008
	.dw __str_8
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level010
	.dw __str_9
	.db #0x0a	; 10
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level011
	.dw __str_10
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level012
	.dw __str_11
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level009
	.dw __str_12
	.db #0x0d	; 13
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level013
	.dw __str_13
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_Level029
	.dw __str_14
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
__str_0:
	.ascii "START GAME"
	.db 0x00
__str_1:
	.ascii "Level: 01"
	.db 0x00
__str_2:
	.ascii "Level: 02"
	.db 0x00
__str_3:
	.ascii "Level: 03"
	.db 0x00
__str_4:
	.ascii "Level: 04"
	.db 0x00
__str_5:
	.ascii "Level: 05"
	.db 0x00
__str_6:
	.ascii "Level: 06"
	.db 0x00
__str_7:
	.ascii "Level: 07"
	.db 0x00
__str_8:
	.ascii "Level: 08"
	.db 0x00
__str_9:
	.ascii "Level: 09"
	.db 0x00
__str_10:
	.ascii "Level: 10"
	.db 0x00
__str_11:
	.ascii "Level: 11"
	.db 0x00
__str_12:
	.ascii "Level: 12"
	.db 0x00
__str_13:
	.ascii "Level: 13"
	.db 0x00
__str_14:
	.ascii "GAME OVER"
	.db 0x00
;./the-castel.c:311: bool addLife()
;	---------------------------------
; Function addLife
; ---------------------------------
_addLife::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./the-castel.c:313: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	-1 (ix), #0x00
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00103$
;./the-castel.c:315: if (g_Lives[i] == EMPTY_ITEM)
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
;./the-castel.c:317: g_Player.Life++;
	ld	bc, #_g_Player+7
	ld	a, (bc)
	inc	a
	ld	(bc), a
;./the-castel.c:318: g_Lives[i] = TILE_HEART;
	ld	a, #0x4f
	ld	(de), a
;./the-castel.c:320: setTile(220 + i * 16, (u8)(4), TILE_HEART);
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
;./the-castel.c:321: return TRUE;
	ld	a, #0x01
	jp	00107$
00106$:
;./the-castel.c:313: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	ld	-1 (ix), c
	jp	00105$
00103$:
;./the-castel.c:324: return FALSE;
	xor	a, a
00107$:
;./the-castel.c:325: }
	inc	sp
	pop	ix
	ret
;./the-castel.c:332: bool removeLife()
;	---------------------------------
; Function removeLife
; ---------------------------------
_removeLife::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./the-castel.c:335: if (hasItemInInventory(TILE_AMPHORA))
	ld	a, #0x5f
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00105$
;./the-castel.c:337: if (g_ImmunityCount < IMMUNITY)
	ld	a, (_g_ImmunityCount+0)
	sub	a, #0x03
	jr	NC, 00102$
;./the-castel.c:339: g_ImmunityCount++;
	ld	hl, #_g_ImmunityCount
	inc	(hl)
	jp	00103$
00102$:
;./the-castel.c:343: removeItemFromInventory(TILE_AMPHORA);
	ld	a, #0x5f
	call	_removeItemFromInventory
00103$:
;./the-castel.c:345: return FALSE;
	xor	a, a
	jp	00112$
00105$:
;./the-castel.c:348: for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	ld	-2 (ix), #0x02
	ld	-1 (ix), #0x02
00110$:
	bit	7, -1 (ix)
	jr	NZ, 00108$
;./the-castel.c:351: if (g_Lives[i] == TILE_HEART)
	ld	bc, #_g_Lives+0
	ld	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	a, (hl)
;./the-castel.c:353: g_Lives[i] = EMPTY_ITEM;
	sub	a,#0x4f
	jr	NZ, 00111$
	ld	(hl),a
;./the-castel.c:354: setTile(220 + i * 16, (u8)(4), 0);
	ld	a, -2 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xdc
	ld	c, a
	xor	a, a
	push	af
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:355: g_Player.Life--;
	ld	bc, #_g_Player+7
	ld	a, (bc)
	dec	a
	ld	(bc), a
;./the-castel.c:356: return (i > 0);
	xor	a, a
	sub	a, -2 (ix)
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	rlca
	and	a,#0x01
	jp	00112$
00111$:
;./the-castel.c:348: for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	dec	-1 (ix)
	ld	a, -1 (ix)
	ld	-2 (ix), a
	jp	00110$
00108$:
;./the-castel.c:360: return FALSE;
	xor	a, a
00112$:
;./the-castel.c:361: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:366: bool hasLives()
;	---------------------------------
; Function hasLives
; ---------------------------------
_hasLives::
;./the-castel.c:368: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00103$
;./the-castel.c:370: if (g_Lives[i] == TILE_HEART)
	ld	hl, #_g_Lives
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x4f
	jr	NZ, 00106$
;./the-castel.c:372: return TRUE;
	ld	a, #0x01
	ret
00106$:
;./the-castel.c:368: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	jp	00105$
00103$:
;./the-castel.c:375: return FALSE;
	xor	a, a
;./the-castel.c:376: }
	ret
;./the-castel.c:383: void displayLife()
;	---------------------------------
; Function displayLife
; ---------------------------------
_displayLife::
;./the-castel.c:385: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;./the-castel.c:387: setTile(220 + i * 16, (u8)(4), g_Lives[i]);
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
;./the-castel.c:385: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
;./the-castel.c:389: }
	jp	00103$
;./the-castel.c:400: void initInventory()
;	---------------------------------
; Function initInventory
; ---------------------------------
_initInventory::
;./the-castel.c:402: Mem_Set(EMPTY_ITEM, g_Inventory, (5 * sizeof(g_Inventory[0])));
	ld	hl, #0x0005
	push	hl
	ld	de, #_g_Inventory
	xor	a, a
	call	_Mem_Set
;./the-castel.c:403: }
	ret
;./the-castel.c:410: bool addItemToInventory(u8 item)
;	---------------------------------
; Function addItemToInventory
; ---------------------------------
_addItemToInventory::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	-1 (ix), a
;./the-castel.c:412: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	ld	c, #0x00
	ld	e, c
00105$:
	ld	a, e
	sub	a, #0x05
	jr	NC, 00103$
;./the-castel.c:414: if (g_Inventory[i] == EMPTY_ITEM)
	ld	hl, #_g_Inventory+0
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00106$
;./the-castel.c:416: g_Inventory[i] = item;
	ld	a, -1 (ix)
	ld	(hl), a
;./the-castel.c:417: setTile((g_Levels[g_CurrRoomIdx].X * 8) + 8 + i * 16, (u8)((g_Levels[g_CurrRoomIdx].Height * 8) - 16) + g_Levels[g_CurrRoomIdx].Y * 8, item);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
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
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xf0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	push	af
	ld	a, l
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ld	e, a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ld	c, a
	ld	a, -1 (ix)
	push	af
	inc	sp
	ld	a, c
	call	_setTile
;./the-castel.c:418: return TRUE;
	ld	a, #0x01
	jp	00107$
00106$:
;./the-castel.c:412: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	inc	e
	ld	c, e
	jp	00105$
00103$:
;./the-castel.c:421: return FALSE;
	xor	a, a
00107$:
;./the-castel.c:422: }
	inc	sp
	pop	ix
	ret
;./the-castel.c:429: bool hasItemInInventory(u8 item)
;	---------------------------------
; Function hasItemInInventory
; ---------------------------------
_hasItemInInventory::
	ld	c, a
;./the-castel.c:431: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	ld	e, #0x00
00105$:
	ld	a, e
	sub	a, #0x05
	jr	NC, 00103$
;./the-castel.c:433: if (g_Inventory[i] == item)
	ld	hl, #_g_Inventory
	ld	d, #0x00
	add	hl, de
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NZ, 00106$
;./the-castel.c:435: return TRUE;
	ld	a, #0x01
	ret
00106$:
;./the-castel.c:431: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	inc	e
	jp	00105$
00103$:
;./the-castel.c:438: return FALSE;
	xor	a, a
;./the-castel.c:439: }
	ret
;./the-castel.c:446: bool removeItemFromInventory(u8 item)
;	---------------------------------
; Function removeItemFromInventory
; ---------------------------------
_removeItemFromInventory::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;./the-castel.c:448: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	ld	-3 (ix), #0x00
	ld	-2 (ix), #0x00
00105$:
	ld	a, -2 (ix)
	sub	a, #0x05
	jp	NC, 00103$
;./the-castel.c:450: if (g_Inventory[i] == item)
	ld	bc, #_g_Inventory+0
	ld	l, -2 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a,-1 (ix)
;./the-castel.c:452: g_Inventory[i] = EMPTY_ITEM;
	sub	a,(hl)
	jp	NZ,00106$
	ld	(hl),a
;./the-castel.c:454: setTile((g_Levels[g_CurrRoomIdx].X * 8) + 8 + i * 16, (u8)((g_Levels[g_CurrRoomIdx].Height * 8) - 16) + g_Levels[g_CurrRoomIdx].Y * 8, 0);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	(sp), hl
	ld	a, #<(_g_Levels)
	add	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_Levels)
	adc	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	add	a, a
	add	a, a
	add	a, a
	ld	-2 (ix), a
	add	a, #0xf0
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	add	a, a
	add	a, a
	add	a, a
	ld	-4 (ix), a
	add	a, -2 (ix)
	ld	-2 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	add	a, a
	add	a, a
	add	a, a
	ld	-4 (ix), a
	add	a, #0x08
	ld	-4 (ix), a
	ld	a, -3 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	-3 (ix), a
	add	a, -4 (ix)
	ld	-3 (ix), a
	xor	a, a
	push	af
	inc	sp
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -3 (ix)
	call	_setTile
;./the-castel.c:455: return TRUE;
	ld	a, #0x01
	jp	00107$
00106$:
;./the-castel.c:448: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	inc	-2 (ix)
	ld	a, -2 (ix)
	ld	-3 (ix), a
	jp	00105$
00103$:
;./the-castel.c:458: return FALSE;
	xor	a, a
00107$:
;./the-castel.c:459: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:466: void displayItemToInventory()
;	---------------------------------
; Function displayItemToInventory
; ---------------------------------
_displayItemToInventory::
;./the-castel.c:468: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	ret	Z
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x0e
	ret	Z
;./the-castel.c:470: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x05
	ret	NC
;./the-castel.c:472: setTile((g_Levels[g_CurrRoomIdx].X * 8) + 8 + i * 16, (u8)((g_Levels[g_CurrRoomIdx].Height * 8) - 16) + g_Levels[g_CurrRoomIdx].Y * 8, g_Inventory[i]);
	ld	hl, #_g_Inventory
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
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
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xf0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	push	af
	ld	a, l
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ld	e, a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	ld	e, a
	push	bc
	push	bc
	inc	sp
	ld	a, e
	call	_setTile
	pop	bc
;./the-castel.c:470: for (u8 i = 0; i < MAX_ITEM_INVENTORY; i++)
	inc	c
;./the-castel.c:475: }
	jp	00106$
;./the-castel.c:487: u8 getTile(u8 x, u8 y)
;	---------------------------------
; Function getTile
; ---------------------------------
_getTile::
	ld	c, a
	ld	e, l
;./the-castel.c:489: return VDP_Peek_16K(g_ScreenLayoutLow + (y / 8) * 32 + (x / 8));
	ld	d, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00103$
	ld	hl, #0x0007
	add	hl, de
00103$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ex	de, hl
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00104$
	ld	hl, #0x0007
	add	hl, bc
00104$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, de
;./the-castel.c:490: }
	jp	_VDP_Peek_16K
;./the-castel.c:499: void setTile(u8 x, u8 y, u8 tile)
;	---------------------------------
; Function setTile
; ---------------------------------
_setTile::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	e, l
;./the-castel.c:501: VDP_Poke_16K(tile, g_ScreenLayoutLow + (y / 8) * 32 + (x / 8));
	ld	d, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00103$
	ld	hl, #0x0007
	add	hl, de
00103$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, (_g_ScreenLayoutLow)
	add	hl, de
	ex	de, hl
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, b
	jr	Z, 00104$
	ld	hl, #0x0007
	add	hl, bc
00104$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, de
	ex	de, hl
	ld	a, 4 (ix)
	call	_VDP_Poke_16K
;./the-castel.c:502: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:511: void setTileByTileCoord(u8 x, u8 y, u8 tile)
;	---------------------------------
; Function setTileByTileCoord
; ---------------------------------
_setTileByTileCoord::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
;./the-castel.c:513: VDP_Poke_16K(tile, g_ScreenLayoutLow + y * 32 + x);
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
	ex	de, hl
	ld	a, 4 (ix)
	call	_VDP_Poke_16K
;./the-castel.c:514: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:526: void physicsEventPlayer(u8 event, u8 tile)
;	---------------------------------
; Function physicsEventPlayer
; ---------------------------------
_physicsEventPlayer::
;./the-castel.c:529: switch (event)
	or	a,a
	jr	Z, 00102$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x05
	ret	NZ
;./the-castel.c:532: case PAWN_PHYSICS_COL_DOWN:
00102$:
;./the-castel.c:533: g_Player.bInAir = FALSE;
	ld	hl, #(_g_Player + 1)
	ld	(hl), #0x00
;./the-castel.c:534: break;
	ret
;./the-castel.c:536: case PAWN_PHYSICS_FALL: // Handle falling
00103$:
;./the-castel.c:537: if (!g_Player.bInAir)
	ld	hl, #_g_Player + 1
	ld	a, (hl)
	or	a, a
	ret	NZ
;./the-castel.c:539: g_Player.bInAir = TRUE;
	ld	(hl), #0x01
;./the-castel.c:540: g_Player.VelocityY = 0;
	ld	hl, #(_g_Player + 2)
	ld	(hl), #0x00
;./the-castel.c:543: };
;./the-castel.c:544: }
	ret
;./the-castel.c:551: bool physicsCollision(u8 tile)
;	---------------------------------
; Function physicsCollision
; ---------------------------------
_physicsCollision::
	ld	c, a
;./the-castel.c:553: return (tile > 110 && tile < 184);
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
;./the-castel.c:554: }
	ret
;./the-castel.c:562: bool physicsCollisionEnemy(u8 x, u8 y)
;	---------------------------------
; Function physicsCollisionEnemy
; ---------------------------------
_physicsCollisionEnemy::
;./the-castel.c:564: return ((getTile(x, y) >= 100) /*|| getTile(x, y) == 0 */);
	call	_getTile
	sub	a, #0x64
	ld	a, #0x00
	rla
	xor	a, #0x01
;./the-castel.c:565: }
	ret
;./the-castel.c:572: void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber)
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
;./the-castel.c:574: if (g_ReverseCount > 0)
	ld	a, (_g_ReverseCount+0)
	or	a, a
	jr	Z, 00103$
;./the-castel.c:575: g_ReverseCount--;
	ld	iy, #_g_ReverseCount
	dec	0 (iy)
	jp	00108$
00103$:
;./the-castel.c:578: Game_Pawn *pawn = &ply->Pawn;
	ld	hl, #0x0008
	add	hl, bc
;./the-castel.c:580: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	sp
	inc	sp
	push	hl
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	-1 (ix), #0x00
00106$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jr	NC, 00108$
;./the-castel.c:582: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;./the-castel.c:583: collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY);
;	spillPairReg hl
;	spillPairReg hl
	ld	c,l
	ld	b,h
;	spillPairReg hl
;	spillPairReg hl
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
	ld	-2 (ix), a
	ld	a, (bc)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	bc, #0x0005
	add	hl, bc
	ld	c, (hl)
	sub	a, c
	ld	c, a
	push	de
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_collisionCheck
	pop	de
;./the-castel.c:580: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	-1 (ix)
	jp	00106$
00108$:
;./the-castel.c:586: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:594: bool collisionCheck(i8 dx, i8 dy)
;	---------------------------------
; Function collisionCheck
; ---------------------------------
_collisionCheck::
	ld	c, a
	ld	b, l
;./the-castel.c:597: if ((dx * dx) + (dy * dy) < 13 * 13)
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
	ld	de, #0x80a9
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jr	NC, 00107$
;./the-castel.c:599: g_ReverseCount = 60;
	ld	hl, #_g_ReverseCount
	ld	(hl), #0x3c
;./the-castel.c:600: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00104$
;./the-castel.c:602: displayLife();
	call	_displayLife
;./the-castel.c:604: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:606: return TRUE;
	ld	a, #0x01
	ret
00104$:
;./the-castel.c:610: if (!hasLives())
	call	_hasLives
	or	a, a
	ret	NZ
;./the-castel.c:612: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:613: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	jp	_Game_SetState
00107$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:688: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
;./the-castel.c:621: return FALSE;
	xor	a, a
;./the-castel.c:623: }
	ret
;./the-castel.c:631: bool isUnderTheWater(u8 x, u8 y)
;	---------------------------------
; Function isUnderTheWater
; ---------------------------------
_isUnderTheWater::
;./the-castel.c:633: return (getTile(x, y) == TILE_WATER);
	call	_getTile
	sub	a, #0x50
	ld	a, #0x01
	ret	Z
	xor	a, a
;./the-castel.c:634: }
	ret
;./the-castel.c:642: u8 isUnderDunger(u8 x, u8 y)
;	---------------------------------
; Function isUnderDunger
; ---------------------------------
_isUnderDunger::
;./the-castel.c:644: return getTile(x, y);
	ld	c, a
;./the-castel.c:645: }
	jp	_getTile
;./the-castel.c:652: void setColorTiles()
;	---------------------------------
; Function setColorTiles
; ---------------------------------
_setColorTiles::
;./the-castel.c:654: VDP_FillVRAM_16K(0X80, g_ScreenColorLow + 8, 2); // VERDE 0XC0 - ROSSO CHIARO 0x60
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0008
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x80
	call	_VDP_FillVRAM_16K
;./the-castel.c:655: VDP_FillVRAM_16K(0x70, g_ScreenColorLow + 10, 1);
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x000a
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x70
	call	_VDP_FillVRAM_16K
;./the-castel.c:656: VDP_FillVRAM_16K(0xA0, g_ScreenColorLow + 12, 1); // GIALLO SCURO
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x000c
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0xa0
	call	_VDP_FillVRAM_16K
;./the-castel.c:657: VDP_FillVRAM_16K(0xE0, g_ScreenColorLow + 18, 2); // GRIGIO
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0012
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0xe0
	call	_VDP_FillVRAM_16K
;./the-castel.c:658: }
	ret
;./the-castel.c:666: bool interact(u8 x, u8 y)
;	---------------------------------
; Function interact
; ---------------------------------
_interact::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
	ld	b, l
;./the-castel.c:668: u8 tile = getTile(x, y);
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_getTile
	pop	bc
	ld	-1 (ix), a
;./the-castel.c:670: DEBUG_LOGNUM("Intercat", tile);
	ld	hl, #___str_15+0
	ld	e, -1 (ix)
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00138$:
	ld	a, (hl)
	or	a, a
	jr	Z, 00141$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	inc	hl
	out	(_g_PortDebugData), a
	jp	00138$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:109: DEBUG_LOG(msg);
00141$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:110: g_PortDebugData = ':';
	ld	a, #0x3a
	out	(_g_PortDebugData), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:111: g_PortDebugMode = DEBUG_NOLINEFEED|DEBUG_MODE_MULTI|DEBUG_MULTI_DEC; // Multi byte ASCII mode
	ld	a, #0x62
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:112: g_PortDebugData = num;
	ld	a, e
	out	(_g_PortDebugData), a
;./the-castel.c:673: switch (tile)
	ld	a, -1 (ix)
	sub	a, #0x41
	jp	Z,00107$
	ld	a, -1 (ix)
	sub	a, #0x42
	jp	Z,00107$
	ld	a, -1 (ix)
	sub	a, #0x43
	jp	Z,00107$
	ld	a, -1 (ix)
	sub	a, #0x44
	jp	Z,00107$
	ld	a, -1 (ix)
	sub	a, #0x45
	jp	Z,00108$
	ld	a, -1 (ix)
	sub	a, #0x46
	jp	Z,00111$
	ld	a, -1 (ix)
	sub	a, #0x47
	jp	Z,00120$
	ld	a, -1 (ix)
	sub	a, #0x4a
	jp	Z,00117$
	ld	a, -1 (ix)
	sub	a, #0x4e
	jp	Z,00121$
	ld	a, -1 (ix)
	sub	a, #0x4f
	jr	Z, 00101$
	ld	a, -1 (ix)
	sub	a, #0x5f
	jp	Z,00125$
	ld	a, -1 (ix)
	sub	a, #0x60
	jp	Z,00122$
	ld	a, -1 (ix)
	sub	a, #0x61
	jp	Z,00123$
	ld	a, -1 (ix)
	sub	a, #0x62
	jp	Z,00124$
	ld	a, -1 (ix)
	sub	a, #0x68
	jp	Z,00126$
	ld	a, -1 (ix)
	sub	a, #0x90
	jp	Z,00127$
	jp	00137$
;./the-castel.c:675: case TILE_HEART:
00101$:
;./the-castel.c:676: if (addLife())
	push	bc
	call	_addLife
	pop	bc
	or	a, a
	jr	Z, 00103$
;./the-castel.c:678: replacementItemInLevel(x, y, TILE_MASK_HEART); // EMPTY_ITEM
	push	bc
	ld	a, #0xbb
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replacementItemInLevel
	pop	bc
;./the-castel.c:679: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:680: PlayBankSFX(10, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_PlayBankSFX
00103$:
;./the-castel.c:682: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:686: case TILE_MASK_DOOR3:
00107$:
;./the-castel.c:687: drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:688: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:689: case TILE_DOOR1:
00108$:
;./the-castel.c:690: if (hasItemInInventory(TILE_KEY1))
	push	bc
	ld	a, #0x60
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	Z, 00110$
;./the-castel.c:692: changeLevel(x, y, TILE_KEY1, TILE_MASK_DOOR1);
	ld	hl, #0x4160
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_changeLevel
00110$:
;./the-castel.c:694: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:695: case TILE_DOOR2:
00111$:
;./the-castel.c:696: if (g_CurrRoomIdx == LAST_LEVEL)
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x0d
	jr	NZ, 00115$
;./the-castel.c:698: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:699: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00116$
00115$:
;./the-castel.c:703: if (hasItemInInventory(TILE_KEY2))
	push	bc
	ld	a, #0x61
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	Z, 00116$
;./the-castel.c:705: changeLevel(x, y, TILE_KEY2, TILE_MASK_DOOR2);
	ld	hl, #0x4261
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_changeLevel
00116$:
;./the-castel.c:708: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:709: case TILE_DOOR3:
00117$:
;./the-castel.c:710: if (hasItemInInventory(TILE_KEY3))
	push	bc
	ld	a, #0x62
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	Z, 00119$
;./the-castel.c:712: changeLevel(x, y, TILE_KEY3, TILE_MASK_DOOR3);
	ld	hl, #0x4362
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_changeLevel
00119$:
;./the-castel.c:714: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:715: case TILE_DOOR_PREV:
00120$:
;./the-castel.c:716: drawLevel(g_Levels[g_CurrRoomIdx].PrevLvIdx);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:717: return false;
	xor	a, a
	jp	00143$
;./the-castel.c:718: case TILE_DOOR_NEXT:
00121$:
;./the-castel.c:719: drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:720: return false;
	xor	a, a
	jp	00143$
;./the-castel.c:722: case TILE_KEY1:
00122$:
;./the-castel.c:725: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY1);
	ld	h, #0xbd
	ld	l, -1 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:726: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:728: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:729: case TILE_KEY2:
00123$:
;./the-castel.c:732: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY2);
	ld	h, #0xbe
	ld	l, -1 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:733: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:735: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:736: case TILE_KEY3:
00124$:
;./the-castel.c:739: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY3);
	ld	h, #0xbf
	ld	l, -1 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:740: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:742: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:743: case TILE_AMPHORA:
00125$:
;./the-castel.c:746: replaceAndRemoveItem(x, y, tile, TILE_MASK_AMPHORA);
	ld	h, #0xbc
	ld	l, -1 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:747: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:749: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:750: case TILE_CRUCIFIX:
00126$:
;./the-castel.c:753: replaceAndRemoveItem(x, y, tile, TILE_MASK_CRUCIFIX);
	ld	h, #0xb3
	ld	l, -1 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:754: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:756: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:757: case TILE_BLOCK_TEST:
00127$:
;./the-castel.c:758: if (g_PrevDirection == INPUT_RIGHT)
	ld	a, (_g_PrevDirection+0)
	dec	a
	jr	NZ, 00136$
;./the-castel.c:759: if (getTile(x + 9, y) == 0)
	ld	a, c
	add	a, #0x09
	ld	e, a
	push	bc
	push	de
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_getTile
	pop	de
	pop	bc
	or	a, a
	jr	NZ, 00133$
;./the-castel.c:761: setTile(x, y, EMPTY_ITEM);
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
	pop	de
	pop	bc
;./the-castel.c:762: setTile(x + 9, y, TILE_BLOCK_TEST);
	ld	a, #0x90
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_setTile
	jp	00136$
00133$:
;./the-castel.c:764: else if (g_PrevDirection == INPUT_LEFT)
	ld	a, (_g_PrevDirection+0)
	sub	a, #0x02
	jr	NZ, 00136$
;./the-castel.c:766: if (getTile(x, y) == 0)
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_getTile
	pop	bc
	or	a, a
	jr	NZ, 00136$
;./the-castel.c:768: setTile(x, y, EMPTY_ITEM);
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
;./the-castel.c:769: setTile(x, y, TILE_BLOCK_TEST);
	ld	a, #0x90
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
00136$:
;./the-castel.c:772: return TRUE;
	ld	a, #0x01
	jp	00143$
;./the-castel.c:773: }
00137$:
;./the-castel.c:775: updateScore();
	call	_updateScore
;./the-castel.c:777: return FALSE;
	xor	a, a
00143$:
;./the-castel.c:778: }
	inc	sp
	pop	ix
	ret
___str_15:
	.ascii "Intercat"
	.db 0x00
;./the-castel.c:788: void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask)
;	---------------------------------
; Function replaceAndRemoveItem
; ---------------------------------
_replaceAndRemoveItem::
	ld	c, a
	ld	b, l
;./the-castel.c:790: replacementItemInLevel(x, y, tileMask);
	push	bc
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replacementItemInLevel
	pop	bc
;./the-castel.c:791: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:792: addItemToInventory(tile);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	call	_addItemToInventory
;./the-castel.c:793: }
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:803: void changeLevel(u8 x, u8 y, u8 key, u8 door)
;	---------------------------------
; Function changeLevel
; ---------------------------------
_changeLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;./the-castel.c:805: removeItemFromInventory(key);
	push	hl
	ld	a, 4 (ix)
	call	_removeItemFromInventory
	pop	hl
;./the-castel.c:806: replacementItemInLevel(x, y, door);
	ld	a, 5 (ix)
	push	af
	inc	sp
	ld	a, h
	call	_replacementItemInLevel
;./the-castel.c:807: drawLevel(g_Levels[g_CurrRoomIdx].NextLvlIdx);
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
	add	hl, bc
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:808: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:816: bool getMoney(u8 x, u8 y)
;	---------------------------------
; Function getMoney
; ---------------------------------
_getMoney::
	dec	sp
	ld	c, a
	ld	a, l
	ld	iy, #0
	add	iy, sp
;./the-castel.c:818: switch (getTile(x, y))
	ld	0 (iy), a
	push	bc
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_getTile
	pop	bc
	sub	a, #0x63
	jr	NZ, 00102$
;./the-castel.c:823: replacementItemInLevel(x, y, TILE_MASK_MONEY);
	push	bc
	ld	a, #0xc0
	push	af
	inc	sp
	ld	iy, #3
	add	iy, sp
	ld	l, 0 (iy)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replacementItemInLevel
	pop	bc
;./the-castel.c:824: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	iy, #1
	add	iy, sp
	ld	l, 0 (iy)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:826: g_Player.Score++;
	ld	bc, #_g_Player+6
	ld	a, (bc)
	inc	a
	ld	(bc), a
;./the-castel.c:827: updateScore();
	call	_updateScore
;./the-castel.c:829: PlayBankSFX(11, 15);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_PlayBankSFX
;./the-castel.c:831: return TRUE;
	ld	a, #0x01
	jp	00103$
;./the-castel.c:832: }
00102$:
;./the-castel.c:833: return FALSE;
	xor	a, a
00103$:
;./the-castel.c:834: }
	inc	sp
	ret
;./the-castel.c:843: bool isDanger(u8 x, u8 y, u8 t)
;	---------------------------------
; Function isDanger
; ---------------------------------
_isDanger::
	push	ix
	ld	ix,#0
	add	ix,sp
;./the-castel.c:845: switch (isUnderDunger(x, y))
	call	_isUnderDunger
	cp	a, #0x40
	jr	Z, 00113$
	cp	a, #0x69
	jr	Z, 00104$
	cp	a, #0x6a
	jr	Z, 00104$
	cp	a, #0x6b
	jr	Z, 00104$
	sub	a, #0x6c
	jp	NZ,00119$
;./the-castel.c:850: case TILE_DANGE4:
00104$:
;./the-castel.c:851: if (g_IsDanger)
	ld	a, (_g_IsDanger+0)
	or	a, a
	jr	Z, 00111$
;./the-castel.c:854: if (!hasLives())
	call	_hasLives
	or	a, a
	jr	NZ, 00108$
;./the-castel.c:856: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:857: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00112$
00108$:
;./the-castel.c:861: if ((g_DangerCounter - g_DelayRemoveLife) > t)
	ld	a, (_g_DangerCounter+0)
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
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00174$
	xor	a, #0x80
00174$:
	jp	P, 00112$
;./the-castel.c:863: removeLife();
	call	_removeLife
;./the-castel.c:864: displayLife();
	call	_displayLife
;./the-castel.c:866: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:868: g_IsDanger = FALSE;
	ld	hl, #_g_IsDanger
	ld	(hl), #0x00
;./the-castel.c:869: g_DelayRemoveLife--;
	ld	iy, #_g_DelayRemoveLife
	dec	0 (iy)
	jp	00112$
00111$:
;./the-castel.c:876: g_DangerCounter = 0;
	ld	hl, #_g_DangerCounter
	ld	(hl), #0x00
;./the-castel.c:877: g_IsDanger = TRUE;
	ld	iy, #_g_IsDanger
	ld	0 (iy), #0x01
00112$:
;./the-castel.c:879: return TRUE;
	ld	a, #0x01
	jp	00121$
;./the-castel.c:880: case TILE_LAVA:
00113$:
;./the-castel.c:881: if (!hasLives())
	call	_hasLives
	or	a, a
	jr	NZ, 00117$
;./the-castel.c:883: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:884: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00118$
00117$:
;./the-castel.c:888: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00118$
;./the-castel.c:890: displayLife();
	call	_displayLife
;./the-castel.c:891: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:892: drawLevel(1);
	ld	a, #0x01
	call	_drawLevel
00118$:
;./the-castel.c:895: return TRUE;
	ld	a, #0x01
	jp	00121$
;./the-castel.c:897: default:
00119$:
;./the-castel.c:898: g_DangerCounter = 0;
	ld	hl, #_g_DangerCounter
	ld	(hl), #0x00
;./the-castel.c:899: g_IsDanger = FALSE;
	ld	iy, #_g_IsDanger
	ld	0 (iy), #0x00
;./the-castel.c:900: return FALSE;
	xor	a, a
;./the-castel.c:901: }
00121$:
;./the-castel.c:902: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:909: void updateScore()
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
;./the-castel.c:911: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	jr	Z, 00108$
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x0e
	jr	Z, 00108$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:204: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:205: g_PrintData.CursorY = y;
	ld	bc, #_g_PrintData + 6
	xor	a, a
	ld	(bc), a
;./the-castel.c:918: Print_DrawText(g_Levels[g_CurrRoomIdx].Name);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
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
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:204: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:205: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:922: Print_DrawText("SCORE:");
	push	bc
	ld	hl, #___str_16
	call	_Print_DrawText
	pop	bc
;./the-castel.c:923: String_Format(StrFormat, "%04i", g_Player.Score);
	ld	a, (#(_g_Player + 6) + 0)
	ld	e, a
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_17
	push	hl
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_String_Format
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:204: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x10
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:205: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:925: Print_DrawText(StrFormat);
	push	bc
	ld	hl, #2
	add	hl, sp
	call	_Print_DrawText
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:204: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x16
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:205: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:929: Print_DrawText("LIFE:");
	ld	hl, #___str_18
	call	_Print_DrawText
00108$:
;./the-castel.c:931: }
	ld	sp, ix
	pop	ix
	ret
___str_16:
	.ascii "SCORE:"
	.db 0x00
___str_17:
	.ascii "%04i"
	.db 0x00
___str_18:
	.ascii "LIFE:"
	.db 0x00
;./the-castel.c:940: void replacementItemInLevel(u8 x, u8 y, u8 tile)
;	---------------------------------
; Function replacementItemInLevel
; ---------------------------------
_replacementItemInLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	-1 (ix), a
	ld	e, l
;./the-castel.c:942: g_Levels[g_CurrRoomIdx].Layout[((y / 8) * 32) + (x / 8)] = tile;
	ld	bc, (_g_CurrRoomIdx)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc, #_g_Levels
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	d, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00103$
	ld	hl, #0x0007
	add	hl, de
00103$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	(sp), hl
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00104$
	ld	hl, #0x0007
	add	hl, de
00104$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	pop	de
	push	de
	add	hl, de
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
;./the-castel.c:943: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:950: void drawLevel(u8 levelIdx)
;	---------------------------------
; Function drawLevel
; ---------------------------------
_drawLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-22
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), a
;./the-castel.c:952: pausePT3Music();
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
;./the-castel.c:956: g_CurrRoomIdx = levelIdx;
	ld	a, -2 (ix)
	ld	(_g_CurrRoomIdx+0), a
;./the-castel.c:957: g_PawnCount = 0;
	ld	hl, #_g_PawnCount
	ld	(hl), #0x00
;./the-castel.c:958: g_GhostCount = 0;
	ld	hl, #_g_GhostCount
	ld	(hl), #0x00
;./the-castel.c:959: g_SpiderCount = 0;
	ld	hl, #_g_SpiderCount
	ld	(hl), #0x00
;./the-castel.c:960: g_BatCount = 0;
	ld	hl, #_g_BatCount
	ld	(hl), #0x00
;./the-castel.c:961: g_SecondCounter = 0;
	ld	hl, #_g_SecondCounter
	ld	(hl), #0x00
;./the-castel.c:962: g_DangerCounter = 0;
	ld	hl, #_g_DangerCounter
	ld	(hl), #0x00
;./the-castel.c:973: VDP_FillVRAM_16K(0, g_ScreenLayoutLow, 32 * 24);
	ld	hl, #0x0300
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
;./the-castel.c:976: for (u8 riga = 0; riga < g_Levels[levelIdx].Height; ++riga)
	ld	bc, #_g_Levels+0
	ld	e, -2 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ex	(sp), hl
	ld	a, -22 (ix)
	ld	-20 (ix), a
	ld	a, -21 (ix)
	ld	-19 (ix), a
	ld	-1 (ix), #0x00
00130$:
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NC, 00120$
;./the-castel.c:1000: g_ScreenLayoutLow + (32 * (riga + g_Levels[levelIdx].Y)) + (g_Levels[levelIdx].X), g_Levels[levelIdx].Width);
	ld	a, -22 (ix)
	add	a, #0x02
	ld	-18 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-17 (ix), a
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-16 (ix), a
	ld	-15 (ix), #0x00
	ld	a, -1 (ix)
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
	ld	a, -22 (ix)
	add	a, #0x01
	ld	-14 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), #0x00
	ld	a, -9 (ix)
	add	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	adc	a, -6 (ix)
	ld	-4 (ix), a
	ld	b, #0x05
00212$:
	sla	-5 (ix)
	rl	-4 (ix)
	djnz	00212$
	ld	hl, (_g_ScreenLayoutLow)
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, -7 (ix)
	add	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	adc	a, -4 (ix)
	ld	-8 (ix), a
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -9 (ix)
	add	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	adc	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-12 (ix), a
	ld	a, -4 (ix)
	ld	-11 (ix), a
;./the-castel.c:999: VDP_WriteVRAM_16K(g_Levels[levelIdx].Layout + g_Levels[levelIdx].Width * riga,
	ld	a, -22 (ix)
	add	a, #0x04
	ld	-10 (ix), a
	ld	a, -21 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	e, -1 (ix)
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00213$:
	add	hl, hl
	jr	NC, 00214$
	add	hl, de
00214$:
	djnz	00213$
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, -8 (ix)
	add	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, -5 (ix)
	ld	-3 (ix), a
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -12 (ix)
	ld	d, -11 (ix)
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_VDP_WriteVRAM_16K
;./the-castel.c:1002: for (u8 colonna = 0; colonna < g_Levels[levelIdx].Width; ++colonna)
	ld	a, -22 (ix)
	ld	-12 (ix), a
	ld	a, -21 (ix)
	ld	-11 (ix), a
	ld	a, -22 (ix)
	ld	-7 (ix), a
	ld	a, -21 (ix)
	ld	-6 (ix), a
	ld	a, -22 (ix)
	ld	-5 (ix), a
	ld	a, -21 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
00127$:
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	e, (hl)
	ld	a, -3 (ix)
	sub	a, e
	jp	NC, 00131$
;./the-castel.c:1005: u8 tile = g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna];
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00215$:
	add	hl, hl
	jr	NC, 00216$
	add	hl, de
00216$:
	djnz	00215$
	pop	bc
	ld	e, -3 (ix)
	ld	d, #0x00
	add	hl, de
	add	hl, bc
	ld	c, (hl)
;./the-castel.c:1007: if (tile == TILE_START_POS) // Rilevamento della posizione iniziale del giocatore
	ld	a, c
	sub	a, #0x7f
	jr	NZ, 00117$
;./the-castel.c:1009: u8 x = g_Levels[levelIdx].X + colonna;
	pop	hl
	push	hl
	ld	a, (hl)
	add	a, -3 (ix)
	ld	c, a
;./the-castel.c:1010: u8 y = g_Levels[levelIdx].Y + riga;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	add	a, -1 (ix)
;./the-castel.c:1019: GamePawn_SetPosition(&g_Player.Pawn, x * 8, (y - 3) * 8);
	ld	b, a
	add	a, #0xfd
	add	a, a
	add	a, a
	add	a, a
	ld	e, a
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	push	bc
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	hl, #(_g_Player + 8)
	call	_GamePawn_SetPosition
	pop	bc
;./the-castel.c:1021: setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTileByTileCoord
	jp	00128$
00117$:
;./the-castel.c:1023: else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < MAX_ENEMY)) // Rilevamento della posizione iniziale del nemico
	ld	a, c
	sub	a, #0x7c
	jr	NZ, 00113$
	ld	a, (_g_PawnCount+0)
	sub	a, #0x03
	jr	NC, 00113$
;./the-castel.c:1025: g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Enemy[0], 196, 6, riga, colonna, levelIdx);
	ld	h, -2 (ix)
	ld	l, -3 (ix)
	push	hl
	ld	h, -1 (ix)
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
	ld	(_g_PawnCount+0), a
	jp	00128$
00113$:
;./the-castel.c:1027: else if ((tile == TILE_POS_GHOST) && (g_Levels[levelIdx].GhostNumber < MAX_GHOST)) // Rilevamento della posizione iniziale del nemico
	ld	a, c
	sub	a, #0x80
	jr	NZ, 00109$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	de, #0x000b
	add	hl, de
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00109$
;./the-castel.c:1029: g_GhostCount = positionGenericEnemy(TILE_POS_GHOST, g_GhostCount, &g_Ghost[0], 200, 10, riga, colonna, levelIdx);
	ld	h, -2 (ix)
	ld	l, -3 (ix)
	push	hl
	ld	h, -1 (ix)
	ld	l, #0x0a
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
	ld	(_g_GhostCount+0), a
	jp	00128$
00109$:
;./the-castel.c:1031: else if ((tile == TILE_POS_SPIDER) && (g_Levels[levelIdx].SpiderNumber < MAX_SPIDER)) // Rilevamento della posizione iniziale del nemico
	ld	a, c
	sub	a, #0x81
	jr	NZ, 00105$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000c
	add	hl, de
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00105$
;./the-castel.c:1033: g_SpiderCount = positionGenericEnemy(TILE_POS_SPIDER, g_SpiderCount, &g_Spider[0], 192, 15, riga, colonna, levelIdx);
	ld	h, -2 (ix)
	ld	l, -3 (ix)
	push	hl
	ld	h, -1 (ix)
	ld	l, #0x0f
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
	ld	(_g_SpiderCount+0), a
	jp	00128$
00105$:
;./the-castel.c:1035: else if ((tile == TILE_POS_BAT) && (g_Levels[levelIdx].BatNumber < MAX_BAT)) // Rilevamento della posizione iniziale del nemico
	ld	a, c
	sub	a, #0x82
	jr	NZ, 00128$
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00128$
;./the-castel.c:1037: g_BatCount = positionGenericEnemy(TILE_POS_BAT, g_BatCount, &g_Bat[0], 204, 20, riga, colonna, levelIdx);
	ld	h, -2 (ix)
	ld	l, -3 (ix)
	push	hl
	ld	h, -1 (ix)
	ld	l, #0x14
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
	ld	(_g_BatCount+0), a
00128$:
;./the-castel.c:1002: for (u8 colonna = 0; colonna < g_Levels[levelIdx].Width; ++colonna)
	inc	-3 (ix)
	jp	00127$
00131$:
;./the-castel.c:976: for (u8 riga = 0; riga < g_Levels[levelIdx].Height; ++riga)
	inc	-1 (ix)
	jp	00130$
00120$:
;./the-castel.c:1042: hideSprite(g_PawnCount, MAX_ENEMY, 6);
	ld	a, #0x06
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_PawnCount+0)
	call	_hideSprite
;./the-castel.c:1043: hideSprite(g_GhostCount, MAX_GHOST, 10);
	ld	a, #0x0a
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_GhostCount+0)
	call	_hideSprite
;./the-castel.c:1044: hideSprite(g_SpiderCount, MAX_SPIDER, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SpiderCount+0)
	call	_hideSprite
;./the-castel.c:1045: hideSprite(g_BatCount, MAX_BAT, 20);
	ld	a, #0x14
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_BatCount+0)
	call	_hideSprite
;./the-castel.c:1047: if (levelIdx == 0)
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00137$
;./the-castel.c:1053: updateScore();
	call	_updateScore
;./the-castel.c:1055: displayItemToInventory();
	call	_displayItemToInventory
;./the-castel.c:1056: displayLife();
	call	_displayLife
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
00137$:
	ld	a, #0x40
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./the-castel.c:1061: restorePT3Music();
	call	_restorePT3Music
;./the-castel.c:1062: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:1075: u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 bo, u8 riga, u8 colonna, u8 levelIdx)
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
;./the-castel.c:1077: if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_GENERIC_ENEMY)
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
;./the-castel.c:1079: if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_GENERIC_ENEMY)
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
;./the-castel.c:1087: u8 x = g_Levels[levelIdx].X + colonna;
	ld	a, (bc)
	add	a, 9 (ix)
	ld	e, a
;./the-castel.c:1088: u8 y = g_Levels[levelIdx].Y + riga;
	inc	bc
	ld	a, (bc)
	add	a, 8 (ix)
	ld	d, a
;./the-castel.c:1090: managementSprite(x, y, bo, enemyCount, idxSprite);
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
;./the-castel.c:1092: spritePosition(x, y, &enemy[0], enemyCount, "---");
	ld	hl, #___str_19+0
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	push	de
	push	hl
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	bc
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_spritePosition
	pop	de
;./the-castel.c:1094: setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
	xor	a, a
	push	af
	inc	sp
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_setTileByTileCoord
;./the-castel.c:1095: enemyCount++;
	inc	-2 (ix)
00104$:
;./the-castel.c:1099: return enemyCount;
	ld	a, -2 (ix)
;./the-castel.c:1100: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	pop	bc
	pop	bc
	inc	sp
	jp	(hl)
___str_19:
	.ascii "---"
	.db 0x00
;./the-castel.c:1102: void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 enemyCount, char *type)
;	---------------------------------
; Function spritePosition
; ---------------------------------
_spritePosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	b, a
	ld	c, l
;./the-castel.c:1104: struct CharacterEnemy *generic = &genericEnemy[enemyCount];
	ld	e, 6 (ix)
	ld	d, #0x00
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	add	hl, de
	ex	de, hl
;./the-castel.c:1105: generic->X = x * 8;
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
;./the-castel.c:1106: generic->Y = (y - 1) * 8;
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
;./the-castel.c:1107: generic->Direction = -1;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
;./the-castel.c:1108: generic->TypeEnemy = type;
	ld	hl, #0x0006
	add	hl, de
	ld	a, 7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 8 (ix)
	ld	(hl), a
;./the-castel.c:1109: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	inc	sp
	jp	(hl)
;./the-castel.c:1117: void hideSprite(u8 count, u8 maxElement, u8 baseSprite)
;	---------------------------------
; Function hideSprite
; ---------------------------------
_hideSprite::
	ld	c, a
	ld	b, l
;./the-castel.c:1119: for (u8 i = count; i < maxElement; ++i)
00104$:
	ld	a, c
	sub	a, b
	jr	NC, 00106$
;./the-castel.c:1121: VDP_HideSprite(baseSprite + i);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	add	a, c
	ld	e, a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:1206: inline void VDP_HideSprite(u8 index) { VDP_SetSpritePositionY(index, VDP_SPRITE_HIDE); }
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_VDP_SetSpritePositionY
	pop	bc
;./the-castel.c:1119: for (u8 i = count; i < maxElement; ++i)
	inc	c
	jp	00104$
00106$:
;./the-castel.c:1123: }
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:1133: void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape)
;	---------------------------------
; Function managementSprite
; ---------------------------------
_managementSprite::
	ld	e, a
	ld	b, l
;./the-castel.c:1144: VDP_SetSpriteSM1(baseSprite + enemyCount, x, y, indexShape, COLOR_WHITE);
	ld	hl, #3
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	push	bc
	push	de
	ld	h, #0x0f
	ld	l, 2 (iy)
	push	hl
	push	bc
	inc	sp
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpriteSM1
	pop	de
	pop	bc
;./the-castel.c:1153: VDP_SetSpritePosition(baseSprite + enemyCount, x * 8, (y - 1) * 8);
	ld	a, b
	dec	a
	add	a, a
	add	a, a
	add	a, a
	ld	b, a
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	inc	sp
	ld	a, c
	call	_VDP_SetSpritePosition
;./the-castel.c:1154: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;./the-castel.c:1162: void initCharacter(struct Character *ply, u8 id)
;	---------------------------------
; Function initCharacter
; ---------------------------------
_initCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
;./the-castel.c:1164: Mem_Set(0, ply, sizeof(struct Character));
	ld	e, l
	ld	d, h
	push	hl
	ld	bc, #0x001c
	push	bc
	xor	a, a
	call	_Mem_Set
	pop	hl
;./the-castel.c:1166: Game_Pawn *pawn = &ply->Pawn;
	ld	bc, #0x0008
	add	hl, bc
;./the-castel.c:1168: if (id == 0)
	ld	a, 4 (ix)
	or	a, a
	jr	NZ, 00103$
;./the-castel.c:1170: GamePawn_Initialize(pawn, g_PlayerSpriteLayers, numberof(g_PlayerSpriteLayers), 0, g_PlayerAnimActions);
	ld	bc, #_g_PlayerAnimActions+0
	ld	de, #_g_PlayerSpriteLayers+0
	push	hl
	push	bc
	ld	bc, #0x02
	push	bc
	call	_GamePawn_Initialize
	pop	hl
;./the-castel.c:1171: GamePawn_SetPosition(pawn, 255 - 16 - 16, 128);
	push	hl
	ld	de, #0x80df
	push	de
	call	_GamePawn_SetPosition
	pop	hl
;./the-castel.c:1172: GamePawn_InitializePhysics(pawn, physicsEventPlayer, physicsCollision, 16, 16);
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
;./the-castel.c:1174: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:1181: void updateCharacter(struct Character *ply)
;	---------------------------------
; Function updateCharacter
; ---------------------------------
_updateCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-19
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;./the-castel.c:1184: u8 dir = 0;
	ld	-15 (ix), #0x00
;./the-castel.c:1185: ply->DX = 0;
	ld	a, -2 (ix)
	add	a, #0x03
	ld	-14 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), #0x00
;./the-castel.c:1186: ply->DY = 0;
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-12 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x00
;./the-castel.c:1189: if (ply->Input & INPUT_RIGHT)
	ld	a, -2 (ix)
	add	a, #0x05
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	bit	0, -5 (ix)
	jr	Z, 00105$
;./the-castel.c:1191: ply->DX++;
	ld	l,-14 (ix)
	ld	h,-13 (ix)
	inc	(hl)
;./the-castel.c:1192: ply->bMoving = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
;./the-castel.c:1193: dir = 1;
	ld	-15 (ix), #0x01
	jp	00106$
00105$:
;./the-castel.c:1195: else if (ply->Input & INPUT_LEFT)
	bit	1, -5 (ix)
	jr	Z, 00102$
;./the-castel.c:1197: ply->DX--;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	dec	a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), a
;./the-castel.c:1198: ply->bMoving = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
;./the-castel.c:1199: dir = 0;
	ld	-15 (ix), #0x00
	jp	00106$
00102$:
;./the-castel.c:1202: ply->bMoving = FALSE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
00106$:
;./the-castel.c:1204: if (ply->bInAir) // Jump/fall
	ld	a, -2 (ix)
	add	a, #0x01
	ld	-10 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	or	a, a
	jp	Z, 00117$
;./the-castel.c:1206: ply->DY -= ply->VelocityY / 4;
	ld	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	ld	-7 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	ld	-19 (ix), a
	rlca
	sbc	a, a
	ld	-18 (ix), a
	ld	a, -19 (ix)
	ld	-17 (ix), a
	ld	a, -18 (ix)
	ld	-16 (ix), a
	bit	7, -18 (ix)
	jr	Z, 00135$
	ld	a, -19 (ix)
	add	a, #0x03
	ld	-17 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
00135$:
	sra	-16 (ix)
	rr	-17 (ix)
	sra	-16 (ix)
	rr	-17 (ix)
	ld	a, -17 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sub	a, -3 (ix)
	ld	-3 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;./the-castel.c:1207: ply->VelocityY -= GRAVITY;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	c, (hl)
	dec	c
	ld	l, -5 (ix)
	ld	h, -4 (ix)
;./the-castel.c:1209: if (ply->VelocityY < -FORCE)
	ld	a,c
	ld	(hl),a
	xor	a, #0x80
	sub	a, #0x71
	jr	NC, 00118$
;./the-castel.c:1210: ply->VelocityY = -FORCE;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0xf1
	jp	00118$
00117$:
;./the-castel.c:1212: else if (ply->Input & INPUT_JUMP)
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	bit	2, -3 (ix)
	jr	Z, 00114$
;./the-castel.c:1214: ply->bInAir = TRUE;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), #0x01
;./the-castel.c:1215: ply->VelocityY = FORCE;
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), #0x0f
	jp	00118$
00114$:
;./the-castel.c:1217: else if (ply->Input & INPUT_GET)
	bit	3, -3 (ix)
	jr	Z, 00118$
;./the-castel.c:1225: if (interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) /*||
	ld	a, (#_g_Player + 14)
	ld	-3 (ix), a
	add	a, #0x0c
	ld	-4 (ix), a
	ld	a, (#_g_Player + 13)
	ld	-3 (ix), a
	add	a, #0x08
	ld	-3 (ix), a
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -3 (ix)
	call	_interact
00118$:
;./the-castel.c:1238: u8 act = ACTION_IDLE;
	ld	-4 (ix), #0x00
;./the-castel.c:1204: if (ply->bInAir) // Jump/fall
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
;./the-castel.c:1239: if (ply->bInAir && (ply->VelocityY >= 0))
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00130$
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	bit	7, -5 (ix)
	jr	NZ, 00130$
;./the-castel.c:1240: act = ACTION_JUMP;
	ld	-4 (ix), #0x02
	jp	00131$
00130$:
;./the-castel.c:1241: else if (ply->bInAir)
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00127$
;./the-castel.c:1242: act = ACTION_FALL;
	ld	-4 (ix), #0x03
	jp	00131$
00127$:
;./the-castel.c:1243: else if (ply->bMoving)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
;./the-castel.c:1245: if (dir == 1)
	ld	a, -15 (ix)
	dec	a
	jr	NZ, 00122$
;./the-castel.c:1247: act = ACTION_MOVE_RIGHT;
	ld	-4 (ix), #0x04
	jp	00131$
00122$:
;./the-castel.c:1249: else if (dir == 0)
	ld	a, -15 (ix)
	or	a, a
	jr	NZ, 00131$
;./the-castel.c:1250: act = ACTION_MOVE;
	ld	-4 (ix), #0x01
00131$:
;./the-castel.c:1253: Game_Pawn *pawn = &ply->Pawn;
	ld	a, -2 (ix)
	add	a, #0x08
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
;./the-castel.c:1254: GamePawn_SetAction(pawn, act);
	push	de
	ld	a, -4 (ix)
	push	af
	inc	sp
;	spillPairReg hl
;	spillPairReg hl
	ex	de,hl
;	spillPairReg hl
;	spillPairReg hl
	call	_GamePawn_SetAction
	pop	de
;./the-castel.c:1255: GamePawn_SetMovement(pawn, ply->DX, ply->DY);
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	l, -14 (ix)
	ld	h, -13 (ix)
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
;./the-castel.c:1256: GamePawn_Update(pawn);
	ex	de, hl
	call	_GamePawn_Update
;./the-castel.c:1257: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:1264: void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite)
;	---------------------------------
; Function updateGenericEnemy
; ---------------------------------
_updateGenericEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
;./the-castel.c:1267: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, 4 (ix)
	jp	NC, 00114$
;./the-castel.c:1269: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	add	hl, de
;./the-castel.c:1271: if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
	ld	e, l
	ld	d, h
	inc	hl
	ex	(sp), hl
	pop	hl
	push	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, (de)
	add	a, #0x07
	ld	b, a
	push	bc
	push	de
	ld	a, b
	call	_physicsCollisionEnemy
	ld	-3 (ix), a
	pop	de
	pop	bc
;./the-castel.c:1273: if (enemy->Direction < 0)
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	dec	hl
;./the-castel.c:1271: if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
	ld	a, -3 (ix)
	or	a, a
	jr	NZ, 00108$
	ld	a, (de)
	ld	b, a
;./the-castel.c:1273: if (enemy->Direction < 0)
	bit	7, -5 (ix)
	jr	Z, 00102$
;./the-castel.c:1275: enemy->X--;
	ld	a, b
	dec	a
	ld	(de), a
	jp	00109$
00102$:
;./the-castel.c:1279: enemy->X++;
	ld	a, b
	inc	a
	ld	(de), a
	jp	00109$
00108$:
;./the-castel.c:1284: enemy->Direction *= -1;
	xor	a, a
	sub	a, -6 (ix)
	ld	-4 (ix), a
	sbc	a, a
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;./the-castel.c:1271: if (!physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
	ld	a, (de)
	ld	b, a
;./the-castel.c:1285: if (enemy->Direction < 0)
	bit	7, -3 (ix)
	jr	Z, 00105$
;./the-castel.c:1287: enemy->X--;
	ld	a, b
	dec	a
	ld	(de), a
	jp	00109$
00105$:
;./the-castel.c:1291: enemy->X++;
	ld	a, b
	inc	a
	ld	(de), a
00109$:
;./the-castel.c:1302: VDP_SetSpritePosition(idFirstSprite + nEnemy, enemy->X, enemy->Y);
	pop	hl
	push	hl
	ld	b, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, 5 (ix)
	add	a, c
	ld	e, a
	push	bc
	push	bc
	inc	sp
	ld	a, e
	call	_VDP_SetSpritePosition
	pop	bc
;./the-castel.c:1267: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	c
	jp	00112$
00114$:
;./the-castel.c:1306: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:1313: void genericControl()
;	---------------------------------
; Function genericControl
; ---------------------------------
_genericControl::
;./the-castel.c:1317: if (isUnderTheWater(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY))
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
;./the-castel.c:1319: if (IsUnderWater)
	ld	a, (_IsUnderWater+0)
	or	a, a
	jr	Z, 00107$
;./the-castel.c:1321: if ((g_SecondCounter - g_DelayRemoveLife) > 3)
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
	jp	PO, 00145$
	xor	a, #0x80
00145$:
	jp	P, 00111$
;./the-castel.c:1323: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00102$
;./the-castel.c:1325: displayLife();
	call	_displayLife
;./the-castel.c:1327: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:1329: IsUnderWater = FALSE;
	ld	hl, #_IsUnderWater
	ld	(hl), #0x00
	jp	00111$
00102$:
;./the-castel.c:1333: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:1334: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00111$
00107$:
;./the-castel.c:1340: g_DelayRemoveLife = g_SecondCounter;
	ld	a, (_g_SecondCounter+0)
	ld	(_g_DelayRemoveLife+0), a
;./the-castel.c:1341: IsUnderWater = TRUE;
	ld	hl, #_IsUnderWater
	ld	(hl), #0x01
	jp	00111$
00110$:
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:688: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
;./the-castel.c:1347: IsUnderWater = FALSE;  // Non siamo più in collisione
	ld	hl, #_IsUnderWater
	ld	(hl), #0x00
;./the-castel.c:1348: g_DelayRemoveLife = 0; // Azzera il tempo dopo il quale si va a rimuovere una vita
	ld	hl, #_g_DelayRemoveLife
	ld	(hl), #0x00
00111$:
;./the-castel.c:1356: if (getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
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
	jr	NZ, 00113$
;./the-castel.c:1357: getMoney(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
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
00113$:
;./the-castel.c:1363: if (isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12, 2))
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 13) + 0)
	add	a, #0x08
	ld	b, a
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isDanger
;./the-castel.c:1367: }
	ret
;./the-castel.c:1374: bool State_Initialize()
;	---------------------------------
; Function State_Initialize
; ---------------------------------
_State_Initialize::
;./the-castel.c:1378: inizializePT3();
	call	_inizializePT3
;./the-castel.c:1382: inizializeAYFX();
	call	_inizializeAYFX
;./the-castel.c:1384: ChannelSFX(PSG_CHANNEL_A);
	xor	a, a
	call	_ChannelSFX
;./the-castel.c:1385: PlayBankSFX(0, 0);
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_PlayBankSFX
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
;./the-castel.c:1401: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;./the-castel.c:1413: VDP_LoadPattern_GM1_Pletter(g_DataBackground_Patterns, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_DataBackground_Patterns
	call	_VDP_LoadPattern_GM1_Pletter
;./the-castel.c:1416: Print_SetMode(PRINT_MODE_TEXT);
	ld	a, #0x04
	call	_Print_SetMode
;./the-castel.c:1417: Print_SetFontEx(8, 8, 1, 1, ' ', '_', g_DataBackground_Patterns + 192);
	ld	bc, #_g_DataBackground_Patterns + 192
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:175: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:176: g_PrintData.PatternY     = patternY;
	ld	de, #_g_PrintData + 1
	ld	a, #0x08
	ld	(de), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:177: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:178: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:179: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), #0x20
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:180: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0x5f
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:181: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #(_g_PrintData + 22)
	ld	(hl), #0x40
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:182: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 28)), bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/print.h:183: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
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
;./the-castel.c:1418: Print_Initialize();
	call	_Print_Initialize
;./the-castel.c:1419: g_PrintData.PatternOffset = 192;
	ld	hl, #(_g_PrintData + 32)
	ld	(hl), #0xc0
;./the-castel.c:1422: setColorTiles();
	call	_setColorTiles
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/vdp.h:1044: inline void VDP_SetSpriteFlag(u8 flag) { VDP_RegWriteBakMask(1, (u8)~(R01_ST|R01_MAG), flag); }
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, #0xfc
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./the-castel.c:1456: Pletter_UnpackToVRAM(g_DataSprtLayer, g_SpritePatternLow);
	ld	de, (_g_SpritePatternLow)
	ld	hl, #_g_DataSprtLayer
	call	_Pletter_UnpackToVRAM
;./the-castel.c:1458: Game_SetState(State_Preset);
	ld	hl, #_State_Preset
	call	_Game_SetState
;./the-castel.c:1460: return FALSE; // Frame finished
	xor	a, a
;./the-castel.c:1461: }
	ret
;./the-castel.c:1468: bool State_Game()
;	---------------------------------
; Function State_Game
; ---------------------------------
_State_Game::
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/system.h:130: inline void Halt() { __asm__("halt"); }
	halt
;./the-castel.c:1475: PT3_Decode();	 // Update data to write to the PSG regiters from the music
	call	_PT3_Decode
;./the-castel.c:1476: ayFX_Update();	 // Overwrite PSG registers data for the SFX
	call	_ayFX_Update
;./the-castel.c:1477: PT3_UpdatePSG(); // Update PSG registers
	call	_PT3_UpdatePSG
;./the-castel.c:1484: GamePawn_Draw(&g_Player.Pawn);
	ld	hl, #(_g_Player + 8)
	call	_GamePawn_Draw
;./the-castel.c:1491: updateCharacter(&g_Player);
	ld	hl, #_g_Player
	call	_updateCharacter
;./the-castel.c:1497: genericControl();
	call	_genericControl
;./the-castel.c:1501: readInputControl();
	call	_readInputControl
;./the-castel.c:1504: if (g_Frame == 50)
	ld	a, (_g_Frame+0)
	sub	a, #0x32
	jr	NZ, 00102$
;./the-castel.c:1506: g_SecondCounter++;
	ld	hl, #_g_SecondCounter
	inc	(hl)
;./the-castel.c:1507: g_Frame = 0;
	ld	hl, #_g_Frame
	ld	(hl), #0x00
00102$:
;./the-castel.c:1510: if (g_FrameCounter % 2 == 0)
	ld	hl, #_g_FrameCounter
	bit	0, (hl)
	jp	NZ,00104$
;./the-castel.c:1512: g_DangerCounter++;
	ld	hl, #_g_DangerCounter
	inc	(hl)
;./the-castel.c:1516: updateGenericEnemy(&g_Enemy[0], g_Levels[g_CurrRoomIdx].SkeletonNumber, 6);
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
	add	hl, bc
	ld	de, #0x000a
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
;./the-castel.c:1524: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Enemy[0], g_Levels[g_CurrRoomIdx].SkeletonNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	de, #_g_Enemy
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
;./the-castel.c:1528: updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].GhostNumber, 10);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000b
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Ghost
	call	_updateGenericEnemy
	pop	bc
;./the-castel.c:1536: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].GhostNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000b
	add	hl, de
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	ld	de, #_g_Ghost
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
;./the-castel.c:1540: updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].SpiderNumber, 15);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000c
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x0f
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Spider
	call	_updateGenericEnemy
	pop	bc
;./the-castel.c:1548: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].SpiderNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
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
	ld	de, #_g_Spider
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
	pop	bc
;./the-castel.c:1552: updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].BatNumber, 20);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000d
	add	hl, de
	ld	d, (hl)
	push	bc
	ld	a, #0x14
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #_g_Bat
	call	_updateGenericEnemy
	pop	bc
;./the-castel.c:1560: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].BatNumber);
	ld	de, (_g_CurrRoomIdx)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	push	af
	inc	sp
	ld	de, #_g_Bat
	ld	hl, #_g_Player
	call	_physicsCollisionPlayerAndGenericEnemy
00104$:
;./the-castel.c:1562: g_FrameCounter++;
	ld	hl, #_g_FrameCounter
	inc	(hl)
;./the-castel.c:1563: g_Frame++;
	ld	hl, #_g_Frame
	inc	(hl)
;./the-castel.c:1568: return TRUE;
	ld	a, #0x01
;./the-castel.c:1569: }
	ret
;./the-castel.c:1576: bool State_Preset()
;	---------------------------------
; Function State_Preset
; ---------------------------------
_State_Preset::
;./the-castel.c:1579: restoreLevel();
	call	_restoreLevel
;./the-castel.c:1587: initCharacter(&g_Player, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_Player
	call	_initCharacter
;./the-castel.c:1591: initInventory();
	call	_initInventory
;./the-castel.c:1595: initLife();
	call	_initLife
;./the-castel.c:1603: drawLevel(0);
	xor	a, a
	call	_drawLevel
;./the-castel.c:1607: Game_SetState(State_Game);
	ld	hl, #_State_Game
	call	_Game_SetState
;./the-castel.c:1609: return TRUE;
	ld	a, #0x01
;./the-castel.c:1610: }
	ret
;./the-castel.c:1617: bool State_Pause()
;	---------------------------------
; Function State_Pause
; ---------------------------------
_State_Pause::
;./the-castel.c:1619: return TRUE;
	ld	a, #0x01
;./the-castel.c:1620: }
	ret
;./the-castel.c:1627: bool State_GameOver()
;	---------------------------------
; Function State_GameOver
; ---------------------------------
_State_GameOver::
;./the-castel.c:1215: ply->VelocityY = FORCE;
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
;./the-castel.c:1630: VDP_HideAllSprites();
00105$:
;./the-castel.c:1632: drawLevel((sizeof(g_Levels) / sizeof(g_Levels[0])) - 1); // -1
	ld	a, #0x0e
	call	_drawLevel
;./the-castel.c:1635: while (Keyboard_Read(8) != 254)
00101$:
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	a, l
	sub	a, #0xfe
	jr	NZ, 00101$
;./the-castel.c:1639: Game_SetState(State_Preset);
	ld	hl, #_State_Preset
	call	_Game_SetState
;./the-castel.c:1641: return TRUE;
	ld	a, #0x01
;./the-castel.c:1642: }
	ret
;./the-castel.c:1653: void readInputControl()
;	---------------------------------
; Function readInputControl
; ---------------------------------
_readInputControl::
;./the-castel.c:1655: u8 row8 = Keyboard_Read(8);
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	c, l
;./the-castel.c:1657: g_Player.Input = 0;
	ld	de, #_g_Player+5
	xor	a, a
	ld	(de), a
;./the-castel.c:1658: if (isMoveRight(row8))
	push	bc
	push	de
	ld	a, c
	call	_isMoveRight
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00102$
;./the-castel.c:1660: g_Player.Input |= INPUT_RIGHT;
	ld	a, (de)
	set	0, a
	ld	(de), a
00102$:
;./the-castel.c:1662: if (isMoveLeft(row8))
	push	bc
	push	de
	ld	a, c
	call	_isMoveLeft
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00104$
;./the-castel.c:1664: g_Player.Input |= INPUT_LEFT;
	ld	a, (de)
	set	1, a
	ld	(de), a
00104$:
;./the-castel.c:1666: if (isMoveJump(row8))
	push	bc
	push	de
	ld	a, c
	call	_isMoveJump
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00106$
;./the-castel.c:1668: g_Player.Input |= INPUT_JUMP;
	ld	a, (de)
	set	2, a
	ld	(de), a
00106$:
;./the-castel.c:1670: if (isInteractObject(row8))
	push	bc
	push	de
	ld	a, c
	call	_isInteractObject
	pop	de
	pop	bc
	or	a, a
	jr	Z, 00108$
;./the-castel.c:1672: g_Player.Input |= INPUT_GET;
	ld	a, (de)
	set	3, a
	ld	(de), a
00108$:
;./the-castel.c:1675: g_PrevRow8 = row8;
	ld	hl, #_g_PrevRow8
	ld	(hl), c
;./the-castel.c:1676: }
	ret
;./the-castel.c:1683: bool isMoveRight(u8 row8)
;	---------------------------------
; Function isMoveRight
; ---------------------------------
_isMoveRight::
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;./the-castel.c:1685: bool isRight = FALSE;
	ld	c, #0x00
;./the-castel.c:1686: if (IS_KEY_PRESSED(row8, KEY_RIGHT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_RIGHT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_RIGHT))
	add	hl, hl
	jr	NC, 00101$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:160: u8 in = ~Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:161: return (in & JOY_INPUT_DIR_MASK);
	and	a, #0x0f
;./the-castel.c:1686: if (IS_KEY_PRESSED(row8, KEY_RIGHT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_RIGHT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_RIGHT))
	sub	a, #0x08
	jr	Z, 00101$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:160: u8 in = ~Joystick_Read(port);
	ld	l, #0x4c
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:161: return (in & JOY_INPUT_DIR_MASK);
	and	a, #0x0f
;./the-castel.c:1686: if (IS_KEY_PRESSED(row8, KEY_RIGHT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_RIGHT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_RIGHT))
	sub	a, #0x08
	jr	NZ, 00102$
00101$:
;./the-castel.c:1688: g_Player.Input |= INPUT_RIGHT;
	ld	bc, #_g_Player+5
	ld	a, (bc)
	set	0, a
	ld	(bc), a
;./the-castel.c:1689: isRight = TRUE;
	ld	c, #0x01
00102$:
;./the-castel.c:1692: return isRight;
	ld	a, c
;./the-castel.c:1693: }
	ret
;./the-castel.c:1700: bool isMoveLeft(u8 row8)
;	---------------------------------
; Function isMoveLeft
; ---------------------------------
_isMoveLeft::
	ld	b, a
;./the-castel.c:1702: bool isLeft = FALSE;
	ld	c, #0x00
;./the-castel.c:1703: if (IS_KEY_PRESSED(row8, KEY_LEFT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_LEFT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_LEFT))
	bit	4, b
	jr	Z, 00101$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:160: u8 in = ~Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:161: return (in & JOY_INPUT_DIR_MASK);
	and	a, #0x0f
;./the-castel.c:1703: if (IS_KEY_PRESSED(row8, KEY_LEFT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_LEFT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_LEFT))
	sub	a, #0x04
	jr	Z, 00101$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:160: u8 in = ~Joystick_Read(port);
	ld	l, #0x4c
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:161: return (in & JOY_INPUT_DIR_MASK);
	and	a, #0x0f
;./the-castel.c:1703: if (IS_KEY_PRESSED(row8, KEY_LEFT) || (Joystick_GetDirection(JOY_PORT_1) == JOY_INPUT_DIR_LEFT) || (Joystick_GetDirection(JOY_PORT_2) == JOY_INPUT_DIR_LEFT))
	sub	a, #0x04
	jr	NZ, 00102$
00101$:
;./the-castel.c:1705: g_Player.Input |= INPUT_LEFT;
	ld	bc, #_g_Player+5
	ld	a, (bc)
	set	1, a
	ld	(bc), a
;./the-castel.c:1706: isLeft = TRUE;
	ld	c, #0x01
00102$:
;./the-castel.c:1709: return isLeft;
	ld	a, c
;./the-castel.c:1710: }
	ret
;./the-castel.c:1717: bool isMoveJump(u8 row8)
;	---------------------------------
; Function isMoveJump
; ---------------------------------
_isMoveJump::
	ld	b, a
;./the-castel.c:1719: bool isJump = FALSE;
	ld	c, #0x00
;./the-castel.c:1720: if (IS_KEY_PRESSED(row8, KEY_UP) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_A)))
	bit	5, b
	jr	Z, 00101$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:167: u8 in = Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:168: return ((in & trigger) == 0);
	and	a,#0x10
	jr	Z, 00101$
;./the-castel.c:1720: if (IS_KEY_PRESSED(row8, KEY_UP) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_A)))
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:167: u8 in = Joystick_Read(port);
	ld	l, #0x4c
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:168: return ((in & trigger) == 0);
	and	a,#0x10
	jr	NZ, 00102$
;./the-castel.c:1720: if (IS_KEY_PRESSED(row8, KEY_UP) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_A)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_A)))
00101$:
;./the-castel.c:1722: g_Player.Input |= INPUT_JUMP;
	ld	bc, #_g_Player+5
	ld	a, (bc)
	set	2, a
	ld	(bc), a
;./the-castel.c:1723: isJump = TRUE;
	ld	c, #0x01
00102$:
;./the-castel.c:1726: return isJump;
	ld	a, c
;./the-castel.c:1727: }
	ret
;./the-castel.c:1734: bool isInteractObject(u8 row8)
;	---------------------------------
; Function isInteractObject
; ---------------------------------
_isInteractObject::
	ld	b, a
;./the-castel.c:1736: bool isGet = FALSE;
	ld	c, #0x00
;./the-castel.c:1737: if (IS_KEY_PRESSED(row8, KEY_SPACE) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_B)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_B)))
	bit	0, b
	jr	Z, 00101$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:167: u8 in = Joystick_Read(port);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:168: return ((in & trigger) == 0);
	and	a,#0x20
	jr	Z, 00101$
;./the-castel.c:1737: if (IS_KEY_PRESSED(row8, KEY_SPACE) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_B)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_B)))
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:167: u8 in = Joystick_Read(port);
	ld	l, #0x4c
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/input.h:168: return ((in & trigger) == 0);
	and	a,#0x20
	jr	NZ, 00102$
;./the-castel.c:1737: if (IS_KEY_PRESSED(row8, KEY_SPACE) || (Joystick_IsButtonPressed(JOY_PORT_1, JOY_INPUT_TRIGGER_B)) || (Joystick_IsButtonPressed(JOY_PORT_2, JOY_INPUT_TRIGGER_B)))
00101$:
;./the-castel.c:1739: g_Player.Input |= INPUT_GET;
	ld	bc, #_g_Player+5
	ld	a, (bc)
	set	3, a
	ld	(bc), a
;./the-castel.c:1740: isGet = TRUE;
	ld	c, #0x01
00102$:
;./the-castel.c:1743: return isGet;
	ld	a, c
;./the-castel.c:1744: }
	ret
;./the-castel.c:1756: void PlayBankSFX(u8 id, u8 prio)
;	---------------------------------
; Function PlayBankSFX
; ---------------------------------
_PlayBankSFX::
;./the-castel.c:1758: ayFX_PlayBank(id, prio); // Riproduzione di un suono ayFX
	ld	c, a
;./the-castel.c:1759: }
	jp	_ayFX_PlayBank
;./the-castel.c:1766: void ChannelSFX(u8 chan)
;	---------------------------------
; Function ChannelSFX
; ---------------------------------
_ChannelSFX::
	ld	c, a
;./the-castel.c:1768: ayFX_Mute();		   // Arresta la riproduzione dell'audio e disattiva il canale
	push	bc
	call	_ayFX_Mute
	pop	bc
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/ayfx/ayfx_player.h:121: inline void ayFX_SetChannel(u8 chan) { ayFX_Channel = 3 - chan; }
	ld	hl, #_ayFX_Channel
	ld	a, #0x03
	sub	a, c
	ld	(hl), a
;./the-castel.c:1769: ayFX_SetChannel(chan); // Impostare il canale da utilizzare per la riproduzione del suono
;./the-castel.c:1770: }
	ret
;./the-castel.c:1777: void inizializePT3()
;	---------------------------------
; Function inizializePT3
; ---------------------------------
_inizializePT3::
;./the-castel.c:1779: PT3_Init();				   // Inizializza il Player PT3
	call	_PT3_Init
;./the-castel.c:1780: PT3_SetNoteTable(PT3_NT2); // Setta la tabella delle note
	ld	hl, #_PT3_NT2+0
	ld	(_PT3_NoteTable), hl
;./the-castel.c:1781: PT3_SetLoop(TRUE);
	ld	a, #0x01
	call	_PT3_SetLoop
;./the-castel.c:1782: PT3_InitSong(g_DataMusic);
	ld	hl, #_g_DataMusic
;./the-castel.c:1783: }
	jp	_PT3_InitSong
;./the-castel.c:1790: void inizializeAYFX()
;	---------------------------------
; Function inizializeAYFX
; ---------------------------------
_inizializeAYFX::
;./the-castel.c:1792: ayFX_InitBank(g_ayfx_bank);		// Impostazione del riproduttore ayFX tramite l'array g_ayfx_bank
	ld	hl, #_g_ayfx_bank
	call	_ayFX_InitBank
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/ayfx/ayfx_player.h:121: inline void ayFX_SetChannel(u8 chan) { ayFX_Channel = 3 - chan; }
	ld	hl, #_ayFX_Channel
	ld	(hl), #0x03
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/ayfx/ayfx_player.h:114: inline void ayFX_SetMode(u8 mode) { ayFX_Mode = mode; }
	ld	hl, #_ayFX_Mode
	ld	(hl), #0x00
;./the-castel.c:1794: ayFX_SetMode(AYFX_MODE_FIXED);	// Set channel mode
;./the-castel.c:1795: }
	ret
;./the-castel.c:1802: void pausePT3Music()
;	---------------------------------
; Function pausePT3Music
; ---------------------------------
_pausePT3Music::
;./the-castel.c:1804: PT3_Pause();
	call	_PT3_Pause
;./the-castel.c:1805: PT3_UpdatePSG();
;./the-castel.c:1806: }
	jp	_PT3_UpdatePSG
;./the-castel.c:1813: void restorePT3Music()
;	---------------------------------
; Function restorePT3Music
; ---------------------------------
_restorePT3Music::
;./the-castel.c:1815: PT3_Resume();
	call	_PT3_Resume
;./the-castel.c:1816: PT3_UpdatePSG();
;./the-castel.c:1817: }
	jp	_PT3_UpdatePSG
;./the-castel.c:1824: void stopMusicPlayback()
;	---------------------------------
; Function stopMusicPlayback
; ---------------------------------
_stopMusicPlayback::
;./the-castel.c:1826: ayFX_Mute();
	call	_ayFX_Mute
;./the-castel.c:1827: ayFX_Update();
	call	_ayFX_Update
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/pt3/pt3_player.h:301: PT3_State |= 1 << (chan + 1);
	ld	a, (_PT3_State+0)
	or	a, #0x08
	ld	(_PT3_State+0), a
;./the-castel.c:1829: PT3_Pause();
	call	_PT3_Pause
;./the-castel.c:1830: PT3_UpdatePSG();
;./the-castel.c:1831: }
	jp	_PT3_UpdatePSG
;./the-castel.c:1838: void restoreLevel()
;	---------------------------------
; Function restoreLevel
; ---------------------------------
_restoreLevel::
;./the-castel.c:1845: adjustLevel(&g_Level001[0], LEVEL001_WIDTH * LEVEL001_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level001
	call	_adjustLevel
;./the-castel.c:1846: adjustLevel(&g_Level002[0], LEVEL002_WIDTH * LEVEL002_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level002
	call	_adjustLevel
;./the-castel.c:1847: adjustLevel(&g_Level003[0], LEVEL003_WIDTH * LEVEL003_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level003
	call	_adjustLevel
;./the-castel.c:1848: adjustLevel(&g_Level004[0], LEVEL004_WIDTH * LEVEL004_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level004
	call	_adjustLevel
;./the-castel.c:1849: adjustLevel(&g_Level006[0], LEVEL006_WIDTH * LEVEL006_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level006
	call	_adjustLevel
;./the-castel.c:1850: adjustLevel(&g_Level007[0], LEVEL007_WIDTH * LEVEL007_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level007
	call	_adjustLevel
;./the-castel.c:1851: adjustLevel(&g_Level008[0], LEVEL008_WIDTH * LEVEL008_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level008
	call	_adjustLevel
;./the-castel.c:1852: adjustLevel(&g_Level009[0], LEVEL009_WIDTH * LEVEL009_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level009
	call	_adjustLevel
;./the-castel.c:1853: adjustLevel(&g_Level010[0], LEVEL010_WIDTH * LEVEL010_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level010
	call	_adjustLevel
;./the-castel.c:1854: adjustLevel(&g_Level011[0], LEVEL011_WIDTH * LEVEL011_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level011
	call	_adjustLevel
;./the-castel.c:1855: adjustLevel(&g_Level012[0], LEVEL012_WIDTH * LEVEL012_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level012
	call	_adjustLevel
;./the-castel.c:1856: adjustLevel(&g_Level013[0], LEVEL013_WIDTH * LEVEL013_HEIGHT);
	ld	de, #0x0300
	ld	hl, #_g_Level013
;./the-castel.c:1857: }
	jp	_adjustLevel
;./the-castel.c:1865: void adjustLevel(unsigned char *level, u16 sizeLevel)
;	---------------------------------
; Function adjustLevel
; ---------------------------------
_adjustLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ex	(sp), hl
;./the-castel.c:1867: for (u16 i = 0; i < sizeLevel; i++)
	ld	bc, #0x0000
00123$:
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00125$
;./the-castel.c:1869: if (level[i] == TILE_MASK_MONEY)
	pop	hl
	push	hl
	add	hl, bc
	ld	a, (hl)
	sub	a, #0xc0
	jr	NZ, 00102$
;./the-castel.c:1871: level[i] = TILE_MONEY;
	ld	(hl), #0x63
00102$:
;./the-castel.c:1873: if (level[i] == TILE_MASK_KEY3)
	ld	a, (hl)
	sub	a, #0xbf
	jr	NZ, 00104$
;./the-castel.c:1875: level[i] = TILE_KEY3;
	ld	(hl), #0x62
00104$:
;./the-castel.c:1877: if (level[i] == TILE_MASK_KEY2)
	ld	a, (hl)
	sub	a, #0xbe
	jr	NZ, 00106$
;./the-castel.c:1879: level[i] = TILE_KEY2;
	ld	(hl), #0x61
00106$:
;./the-castel.c:1881: if (level[i] == TILE_MASK_KEY1)
	ld	a, (hl)
	sub	a, #0xbd
	jr	NZ, 00108$
;./the-castel.c:1883: level[i] = TILE_KEY1;
	ld	(hl), #0x60
00108$:
;./the-castel.c:1885: if (level[i] == TILE_MASK_AMPHORA)
	ld	a, (hl)
	sub	a, #0xbc
	jr	NZ, 00110$
;./the-castel.c:1887: level[i] = TILE_AMPHORA;
	ld	(hl), #0x5f
00110$:
;./the-castel.c:1889: if (level[i] == TILE_MASK_HEART)
	ld	a, (hl)
	sub	a, #0xbb
	jr	NZ, 00112$
;./the-castel.c:1891: level[i] = TILE_HEART;
	ld	(hl), #0x4f
00112$:
;./the-castel.c:1893: if (level[i] == TILE_MASK_DOOR1)
	ld	a, (hl)
	sub	a, #0x41
	jr	NZ, 00114$
;./the-castel.c:1895: level[i] = TILE_DOOR1;
	ld	(hl), #0x45
00114$:
;./the-castel.c:1897: if (level[i] == TILE_MASK_DOOR2)
	ld	a, (hl)
	sub	a, #0x42
	jr	NZ, 00116$
;./the-castel.c:1899: level[i] = TILE_DOOR2;
	ld	(hl), #0x46
00116$:
;./the-castel.c:1901: if (level[i] == TILE_MASK_DOOR3)
	ld	a, (hl)
	sub	a, #0x43
	jr	NZ, 00118$
;./the-castel.c:1903: level[i] = TILE_DOOR3;
	ld	(hl), #0x4a
00118$:
;./the-castel.c:1905: if (level[i] == TILE_MASK_CRUCIFIX)
	ld	a, (hl)
	sub	a, #0xb3
	jr	NZ, 00124$
;./the-castel.c:1907: level[i] = TILE_CRUCIFIX;
	ld	(hl), #0x68
00124$:
;./the-castel.c:1867: for (u16 i = 0; i < sizeLevel; i++)
	inc	bc
	jp	00123$
00125$:
;./the-castel.c:1910: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:1915: void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset)
;	---------------------------------
; Function VDP_LoadPattern_GM1_Pletter
; ---------------------------------
_VDP_LoadPattern_GM1_Pletter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
;./the-castel.c:1917: Pletter_UnpackToVRAM(src, g_ScreenPatternLow + (offset * 8));
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
;./the-castel.c:1918: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:1924: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;./the-castel.c:1927: DEBUG_LOG("Start debug session!");
	ld	bc, #___str_20+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00102$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00105$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00102$
;./the-castel.c:1927: DEBUG_LOG("Start debug session!");
00105$:
;./the-castel.c:1934: Game_SetState(State_Initialize);
	ld	hl, #_State_Initialize
	call	_Game_SetState
;./the-castel.c:1941: Game_MainLoop(VDP_MODE_GRAPHIC1);
	ld	a, #0x02
	call	_Game_MainLoop
;./the-castel.c:1945: Game_Release();
	call	_Game_Release
;./the-castel.c:1947: DEBUG_LOG("End debug session!");
	ld	bc, #___str_21+0
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:102: g_PortDebugMode = DEBUG_MODE_MULTI|DEBUG_MULTI_ASCII; // Multi byte ASCII mode
	ld	a, #0x23
	out	(_g_PortDebugMode), a
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:103: while(*msg)
00106$:
	ld	a, (bc)
	or	a, a
	jr	Z, 00109$
;C:/Users/nicol/msxgl-workspace/the-castel/MSXgl/engine/src/debug.h:104: g_PortDebugData = *msg++;
	out	(_g_PortDebugData), a
	inc	bc
	jp	00106$
;./the-castel.c:1947: DEBUG_LOG("End debug session!");
00109$:
;./the-castel.c:1949: Bios_Exit(0);
	xor	a, a
;./the-castel.c:1950: }
	jp	_Bios_Exit
___str_20:
	.ascii "Start debug session!"
	.db 0x00
___str_21:
	.ascii "End debug session!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__g_Level000:
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
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe5	; 229
	.db #0xee	; 238
	.db #0xf4	; 244
	.db #0xf2	; 242
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0xe5	; 229
	.db #0xec	; 236
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0xe1	; 225
	.db #0xf3	; 243
	.db #0xf4	; 244
	.db #0xe5	; 229
	.db #0xec	; 236
	.db #0xec	; 236
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0xe5	; 229
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xec	; 236
	.db #0xf6	; 246
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xec	; 236
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf2	; 242
	.db #0xe9	; 233
	.db #0xee	; 238
	.db #0xe3	; 227
	.db #0xe9	; 233
	.db #0xf0	; 240
	.db #0xe5	; 229
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x93	; 147
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
	.db #0x93	; 147
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
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
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
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
	.db #0x4e	; 78	'N'
	.db #0x4d	; 77	'M'
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
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
__xinit__g_Level009:
	.db #0x91	; 145
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
	.db #0x95	; 149
	.db #0x9a	; 154
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
	.db #0x99	; 153
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x64	; 100	'd'
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
	.db #0x64	; 100	'd'
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
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
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x91	; 145
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x93	; 147
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x91	; 145
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
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x63	; 99	'c'
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
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x9a	; 154
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
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
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
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
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
	.db #0x64	; 100	'd'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x64	; 100	'd'
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
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
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x4d	; 77	'M'
	.db #0x00	; 0
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
__xinit__g_Level012:
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
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x94	; 148
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x99	; 153
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x5f	; 95
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
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
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
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x7c	; 124
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4e	; 78	'N'
	.db #0x4d	; 77	'M'
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x99	; 153
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x99	; 153
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x95	; 149
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x99	; 153
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x95	; 149
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
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
	.db #0x99	; 153
	.db #0x64	; 100	'd'
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
	.db #0x64	; 100	'd'
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x4d	; 77	'M'
	.db #0x95	; 149
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x63	; 99	'c'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x4d	; 77	'M'
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
__xinit__g_Level029:
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
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x9a	; 154
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
	.db #0x95	; 149
	.db #0x93	; 147
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0xe7	; 231
	.db #0xe1	; 225
	.db #0xed	; 237
	.db #0xe5	; 229
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0xf6	; 246
	.db #0xe5	; 229
	.db #0xf2	; 242
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x93	; 147
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
	.db #0x93	; 147
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf2	; 242
	.db #0xe5	; 229
	.db #0xed	; 237
	.db #0xe9	; 233
	.db #0x00	; 0
	.db #0xf3	; 243
	.db #0xf0	; 240
	.db #0xe1	; 225
	.db #0xe3	; 227
	.db #0xe5	; 229
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xe5	; 229
	.db #0xf2	; 242
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0xef	; 239
	.db #0xee	; 238
	.db #0xf4	; 244
	.db #0xe9	; 233
	.db #0xee	; 238
	.db #0xf5	; 245
	.db #0xe1	; 225
	.db #0xf2	; 242
	.db #0xe5	; 229
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x91	; 145
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
	.db #0x91	; 145
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x9a	; 154
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
	.db #0x9a	; 154
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x95	; 149
	.db #0x97	; 151
	.db #0x95	; 149
	.db #0x91	; 145
	.db #0x95	; 149
	.db #0x98	; 152
	.db #0x95	; 149
	.db #0x99	; 153
	.db #0x95	; 149
	.db #0x9a	; 154
	.db #0x95	; 149
__xinit__g_PrevRow8:
	.db #0xff	; 255
__xinit__g_PawnCount:
	.db #0x00	; 0
__xinit__g_PrevDirection:
	.db #0x00	; 0
__xinit__g_FrameCounter:
	.db #0x00	; 0
__xinit__g_ReverseCount:
	.db #0x00	; 0
__xinit__g_CurrRoomIdx:
	.db #0x00	; 0
__xinit__g_GhostCount:
	.db #0x00	; 0
__xinit__g_SpiderCount:
	.db #0x00	; 0
__xinit__g_BatCount:
	.db #0x00	; 0
__xinit__g_ImmunityCount:
	.db #0x00	; 0
__xinit__g_SecondCounter:
	.db #0x00	; 0
__xinit__g_DangerCounter:
	.db #0x00	; 0
__xinit__g_Frame:
	.db #0x00	; 0
__xinit__g_DelayRemoveLife:
	.db #0x00	; 0
__xinit__IsUnderWater:
	.db #0x00	; 0
__xinit__g_IsDanger:
	.db #0x00	; 0
__xinit__g_Inventory:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__g_Lives:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
	.org 0x3924
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
