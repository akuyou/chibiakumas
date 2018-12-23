
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			player Handler

;***************************************************************************************************
;--------------------------------------------------------------------------------------------


Player_GetHighscore:
	ld hl,HighScoreBytes
	ret
Player_GetPlayerVars:
	ld iy,Player_Array
ret



	; iy = Pointer to player vars
NoSpend:
ld (SpendTimeout_Plus1-1),a
ret
SpendCheck:
	ld a,1:SpendTimeout_Plus1	;Dont let player continue right away!
	dec a
	jr nz,NoSpend

	ld a, ixl	; read the keymap
	or Keymap_AnyFire 
	inc a;cp 255
	ret z

SpendCredit:
	push iy
SpendCreditSelfMod:	ld iy,Player_Array		; All credits are (currently) stored in player 1's var!
		ld a,(iy+5)
		sub 1
	pop ix
	ret c ;no credits left!
	ld (iy+5),a

	ld a,3
	ld (ix+9),a
	ld a,(SmartbombsReset)
	ld (ix+3),a
	ret	
Players_Dead:		;Both players are dead, so pause the game and show the continue screen
	ld a,&3C
	ld (PlayerCounter),a
	;call Firmware_Restore
	;call ScreenBuffer_Reset

	ifndef BuildZXS
		ld hl,(&0039)
		push hl
	endif


		ld hl,&0001
		call ExecuteBootStrap


	ifdef BuildMSX
		ld hl,(LastPalAddress)
		call VDP_SetPalette
	endif
	ifndef BuildZXS	
		pop hl
		ld (&0039),hl
	endif
	jp ScreenBuffer_Init

Player_Handler:
		;Used to update the live player count




		xor a
ifdef SupportPlus
		ld (FlashPlusSprite_Plus1-1),a
endif
PlayerCounter:	inc a
		inc a
	ld (LivePlayers),a
		or a
		jr z, Players_Dead


	ld hl,&0000		;nop,nop
	ld (PlayerCounter),hl	

	call KeyboardScanner_Read

	call Player_ReadControls
	ld iy,Player_Array
	ld a,(P1_P09)	;See how many lives are left
	or a
	jr nz,Player1NotDead

	;if we got here, player 1 is dead

	call SpendCheck
	jr Player2Start
Player1NotDead:
	ld a,&3C	;inc a
	ld (PlayerCounter),a

	ld hl,Akuyou_PlayerSpritePos	;ChibikoPlayerSpriteBank_Plus2
	ld de,&C0C0

	ld a,(P1_P08)
	and %10000000
	jr z,ChibikoLeftRight
ifdef BuildCPC
	ld a,(CPCVer)
	and 128
	jr z,ChibikoLeftRight
endif
		ld h,&68
		ld e,PlusSprite_ExtBank;&C7		

		ld d,&C1
ChibikoLeftRight:
;	ld (PlusSpriteBank_Plus1-1),a
	xor a
	ld b,4
	call Player_HandlerOne
if buildCPCv+buildENTv
	call BankSwitch_C0_SetCurrentToC0
endif

Player2Start:
	call Player_ReadControls2

ifdef SupportPlus
	ld hl,DronePlusSpriteA_Plus2-1
	ld de,DronePlusSpriteB_Plus2-1
	ld b,(hl)
	ld a,(de)
	ld (hl),a
	ld a,b
	ld (de),a
endif

	ld iy,Player_Array2
	ld a,(P2_P09)	
	or a
	jp z,SpendCheck
Player2NotDead:

	ld a,&3C
	ld (PlayerCounter+1),a



;	jp Player_HandlerOne

;	ld hl,Akuyou_PlayerSpritePos
	ld de,&C0C0
	ld hl,Akuyou_PlayerSpritePos	;ChibikoPlayerSpriteBank_Plus2
ifdef DualChibikoHack
	jr Player2NotDead64kver
endif
JR64k_3: add 0
JR64K_From3:

	ld d,&C1
	ld e,PlusSprite_ExtBank;&C7

ifdef buildCPC
	ld h,&78			;Bochan Memory LR
endif
	ld a,(P2_P08)
	and %10000000
	jr z,BochanLeftRight
ifdef buildCPC
		ld h,&70;&78		;Bochan memory bank UD
endif
BochanLeftRight:
JR64K_To3:
Player2NotDead64kver:


	ld a,12
	ld b,16
	call Player_HandlerOne
if buildCPCv+buildENTv
	jp BankSwitch_C0_SetCurrentToC0
else 
	ret
endif
	;ld a,&C0
	;call Akuyou_BankSwitch_C0_SetCurrent
	;ret
Player_HandlerOne:
	ld (SprShow_BankAddr),hl

ifdef SupportPlus
	ld (PlusSpriteNo_Plus1-1),a
	ld (PlusSpriteNoC_Plus1-1),a

	ld (PlayerSpriteOffset_Plus1-1),a
	ld a,b
	ld (PlusSpriteNoB_Plus1-1),a

	ld a,d
	ld (PlusSpriteBank_Plus1-1),a
endif
ifdef buildCPC
	ld a,e
	ld (PlayerSpriteBank_Plus1-1),a;	call Akuyou_BankSwitch_C0_SetCurrent
endif


	ld a,ixl


	;Check if the game is paused
	Player_Handler_Pause:
	bit Keymap_Pause,a
	jr nz,Player_Handler_PauseCheckDone
	;0=normal nz=paused

	ld hl,Timer_Pause_Plus1-1

	ld a,(hl)
	cpl 
	ld (hl),a
ifdef BuildCPC
	ld b,12
else
	ld b,6
endif
;	push bc
;	ld b,50
WaitLoop:halt;KeyboardScanner_ScanForOne
	djnz WaitLoop
;	pop bc
	pop af
	ret

