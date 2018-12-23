read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &000 ;Start of the data which is stored on disk



org &4000
LevelOrigin:


;limit &4000
;org &E00	

; - sfx goes at &E00

;limit &2000
;org &1000
;incbin "Sprites\PLAYER.SPR"

;limit &4000
org LevelOrigin+ LevelDataStart
;LevelTiles
;incbin "Sprites\TILETEST.TLE"
LevelSprites:
;incbin "Sprites\LEVEL1A2.SPR"
incbin "Sprites\STAGE17.SPR"




RasterColors_ColorArray1Alt:
	defb 1
	defb 0				
	defb &54,&58,&4A,&4B	

RasterColors_ColorArray2Alt:
	defb 1
	defb 0				
	defb &54,&5C,&4A,&4B
RasterColors_ColorArray3Alt:
	defb 1
	defb 0				
	defb &54,&5C,&4A,&4B
RasterColors_ColorArray4Alt:
	defb 1
	defb 0				
	defb &54,&58,&4A,&4B



;org LevelOrigin+&3500
;limit &3000
;org &2E00
;Event_SavedSettings:
;defs 4*16,&00

Event_SavedSettingsB:
defs 128,&00

read "Eventstreamdefinitions.asm"

;org LevelOrigin+&3600



InteractiveInsultsText:
	ld a,5 :OnscreenTimer_Plus1
	or a
	ret z
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-8)	;check if insults are disabled
	and %00001000
	ret nz


	call Akuyou_Timer_GetTimer	;ld a,(Timer_TicksOccured)
	or a
	ret z	; see if game is paused (TicksOccurred = 0 )


;InteractiveInsultsText_StartText
	;ld hl,&C000
	;call Akuyou_ShowSprite_SetBankAddr
	
	ld a,1
	call Akuyou_SpriteBank_Font	;Remember - This now corrupts BC!

	ld bc,&6969 :OnscreenTextPointer_Plus2

	ld a,1:InsultPlayerNum_Plus1
	cp 1
	jr z,InteractiveInsultsText_GotPlayer
	cp 3
	jr z,Player3Insult
	cp 4
	jr z,AchievementInsult
	ld de,Akuyou_PlayerSeparator
	add iy,de
	jr InteractiveInsultsText_GotPlayer
AchievementInsult:
	ld hl,&1116
	jr InteractiveInsultsText_PosReady
Player3Insult:
;	push bc
;		ld hl,(YumiObj)
;		ld a,(hl)
;		sub 38
;		srl a
;		srl a
;		srl a
;		ld b,a
;
;		inc h
;		ld a,(hl)
;		sub 12
;		srl a
;		srl a
;		ld h,a
;		ld l,b
;		
;	pop bc
;	jr InteractiveInsultsText_PosReady
InteractiveInsultsText_GotPlayer:
	ld a,(iy+9)
	or a
	jr z,InteractiveInsultsCantDraw

	ld a,(iy+0)
	sub 38
	jr C,InteractiveInsultsCantDraw

	srl a
	srl a
	srl a
	ld l,a
	ld a,(iy+1)
	sub 12
	srl a
	srl a
	ld h,a
InteractiveInsultsText_PosReady:
	ld a,1:InsultCharNum_Plus1
	ld i,a	; show up to 255 chars
	
InteractiveInsultsText_MoreText:
	ld a,(bc)

	;cp 10
	;jp z,InteractiveInsultsText_StartBattle
	or a
	jr z,InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
	cp 9
	jr z,InteractiveInsultsText_More2Come ; See if we have reached the end of the string
	cp 8
	jr z,InteractiveInsultsText_More2ComeB ; See if we have reached the end of the string
	;inc bc

	push hl
		call Akuyou_DrawText_LocateSprite4CR

		call Akuyou_DrawText_PrintString
	pop hl
InteractiveInsultsCantDraw:
	inc l
	inc l
	inc l
	ld a,i
	dec a
	inc bc
	jp nz,InteractiveInsultsText_MoreText

	ld a,(bc)
	or a
	jp z,InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
	ld a,(InsultCharNum_Plus1-1)
	add 3
InteractiveInsultsTextNoSpeedup:
	ld (InsultCharNum_Plus1-1),a

ret
InteractiveInsultsText_Abandontext:
	xor a
	ld (OnscreenTimer_Plus1-1),a
	ret

InteractiveInsultsText_AllOnscreen:
	ld a,(OnscreenTimer_Plus1-1)
	dec a
	ld (OnscreenTimer_Plus1-1),a
	or a
	ret nz
	ld (OnscreenTimer_Plus1-1),a
;	ld a,InsultText2End-InsultText2-20
	ld a,1
	ld (InsultCharNum_Plus1-1),a
ret
InteractiveInsultsText_More2ComeB:
	;call YumiSilent
InteractiveInsultsText_More2Come:
ld a,(OnscreenTimer_Plus1-1)
	ld a,10:OnscreenTimerB_Plus1
	dec a
	ld (OnscreenTimerB_Plus1-1),a
	or a
	ret nz
	ld a,1
	ld (InsultCharNum_Plus1-1),a
	ld a,15 
;	ld (OnScreenTextReset_Plus1-1),a
	inc bc
	ld a,(bc)
	cp 4
	jr nc,Insult_NoPlayerChange
	ld (InsultPlayerNum_Plus1-1),a

	;cp 3
	;call z,YumiTalk

	inc bc
Insult_NoPlayerChange:
	ld (OnscreenTextPointer_Plus2-2),bc
	ld a,5
	ld (OnscreenTimerB_Plus1-1),a
ret









;ShowInsultTextBigsprite:
;push hl
;	ld hl,InsultTextBigsprite
;	jr DoShowInsult
;ShowInsultTextFlappy:
;push hl
;	ld hl,InsultTextFlappy


ShowInsultAchievement:

	push iy
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)
	;Achievements (Wxx54321)	-10
	or            %00001000
	ld (iy-10),a
	pop iy


push hl
	ld hl,InsultAchievement
	ld a,4
;	jr DoShowInsult
DoShowInsult:
	ld (OnscreenTextPointer_Plus2-2),hl
	ld (InsultPlayerNum_Plus1-1),a
	ld a,1
	ld (InsultCharNum_Plus1-1),a
	ld a,5
	ld (OnscreenTimer_Plus1-1),a
pop hl
ret


InsultAchievement:
db 4,"Achievement Unlocked:",13
db   "    Halal Vampire!",13
db   "No Stake for you!","!"+&80
db 0


InsultsBochanOnly:
db 2,"OOoohh!",13,"There's lots of cool",13,"stuff here!"," "+&80,9
db 2,"I want to play",13,"with it all!!","!"+&80,0

InsultsChibikoOnly: 
db  "Hmm...",13,"This place looks far",13,"cooler than my castle!"," "+&80,9

db 1,"I'm going to have to call",13,"my estate agent!"," "+&80,9
db 1,"I have a feeling this",13,"place will be vacent soon!"," "+&80
db 0

InsultsTwoPlayer: 
db  "Hmm...",13,"This place looks far",13,"cooler than my castle!"," "+&80,9
db 1,"I'm going to have to call",13,"my estate agent!"," "+&80,9
db 1,"I have a feeling this",13,"place will be vacent soon!"," "+&80,9

db 2,"Where are Yumi and Yume?"," "+&80,9
db 2,"I wanna play!"," "+&80,0
db 0


ObjSun:	defw &6969
ObjSunFire: defw &6969

