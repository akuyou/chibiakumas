read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &00 ;Start of the data which is stored on disk


org &4000
defs &4000
org &4000
LevelOrigin:
org LevelOrigin+ LevelDataStart
LevelSprites:
incbin "Sprites\STAGE19.SPR"




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

	cp 10
	jp z,ResetCPC
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


ShowInsultReset:
push hl
	ld hl,InsultReset
	push iy
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-7)
		cp 2	
		jr z,ShowInsultResetB	;Two players
		ld hl,InsultReset2	;bochan only	
		ld a,(iy+9)
		or a
		jr z,ShowInsultResetB2	;bochan only	

		ld hl,InsultReset	;Chibiko only
					;Chibiko only

ShowInsultResetB:
	pop iy
	ld a,1
	jr DoShowInsult

ShowInsultResetB2:
	pop iy
	ld a,2
	jr DoShowInsult



DoShowInsult:
	ld (OnscreenTextPointer_Plus2-2),hl
	ld (InsultPlayerNum_Plus1-1),a
	ld a,1
	ld (InsultCharNum_Plus1-1),a
	ld a,5
	ld (OnscreenTimer_Plus1-1),a
pop hl
ret


InsultReset:
db 1,"You Fucking Idiot!",13
db   "You just hit a RESET BUTTON!",13
db   "You do know what'll",13,"happen next, Right","?"+&80,9
db 1,"Bye","!"+&80
db 10
InsultReset2:
db 2,"Uh oh, You Hit RESET!",13,9
db   "You just hit a RESET BUTTON!",13
db   "Nooooooooooooooooooooooo","!"+&80,9
db 2,"Bye","!"+&80
db 10

InsultsTwoPlayer: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db 1,"Finally we're at the",13,"last level","!"+&80,9
db 2,"Akuma's to the rescue!",13,"Yeoooowm","!"+&80,9
db 1,"For fuck sake shut up!",13,"you talk such shit,",13,"why did I even bring you","?"+&80,9
db 2,"Cos otherwise you're be talking",13
db   "to yourself like some lonely",13
db   "old mad-woman","!"+&80,9
db 1,"Touche","!"+&80,0

InsultsBochanOnly:
db 2,"This Level is weird","!"+&80,9
db 2,"All the enemies are messed up","!"+&80,9
db 2,"And I don't like it","!"+&80,0

InsultsChibikoOnly: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db  "Oh great! You see what happens","?"+&80,9

db 1,"You hang around with silly brats",13,"and you get sucked into their",13,"demented dillusions","!"+&80,9

;db 2,"You're NO FUN","!"+&80,9
;db 1,"I'm the 'hero' in this game","!"+&80,9
;db 1,"You're just the 'extra",13,"crewmate' who'll die when",13,"things get serious","!"+&80,9
;db 2,"YES SIR!","!"+&80,9
;db 1,"Shut up now, the level's",13,"started & this text",13,"slows down the game","!"+&80,9
;db 2,"..","."+&80,0


InsultText1: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db 2," "," "+&80,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
defw Animator_ShortWaveUp	;1
defw Animator_ShortWaveDown	;2
defw Animator_ShortWaveLeft	;3
defw Animator_ShortWaveRight	;4
defw Animator_MoveThenStop     ;5
defw Animator_BulletBall     	;6
defw Animator_Cow		;7
defw Animator_Witch		;8
defw Animator_BlackHole		;9
defw Animator_Exploder		;10
defw Animator_Launcher		;11
defw Animator_ShittyGames	;12
defw Animator_Randomizer	;13
defw Animator_Worm		;14
defw Animator_IckyMusume	;15

Animator_ShortWaveDown:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000;%0001000		;Anim Freq
defb anmMove,&2B,0,0
defb anmMove,&2B,0,0
defb anmMove,&2B,0,0
defb anmMove,&2C,0,0
defb anmMove,&2D,0,0
defb anmMove,&2D,0,0
defb anmMove,&2D,0,0
defb anmMove,&2C,0,0
defb anmLoop,0,0,0	

Animator_ShortWaveUp:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000;%0001000		;Anim Freq
defb anmMove,&1B,0,0
defb anmMove,&1B,0,0
defb anmMove,&1B,0,0
defb anmMove,&1C,0,0
defb anmMove,&1D,0,0
defb anmMove,&1D,0,0
defb anmMove,&1D,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0	


Animator_ShortWaveRight:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000;%0001000		;Anim Freq
defb anmMove,&1D,0,0
defb anmMove,&1D,0,0
defb anmMove,&1D,0,0
defb anmMove,&25,0,0
defb anmMove,&2D,0,0
defb anmMove,&2D,0,0
defb anmMove,&2D,0,0
defb anmMove,&25,0,0
defb anmLoop,0,0,0				;End of loop


Animator_ShortWaveLeft:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000;%0001000		;Anim Freq
defb anmMove,&1B,0,0
defb anmMove,&1B,0,0
defb anmMove,&1B,0,0
defb anmMove,&23,0,0
defb anmMove,&2B,0,0
defb anmMove,&2B,0,0
defb anmMove,&2B,0,0
defb anmMove,&23,0,0
defb anmLoop,0,0,0				;End of loop


