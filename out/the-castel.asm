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
	.globl _WaitVBlank
	.globl _VSyncCallback
	.globl _isPassage
	.globl _pursuitCheck
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
	.globl _Bios_SetHookCallback
	.globl _Mem_Set
	.globl _g_6thFrameCount
	.globl _g_VBlank
	.globl _g_CountItem
	.globl _g_CacheLevel
	.globl _g_Lives
	.globl _g_GameFrame
	.globl _g_LevelPrev
	.globl _g_TimetoDeath
	.globl _g_RefreshInventary
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
	.globl _g_DataBackground_Patterns
	.globl _g_DataSprtLayer
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
	.globl _isUnderTheWater
	.globl _setColorTiles
	.globl _ItemsTakenForLevel
	.globl _interact
	.globl _takeActionWithCheck
	.globl _messageInGame
	.globl _replaceAndRemoveItem
	.globl _changeLevel
	.globl _getItem
	.globl _isDanger
	.globl _updateScore
	.globl _drawLevel
	.globl _positionGenericEnemy
	.globl _spritePosition
	.globl _hideSprite
	.globl _managementSprite
	.globl _initCharacter
	.globl _isOnPlatform
	.globl _updateCharacter
	.globl _updateGenericEnemy
	.globl _my_strcmp
	.globl _adjustXYEnemy
	.globl _genericControl
	.globl _State_Initialize
	.globl _State_Game
	.globl _State_Preset
	.globl _State_Pause
	.globl _State_GameOver
	.globl _VDP_ReplacementPartialArea
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
_g_LevelUncompress::
	.ds 768
_g_Player::
	.ds 29
_g_Enemy::
	.ds 30
_g_Ghost::
	.ds 30
_g_Spider::
	.ds 30
_g_Bat::
	.ds 30
_g_platformV::
	.ds 30
_g_platformH::
	.ds 30
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_PrevRow8::
	.ds 1
_g_PawnCount::
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
_g_SlideCountH::
	.ds 1
_g_SlideCountV::
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
_g_RefreshInventary::
	.ds 1
_g_TimetoDeath::
	.ds 1
_g_LevelPrev::
	.ds 1
_g_GameFrame::
	.ds 1
_g_Lives::
	.ds 3
_g_CacheLevel::
	.ds 6
_g_CountItem::
	.ds 1
_g_VBlank::
	.ds 1
_g_6thFrameCount::
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
;./the-castel.c:215: void readInputControl()
;	---------------------------------
; Function readInputControl
; ---------------------------------
_readInputControl::
;./the-castel.c:217: u8 row8 = Keyboard_Read(8);
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	c, l
;./the-castel.c:219: g_Player.Input = 0;
	ld	de, #_g_Player+5
	xor	a, a
;./the-castel.c:220: if (isMoveRight(row8, g_Player.Input))
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
;./the-castel.c:222: g_Player.Input |= INPUT_RIGHT;
	ld	a, (de)
	set	0, a
	ld	(de), a
00102$:
;./the-castel.c:224: if (isMoveLeft(row8, g_Player.Input))
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
;./the-castel.c:226: g_Player.Input |= INPUT_LEFT;
	ld	a, (de)
	set	1, a
	ld	(de), a
00104$:
;./the-castel.c:228: if (isMoveJump(row8, g_Player.Input))
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
;./the-castel.c:230: g_Player.Input |= INPUT_JUMP;
	ld	a, (de)
	set	2, a
	ld	(de), a
00106$:
;./the-castel.c:232: if (isInteractObject(row8, g_Player.Input))
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
;./the-castel.c:234: g_Player.Input |= INPUT_GET;
	ld	a, (de)
	set	3, a
	ld	(de), a
00108$:
;./the-castel.c:237: g_PrevRow8 = row8;
	ld	hl, #_g_PrevRow8
	ld	(hl), c
;./the-castel.c:238: }
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
	.db #0x7b	; 123
	.db #0x90	; 144
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xa1	; 161
	.db #0x0f	; 15
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0xb8	; 184
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0c	; 12
	.db #0x0a	; 10
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x07	; 7
	.db #0xfd	; 253
	.db #0x81	; 129
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xa6	; 166
	.db #0x99	; 153
	.db #0xa7	; 167
	.db #0xfa	; 250
	.db #0x95	; 149
	.db #0xe6	; 230
	.db #0xfe	; 254
	.db #0x2a	; 42
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x9f	; 159
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x0d	; 13
	.db #0x2d	; 45
	.db #0x28	; 40
	.db #0x27	; 39
	.db #0x03	; 3
	.db #0x28	; 40
	.db #0x2b	; 43
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x29	; 41
	.db #0x14	; 20
	.db #0x70	; 112	'p'
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf2	; 242
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xb0	; 176
	.db #0x50	; 80	'P'
	.db #0xd8	; 216
	.db #0x1b	; 27
	.db #0x4c	; 76	'L'
	.db #0xee	; 238
	.db #0xf6	; 246
	.db #0x10	; 16
	.db #0x41	; 65	'A'
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x91	; 145
	.db #0xde	; 222
	.db #0x5f	; 95
	.db #0x21	; 33
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xb1	; 177
	.db #0xb7	; 183
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
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
	.db #0x40	; 64
	.db #0x98	; 152
	.db #0x90	; 144
	.db #0x87	; 135
	.db #0x00	; 0
	.db #0x97	; 151
	.db #0x62	; 98	'b'
	.db #0x02	; 2
	.db #0xea	; 234
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x60	; 96
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x30	; 48	'0'
	.db #0x33	; 51	'3'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0xa3	; 163
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xa0	; 160
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x93	; 147
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x76	; 118	'v'
	.db #0x7e	; 126
	.db #0x41	; 65	'A'
	.db #0x24	; 36
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x5c	; 92
	.db #0x07	; 7
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x1c	; 28
	.db #0xb6	; 182
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x75	; 117	'u'
	.db #0x3c	; 60
	.db #0x1d	; 29
	.db #0x25	; 37
	.db #0xac	; 172
	.db #0xa7	; 167
	.db #0x52	; 82	'R'
	.db #0xbb	; 187
	.db #0x02	; 2
	.db #0xdd	; 221
	.db #0x02	; 2
	.db #0x78	; 120	'x'
	.db #0x10	; 16
	.db #0x48	; 72	'H'
	.db #0x08	; 8
	.db #0xf3	; 243
	.db #0x48	; 72	'H'
	.db #0x1d	; 29
	.db #0x0b	; 11
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x02	; 2
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x28	; 40
	.db #0x01	; 1
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x9d	; 157
	.db #0x3a	; 58
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x21	; 33
	.db #0x4c	; 76	'L'
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x89	; 137
	.db #0x01	; 1
	.db #0x45	; 69	'E'
	.db #0x21	; 33
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x20	; 32
	.db #0xa2	; 162
	.db #0x80	; 128
	.db #0x91	; 145
	.db #0x30	; 48	'0'
	.db #0x02	; 2
	.db #0xcd	; 205
	.db #0x00	; 0
	.db #0x23	; 35
	.db #0x12	; 18
	.db #0x18	; 24
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0xb3	; 179
	.db #0x00	; 0
	.db #0xc4	; 196
	.db #0x09	; 9
	.db #0x48	; 72	'H'
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x5e	; 94
	.db #0x01	; 1
	.db #0x2c	; 44
	.db #0xc0	; 192
	.db #0x27	; 39
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x92	; 146
	.db #0x92	; 146
	.db #0x43	; 67	'C'
	.db #0xfe	; 254
	.db #0x80	; 128
	.db #0x41	; 65	'A'
	.db #0x74	; 116	't'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0xfa	; 250
	.db #0x88	; 136
	.db #0xd7	; 215
	.db #0x81	; 129
	.db #0xbf	; 191
	.db #0xa6	; 166
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xc8	; 200
	.db #0x07	; 7
	.db #0xbf	; 191
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0x87	; 135
	.db #0x08	; 8
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x87	; 135
	.db #0xc3	; 195
	.db #0x06	; 6
	.db #0xb9	; 185
	.db #0xa1	; 161
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x99	; 153
	.db #0x83	; 131
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xbf	; 191
	.db #0x0b	; 11
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0xbb	; 187
	.db #0x87	; 135
	.db #0x07	; 7
	.db #0x8c	; 140
	.db #0x0f	; 15
	.db #0x97	; 151
	.db #0x9b	; 155
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0xbd	; 189
	.db #0xa3	; 163
	.db #0xbd	; 189
	.db #0xbd	; 189
	.db #0x83	; 131
	.db #0xff	; 255
	.db #0x50	; 80	'P'
	.db #0x47	; 71	'G'
	.db #0x91	; 145
	.db #0xb5	; 181
	.db #0x18	; 24
	.db #0x91	; 145
	.db #0xd7	; 215
	.db #0x97	; 151
	.db #0xa0	; 160
	.db #0x82	; 130
	.db #0x95	; 149
	.db #0xb5	; 181
	.db #0x95	; 149
	.db #0xd5	; 213
	.db #0x1e	; 30
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0xaf	; 175
	.db #0x8f	; 143
	.db #0xb1	; 177
	.db #0xf3	; 243
	.db #0xf7	; 247
	.db #0xd8	; 216
	.db #0x07	; 7
	.db #0xf5	; 245
	.db #0xf1	; 241
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xf7	; 247
	.db #0xd4	; 212
	.db #0xff	; 255
	.db #0x4d	; 77	'M'
	.db #0xfb	; 251
	.db #0x26	; 38
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x7f	; 127
	.db #0x93	; 147
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xfe	; 254
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x67	; 103	'g'
	.db #0xc0	; 192
	.db #0xf6	; 246
	.db #0x30	; 48	'0'
	.db #0xb6	; 182
	.db #0x1f	; 31
	.db #0xce	; 206
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0x69	; 105	'i'
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x07	; 7
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x9a	; 154
	.db #0x07	; 7
	.db #0xdf	; 223
	.db #0x7a	; 122	'z'
	.db #0x00	; 0
	.db #0xeb	; 235
	.db #0x60	; 96
	.db #0x9f	; 159
	.db #0xc9	; 201
	.db #0xc9	; 201
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x21	; 33
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0xf9	; 249
	.db #0x30	; 48	'0'
	.db #0xd3	; 211
	.db #0x8f	; 143
	.db #0xe3	; 227
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x72	; 114	'r'
	.db #0x22	; 34
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x22	; 34
	.db #0x72	; 114	'r'
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x69	; 105	'i'
	.db #0x89	; 137
	.db #0xa9	; 169
	.db #0x6d	; 109	'm'
	.db #0x01	; 1
	.db #0x6a	; 106	'j'
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x67	; 103	'g'
	.db #0x20	; 32
	.db #0xd2	; 210
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x1a	; 26
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x48	; 72	'H'
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x24	; 36
	.db #0x7e	; 126
	.db #0x09	; 9
	.db #0x2a	; 42
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x50	; 80	'P'
	.db #0x01	; 1
	.db #0x38	; 56	'8'
	.db #0x14	; 20
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0x68	; 104	'h'
	.db #0x50	; 80	'P'
	.db #0xc2	; 194
	.db #0x20	; 32
	.db #0x2c	; 44
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x34	; 52	'4'
	.db #0x5a	; 90	'Z'
	.db #0x17	; 23
	.db #0x0d	; 13
	.db #0x79	; 121	'y'
	.db #0x27	; 39
	.db #0xd8	; 216
	.db #0x6d	; 109	'm'
	.db #0x06	; 6
	.db #0xaa	; 170
	.db #0x8f	; 143
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0xb6	; 182
	.db #0xd3	; 211
	.db #0x93	; 147
	.db #0xbc	; 188
	.db #0x4b	; 75	'K'
	.db #0x97	; 151
	.db #0xe6	; 230
	.db #0x5c	; 92
	.db #0xcd	; 205
	.db #0x2c	; 44
	.db #0x7c	; 124
	.db #0xc3	; 195
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x2b	; 43
	.db #0x6f	; 111	'o'
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x22	; 34
	.db #0x30	; 48	'0'
	.db #0x75	; 117	'u'
	.db #0x50	; 80	'P'
	.db #0xca	; 202
	.db #0xc2	; 194
	.db #0x0f	; 15
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x16	; 22
	.db #0xd9	; 217
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0xc3	; 195
	.db #0x17	; 23
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x7c	; 124
	.db #0x21	; 33
	.db #0x57	; 87	'W'
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0xd4	; 212
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0xae	; 174
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x40	; 64
	.db #0xab	; 171
	.db #0x60	; 96
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0xb9	; 185
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x3c	; 60
	.db #0xdd	; 221
	.db #0x1f	; 31
	.db #0x5b	; 91
	.db #0xdb	; 219
	.db #0x02	; 2
	.db #0x55	; 85	'U'
	.db #0x07	; 7
	.db #0x49	; 73	'I'
	.db #0x26	; 38
	.db #0x41	; 65	'A'
	.db #0x06	; 6
	.db #0x9b	; 155
	.db #0x04	; 4
	.db #0x9c	; 156
	.db #0x7e	; 126
	.db #0x80	; 128
	.db #0x3b	; 59
	.db #0x0c	; 12
	.db #0x3a	; 58
	.db #0x12	; 18
	.db #0x5f	; 95
	.db #0x06	; 6
	.db #0xb8	; 184
	.db #0x5d	; 93
	.db #0x07	; 7
	.db #0x34	; 52	'4'
	.db #0x54	; 84	'T'
	.db #0x68	; 104	'h'
	.db #0x54	; 84	'T'
	.db #0x3f	; 63
	.db #0x7c	; 124
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0xee	; 238
	.db #0x02	; 2
	.db #0x67	; 103	'g'
	.db #0xb0	; 176
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0xc2	; 194
	.db #0x15	; 21
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x93	; 147
	.db #0x0d	; 13
	.db #0x70	; 112	'p'
	.db #0x02	; 2
	.db #0x7c	; 124
	.db #0xcc	; 204
	.db #0x07	; 7
	.db #0xb7	; 183
	.db #0x13	; 19
	.db #0x03	; 3
	.db #0x4c	; 76	'L'
	.db #0x9e	; 158
	.db #0x77	; 119	'w'
	.db #0x44	; 68	'D'
	.db #0x47	; 71	'G'
	.db #0x37	; 55	'7'
	.db #0xa1	; 161
	.db #0x4f	; 79	'O'
	.db #0xc8	; 200
	.db #0x7e	; 126
	.db #0xd7	; 215
	.db #0x85	; 133
	.db #0x31	; 49	'1'
	.db #0xa2	; 162
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x33	; 51	'3'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x3a	; 58
	.db #0x17	; 23
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x37	; 55	'7'
	.db #0x87	; 135
	.db #0x0f	; 15
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x02	; 2
	.db #0x27	; 39
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x4c	; 76	'L'
	.db #0x39	; 57	'9'
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0x69	; 105	'i'
	.db #0x6c	; 108	'l'
	.db #0x4f	; 79	'O'
	.db #0x9c	; 156
	.db #0x1c	; 28
	.db #0xd7	; 215
	.db #0x76	; 118	'v'
	.db #0x7f	; 127
	.db #0x73	; 115	's'
	.db #0x44	; 68	'D'
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0x87	; 135
	.db #0xcf	; 207
	.db #0x7e	; 126
	.db #0xdc	; 220
	.db #0xe7	; 231
	.db #0x1d	; 29
	.db #0x3c	; 60
	.db #0xe0	; 224
	.db #0x6f	; 111	'o'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xda	; 218
	.db #0x0f	; 15
	.db #0xb7	; 183
	.db #0x0c	; 12
	.db #0x28	; 40
	.db #0x07	; 7
	.db #0xc3	; 195
	.db #0xef	; 239
	.db #0xd7	; 215
	.db #0x57	; 87	'W'
	.db #0x07	; 7
	.db #0x5c	; 92
	.db #0x27	; 39
	.db #0x2f	; 47
	.db #0xdd	; 221
	.db #0x38	; 56	'8'
	.db #0xbf	; 191
	.db #0xe8	; 232
	.db #0xcf	; 207
	.db #0x95	; 149
	.db #0x38	; 56	'8'
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x89	; 137
	.db #0x9a	; 154
	.db #0x04	; 4
	.db #0x68	; 104	'h'
	.db #0x0f	; 15
	.db #0x9e	; 158
	.db #0xa8	; 168
	.db #0x0f	; 15
	.db #0x80	; 128
	.db #0x9a	; 154
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0xca	; 202
	.db #0x87	; 135
	.db #0x27	; 39
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
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
;./the-castel.c:249: void initLife()
;	---------------------------------
; Function initLife
; ---------------------------------
_initLife::
;./the-castel.c:251: g_Player.Life = MAX_LIVES;
	ld	hl, #(_g_Player + 8)
	ld	(hl), #0x03