InsultText1: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db 2," "," "+&80,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
defw Animator_ShortWave ;1
defw Animator_CrystalAttacker ;2
defw Animator_Blade    ;3
defw Animator_SawGear	   ;4
defw Animator_MechaMutt     ;5
defw Animator_ReverseWalker ;6
defw Animator_BulletBall     ;7
defw Animator_SteakShoot    ;8
defw Animator_Scorpion   ;9
defw Animator_ClockRoach    ;10
defw Animator_Spear     ;11
defw Animator_Tesla ;12
defw Animator_SawLauncher



Animator_ShortWave:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000		;Anim Freq
defb anmMove,&1D,0,0
defb anmMove,&1D,0,0
defb anmMove,&1D,0,0
defb anmMove,&25,0,0
defb anmMove,&2D,0,0
defb anmMove,&2D,0,0
defb anmMove,&2D,0,0
defb anmMove,&25,0,0
defb anmLoop,0,0,0				;End of loop

Animator_CrystalAttacker:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
defb anmSprite,3+128,0,0
defb anmSprite,4+128,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Blade:
	defb %00000010		;Anim Freq
	defb anmSpriteMoveProg,25+128,&0D,0
	defb anmSpriteMoveProg,31+128,&0D,0
	defb anmSpriteMoveProg,25+128,&0D,0
	defb anmSpriteMoveProg,31+128,&0D,prgFireFast+fireOuterBurst
	defb anmSpriteMoveProg,25+128,&0D,0
	defb anmSpriteMoveProg,31+128,&0D,0
	defb anmSpriteMoveProg,25+128,&0D,0
	defb anmSpriteMoveProg,31+128,&0D,prgFireFast+fireOuterBurst
	defb anmSpriteMoveProg,25+128,&3D,0
	defb anmSpriteMoveProg,31+128,&3D,0
	defb anmSpriteMoveProg,25+128,&3D,0
	defb anmSpriteMoveProg,31+128,&3D,prgFireFast+fireOuterBurst
	defb anmSpriteMoveProg,25+128,&3D,0
	defb anmSpriteMoveProg,31+128,&3D,0
	defb anmSpriteMoveProg,25+128,&3D,0
	defb anmSpriteMoveProg,31+128,&3D,prgFireFast+fireOuterBurst
	defb anmLoop,0,0,0				;End of loop

Animator_SawGear:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,128+28,&14,0
defb anmSpriteMoveProg,128+30,&14,0
defb anmLoop,0,0,0				;End of loop

Animator_MechaMutt:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,128+23,&24,prgFireMid2+fireLeft
defb anmSpriteMoveProg,128+23,&24,prgFireMid2+fireRight
defb anmSpriteMoveProg,128+23,&24,prgFireMid2+fireLeft
defb anmSpriteMoveProg,128+23,&24,prgFireMid2+fireRight
defb anmSpriteMoveProg,128+20,&25,prgFireMid2+fireTop
defb anmSpriteMoveProg,128+20,&25,prgFireMid2+fireTopWide
defb anmSpriteMoveProg,128+20,&25,prgFireMid2+fireTop
defb anmSpriteMoveProg,128+20,&25,prgFireMid2+fireTopWide
defb anmLoop,0,0,0				;End of loop

Animator_ReverseWalker:
defb %00001000		;Anim Freq
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&25,0,0
defb anmMove,&24,0,0
defb anmProgram,prgFireMid2+fireOuterBurst,0,0
defb anmSwitchAnimator,0,0,0
defb anmLoop,0,0,0				;End of loop

Animator_BulletBall:
defb %00000010		;Anm Freq
defb anmProgram,prgFireMid2+fireSmallBurst,0,0
defb anmProgram,prgFireMid2+fireBurst,0,0
defb anmProgram,prgFireMid2+fireSmallBurst,0,0
defb anmSpawnObject,2,0,0
defb anmLoop,0,0,0				;End of loop


Animator_SteakShoot:
defb %00001000		;Anim Freq
defb anmEmpty,0,0,0
defb anmSpawnObject,3,0,0
defb anmSpawnObject,4,0,0
defb anmSpawnObject,5,0,0
defb anmSpawnObject,6,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,7,0,0
defb anmSpawnObject,8,0,0
defb anmSpawnObject,9,0,0
defb anmSpawnObject,10,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Scorpion:
defb %00000010		;Anim Freq
defb anmMove,&23,0,0
defb anmMove,&24,0,0
defb anmMove,&24,0,0
defb anmLoop,0,0,0

Animator_ClockRoach:
defb %00000010		;Anim Freq
defb anmProgram,prgFireMid+fireOuterBurst,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmProgram,prgFireMid+fireSmallBurst,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Spear:
defb %00000100		;Anm Freq
defb anmSpawnObject,2,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop




Animator_Tesla:
defb %00010000		;Anim Freq
defb anmEmpty,0,0,0
defb anmSpawnObject,3,0,0
defb anmSpawnObject,4,0,0
defb anmSpawnObject,5,0,0
defb anmSpawnObject,6,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,7,0,0
defb anmSpawnObject,8,0,0
defb anmSpawnObject,9,0,0
defb anmSpawnObject,10,0,0
defb anmSpawnObject,6,0,0
defb anmLoop,0,0,0		

Animator_SawLauncher:
defb %00001000	
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,14,0,0
defb anmLoop,0,0,0		

AchievementTargetCount:defb 6

SmartBombCustom:
	push hl
		inc h
		res 6,l ;inc h
		ld a,(hl)
	
		dec h
		dec h

		push bc

			ld b,(hl)
;			ld b,a
			dec h
			ld c,(hl)
;		ld c,a
	

			;call AchievementHandlerB
		pop bc
	pop hl
ret
AchievementHandler:


	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y


	ld a,iyh
;AchievementHandlerB
	cp TwoFrameSprite+9
	jp z,KillEye
;	cp TwoFrameSprite+19
;	jp z,DiaganolLaserDead
;	cp TwoFrameSprite+10
;	jp z,NukeSatelliteDead
;	cp TwoFrameSprite+9
;	jp z,NukeSatelliteDead
;	ld a,iyl
;	cp 2
;	ret nz

;	push hl
;		ld a,(objSun)
;		res 6,l
;		cp l	
;
;	pop hl
;	jr z,SunDead


;	push hl
;		ld hl,AchievementTargetCount
;		dec (hl)
;	pop hl
;	ret nz
;	jp ShowInsultAchievement

ret

EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static

defb 0,evtSetAnimatorPointers
defw	AnimatorPointers

;defb 0,evtReprogramSmartBombed
;defw SmartBombCustom

defb 0,evtResetPowerup
;defb 0,evtReprogramScrollDirection,1

defb 0,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54		



; Define the background

;defb 0,240+1,0,41				; (Time,Cmd,Off,Bytes) Load 41 bytes into the background - 41 bytes is the limit

;defb &F0,&F0	;1; first line
;defb 196,&D0	;2; line num, New byte
;defb 190,&70	;3
;defb 186,&A0	;4
;defb 180,&50	;5
;defb 176,&80	;6
;defb 170,&20	;7
;defb 166,&00	;8
;defb 160,&00	;9
;defb 36,&20	;10
;defb 32,&80	;11
;defb 28,&50	;12
;defb 24,&A0	;13
;defb 20,&70	;14
;defb 16,&D0	;15
;defb 12,&69	;16
;defb 10,&2D	;17
;defb 08,&2F	;18
;defb 06,&8f	;19
;defb 02,&0F	;20
;defb 255

;We will use 4 Paralax layers
; ---------()- (sky)		%11001000
; ------------ (Far)		%11000100
; -----X---X-- (mid)		%11000010	Bank 1
; []=====[]=== (foreground) 	%11000001	Bank 0



defb 0,evtReprogram_PowerupSprites,128+37,128+38,128+39,128+36	; Define powerup sprites (Drone(2)/speed(2)/power(1)/coin)
defb 0,evtReprogramShotToDeath
defw AchievementHandler
; Background L

defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,0	
								; Save Object settings to Bank 0
defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,1				; Save Object settings to Bank 1




; Razor Wire
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&25,lifDeadly+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+34
defb 	evtSettingsBank_Save,2


; Eye
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,mveMisc+&25,lifEnemy+32	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,11

; Mouth
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,mveMisc+&25,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+8
defb 	evtSettingsBank_Save,12




; Tesla Beam
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&25,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,33
defb 	evtSettingsBank_Save,13


; SawGear
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&14,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+28
defb 	evtSettingsBank_Save,14




;;;;;;;;;;;;;;;;;;;;;;;EXT;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Hover Gun Turret
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireMid2+fireSingleEast,mveMisc+&25,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSettingsBankEXT_Save,0


; Burst Drone
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireMid+fireSmallBurst,mveMisc+&25,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBankEXT_Save,1

; Crystal Attacker
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireFast+fireSingleFastWest,mveMisc+&23,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+3
defb 	evtSettingsBankEXT_Save,2


; DeadlyGear 
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&25,lifDeadly+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+12
defb 	evtSettingsBankEXT_Save,3



; Blade
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&25,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+25
defb 	evtSettingsBankEXT_Save,4


; SawGear Launcher
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&25,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,13
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+29
defb 	evtSettingsBankExt_Save,5



; Mecha Mutt
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&25,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+25
defb 	evtSettingsBankEXT_Save,6



; Reverse Walker
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&25,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+27
defb 	evtSettingsBankEXT_Save,7


; Beam Generator
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,&25,lifDeadly+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+35
defb 	evtSettingsBankEXT_Save,8



; Bullet-Ball
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&15,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+7
defb 	evtSettingsBankEXT_Save,9



; Scorpion
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireTop,&23,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+21
defb 	evtSettingsBankEXT_Save,11



; ClockRoach from Left
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&26,lifEnemy+16	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBankEXT_Save,12


; ClockRoach from Right
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&22,lifEnemy+16	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBankEXT_Save,13



; Spear up
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&1D,lifDeadly+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,11
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+6
defb 	evtSettingsBankEXT_Save,14






; Tesla Coil
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&25,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,12
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+32
defb 	evtSettingsBankEXT_Save,10




; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,3


; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&26,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,4

; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&1D,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,5

; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&3D,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,6


; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&1B,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,7


; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&2B,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,8

; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&16,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,9

; TeslaBlast
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&2D,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,10








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Start of level data







;Palette Change
defb 1,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&44,&40	

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&44,&40		

	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40			





;defb 1,evtSetObjectSize,128 ;object size test







; Load Palette

	defb 2,evtMultipleCommands+4			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4C,&4E,&4B

	defb evtReprogramPalette,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 32;0;32	;delay			
	defb &54,&4C,&4A,&4B


	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
	defb &54,&4C,&4A,&4B



	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&4C,&4E,&4B


defb 2,evtCallAddress
defw RasterColorsStartPalleteFlip

;test
;defb 10, evtJumpToNewTime
;defw MouthBatch1
;defb 100
;test



; DeadlyGear Light
defb 5,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,60+24-12
; DeadlyGear Dark
defb 	evtSingleSprite,TwoFrameSprite+13,1,140+24-12



; Burst Drone
defb 15,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb 	evtSingleSprite+4



; DeadlyGear Light
defb 20,evtMultipleCommands+4
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,20+24-12
; DeadlyGear Dark
defb 	evtSingleSprite,TwoFrameSprite+13,1,100+24-12
; DeadlyGear Light
defb 	evtSingleSprite,TwoFrameSprite+12,1,180+24-12


; Burst Drone
defb 30,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb 	evtSingleSprite+10



; DeadlyGear Light
defb 35,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,60+24-12
; DeadlyGear Dark
defb 	evtSingleSprite,TwoFrameSprite+13,1,140+24-12


;Hover Gun Turret

defb 45,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12


;Hover Gun Turret

defb 45,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+5


; DeadlyGear Light
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,20+24-12

; DeadlyGear Dark
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+13,1,100+24-12


; DeadlyGear Light
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,180+24-12






; Powerup Power (Star) max 1
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&24,lifDeadly+8
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 39,80+24-6,100+24-12	; 

; Powerup Power (Star) max 1
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&1B,lifDeadly+8
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 37,160+24-32-6,200+24-12	; 

; Powerup Power (Star) max 1
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&1D,lifDeadly+8
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 38,0+24+32-6,200+24-12	; 

; Powerup Power (Star) max 1
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&2B,lifDeadly+8
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 38,160+24-32-6,24-12	; 

; Powerup Power (Star) max 1
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&2D,lifDeadly+8
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 37,0+24+32-6,24-12	; 




; Mecha Mutt

defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb 	evtSingleSprite,TwoFrameSprite+25,1,140+24



;Hover Gun Turret

defb 60,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12


;Hover Gun Turret

defb 60,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+5



; Blade
defb 70,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+7


; Blade
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+10

; Blade
defb 90,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+12




; Spear UP
defb 95,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+14
defb evtSingleSprite, 128+6,30+24,200+24



; Spear Down
defb 100,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+14
defb 	evtSetMove,&2D
defb evtSingleSprite, 128+5,30+24,12

MouthBatch1:


;MouthBatch 1

defb 105,evtCallAddress
defw SetEyecount2

; Mouth
defb 105,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+7

; Eye
defb 115,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+4 

; Eye
defb 115,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+10 

defb 125,evtCallAddress			;Call a memory location
defw	EyeAttackScrollStop



; Blade
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+7


; Blade
defb 135,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+10


; Crystal Attacker
defb 135,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,100+24


; Blade
defb 140,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+12

; Crystal Attacker
defb 145,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,50+24


; Crystal Attacker
defb 145,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,150+24


;Hover Gun Turret

defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12


;Hover Gun Turret

defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+5



; BulletBall

defb 160,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+9
defb evtSingleSprite, 128+7,60+24,200;+24


; Scorpion
defb 165,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+11
defb evtSingleSprite, 128+21,160+24,140+24;+24




; Mecha Mutt

defb 170,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb 	evtSingleSprite,TwoFrameSprite+25,1,140+24




; Crystal Attacker
defb 175,evtMultipleCommands+5
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,50
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,100
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,150
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,200


; Crystal Attacker
defb 180,evtMultipleCommands+5
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,50-24
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,100-24
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,150-24
defb 	evtSingleSprite,TwoFrameSprite+3,160+24,200-24



;Beam Generators

defb 185,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+8
defb evtSingleSprite, 128+10,1,-24*1+200+24
defb evtSingleSprite, 128+11,1,24+4



;Hover Gun Turret

defb 190,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12


;Hover Gun Turret

defb 190,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+5

;Beam
defb 205,evtMultipleCommands+8
defb 	evtSettingsBankEXT_Load+8
;defb evtSingleSprite, 128+35,30+24,-24*1+200+24
defb evtSingleSprite, 128+35,60+24,-24*2+200+24
defb evtSingleSprite, 128+35,60+24,-24*3+200+24
defb evtSingleSprite, 128+35,60+24,-24*4+200+24
defb evtSingleSprite, 128+35,60+24,-24*5+200+24
defb evtSingleSprite, 128+35,60+24,-24*6+200+24
defb evtSingleSprite, 128+35,60+24,-24*8+200+24+12
defb evtSingleSprite, 128+35,60+24,-24*7+200+24

;defb evtSingleSprite, 128+35,30+24,-24*9+200+24



;Tesla Coil
defb 215,evtMultipleCommands+4
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24



; Spear UP
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+14
defb evtSingleSprite, 128+6,60+24,200+24