Animator_MoveThenStop:
defb %00001000		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmMove,&24,0,0
defb anmSwitchAnimator,0,0,0

Animator_BulletBall:
defb %00000010		;Anm Freq
defb anmProgram,prgFireMid2+fireSmallBurst,0,0
defb anmProgram,prgFireMid2+fireBurst,0,0
defb anmProgram,prgFireMid2+fireSmallBurst,0,0
defb anmSpawnObject,2,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Randomizer:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000001		;Anim Freq
defb anmMove
randdir: defb &1B,0,0
defb anmSwitchAnimator,0,0,0




Animator_Cow:
defb %00000010		;Anim Freq
defb anmMove,&10,0,0
defb anmMove,&10,0,0
defb anmMove,&18,0,0
defb anmMove,&20,0,0
defb anmMove,&3A,0,0
defb anmMove,&3A,0,0
defb anmMove,&3A,0,0
defb anmMove,&3B,0,0
defb anmSwitchAnimator,0,0,0
defb anmLoop,0,0,0				;End of loop


Animator_Witch:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,34,&3B,prgSmartBombableSpriteBank0
defb anmSpriteMoveProg,34,&0B,prgSmartBombableSpriteBank3
defb anmCondLoop,%00010000,0,0			;Repeat loop
defb anmSpawnObject,3,0,0
defb anmSpriteMoveProg,34,&2B,prgSmartBombableSpriteBank1	
defb anmSpriteMoveProg,34,&1B,prgSmartBombableSpriteBank2	
defb anmLoop,0,0,0				;End of loop


Animator_IckyMusume:
defb %00000010		;Anim Freq
defb anmProgram,prgFireFast+fireOuterBurst,0,0;prgSmartBombableSpriteBank0
defb anmProgram,prgSmartBombableSpriteBank1,0,0
defb anmProgram,prgSmartBombableSpriteBank2,0,0
defb anmProgram,prgFireFast+fireOuterBurst,0,0;prgSmartBombableSpriteBank0
defb anmProgram,prgSmartBombableSpriteBank1,0,0
defb anmProgram,prgSmartBombableSpriteBank2,0,0
defb anmProgram,prgFireFast+fireOuterBurst,0,0;prgSmartBombableSpriteBank0
defb anmProgram,prgSmartBombableSpriteBank1,0,0
defb anmProgram,prgSmartBombableSpriteBank3,0,0
defb anmLoop,0,0,0

Animator_BlackHole:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,10,&25,prgSpriteBank1
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpriteMoveProg,10,&25,prgSpriteBank0

defb anmSpriteMoveProg,10,&25,prgSpriteBank3
defb anmSpriteMoveProg,10,&25,prgSpriteBank2
defb anmSpawnObject,5,0,0
defb anmSpriteMoveProg,10,&25,prgSpriteBank3
defb anmSpriteMoveProg,10,&25,prgSpriteBank0
defb anmSpriteMoveProg,10,&25,prgSpriteBank3
defb anmSpriteMoveProg,10,&25,prgSpriteBank2
defb anmSpawnObject,5,0,0
defb anmSpriteMoveProg,10,&25,prgSpriteBank3
defb anmSpriteMoveProg,10,&25,prgSpriteBank0
defb anmLoop,0,0,0

Animator_Worm:
defb %00000100		;Anim Freq
defb anmSpriteMoveProg,30,&2C,prgSpriteBank3
defb anmSpriteMoveProg,30,&2C,prgSpriteBank1
defb anmSpriteMoveProg,30,&2C,prgSpriteBank3
defb anmSpriteMoveProg,30,&2C,prgSpriteBank1
defb anmSpriteMoveProg,30,&2C,prgSpriteBank3
defb anmSpriteMoveProg,30,&2C,prgSpriteBank1
defb anmSpriteMoveProg,30,&24,prgSpriteBank2
defb anmSpriteMoveProg,30,&24,prgFireMid2+fireBurst 
defb anmSpriteMoveProg,30,&24,prgFireMid2+fireBurst 
defb anmSpriteMoveProg,30,&24,prgFireMid2+fireBurst 
defb anmSpriteMoveProg,30,&24,prgFireMid2+fireBurst 
defb anmSpriteMoveProg,30,&24,prgFireMid2+fireBurst 
defb anmSpriteMoveProg,30,&24,prgFireMid2+fireBurst 
defb anmSpriteMoveProg,30,&24,prgSpriteBank2
defb anmSpriteMoveProg,30,&24,prgSpriteBank1
defb anmLoop,0,0,0
				;End of loop
Animator_Exploder:
defb %00000010		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0

defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmProgram,prgFireFast+fireBurst,0,0
defb anmKill,0,0,0
defb anmLoop,0,0,0
Animator_Launcher:
defb %00000010		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,6,0,0
defb anmLoop,0,0,0

HighSpeedLauncher:
	ld a,1
	ld (Animator_ShittyGames),a
ret


Animator_ShittyGames:
defb %00000010		;Anim Freq
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmCondLoop,%00010000,0,0
defb anmMove,&24,0,0
defb anmLoop,0,0,0