;./the-castel.c:253: Mem_Set(TILE_HEART, g_Lives, (3 * sizeof(g_Lives[0])));
	ld	hl, #0x0003
	push	hl
	ld	de, #_g_Lives
	ld	a, #0x4f
	call	_Mem_Set
;./the-castel.c:254: }
	ret
;./the-castel.c:261: bool addLife()
;	---------------------------------
; Function addLife
; ---------------------------------
_addLife::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./the-castel.c:263: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	-1 (ix), #0x00
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00103$
;./the-castel.c:265: if (g_Lives[i] == EMPTY_ITEM)
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
;./the-castel.c:267: g_Player.Life++;
	ld	bc, #_g_Player+8
	ld	a, (bc)
	inc	a
	ld	(bc), a
;./the-castel.c:268: g_Lives[i] = TILE_HEART;
	ld	a, #0x4f
	ld	(de), a
;./the-castel.c:270: setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), TILE_HEART);
	ld	a, -1 (ix)
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xbe
	ld	c, a
	ld	a, #0x4f
	push	af
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:271: return TRUE;
	ld	a, #0x01
	jp	00107$
00106$:
;./the-castel.c:263: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	ld	-1 (ix), c
	jp	00105$
00103$:
;./the-castel.c:274: return FALSE;
	xor	a, a
00107$:
;./the-castel.c:275: }
	inc	sp
	pop	ix
	ret
;./the-castel.c:282: bool removeLife()
;	---------------------------------
; Function removeLife
; ---------------------------------
_removeLife::
;./the-castel.c:298: for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	ld	de, #0x202
00105$:
	bit	7, d
	jr	NZ, 00103$
;./the-castel.c:301: if (g_Lives[i] == TILE_HEART)
	ld	bc, #_g_Lives+0
	ld	a, d
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
;./the-castel.c:303: g_Lives[i] = EMPTY_ITEM;
	sub	a,#0x4f
	jr	NZ, 00106$
	ld	(hl),a
;./the-castel.c:304: setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), 0);
	ld	a, e
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xbe
	ld	c, a
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
	pop	de
;./the-castel.c:305: g_Player.Life--;
	ld	hl, #_g_Player+8
	dec	(hl)
;./the-castel.c:306: return (i > 0);
	xor	a, a
	sub	a, e
	jp	PO, 00126$
	xor	a, #0x80
00126$:
	rlca
	and	a,#0x01
	ret
00106$:
;./the-castel.c:298: for (i8 i = MAX_LIVES - 1; i >= 0; i--)
	dec	d
	ld	e, d
	jp	00105$
00103$:
;./the-castel.c:310: return FALSE;
	xor	a, a
;./the-castel.c:311: }
	ret
;./the-castel.c:317: bool hasLives()
;	---------------------------------
; Function hasLives
; ---------------------------------
_hasLives::
;./the-castel.c:319: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x03
	jr	NC, 00103$
;./the-castel.c:321: if (g_Lives[i] == TILE_HEART)
	ld	hl, #_g_Lives
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x4f
	jr	NZ, 00106$
;./the-castel.c:323: return TRUE;
	ld	a, #0x01
	ret
00106$:
;./the-castel.c:319: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
	jp	00105$
00103$:
;./the-castel.c:326: return FALSE;
	xor	a, a
;./the-castel.c:327: }
	ret
;./the-castel.c:334: void displayLife()
;	---------------------------------
; Function displayLife
; ---------------------------------
_displayLife::
;./the-castel.c:336: for (u8 i = 0; i < MAX_LIVES; i++)
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;./the-castel.c:338: setTile(BASE_X_LIFE + i * OFFSET_X_LIFE, (u8)(4), g_Lives[i]); // 220
	ld	hl, #_g_Lives
	ld	b, #0x00
	add	hl, bc
	ld	b, (hl)
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0xbe
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
;./the-castel.c:336: for (u8 i = 0; i < MAX_LIVES; i++)
	inc	c
;./the-castel.c:340: }
	jp	00103$
;./the-castel.c:352: void physicsEventPlayer(u8 event, u8 tile)
;	---------------------------------
; Function physicsEventPlayer
; ---------------------------------
_physicsEventPlayer::
;./the-castel.c:355: switch (event)
	or	a,a
	jr	Z, 00102$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x05
	ret	NZ
;./the-castel.c:358: case PAWN_PHYSICS_COL_DOWN:
00102$:
;./the-castel.c:359: g_Player.bInAir = FALSE;
	ld	hl, #(_g_Player + 1)
	ld	(hl), #0x00
;./the-castel.c:360: break;
	ret
;./the-castel.c:362: case PAWN_PHYSICS_FALL: // Handle falling
00103$:
;./the-castel.c:363: if (!g_Player.bInAir)
	ld	hl, #_g_Player + 1
	ld	a, (hl)
	or	a, a
	ret	NZ
;./the-castel.c:365: g_Player.bInAir = TRUE;
	ld	(hl), #0x01
;./the-castel.c:366: g_Player.VelocityY = 0;
	ld	hl, #(_g_Player + 2)
	ld	(hl), #0x00
;./the-castel.c:369: };
;./the-castel.c:370: }
	ret
;./the-castel.c:377: bool physicsCollision(u8 tile)
;	---------------------------------
; Function physicsCollision
; ---------------------------------
_physicsCollision::
	ld	c, a
;./the-castel.c:379: return (tile > 115 && tile < 184); // 100
	ld	a, #0x73
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
;./the-castel.c:380: }
	ret
;./the-castel.c:388: bool physicsCollisionEnemy(u8 x, u8 y)
;	---------------------------------
; Function physicsCollisionEnemy
; ---------------------------------
_physicsCollisionEnemy::
;./the-castel.c:390: return ((getTile(x, y) >= 100) /*|| getTile(x, y) == 0 */);
	call	_getTile
	sub	a, #0x64
	ld	a, #0x00
	rla
	xor	a, #0x01
;./the-castel.c:391: }
	ret
;./the-castel.c:400: void physicsCollisionPlayerAndGenericEnemy(struct Character *ply, struct CharacterEnemy *genericEnemy, u8 enemyNumber)
;	---------------------------------
; Function physicsCollisionPlayerAndGenericEnemy
; ---------------------------------
_physicsCollisionPlayerAndGenericEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-11
	add	iy, sp
	ld	sp, iy
	ld	c, l
	ld	b, h
	ld	-3 (ix), e
	ld	-2 (ix), d
;./the-castel.c:406: Game_Pawn *pawn = &ply->Pawn;
	ld	hl, #0x0009
	add	hl, bc
	ex	de, hl
;./the-castel.c:408: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	sp
	inc	sp
	push	de
	ld	-9 (ix), e
	ld	-8 (ix), d
	ld	-1 (ix), #0x00
00122$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jp	NC, 00124$
;./the-castel.c:410: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, -7 (ix)
	add	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
;./the-castel.c:411: if (enemy->State == 1)
	ld	a, -7 (ix)
	add	a, #0x03
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	dec	a
	jp	NZ,00123$
;./the-castel.c:413: if (collisionCheck(enemy->X - pawn->PositionX, enemy->Y - pawn->PositionY))
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	inc	bc
	ld	a, (bc)
	pop	hl
	push	hl
	ld	de, #0x0006
	add	hl, de
	ld	c, (hl)
	sub	a, c
	ld	c, a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	b, (hl)
	sub	a, b
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_collisionCheck
	or	a, a
	jp	Z, 00123$
;./the-castel.c:427: if (hasItemInInventory(TILE_AMPHORA))
	ld	a, #0x5f
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00113$
;./the-castel.c:429: if (g_ImmunityCount < IMMUNITY)
	ld	a, (_g_ImmunityCount+0)
	sub	a, #0x32
	jr	NC, 00102$
;./the-castel.c:431: g_ImmunityCount++;
	ld	iy, #_g_ImmunityCount
	inc	0 (iy)
	jp	00123$
00102$:
;./the-castel.c:435: removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, bc
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
;./the-castel.c:436: g_ImmunityCount = 0;
	ld	iy, #_g_ImmunityCount
	ld	0 (iy), #0x00
	jp	00123$
00113$:
;./the-castel.c:455: if (hasItemInInventory(TILE_CRUCIFIX))
	ld	a, #0x68
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00110$
;./the-castel.c:458: VDP_HideSprite(enemy->SpriteId);
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #8
	add	hl, bc
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:1213: inline void VDP_HideSprite(u8 index) { VDP_SetSpritePositionY(index, VDP_SPRITE_HIDE); }
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	l, #0xd5
	call	_VDP_SetSpritePositionY