; Scorpion
defb 225,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+11
defb evtSingleSprite, 128+21,160+24,140+24;+24

; Spear Down
defb 230,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+14
defb 	evtSetMove,&2D
defb evtSingleSprite, 128+5,60+24,12



;Tesla Coil
defb 245,evtMultipleCommands+4
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24



;MouthBatch 2

defb 5,evtCallAddress
defw SetEyecount4

; Mouth
defb 5,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+5

; Mouth
defb 6,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+9

; Eye
defb 15,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+4 

; Eye
defb 15,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+10 

; Eye
defb 20,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+5

; Eye
defb 20,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+9 


defb 25,evtCallAddress			;Call a memory location
defw	EyeAttackScrollStop





;Tesla Coil

defb 30,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33

defb 30,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24



;Hover Gun Turret

defb 40,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12


;Hover Gun Turret

defb 40,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+5


;Beam Generators

defb 50,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+8
defb evtSingleSprite, 128+10,1,-24*1+200+24
defb evtSingleSprite, 128+11,1,24+4





;Tesla Coil

defb 60,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33

defb 60,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24


;Beam
defb 70,evtMultipleCommands+8
defb 	evtSettingsBankEXT_Load+8
;defb evtSingleSprite, 128+35,30+24,-24*1+200+24
defb evtSingleSprite, 128+35,60+24,-24*2+200+24
defb evtSingleSprite, 128+35,60+24,-24*3+200+24
defb evtSingleSprite, 128+35,60+24,-24*4+200+24
defb evtSingleSprite, 128+35,60+24,-24*5+200+24
defb evtSingleSprite, 128+35,60+24,-24*6+200+24
defb evtSingleSprite, 128+35,60+24,-24*8+200+24+12
defb evtSingleSprite, 128+35,60+24,-24*7+200+24

;defb evtSingleSprite, 128+35,30+24,-24*9+200+24

; Reverse Walker

defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+3



;Tesla Coil

defb 90,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33

defb 90,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24




; Spear UP
defb 100,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+14
defb evtSingleSprite, 128+6,60+24,200+24



; Spear Down
defb 110,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+14
defb 	evtSetMove,&2D
defb evtSingleSprite, 128+5,60+24,12



; DeadlyGear Light
defb 115,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,60+24-12

; DeadlyGear Dark
defb 115,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+13,1,140+24-12






; SawGear Launcher
defb 120,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb evtSingleSprite, 128+29,1,200+24-32



defb 125,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12
defb 	evtSingleSprite+5

;Tesla Coil
defb 125,evtMultipleCommands+4
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24




; DeadlyGear Light
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,20+24-12

; DeadlyGear Dark
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+13,1,100+24-12


; DeadlyGear Light
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,180+24-12

defb 135,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12
defb 	evtSingleSprite+5

;Tesla Coil
defb 138,evtMultipleCommands+4
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24



; SawGear Launcher
defb 140,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb evtSingleSprite, 128+29,1,200+24-32











; DeadlyGear Light
defb 145,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+12,1,60+24-12

; DeadlyGear Dark
defb 145,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite,TwoFrameSprite+13,1,140+24-12


; Reverse Walker

defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+3



;Tesla Coil
defb 155,evtMultipleCommands+4
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24





; SawGear Launcher
defb 160,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb evtSingleSprite, 128+29,1,200+24-32





; Burst Drone
defb 175,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+1
defb 	evtSingleSprite+4
defb 	evtSingleSprite+10

;Tesla Coil
defb 175,evtMultipleCommands+4
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24



; Reverse Walker

defb 175,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+3

; SawGear Launcher
defb 180,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb evtSingleSprite, 128+29,1,200+24-32




; Scorpion
defb 185,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+11
defb evtSingleSprite, 128+21,160+24,140+24;+24



;Tesla Coil

defb 190,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb    evtTileSprite+4, 24,-24*4+200+24,24,	33,33,33,33

defb 190,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb    evtSingleSprite, 2, 24-4,-24*5+200+24




;Hover Gun Turret

defb 200,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+12


;Hover Gun Turret

defb 200,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+5



; BulletBall

defb 210,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+9
defb evtSingleSprite, 128+7,60+24,200;+24




;MouthBatch 3

defb 224,evtCallAddress
defw SetEyecount4


; Mouth
defb 224,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+8


; Mouth
defb 225,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+4

; Mouth
defb 226,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+12

; Eye
defb 235,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+3

; Eye
defb 235,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+9

; Eye
defb 240,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+6

; Eye
defb 240,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+12


defb 245,evtCallAddress			;Call a memory location
defw	EyeAttackScrollStop















;;;;;;;;;;;;;Vertical Redefine ;;;;;;;;;;


defb 10,evtCallAddress
defw SetScrollUp


; Razor Wire
defb 10,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&2C,lifDeadly+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+18
defb 	evtSettingsBank_Save,2

; Bullet-Ball
defb 10,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&2E,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+7
defb 	evtSettingsBankEXT_Save,9



; Steak
defb 10,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecialHitPlayer,mveMisc+&21,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBank_Save,3


; Steak
defb 10,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetMove,mveMisc+&27
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBank_Save,4

; Steak
defb 10,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetMove,mveMisc+&14
defb 	evtSetSprite,TwoFrameSprite+19
defb 	evtSettingsBank_Save,5

; Steak
defb 10,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetMove,mveMisc+&3C
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSettingsBank_Save,6


; Steak
defb 10,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetMove,mveMisc+&12
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBank_Save,7


; Steak
defb 10,evtMultipleCommands+3
defb 	evtSetMove,mveMisc+&32
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBank_Save,8

; Steak
defb 10,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetMove,mveMisc+&16
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBank_Save,9

; Steak
defb 10,evtMultipleCommands+3					; 3 commands at the same timepoint
defb 	evtSetMove,mveMisc+&36	
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBank_Save,10


; Steak Shooter
defb 10,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&2C,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+32
defb 	evtSettingsBankEXT_Save,10


; Burst Drone
defb 10,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireMid+fireSmallBurst,mveMisc+&1C,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBankEXT_Save,1



; Eye
defb 10,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,mveMisc+&2C,lifEnemy+32	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,11

; Mouth
defb 10,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,mveMisc+&2C,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+8
defb 	evtSettingsBank_Save,12





defb 10,evtReprogramCustomPlayerHitter
defw hitsteak

defb 10,evtCallAddress
defw Blackout5

defb 12,evtCallAddress
defw Blackout4

defb 14,evtCallAddress
defw Blackout3

defb 16,evtCallAddress
defw Blackout2

defb 18,evtCallAddress
defw Blackout1

defb 20,evtCallAddress
defw EnableAltBackground

defb 22,evtCallAddress
defw Blackout2

defb 24,evtCallAddress
defw Blackout3

defb 25,evtCallAddress
defw Blackout4

defb 26,evtCallAddress
defw Blackout5

defb 28,evtCallAddress
defw BlackoutOff


; Steak Shooter

defb 30,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,80+24-8,1;+24


; Clockroach from left
defb 45,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,10+24;+24


;Burst Drome Up
defb 59,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200



defb 60,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,40+24-8,1;+24


;Burst Drome Up
defb 65,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,100+24-6,200

; Clockroach from right
defb 75,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,50+24;+24


;Burst Drome Up
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200

;steakshooter
defb 90,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,120+24-8,1;+24


;Burst Drome Up
defb 95,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,100+24-6,200


; Clockroach from right
defb 100,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,30+24;+24


; Bullet-Ball R
defb 105,evtMultipleCommands+3
defb evtSettingsBankEXT_Load+9
defb evtSetMove,&2A
defb evtSingleSprite, 128+7,160+24,10;+24


; Clockroach from left
defb 110,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,80+24;+24