Player_Handler_PauseCheckDone:
	ld hl,Timer_TicksOccured
	ld a,(hl)
	or a
	ret z				;abort handler if game paused
	xor a
	ld (PlayerSaveShot_Plus1-1),a
	ld (PlayerDoFire_Plus1-1),a
	


;	ld a,(iy+2)	;D1
;	ld c,a
;	and %11110000
;	ld d,a
	ld a,(hl)

	and (iy+11)
;	ld b,(iy+11)
;	and b


	jr z,Player_Handler_Start
;	ld a,d
;	and %01110000	; Mark that the player can shoot again
;	ld d,a
;	xor a
	ld (iy+2),0

	;Move the drones depending if the player is shooting
Player_Handler_Start:
	ld a,(iy+6)	;D1
	;ld a,c
	;and %00001111
	inc a
	cp 16
	jr c,Player_Handler_DronePosOk
	dec a;	ld a,15
Player_Handler_DronePosOk:
	ld (iy+6),a	;D1 - shots and drones
;	ld b,a
	add a
	ld (Player_DroneOffset1_Plus1-1),a
;	ld (Player_DroneOffset2_Plus1-1),a
;	ld a,b
	;add d

	
	ld c,(iy)	;Y
	ld b,(iy+1)	;X

	ld e,8	:PlayerMoveSpeedFast_Plus1; Fast move speed - will be overriden if we're firing

Player_Handler_KeyreadJoy1Fire2:
	ld a,ixl
SelfModifyingFire2:	bit Keymap_F2,a
	jr nz,Player_Handler_KeyreadJoy1Fire1
	;fire bullets
SelfModifyingFire1:	bit Keymap_F1,a
	jr nz,Player_Handler_NoFireX
	
	call Player_Handler_FireX		; Xfire is a secret feature planned for the sequel
	jr Player_Handler_KeyreadJoy1Up		; it activates when both fire buttons are pressed
Player_Handler_NoFireX:


	call SetFireDir_RIGHTsave :Fire2Handler_Plus2


;Player_ShootSkip
	ld e,2	:PlayerMoveSpeedSlow1_Plus1; slow move speed as we're firing
	ld a,ixl
	jr Player_Handler_KeyreadJoy1Up
Player_Handler_KeyreadJoy1Fire1:
	; Shoot left
SelfModifyingFire1B:	bit Keymap_F1,a
	jr nz,Player_Handler_KeyreadJoy1Up
	

	;fire bullets

	call SetFireDir_LEFTsave	:Fire1Handler_Plus2


;Player_ShootSkip2
	ld e,2	:PlayerMoveSpeedSlow2_Plus1; Slow move speed as we're firing
Player_Handler_KeyreadJoy1Up:
	ld a,e
ifdef SupportPlus
	ld (PlayerMoveSpeed_Plus1-1),a
endif
	ld a,ixl
	bit Keymap_U,a
	jr nz,Player_Handler_KeyreadJoy1Down
	ld a,C
ifdef CPC320
	cp 24+16				;Check we're onscreen
else
	cp 24+16				;Check we're onscreen
endif
	jr C,Player_Handler_KeyreadJoy1DownPre

	sub e
	;add e
	ld C,a


	Call null  :FireUpHandler_Plus2

Player_Handler_KeyreadJoy1DownPre:
	ld a,ixl
Player_Handler_KeyreadJoy1Down:

	bit Keymap_D,a
	jr nz,Player_Handler_KeyreadJoy1Left
	ld a,C

	cp 200-16+24				;Check we're onscreen
	jr NC,Player_Handler_KeyreadJoy1LeftPre


	add e
	ld C,a

	call null	:FireDownHandler_Plus2

Player_Handler_KeyreadJoy1LeftPre:
	ld a,ixl
Player_Handler_KeyreadJoy1Left:
	bit Keymap_L,a
	jr nz,Player_Handler_KeyreadJoy1Right
	ld a,B
ifdef CPC320
	cp 12+24				;Check we're onscreen
else
	cp 24+24				;Check we're onscreen
endif
	jr C,Player_Handler_KeyreadJoy1RightPre

	sub e
	ld B,a


	call null	:FireLeftHandler_Plus2

Player_Handler_KeyreadJoy1RightPre:
	ld a,ixl
Player_Handler_KeyreadJoy1Right:
	bit Keymap_R,a
	jr nz,Player_Handler_SmartBomb
	ld a,B
ifdef CPC320
	cp 160-12+24				;Check we're onscreen
else
	cp 160-24+24				;Check we're onscreen
endif
	jr NC,Player_Handler_SmartBombPre

	add e
	ld B,a

	call null	:FireRightHandler_Plus2



Player_Handler_SmartBombPre:

	ld a,ixl
Player_Handler_SmartBomb:			;Check if we should fire the smarbomb
	bit Keymap_F3,a
	jr nz,Player_Handler_KeyreadDone
	ld a,(SmartBomb_Plus1-1)
	or a
	jr nz,Player_Handler_KeyreadDone


	ld a,(iy+3)	; see if we've got any smartbombs left
	sub 1
	jr c,Player_Handler_KeyreadDone
	ld (iy+3),a	


	call DoSmartBomb
	ld a,3
	call DoSmartBombFX

Player_Handler_KeyreadDone:

	ld a,0 :PlayerSaveShot_Plus1
	or a
	jr z,Player_Handler_NoSaveFire


	ld a,0 :PlayerThisSprite_Plus1
	ld (iy+8),a		


	ld a,0 :PlayerThisShot_Plus1
	ld (iy+15),a	
Player_Handler_NoSaveFire:
	ld a,(iy+8)
	and %10000000
	cp 1 :DroneFlipCurrent_Plus1
	call nz,DroneFlip


	ld a,0 :PlayerDoFire_Plus1
	or a
	call nz,Player_Fire4D	

if buildCPCv+buildENTv
	push bc


		ld a,PlusSprite_ExtBank	:PlayerSpriteBank_Plus1
		call BankSwitch_C0_SetCurrent	
	pop bc