SetLongWave:
ld a, %00010000
ld (Animator_ShortWaveDown),a
ld (Animator_ShortWaveUp),a
ld (Animator_ShortWaveRight),a
ld (Animator_ShortWaveLeft),a

ret

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
	

			call AchievementHandlerB
		pop bc
	pop hl
ret
ObjectDeadHandler:


	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y


	ld a,iyh

	cp TwoFrameSprite+39
	jp z,ResetDead
AchievementHandlerB:
	cp TwoFrameSprite+37
	jp z,HorizontalLaserDead

ret
ResetDead:
	jp ShowInsultReset
ResetCPC:
	jp 0



InitOptionalHorizontalLaserDead:
	push hl
		ld hl,null
		ld (OptionalHorizontalLaserDead+1),hl
	pop hl
	ret
OptionalHorizontalLaserDead:	;used to kill laserbeam as it fires - for if player predestroyed canon
	jp null ;***

HorizontalLaserDead:
push hl
push bc

	ld hl,HorizontalLaserDead
	ld (OptionalHorizontalLaserDead+1),hl


	ld b,ObjectArraySize
	ld hl,ObjectArrayPointer	; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
HorizontalLaserDead_NextObj
	inc h
	inc h
	inc h
	ld a,(hl)
	cp TwoFrameSprite+19	;laser beam
	jr nz,NotLaserBeam
	dec h
	dec h
	dec h
	xor a
	ld (hl),a
	inc l
	djnz,HorizontalLaserDead_NextObj
NotLaserBeam:
	dec h
	dec h
	dec h
	inc l
	djnz HorizontalLaserDead_NextObj
pop bc
pop hl

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



defb 0,evtReprogram_PowerupSprites,128+1,128+2,128+3,128+0	; Define powerup sprites (Drone(2)/speed(2)/power(1)/coin)
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
defb 	evtSetProgMoveLife,prgNothing,&2C,lifDeadly+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBank_Save,2

; Unvader Cow
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&44,lifEnemy+12	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+13
defb 	evtSettingsBank_Save,3


; Black hole
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&25,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+10
defb 	evtSettingsBank_Save,4

;VoidObject
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst,mveSeaker,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,FourFrameSprite+8
defb 	evtSettingsBank_Save,5



;HamsterBomb
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&3C,lifEnemy+7	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,6

;Hamster launcher
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&23,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,11
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+7
defb 	evtSettingsBank_Save,7




;Disk L
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&39,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,13
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+25
defb 	evtSettingsBank_Save,8



;Shit Flinging Monkey
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&2C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,12
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+26
defb 	evtSettingsBank_Save,10


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Soldier
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireSingleFastSouth,&2C,lifEnemy+15	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,FourFrameSprite+4
defb 	evtSettingsBankEXT_Save,0

; CrystalTubes
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst ,&2C,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+5
defb 	evtSettingsBankEXT_Save,1



; LavaBubble
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireSmallBurst ,&1C,lifEnemy+13	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,FourFrameSprite+6
defb 	evtSettingsBankEXT_Save,2


; KamiSagi (Return)
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireLeftWide ,&23,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+11
defb 	evtSettingsBankEXT_Save,3


; EyeInTheSky
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&2C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,FourFrameSprite+12
defb 	evtSettingsBankEXT_Save,4


; Necromancer (Return)
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,&25,lifEnemy+50	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,FourFrameSprite+14
defb 	evtSettingsBankEXT_Save,5


; Dark Spirit (return)
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireTopWide,&1C,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSettingsBankEXT_Save,6


; Eggplant Bombler
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&23,lifEnemy+25	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+18
defb 	evtSettingsBankEXT_Save,7

; Skeleton Crawler (return)
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireRightWide,&25,lifEnemy+35	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+21
defb 	evtSettingsBankEXT_Save,8

; TogeTogeTenticle
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&2C,lifEnemy+15	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBankEXT_Save,9

; Nicohime - Dark Ressurection!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst,&2C,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+27
defb 	evtSettingsBankEXT_Save,10

; Nicohime - Dark Ressurection!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireLeftWide,&24,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+29
defb 	evtSettingsBankEXT_Save,11


; Chibiko clone
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireHyper+fireSingleFastEast ,&25,lifEnemy+45	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+31
defb 	evtSettingsBankEXT_Save,12



; Bullet-Ball
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&2E,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSetSprite,FourFrameSprite+20
defb 	evtSettingsBankEXT_Save,13


; Majokko
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireLeft,mveMisc+&23,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,34
defb 	evtSettingsBankEXT_Save,14

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Start of level data

defb 0,evtReprogramShotToDeath
defw ObjectDeadHandler


defb 0,evtReprogramSmartBombed
defw SmartBombCustom



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
	defb &54,&4E,&52,&4B

	defb evtReprogramPalette,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
	defb &54,&4C,&4A,&4B


	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
	defb &54,&4C,&4A,&4B



	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0 ; no of switches
	defb 0	;delays			
	defb &54,&4C,&4E,&4B




;TEST

; IckyMusume
;defb 10,evtMultipleCommands+5					; 3 commands at the same timepoint
;defb 	evtSettingsBankEXT_Load+11
;defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst ,&1C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
;defb 	evtSetObjectSize,32
;defb 	evtSetAnimator,15
;defb 	evtSingleSprite,35,80+24,200+24
;

