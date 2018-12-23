read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &0 ;Start of the data which is stored on disk



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
incbin "Sprites\STAGE13.SPR"



;org LevelOrigin+&3500
;limit &3000
;org &2E00
;Event_SavedSettings:
;defs 4*16,&00
;db 1
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
	ld hl,&0f16
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
	inc l
	inc l
	inc l
InteractiveInsultsCantDraw:
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

ShowInsultSun:
push hl
	ld hl,InsultSun
	ld a,1
	jr DoShowInsult

ShowInsultAchievement:
	push iy
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)
	;Achievements (Wxx54321)	-10
	or            %00000010
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
db 4,"  Achievement Unlocked:",13
db   "Icky Musume Extermination!",13
db   "   (Gesso Gesso Gesso!",")"+&80
db 0
InsultSun: 
db "I Knew it! You heard me say it!",13,"I said that sun was trouble!",13,"I'm going to kick in the as...",13,"er.. in the chromosphere!! ","!"+&80,0

InsultsTwoPlayer: 
db 2,"A Smily sun!","!"+&80,9
db 1,"Damn that things anoying!",13
db   "At least it seems light from",13
db   "craply drawn suns don't hurt vampires","!"+&80,9
db 2,"It looks happy!","!"+&80,9
db 1,"Suure! I reckon it's planning",13
db   "the nasty things it'll do to us","!"+&80,0

InsultsBochanOnly:
db "Everythings so cute!",13,"It makes me want to eat it all","!"+&80,0

InsultsChibikoOnly: 
db  "Look at that grinning Sun","!"+&80,9
db 1,"I'm going to give it 3 seconds",","+&80,9
db 1,"Exactly 3 fucking seconds",13
db "to wipe that stupid looking grin",13
db "off it's face or I will... umm.."," "+&80,9
db 1,"Well, lets just say I'll",13
db "be pretty upset","!"+&80,0


ObjSun:	defw &6969
ObjSunFire: defw &6969

InsultText64: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db  "So even after seeing how great",13
db  "the first level is, the player",13
db  "hasn't upgraded to 128k","?"+&80,9
db 2,"Unbelievable isn't it","!"+&80,9
db 1,"I read in 'Thyme' magazine that",13
db "64k users are responsible for all",13
db "the wars in the world,",&80,9
db 1,"The ebola virus,",13
db "and the Sad lack of training",13
db "opportunities for our young",13
db "tennis players","!"+&80,9
db 2,"You know what?",13,"I believe you!","!"+&80,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
defw Animator_ShootingStar ;1
defw Animator_MoodyCloud   ;2
defw Animator_BlackHole    ;3
defw Animator_Ebichuman    ;4
defw Animator_Witch        ;5
defw Animator_Kitty        ;6
defw Animator_Shroomer     ;7
defw Animator_CodingBug    ;8
defw Animator_Error        ;9
defw Animator_MunkyBong    ;10
defw Animator_Lawsuit      ;11
defw Animator_AngryWorm	   ;12
defw Animator_StiltOn      ;13
defw Animator_Sun	   ;14

Animator_ShootingStar:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmProgram,prgFireMid2+fireBurst,0,0					;1
defb anmEmpty,0,0,0
defb anmKill,0,0,0				;End of loop


Animator_MoodyCloud:
defb %00001000		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,4,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,5,0,0
defb anmLoop,0,0,0				;End of loop


Animator_BlackHole:
defb %00000100		;Anim Freq
defb anmSpriteMoveProg,3,&25,prgSpriteBank0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpriteMoveProg,3,&25,prgSpriteBank2
defb anmSpriteMoveProg,11,&25,prgSpriteBank0

defb anmSpriteMoveProg,11,&25,prgSpriteBank2
defb anmSpawnObject,7,0,0
;defb anmSpriteMoveProg,12,&23,prgSpriteBank0
defb anmSpawnObject,8,0,0
;defb anmSpriteMoveProg,12,&23,prgSpriteBank2
defb anmSpawnObject,9,0,0
;defb anmSpriteMoveProg,11,&23,prgSpriteBank2
defb anmSpriteMoveProg,12,&25,prgSpriteBank0
defb anmSpriteMoveProg,12,&25,prgSpriteBank2