endif

	ld (iy),c	;Y
	ld (iy+1),b	;X

	ld e,0
;	ld a,&F0
;	ld (Player_DotColor_Plus1-1),a		; Draw player centre dot
	ld a,(Timer_CurrentTick_Plus1-1)
	and %00000010			:PlayerSpriteAnim_Plus1
	jr z,Player_Handler_Frame1
;	ld a,&0F
;	ld (Player_DotColor_Plus1-1),a
	inc e




Player_Handler_Frame1:	
	push de		;save the frame no
	ld a,B  :DroneDirPos8_Plus1;	ld a,c;ld a,B
	sub 4;	sub 12;sub 4
	ld (SprShow_X),a	:DroneDirPos1_Plus2;	ld (SprShow_Y),a;ld (SprShow_X),a




;	ld a,(iy+4)
;	bit 3,a
	ld a,(iy+4)
	or a
	jp z,Player_Handler_NoDrones

	push iy
	push bc

ifdef buildMSX
	ld hl,Akuyou_PlusSpritesPos
	ld (SprShow_BankAddr),hl

	ld hl,Akuyou_PlusSpritesPos_Y
	ld (SprShow_MsxBankYpos_Plus2-2),hl
endif
ifdef buildCPC
	ld a,4 
endif
if buildZXSv+buildENTv
	ld a,16
endif
ifdef buildMSX
	ld a,0
endif
		add e
		ld (SprShow_SprNum),a
;
;		ld a,(iy+4)
;		bit 4,a
		bit 1,(iy+4)
		jr z,Player_Handler_OneDrone

		ld a,-12
		sub 16:Player_DroneOffset1_Plus1
		call SetDronePos
ifdef SupportPlus
		ld a,(CPCVer)
		and %00000001
		jr z,Drone2NoPlus


	
		ld de,&0409 :DronePlusSpriteA_Plus2
		call ConvertSpriteCoords
;		ei
		jr Drone2Plus
endif

Drone2NoPlus:

		call ShowSprite
Drone2Plus:
		pop bc
		push bc
		jr Player_Handler_OneDroneSkip
Player_Handler_OneDrone:
Player_Handler_OneDroneSkip:
		ld a,(Player_DroneOffset1_Plus1-1);16Player_DroneOffset2_Plus1
		call SetDronePos

ifdef SupportPlus
		ld a,(CPCVer)
		and %00000001
		jr z,Drone1NoPlus


	
		ld de,&0509 :DronePlusSpriteB_Plus2

		;ld a,d
		;xor %00000001
		;ld (DronePlusSpriteB_Plus2-1),a		
		;ld a,d
		;ld (DronePlusSpriteA_Plus2-1),a			

		call ConvertSpriteCoords
;		call	Plus_SetSpriteInterruptsafe
;		ei
		jr Drone1PlusRet
endif
Drone1NoPlus:
		call ShowSprite
Drone1PlusRet:
	pop bc
	pop iy
Player_Handler_NoDrones:
	ld a,B
	sub 7

	ld (SprShow_X),a

pop de	;get back the frame num

ifdef BuildZXS
	bit 1,a
	jr z,Player_SpecNotHalfShift
	ld a,e
	add 20	
	ld e,a
Player_SpecNotHalfShift:
endif

	ld a,(iy+7)	;invincibility

	or a
	jr z,Player_NotInvincible	
	ld a,(Timer_TicksOccured)
	bit 1,a
	jr z,Player_NotInvincible	;invincible flash

	bit 2,a
	jr z,Player_SpriteSkip	

	dec (iy+7)	;invincibility

Player_SpriteSkip:
ifdef SupportPlus
	ld a,(CPCVer)
	and %00000001
	ret z ;jr z,Player_SpriteSkipB
	ld b,200
	ld de,&0400 :PlusSpriteNoB_Plus1

	di
Player_SpriteSkip_More:
		dec d
		call	Plus_SetSprite
		ld a,0 :PlusSpriteNoC_Plus1
		cp d
		jr nz,Player_SpriteSkip_More

	ei
endif

;Player_SpriteSkipB

ret



Player_NotInvincible:	

push bc
	;draw the player
	ld a,(iy+8)
	and %00001111
	add e
	ld (SprShow_SprNum),a


ifdef SupportPlus

	ld a,(CPCVer)
	and %00000001
	jr z,ShowPlayer_NoPlus

;We flash the player when moving slowly, so the player can see bullets in the background as sprites are always at the top
	ld a,0:PlayerMoveSpeed_Plus1
	cp 2
	jp nz,PlayerPlusNoFlash

	ld a,(BlockPageFlippedColors)
	cp 64
	jr z,PlayerPlusNoFlash
	ld a,1
	ld (PlusSpriteSwapFrameSkipper_Plus1-1),a
	ld (FlashPlusSprite_Plus1-1),a
PlayerPlusNoFlash:
	ld a,(SprShow_SprNum)
	add a
	add a
	ld (PlusSpriteOffsetB_Plus1-1),a
	;push bc
		ld a,c
		sub 24+18
		ld c,a

		ld a,b
		sub 24+8
;		add a
		ld b,a



	ld a,(P1_P07)
;	and %11100000
	ld d,a
	ld a,(P2_P07)
;	and %11100000
	or d
	jp z,Player_HandlerOne_NoInvincibility
	ld a,1
	ld (PlusSpriteSwapFrameSkipper_Plus1-1),a