; Capibara Mecha Walker
;defb 10,evtMultipleCommands+4
;defb 	evtSettingsBankExt_Load+7
;defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&25,lifEnemy+45	
;defb 	evtSetObjectSize,32
;defb 	evtSingleSprite,FourFrameSprite+38,0+24,4+24



;TEST



;defb 2,evtCallAddress
;defw RasterColorsStartPalleteFlip



; Powerup 
;defb 50,evtMultipleCommands+5
;defb 	evtSetProgMoveLife,prgBonus,&25,lifEnemy+60
;defb 	evtSetObjectSize,24
;defb 	evtSetAnimator,0
;defb 	evtAddToForeground
;defb 	evtSingleSprite,TwoFrameSprite+ 3,0+24-6,50+24-12	; 



;test
;defb 5
;defb evtJumpToNewTime	
;defw Section4				; pointer
;defb 0					; new time




; Soldier
defb 10,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+7






; Skeleton Crawler
defb 20,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+8
defb 	evtSingleSprite,TwoFrameSprite+21,0+24,100+24


; Powerup 
defb 25,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&25,lifEnemy+60
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 3,0+24-6,50+24-12	; 


; Eggplant Bombler
defb 30,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+7
defb 	evtSingleSprite,TwoFrameSprite+18,160+24,4+24





; Skeleton Crawler
defb 40,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+8
defb 	evtSingleSprite,TwoFrameSprite+21,0+24,180+24




; Soldier
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+11


; Powerup 
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&25,lifEnemy+60
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 1,0+24-6,50+24-12	; 


; Powerup 
defb 50,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&23,lifEnemy+60
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 2,160+24-6,50+24-12	; 

; Soldier
defb 55,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+3

; Soldier
defb 60,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+7

; Soldier
defb 65,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+5
; Soldier
defb 70,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+9


; Impossiboat
defb 80,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSettingsBankEXT_Load+11
defb 	evtSetProgMoveLife,prgFireSlow+fireBottom,&23,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,0
defb 	evtSingleSprite,TwoFrameSprite+28,160+24,4+24



; Skeleton Crawler
defb 90,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+8
defb 	evtSingleSprite,TwoFrameSprite+21,0+24,100+24




; Powerup 
defb 100,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&25,lifEnemy+60
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 2,0+24-6,50+24-12	; 




; Powerup 
defb 100,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&23,lifEnemy+60
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 1,160+24-6,50+24-12	; 



; Soldier
defb 100,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+3


; TogeTogeTenticle
defb 110,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+9
defb 	evtSingleSprite+5

; TogeTogeTenticle
defb 120,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+9
defb 	evtSingleSprite+9

; Skeleton Crawler
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+8
defb 	evtSingleSprite,TwoFrameSprite+21,0+24,140+24



; Impossiboat
defb 140,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSettingsBankEXT_Load+11
defb 	evtSetProgMoveLife,prgFireSlow+fireBottom,&23,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,0
defb 	evtSingleSprite,TwoFrameSprite+28,160+24,4+24

; TogeTogeTenticle
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+9
defb 	evtSingleSprite+5


; Skeleton Crawler
defb 160,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+8
defb 	evtSingleSprite,TwoFrameSprite+21,0+24,60+24


; Eggplant Bombler
defb 170,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+7
defb 	evtSingleSprite,TwoFrameSprite+18,160+24,4+24

; Skeleton Crawler
;defb 170,evtMultipleCommands+2
;defb 	evtSettingsBankExt_Load+8
;defb 	evtSingleSprite,TwoFrameSprite+21,0+24,80+24

; TogeTogeTenticle
defb 180,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+9
defb 	evtSingleSprite+7


; Soldier
defb 190,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+0
defb 	evtSingleSprite+3
defb 	evtSingleSprite+11


; Nikohime Dark Ressurection
defb 200,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+10
defb 	evtSingleSprite+3

; TogeTogeTenticle
defb 210,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+9
defb 	evtSingleSprite+9

; Nikohime Dark Ressurection
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+10
defb 	evtSingleSprite+9

; TogeTogeTenticle
defb 230,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+9
defb 	evtSingleSprite+5


; Nikohime Dark Ressurection
defb 240,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+10
defb 	evtSingleSprite+6



; Eggplant Bombler
defb 250,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+7
defb 	evtSingleSprite,TwoFrameSprite+18,160+24,4+24

Section2:

;---------------------------------------------------------------------------------------------------------


; Fantasy Level

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
defw SetTile2


	defb 20,evtMultipleCommands+4			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4F,&5A,&4B

	defb evtReprogramPalette,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4F,&5A,&4B

	defb evtReprogramPalette,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4F,&5A,&4B

	defb evtReprogramPalette,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4F,&5A,&4B



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



; Majokko Cow attack!
defb 30,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+14
defb 	evtSingleSprite,34,160+24,24+100


; CrystalTubes
defb 40,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+1
defb 	evtSingleSprite+7


; Shit Flinging Monkey
defb 50,evtMultipleCommands+2
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite+8