;Burst Drome Up
defb 115,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200

defb 120,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,80+24-8,1;+24

;Burst Drome Up
defb 125,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,100+24-6,200


; Clockroach from right
defb 135,evtMultipleCommands+4
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,50+24;+24
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,130+24;+24


;Burst Drome Up
defb 140,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,80+24-6,200


defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,40+24-8,1;+24


;Burst Drome Up
defb 155,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200
defb evtSingleSprite, 128+0,100+24-6,205


; Clockroach from right
defb 165,evtMultipleCommands+4
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,130+24;+24
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,50+24;+24


;Burst Drome Up
defb 170,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,205
defb evtSingleSprite, 128+0,100+24-6,200


;Burst Drome Up
defb 175,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,80+24-6,200


defb 180,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,120+24-8,1;+24

;Burst Drome Up
defb 185,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200
defb evtSingleSprite, 128+0,100+24-6,205

; Clockroach from right
defb 190,evtMultipleCommands+4
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,130+24;+24
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,50+24;+24




; Bullet-Ball L
defb 195,evtMultipleCommands+2
defb evtSettingsBankEXT_Load+9
defb evtSingleSprite, 128+7,1,10;+24

; Clockroach from right
defb 200,evtMultipleCommands+4
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,50+24;+24
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,130+24;+24

;Burst Drome Up
defb 205,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200

; SteakShooters
defb 210,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+10
defb evtSingleSprite, 128+32,40+24-8,1;+24
defb evtSingleSprite, 128+32,120+24-8,16;+24

;Burst Drome Up
defb 215,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,100+24-6,200


; Clockroach from right
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,30+24;+24

;Burst Drome Up
defb 225,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200

; Clockroach from left
defb 230,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,130+24;+24


;Burst Drome Up
defb 235,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,100+24-6,200


defb 240,evtCallAddress
defw SteakCheck


; Clockroach from left
defb 240,evtMultipleCommands+4
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,100+24;+24
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,100+24;+24


;Burst Drome Up
defb 245,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,80+24-6,200


; Clockroach from right
defb 250,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+24,160,130+24;+24




; Bullet-Ball L
defb 250,evtMultipleCommands+2
defb evtSettingsBankEXT_Load+9
defb evtSingleSprite, 128+7,1,10;+24

; Bullet-Ball R
defb 255,evtMultipleCommands+3
defb evtSettingsBankEXT_Load+9
defb evtSetMove,&2A
defb evtSingleSprite, 128+7,160+24,10;+24

; Bullet-Ball L
defb 5,evtMultipleCommands+2
defb evtSettingsBankEXT_Load+9
defb evtSingleSprite, 128+7,1,10;+24

; Bullet-Ball R
defb 10,evtMultipleCommands+3
defb evtSettingsBankEXT_Load+9
defb evtSetMove,&2A
defb evtSingleSprite, 128+7,160+24,10;+24



; Clockroach from left
defb 10,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb evtSingleSprite, 128+22,1+24,50+24;+24


;Burst Drome Up
defb 15,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,205
defb evtSingleSprite, 128+0,100+24-6,200

;Burst Drome Up
defb 20,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,80+24-6,200

;Burst Drome Up
defb 25,evtMultipleCommands+3
defb 	evtSettingsBankEXT_Load+1
defb evtSingleSprite, 128+0,60+24-6,200
defb evtSingleSprite, 128+0,100+24-6,205



;MouthBatch Final!

defb 25,evtCallAddress
defw SetEyecount5



; Eye
defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+4 

; Eye
defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+10 

; Mouth
defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+7

; Mouth
defb 34,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+4 

; Eye
defb 34,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+7

; Mouth
defb 35,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+10 


; Eye
defb 43,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+4 

; Eye
defb 43,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb evtSingleSprite+10 


; Mouth
defb 43,evtMultipleCommands+2
defb 	evtSettingsBank_Load+12
defb evtSingleSprite+6


defb 45,evtCallAddress			;Call a memory location
defw	EyeAttackScrollStop







LevelEnding:
defb 65,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change

LevelEndAnim:
defb 65,evtMultipleCommands+4			; 3 commands at the same timepoint
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb evtSingleSprite,128+	47,140+24,100+24	; 	
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb evtSingleSprite,128+	47,80+24,10+24	; 


defb 66,%10001001			;Call a memory location
defw	StopRasterFlip

;Palette Change
defb 66,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&44,&40	

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&44,&40		

	defb 240,26*2+6,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&44,&40			




defb 67,%01110000+4			; 4 Commands
	defb 240,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54	

	defb 240,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 1				
	defb &54,&54,&54,&54		

	defb 240,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 1				
	defb &54,&54,&54,&54		

defb 68,evtCallAddress			;Call a memory location
defw	EndLevel

EndLevel:
	pop hl	;
	ld hl,	&0112 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return










LoopInfinite:
defb 100,evtJumpToNewTime	
defw LoopInfinite
defb 10	








; stream examples

; Three Linked Background objects
;defb 1,128+1,1				; Program / bitshift sprite
;defb 1,128,%11000010,0			; Move 	  / dir Left Slow ... Life - immortal
;defb 10,0,	22,110,111	; 	; Single Object / 
;defb 22,0,	23,110,111	; 	; Single Object / 
;defb 34,0,	24,110,111	; 	; Single Object / 




; Three Linked Background objects Faster
;defb 1,128+1,1				; Program / bitshift sprite
;defb 1,128,%11000001,0			; Move 	  / dir Left Slow ... Life - immortal
;defb 10,0,	22,160+24,175+24	; 	; Single Object / 
;defb 16,0,	23,160+24,175+24	; 	; Single Object / 
;defb 22,0,	24,160+24,175+24	; 	; Single Object / 
null: ret






;org &3f00
LevelInit:

	; wipe our memory, to clear out any junk from old levels
;	ld de,LevelOrigin+1
;	ld hl,LevelOrigin
;	ld bc,&5FF
;	ld (hl),0
;	ldir 


;	ld a, StarArraySize
;	ld hl,StarArrayPointer
;	call AkuYou_StarArrayInit_Enemy 

;	ld a, PlayerStarArraySize
;	ld hl,PlayerStarArrayPointer
;	call AkuYou_StarArrayInit_Player 

;	ld a,ObjectArraySize
;	ld hl,ObjectArrayPointer
;	call AkuYou_ObjectArray_Init


	ld a,1
	call Akuyou_Background_SetScroll


	call AkuYou_Player_GetPlayerVars

	;flip around our play character
	ld a,&98
	ld (iy+1),a
	ld (iy+1+Akuyou_PlayerSeparator),a

	ld a,&2
	ld (iy+8),a
	ld (iy+8+Akuyou_PlayerSeparator),a
	;end of character flip

	ld a,(iy-5)
	ld hl,null
	cp 64
	jp nz,LevelInitUsingRasterFlip
	ld (DisablePaletteSwitcher_Plus2-2),hl
LevelInitUsingRasterFlip:
	call RasterColorsSetPalette1

;	ld a,1
;	ld bc,RasterColors_ColorArray1
;	ld de,RasterColors_ColorArray2
;	ld hl,RasterColors_ColorArray3
;	ld ix,RasterColors_ColorArray4
;	ld iy,null
;	call Akuyou_RasterColors_SetPointers



	ld hl,EventStreamArray		;Event Stream
	ld de,Event_SavedSettingsB	;Saved Settings
	call AkuYou_Event_StreamInit


	call Akuyou_Music_Restart