;./the-castel.c:459: enemy->State = 0;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x00
;./the-castel.c:460: removeItemFromInventory(TILE_CRUCIFIX, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, bc
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
	ld	a, #0x68
	call	_removeItemFromInventory
;./the-castel.c:462: g_Player.Score += 500;
	ld	hl, (#(_g_Player + 6) + 0)
	ld	bc, #0x01f4
	add	hl, bc
	ex	de, hl
	ld	((_g_Player + 6)), de
;./the-castel.c:463: updateScore();
	call	_updateScore
	jp	00123$
00110$:
;./the-castel.c:468: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00107$
;./the-castel.c:470: displayLife();
	call	_displayLife
;./the-castel.c:471: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:473: drawLevel(g_CurrRoomIdx);
	ld	a, (_g_CurrRoomIdx+0)
	call	_drawLevel
	jp	00123$
00107$:
;./the-castel.c:477: if (!hasLives())
	call	_hasLives
	or	a, a
	jr	NZ, 00123$
;./the-castel.c:479: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:480: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
00123$:
;./the-castel.c:408: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	-1 (ix)
	jp	00122$
00124$:
;./the-castel.c:489: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:497: bool collisionCheck(i8 dx, i8 dy)
;	---------------------------------
; Function collisionCheck
; ---------------------------------
_collisionCheck::
	ld	c, a
	ld	b, l
;./the-castel.c:499: u16 sqrtDist = (dx * dx) + (dy * dy);
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
;./the-castel.c:500: if (sqrtDist < 13 * 13)
	ld	de, #0x00a9
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
;./the-castel.c:502: return TRUE;
	ld	a, #0x01
	ret
00102$:
;./the-castel.c:506: return FALSE;
	xor	a, a
;./the-castel.c:508: }
	ret
;./the-castel.c:517: void pursuitCheck(struct CharacterEnemy *genericEnemy, u8 nEnemy)
;	---------------------------------
; Function pursuitCheck
; ---------------------------------
_pursuitCheck::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ex	de, hl
;./the-castel.c:519: Game_Pawn *pawn = &g_Player.Pawn;
;./the-castel.c:521: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	c, 4 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, de
	ex	de, hl
;./the-castel.c:522: i8 dx = enemy->X - pawn->PositionX;
	ld	a, (de)
	ld	-2 (ix), a
	ld	a, (#(_g_Player + 9) + 5)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	ld	c, a
;./the-castel.c:523: i8 dy = enemy->Y - pawn->PositionY;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ld	hl, #(_g_Player + 9) + 6
	ld	b, (hl)
	sub	a, b
;./the-castel.c:525: if (dy == 0 && (((dx * dx) > MIN_DISTANCE_MAGNENT) && ((dx * dx) < MAX_DISTANCE_MAGNENT)))
	or	a, a
	jr	NZ, 00108$
	push	de
;	spillPairReg hl
;	spillPairReg hl
	ld	a,c
	ld	l,a
	call	__mulschar
	ex	de, hl
	pop	de
	ld	a, #0x64
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P, 00108$
	ld	bc, #0x83e8
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, bc
	jr	NC, 00108$
;./the-castel.c:528: enemy->Direction = 1;
	ld	hl, #0x0004
	add	hl, de
;./the-castel.c:527: if (pawn->PositionX > enemy->X)
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jr	NC, 00102$
;./the-castel.c:528: enemy->Direction = 1;
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	jp	00108$
00102$:
;./the-castel.c:530: enemy->Direction = -1;
	ld	(hl), #0xff
	inc	hl
	ld	(hl), #0xff
00108$:
;./the-castel.c:532: }
	ld	sp, ix
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:540: bool isUnderTheWater(u8 x, u8 y)
;	---------------------------------
; Function isUnderTheWater
; ---------------------------------
_isUnderTheWater::
;./the-castel.c:542: return (getTile(x, y) == TILE_WATER);
	call	_getTile
	sub	a, #0x50
	ld	a, #0x01
	ret	Z
	xor	a, a
;./the-castel.c:543: }
	ret
;./the-castel.c:550: void setColorTiles()
;	---------------------------------
; Function setColorTiles
; ---------------------------------
_setColorTiles::
;./the-castel.c:552: VDP_FillVRAM_16K(0X80, g_ScreenColorLow + 8, 2); // VERDE 0XC0 - ROSSO CHIARO 0x60
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0008
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x80
	call	_VDP_FillVRAM_16K
;./the-castel.c:553: VDP_FillVRAM_16K(0x70, g_ScreenColorLow + 10, 1);
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x000a
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x70
	call	_VDP_FillVRAM_16K
;./the-castel.c:554: VDP_FillVRAM_16K(0xA0, g_ScreenColorLow + 12, 1); // GIALLO SCURO
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x000c
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0xa0
	call	_VDP_FillVRAM_16K
;./the-castel.c:555: VDP_FillVRAM_16K(0xE0, g_ScreenColorLow + 18, 2); // GRIGIO
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0012
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0xe0
	call	_VDP_FillVRAM_16K
;./the-castel.c:556: }
	ret
;./the-castel.c:571: void ItemsTakenForLevel(u8 x, u8 y, u8 tile, u8 visible)
;	---------------------------------
; Function ItemsTakenForLevel
; ---------------------------------
_ItemsTakenForLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	b, a
	ld	c, l
;./the-castel.c:573: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].x = x;
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
	add	hl, de
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
;./the-castel.c:574: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].y = y;
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
	add	hl, de
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
;./the-castel.c:575: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].tile = tile;
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
	add	hl, bc
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
;./the-castel.c:576: g_Levels[g_CurrRoomIdx].MyItems[g_CountItem].visible = visible;
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
	add	hl, bc
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
;./the-castel.c:577: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:585: bool interact(u8 x, u8 y)
;	---------------------------------
; Function interact
; ---------------------------------
_interact::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, a
	ld	-1 (ix), l
;./the-castel.c:587: u8 tile = getTile(x, y);
	push	bc
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_getTile
	pop	bc
;./the-castel.c:588: if (tile < 60)
	ld	-2 (ix), a
	sub	a, #0x3c
	jr	NC, 00102$
;./the-castel.c:589: return FALSE;
	xor	a, a
	jp	00133$
00102$:
;./the-castel.c:593: switch (tile)
	ld	a, -2 (ix)
	sub	a, #0x41
	jp	Z,00109$
	ld	a, -2 (ix)
	sub	a, #0x42
	jp	Z,00109$
	ld	a, -2 (ix)
	sub	a, #0x43
	jp	Z,00109$
	ld	a, -2 (ix)
	sub	a, #0x44
	jp	Z,00109$
	ld	a, -2 (ix)
	sub	a, #0x45
	jp	Z,00110$
	ld	a, -2 (ix)
	sub	a, #0x46
	jp	Z,00114$
	ld	a, -2 (ix)
	sub	a, #0x47
	jp	Z,00125$
	ld	a, -2 (ix)
	sub	a, #0x4a
	jp	Z,00118$
	ld	a, -2 (ix)
	sub	a, #0x4e
	jp	Z,00126$
	ld	a, -2 (ix)
	sub	a, #0x4f
	jr	Z, 00103$
	ld	a, -2 (ix)
	sub	a, #0x5f
	jp	Z,00130$
	ld	a, -2 (ix)
	sub	a, #0x60
	jp	Z,00127$
	ld	a, -2 (ix)
	sub	a, #0x61
	jp	Z,00128$
	ld	a, -2 (ix)
	sub	a, #0x62
	jp	Z,00129$
	ld	a, -2 (ix)
	sub	a, #0x68
	jp	Z,00131$
	jp	00132$
;./the-castel.c:595: case TILE_HEART:
00103$:
;./the-castel.c:596: if (addLife())
	push	bc
	call	_addLife
	pop	bc
	or	a, a
	jr	Z, 00105$
;./the-castel.c:598: ItemsTakenForLevel(x, y, TILE_MASK_HEART, 1);
	push	bc
	ld	hl, #0x1bb
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_ItemsTakenForLevel
	pop	bc
;./the-castel.c:599: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
;./the-castel.c:601: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:602: PlayBankSFX(10, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_PlayBankSFX
00105$:
;./the-castel.c:604: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:608: case TILE_MASK_DOOR3:
00109$:
;./the-castel.c:609: g_LevelPrev = 0;
	ld	hl, #_g_LevelPrev
	ld	(hl), #0x00
;./the-castel.c:610: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
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
	add	hl, de
	add	hl, bc
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:611: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:612: case TILE_DOOR1:
00110$:
;./the-castel.c:614: if (hasItemInInventory(TILE_KEY1))
	push	bc
	ld	a, #0x60
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	Z, 00112$
;./the-castel.c:616: changeLevel(x, y, TILE_KEY1, TILE_MASK_DOOR1);
	ld	hl, #0x4160
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_changeLevel
	jp	00113$
00112$:
;./the-castel.c:620: messageInGame("is colosed");
	ld	hl, #___str_0
	call	_messageInGame
00113$:
;./the-castel.c:623: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:624: case TILE_DOOR2:
00114$:
;./the-castel.c:626: if (hasItemInInventory(TILE_KEY2))
	push	bc
	ld	a, #0x61
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	Z, 00116$
;./the-castel.c:628: changeLevel(x, y, TILE_KEY2, TILE_MASK_DOOR2);
	ld	hl, #0x4261
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_changeLevel
	jp	00117$
00116$:
;./the-castel.c:632: messageInGame("is colosed");
	ld	hl, #___str_0
	call	_messageInGame
00117$:
;./the-castel.c:635: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:636: case TILE_DOOR3:
00118$:
;./the-castel.c:637: if (g_CurrRoomIdx == LAST_LEVEL)
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x1a
	jr	NZ, 00123$
;./the-castel.c:639: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:640: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00124$
00123$:
;./the-castel.c:644: if (hasItemInInventory(TILE_KEY3))
	push	bc
	ld	a, #0x62
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	Z, 00120$
;./the-castel.c:646: changeLevel(x, y, TILE_KEY3, TILE_MASK_DOOR3);
	ld	hl, #0x4362
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_changeLevel
	jp	00124$
00120$:
;./the-castel.c:650: messageInGame("is colosed");
	ld	hl, #___str_0
	call	_messageInGame
00124$:
;./the-castel.c:653: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:654: case TILE_DOOR_PREV:
00125$:
;./the-castel.c:655: g_LevelPrev = 1;
	ld	hl, #_g_LevelPrev
	ld	(hl), #0x01
;./the-castel.c:656: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.PrevDoorLevel);
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
	add	hl, de
	add	hl, bc
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:657: return false;
	xor	a, a
	jp	00133$
;./the-castel.c:658: case TILE_DOOR_NEXT:
00126$:
;./the-castel.c:659: g_LevelPrev = 0;
	ld	hl, #_g_LevelPrev
	ld	(hl), #0x00
;./the-castel.c:660: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
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
	add	hl, de
	add	hl, bc
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:661: return false;
	xor	a, a
	jp	00133$
;./the-castel.c:663: case TILE_KEY1:
00127$:
;./the-castel.c:666: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY1);
	ld	h, #0xbd
	ld	l, -2 (ix)
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:667: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:669: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:670: case TILE_KEY2:
00128$:
;./the-castel.c:673: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY2);
	ld	h, #0xbe
	ld	l, -2 (ix)
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:674: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:676: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:677: case TILE_KEY3:
00129$:
;./the-castel.c:680: replaceAndRemoveItem(x, y, tile, TILE_MASK_KEY3);
	ld	h, #0xbf
	ld	l, -2 (ix)
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:681: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
;./the-castel.c:683: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:684: case TILE_AMPHORA:
00130$:
;./the-castel.c:687: takeActionWithCheck(x, y, tile, TILE_AMPHORA, TILE_MASK_AMPHORA);
	ld	hl, #0xbc5f
	push	hl
	ld	a, -2 (ix)
	push	af
	inc	sp
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_takeActionWithCheck
;./the-castel.c:689: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:690: case TILE_CRUCIFIX:
00131$:
;./the-castel.c:693: takeActionWithCheck(x, y, tile, TILE_CRUCIFIX, TILE_EMPTY);
	xor	a, a
	ld	h, a
	ld	l, #0x68
	push	hl
	ld	a, -2 (ix)
	push	af
	inc	sp
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_takeActionWithCheck
;./the-castel.c:695: return TRUE;
	ld	a, #0x01
	jp	00133$
;./the-castel.c:696: }
00132$:
;./the-castel.c:698: updateScore();
	call	_updateScore
;./the-castel.c:700: return FALSE;
	xor	a, a
00133$:
;./the-castel.c:701: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "is colosed"
	.db 0x00
;./the-castel.c:703: void takeActionWithCheck(u8 x, u8 y, u8 tile, u8 checkTile, u8 newTile)
;	---------------------------------
; Function takeActionWithCheck
; ---------------------------------
_takeActionWithCheck::
	ld	c, a
	ld	b, l
;./the-castel.c:705: if (!hasItemInInventory(checkTile))
	push	bc
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	call	_hasItemInInventory
	pop	bc
	or	a, a
	jr	NZ, 00103$
;./the-castel.c:707: replaceAndRemoveItem(x, y, tile, newTile);
	ld	iy, #4
	add	iy, sp
	ld	h, 0 (iy)
	ld	l, -2 (iy)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_replaceAndRemoveItem
;./the-castel.c:708: PlayBankSFX(5, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x05
	call	_PlayBankSFX
00103$:
;./the-castel.c:710: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;./the-castel.c:717: void messageInGame(char *message)
;	---------------------------------
; Function messageInGame
; ---------------------------------
_messageInGame::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-20
	add	iy, sp
	ld	sp, iy
;./the-castel.c:720: String_Format(StrFormat, "%s", message);
	push	hl
	ld	hl, #___str_1
	push	hl
	ld	hl, #4
	add	hl, sp
	push	hl
	call	_String_Format
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0c
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x16
;./the-castel.c:722: Print_DrawText(StrFormat);
	ld	hl, #0
	add	hl, sp
	call	_Print_DrawText
;./the-castel.c:724: g_RefreshInventary = TRUE;
	ld	hl, #_g_RefreshInventary
	ld	(hl), #0x01
;./the-castel.c:725: }
	ld	sp, ix
	pop	ix
	ret