Player_HandlerOne_NoInvincibility:


		ld de,&0009:PlusSpriteNo_Plus1
		di
			call	Plus_SetSprite
			ld a,b
			add &08
			ld b,a
			inc d;ld d,&01
			call	Plus_SetSprite
		ei
			ld a,b
			sub &08
			ld b,a

			ld a,c
			add &10
			ld c,a

			inc d;	ld d,&02
		di
			call	Plus_SetSprite

			ld a,b
			add &08
			ld b,a
			inc d;ld d,&03
			call	Plus_SetSprite
		ei

			ld a,2 :PlusSpriteSwapFrameSkipper_Plus1
			dec a
			call z,CoreExt_PlusSpriteSwapB
			ld (PlusSpriteSwapFrameSkipper_Plus1-1),a

	pop bc	
ret;	jr Player_SpriteSkipB	
endif

ShowPlayer_NoPlus:
	ld a,c
	sub 18
ifdef BuildZXS		;slightly reduce speccy color clash on player (by one pixel!)
	and %11111110
endif
	ld (SprShow_Y),a

ifndef buildCPC
	ld hl,Akuyou_PlayerSpritePos
	ld (SprShow_BankAddr),hl
	ifdef buildMSX
		ld hl,Akuyou_PlayerSpritePos_Y
		ld (SprShow_MsxBankYpos_Plus2-2),hl
	endif
endif

	call ShowSprite
pop bc
ret;jr Player_SpriteSkipB


SetDronePos:
		nop
		nop :DroneDirPos5_Plus2;		sra a
		add c:DroneDirPos2_Plus1;		add b
	ifdef BuildZXS
		and %11111000
		endif
		ld (SprShow_Y),a :DroneDirPos6_Plus2;		ld (SprShow_X),a;ld (SprShow_Y),a
ret

Player_Fire_OneBurst:

		push de
		push bc
			or 0:PlayerNumBurst_Plus1
			;ld (StarObjectMoveToAdd_Plus1-1),a
			;call Stars_AddObject
			call Stars_AddObjectFromA
		pop bc
		pop de
ret
Player_Handler_FireX:


;	ret		;disable this firemode
	ld a,(iy+2)	;D1
or a;	bit 7,a	; check if player is allowed to fire
	ret nz
	ld (iy+2),255	;Set player can't fire

	call Stars_AddToPlayer
	
	ld a,(iy+10)	;Burst Fire counter
	sub 1
	ret c

	ld (iy+10),a	;Burst Fire counter
	ld hl,Xfire
	cp 50
	jr NC,NotSmallBurst
		ld hl,XfireSml
NotSmallBurst:


	ld a,(iy+12)
	ld (PlayerNumBurst_Plus1-1),a
	push iy
		ld d,b

		ld iy,Player_Fire_OneBurst
		call OuterBurstPatternLoop

	pop iy

	ld e,2	
	jr FireSfx

Xfire:
defb &7C,&4C,&67,&61
XfireSml:
defb &49,&4F,&79,&7F,0
Player_Fire4D:	; Fire bullets!

	ld a,(iy+8)
	and %10000000
	cp 0 :DroneFlipFireCurrent_Plus1
	call nz,DroneFlipFire

	ld a,(iy+15)
Player_Fire:	; Fire bullets!
	push bc
	push de

		ld d,(iy+12)
		or d
		ld (StarObjectMoveToAdd_Plus1-1),a


		ld a,(iy+6)	;D1 Move the drones in when fire is held
		dec a
		dec a
		jr nz,Player_Handler_KeyreadJoy1Fire2_DroneLimit
		inc a	; Drone at Max 'innness'!

	Player_Handler_KeyreadJoy1Fire2_DroneLimit:
		;add c
		ld (iy+6),a	;D1
	
	pop de
	pop bc
	ld a,(iy+2)	;D1
	bit 7,a	; check if player is allowed to fire
	ret nz
	or %10000000
	ld (iy+2),a	;D1
	
	push bc

		call Stars_AddToPlayer
		ld d,b
		push bc

			call Stars_AddObject

	;drone1
		pop bc


		ld a,(Player_DroneOffset1_Plus1-1)
		add 4
		rrca	:DroneFlipFirePos5_Plus1	;disable these for X
		ld ixh,a




		; Add extra stars depending on how many drones we have
		ld a,(iy+4)
		or a
		jr z,Player_NoDrones
		dec a
		jr z,Player_OneDrone
		xor a
		sub ixh
		call dodrone
	;drone2

Player_OneDrone:

;		ld ixh,a
		ld a,ixh
		call dodrone

Player_NoDrones:
	pop bc
FireSfx:
	ld a,1
	jp SFX_QueueSFX_Generic

;ret
dodrone:
		push bc
			ld d,b
		
			add d :DroneFlipFirePos3_Plus1
;			ld a,d	DroneFlipFirePos1_Plus1;ld a,c	;Flip for X
;			sub ixh;b

			ld d,a  :DroneFlipFirePos2_Plus1;ld c,a	;Flip for X
	;	push iy
			call Stars_AddObject
	;	pop iy
		pop bc
ret
DroneFlipFire:
	ld (DroneFlipFireCurrent_Plus1-1),a
	push de
	or a;and %10000000
	ld a,&82 ;add d
	jr z,DroneFlipFire_HorizontalMove

		ld de,&570F  ;ld d,a   rrca
		jr DroneFlipFireApply
DroneFlipFire_HorizontalMove:
		dec a;ld a,&81 	;add c
		ld de,&4F00  ;ld c,a nop
DroneFlipFireApply:
	ld (DroneFlipFirePos3_Plus1-1),a
	ld a,d
	ld (DroneFlipFirePos2_Plus1-1),a
	ld a,e
	ld (DroneFlipFirePos5_Plus1-1),a
jr DroneFlipFinish