;	ld hl, LevelSprites	
;	ld de, Akuyou_PlayerSpritePos
;	call AkuYou_SpritePointerInit



	call Akuyou_ScreenBuffer_Init
	ld (BackgroundFloodFillQuad_Minus1+1),hl
	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
	ld (BackgroundFloodFillQuadSpriteV_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	ld (Background_Blackout_Minus1+1),hl
	call Akuyou_RasterColors_Init

	call AkuYou_Player_GetPlayerVars



;	ld de,InsultHurryBochan
	ld hl,InsultsTwoPlayer
	ld b,1
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SetInsults
	ld hl,InsultsBochanOnly
	ld b,2
	ld a,(iy+9)
	or a
	jr z,SetInsults
	ld hl,InsultsChibikoOnly
	ld b,1
SetInsults:
	ld a,b
	ld (InsultPlayerNum_Plus1-1),a
	ld (OnscreenTextPointer_Plus2-2),hl








	push iy
	pop hl
	ld de,-6
	add hl,de
	ld (TimerPos_Plus2-2),hl

	;call RasterColors_Reset
LevelLoop:
	ld hl,(TimerPos_Plus2-2)
	ld a,(hl)
	ld (Timer_Last_Plus1-1),a
	ld a,10
	ld (Lpos_Plus1-1),a
	;ld l,&0e
;	call Timer_Stop
	;ld a,"F"
	;call &bb5a 

;	ifdef Debug
;		call Timer_Start
;	endif
	;halt
	;call Akuyou_Background_Clear
	ifdef Debug
		call Timer_Stop
	endif

	call Background_Draw	:BackgroundCall_Plus2 ;Background_Draw



	ifdef Debug
		call Timer_Stop
		ld a,'B'
		call Akuyou_DrawText_CharSprite
	endif

	call Akuyou_EventStream_Process

	ifdef Debug
		call Timer_Stop
		ld a,'E'
		call Akuyou_DrawText_CharSprite
	endif

	;halt
	call Akuyou_ObjectArray_Redraw

	ifdef Debug
		call Timer_Stop
		ld a,'O'
		call Akuyou_DrawText_CharSprite
	endif

	;halt
	call Akuyou_Player_Handler

	ifdef Debug
		call Timer_Stop
		ld a,'P'
		call Akuyou_DrawText_CharSprite
	endif

	call Akuyou_StarArray_Redraw
	
	ifdef Debug
		call Timer_Stop
		ld a,'S'
		call Akuyou_DrawText_CharSprite
	endif


	call AkuYou_Player_StarArray_Redraw

	ifdef Debug
		call Timer_Stop
		ld a,'5'
		call Akuyou_DrawText_CharSprite
	endif

	;halt
	call AkuYou_Player_DrawUI

	ifdef Debug
		call Timer_Stop
		ld a,'U'
		call Akuyou_DrawText_CharSprite
	endif

	call ShowLevelText 	:TextDisplayer_Plus2;InteractiveInsultsText

	ifdef Debug
		call Timer_Stop
		ld a,'B'
		call Akuyou_DrawText_CharSprite
	endif

	call Akuyou_PlaySfx

	ifdef Debug
		call Timer_Stop
		ld a,'X'
		call Akuyou_DrawText_CharSprite
	endif

	ifdef Debug_ShowLevelTime
		;ld l,&0f
		;call Timer_Stop


		call ShowLevelTime
	endif
	call Akuyou_ScreenBuffer_Flip
	ld (BackgroundFloodFillQuad_Minus1+1),hl
	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
	ld (BackgroundFloodFillQuadSpriteV_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	ld (Background_Blackout_Minus1+1),hl

	jp LevelLoop

LevelShutdown:

ClearBadguys:
	ld a,64
	ld (PaletteNo_Plus1-1),a	; turn off the alternate palette
	
	ld a,1
	ld i,a
	push hl
	call Akuyou_DoSmartBombCall
	pop hl
ret

;;;;;;;;;;;;;;;;;;;Debugging Tools ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Timer_Stop:

	ld a,2		;Remember to set the font!
	call Akuyou_SpriteBank_Font
;	ret
	ld h,&03
	ld l,&10 :Lpos_Plus1
	ld a,l
	inc a
	ld (Lpos_Plus1-1),a
	call Akuyou_DrawText_LocateSprite ; set location
	;call &BD0D ;KL_TIME_PLEASE

	ld a,(&0000):TimerPos_Plus2
	push af
		sub 0 :Timer_Last_Plus1
		call ShowHex
	pop af
	ld (Timer_Last_Plus1-1),a
	ret


ShowLevelTime:

	ld a,2		;Remember to set the font!
	call Akuyou_SpriteBank_Font

	ld hl,&1001
	call Akuyou_DrawText_LocateSprite

	call Akuyou_GetLevelTime
	push bc	
	call ShowHex
	pop bc
	ld a,b
	call ShowHex
ret


ShowHex:


	push af         ;store original byte value
		rrca            
		rrca
		rrca
		rrca
		call DrawText_PrintHexDigit
	pop af          ;retrieve original byte value

DrawText_PrintHexDigit:
	;	and %00001111   ;isolate lower nibble. (This contains the digit value 0...15)
	;	add a,"0"       ;add ASCII for 0. Digits 0...9 become "0"..."9", digits 10..15
	;	cp "9"+1        
	;	jr c,ShowHexDigitNum     ;if number is in digit range 0...9, display digit
	;	add a,"A"-"9"-1 ;modify ASCII value so that digits in the range 10...15
	and %00001111   ;isolate lower nibble. (This contains the digit value 0...15)
	cp &a           ;Less than 10?  Set carry if so
	sbc a,&69
	daa             ;Because previous instruction was a subtract operation this
                ;is known as 'das' in x86
DrawText_PrintHexDigitNum:
	jp Akuyou_DrawText_CharSprite   ;display digit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;











RasterColorsStartPalleteFlip:
	push iy
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-5)
		cp 64
	pop iy
	ret z

	xor a
 	ld (PaletteNo_Plus1-1),a
ret

RasterColorsSetPalette1:
	ld a,0
;	ld bc,RasterColors_ColorArray1
;	ld de,RasterColors_ColorArray2
;	ld hl,RasterColors_ColorArray3
;	ld ix,RasterColors_ColorArray4
	ld iy,PaletteSwitcher :DisablePaletteSwitcher_Plus2
jp Akuyou_RasterColors_SetPointers

PaletteSwitcher:
	ld a,64:PaletteNo_Plus1
	cpl	
	ld (PaletteNo_Plus1-1),a
	or a
	jp nz,RasterColorsSetPalette1
RasterColorsSetPalette2:
	ld a,1
	ld bc,RasterColors_ColorArray1Alt
	ld de,RasterColors_ColorArray2Alt
	ld hl,RasterColors_ColorArray3Alt
	ld ix,RasterColors_ColorArray4Alt
	ld iy,PaletteSwitcher
jp Akuyou_RasterColors_SetPointers

StopRasterFlip:
	ld a,64
	ld (PaletteNo_Plus1-1),a	; turn off the alternate palette
	ret





TileSprite_Floor equ 40
TileSprite_Gears equ 41
TileSprite_Belt equ 42
TileSprite_Vert1 equ 43
TileSprite_GearsB equ 44
TileSprite_Vert2 equ 45
Background_DrawALT:


	;Tree!

	push hl
		ld a,TileSprite_Vert1 :TileSprite_VertNext_Plus1
		cp TileSprite_Vert1
		ld a,TileSprite_Vert2
		jr z,TileSprite_VertSwapB

		ld a,TileSprite_Vert1
TileSprite_VertSwapB:
		ld (TileSprite_VertNext_Plus1-1),a
		call GetSpriteMempos	
		ex hl,de
			;MUST BE BYTE ALIGNED!
	pop hl

		
		
		push de


			;incomplete first bit
			push hl
				ld hl,&0008
				ld a,(FirstTileCount_Plus1-1)
				sub 1	:VertMoveSpeed_Plus1
				jr nc,TileCont
				ld a,15
TileCont:

				ld (FirstTileCount_Plus1-1),a
				ld (SecondTileCount_Plus1-1),a
				ld hl,TileskipLookup

				add l
				ld l,a
				ld l,(hl)
				ld h,0
				add hl,de
				ex hl,de
			pop hl
			ld a,16
			sub 4 :FirstTileCount_Plus1
			ld b,a
			call BackgroundFloodFillQuadSpriteVertical
		pop de


	ld c,11
MoreVTiles:
	ld b,16
;	push bc
		push de
			call BackgroundFloodFillQuadSpriteVertical
		pop de
;	pop bc
	dec c
	jp nz,MoreVTiles
	
	;last bit
	ld a,8
	add 16-4 :SecondTileCount_Plus1
	ld b,a
	cp 16
	call nc,MoreVTilesExtra
	xor a
	cp b
	ret z
	call BackgroundFloodFillQuadSpriteVertical



ret
MoreVTilesExtra:
	push de
	push bc
		ld b,16
		call BackgroundFloodFillQuadSpriteVertical
	pop bc
	pop de
	ld a,-16
	add b
	ld b,a
	ret
align 16,0
TileskipLookup: 
defb 8*0,8*1,8*2,8*3,8*4,8*5,8*6,8*7,8*8,8*9,8*10,8*11,8*12,8*13,8*14,8*15

	jp Background_DrawB :
EnableAltBackground:
	push hl
	ld hl,Background_DrawAlt
	ld (BacgroundRender_Plus2-2),hl
	pop hl
	ret
BlackoutOff:
	push hl
	ld hl,Background_Draw
	jr BlackoutApply2
Blackout5:
	push hl
	ld hl,&1818
	ld a,33+33
	jr BlackoutApply
Blackout4:
	push hl
	ld hl,&1018
	ld a,50+30
	jr BlackoutApply
Blackout3:
	push hl
	ld hl,&1010
	ld a,50+50
	jr BlackoutApply

Blackout2:
	push hl
	ld hl,&0810
	ld a,100+33
	jr BlackoutApply
Blackout1:
	push hl
	ld hl,&0808
	ld a,200
BlackoutApply:
	ld (BlackoutSize_Plus1-1),a
	ld (BlackoutSettings_Plus2-2),hl
	ld hl,Background_DrawBlackout
BlackoutApply2:
	ld (BackgroundCall_Plus2-2),hl
pop hl
ret

Background_DrawBlackout: 
	call Background_Draw
;	ld b,2*8 ;10
;	ld c,3*8 ;30
	ld h,200/3	:BlackoutSize_Plus1
	ld bc,&1030	:BlackoutSettings_Plus2
	jp Background_Blackout



Background_Draw: 

	ld a,1 :SkyScrollDir_Plus1
	call Akuyou_Background_GradientScroll

	call Akuyou_Timer_UpdateTimer

	push af	; need to keep the smartbomb color
		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
		ld l,&4F+1
	pop af
	or a
	jp nz,Background_SmartBomb

	call AkuYou_Player_GetPlayerVars
	ld a,(iy-8)	;Backgrounds can be disabled for a speedup
	and %00000100
	jp nz,Background_Black
	jp Background_DrawB :BacgroundRender_Plus2

;	call Background_DrawALT
;	call Akuyou_ScreenBuffer_GetActiveScreen
;	ld h,a
;	ld l,&4F+1


Background_DrawB: 
	ld de,NewGradient
	ld b,20
	ld c,0;%11111100
	call Akuyou_Background_Gradient




	;Tree!
	push hl
		ld a,TileSprite_Gears :TileSprite_GearsCurrent_Plus1
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,16
		call BackgroundFloodFillQuadSprite
	;pop de

	;inc d
	;ld e,0

	ld a,(TileSprite_GearsCurrent_Plus1-1)
	cp TileSprite_GearsB
	jr z,TileSprite_GearsSetB
	ld a,TileSprite_GearsB
	jr TileSprite_GearsSet
TileSprite_GearsSetB:
	ld a,TileSprite_Gears
TileSprite_GearsSet:
	ld (TileSprite_GearsCurrent_Plus1-1),a



	ld de,&0000
	ld b,28
	call BackgroundSolidFill




	push hl
		ld a,TileSprite_Belt
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
	ld b,4
	call BackgroundFloodFillQuadSprite

	ld de,&0000
	ld b,8
	call BackgroundSolidFill

	push hl
		ld a,TileSprite_Belt
		call GetSpriteMempos
		ld de,8*7
		add hl,de	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
	ld b,4
	call BackgroundFloodFillQuadSprite





	;ld b,42-32
	;call BackgroundFloodFillQuadSprite

	ld de,&0000
	ld b,87-32-28+15
	call BackgroundSolidFill



	push hl
		ld a,TileSprite_Belt
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
	ld b,4
	call BackgroundFloodFillQuadSprite

	ld de,&0000
	ld b,8
	call BackgroundSolidFill

	push hl
		ld a,TileSprite_Belt
		call GetSpriteMempos
		ld de,8*7
		add hl,de	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
	ld b,4
	call BackgroundFloodFillQuadSprite



	ld de,&0000
	ld b,20
	call BackgroundSolidFill


	ld de,NewGradient2
	ld b,26
	ld c,%11111110 :ScrollFloor_Plus1
	call Akuyou_Background_Gradient

	push hl
		ld a,TileSprite_Floor
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,16
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de



;DONE _ NOW DO BITSHIFTS



	ld a,TileSprite_Belt
	call GetSpriteMempos	
	ld de,0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,4 
	call BitShifter
;	ld de,0007
;	add hl,de

	ld a,TileSprite_Belt
	call GetSpriteMempos	
	ld de,8*7;+0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,4
	call BitShifterReverse


ScrollStop_Floor: nop 

	ld a,TileSprite_Floor
	call GetSpriteMempos	

;	ld de,0007
;	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,16;42-32
	call BitShifterReverse


ret

ScrollStop:
	ld a,&C9
	ld (ScrollStop_Floor),a
	xor a
	ld (ScrollFloor_Plus1-1),a
	ld (VertMoveSpeed_Plus1-1),a
ret


ScrollGo:
	xor a
	ld (ScrollStop_Floor),a		;load a no-op into this pos (return for no movement)
	inc a
	ld (VertMoveSpeed_Plus1-1),a

	ld a,%11111110 
	ld (ScrollFloor_Plus1-1),a

ret

Background_Black:
	ld de,&0000
Background_Fill:
	ld b,200
	jp BackgroundSolidFill



Background_SmartBomb:
	ld e,d
jr Background_Fill









read "CoreBackground_Quad.asm"
read "CoreBackground_QuadSprite.asm"
read "CoreBackground_QuadSpriteVertical.asm"
read "CoreBackground_bitshifter.asm"
read "CoreBackground_BitShifterReverse.asm"
read "CoreBackground_Blackout.asm"
;read "CoreBackground_TileArray.asm"
read "CoreBackground_SolidFill.asm"
align 256,0

NewGradient:

;defb &F0,&F0	;1; first line
defb &0,&0	;1; first line
;defb 36,&D0	;2; line num, New byte
;defb 30,&70	;3
;defb 24,&A0	;4
defb 18,&50	;5
defb 12,&80	;6
defb 6,&20	;7
defb 2,&00	;8
defb 255


NewGradient2:

defb &0,&00	;1; first line
defb 24,&20	;10
defb 22,&80	;11
defb 20,&50	;12
defb 18,&A0	;13
defb 16,&70	;14
defb 14,&D0	;15

defb 12,&D0	;15
defb 10,&70	;14
defb 8,&A0	;13
defb 6,&50	;12
defb 4,&80	;11
defb 2,&20	;10
defb 0,&0	;10




defb 255


defw &0000
TileStripDataB:	; Screen can show 10, but some of an 11th will be shown
		; mid scroll
;defw 2*Tile_Size+Tile_Start
TileStripDataFirst:	
;defw 1*Tile_Size+Tile_Start,0*Tile_Size+Tile_Start
;;;;;defw  2*Tile_Size+Tile_Start, 2*Tile_Size+Tile_Start, 2*Tile_Size+Tile_Start
TileStripDataEndB:	
;defw  2*Tile_Size+Tile_Start
TileStripDataFinal:	
;defw &0000


;Tilestrip Control Data!
;defb &23 ; Move DIR
defb 0 ; Check for Recalc (0 or 15)
defw TileStripDataEndB ; End For Repeat
defb &2B ; Move DIR
defw &0000 ;TileBitshiftFrame2_Plus2
defw &0000 ;TileBitshiftFrame1_Plus2
defw 4*Tile_Size ; Bank B Offset
defw TileStripDataB ;CurrentPos
defw TileStripDataB ;StartOf Data
defw TileStripDataEndB ; End of data
TileStripB:		;Encoded Strip
defw 0,0,0,0,0,0,0,0,0,0,0,0




;Tilestrip Control Data!
defb 15 ; Check for Recalc (0 or 15)
defw TileStripDataB ; End For Repeat 
defb &23 ; Move DIR (INC HL / DEC HL)
;defb &2B ; Move DIR
defw &0000 ;TileBitshiftFrame2_Plus2
defw &0000 ;TileBitshiftFrame1_Plus2
defw 4*Tile_Size ; Bank B Offset
defw TileStripDataEndB ; CurrentPos
defw TileStripDataB ;	Start of data
defw TileStripDataEndB 	; end Of Data
TileStrip:		;Encoded Strip
defw 0,0,0,0,0,0,0,0,0,0,0,0

;Tile_Start Equ LevelTiles
Tile_Size Equ 16*8






GetSpriteMempos:
	ld c,a
	ld b,0
        or a ; only done to clear carry flag
	rl b
	rl c

	ld hl,LevelSprites
	ld d,h
	ld e,l
	add hl,bc
	add hl,bc	; 6 bytes per sprite
	add hl,bc
	inc hl
	inc hl
	inc hl
	inc hl
	ld a,(hl)
	inc hl
	ld h,(hl)
	ld l,a
	add hl,de
	ret


SetEyecount5:
	ld a,5
	jr SetEyecount
SetEyecount4:
	ld a,4
	jr SetEyecount
SetEyecount3:
	ld a,3
	jr SetEyecount

SetEyecount2:
	ld a,2
SetEyecount:
	ld (Eyecount),a
	ret



Eyecount:
defb 0

EyeAttackScrollStop:

	ld a,(Eyecount)		;check if eyes are all dead
	ret z


	ld (EyeScrollRestore_Plus2-2),hl
	push bc
	call Akuyou_GetLevelTime
	pop bc

	ld (EyeScrollRestorea_Plus1-1),a


	ld hl,LoopInfinite
	ld a,0				
	call Akuyou_SetLevelTime

push hl
push bc

	call ScrollStop



	;ld hl,HorizontalLaserDead
;	ld (OptionalHorizontalLaserDead+1),hl


	ld b,ObjectArraySize
	ld hl,ObjectArrayPointer	; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
EyeAttackScroll_NextObj
	inc h
	inc h
	inc h
	ld a,(hl)
	cp TwoFrameSprite+9	;Eye
	jp z,EyeAttackScroll_StopObject
	cp TwoFrameSprite+8	;Mouth
	jp z,EyeAttackScroll_StopObject
EyeAttackScroll_MoveNextObj:
	dec h
	dec h
	dec h
	inc l
	djnz EyeAttackScroll_NextObj
pop bc
pop hl

ret
EyeAttackScroll_StopObject:
	dec h
	ld a,&24
	ld (hl),a
	inc h
	jp EyeAttackScroll_MoveNextObj




;read "Core_ObjectReprogrammers.asm"



KillEye:
	ld a,(Eyecount)
	dec a	
	ld (Eyecount),a
	ret nz

;	jp KillMouths


KillMouths:
push hl
push bc

	call ScrollGo

	ld hl,LoopInfinite :EyeScrollRestore_Plus2
	ld a,10 :EyeScrollRestorea_Plus1
	call Akuyou_SetLevelTime




	ld b,ObjectArraySize
	ld hl,ObjectArrayPointer	; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
KillMouths_NextObj
	inc h
	inc h
	inc h
	ld a,(hl)
	cp TwoFrameSprite+8	;laser beam
	jr nz,NotMouth
	dec h
	dec h
	dec h
	xor a
	ld (hl),a
	inc l
	djnz,KillMouths_NextObj
NotMouth:
	dec h
	dec h
	dec h
	inc l
	djnz,KillMouths_NextObj
pop bc
pop hl

ret



SetScrollUp:
	push hl
	ld a,3
	call Akuyou_Background_SetScroll
	pop hl

ret

steakshit:
defb 0

hitsteak:
push af
	ld a,1
	ld (steakshit),a
pop af
ret

SteakCheck:
	ld a,(steakshit)
	or a
	ret nz
	jp ShowInsultAchievement






LevelText: 

db 16,"Level 4:"," "+&80
db 11,"Spiritual Stupidity"," "+&80
db 06,"                    "," "+&80
db &0




ShowLevelText:
	ld a,15 :LevelOnscreenTimer_Plus1
	cp 10
	ret c

	ld a,2
	call Akuyou_SpriteBank_Font

	ld bc,LevelText 
ShowLevelText_StartText:
	ld l,4
	ld a,1:LevelCharNum_Plus1
	ld i,a	; show up to 255 chars	
ShowLevelText_MoreText:
	ld a,(bc)

	or a
	jp z,ShowLevelText_AllOnscreen ; See if we have reached the end of the string

	ld h,a
	inc bc

	push hl
		call Akuyou_DrawText_LocateSprite
		call Akuyou_DrawText_PrintString
	pop hl
	inc l
	inc l
	inc l
	ld a,i
	dec a
	inc bc
	jp nz,ShowLevelText_MoreText

	ld a,(bc)
	or a
	jp z,ShowLevelText_AllOnscreen ; See if we have reached the end of the string
	ld a,(LevelCharNum_Plus1-1)
	inc a
	nop
	nop :ShowTextSpeedup_Plus1
ShowLevelTextNoSpeedup:
	ld (LevelCharNum_Plus1-1),a

ret
ShowLevelText_AllOnscreen:
	ld a,(LevelOnscreenTimer_Plus1-1)
	dec a
	ld (LevelOnscreenTimer_Plus1-1),a

	cp 10
	ret nz
;	ld a,0; only one page of text
;	ld (LevelOnscreenTimer_Plus1-1),a
;	ld a,1
;	ld (LevelCharNum_Plus1-1),a
	ld hl,InteractiveInsultsText
	ld (TextDisplayer_Plus2-2),hl


ret



org LevelOrigin+ &3ff0
jp LevelInit; - Level Start &3ff0
jp LevelLoop; - Level loop &3ff3
;jp null     ; - Level resume &3ff6
;jp null     ; - Level Shutdown &3ff9




limit &FFFF

;org &5D06
;defb 128
;defb 128/4
;defb 0
;defb 128
;save direct "T20-SC1.D02",LevelOrigin+ LevelDataStart,&4000-LevelDataStart	;address,size...}[,exec_address]
save "lz48\T20-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]

;T20-SC1.D02
;Extra sprites are T22-SC1.D02