defb anmSpriteMoveProg,11,&25,prgSpriteBank0
defb anmSpriteMoveProg,3,&25,prgSpriteBank2
;defb anmSpriteMoveProg,3,&23,prgSpriteBank0

defb anmLoop,0,0,0				;End of loop

Animator_Ebichuman:
defb %00000001		;Anm Freq
defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleNorthWest
defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleWest
defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleSouthWest
defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleWest
defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleNorthWest
defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleWest
defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleSouthWest
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleWest
defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireOuterBurst

defb anmLoop,0,0,0				;End of loop

; all remaining bytes are anim frames in the form Command-Var-Var-Var
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleNorth
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleSouth
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleNorthEast
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleSouthWest
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleEast
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleWest
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleSouthEast
;defb anmSpriteMoveProg,128+7,&1B,prgFireHyper+fireSingleNorthWest
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleNorth
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleSouth
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleNorthEast
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleSouthWest
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleEast
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleWest
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleSouthEast
;defb anmSpriteMoveProg,128+7,&2B,prgFireHyper+fireSingleNorthWest

Animator_Witch:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,128+16,&2B,0
defb anmSpriteMoveProg,128+16,&1B,0
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmSpawnObject,10,0,0
defb anmSpriteMoveProg,128+20,&2B,0
defb anmSpriteMoveProg,128+16,&1B,0
defb anmLoop,0,0,0				;End of loop

Animator_Sun:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,47,&9,prgFireFast+fireOuterBurst
defb anmSpriteMoveProg,47,&F,prgFireFast+fireOuterBurst
defb anmSpriteMoveProg,47,&3f,prgFireFast+fireOuterBurst
defb anmSpriteMoveProg,47,&39,prgFireFast+fireOuterBurst
defb anmLoop,0,0,0				;End of loop

Animator_Kitty
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+28,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+29,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+30,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+31,0,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop



Animator_Shroomer:
defb %00000010
defb anmSpriteMoveProg,17,&23,prgSpriteBank0
defb anmSpriteMoveProg,17,&23,prgSpriteBank2
defb anmSpriteMoveProg,19,&23,prgSpriteBank0
defb anmSpriteMoveProg,19,&23,prgSpriteBank2
defb anmSpriteMoveProg,19,&23,prgSpriteBank0
defb anmSpriteMoveProg,17,&23,prgSpriteBank2
defb anmCondLoop,%00001000,0,0	
defb anmSpriteMoveProg,17,&24,prgFireFast+fireTop
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop


Animator_CodingBug
defb %00000100		;Anim Freq
defb anmMove,&1B,0,0
defb anmMove,&1B,0,0
defb anmMove,&2B,0,0
defb anmMove,&2B,0,0
defb anmCondLoop,%00010000,0,0	
defb anmSpawnObject,11,0,0
defb anmLoop,0,0,0				;End of loop


Animator_Error
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+9,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+10,0,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop


Animator_MunkyBong:
defb %00010000		;Anim Freq
defb anmSpawnObject,12,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Lawsuit:
defb %00000010		;Anim Freq
defb anmMove,&4A,0,0
defb anmMove,&52,0,0
defb anmMove,&5A,0,0
defb anmMove,&62,0,0
defb anmMove,&6A,0,0
defb anmMove,&72,0,0
defb anmMove,&7A,0,0
defb anmHalt,0,0,0				;End of loop

Animator_AngryWorm:
defb %00000001
defb anmSpriteMoveProg,26,&23,prgSmartBombableSpriteBank0
defb anmSpriteMoveProg,25,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,26,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,26,&23,prgSmartBombableSpriteBank0
defb anmSpriteMoveProg,25,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,26,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,26,&23,prgSmartBombableSpriteBank0
defb anmSpriteMoveProg,25,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,26,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,25,&23,prgFireHyper+fireTopLeft
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop

Animator_StiltOn
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+27,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+32,0,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop

AchievementTargetCount:defb 3
AchievementHandler:
	ld a,iyl
	cp 2
	ret nz

	push hl
		ld a,(objSun)
		res 6,l
		cp l	

	pop hl
	jr z,SunDead


	push hl
		ld hl,AchievementTargetCount
		dec (hl)
	pop hl
	ret nz
	jp ShowInsultAchievement