DroneFlip:


	ld (DroneFlipCurrent_Plus1-1),a
	push de
	push hl
	push bc
	push ix

	LD DE,SprShow_X
	LD HL,SprShow_Y
	or a;and %10000000
	LD A,&80 ; ADD B
	ld ixl,&79;Ld A,C

	jr z,DroneFlip_HorizontalMove


	LD BC,&2FCB ;sra a
	jp DroneFlip_Apply
	DroneFlip_HorizontalMove:
		ex hl,de
		dec ixl;ld ixl,&78;Ld A,B
		inc a ;LD A,&81 ; ADD C
		LD BC,&0000 ;sra a
	DroneFlip_Apply:
	ld (DroneDirPos1_Plus2-2),hl
	ld (DroneDirPos2_Plus1-1),a
	;ld (DroneDirPos3_Plus2-2),bc
	;ld (DroneDirPos4_Plus1-1),a
	ld (DroneDirPos5_Plus2-2),bc
	ld (DroneDirPos6_Plus2-2),de
	;ld (DroneDirPos7_Plus2-2),de
	ld a,ixl
	ld (DroneDirPos8_Plus1-1),a

	pop ix
	pop bc

	pop hl
DroneFlipFinish:
	pop de
ret

SetFireDir_UP:
	push bc
ifdef BuildCPC
	ld bc,&4C82
else
	ld bc,&4C86
endif
	jr SetFireDir_Any

SetFireDir_DOWN:
	push bc
ifdef BuildCPC
	ld bc,&7C80
else
	ld bc,&7C84
endif
	jr SetFireDir_Any

SetFireDir_LEFTsave:
	call SetFireDir_FireAndSave
	;jr SetFireDir_LEFT
SetFireDir_LEFT:
	push bc
	ld bc,&6102
	jr SetFireDir_Any


SetFireDir_RIGHTsave:
	call SetFireDir_FireAndSave
;	jr SetFireDir_RIGHT
SetFireDir_RIGHT:
	push bc
	ld bc,&6700

SetFireDir_Any:
	ld a,b
	ld (PlayerThisShot_Plus1-1),a


ifdef buildCPC
	ld a,c
else
	ld a,(iy+12)	;PlayerNum
	rrca
	rrca
	rrca
	rrca
	or c

endif
	ld (PlayerThisSprite_Plus1-1),a
	pop bc
ret



SetFireDir_FireAndSaveRestore:


	ld a,(iy+8)
	ld (PlayerThisSprite_Plus1-1),a

	ld a,(iy+15)
	ld (PlayerThisShot_Plus1-1),a

SetFireDir_FireAndSave:
	ld a,&67
	ld (PlayerSaveShot_Plus1-1),a
SetFireDir_Fire:
	ld (PlayerDoFire_Plus1-1),a
ret
DoSmartBombCall:

	; a=2 All FX
	; a=1 no sound, screen flash
	; a=0 No FX
	push af
	call DoSmartBomb
	pop af
	jr DoSmartBombFX


MemoryFlushLDIR:
	ld b,0
	ld c,a

	ld d,h
	ld e,l
	inc de
	ld (hl),b
	ldir
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;				Smart Bomb

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DoSmartBomb:	


	push de
	push bc
ifdef buildMSX_V9K
	ld a,8
	ld (ParticleVmoveSize_Plus1-1),a
endif

	

	ld a,StarArraySize-1;(StarArraySize_Enemy) 

	ld hl,StarArrayPointer;(StarArrayMemloc_Enemy)	 
	call MemoryFlushLDIR
	
;	ld a,PlayerStarArraySize-1;(StarArraySize_Player)  
;	ld hl,PlayerStarArrayPointer;(StarArrayMemloc_Player)
;	call MemoryFlushLDIR

	call null :SmartBombSpecial_Plus2	; We can hack in our own smartbomb handler
						; this is needed to wipe omega array for 
						; final boss as it's not handled by
						; normal core code

;	ld a,ObjectArraySize ;(ObjectArray_Size)
	ld b,ObjectArraySize;a
	ld hl, ObjectArrayPointer;&6969ObjectArrayAddress_Plus2

Player_Handler_SmartBombObjLoop:  ; we need special code because we don't want to wipe
				  ; bg objects and boss sprites
	push hl


		;y
		inc h
		;x
		inc h


		;m
		inc h
		;s
		set 6,l ;inc h
		ld a,(hl)	;life (0 is background)
		or a 



		jr z,Player_Handler_SmartBombObjMoveNext
		inc a;		cp 255
		jr z,Player_Handler_SmartBombObjMoveNext
		  
		dec h;inc h

		call null : CustomSmartBombEnemy_Plus2






		ld a,(hl)	
		or a
		jr z,SmartBombKill

		cp 16			;Program 1-31 are protected from smartbomb
		jr C,Player_Handler_SmartBombObjMoveNext

SmartBombKill


		;if we got here we need to kill this object

	pop hl
	push hl

	ifdef buildMSX_V9K
	push bc
		ld b,(hl);y
		inc h
		ld c,(hl);x
		inc h

		ld a,14;fireSmallBurst
		call V9K_ParticleBurst

	pop bc


	else
		inc h		;y
		inc h		;X

	endif
;		ld a,0 PlayerSBCoin_Plus1
;		or a
;		jp z,SmartBombKillP1
		ld (hl),%10001011;%10010011

	
		inc h	
		ld (hl),128+16	:PointsSpriteB_Plus1; Sprite
	
		set 6,l;		inc h	
		ld (hl),64+63	; Life ; must "hurt" player for hit to be detected
		dec h;inc h	
		ld (hl),3	; Program
		dec h
		dec h
		ld (hl),0

Player_Handler_SmartBombObjMoveNext:	


	pop hl
	inc l
	djnz Player_Handler_SmartBombObjLoop

	pop bc
	pop de
	
ret
DoSmartBombFX:
push af;	
	
	or a
	ret z 

	ld a,5
	ld(SmartBomb_Plus1-1),a

	pop af;	ld a,i	
	dec a;cp 1
	ret z 

	ld a,5
	jp SFX_QueueSFX_GenericHighPri

;ret
; ------------------ Player Hit ---------------


Player_Hit:
		ld (PlayerHitMempointer_Plus2-2),hl

		; check player isn't dead!
		;push iy