;Kamisagi (Return)
defb 60,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+3
defb 	evtSingleSprite,TwoFrameSprite+11,160+24,100+24





; IckyMusume
defb 70,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSettingsBankEXT_Load+11
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst ,&1C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,15
defb 	evtSingleSprite,35,80+24,200+24



; Blackhole
defb 80,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,34,0+24,24+50


;Kamisagi (Return)
defb 90,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+3
defb 	evtSingleSprite,TwoFrameSprite+11,160+24,50+24







; Shit Flinging Monkey
defb 100,evtMultipleCommands+2
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite+6



; EbichuCannon
defb 110,evtMultipleCommands+2
defb 	evtSettingsBank_Load+7
defb 	evtSingleSprite,128+7,160+24,24

; CrystalTubes
defb 120,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+1
defb 	evtSingleSprite+4



;Kamisagi (Return)
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+3
defb 	evtSingleSprite,TwoFrameSprite+11,160+24,150+24



; Lava Bubble
defb 140,evtMultipleCommands+5
defb 	evtSettingsBankExt_Load+2
defb 	evtSingleSprite,FourFrameSprite+6,20+24,200+24
defb 	evtSingleSprite,FourFrameSprite+6,60+24,200+24
defb 	evtSingleSprite,FourFrameSprite+6,100+24,200+24
defb 	evtSingleSprite,FourFrameSprite+6,140+24,200+24



; Majokko Cow attack!
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+14
defb 	evtSingleSprite,34,160+24,24+50


; Blackhole
defb 160,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,34,0+24,24+150


; EbichuCannon
defb 170,evtMultipleCommands+2
defb 	evtSettingsBank_Load+7
defb 	evtSingleSprite,128+7,160+24,24

; CrystalTubes
defb 180,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+1
defb 	evtSingleSprite+9


; Lava Bubble
defb 190,evtMultipleCommands+5
defb 	evtSettingsBankExt_Load+2
defb 	evtSingleSprite,FourFrameSprite+6,40+24,200+24
defb 	evtSingleSprite,FourFrameSprite+6,80+24,200+24
defb 	evtSingleSprite,FourFrameSprite+6,120+24,200+24
defb 	evtSingleSprite,FourFrameSprite+6,160+24,200+24


; IckyMusume
defb 200,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSettingsBankEXT_Load+11
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst ,&1C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,15
defb 	evtSingleSprite,35,40+24,200+24


; Shit Flinging Monkey
defb 212,evtMultipleCommands+2
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite+7

; IckyMusume
defb 225,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSettingsBankEXT_Load+11
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst ,&1C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,15
defb 	evtSingleSprite,35,120+24,200+24

; EbichuCannon
defb 230,evtMultipleCommands+2
defb 	evtSettingsBank_Load+7
defb 	evtSingleSprite,128+7,160+24,24

;Kamisagi (Return)
defb 240,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+3
defb 	evtSingleSprite,TwoFrameSprite+11,160+24,80+24




;Kamisagi (Return)
defb 240,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+3
defb 	evtSingleSprite,TwoFrameSprite+11,160+24,160+24



; Majokko Cow attack!
defb 250,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+14
defb 	evtSingleSprite,34,160+24,24+100

; EbichuCannon
defb 5,evtMultipleCommands+2
defb 	evtSettingsBank_Load+7
defb 	evtSingleSprite,128+7,160+24,24


Section3:

;---------------------------------------------------------------------------------------------------------



; Tech Noir 

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
defw SetTile3


	defb 20,evtMultipleCommands+4			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&58,&5B,&4B

	defb evtReprogramPalette,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5B,&4B

	defb evtReprogramPalette,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5B,&4B

	defb evtReprogramPalette,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&58,&5B,&4B



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




;defb	30,evtCallAddress			;Call a memory location
;defw	SetLongWave



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Define Tech enemies
; Worminator W1000
defb 30,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&2C,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,14
defb 	evtAddToForeground
defb 	evtSetSprite,30
defb 	evtSettingsBank_Save,9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




; cyberpunkichu
defb 30,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+4
defb 	evtSetObjectSize,32
defb 	evtSetSprite,FourFrameSprite+32
defb 	evtSingleSprite+6


; cyberpunkichu
defb 40,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+4
defb 	evtSetObjectSize,32
defb 	evtSetSprite,FourFrameSprite+32
defb 	evtSingleSprite+9

; Capibara Mecha Walker
defb 45,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+7
defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&25,lifEnemy+45	
defb 	evtSetObjectSize,32
defb 	evtSingleSprite,FourFrameSprite+38,0+24,4+24


; Worminator W1000
defb 50,evtMultipleCommands+2
defb 	evtSettingsBank_Load+9
defb 	evtSingleSprite+9





; Mecha Angler Fish
defb 60,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+11
defb 	evtSetProg,prgFireMid+fireRightWide
defb 	evtSetAnimator,4
defb 	evtSingleSprite,TwoFrameSprite+33,0+24,110+24



;Laser Canon Start
defb 69,evtCallAddress			;Call a memory location
defw	InitOptionalHorizontalLaserDead

;Laser Canon
defb 70,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgNothing,&2C,lifEnemy+60;60	
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+37,160-16+24,1