___str_1:
	.ascii "%s"
	.db 0x00
;./the-castel.c:736: void replaceAndRemoveItem(u8 x, u8 y, u8 tile, u8 tileMask)
;	---------------------------------
; Function replaceAndRemoveItem
; ---------------------------------
_replaceAndRemoveItem::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	b, l
;./the-castel.c:738: ItemsTakenForLevel(x, y, tileMask, 1);
	push	bc
	ld	h, #0x01
	ld	l, 5 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_ItemsTakenForLevel
	pop	bc
;./the-castel.c:739: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
;./the-castel.c:741: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:742: addItemToInventory(tile, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, de
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
;./the-castel.c:743: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:753: void changeLevel(u8 x, u8 y, u8 key, u8 door)
;	---------------------------------
; Function changeLevel
; ---------------------------------
_changeLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	b, l
;./the-castel.c:755: removeItemFromInventory(key, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, de
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
;./the-castel.c:756: ItemsTakenForLevel(x, y, door, 1);
	ld	h, #0x01
	ld	l, 5 (ix)
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_ItemsTakenForLevel
;./the-castel.c:757: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
;./the-castel.c:759: g_LevelPrev = 0;
	ld	hl, #_g_LevelPrev
	ld	(hl), #0x00
;./the-castel.c:760: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.NextDoorLevel);
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
	add	hl, bc
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0008
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:761: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:769: bool getItem(u8 x, u8 y)
;	---------------------------------
; Function getItem
; ---------------------------------
_getItem::
	ld	c, a
	ld	b, l
;./the-castel.c:771: switch (getTile(x, y))
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_getTile
	pop	bc
	cp	a, #0x53
	jr	Z, 00103$
	cp	a, #0x63
	jr	Z, 00102$
	sub	a, #0x71
	jr	NZ, 00109$
;./the-castel.c:774: case TILE_GOLD_CUP:
00102$:
;./the-castel.c:775: setTile(x, y, EMPTY_ITEM);
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
;./the-castel.c:776: ItemsTakenForLevel(x, y, TILE_MASK_MONEY, 1); // Per il momento non posso spostare questa funzione, in quanto dovrei duplicare la chiamata the tile
	ld	hl, #0x1c0
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_ItemsTakenForLevel
;./the-castel.c:778: return TRUE;
	ld	a, #0x01
	ret
;./the-castel.c:779: case TILE_TIME_UP:
00103$:
;./the-castel.c:780: setTile(x, y, EMPTY_ITEM);
	xor	a, a
	push	af
	inc	sp
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_setTile
;./the-castel.c:781: if (g_TimetoDeath < 60)
;./the-castel.c:783: u8 offset = 60 - g_TimetoDeath;
	ld	a,(_g_TimetoDeath+0)
	cp	a,#0x3c
	jr	NC, 00108$
	ld	b, a
	ld	a, #0x3c
	sub	a, b
	ld	c, a
;./the-castel.c:784: if (offset > 10)
	ld	a, #0x0a
	sub	a, c
	jr	NC, 00105$
;./the-castel.c:786: g_TimetoDeath += 10;
	ld	a, b
	add	a, #0x0a
	ld	(_g_TimetoDeath+0), a
	jp	00108$
00105$:
;./the-castel.c:790: u8 res = 10 - offset;
	ld	a, #0x0a
	sub	a, c
;./the-castel.c:791: g_TimetoDeath += res;
	ld	hl, #_g_TimetoDeath
	add	a, (hl)
	ld	(hl), a
00108$:
;./the-castel.c:795: return TRUE;
	ld	a, #0x01
	ret
;./the-castel.c:796: }
00109$:
;./the-castel.c:798: return FALSE;
	xor	a, a
;./the-castel.c:799: }
	ret
;./the-castel.c:807: bool isPassage(u8 x, u8 y)
;	---------------------------------
; Function isPassage
; ---------------------------------
_isPassage::
;./the-castel.c:809: switch (getTile(x, y))
	call	_getTile
	ld	c, a
	sub	a, #0x51
	jr	Z, 00101$
	ld	a, c
	sub	a, #0x52
	jr	Z, 00102$
	jp	00103$
;./the-castel.c:811: case TILE_UP_DOOR:
00101$:
;./the-castel.c:812: g_LevelPrev = 3;
	ld	hl, #_g_LevelPrev
	ld	(hl), #0x03
;./the-castel.c:813: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.UpDoorLevel);
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
	add	hl, de
	add	hl, bc
	ld	de, #0x000a
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:814: return TRUE;
	ld	a, #0x01
	ret
;./the-castel.c:816: case TILE_DOWN_DOOR:
00102$:
;./the-castel.c:817: g_LevelPrev = 3;
	ld	hl, #_g_LevelPrev
	ld	(hl), #0x03
;./the-castel.c:818: drawLevel(g_Levels[g_CurrRoomIdx].DoorLevel.DownDoorLevel);
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
	add	hl, de
	add	hl, bc
	ld	de, #0x000b
	add	hl, de
	ld	a, (hl)
	call	_drawLevel
;./the-castel.c:819: return TRUE;
	ld	a, #0x01
	ret
;./the-castel.c:820: }
00103$:
;./the-castel.c:821: return FALSE;
	xor	a, a
;./the-castel.c:822: }
	ret
;./the-castel.c:831: bool isDanger(u8 x, u8 y)
;	---------------------------------
; Function isDanger
; ---------------------------------
_isDanger::
;./the-castel.c:833: switch (getTile(x, y))
	call	_getTile
	cp	a, #0x40
	jr	Z, 00107$
	cp	a, #0x69
	jr	Z, 00107$
	cp	a, #0x6a
	jr	Z, 00107$
	cp	a, #0x6b
	jr	Z, 00107$
	cp	a, #0x6c
	jr	Z, 00107$
	cp	a, #0x72
	jr	Z, 00107$
	sub	a, #0x73
	jr	NZ, 00111$
;./the-castel.c:841: case TILE_LAVA:
00107$:
;./the-castel.c:842: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00109$
;./the-castel.c:844: displayLife();
	call	_displayLife
;./the-castel.c:845: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:846: drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
	ld	a, (_g_CurrRoomIdx+0)
	call	_drawLevel
	jp	00110$
00109$:
;./the-castel.c:850: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:851: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
00110$:
;./the-castel.c:853: return TRUE;
	ld	a, #0x01
	ret
;./the-castel.c:854: default:
00111$:
;./the-castel.c:855: return FALSE;
	xor	a, a
;./the-castel.c:856: }
;./the-castel.c:857: }
	ret
;./the-castel.c:864: void updateScore()
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
;./the-castel.c:866: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	jp	Z, 00110$
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x1b
	jp	Z,00110$
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x00
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	bc, #_g_PrintData + 6
	xor	a, a
	ld	(bc), a
;./the-castel.c:873: Print_DrawText(g_Levels[g_CurrRoomIdx].Name);
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
	add	hl, de
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
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x07
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:877: Print_DrawText("SCORE:");
	push	bc
	ld	hl, #___str_2
	call	_Print_DrawText
	pop	bc
;./the-castel.c:878: String_Format(StrFormat, "%04i", g_Player.Score);
	ld	de, (#(_g_Player + 6) + 0)
	push	bc
	push	de
	ld	hl, #___str_3
	push	hl
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_String_Format
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x0d
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:880: Print_DrawText(StrFormat);
	push	bc
	ld	hl, #2
	add	hl, sp
	call	_Print_DrawText
	pop	bc
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x12
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:884: Print_DrawText("LIFE:");
	push	bc
	ld	hl, #___str_4
	call	_Print_DrawText
	pop	bc
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x1c
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:887: Print_DrawText("T:");
	push	bc
	ld	hl, #___str_5
	call	_Print_DrawText
	pop	bc
;./the-castel.c:888: String_Format(StrFormat, "%02i", g_TimetoDeath);
	ld	a, (_g_TimetoDeath+0)
	ld	e, a
	ld	d, #0x00
	push	bc
	push	de
	ld	hl, #___str_6
	push	hl
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_String_Format
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x1e
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	xor	a, a
	ld	(bc), a
;./the-castel.c:890: Print_DrawText(StrFormat);
	ld	hl, #0
	add	hl, sp
	call	_Print_DrawText
00110$:
;./the-castel.c:892: }
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "SCORE:"
	.db 0x00
___str_3:
	.ascii "%04i"
	.db 0x00
___str_4:
	.ascii "LIFE:"
	.db 0x00
___str_5:
	.ascii "T:"
	.db 0x00
___str_6:
	.ascii "%02i"
	.db 0x00
;./the-castel.c:899: void drawLevel(u8 levelIdx)
;	---------------------------------
; Function drawLevel
; ---------------------------------
_drawLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
;./the-castel.c:902: if (levelIdx > 0)
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00102$
;./the-castel.c:904: pausePT3Music();
	call	_pausePT3Music
	jp	00190$
00102$:
;./the-castel.c:908: restorePT3Music();
	call	_restorePT3Music