;			push hl
;			pop iy
;			ld a,(iy+9)
;			or a
;		pop iy
;		ret z


		ld a,iyl
		cp 16+2
		call z,null :customPlayerHitter_Plus2

		cp 3
		jp nz,Player_Hit_Injure

		; if we got here we hit a powerup
		;

		ld b,0	; remove the powerup
		ld c,b
		ld d,b
;		ld ixl,b

		ld a,iyh 	
		cp 128+38	:DroneSprite_Plus1
		jr z,Player_Hit_PowerupDrone
		cp 128+39	:ShootSpeedSprite_Plus1
		jr z,Player_Hit_PowerupShootSpeed
		cp 128+40	:ShootPowerSprite_Plus1
		jr z,Player_Hit_PowerupShootPower
		cp 128+16	:PointsSprite_Plus1
		jr z,Player_Hit_Points
		ret
Player_Hit_Points:

		ld a,6
		call SFX_QueueSFX_GenericHighPri

		; Object is Points for player
;		push iy
;			ld iy,(PlayerHitMempointer_Plus2-2)
;			ld a,(iy+13)
;				add 5
;			ld (iy+13),a
;		pop iy
		push bc
			ld bc,13
			add hl,bc
			ld a,(hl)
			add 5
			ld (hl),a
		pop bc


		ret
Player_Hit_PowerupShootSpeed:		
		;ld a,7
		;call SFX_QueueSFX_GenericHighPri
		push iy
			ld iy,(PlayerHitMempointer_Plus2-2)
			ld a,(iy+11)

			;ld a,(PlayerShootSpeed_Plus1-1)
			srl a	
			or a
			jr nz,Player_Hit_PowerupShootSpeedNZ
		    	inc a ;dont let a=0
Player_Hit_PowerupShootSpeedNZ:				
			ld (iy+11),a
			;ld (PlayerShootSpeed_Plus1-1),a

		pop iy
		jr PowerupPlaySfx
Player_Hit_PowerupDrone:

		push iy
			ld iy,(PlayerHitMempointer_Plus2-2)
			ld a,(iy+4)
			cp 2
			jr nc,Player_Hit_PowerupDroneFull
			inc a
			ld (iy+4),a
Player_Hit_PowerupDroneFull:
			pop iy 
		jr PowerupPlaySfx
Player_Hit_PowerupShootPower:
ifdef BuildCPC
		ld a,&96;6f
		ld (PlayerStarColor_Plus1-1),a
endif

ifdef BuildMSX
		ld a,&99
		ld (PlayerStarColor_Plus1-1),a
endif

		ld a, 1 ;(Dec A)
;		power up both players
		ld (P2_P14),a
		ld (P1_P14),a
; 		power up only one player
;		push iy
;			ld iy,(PlayerHitMempointer_Plus2-2)
;			ld (iy+14),a
;		pop iy
PowerupPlaySfx:
		ld a,7
		jp SFX_QueueSFX_GenericHighPri
Player_Hit_Injure_2
		push hl
			ld hl,Player_Array2
			jp Player_Hit_Injure_X
Player_Hit_Injure_1
		push hl
			ld hl,Player_Array
Player_Hit_Injure_X
			ld (PlayerHitMempointer_Plus2-2),hl
		pop hl
Player_Hit_Injure:	
	push iy
	ld iy,Player_Array :PlayerHitMempointer_Plus2

	ld a,(iy+7)	;invincibility
	or a;and %11100000	
	jr nz,Player_Hit_Done		;>0 if player invincible
	

		;ld a,(iy+4)	;invincibility
;		or 
		ld (iy+7),%00000111		;invincibility


		ld a,(iy+9)	
		sub 1	
		jr c,Player_Hit_Done	; We are below zero!
		ld (iy+9),a	


		jr z,PlayerKilled
		ld a,4		
		call SFX_QueueSFX_GenericHighPri
Player_Hit_Done:
	pop iy
	ret


PlayerKilled:
	xor a
	ld (iy+3),a

	pop iy
		ld a,20
		ld (SpendTimeout_Plus1-1),a
	
		ld a,100
		ld (ShowContinueCounter_Plus1-1),a
ifdef SupportPlus
		ld (PlayerJustKilled_Plus1-1),a		;Tell PlayerUI to hide everything
endif
		ret

ret
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			Player UI
;***************************************************************************************************
;--------------------------------------------------------------------------------------------
ifdef SupportPlus
Plus_SetSprite_IfANonzero: ; or <h
	or a
	ld de,4
	ld c,9
	ld b,3
	Plus_SetSprite_IfANonzeroMore:
	jr nz,Plus_SetSprite_IfANonzeroNotZero
	ld c,a
	Plus_SetSprite_IfANonzeroNotZero:
	ld (hl),c
	add hl,de
	dec a
	djnz Plus_SetSprite_IfANonzeroMore
	ret


Player_DrawUI_PlusVer:
	di
		;ld bc,&0008
		;ld d,6+3

		ld a,(iy+9)	;lifes
		ld hl,4*3+PlusSprites_Config1+4	:PlusIcons_Bank1_Plus2
		;ld h,0
		;or a
		;call Plus_SetSprite_IfANonzero
		;ld h,2
		;call Plus_SetSprite_IfANonzero
		;ld h,3
		call Plus_SetSprite_IfANonzero

		;ld bc,&00B4 ;180 down
		;ld d,6
		ld a,(iy+3)	;smartbombs
		ld hl,PlusSprites_Config2+4    :PlusIcons_Bank2_Plus2
		call Plus_SetSprite_IfANonzero
		;ld h,0
		;or a
		;call Plus_SetSprite_IfANonzero
		;ld h,2
		;call Plus_SetSprite_IfANonzero
		;ld h,3
		;call Plus_SetSprite_IfANonzero

	ei
	ret