ret
SunDead:
	push hl
		ld hl,(objsun)
		ld a,0
		call SetObjectY

		ld hl,(objsunFire)
		ld a,0
		call SetObjectY
		call SetObjectProgram

		ld hl,LevelEnding
		ld a,82
		call Akuyou_SetLevelTime
	pop hl
ret
SunAttack:
	push hl
		ld hl,(objsun)
		ld a,&2B
		call SetObjectMove
		ld a,15+128
		call SetObjectSprite
		ld a,lifEnemy+40
		call SetObjectLife
		ld a,2
		call SetObjectProgram
	pop hl
	jp ShowInsultSun
;ret
SunAttack2
push hl
;	ld hl,(objsun)
;	ld a,14
;	call SetObjectAnimator
	ld hl,(objsun)
	ld a,&24
	call SetObjectMove
pop hl
ret


EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static

defb 0,evtSetAnimatorPointers
defw	AnimatorPointers


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



defb 0,evtReprogram_PowerupSprites,128+36,128+37,128+38,128+35	; Define powerup sprites
defb 0,evtReprogramShotToDeath
defw AchievementHandler
; Background L

defb 0,evtResetPowerup


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


; Shooting Star
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+fireSingleSouth,mveMisc+&23,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBank_Save,2




; Moody Cloud
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSnail+fireBottomWide,mveMisc+&25,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBank_Save,3

; Lightning Bolt
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&7C,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSettingsBank_Save,4


; Hail
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&74,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+2
defb 	evtSettingsBank_Save,5

; Black hole
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&25,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBank_Save,6



;VoidObject
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst,&65,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+4
defb 	evtSettingsBank_Save,7

;VoidObject
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst,&5B,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+5
defb 	evtSettingsBank_Save,8

;VoidObject
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireOuterBurst,&6B,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+6
defb 	evtSettingsBank_Save,9


; Ebichuman!
;defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
;defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
;defb 	evtSetObjectSize,24
;defb 	evtSetAnimator,4
;defb 	evtAddToForeground
;defb 	evtSetSprite,TwoFrameSprite+7
;defb 	evtSettingsBank_Save,7


; Sprite Pixie-L
;defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
;defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,&2A,lifEnemy+7	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
;defb 	evtSetObjectSize,24
;defb 	evtSetAnimator,0
;defb 	evtAddToForeground
;defb 	evtSetSprite,TwoFrameSprite+8
;defb 	evtSettingsBank_Save,8



; Majokko
;defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
;defb 	evtSetProgMoveLife,prgFireSlow+fireLeft,mveMisc+&23,lifEnemy+15	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
;defb 	evtSetObjectSize,32
;defb 	evtSetAnimator,5
;defb 	evtAddToForeground
;defb 	evtSetSprite,TwoFrameSprite+16
;defb 	evtSettingsBank_Save,9


; Heat-Seeking Kitty
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,mveMisc+&7A,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16		     ;&3A
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+31
defb 	evtSettingsBank_Save,10


; ERROR!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,mveMisc+mveSeaker,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,11



; Lawsuit
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&22,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,11
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+24
defb 	evtSettingsBank_Save,12


;;;;;;;;;;;;;;;;;;;;;;;EXT;;;;;;;;;;;;;;;;;;;;;;;;;;;

;zombichu
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireSlow+fireLeft,mveMisc+&25,lifEnemy+15	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+13
defb 	evtSettingsBankEXT_Save,0


; Coding Bug
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+12	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+18
defb 	evtSettingsBankEXT_Save,1

; Shroomer
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+12	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBankEXT_Save,2


; BirdBrain!
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireSlow+fireBottom,mveMisc+&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+14
defb 	evtSettingsBankEXT_Save,3


; CrocOcroc
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireFast+fireTopWide,mveMisc+&22,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+21
defb 	evtSettingsBankEXT_Save,4


; MunkyBong
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireSnail+fireBurst,mveMisc+&23,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+23
defb 	evtSettingsBankEXT_Save,5


; Angry Worm
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,12
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+25
defb 	evtSettingsBankEXT_Save,6



; StiltOn
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireMid2+fireLeftWide,mveMisc+&23,lifEnemy+16	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,13
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+27
defb 	evtSettingsBankEXT_Save,7


; Ebichuman!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+7
defb 	evtSettingsBankEXT_Save,8


; Sprite Pixie-L
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,&2A,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+8
defb 	evtSettingsBankEXT_Save,9