; Laser Canon Horizontal Beam
defb 78,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&2C,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
;defb 	evtSingleSprite,TwoFrameSprite+19,-6*1+160-16+24,8*8+1
defb 	evtTileSprite+12,-12*12+160-14+24,8*8+2,12,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19
defb 		TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19
defb 78,evtCallAddress			;Call a memory location
defw	OptionalHorizontalLaserDead



; EyeInTheSky
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+4
defb 	evtSingleSprite+7




; Worminator W1000
defb 100,evtMultipleCommands+2
defb 	evtSettingsBank_Load+9
defb 	evtSingleSprite+7


; Mecha Angler Fish
defb 110,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+11
defb 	evtSetProg,prgFireMid+fireRightWide
defb 	evtSetAnimator,4
defb 	evtSingleSprite,TwoFrameSprite+33,0+24,30+24

; Capibara Mecha Walker
defb 120,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+7
defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&25,lifEnemy+45	
defb 	evtSetObjectSize,32
defb 	evtSingleSprite,FourFrameSprite+38,0+24,4+24


; Worminator W1000
defb 130,evtMultipleCommands+2
defb 	evtSettingsBank_Load+9
defb 	evtSingleSprite+5


; Mecha Angler Fish
defb 135,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+11
defb 	evtSetProg,prgFireMid+fireRightWide
defb 	evtSetAnimator,4
defb 	evtSingleSprite,TwoFrameSprite+33,0+24,60+24

; BikerFish
defb 140,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+11
defb 	evtSingleSprite,TwoFrameSprite+29,160+24,30+24


; BikerFish
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+11
defb 	evtSingleSprite,TwoFrameSprite+29,160+24,140+24


; Mecha Angler Fish
defb 155,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+11
defb 	evtSetProg,prgFireMid+fireRightWide
defb 	evtSetAnimator,4
defb 	evtSingleSprite,TwoFrameSprite+33,0+24,150+24


; BikerFish
defb 160,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+11
defb 	evtSingleSprite,TwoFrameSprite+29,160+24,90+24


; BikerFish
defb 170,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+11
defb 	evtSingleSprite,TwoFrameSprite+29,160+24,170+24


; Mecha Angler Fish
defb 175,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+11
defb 	evtSetProg,prgFireMid+fireRightWide
defb 	evtSetAnimator,4
defb 	evtSingleSprite,TwoFrameSprite+33,0+24,180+24


; BikerFish
defb 180,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+11
defb 	evtSingleSprite,TwoFrameSprite+29,160+24,60+24


; BikerFish
defb 190,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+11
defb 	evtSingleSprite,TwoFrameSprite+29,160+24,110+24

; Capibara Mecha Walker
defb 195,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+7
defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&25,lifEnemy+45	
defb 	evtSetObjectSize,32
defb 	evtSingleSprite,FourFrameSprite+38,0+24,4+24








;Laser Canon Start
defb 199,evtCallAddress			;Call a memory location
defw	InitOptionalHorizontalLaserDead

;Laser Canon
defb 200,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgSpecial,&2C,lifEnemy+1;60	
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+37,160-16+24,1


; cyberpunkichu
defb 205,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+4
defb 	evtSetObjectSize,32
defb 	evtSetSprite,FourFrameSprite+32
defb 	evtSingleSprite+4


; Laser Canon Horizontal Beam
defb 208,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&2C,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
;defb 	evtSingleSprite,TwoFrameSprite+19,-6*1+160-16+24,8*8+1
defb 	evtTileSprite+12,-12*12+160-14+24,8*8+2,12,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19
defb 		TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19,TwoFrameSprite+19
defb 208,evtCallAddress			;Call a memory location
defw	OptionalHorizontalLaserDead



; Worminator W1000
defb 210,evtMultipleCommands+2
defb 	evtSettingsBank_Load+9
defb 	evtSingleSprite+10

; EyeInTheSky
defb 215,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+4
defb 	evtSingleSprite+7



; Worminator W1000
defb 220,evtMultipleCommands+2
defb 	evtSettingsBank_Load+9
defb 	evtSingleSprite+3

; Capibara Mecha Walker
defb 225,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+7
defb 	evtSetProgMoveLife,prgFireMid2+fireBottomWide,&25,lifEnemy+45	
defb 	evtSetObjectSize,32
defb 	evtSingleSprite,FourFrameSprite+38,0+24,4+24

; EyeInTheSky
defb 230,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+4
defb 	evtSingleSprite+7


; cyberpunkichu
defb 235,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+4
defb 	evtSetObjectSize,32
defb 	evtSetSprite,FourFrameSprite+32
defb 	evtSingleSprite+6


; cyberpunkichu
defb 245,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+4
defb 	evtSetObjectSize,32
defb 	evtSetSprite,FourFrameSprite+32
defb 	evtSingleSprite+8



; Mecha Angler Fish
defb 250,evtMultipleCommands+4
defb 	evtSettingsBankExt_Load+11
defb 	evtSetProg,prgFireMid+fireRightWide
defb 	evtSetAnimator,4
defb 	evtSingleSprite,TwoFrameSprite+33,0+24,90+24



Section4:

defb 5,evtCallAddress
defw UseResetButton

ResetOn:

; Reset Button
defb 7,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial	 ,&25,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+39
defb 	evtSettingsBankEXT_Save,12

ResetOff:

;---------------------------------------------------------------------------------------------------------

; Alchemetic

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
defw SetTile4


	defb 20,evtMultipleCommands+4			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4C,&4A,&4B

	defb evtReprogramPalette,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4C,&4A,&4B

	defb evtReprogramPalette,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4C,&4A,&4B

	defb evtReprogramPalette,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4C,&4A,&4B



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

defb 30,evtCallAddress
defw HighSpeedLauncher

;Drones
defb 30,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&39,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,13
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+43
defb 	evtSettingsBank_Save,8

;Drone Coil
defb 30,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&2C,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,12
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+23
defb 	evtSettingsBank_Save,10







; Burst-Gear R
defb 40,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1A,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,160+24,180+24


; Dark Spirit (Return)
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,20+24,200+24



; Burst-Gear L
defb 60,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1E,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,0+24,180+24


; Dark Spirit (Return)
defb 70,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,120+24,200+24

; Dark Spirit (Return)
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,60+24,200+24

; Dark Spirit (Return)
defb 90,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,100+24,200+24

; Burst-Gear
defb 95,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1A,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,160+24,180+24

; Burst-Gear L
defb 100,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1E,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,0+24,180+24



; BulletBall
defb 110,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+13
defb 	evtSingleSprite,FourFrameSprite+20,0+1,1



; Burst-Gear
defb 115,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1A,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,160+24,180+24

; Burst-Gear L
defb 120,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1E,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,0+24,180+24




; Dark Spirit (Return)
defb 125,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,40+24,200+24

; Burst-Gear L
defb 135,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1E,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,0+24,180+24




; Necromancer (Return)
defb 140,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+5
defb 	evtSingleSprite,FourFrameSprite+14,0+24,50+24


; BulletBall
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+13
defb 	evtSingleSprite,FourFrameSprite+20,0+1,1

; Burst-Gear
defb 160,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1A,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,160+24,180+24

; Drone Coil
defb 170,evtMultipleCommands+2
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite+5


; Dark Spirit (Return)
defb 180,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,80+24,200+24

; Dark Spirit (Return)
defb 190,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+6
defb 	evtSingleSprite,TwoFrameSprite+15,140+24,200+24


; Burst-Gear L
defb 200,evtMultipleCommands+3
defb 	evtSettingsBankExt_Load+9
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1E,lifEnemy+40
defb 	evtSingleSprite,TwoFrameSprite+24,0+24,180+24


; BulletBall
defb 210,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+13
defb 	evtSingleSprite,FourFrameSprite+20,0+1,1



; Necromancer (Return)
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+5
defb 	evtSingleSprite,FourFrameSprite+14,0+24,50+24

; Drone Coil
defb 230,evtMultipleCommands+2
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite+9


; Necromancer (Return)
defb 240,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+5
defb 	evtSingleSprite,FourFrameSprite+14,0+24,100+24



; Chibiko clone / Reset Button
defb 250,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+12
defb 	evtSingleSprite
ResetButton1: defb 	TwoFrameSprite+31;TwoFrameSprite+39 ;
defb 0+24,50+24



; Necromancer (Return)
defb 0,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+5
defb 	evtSingleSprite,FourFrameSprite+14,0+24,50+24


; Drone Coil
defb 10,evtMultipleCommands+2
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite+7




; Necromancer (Return)
defb 20,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+5
defb 	evtSingleSprite,FourFrameSprite+14,0+24,150+24

; Chibiko clone / Reset Button
defb 30,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+12
defb 	evtSingleSprite
ResetButton2: defb 	TwoFrameSprite+31;TwoFrameSprite+39 ;
defb 0+24,100+24



LevelEnding:
defb 65,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change

LevelEndAnim:
defb 65,evtMultipleCommands+4			; 3 commands at the same timepoint
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb evtSingleSprite,60,80+24,10+24	; 	



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
	ld hl,	&01F1				;load level 2
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


	ld a,3
	call Akuyou_Background_SetScroll


	call AkuYou_Player_GetPlayerVars

	;flip around our play character
	ld a,80+24-20
	ld (iy+1),a
	ld a,80+24+20
	ld (iy+1+Akuyou_PlayerSeparator),a

	ld a,160+24
	ld (iy+0),a
	ld (iy+Akuyou_PlayerSeparator),a
	ld (iy+0+Akuyou_PlayerSeparator),a


	ld a,128+2
	ld (iy+8),a
	ld (iy+8+Akuyou_PlayerSeparator),a



	ld a,&4C
	ld (iy+15),a
	ld (iy+15+Akuyou_PlayerSeparator),a
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
	ld de,Event_SavedSettingsB	;Saved Settings B
	call AkuYou_Event_StreamInit


	call Akuyou_Music_Restart

;	ld hl, LevelSprites	
;	ld de, Akuyou_PlayerSpritePos
;	call AkuYou_SpritePointerInit



	call Akuyou_ScreenBuffer_Init