endif
Player_DrawUI_IconLoop:		; Used for Health and Smartbomb icons 

	ld a,b
	or a
	ret z
;	cp 4
;	ret nc


	ld a,(SprShow_Y)
ifndef buildMSX
	ld (SprShow_TempY),a	;MSX doesn't use these
endif

	ld a,c
ifdef buildMSX
	ld (SprShow_X),a	
else
	ld (SprShow_TempX),a	;msx doesn't use these
endif
	push bc
		call ShowSpriteDirect
	pop bc
	dec b	
	ld a,c
	add a,4 :Player_DrawUI_IconLoop_MoveSize_Plus1
	ld c,a

	jr Player_DrawUI_IconLoop
Player1DoContinue:
	ld a,(ShowContinueCounter_Plus1-1)
	or a
	call nz, Player1Continue
	jr Player1_DeadUI
Player2DoContinue:
	ld a,100	:ShowContinueCounter_Plus1
	or a
	call nz,Player2Continue
	jr Player2_DeadUI




Player_DrawUI:					; We put PLus sprite anims here, as they
						; have to be run after the playerhandler
						; and mess up practically ALL registers

ifdef SupportPlus

		ld a,(CPCVer)
		and %00000001
		jr z,TwoDronesOnscreen

		ld a,0:PlayerJustKilled_Plus1
		or a
		jr z,PlayerNotJustKilled
		di
		call Plus_HideSprites
		ei
		ld iy,Player_Array2
		call Player2DrawUI
		ld iy,Player_Array
		call Player1DrawUI

		xor a
		ld (PlayerJustKilled_Plus1-1),a
PlayerNotJustKilled:

		ld a,(P2_P04)			;see if between them the two players have two drones
;		and %00011000
		ld b,a
		ld a,(P1_P04)
;		and %00011000
		add b
		cp 2
		jr NC,TwoDronesOnscreen
		dec b 
		ld a,(DronePlusSpriteA_Plus2-1)
		jr z,Player2_1Drone

		xor 1	;Flip between 4 and 5 (The drone sprites)
Player2_1Drone:
		ld c,219				; hide the second drone if we only have one onscreen
		ld d,a
		ld e,0
;		di
		call	Plus_SetSpriteInterruptsafe
;		ei

endif
TwoDronesOnscreen:





	ld iy,Player_Array
	ld a,(P1_P09)	;See how many lives are left
	or a
	jr z,Player1DoContinue
	call Player1DrawUI


	

Player1_DeadUI:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Player 2;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld iy,Player_Array2
	ld a,(P2_P09)	;See how many lives are left
	or a


	jr z,Player2DoContinue
	call Player2DrawUI

Player2_DeadUI:
	ld a,(LivePlayers)
	cp 2
	ret nc
	;1 player or less!
ifdef SupportPlus
	ld a,1
	ld (PlusSpriteSwapFrameSkipper_Plus1-1),a
endif	
	ld a,(ShowContinueCounter_Plus1-1)
	or a
	ret z
	call SpriteBank_Font2
	ld l,&00;14				; show how many credits are left

ShowContinues:
	ld h,&0E	:ContinuesScreenpos_Plus1
	ld bc,txtCreditsMsg2
	call DrawText_LocateAndPrintStringUnlimited	

;	call AkuYou_Player_GetPlayerVars
;	ld a,(iy+5)	
	ld a,(P1_P05)	
	call DrawText_Decimal		

ShowContinuesSelfMod:	ld a,"/"
	call Akuyou_DrawText_CharSprite

	ld a,(P2_P05)	
	jp DrawText_Decimal		




Player2Continue:
ifdef CPC320
	ld hl,&1e01;14				; show how many credits are left
else
	ld hl,&1a01;14				; show how many credits are left
endif
	jr Player1ContinueB
Player1Continue:
ifdef CPC320
	ld hl,&0101;14				; show how many credits are left
else
	ld hl,&0501;14				; show how many credits are left
endif
Player1ContinueB:

	push hl 
		ld hl,ShowContinueCounter_Plus1-1
		dec (hl)
;		ld a,(ShowContinueCounter_Plus1-1)
;		dec a
;		ld (ShowContinueCounter_Plus1-1),a

		call SpriteBank_Font2
	pop hl
	ld bc,txtPressButtonMsg2
	jp DrawText_LocateAndPrintStringUnlimited	
if BuildLang =''
	txtCreditsMsg2:
		db "Credits",":"+&80
	txtPressButtonMsg2:
		db "Continue","?"+&80
else
	txtCreditsMsg2:
		db "CREDITS",":",255
	txtPressButtonMsg2:
		db "CONTINUE","?",255
endif




Player_DrawUIDual:	
	ld (Player_DrawUI_IconLoop_MoveSize_Plus1-1),a
	ld a,b
	ld (Player_DrawUI_IconLoop_XPos_Plus1-1),a
ifdef buildMSX
	ld hl,Akuyou_PlusSpritesPos_Y
	ld (SprShowDirect_MsxBankYpos_Plus2-2),hl
endif

ifdef BuildEnt
	ld a,PlusSprite_ExtBank
	call BankSwitch_C0_SetCurrent
endif

ifdef SupportPlus

	ld (PlusIcons_Bank1_Plus2-2),de
	ld (PlusIcons_Bank2_Plus2-2),hl

	ld a,(CPCVer)
	and %00000001
	jp nz,Player_DrawUI_PlusVer
endif
ifdef buildMSX
	ld hl,Akuyou_PlusSpritesPos
else
	ld hl,Akuyou_PlayerSpritePos
endif
	ld (SprShow_BankAddr),hl

	xor a
	ld (SprShow_Xoff),a	



	ld b,(iy+9)	;LIves
	
ifdef buildCPC
	ld a,7
endif
ifdef buildMSX
	ld a,3
endif
if buildZXSv+buildENTv
	ld a,19