; Majokko
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireSlow+fireLeft,mveMisc+&23,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBankEXT_Save,10



; IckyMusume
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,mveMisc+&23,lifEnemy+16	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,128+39
defb 	evtSettingsBankEXT_Save,11

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Start of level data


;sun
defb 0,evtMultipleCommands+6
defb evtSettingsBank_Load+0
defb evtSetObjectSize,32
defb evtSetAnimator,0
defb evtSetProgMoveLife,0,&24,lifImmortal	;
defb evtSingleSprite, 15,24+ 160 -24 ,24+ 8		; single sprite Spr,X,Y
defb evtSaveLstObjToAdd
defw 	ObjSun






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
	defb &44,&57,&4E,&4B		;Black,DkBlue,LtYellow,White

	defb evtReprogramPalette,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 32;0;32	;delay			
	defb &44,&4C,&5B,&4B


	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 0;32	;delay			
	defb &44,&4D,&4A,&4B



	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &44,&4F,&5A,&4B	 ;5b	



; CrocOCroc
defb 10,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11

; Sprite Pixie-L
defb 17,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+9
defb 	evtSingleSprite+2

; Powerup Drone (Plus)
defb 25,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 38,160+24,50+24	; 

; Sprite Pixie-L
defb 30,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+9
defb 	evtSingleSprite+2



;Angry Worms!
defb 35,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb 	evtSingleSprite+12




; Ebichuman!
defb 40,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+6

;Munky Bong
defb 45,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite,TwoFrameSprite+23,160+24,16*6+24-4



; Moody Cloud
defb 50,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite,128+22,0,0+24



; BirdBrain!
defb 55,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite+3


; Majokko
defb 65,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+10
defb 	evtSingleSprite+2


;Angry Worms!
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb 	evtSingleSprite+12


;Icky Musume
defb 85,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+11
defb 	evtSingleSprite+10



; Powerup Strength (Star)
defb 85,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 36,160+24,150+24	; 


; Black Hole
defb 90,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+6
defb 	evtSingleSprite,3,24,90



;Munky Bong
defb 95,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite,TwoFrameSprite+23,160+24,16*6+24-4




; Pakurimon ZombiChu!
defb 100,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite,TwoFrameSprite+13,0,150+24




; Powerup Drone (Plus)
defb 105,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 38,160+24,50+24	; 


;Coding Bug!
defb 110,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb 	evtSingleSprite,TwoFrameSprite+18,160+24,16*4-8+24


; Powerup Speed (Dots)
;defb 5,evtMultipleCommands+5
;defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
;defb 	evtSingleSprite,TwoFrameSprite+ 37,160+24,100+24	; 
;defb 	evtSetObjectSize,24
;defb 	evtSetAnimator,0
;defb 	evtAddToForeground



; Shooting Star
defb 115,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+3





; Pakurimon ZombiChu!
defb 120,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite,TwoFrameSprite+13,0,150+24

;StiltOn
defb 125,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+9

; Shroomer
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11

;Munky Bong
defb 135,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite,TwoFrameSprite+23,160+24,16*6+24-4

; Majokko
defb 140,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+10
defb 	evtSingleSprite+2



; Moody Cloud
defb 145,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite,128+22,0,0+24

; CrocOCroc
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11


; Ebichuman!
defb 155,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+6


;Munky Bong
defb 165,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite,TwoFrameSprite+23,160+24,16*6+24-4



;Icky Musume
defb 170,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+11
defb 	evtSingleSprite+10



; CrocOCroc
defb 170,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11


; Majokko
defb 180,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+10
defb 	evtSingleSprite+2


; Shroomer
defb 190,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11

; Ebichuman!
defb 195,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+6

; Black Hole
defb 200,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+6
defb 	evtSingleSprite,3,24,90


; Pakurimon ZombiChu!
defb 210,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite,TwoFrameSprite+13,0,150+24


;Icky Musume
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+11
defb 	evtSingleSprite+10




;Munky Bong
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite,TwoFrameSprite+23,160+24,16*6+24-4

; Ebichuman!
defb 230,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+6


; Shooting Star
defb 240,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+3



;Angry Worms!
defb 250,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb 	evtSingleSprite+12


; Ebichuman!
defb 252,evtMultipleCommands+2	
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+6