;	ld (BackgroundFloodFillQuad_Minus1+1),hl
;	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
	ld (BackgroundFloodFillQuadSpriteV_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	ld (Background_Blackout_Minus1+1),hl
	call Akuyou_RasterColors_Init

	call AkuYou_Player_GetPlayerVars


	ld b,1
;	ld de,InsultHurryBochan
	ld hl,InsultsTwoPlayer
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SetInsults
	ld hl,InsultsBochanOnly
	ld b,2
;	ld de,InsultHurryBochan
	ld a,(iy+9)
	or a
	jr z,SetInsults
	ld b,1 
	ld hl,InsultsChibikoOnly
;	ld de,InsultHurry
SetInsults:
	ld a,b
	ld (InsultPlayerNum_Plus1-1),a
;	ld (PlayerCountSpecificInsultsB_Plus2-2),de
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


	ld a,r
	ld (RandSeedB_Plus1-1),a


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
;	ld (BackgroundFloodFillQuad_Minus1+1),hl
;	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
	ld (BackgroundFloodFillQuadSpriteV_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	ld (Background_Blackout_Minus1+1),hl

	ld hl,RandomDirections
	ld a,r
;	push af
		xor 1 :RandSeedB_Plus1
		and %11110000
		rrca
		rrca
		rrca
		rrca
		ld l,a
		ld a,(hl)
		ld (randdir),a
;	pop af
	ld (RandSeedB_Plus1-1),a
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


SetTile2:
	ld a,TileSprite_Vert2
	ld (TileSprite_VertNext_Plus1-1),a
	ld a,TileSprite_Vert2b
	ld (TileSprite_VertNextB_Plus1-1),a

ret
SetTile3:
	ld a,TileSprite_Vert3
	ld (TileSprite_VertNext_Plus1-1),a
	ld a,TileSprite_Vert3b
	ld (TileSprite_VertNextB_Plus1-1),a
ret
SetTile4:
	ld a,TileSprite_Vert4
	ld (TileSprite_VertNext_Plus1-1),a
	ld a,TileSprite_Vert4b
	ld (TileSprite_VertNextB_Plus1-1),a
ret


;TileSprite_Floor equ 40
;TileSprite_Gears equ 41
;TileSprite_Belt equ 42
TileSprite_Vert1 equ 44
TileSprite_Vert2 equ 45
TileSprite_Vert3 equ 46
TileSprite_Vert4 equ 47
TileSprite_Vert1b equ 48
TileSprite_Vert2b equ 49
TileSprite_Vert3b equ 50
TileSprite_Vert4b equ 51
Background_DrawALT:



;	call Akuyou_Timer_GetTimer
;	and %00000100
;	jp z,Background_DrawALTParalaxDone
;
;	ld a,(ThisParalaxLineUpdate_Plus2-2)
;
;	dec a
;	cp ThisParalaxLinePre
;	jr nz,NoParalaxRepeatB
;
;
;	ld a,LastParalaxLinePre
;	NoParalaxRepeatB:
;	ld (ThisParalaxLineUpdate_Plus2-2),a
;
;
;Background_DrawALTParalaxDone:
;

	call UpdateParalax

	;Tree!

	push hl
		ld b,TileSprite_Vert1b :TileSprite_VertNextB_Plus1
		ld a,TileSprite_Vert1 :TileSprite_VertNextAuto_Plus1
		cp b
		ld a,TileSprite_Vert1 :TileSprite_VertNext_Plus1
		jr z,TileSprite_VertSwapB

		ld a,b
TileSprite_VertSwapB:
		ld (TileSprite_VertNextAuto_Plus1-1),a
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
	jp BackgroundFloodFillQuadSpriteVertical



;ret
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

;EnableAltBackground
;	push hl
;	ld hl,Background_DrawAlt
;	ld (BacgroundRender_Plus2-2),hl
;	pop hl
;	ret
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
	jr 
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
	jp Background_DrawAlt


Background_Black:
	ld de,&0000
Background_Fill:
	ld b,200
	jp BackgroundSolidFill



Background_SmartBomb:
	ld e,d
jr Background_Fill









;read "CoreBackground_Quad.asm"
;read "CoreBackground_QuadSprite.asm"
read "CoreBackground_QuadSpriteVerticalParalax.asm"
;read "CoreBackground_bitshifter.asm"
;read "CoreBackground_BitShifterReverse.asm"
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

align 256,0
RandomDirections:
defb  &79,&7C,&7F,&67,&4F,&4C,&49,&61


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
UseResetButton:

	push iy
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-11)
	pop iy
	and %00000011
	cp 2
	jr nz,DontUseResetButton
	ld a,TwoFrameSprite+39 
	ld (ResetButton1),a
	ld (ResetButton2),a
	ld a,6
	ld hl,ResetOn
	call Akuyou_SetLevelTime
	dec hl
ret
DontUseResetButton:
	ld a,6
	ld hl,ResetOff
	call Akuyou_SetLevelTime
	dec hl
ret
;SetScrollUp
;	push hl
;	ld a,3
;	call Akuyou_Background_SetScroll
;	pop hl
;
;ret





LevelText: 

db 16,"Level 5:"," "+&80
db 15,"Delusion X"," "+&80
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
save "lz48/T30-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]
;T20-SC1.D02
;Extra sprites are T22-SC1.D02