endif

	ld (SprShow_SprNum),a

	ld a,8
	ld (SprShow_Y),a
	;lives
	ld c,0 :Player_DrawUI_IconLoop_XPos_Plus1
	push bc
		push iy
			call Player_DrawUI_IconLoop
		pop iy
ifdef buildCPC
	ld a,6
endif
ifdef buildMSX
	ld a,2
endif
if buildZXSv+buildENTv
	ld a,18
endif
		ld (SprShow_SprNum),a
	
	ifdef CPC320
		ld a,180
	else
		ld a,192-16
	endif
		ld (SprShow_Y),a

	pop bc;ld c,0
	;smart bombs

	ld b,(iy+3)	;D1
	jp Player_DrawUI_IconLoop

Player1DrawUI:
	if buildENTv + buildCPCv
		ld a,4
	endif
	ifdef buildMSX
		ld a,16
	endif
	ifdef buildZXS
		ld a,2
	endif
	ld b,0
	ld de,3*4+PlusSprites_Config1+3
	ld hl,PlusSprites_Config2+3

	call Player_DrawUIDual
ifdef CPC320
	ld a,7
	ld hl,&0003 
else
	ld a,7+4
	ld hl,&0403 	;Burst postition
endif
	ld iy,Player_Array
	ld de, Player_ScoreBytes	




	jr Player_DrawUI_PlusAsWell
Player2DrawUI:

	if buildENTv + buildCPCv
		ld a,-4
	endif
	ifdef buildMSX
		ld a,-16
	endif
	ifdef buildZXS
		ld a,-2
	endif

	if buildCPCv+buildENTv
		ifdef CPC320
			ld b,80-4
		else
			ld b,64-4
		endif
	endif
	ifdef buildMSX
		ld b,256-16
	endif
	ifdef buildZXS
		ld b,32-2
	endif

	ld de,3*4+PlusSprites_Config2+3	
	ld hl,PlusSprites_Config1+3

	call Player_DrawUIDual


ifdef CPC320
	ld hl,&2503 
	ld a,40-1
else
	ld hl,&2103 ;Burst postition 
	ld a,36-1
endif
	ld iy,Player_Array2
	ld de, Player_ScoreBytes2

;	jr Player_DrawUI_PlusAsWell
Player_DrawUI_PlusAsWell:
	ld (PlayerScorePos_Plus2-1),a
	ld (BurstDrawPos_Plus2-2),hl
	push de
	push iy


		;Draw score digits
		ld hl,&0700:PlayerScorePos_Plus2
		call DrawText_LocateSprite
		;push bc
			call SpriteBank_Font2
		;pop bc
		ex hl,de


Player_DrawUI_NextDigit:
		push hl

			ld a,(hl)		
			add 48 ; Move to the correct digit (first 32 are not in font)
			 ;add 8 

			if buildCPCv+buildENTv
				ld b,-2 ; we are drawing backwards!
			endif
			ifdef buildMSX
				ld b,-8 ; we are drawing backwards!
			endif
			ifdef buildZXS
				ld b,-1 ; we are drawing backwards!
			endif

			call DrawText_CharSpriteDirect;DrawText_DigitSprite
	;	pop bc
		pop hl
		inc l
		ld a,%00000111
		and l
		jp nz,Player_DrawUI_NextDigit
	pop iy
	pop hl
	; check if we need to show the continue screen
	

ScoreAddRepeat:				;This does our rolling up effect on the score!

	push hl
		call Player_UpdateScore
	pop hl
	ld a,(iy+13)	
	cp 30				; if waiting score goes over 30, add faster
	jr nc,ScoreAddRepeat		; this is for the 'coffee time' effect at the
					; end of level 9  



	;Show the remaining 'burst fire' power
	ld hl,&0003 : BurstDrawPos_Plus2
	call DrawText_LocateSprite	
	ld a,(iy+10)	
	or a
	call nz,DrawText_Decimal	




ifdef BuildEnt
	ld a,Akuyou_LevelStart_Bank
	call BankSwitch_C0_SetCurrent
endif

	ret: CheatMode_Plus1


	; CHEAT MODE!           Sssh, we set cheats here - as some levels steal our powerups,
	; 			done During the level not before
;	ld iy,Player_Array
;	ld hl,
;	ld a,(hl)
;
;	or %00011000
	ld a,2
	ld (P1_P04),a
ifdef BuildCPC
	ld a,&96
	ld (PlayerStarColor_Plus1-1),a
endif
ifdef BuildMSX
	ld a,&77
	ld (PlayerStarColor_Plus1-1),a
endif
	ld a, 1 ;(Dec A)
	ld (P1_P14),a
	ld a,%00000001
	ld (P1_P11),a
	;ld (PlayerShootSpeed_Plus1-1),a
ret


Player_UpdateScore:			;Add score to the first digit

	ld a,(iy+13)
	or a
	ret z ;nothing to add
	ld b,a
	ld c,0
	dec a
	ld (iy+13),a

	ld a,(hl)
	inc a
	ld (hl),a
	cp 10 
	ret C 	; return if nothing to carry
	inc c	; We've rolled into another digit.
Player_AddScore_NextDigit:
		xor a
		cp c
;		ld a,c
;		or a
		ret z 	; check if C is zero

		ld c,a
		ld a,(hl)
		inc a
		cp 10
		jp C,Player_AddScore_Inc
		xor a;ld a,0
		inc c

Player_AddScore_Inc:
	ld (hl),a
	inc l
	ld a,l
	and 7
	cp 3
	jp nz,NoBurstPower
	ld a,(iy+10)
	add 10
	jr nc,Player_AddScore_NoOverflow
	ld a,255
Player_AddScore_NoOverflow:
	ld (iy+10),a
NoBurstPower:
	ld a,%00000111
	or l	; repeat until we get to 8 - if so we've run out of digits
	jr nz,Player_AddScore_NextDigit
ret