; Shooting Star
defb 5,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+3



; Shroomer
defb 10,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11

; Moody Cloud
defb 20,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite,128+22,0,0+24

;StiltOn
defb 20,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+9

; Shooting Star
defb 30,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+3




;StiltOn
defb 30,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+9

; Moody Cloud
defb 40,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite,128+22,0,0+24


;StiltOn
defb 40,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb 	evtSingleSprite+9

; Black Hole
defb 45,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+6
defb 	evtSingleSprite,3,24,90


;Coding Bug!
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb 	evtSingleSprite,TwoFrameSprite+18,160+24,16*4-8+24




defb 65,evtCallAddress
defw SunAttack

defb 75,evtCallAddress
defw SunAttack2

;sun
defb 75,evtMultipleCommands+6
defb evtSettingsBank_Load+0
defb evtSetObjectSize,32
defb evtSetAnimator,14
defb evtSetProgMoveLife,0,&24,lifImmortal	;
defb evtSingleSprite, 47,24+ 125 -24 ,24+ 100		; single sprite Spr,X,Y
defb evtSaveLstObjToAdd
defw 	ObjSunFire

SunLoop:
defb 183
defb evtJumpToNewTime	
defw SunLoop			; pointer
defb 150					; new time






LevelEnding:
defb 85,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change

LevelEndAnim:
defb 85,evtMultipleCommands+4			; 3 commands at the same timepoint
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb evtSingleSprite,128+	47,140+24,100+24	; 	

;Palette Change
defb 86,%01110000+4			; 4 Commands
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




defb 87,%01110000+4			; 4 Commands
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

defb 88,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&010E 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

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


	call AkuYou_Player_GetPlayerVars
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
	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	call Akuyou_RasterColors_Init

	call AkuYou_Player_GetPlayerVars



;	ld de,InsultHurryBochan


	ld b,1
	ld hl,InsultText64
	ld a,(iy-1)	;cpcver
	and 128
	jr z,systemis64k
	ld b,2
	ld hl,InsultsTwoPlayer
systemis64k:
	ld a,b
	ld (InsultPlayerNum_Plus1-1),a
	ld (OnscreenTextPointer_Plus2-2),hl




	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SkipSetInsults
	ld hl,InsultsBochanOnly
;	ld de,InsultHurryBochan
	ld a,(iy+9)
	or a
	jr z,SetInsults
	ld a,1
	ld (InsultPlayerNum_Plus1-1),a
	ld hl,InsultsChibikoOnly
;	ld de,InsultHurry
SetInsults:
;	ld (PlayerCountSpecificInsultsB_Plus2-2),de
	ld (OnscreenTextPointer_Plus2-2),hl
SkipSetInsults:







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

	call Background_Draw

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
	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
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
;	ld a,1
;	ld bc,RasterColors_ColorArray1Alt
;	ld de,RasterColors_ColorArray2Alt
;	ld hl,RasterColors_ColorArray3Alt
;	ld ix,RasterColors_ColorArray4Alt
;	ld iy,PaletteSwitcher
jp Akuyou_RasterColors_SetPointers




TileSprite1Num equ 34
TileSprite2Num equ 33


Background_Draw: 

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
	
	ld de,NewGradient
	ld b,40
	ld c,%11111100
	call Akuyou_Background_Gradient

	ld de,&0000
	ld b,15
	call BackgroundSolidFill




	;Tree!
	push hl
		ld a,TileSprite1Num
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,16
		call BackgroundFloodFillQuadSprite
	;pop de

	;inc d
	;ld e,0

	;ld b,42-32
	;call BackgroundFloodFillQuadSprite

	ld de,&0000
	ld b,87
	call BackgroundSolidFill



	ld de,NewGradient2
	ld b,26
	ld c,%11111111
	call Akuyou_Background_Gradient


	;Grassy bottom!
	push hl
		ld a,TileSprite2Num
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,16
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de



;DONE _ NOW DO BITSHIFTS


;Bitshift Tree
	ld a,TileSprite1Num
	call GetSpriteMempos	

	ld de,0007
	add hl,de

	;needed for sprite taller than 32	
;	ld b,&8		; Bytes
;	ld c,32
;	call BitShifter
;	inc h
;	ld l,7

	ld b,&8		; Bytes - always 8
	ld c,16;42-32
	call BitShifter



	ld a,TileSprite2Num
	call GetSpriteMempos	
	ld de,0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,16
	call BitShifter