;./the-castel.c:1222: {
00190$:
	ld	c, #0x00
00162$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00158$
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_VDP_SetSpritePositionY
	pop	bc
	inc	c
	jp	00162$
;./the-castel.c:911: VDP_HideAllSprites();
00158$:
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
	xor	a, a
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./the-castel.c:915: VDP_FillVRAM_16K(g_Levels[levelIdx].ColorLevel, g_ScreenColorLow + 18, 2);
	ld	hl, (_g_ScreenColorLow)
	ld	bc, #0x0012
	add	hl, bc
	ex	de, hl
	ld	c, -3 (ix)
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
	add	hl, bc
	ld	bc,#_g_Levels
	add	hl,bc
	ex	(sp), hl
	pop	bc
	push	bc
	ld	hl, #58
	add	hl, bc
	ld	c, (hl)
	ld	hl, #0x0002
	push	hl
	ld	a, c
	call	_VDP_FillVRAM_16K
;./the-castel.c:917: g_CurrRoomIdx = levelIdx;
	ld	a, -3 (ix)
	ld	(_g_CurrRoomIdx+0), a
;./the-castel.c:918: g_PawnCount = 0;
	ld	hl, #_g_PawnCount
	ld	(hl), #0x00
;./the-castel.c:919: g_GhostCount = 0;
	ld	hl, #_g_GhostCount
	ld	(hl), #0x00
;./the-castel.c:920: g_SpiderCount = 0;
	ld	hl, #_g_SpiderCount
	ld	(hl), #0x00
;./the-castel.c:921: g_BatCount = 0;
	ld	hl, #_g_BatCount
	ld	(hl), #0x00
;./the-castel.c:922: g_SecondCounter = 0;
	ld	hl, #_g_SecondCounter
	ld	(hl), #0x00
;./the-castel.c:923: g_DangerCounter = 0;
	ld	hl, #_g_DangerCounter
	ld	(hl), #0x00
;./the-castel.c:924: g_CountItem = 0; // Iniziaizza il cobtatore degli oggetti raccolti
	ld	hl, #_g_CountItem
	ld	(hl), #0x00
;./the-castel.c:925: g_SlideCountH = 0;
	ld	hl, #_g_SlideCountH
	ld	(hl), #0x00
;./the-castel.c:926: g_SlideCountV = 0;
	ld	hl, #_g_SlideCountV
	ld	(hl), #0x00
;./the-castel.c:927: g_TimetoDeath = TIME_TO_DEATH;
	ld	hl, #_g_TimetoDeath
	ld	(hl), #0x3c
;./the-castel.c:940: if (hasItemInInventory(TILE_AMPHORA))
	ld	a, #0x5f
	call	_hasItemInInventory
	or	a, a
	jr	Z, 00195$
;./the-castel.c:941: removeItemFromInventory(TILE_AMPHORA, g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, bc
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
;./the-castel.c:943: for (u8 i = 0; i < MAX_CACHE_OBJECT; i++)
00195$:
	ld	-1 (ix), #0x00
00165$:
	ld	a, -1 (ix)
	sub	a, #0x05
	jr	NC, 00108$
;./the-castel.c:945: if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
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
	add	hl, bc
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
	jr	NZ, 00166$
;./the-castel.c:946: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
00166$:
;./the-castel.c:943: for (u8 i = 0; i < MAX_CACHE_OBJECT; i++)
	inc	-1 (ix)
	jp	00165$
00108$:
;./the-castel.c:958: VDP_FillVRAM_16K(0, g_ScreenLayoutLow, 32 * 24);
	ld	hl, #0x0300
	push	hl
	ld	de, (_g_ScreenLayoutLow)
	xor	a, a
	call	_VDP_FillVRAM_16K
;./the-castel.c:962: Pletter_UnpackToRAM(g_Levels[levelIdx].Layout, g_CacheLevel[0].Layout);
	ld	de, (#(_g_CacheLevel + 4) + 0)
	pop	bc
	push	bc
	ld	hl, #4
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	call	_Pletter_UnpackToRAM
;./the-castel.c:965: for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	ld	c, #0x00
00171$:
	ld	hl, #(_g_CacheLevel + 3)
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jp	NC, 00141$
;./the-castel.c:989: g_ScreenLayoutLow + (32 * (riga + g_CacheLevel[0].Y)) + (g_CacheLevel[0].X), g_CacheLevel[0].Width);
	ld	hl, #(_g_CacheLevel + 2)
	ld	b, (hl)
	ld	-2 (ix), b
	ld	-1 (ix), #0x00
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
;./the-castel.c:988: VDP_WriteVRAM_16K(g_CacheLevel[0].Layout + g_CacheLevel[0].Width * riga,
	ld	de, (#(_g_CacheLevel + 4) + 0)
	push	de
	ld	e, c
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00389$:
	add	hl, hl
	jr	NC, 00390$
	add	hl, de
00390$:
	djnz	00389$
	pop	de
	add	hl, de
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	push	de
	push	iy
	pop	de
	call	_VDP_WriteVRAM_16K
	pop	bc
;./the-castel.c:991: for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
	ld	b, #0x00
00168$:
	ld	hl, #(_g_CacheLevel + 2)
	ld	e, (hl)
	ld	a, b
	sub	a, e
	jp	NC, 00172$
;./the-castel.c:994: u8 tile = g_CacheLevel[0].Layout[g_CacheLevel[0].Width * riga + colonna];
	ld	hl, #(_g_CacheLevel + 4)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	push	bc
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00391$:
	add	hl, hl
	jr	NC, 00392$
	add	hl, de
00392$:
	djnz	00391$
	pop	bc
	ld	e, b
	ld	d, #0x00
	add	hl, de
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	add	hl, de
	ld	a, (hl)
;./the-castel.c:997: if (((tile == TILE_START_POS) && (g_LevelPrev == 0)) || ((tile == TILE_BACK_POS_PLYER) && (g_LevelPrev == 1)) || ((tile == TILE_BACK_POS_PLY_PLATFOTM) && (g_LevelPrev == 3))) // Rilevamento della posizione iniziale del giocatore
	ld	-1 (ix), a
	sub	a, #0x7f
	jr	NZ, 00137$
	ld	a, (_g_LevelPrev+0)
	or	a, a
	jr	Z, 00132$
00137$:
	ld	a, -1 (ix)
	sub	a, #0x86
	jr	NZ, 00139$
	ld	a, (_g_LevelPrev+0)
	dec	a
	jr	Z, 00132$
00139$:
	ld	a, -1 (ix)
	sub	a, #0x87
	jr	NZ, 00133$
	ld	a, (_g_LevelPrev+0)
	sub	a, #0x03
	jr	NZ, 00133$
00132$:
;./the-castel.c:999: u8 x = g_CacheLevel[0].X + colonna;
	ld	a, (#_g_CacheLevel + 0)
	add	a, b
	ld	e, a
;./the-castel.c:1000: u8 y = g_CacheLevel[0].Y + riga;
	ld	a, (#(_g_CacheLevel + 1) + 0)
	add	a, c
;./the-castel.c:1009: GamePawn_SetPosition(&g_Player.Pawn, x * 8, (y - 3) * 8);
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
	ld	hl, #(_g_Player + 9)
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
	jp	00169$
00133$:
;./the-castel.c:1012: else if ((tile == TILE_STAR_POS_ENEMY) && (g_PawnCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x7c
	jr	NZ, 00129$
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
	add	hl, de
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000c
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_PawnCount+0)
	sub	a, e
	jr	NC, 00129$
;./the-castel.c:1014: g_PawnCount = positionGenericEnemy(TILE_STAR_POS_ENEMY, g_PawnCount, &g_Enemy[0], ADDRESS_SHELETOR, FIRST_ID_SKELETOR, riga, colonna, 0, "Scheletor", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_7
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
	jp	00169$
00129$:
;./the-castel.c:1016: else if ((tile == TILE_POS_GHOST) && (g_GhostCount < g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x80
	jr	NZ, 00125$
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
	add	hl, de
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000d
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_GhostCount+0)
	sub	a, e
	jr	NC, 00125$
;./the-castel.c:1018: g_GhostCount = positionGenericEnemy(TILE_POS_GHOST, g_GhostCount, &g_Ghost[0], ADDRESS_GHOST, FIRST_ID_GHOST, riga, colonna, 0, "Ghost", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_8
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
	jp	00169$
00125$:
;./the-castel.c:1020: else if ((tile == TILE_POS_SPIDER) && (g_SpiderCount < g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x81
	jr	NZ, 00121$
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
	add	hl, de
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_SpiderCount+0)
	sub	a, e
	jr	NC, 00121$
;./the-castel.c:1022: g_SpiderCount = positionGenericEnemy(TILE_POS_SPIDER, g_SpiderCount, &g_Spider[0], ADDRESS_SPIDER, FIRST_ID_SPIDER, riga, colonna, 0, "Spider", 0);
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	hl, #___str_9
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
	jp	00169$
00121$:
;./the-castel.c:1024: else if ((tile == TILE_POS_BAT) && (g_BatCount < g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber)) // Rilevamento della posizione iniziale del nemico
	ld	a, -1 (ix)
	sub	a, #0x82
	jr	NZ, 00117$
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
	add	hl, de
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x000f
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_BatCount+0)
	sub	a, e
	jr	NC, 00117$
;./the-castel.c:1026: g_BatCount = positionGenericEnemy(TILE_POS_BAT, g_BatCount, &g_Bat[0], ADDRESS_BAT, FIRST_ID_BAT, riga, colonna, 0, "Bat", 0);
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
	jp	00169$
00117$:
;./the-castel.c:1028: else if ((tile == TILE_POS_PLATFORM_O) && (g_SlideCountH < g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH)) // Rilevamento piattaforma mobile
	ld	a, -1 (ix)
	sub	a, #0x84
	jr	NZ, 00113$
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
	add	hl, de
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0010
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_SlideCountH+0)
	sub	a, e
	jr	NC, 00113$
;./the-castel.c:1030: g_SlideCountH = positionGenericEnemy(TILE_POS_PLATFORM_O, g_SlideCountH, &g_platformH[0], ADDRESS_PLATFORM, FIRST_ID_SLIDE_H, riga, colonna, 0, "platform H", 0);
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
	jp	00169$
00113$:
;./the-castel.c:1032: else if ((tile == TILE_POS_PLATFORM_V) && (g_SlideCountV < g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV)) // Rilevamento piattaforma mobile
	ld	a, -1 (ix)
	sub	a, #0x85
	jr	NZ, 00169$
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
	add	hl, de
	ld	de, #_g_Levels
	add	hl, de
	ld	de, #0x0011
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_SlideCountV+0)
	sub	a, e
	jr	NC, 00169$
;./the-castel.c:1034: g_SlideCountV = positionGenericEnemy(TILE_POS_PLATFORM_V, g_SlideCountV, &g_platformV[0], ADDRESS_PLATFORM, FIRST_ID_SLIDE_V, riga, colonna, 0, "platform V", 1);
	push	bc
	ld	a, #0x01
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
00169$:
;./the-castel.c:991: for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
	inc	b
	jp	00168$
00172$:
;./the-castel.c:965: for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	inc	c
	jp	00171$
00141$:
;./the-castel.c:1039: hideSprite(g_PawnCount, MAX_ENEMY, FIRST_ID_SKELETOR);
	ld	a, #0x06
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_PawnCount+0)
	call	_hideSprite
;./the-castel.c:1040: hideSprite(g_GhostCount, MAX_GHOST, FIRST_ID_GHOST);
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_GhostCount+0)
	call	_hideSprite
;./the-castel.c:1041: hideSprite(g_SpiderCount, MAX_SPIDER, FIRST_ID_SPIDER);
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SpiderCount+0)
	call	_hideSprite
;./the-castel.c:1042: hideSprite(g_BatCount, MAX_BAT, FIRST_ID_BAT);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_BatCount+0)
	call	_hideSprite
;./the-castel.c:1043: hideSprite(g_SlideCountH, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_H);
	ld	a, #0x12
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SlideCountH+0)
	call	_hideSprite
;./the-castel.c:1044: hideSprite(g_SlideCountV, MAX_SLIDING_PLATFORM, FIRST_ID_SLIDE_V);
	ld	a, #0x15
	push	af
	inc	sp
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_SlideCountV+0)
	call	_hideSprite
;./the-castel.c:1046: if (levelIdx == 0)
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00220$
;./the-castel.c:1052: updateScore();
	call	_updateScore
;./the-castel.c:1054: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	jr	Z, 00220$
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x1b
	jr	Z, 00220$
;./the-castel.c:1056: displayItemToInventory(g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, bc
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
;./the-castel.c:1057: displayLife();
	call	_displayLife
;./the-castel.c:1062: for (u8 i = 0; i < 10; i++)
00220$:
	ld	-1 (ix), #0x00
00174$:
	ld	a, -1 (ix)
	sub	a, #0x0a
	jr	NC, 00150$
;./the-castel.c:1064: if (g_Levels[g_CurrRoomIdx].MyItems[i].visible == 1)
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
	add	hl, bc
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
	jr	NZ, 00175$
;./the-castel.c:1066: setTile(g_Levels[g_CurrRoomIdx].MyItems[i].x, g_Levels[g_CurrRoomIdx].MyItems[i].y, g_Levels[g_CurrRoomIdx].MyItems[i].tile);
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
00175$:
;./the-castel.c:1062: for (u8 i = 0; i < 10; i++)
	inc	-1 (ix)
	jp	00174$
00150$:
;./the-castel.c:1072: for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	ld	-2 (ix), #0x00
00180$:
	ld	hl, #(_g_CacheLevel + 3)
	ld	a,-2 (ix)
	sub	a,(hl)
	jr	NC, 00187$
;./the-castel.c:1074: for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
	ld	-1 (ix), #0x00
00177$:
	ld	a, (#(_g_CacheLevel + 2) + 0)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	sub	a, -4 (ix)
	jr	NC, 00181$
;./the-castel.c:1077: u8 tile = g_CacheLevel[0].Layout[g_CacheLevel[0].Width * riga + colonna];
	ld	bc, (#(_g_CacheLevel + 4) + 0)
	push	bc
	ld	e, -2 (ix)
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00417$:
	add	hl, hl
	jr	NC, 00418$
	add	hl, de
00418$:
	djnz	00417$
	pop	bc
	ld	e, -1 (ix)
	ld	d, #0x00
	add	hl, de
	add	hl, bc
	ld	a, (hl)
;./the-castel.c:1080: if ((tile == TILE_START_POS) || (tile == TILE_BACK_POS_PLYER) || (tile == TILE_BACK_POS_PLY_PLATFOTM)) // Rilevamento della posizione iniziale del giocatore
	cp	a, #0x7f
	jr	Z, 00151$
	cp	a, #0x86
	jr	Z, 00151$
	sub	a, #0x87
	jr	NZ, 00178$
00151$:
;./the-castel.c:1082: u8 x = g_CacheLevel[0].X + colonna;
	ld	a, (#_g_CacheLevel + 0)
	add	a, -1 (ix)
	ld	c, a
;./the-castel.c:1083: u8 y = g_CacheLevel[0].Y + riga;
	ld	a, (#(_g_CacheLevel + 1) + 0)
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./the-castel.c:1084: setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	call	_setTileByTileCoord
00178$:
;./the-castel.c:1074: for (u8 colonna = 0; colonna < g_CacheLevel[0].Width; ++colonna)
	inc	-1 (ix)
	jp	00177$
00181$:
;./the-castel.c:1072: for (u8 riga = 0; riga < g_CacheLevel[0].Height; ++riga)
	inc	-2 (ix)
	jp	00180$
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
00187$:
	ld	a, #0x40
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./the-castel.c:1089: VDP_EnableDisplay(TRUE);
;./the-castel.c:1092: }
	ld	sp, ix
	pop	ix
	ret
___str_7:
	.ascii "Scheletor"
	.db 0x00
___str_8:
	.ascii "Ghost"
	.db 0x00
___str_9:
	.ascii "Spider"
	.db 0x00
___str_10:
	.ascii "Bat"
	.db 0x00
___str_11:
	.ascii "platform H"
	.db 0x00
___str_12:
	.ascii "platform V"
	.db 0x00
;./the-castel.c:1106: u8 positionGenericEnemy(u8 TILE_POS_GENERIC_ENEMY, u8 enemyCount, struct CharacterEnemy *enemy, u8 idxSprite, u8 baseSprite, u8 riga, u8 colonna, u8 levelIdx, c8 *Name, u8 moveHV)
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
;./the-castel.c:1108: if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * riga + colonna - 1] != TILE_POS_GENERIC_ENEMY)
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
	add	hl, de
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
;./the-castel.c:1110: if (g_Levels[levelIdx].Layout[g_Levels[levelIdx].Width * (riga - 1) + colonna] != TILE_POS_GENERIC_ENEMY)
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
;./the-castel.c:1118: u8 x = g_Levels[levelIdx].X + colonna;
	ld	a, (bc)
	add	a, 9 (ix)
	ld	e, a
;./the-castel.c:1119: u8 y = g_Levels[levelIdx].Y + riga;
	inc	bc
	ld	a, (bc)
	add	a, 8 (ix)
	ld	d, a
;./the-castel.c:1121: managementSprite(x, y, baseSprite, enemyCount, idxSprite);
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
;./the-castel.c:1123: spritePosition(x, y, &enemy[0], baseSprite, enemyCount, Name, moveHV);
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
;./the-castel.c:1125: setTileByTileCoord(x, y, TILE_EMPTY); //  Eliminazione della tile iniziale
	xor	a, a
	push	af
	inc	sp
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_setTileByTileCoord
;./the-castel.c:1126: enemyCount++;
	inc	-2 (ix)
00104$:
;./the-castel.c:1130: return enemyCount;
	ld	a, -2 (ix)
;./the-castel.c:1131: }
	ld	sp, ix
	pop	ix
	pop	hl
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	jp	(hl)
;./the-castel.c:1142: void spritePosition(u8 x, u8 y, struct CharacterEnemy *genericEnemy, u8 baseSprite, u8 enemyCount, char *type, u8 moveHV)
;	---------------------------------
; Function spritePosition
; ---------------------------------
_spritePosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	b, a
	ld	c, l
;./the-castel.c:1144: struct CharacterEnemy *generic = &genericEnemy[enemyCount];
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
;./the-castel.c:1145: generic->X = x * 8;
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
;./the-castel.c:1146: generic->Y = (y - 1) * 8;
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
;./the-castel.c:1147: generic->Direction = (g_GameFrame % 2) ? 1 : -1;
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
;./the-castel.c:1148: generic->TypeEnemy = type;
	ld	hl, #0x0006
	add	hl, de
	ld	a, 8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;./the-castel.c:1149: generic->SpriteId = baseSprite + enemyCount;
	ld	hl, #0x0008
	add	hl, de
	ld	a, 6 (ix)
	add	a, 7 (ix)
	ld	(hl), a
;./the-castel.c:1150: generic->State = 1;
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
;./the-castel.c:1151: generic->MoveHV = moveHV;
	ld	hl, #0x0009
	add	hl, de
	ld	a, 10 (ix)
	ld	(hl), a
;./the-castel.c:1152: }
	pop	ix
	pop	hl
	pop	af
	pop	af
	pop	af
	inc	sp
	jp	(hl)
;./the-castel.c:1160: void hideSprite(u8 count, u8 maxElement, u8 baseSprite)
;	---------------------------------
; Function hideSprite
; ---------------------------------
_hideSprite::
	ld	c, a
	ld	b, l
;./the-castel.c:1162: for (u8 i = count; i < maxElement; ++i)
00104$:
	ld	a, c
	sub	a, b
	jr	NC, 00106$
;./the-castel.c:1164: VDP_HideSprite(baseSprite + i);
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	add	a, c
	ld	e, a
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:1213: inline void VDP_HideSprite(u8 index) { VDP_SetSpritePositionY(index, VDP_SPRITE_HIDE); }
	push	bc
	ld	l, #0xd5
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_VDP_SetSpritePositionY
	pop	bc
;./the-castel.c:1162: for (u8 i = count; i < maxElement; ++i)
	inc	c
	jp	00104$
00106$:
;./the-castel.c:1166: }
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:1176: void managementSprite(u8 x, u8 y, u8 baseSprite, u8 enemyCount, u8 indexShape)
;	---------------------------------
; Function managementSprite
; ---------------------------------
_managementSprite::
	ld	b, a
	ld	d, l
;./the-castel.c:1187: VDP_SetSpriteSM1(baseSprite + enemyCount, x, y, indexShape, COLOR_WHITE);
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
;./the-castel.c:1188: }
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;./the-castel.c:1196: void initCharacter(struct Character *ply, u8 id)
;	---------------------------------
; Function initCharacter
; ---------------------------------
_initCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
;./the-castel.c:1198: Mem_Set(0, ply, sizeof(struct Character));
	ld	e, l
	ld	d, h
	push	hl
	ld	bc, #0x001d
	push	bc
	xor	a, a
	call	_Mem_Set
	pop	hl
;./the-castel.c:1200: Game_Pawn *pawn = &ply->Pawn;
	ld	bc, #0x0009
	add	hl, bc
;./the-castel.c:1202: if (id == 0)
	ld	a, 4 (ix)
	or	a, a
	jr	NZ, 00103$
;./the-castel.c:1204: GamePawn_Initialize(pawn, g_PlayerSpriteLayers, numberof(g_PlayerSpriteLayers), 0, g_PlayerAnimActions);
	ld	bc, #_g_PlayerAnimActions+0
	ld	de, #_g_PlayerSpriteLayers+0
	push	hl
	push	bc
	ld	bc, #0x02
	push	bc
	call	_GamePawn_Initialize
	pop	hl
;./the-castel.c:1205: GamePawn_SetPosition(pawn, 223, 128);
	push	hl
	ld	de, #0x80df
	push	de
	call	_GamePawn_SetPosition
	pop	hl
;./the-castel.c:1206: GamePawn_InitializePhysics(pawn, physicsEventPlayer, physicsCollision, 16, 16);
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
;./the-castel.c:1208: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:1213: bool isOnPlatform(u8 *X, u8 *Y, u8 slideCount, struct CharacterEnemy *platform)
;	---------------------------------
; Function isOnPlatform
; ---------------------------------
_isOnPlatform::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-7
	add	iy, sp
	ld	sp, iy
;./the-castel.c:1215: for (u8 i = 0; i < slideCount; i++)
	ld	a, (de)
	ld	-7 (ix), a
	ld	a, (hl)
	ld	-6 (ix), a
	ld	-1 (ix), #0x00
00110$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jp	NC, 00108$
;./the-castel.c:1217: if ((*X < platform[i].X - 10) || (*X > platform[i].X + 10))
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l, 5 (ix)
	ld	h, 6 (ix)
	add	hl, bc
	ld	c, (hl)
	ld	b, #0x00
	ld	a, c
	add	a, #0xf6
	ld	-5 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-4 (ix), a
	ld	a, -6 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	a, -3 (ix)
	sub	a, -5 (ix)
	ld	a, -2 (ix)
	sbc	a, -4 (ix)
	jp	PO, 00144$
	xor	a, #0x80
00144$:
	jp	M, 00111$
	ld	a, c
	add	a, #0x0a
	ld	c, a
	jr	NC, 00145$
	inc	b
00145$:
	ld	a, c
	sub	a, -3 (ix)
	ld	a, b
	sbc	a, -2 (ix)
	jp	PO, 00146$
	xor	a, #0x80
00146$:
	jp	M, 00111$
;./the-castel.c:1223: if ((*Y + 17 > platform[i].Y) && (*Y + 17 < platform[i].Y + 8))
	ld	a, -7 (ix)
	ld	b, #0x00
	add	a, #0x11
	ld	c, a
	jr	NC, 00147$
	inc	b
00147$:
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
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	PO, 00148$
	xor	a, #0x80
00148$:
	jp	P, 00111$
	push	de
	ld	de, #0x0008
	add	hl, de
	pop	de
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00149$
	xor	a, #0x80
00149$:
	jp	P, 00111$
;./the-castel.c:1225: *Y = platform[i].Y - 16;
	ld	a, -2 (ix)
	add	a, #0xf0
	ld	(de), a
;./the-castel.c:1226: return TRUE;
	ld	a, #0x01
	jp	00112$
00111$:
;./the-castel.c:1215: for (u8 i = 0; i < slideCount; i++)
	inc	-1 (ix)
	jp	00110$
00108$:
;./the-castel.c:1230: return FALSE;
	xor	a, a
00112$:
;./the-castel.c:1231: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	bc
	inc	sp
	jp	(hl)
;./the-castel.c:1238: void updateCharacter(struct Character *ply)
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
;./the-castel.c:1241: u8 dir = 0;
	ld	-12 (ix), #0x00
;./the-castel.c:1242: ply->DX = 0;
	ld	a, -2 (ix)
	add	a, #0x03
	ld	-11 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x00
;./the-castel.c:1243: ply->DY = 0;
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-9 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x00
;./the-castel.c:1246: if (ply->Input & INPUT_RIGHT)
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
;./the-castel.c:1248: ply->DX++;
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	inc	(hl)
;./the-castel.c:1249: ply->bMoving = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
;./the-castel.c:1250: dir = 1;
	ld	-12 (ix), #0x01
	jp	00106$
00105$:
;./the-castel.c:1252: else if (ply->Input & INPUT_LEFT)
	bit	1, -3 (ix)
	jr	Z, 00102$
;./the-castel.c:1254: ply->DX--;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	dec	a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
;./the-castel.c:1255: ply->bMoving = TRUE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
;./the-castel.c:1256: dir = 0;
	ld	-12 (ix), #0x00
	jp	00106$
00102$:
;./the-castel.c:1259: ply->bMoving = FALSE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
00106$:
;./the-castel.c:1261: if (ply->bInAir) // Jump/fall
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	inc	bc
	ld	a, (bc)
	or	a, a
	jr	Z, 00117$
;./the-castel.c:1263: ply->DY -= ply->VelocityY / 4;
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
;./the-castel.c:1264: ply->VelocityY -= GRAVITY;
	ld	a, (de)
	dec	a
	ld	-3 (ix), a
	ld	(de), a
;./the-castel.c:1266: if (ply->VelocityY < -FORCE)
	ld	a, -3 (ix)
	xor	a, #0x80
	sub	a, #0x71
	jr	NC, 00118$
;./the-castel.c:1267: ply->VelocityY = -FORCE;
	ld	a, #0xf1
	ld	(de), a
	jp	00118$
00117$:
;./the-castel.c:1269: else if (ply->Input & INPUT_JUMP)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	bit	2, a
	jr	Z, 00114$
;./the-castel.c:1271: ply->bInAir = TRUE;
	ld	a, #0x01
	ld	(bc), a
;./the-castel.c:1272: ply->VelocityY = FORCE;
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
;./the-castel.c:1274: else if (ply->Input & INPUT_GET)
	bit	3, a
	jr	Z, 00118$