ret

Background_Black:
	ld de,&0000
Background_Fill:
	ld b,200
	jp BackgroundSolidFill



Background_SmartBomb:
	ld e,d
jr Background_Fill








Background_TileA:
	ld a,(iy-16)
	;cp 15
	cp c

push hl
	ld h,(iy-13)
	ld l,h
	ld  (BackgroundTileMoveAction),hl
	jp nz,Background_TileContinue
push bc
	ld h,(iy-5)
	ld l,(iy-6)
;	ld hl,TileStripData StripDataPos_Plus2
	push hl
	;	ld de,TileStrip
		ld d,iyh
		ld e,iyl
	
		ld b,(iy-3)
		ld c,(iy-4)
;		ld bc,TileStripData
		push iy
		call BackgroundTile_Encode
		pop iy
		;ld hl,(TileStrip)
		ld h,(iy+1)
		ld l,(iy+0)

		ld (iy-9),h
		ld (iy-10),l

;		ld (TileBitshiftFrame1_Plus2-2),hl
;		ld de,4*Tile_Size
		ld d,(iy-7)
		ld e,(iy-8)
		add hl,de
		ld (iy-11),h
		ld (iy-12),l
;		ld (TileBitshiftFrame2_Plus2-2),hl

	pop hl
BackgroundTileMoveAction:
dec hl;inc hl ;	dec hl
dec hl;inc hl 	;	dec hl
;	ld (StripDataPos_Plus2-2),hl	
	ld (iy-5),h
	ld (iy-6),l
	ld c,(hl)
	inc hl
	ld b,(hl)	
	ld a,b
	or c
	jp nz,TileTest_Start	; we've hit the end of our tile array!

	ld h,(iy-14)
	ld l,(iy-15)
;	ld hl,TileStripDataB
	;ld (StripDataPos_Plus2-2),hl
	ld (iy-5),h
	ld (iy-6),l

TileTest_Start:

pop bc	;B=Tilesize, C=Xoffset
Background_TileContinue:


	;push hl
		;ld hl,Tile_Start TileBitshiftFrame1_Plus2
		ld h,(iy-9)
		ld l,(iy-10)
		Bit 0,C
		jp z,TileBankDefault
;		ld hl,4*Tile_Size+Tile_Start TileBitshiftFrame2_Plus2
		ld h,(iy-11)
		ld l,(iy-12)
TileBankDefault:
		ld (iy+1),h
		ld (iy+0),l
;		ld (TileStrip),hl
	;pop hl
	SRL C
pop hl
;	ld de,TileStrip
	ld d,iyh
	ld e,iyl
	call BackgroundTile_Draw
	
ret




read "CoreBackground_Quad.asm"
read "CoreBackground_QuadSprite.asm"
read "CoreBackground_bitshifter.asm"
read "CoreBackground_TileArray.asm"
read "CoreBackground_SolidFill.asm"
align 256,0

NewGradient:


defb &F0,&F0	;1; first line
defb 36,&D0	;2; line num, New byte
defb 30,&70	;3
defb 24,&A0	;4
defb 18,&50	;5
defb 12,&80	;6
defb 6,&20	;7
defb 2,&00	;8
defb 255


NewGradient2:

defb &0,&00	;1; first line
defb 24,&02	;10
defb 22,&08	;11
defb 20,&05	;12
defb 18,&0A	;13
defb 16,&07	;14
defb 14,&0D	;15

defb 12,&0D	;15
defb 10,&07	;14
defb 8,&0A	;13
defb 6,&05	;12
defb 4,&08	;11
defb 2,&02	;10





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









read "Core_ObjectReprogrammers.asm"






LevelText: 

db 16,"Level 2:"," "+&80
db 10,"Fantasy-World Doozy"," "+&80
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


defs &200	;fix for compressor glitch?
defb 1
defs &200	;fix for compressor glitch?
defb 2
defs &200	;fix for compressor glitch?
defb 3
defs &200	;fix for compressor glitch?
defb 4
defs &200	;fix for compressor glitch?
defb 5
defs &200	;fix for compressor glitch?
defb 6
defs &200	;fix for compressor glitch?
defb 7








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
save "lz48\T20-SC1.D01",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