;./the-castel.c:1276: if (interact(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12))
	ld	a, (#_g_Player + 15)
	add	a, #0x0c
	ld	e, a
	ld	a, (#_g_Player + 14)
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
;./the-castel.c:1283: u8 act = ACTION_IDLE;
	ld	-3 (ix), #0x00
;./the-castel.c:1261: if (ply->bInAir) // Jump/fall
	ld	a, (bc)
;./the-castel.c:1284: if (ply->bInAir && (ply->VelocityY >= 0))
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
;./the-castel.c:1286: act = ACTION_JUMP;
	ld	-3 (ix), #0x02
	jp	00136$
00135$:
;./the-castel.c:1288: else if (ply->bInAir)
	ld	a, c
	or	a, a
	jp	Z, 00132$
;./the-castel.c:1291: if (((g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH) || (g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV)) > 0 && (isOnPlatform(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY, g_SlideCountV, &g_platformV[0]) || isOnPlatform(&g_Player.Pawn.PositionX, &g_Player.Pawn.PositionY, g_SlideCountH, &g_platformH[0])))
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
	add	hl, de
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
	ld	hl, #_g_platformV
	push	hl
	ld	a, (_g_SlideCountV+0)
	push	af
	inc	sp
	ld	de, #(_g_Player + 15)
	ld	hl, #(_g_Player + 14)
	call	_isOnPlatform
	or	a, a
	jr	NZ, 00119$
	ld	bc, #_g_platformH
	push	bc
	ld	a, (_g_SlideCountH+0)
	push	af
	inc	sp
	ld	de, #(_g_Player + 15)
	ld	hl, #(_g_Player + 14)
	call	_isOnPlatform
	or	a, a
	jr	Z, 00120$
00119$:
;./the-castel.c:1293: act = ACTION_IDLE;
	ld	-3 (ix), #0x00
;./the-castel.c:1294: ply->DY += 2;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	add	a, #0x02
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	jp	00136$
00120$:
;./the-castel.c:1298: act = ACTION_FALL;
	ld	-3 (ix), #0x03
	jp	00136$
00132$:
;./the-castel.c:1301: else if (ply->bMoving)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00136$
;./the-castel.c:1303: if (dir == 1)
	ld	a, -12 (ix)
	dec	a
	jr	NZ, 00127$
;./the-castel.c:1305: act = ACTION_MOVE_RIGHT;
	ld	-3 (ix), #0x04
	jp	00136$
00127$:
;./the-castel.c:1307: else if (dir == 0)
	ld	a, -12 (ix)
	or	a, a
	jr	NZ, 00136$
;./the-castel.c:1308: act = ACTION_MOVE;
	ld	-3 (ix), #0x01
00136$:
;./the-castel.c:1311: Game_Pawn *pawn = &ply->Pawn;
	ld	a, -2 (ix)
	add	a, #0x09
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
;./the-castel.c:1312: GamePawn_SetAction(pawn, act);
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
;./the-castel.c:1313: GamePawn_SetMovement(pawn, ply->DX, ply->DY);
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
;./the-castel.c:1314: GamePawn_Update(pawn);
	ex	de, hl
	call	_GamePawn_Update
;./the-castel.c:1315: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:1324: void updateGenericEnemy(struct CharacterEnemy *genericEnemy, u8 enemyNumber, u8 idFirstSprite)
;	---------------------------------
; Function updateGenericEnemy
; ---------------------------------
_updateGenericEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
	ex	de, hl
;./the-castel.c:1327: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	ld	-1 (ix), #0x00
00107$:
	ld	a, -1 (ix)
	sub	a, 4 (ix)
	jr	NC, 00109$
;./the-castel.c:1329: struct CharacterEnemy *enemy = &genericEnemy[nEnemy];
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, de
	ex	(sp), hl
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
;./the-castel.c:1330: if (enemy->State == 1)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;./the-castel.c:1332: if (physicsCollisionEnemy(enemy->X + 7, enemy->Y) == 1)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	c, (hl)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	add	a, #0x07
	ld	b, a
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_physicsCollisionEnemy
	pop	de
	dec	a
	jr	NZ, 00102$
;./the-castel.c:1334: enemy->Direction *= -1;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	bc, #0x0004
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	neg
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	(hl), c
	inc	hl
	ld	(hl), a
00102$:
;./the-castel.c:1343: adjustXYEnemy(&genericEnemy[nEnemy], idFirstSprite, nEnemy);
	push	de
	ld	h, -1 (ix)
	ld	l, 5 (ix)
	push	hl
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_adjustXYEnemy
	pop	de
00104$:
;./the-castel.c:1327: for (u8 nEnemy = 0; nEnemy < enemyNumber; nEnemy++)
	inc	-1 (ix)
	jp	00107$
00109$:
;./the-castel.c:1348: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:1350: int my_strcmp(const c8 *a, const c8 *b)
;	---------------------------------
; Function my_strcmp
; ---------------------------------
_my_strcmp::
	ld	c, l
	ld	b, h
;./the-castel.c:1352: while (*a && *a == *b)
00102$:
	ld	a, (bc)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	or	a, a
	jr	Z, 00104$
	cp	a, l
	jr	NZ, 00104$
;./the-castel.c:1354: ++a;
	inc	bc
;./the-castel.c:1355: ++b;
	inc	de
	jp	00102$
00104$:
;./the-castel.c:1357: return (int)(unsigned char)(*a) - (int)(unsigned char)(*b);
	ld	c, #0x00
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	sub	a, l
	ld	e, a
	ld	a, c
	sbc	a, h
	ld	d, a
;./the-castel.c:1358: }
	ret
;./the-castel.c:1363: void adjustXYEnemy(struct CharacterEnemy *genericEnemy, u8 idFirstSprite, u8 nEnemy)
;	---------------------------------
; Function adjustXYEnemy
; ---------------------------------
_adjustXYEnemy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ex	de, hl
;./the-castel.c:1365: if (genericEnemy->Direction < 0)
	push	de
	pop	iy
	ld	a, 4 (iy)
	ld	-2 (ix), a
	ld	a, 5 (iy)
	ld	-1 (ix), a
;./the-castel.c:1367: if (genericEnemy->MoveHV == 0)
	push	de
	pop	iy
;./the-castel.c:1370: genericEnemy->Y--;
	ld	c, e
	ld	b, d
	inc	bc
;./the-castel.c:1367: if (genericEnemy->MoveHV == 0)
	ld	l, 9 (iy)
;	spillPairReg hl
;./the-castel.c:1365: if (genericEnemy->Direction < 0)
	bit	7, -1 (ix)
	jr	Z, 00108$
;./the-castel.c:1367: if (genericEnemy->MoveHV == 0)
	ld	a, l
	or	a, a
	jr	NZ, 00102$
;./the-castel.c:1368: genericEnemy->X--;
	ld	a, (de)
	dec	a
	ld	(de), a
	jp	00109$
00102$:
;./the-castel.c:1370: genericEnemy->Y--;
	ld	a, (bc)
	dec	a
	ld	(bc), a
	jp	00109$
00108$:
;./the-castel.c:1374: if (genericEnemy->MoveHV == 0)
	ld	a, l
	or	a, a
	jr	NZ, 00105$
;./the-castel.c:1375: genericEnemy->X++;
	ld	a, (de)
	inc	a
	ld	(de), a
	jp	00109$
00105$:
;./the-castel.c:1377: genericEnemy->Y++;
	ld	a, (bc)
	inc	a
	ld	(bc), a
00109$:
;./the-castel.c:1387: VDP_SetSpritePosition(idFirstSprite + nEnemy, genericEnemy->X, genericEnemy->Y);
	ld	a, (bc)
	ld	b, a
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, 4 (ix)
	add	a, 5 (ix)
	ld	c, a
	push	bc
	inc	sp
	ld	a, c
	call	_VDP_SetSpritePosition
;./the-castel.c:1388: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;./the-castel.c:1395: void genericControl()
;	---------------------------------
; Function genericControl
; ---------------------------------
_genericControl::
;./the-castel.c:1399: if (isUnderTheWater(g_Player.Pawn.PositionX, g_Player.Pawn.PositionY))
	ld	hl, #(_g_Player + 15)
	ld	b, (hl)
	ld	hl, #(_g_Player + 14)
	ld	c, (hl)
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_isUnderTheWater
	or	a, a
	jr	Z, 00110$
;./the-castel.c:1401: if (IsUnderWater)
	ld	a, (_IsUnderWater+0)
	or	a, a
	jr	Z, 00107$
;./the-castel.c:1403: if ((g_SecondCounter - g_DelayRemoveLife) > 3)
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
;./the-castel.c:1405: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00102$
;./the-castel.c:1407: displayLife();
	call	_displayLife
;./the-castel.c:1409: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:1411: IsUnderWater = FALSE;
	ld	hl, #_IsUnderWater
	ld	(hl), #0x00
	jp	00111$
00102$:
;./the-castel.c:1415: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:1416: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
	jp	00111$
00107$:
;./the-castel.c:1422: g_DelayRemoveLife = g_SecondCounter;
	ld	a, (_g_SecondCounter+0)
	ld	(_g_DelayRemoveLife+0), a
;./the-castel.c:1423: IsUnderWater = TRUE;
	ld	hl, #_IsUnderWater
	ld	(hl), #0x01
	jp	00111$
00110$:
;./the-castel.c:1429: IsUnderWater = FALSE;  // Non siamo più in collisione
	ld	hl, #_IsUnderWater
	ld	(hl), #0x00
;./the-castel.c:1430: g_DelayRemoveLife = 0; // Azzera il tempo dopo il quale si va a rimuovere una vita
	ld	hl, #_g_DelayRemoveLife
	ld	(hl), #0x00
00111$:
;./the-castel.c:1438: if (getItem(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
	ld	a, (#(_g_Player + 15) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_getItem
	or	a, a
	jr	NZ, 00112$
;./the-castel.c:1439: getItem(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	ld	a, (#(_g_Player + 15) + 0)
	add	a, #0x04
	ld	c, a
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_getItem
	or	a, a
	jr	Z, 00113$
00112$:
;./the-castel.c:1443: g_CountItem++;
	ld	hl, #_g_CountItem
	inc	(hl)
;./the-castel.c:1444: g_Player.Score += 100;
	ld	hl, (#(_g_Player + 6) + 0)
	ld	bc, #0x0064
	add	hl, bc
	ex	de, hl
	ld	((_g_Player + 6)), de
;./the-castel.c:1445: updateScore();
	call	_updateScore
;./the-castel.c:1447: PlayBankSFX(11, 15);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0b
	call	_PlayBankSFX
00113$:
;./the-castel.c:1453: if (isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
	ld	a, (#(_g_Player + 15) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isDanger
	or	a, a
	jr	NZ, 00116$
;./the-castel.c:1454: isDanger(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	ld	a, (#(_g_Player + 15) + 0)
	add	a, #0x04
	ld	c, a
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isDanger
00116$:
;./the-castel.c:1460: if (isPassage(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 12) ||
	ld	a, (#(_g_Player + 15) + 0)
	add	a, #0x0c
	ld	c, a
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_isPassage
	or	a, a
	ret	NZ
;./the-castel.c:1461: isPassage(g_Player.Pawn.PositionX + 8, g_Player.Pawn.PositionY + 4))
	ld	a, (#(_g_Player + 15) + 0)
	add	a, #0x04
	ld	c, a
	ld	a, (#(_g_Player + 14) + 0)
	add	a, #0x08
	ld	b, a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
;./the-castel.c:1465: }
	jp	_isPassage
;./the-castel.c:1472: bool State_Initialize()
;	---------------------------------
; Function State_Initialize
; ---------------------------------
_State_Initialize::
;./the-castel.c:1476: inizializePT3();
	call	_inizializePT3
;./the-castel.c:1480: inizializeAYFX();
	call	_inizializeAYFX
;./the-castel.c:1482: setChannel();
	call	_setChannel
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:674: inline void VDP_EnableDisplay(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_BL, enable ? R01_BL : 0); }
	xor	a, a
	push	af
	inc	sp
	ld	l, #0xbf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:688: inline void VDP_SetColor(u8 color) { VDP_RegWrite(7, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_VDP_RegWrite
;./the-castel.c:1498: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;./the-castel.c:1510: VDP_LoadPattern_GM1_Pletter(g_DataBackground_Patterns, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_DataBackground_Patterns
	call	_VDP_LoadPattern_GM1_Pletter
;./the-castel.c:1513: Print_SetMode(PRINT_MODE_TEXT);
	ld	a, #0x04
	call	_Print_SetMode
;./the-castel.c:1514: Print_SetFontEx(8, 8, 1, 1, ' ', '_', g_DataBackground_Patterns + 192);
	ld	bc, #_g_DataBackground_Patterns + 192
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:197: g_PrintData.PatternX     = patternX;
	ld	hl, #_g_PrintData
	ld	(hl), #0x08
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:198: g_PrintData.PatternY     = patternY;
	ld	de, #_g_PrintData + 1
	ld	a, #0x08
	ld	(de), a
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:199: g_PrintData.UnitX        = sizeX;
	ld	hl, #(_g_PrintData + 2)
	ld	(hl), #0x01
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:200: g_PrintData.UnitY        = sizeY;
	ld	hl, #(_g_PrintData + 3)
	ld	(hl), #0x01
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:201: g_PrintData.CharFirst    = firstChr;
	ld	hl, #(_g_PrintData + 20)
	ld	(hl), #0x20
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:202: g_PrintData.CharLast     = lastChr;
	ld	hl, #(_g_PrintData + 21)
	ld	(hl), #0x5f
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:203: g_PrintData.CharCount    = lastChr - firstChr + 1;
	ld	hl, #(_g_PrintData + 22)
	ld	(hl), #0x40
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:204: g_PrintData.FontPatterns = patterns;
	ld	((_g_PrintData + 28)), bc
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:205: g_PrintData.FontAddr     = g_PrintData.FontPatterns - (firstChr * g_PrintData.PatternY); // pre-compute address of the virtual index 0 character (used to quick drawing in PutChar_GX functions)
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
;./the-castel.c:1515: Print_Initialize();
	call	_Print_Initialize
;./the-castel.c:1516: g_PrintData.PatternOffset = 192;
	ld	hl, #(_g_PrintData + 32)
	ld	(hl), #0xc0
;./the-castel.c:1519: setColorTiles();
	call	_setColorTiles
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:1051: inline void VDP_SetSpriteFlag(u8 flag) { VDP_RegWriteBakMask(1, (u8)~(R01_ST|R01_MAG), flag); }
	ld	a, #0x02
	push	af
	inc	sp
	ld	l, #0xfc
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./the-castel.c:1553: Pletter_UnpackToVRAM(g_DataSprtLayer, g_SpritePatternLow);
	ld	de, (_g_SpritePatternLow)
	ld	hl, #_g_DataSprtLayer
	call	_Pletter_UnpackToVRAM
;./the-castel.c:1555: Game_SetState(State_Preset);
	ld	hl, #_State_Preset
	call	_Game_SetState
;./the-castel.c:1557: return FALSE; // Frame finished
	xor	a, a
;./the-castel.c:1558: }
	ret
;./the-castel.c:1565: bool State_Game()
;	---------------------------------
; Function State_Game
; ---------------------------------
_State_Game::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
;./the-castel.c:1567: WaitVBlank();
	call	_WaitVBlank
;./the-castel.c:1574: GamePawn_Draw(&g_Player.Pawn);
	ld	hl, #(_g_Player + 9)
	call	_GamePawn_Draw
;./the-castel.c:1582: updateCharacter(&g_Player);
	ld	hl, #_g_Player
	call	_updateCharacter
;./the-castel.c:1588: genericControl();
	call	_genericControl
;./the-castel.c:1592: readInputControl();
	call	_readInputControl
;./the-castel.c:1595: if (g_Frame == 50)
	ld	a, (_g_Frame+0)
	sub	a, #0x32
	jp	NZ,00112$
;./the-castel.c:1597: g_SecondCounter++;
	ld	hl, #_g_SecondCounter
	inc	(hl)
;./the-castel.c:1599: g_Frame = 0;
	ld	hl, #_g_Frame
	ld	(hl), #0x00
;./the-castel.c:1602: if (g_CurrRoomIdx != START_GAME && g_CurrRoomIdx != GAME_OVER)
	ld	a, (_g_CurrRoomIdx+0)
	or	a, a
	jp	Z, 00112$
	ld	a, (_g_CurrRoomIdx+0)
	sub	a, #0x1b
	jp	Z,00112$
;./the-castel.c:1604: g_TimetoDeath--;
	ld	hl, #_g_TimetoDeath
	dec	(hl)
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x1c
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x00
;./the-castel.c:1608: Print_DrawText("T:");
	ld	hl, #___str_13
	call	_Print_DrawText
;./the-castel.c:1609: String_Format(StrFormat, "%02i", g_TimetoDeath);
	ld	a, (_g_TimetoDeath+0)
	ld	c, a
	ld	b, #0x00
	push	bc
	ld	hl, #___str_14
	push	hl
	ld	hl, #4
	add	hl, sp
	push	hl
	call	_String_Format
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:226: g_PrintData.CursorX = x;
	ld	hl, #(_g_PrintData + 5)
	ld	(hl), #0x1e
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/print.h:227: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x00
;./the-castel.c:1611: Print_DrawText(StrFormat);
	ld	hl, #0
	add	hl, sp
	call	_Print_DrawText
;./the-castel.c:1613: if (g_TimetoDeath == 0)
	ld	a, (_g_TimetoDeath+0)
	or	a, a
	jr	NZ, 00105$
;./the-castel.c:1615: if (removeLife() == TRUE)
	call	_removeLife
	dec	a
	jr	NZ, 00102$
;./the-castel.c:1617: displayLife();
	call	_displayLife
;./the-castel.c:1618: PlayBankSFX(9, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_PlayBankSFX
;./the-castel.c:1619: drawLevel(g_CurrRoomIdx); // Inizia nuovamente dalla stanza in cui siamo
	ld	a, (_g_CurrRoomIdx+0)
	call	_drawLevel
	jp	00105$
00102$:
;./the-castel.c:1623: stopMusicPlayback();
	call	_stopMusicPlayback
;./the-castel.c:1624: Game_SetState(State_GameOver);
	ld	hl, #_State_GameOver
	call	_Game_SetState
00105$:
;./the-castel.c:1629: if (g_RefreshInventary)
	ld	a, (_g_RefreshInventary+0)
	or	a, a
	jr	Z, 00112$
;./the-castel.c:1632: VDP_ReplacementPartialArea(riga);
	ld	a, #0x16
	call	_VDP_ReplacementPartialArea
;./the-castel.c:1633: displayItemToInventory(g_Levels[g_CurrRoomIdx].X, g_Levels[g_CurrRoomIdx].Y, g_Levels[g_CurrRoomIdx].Height);
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
	add	hl, de
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
	ld	l, (hl)
;	spillPairReg hl
	ld	a, (de)
	ld	c, a
	push	bc
	inc	sp
	ld	a, c
	call	_displayItemToInventory
;./the-castel.c:1634: g_RefreshInventary = FALSE;
	ld	hl, #_g_RefreshInventary
	ld	(hl), #0x00
00112$:
;./the-castel.c:1639: if (g_GameFrame % 2 == 0)
	ld	hl, #_g_GameFrame
	bit	0, (hl)
	jp	NZ,00114$
;./the-castel.c:1641: g_DangerCounter++;
	ld	hl, #_g_DangerCounter
	inc	(hl)
;./the-castel.c:1645: updateGenericEnemy(&g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber, FIRST_ID_SKELETOR);
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
	add	hl, de
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
;./the-castel.c:1653: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Enemy[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SkeletonNumber);
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
	add	hl, de
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
;./the-castel.c:1657: updateGenericEnemy(&g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber, FIRST_ID_GHOST);
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
	add	hl, de
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
;./the-castel.c:1665: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Ghost[0], g_Levels[g_CurrRoomIdx].MyEnemyType.GhostNumber);
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
	add	hl, de
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
;./the-castel.c:1669: updateGenericEnemy(&g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber, FIRST_ID_SPIDER);
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
	add	hl, de
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
;./the-castel.c:1677: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Spider[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SpiderNumber);
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
	add	hl, de
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
;./the-castel.c:1681: updateGenericEnemy(&g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber, FIRST_ID_BAT);
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
	add	hl, de
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
;./the-castel.c:1689: physicsCollisionPlayerAndGenericEnemy(&g_Player, &g_Bat[0], g_Levels[g_CurrRoomIdx].MyEnemyType.BatNumber);
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
	add	hl, de
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
;./the-castel.c:1693: updateGenericEnemy(&g_platformH[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberH, FIRST_ID_SLIDE_H);
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
	add	hl, de
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
;./the-castel.c:1694: updateGenericEnemy(&g_platformV[0], g_Levels[g_CurrRoomIdx].MyEnemyType.SliderNumberV, FIRST_ID_SLIDE_V);
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
	add	hl, de
	add	hl, bc
	ld	de, #0x0011
	add	hl, de
	ld	c, (hl)
	ld	b, #0x15
	push	bc
	ld	hl, #_g_platformV
	call	_updateGenericEnemy
00114$:
;./the-castel.c:1697: return TRUE;
	ld	a, #0x01
;./the-castel.c:1698: }
	ld	sp, ix
	pop	ix
	ret
___str_13:
	.ascii "T:"
	.db 0x00
___str_14:
	.ascii "%02i"
	.db 0x00
;./the-castel.c:1705: bool State_Preset()
;	---------------------------------
; Function State_Preset
; ---------------------------------
_State_Preset::
;./the-castel.c:1708: restoreLevel();
	call	_restoreLevel
;./the-castel.c:1716: initCharacter(&g_Player, 0);
	xor	a, a
	push	af
	inc	sp
	ld	hl, #_g_Player
	call	_initCharacter
;./the-castel.c:1720: initInventory();
	call	_initInventory
;./the-castel.c:1724: initLife();
	call	_initLife
;./the-castel.c:1732: drawLevel(0);
	xor	a, a
	call	_drawLevel
;./the-castel.c:1734: Game_SetState(State_Game);
	ld	hl, #_State_Game
	call	_Game_SetState
;./the-castel.c:1736: return TRUE;
	ld	a, #0x01
;./the-castel.c:1737: }
	ret
;./the-castel.c:1744: bool State_Pause()
;	---------------------------------
; Function State_Pause
; ---------------------------------
_State_Pause::
;./the-castel.c:1746: return TRUE;
	ld	a, #0x01
;./the-castel.c:1747: }
	ret
;./the-castel.c:1754: bool State_GameOver()
;	---------------------------------
; Function State_GameOver
; ---------------------------------
_State_GameOver::
;./the-castel.c:1757: drawLevel(GAME_OVER); // -1
	ld	a, #0x1b
	call	_drawLevel
;./the-castel.c:1760: while (Keyboard_Read(8) != 254)
00101$:
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	call	_Keyboard_Read
	ld	a, l
	sub	a, #0xfe
	jr	NZ, 00101$
;./the-castel.c:1764: Game_SetState(State_Preset);
	ld	hl, #_State_Preset
	call	_Game_SetState
;./the-castel.c:1766: return TRUE;
	ld	a, #0x01
;./the-castel.c:1767: }
	ret
;./the-castel.c:1774: void VDP_ReplacementPartialArea(u8 riga)
;	---------------------------------
; Function VDP_ReplacementPartialArea
; ---------------------------------
_VDP_ReplacementPartialArea::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	-1 (ix), a
;./the-castel.c:1798: g_ScreenLayoutLow + (32 * (riga + g_CacheLevel[0].Y)) + (g_CacheLevel[0].X), g_CacheLevel[0].Width);
	ld	a, (#_g_CacheLevel + 2)
	ld	-2 (ix), a
	ld	c, a
	ld	b, #0x00
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	a, (#_g_CacheLevel + 1)
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
;./the-castel.c:1797: VDP_WriteVRAM_16K(g_CacheLevel[0].Layout + g_CacheLevel[0].Width * riga,
	ld	de, (#_g_CacheLevel + 4)
	push	de
	push	bc
	ld	e, -1 (ix)
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00103$:
	add	hl, hl
	jr	NC, 00104$
	add	hl, de
00104$:
	djnz	00103$
	pop	bc
	pop	de
	add	hl, de
	push	bc
	push	iy
	pop	de
	call	_VDP_WriteVRAM_16K
;./the-castel.c:1799: }
	ld	sp, ix
	pop	ix
	ret
;./the-castel.c:1804: void VDP_LoadPattern_GM1_Pletter(const u8 *src, u8 offset)
;	---------------------------------
; Function VDP_LoadPattern_GM1_Pletter
; ---------------------------------
_VDP_LoadPattern_GM1_Pletter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, l
	ld	b, h
;./the-castel.c:1806: Pletter_UnpackToVRAM(src, g_ScreenPatternLow + (offset * 8));
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
;./the-castel.c:1807: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;./the-castel.c:1815: void VSyncCallback()
;	---------------------------------
; Function VSyncCallback
; ---------------------------------
_VSyncCallback::
;./the-castel.c:1817: g_VBlank = TRUE;
	ld	hl, #_g_VBlank
	ld	(hl), #0x01
;./the-castel.c:1819: g_6thFrameCount++;
	ld	iy, #_g_6thFrameCount
	inc	0 (iy)
;./the-castel.c:1820: if (g_6thFrameCount == 6)
	ld	a, (_g_6thFrameCount+0)
	sub	a, #0x06
	jr	NZ, 00102$
;./the-castel.c:1821: g_6thFrameCount = 0;
	ld	0 (iy), #0x00
00102$:
;./the-castel.c:1823: if (g_6thFrameCount)
	ld	a, (_g_6thFrameCount+0)
	or	a, a
	ret	Z
;./the-castel.c:1825: PT3_Decode();	 // Update data to write to the PSG regiters from the music
	call	_PT3_Decode
;./the-castel.c:1826: ayFX_Update();	 // Overwrite PSG registers data for the SFX
	call	_ayFX_Update
;./the-castel.c:1827: PT3_UpdatePSG(); // Update PSG registers
;./the-castel.c:1829: }
	jp	_PT3_UpdatePSG
;./the-castel.c:1833: void WaitVBlank()
;	---------------------------------
; Function WaitVBlank
; ---------------------------------
_WaitVBlank::
;./the-castel.c:1837: while (!g_VBlank)
00102$:
	ld	a, (_g_VBlank+0)
	or	a, a
	jr	Z, 00102$
;./the-castel.c:1840: g_VBlank = FALSE;
	ld	hl, #_g_VBlank
	ld	(hl), #0x00
;./the-castel.c:1843: if (!g_6thFrameCount)
	ld	a, (_g_6thFrameCount+0)
	or	a, a
	jr	Z, 00102$
;./the-castel.c:1846: g_Frame++;
	ld	hl, #_g_Frame
	inc	(hl)
;./the-castel.c:1847: g_GameFrame++;
	ld	hl, #_g_GameFrame
	inc	(hl)
;./the-castel.c:1848: }
	ret
;./the-castel.c:1850: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;D:/RETROGAME/MSXGL-WORKSPACE/the-castel/MSXgl/engine/src/vdp.h:681: inline void VDP_EnableVBlank(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_IE0, enable ? R01_IE0 : 0); }
	ld	a, #0x20
	push	af
	inc	sp
	ld	l, #0xdf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./the-castel.c:1856: Bios_SetHookCallback(H_TIMI, VSyncCallback /*VDP_InterruptHandler*/);
	ld	de, #_VSyncCallback
	ld	hl, #0xfd9f
	call	_Bios_SetHookCallback
;./the-castel.c:1863: Game_SetState(State_Initialize);
	ld	hl, #_State_Initialize
	call	_Game_SetState
;./the-castel.c:1870: Game_MainLoop(VDP_MODE_GRAPHIC1);
	ld	a, #0x02
	call	_Game_MainLoop
;./the-castel.c:1874: Game_Release();
	call	_Game_Release
;./the-castel.c:1879: Bios_Exit(0);
	xor	a, a
;./the-castel.c:1880: }
	jp	_Bios_Exit
	.area _CODE
	.area _INITIALIZER
__xinit__g_PrevRow8:
	.db #0xff	; 255
__xinit__g_PawnCount:
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
__xinit__g_SlideCountH:
	.db #0x00	; 0
__xinit__g_SlideCountV:
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
__xinit__g_RefreshInventary:
	.db #0x00	; 0
__xinit__g_TimetoDeath:
	.db #0x3c	; 60
__xinit__g_LevelPrev:
	.db #0x00	; 0
__xinit__g_GameFrame:
	.db #0x00	; 0
__xinit__g_Lives:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__g_CacheLevel:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x18	; 24
	.dw _g_LevelUncompress
__xinit__g_CountItem:
	.db #0x00	; 0
__xinit__g_VBlank:
	.db #0x00	; 0
__xinit__g_6thFrameCount:
	.db #0x00	; 0
	.area _CABS (ABS)
