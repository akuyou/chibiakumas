read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &0 ;Start of the data which is stored on disk


;DualChibikoHack equ 1

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
incbin "Sprites\STAGE11.SPR"



;org LevelOrigin+&3500
;limit &3000
;org &2E00
;Event_SavedSettings
;defs 4*16,&00



read "Eventstreamdefinitions.asm"

;org LevelOrigin+&3600


RasterColors_ColorArray1Alt:
	defb 1
	defb 1				
	defb &54,&55,&4A,&4B		;Black,DkBlue,LtYellow,White
RasterColors_ColorArray2Alt:
	defb 2	; Switches
	defb 16	;delay			
	defb &54,&5D,&59,&4B
	defb 16	;delay			
	defb &54,&58,&5F,&4B
RasterColors_ColorArray3Alt:
	defb 0
;	defb 1
;	defb &54,&54,&54,&54		 :IlluminatedPaletteCAlt_Plus2
RasterColors_ColorArray4Alt:
	defb 2 ; no of switches
	defb 0	;delays			
	defb &54,&58,&51,&4B		;Black,Red,Grey,White
	defb 32
	defb &54,&4C,&51,&4B	





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

	ld bc,InsultText :OnscreenTextPointer_Plus2

	ld a,1:InsultPlayerNum_Plus1
	cp 1
	jr z,InteractiveInsultsText_GotPlayer
	ld de,Akuyou_PlayerSeparator
	add iy,de
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

	ld a,1:InsultCharNum_Plus1
	ld i,a	; show up to 255 chars
	
InteractiveInsultsText_MoreText:
	ld a,(bc)

	or a
	jr z,InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
	cp 9
	jr z,InteractiveInsultsText_More2Come ; See if we have reached the end of the string
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
	inc a
	inc a
	inc a
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
	inc bc
Insult_NoPlayerChange:
	ld (OnscreenTextPointer_Plus2-2),bc
	ld a,10
	ld (OnscreenTimerB_Plus1-1),a
ret
ShowInsultTextBigsprite:
push hl
	ld hl,InsultTextBigsprite
	jr DoShowInsult
ShowInsultTextFlappy:
push hl
	ld hl,InsultTextFlappy
DoShowInsult:
	ld (OnscreenTextPointer_Plus2-2),hl
	ld a,1
	ld (InsultPlayerNum_Plus1-1),a
	ld (InsultCharNum_Plus1-1),a
	ld a,5
	ld (OnscreenTimer_Plus1-1),a
pop hl
ret






LevelText: 

db 16,"Level 1:"," "+&80
db 15,"Medi-Evil"," "+&80
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















InsultTextBigsprite: 
db  "At least the sprites",13,"are bigger now","!"+&80,9
db  "Even if the enemy design",13,"is still STUPID","!"+&80,0
InsultTextFlappy: 
db  "A flying Capybara","?"+&80,9
db 2,"Its a FLAPPYBARA","!"+&80,9
db 1,"I hate you with a passion you",13,"can only dream of","!"+&80,0

InsultText: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db  "Uh! Here we go again!",13,"More pointless 'bullet hell'",13,"button mashing","!"+&80,9
db 2,"LETS GO!","!"+&80,9
db 1,"'Lets go?' Shut it! This isn't lemmings","!"+&80,9
db 2,"You're NO FUN","!"+&80,9
db 1,"I'm the 'hero' in this game","!"+&80,9
db 1,"You're just the 'extra",13,"crewmate' who'll die when",13,"things get serious","!"+&80,9
db 2,"um, okay!","!"+&80,9
db 1,"Shut up now, the level's",13,"started & this text",13,"slows down the game","!"+&80,9
db 2,"..","."+&80,0
InsultsBochanOnly:
db "This game is weird",13,"and I don't like it!","!"+&80,9
db 2,"Why wouldn't Chibiko",13,"come with me?","?"+&80,0

InsultsChibikoOnly:
db "Uh! Here we go again!",13
db "More pointless 'bullet hell'",13
db "button mashing","!"+&80,9
db 1,"just so you know...",13
db   "after how shit the",13
db "last game was"," "+&80,9
db 1,"I'm taking the fact the developer",13
db   "wasn't brutally beaten to death",13
db   "by angry gamers"," "+&80,9
db 1,"as proof that God is Dead!!","!"+&80,0
InsultText64: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db  "My doppelganger??",13,"Why are you here","?"+&80,9
db 1,"Isn't my Brother",13,"in this game","?"+&80,9
db 2,"The player was to cheap",13,"to buy an X-Mem","!"+&80,9
db 1,"You're Kidding","?"+&80,9
db 2,"I'm afraid not! There",13,"really are people that tight","!"+&80,9
db 1,"The Cheap bastards!",13
db   "How can they live",13
db   "with themselves","?"+&80,9
db 2,"I have no idea!","!"+&80,0
ifdef DualChibikoHack
DualChibikoHackText:
db  "My doppelganger??",13,"Why are you here","?"+&80,9
db 1,"Isn't my Brother",13,"in this game","?"+&80,9
db 2,"The developer thinks it's clever to",13,"keep the new character secret",13,"till the last moment","!"+&80,9
db 1,"You mean he reprogrammed this",13,"build specially to show this stupid text","?"+&80,9
db 2,"You got it! He really has",13,"too much time on his hands","!"+&80,9
db 1,"The Sad Bastard!",13,"He's going to piss of",13,"a lot of people that way","!"+&80,9
db 2,"I dare say","!"+&80,0
endif
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
defw Animator_Shark
defw Animator_QuadSnake
defw Animator_Firebird
defw Animator_Canon
defw Animator_Rocket
defw Animator_DogAplult
defw Animator_BobbleDragon
defw Animator_Flappybara
defw Animator_Archer
defw Animator_NutsMonkeys
Animator_Shark:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 1 
defb anmCondLoop,%01000000,0,0			;Repeat loop
defb anmCondjmp, %10000000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+11,&1B,prgFireFast+fireBurst		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+12,&1B,prgFireFast+fireSingleWest		;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+11,&2B,prgFireFast+fireBurst		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+12,&2B,prgFireFast+fireSingleWest		;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop


Animator_QuadSnake:
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireLeft
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireTopLeft
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireLeft
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireTopWide
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireTop
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireTopRight
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireTop
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireRightWide
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireRight
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireBottomRight
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireRight
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireBottomWide
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireRight
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireBottomLeft
defb anmSprite,TwoFrameSprite+10,mveMisc+&23,prgNothing;prgFireFast+fireRight
defb anmSpriteMoveProg,TwoFrameSprite+13,mveMisc+&23,prgFireMid2+fireLeftWide
defb anmLoop,0,0,0				;End of loop

Animator_Firebird:
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+30,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+31,0,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop

Animator_Canon:
defb %00001000		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,6,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Rocket:
defb %00000010		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpriteMoveProg,TwoFrameSprite+19,mveStatic,prgFireFast+fireBurst
defb anmKill,0,0,0				;End of loop

Animator_DogAplult:
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+21,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+22,0,0		;Sprite Anim 0
defb anmSpawnObject,8,0,0
defb anmLoop,0,0,0

Animator_BobbleDragon:
defb %00000001
defb anmSprite,TwoFrameSprite+14,0,0						;0
defb anmProgram,prgFireSlow+fireBottomLeft,0,0					;1
defb anmSprite,TwoFrameSprite+15,0,0						;2
defb anmProgram,prgFireSlow+fireBottom,0,0					;3
defb anmCondLoop,%00010000,0,0							;4
defb anmCondjmp, %00100000,11*anmFrameNum,0					;5
defb anmSpriteMoveProg,TwoFrameSprite+14,&1B,prgFireMid+fireLeft		;6
defb anmProgram,prgFireMid+fireBottomLeft,0,0					;7
defb anmSpriteMoveProg,TwoFrameSprite+15,&1B,prgFireMid+fireLeft		;8
defb anmProgram,prgFireMid+fireBottom,0,0					;9
defb anmLoop,0,0,0								;10
defb anmSpriteMoveProg,TwoFrameSprite+14,&2B,prgFireMid+fireLeft		;11
defb anmProgram,prgFireMid+fireBottomLeft,0,0					;12
defb anmSpriteMoveProg,TwoFrameSprite+15,&2B,prgFireMid+fireLeft		;13
defb anmProgram,prgFireMid+fireBottom,0,0					;14
defb anmLoop,0,0,0								;15



Animator_Flappybara:
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+17,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+18,0,0		;Sprite Anim 1
defb anmCondLoop,%00001000,0,0			;Repeat loop
defb anmCondjmp, %00010000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+17,&13,prgFireMid2+fireLeftWide		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+18,&13,prgFireMid2+fireLeftWide	;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+17,&33,prgFireMid2+fireLeftWide		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+18,&33,prgFireMid2+fireLeftWide	;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop

Animator_Archer:
defb %00000010		;Anim Freq
defb anmSprite,TwoFrameSprite+0,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+1,0,0		;Sprite Anim 1
defb anmLoop,0,0,0	


Animator_NutsMonkeys
defb %00000100		;Anim Freq
defb anmProgram,prgFireFast+16,0,0
defb anmProgram,prgFireFast+17,0,0
defb anmProgram,prgFireFast+18,0,0
defb anmProgram,prgFireFast+19,0,0
defb anmProgram,prgFireFast+20,0,0
defb anmProgram,prgFireFast+21,0,0
defb anmProgram,prgFireFast+22,0,0
defb anmProgram,prgFireFast+23,0,0
defb anmLoop,0,0,0	

Animator_Shark1:
; First byte is the 'Tick map' which defines when the animation should update
;defb %00000001		;Anim Freq
;; all remaining bytes are anim frames in the form Command-Var-Var-Var
;defb anmSpriteMoveProg,TwoFrameSprite+12,&1B,0		;Sprite Anim 1
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 2
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 3
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 4
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 5 
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 6
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 7
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 8
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 7
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 10
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 11
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 12
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 13
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 14
;defb anmSwitchAnimator,2


Animator_Shark2:
; First byte is the 'Tick map' which defines when the animation should update
;defb %00000001		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
;defb anmSpriteMoveProg,TwoFrameSprite+12,&2B,0		;Sprite Anim 1
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 2
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 3
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 4
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 5 
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 6
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 7
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 8
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 7
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 10
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 11
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 12
;defb anmSprite,TwoFrameSprite+12,0,0		;Sprite Anim 13
;defb anmSprite,TwoFrameSprite+11,0,0		;Sprite Anim 14
;defb anmSwitchAnimator,1



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



defb 0,evtReprogram_PowerupSprites,128+7,128+8,128+9,128+28	; Define powerup sprites


; Background L

defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgNothing,mveBackground+%00000001,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,0	
								; Save Object settings to Bank 0
defb 0,evtMultipleCommands+5
defb evtSetProgMoveLife,PrgNothing,mveBackground+%00000010,0			; Program - Bitshift Sprite... Move - dir Left Slow ... Life - immortal
defb evtSetObjectSize,0
defb evtSetAnimator,0
defb evtAddToBackground
defb evtSettingsBank_Save,1				; Save Object settings to Bank 1


; Flying Shark
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+fireSingleWest,mveMisc+&2B,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+11
defb 	evtSettingsBank_Save,2




; QuadSnake
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireTopLeft,mveMisc+&22,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+10
defb 	evtSettingsBank_Save,3


; FirebombBird
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,mveMisc+mveSeaker,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+31
defb 	evtSettingsBank_Save,4


; Cannon Soldier
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+5
defb 	evtSettingsBank_Save,5

; Cannon Soldier - Rocket
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&1,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSetSprite,27
defb 	evtSettingsBank_Save,6


; Dogapult
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSettingsBank_Save,7


; Rabid Dog
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&1,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+29
defb 	evtSettingsBank_Save,8



; BobbleDragon
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireBottomLeft,mveMisc+&23,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+10
defb 	evtSettingsBank_Save,9



; FlappyBara
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireLeftWide,mveMisc+&23,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBank_Save,10



; Glider Soldier
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+fireSingleWest,mveMisc+&2B,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+20
defb 	evtSettingsBank_Save,11



; Archer Soldier
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireSingleNorthWest,mveMisc+&22,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBank_Save,12




; Balloon Soldiers
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,mveMisc+&25,lifEnemy+2	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBank_Save,13


; Nuts Monkeys
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,mveMisc+&23,lifEnemy+5	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,14






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Start of level data


;moon
defb 0,evtMultipleCommands+3
defb evtSettingsBank_Load+0
defb evtSetProgMoveLife,PrgBitShift,mveBackground+%00001000,lifImmortal	;
defb evtSingleSprite, 23,24+ 160 -16 ,24+ 8		; single sprite Spr,X,Y







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
	defb &54,&57,&4A,&4B		;Black,DkBlue,LtYellow,White

	;defb 0,240,6,6			; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 5
	;defb 1				
	;defb &54,&55,&43,&4B		;Black,DkBlue,LtYellow,White


	defb evtReprogramPalette,26*0+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0


	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
;	defb 16	;delay			
;	defb &54,&5D,&59,&4B
	defb 0;32	;delay			
	defb &54,&4E,&52,&4B



	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&56,&5B,&4B	 ;5b	




ifdef DualChibikoHack


; Powerup Drone
defb 40,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+7,160+24,100+24	; 	; Single Object sprite 11 (animated)



; Powerup Drone
defb 80,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+7,160+24,100+24	; 	; Single Object sprite 11 (animated)




; Archer Soldier
defb 255,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12

endif




; Archer Soldier
defb 5,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12





; Archer Soldier
defb 15,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12




; Archer Soldier
defb 20,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12


; Nuts Monkeys
defb 25,evtMultipleCommands+6
defb 	evtSettingsBank_Load+14
defb 	evtSingleSprite,128+9,160+20,80
defb 	evtSetProgMoveLife,0,mveMisc+&23,0
defb 	evtSetAnimator,0
defb evtAddToBackground
defb 	evtTileSprite+3,160+24,80+24,24,26,26,26



; Archer Soldier
defb 30,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12




; Nuts Monkeys
defb 45,evtMultipleCommands+6
defb 	evtSettingsBank_Load+14
defb 	evtSingleSprite,128+9,160+20,80
defb 	evtSetProgMoveLife,0,mveMisc+&23,0
defb 	evtSetAnimator,0
defb evtAddToBackground
defb 	evtTileSprite+3,160+24,80+24,24,26,26,26



; Archer Soldier
defb 50,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12



; Glider
defb 50,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+11
defb 	evtSingleSprite+2


; Archer Soldier
defb 55,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12




; Arrow Station
defb 60,evtMultipleCommands+7
defb 	evtSettingsBank_Load+14
defb 	evtSetProgMoveLife,prgFireFast+fireSingleWest,mveMisc+&23,lifEnemy+2
defb 	evtSetAnimator,0
defb 	evtSingleSprite,128+2,160+20,100
defb 	evtSetProgMoveLife,0,mveMisc+&23,0
defb evtAddToBackground
defb 	evtTileSprite+3,160+24,100+24,24,26,26,26



; Archer Soldier
defb 65,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12

; Flappybara
defb 75,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite,16,160+24,190		; Row 16, last Column, Last Sprite

defb 80,evtCallAddress
	defw ShowInsultTextFlappy

; Balloon Soldiers
defb 80,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+13				; Load Settings from bank 2
defb 	evtSingleSprite,128+16,8+24,80		; Row 16, last Column, Last Sprite

; Powerup Drone
defb 80,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+7,160+24,100+24	; 	; Single Object sprite 11 (animated)


; Arrow Station
defb 85,evtMultipleCommands+7
defb 	evtSettingsBank_Load+14
defb 	evtSetProgMoveLife,prgFireFast+fireSingleWest,mveMisc+&23,lifEnemy+2
defb 	evtSetAnimator,0
defb 	evtSingleSprite,128+2,160+20,60
defb 	evtSetProgMoveLife,0,mveMisc+&23,0
defb evtAddToBackground
defb 	evtTileSprite+4,160+24,60+24,24,26,26,26,26



; FireBombBird
defb 95,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 2
defb 	evtSingleSprite+10  			; Row 16, last Column, Last Sprite


; Archer Soldier
defb 100,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12

; Archer Soldier
defb 105,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12


; Glider
defb 105,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+11
defb 	evtSingleSprite+2


; DogApult Soldier
defb 110,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite



; FireBombBird
defb 115,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 2
defb 	evtSingleSprite+10  			; Row 16, last Column, Last Sprite


;; BobbleDragon
defb 115,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+9				; Load Settings from bank 2
defb 	evtSingleSprite+3 			; Row 16, last Column, Last Sprite




; Archer Soldier
defb 120,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+12
defb 	evtSingleSprite+12




; Glider
defb 125,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+11
defb 	evtSingleSprite+2



; QuadSnake
defb 130,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+3				; Load Settings from bank 2
defb 	evtSingleSprite,10,160+24,115		; Row 16, last Column, Last Sprite


defb 135,evtCallAddress
	defw ShowInsultTextBigsprite



; Canon Soldier
defb 140,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+5				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite


; DogApult Soldier
defb 150,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite

; Balloon Soldiers
defb 155,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+13				; Load Settings from bank 2
defb 	evtSingleSprite,128+16,8+24,80		; Row 16, last Column, Last Sprite


;; BobbleDragon
defb 160,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+9				; Load Settings from bank 2
defb 	evtSingleSprite+3 			; Row 16, last Column, Last Sprite

; Flappybara
defb 165,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite,16,160+24,160		; Row 16, last Column, Last Sprite


; Flying Shark
defb 170,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	evtSingleSprite+3			; Row 16, last Column, Last Sprite

; Powerup Drone
defb 180,evtMultipleCommands+3			; 2 commands at the same timepoint
defb 	evtSetProgMoveLife,3,&22,64+63	; Program - Bitshift Sprite... Move - dir Left Slow ... Hurt by bullets, hurts player, life 4
defb evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+7,160+24,100+24	; 	; Single Object sprite 11 (animated)


; Nuts Monkeys
defb 180,evtMultipleCommands+6
defb 	evtSettingsBank_Load+14
defb 	evtSingleSprite,128+9,160+20,80
defb 	evtSetProgMoveLife,0,mveMisc+&23,0
defb 	evtSetAnimator,0
defb evtAddToBackground
defb 	evtTileSprite+3,160+24,80+24,24,26,26,26


; Balloon Soldiers
defb 185,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+13				; Load Settings from bank 2
defb 	evtSingleSprite,128+16,8+24,80		; Row 16, last Column, Last Sprite


; QuadSnake
defb 190,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+3				; Load Settings from bank 2
defb 	evtSingleSprite,10,160+24,115		; Row 16, last Column, Last Sprite

; Canon Soldier
defb 200,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite



;; BobbleDragon
defb 210,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+9				; Load Settings from bank 2
defb 	evtSingleSprite+3 			; Row 16, last Column, Last Sprite

; FireBombBird
defb 215,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 2
defb 	evtSingleSprite+10  			; Row 16, last Column, Last Sprite




; Canon Soldier
defb 220,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+5				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite

; Flying Shark
defb 225,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+2				; Load Settings from bank 2
defb 	evtSingleSprite+3			; Row 16, last Column, Last Sprite


; FireBombBird
defb 225,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+4				; Load Settings from bank 2
defb 	evtSingleSprite+10  			; Row 16, last Column, Last Sprite



; DogApult Soldier
defb 230,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+7				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite

; Flappybara
defb 235,evtMultipleCommands+2	
defb 	evtSettingsBank_Load+10
defb 	evtSingleSprite,16,160+24,190		; Row 16, last Column, Last Sprite




; Canon Soldier
defb 240,evtMultipleCommands+2			; 2 commands at the same timepoint
defb 	evtSettingsBank_Load+5				; Load Settings from bank 2
defb 	evtSingleSprite+12  			; Row 16, last Column, Last Sprite






defb 5,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change
LevelEndAnim:
defb 5,%01110000+3			; 3 commands at the same timepoint
defb evtSetAnimator,0
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb 	0,47,140+24,100+24	; 	; Single Object sprite 11 (animated)

;Palette Change
defb 6,%01110000+4			; 4 Commands
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




defb 7,%01110000+4			; 4 Commands
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

defb 8,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&010C 				;load level 12
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
	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit


	call Akuyou_Music_Restart

;	ld hl, LevelSprites	
;	ld de, Akuyou_PlayerSpritePos
	;call AkuYou_SpritePointerInit



	call Akuyou_ScreenBuffer_Init
	ld (BackgroundFloodFillQuad_Minus1+1),hl
	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	call Akuyou_RasterColors_Init

	call AkuYou_Player_GetPlayerVars
	push iy
	pop hl
	ld de,-6
	add hl,de
	ld (TimerPos_Plus2-2),hl

	ld hl,InsultText64
	ld a,(iy-1)	;cpcver
	and 128
	jr z,systemis64k
	ld hl,InsultText
systemis64k:
	ifdef DualChibikoHack
		ld hl,DualChibikoHackText
	endif
	ld (OnscreenTextPointer_Plus2-2),hl



	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SkipSetInsults
	ld b,2
	ld hl,InsultsBochanOnly
	ld a,(iy+9)
	or a
	jr z,SetInsults
	ld b,1
	ld hl,InsultsChibikoOnly

SetInsults:
;	ld (PlayerCountSpecificInsultsB_Plus2-2),de
	ld (OnscreenTextPointer_Plus2-2),hl
	ld a,b
	ld (InsultPlayerNum_Plus1-1),a
SkipSetInsults:



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








EnablePlusPalette:
push hl
	call Akuyou_EnablePlusPalette
pop hl

ret



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
	ld a,1
	ld bc,RasterColors_ColorArray1
	ld de,RasterColors_ColorArray2
	ld hl,RasterColors_ColorArray3
	ld ix,RasterColors_ColorArray4
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



RasterColors_ColorArray1:
	defb 1
	defb 1
	defb 64+20,64+24,64+29,64+11
RasterColors_ColorArray2:
	defb 5
	defb 1

	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+24,64+29,64+11
	defb 12
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+24,64+29,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
RasterColors_ColorArray3:
	defb 1
	defb 1
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
RasterColors_ColorArray4:
	defb 1
	defb 1 
	defb 64+20,64+31,64+14,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+31,64+14,64+11
	defb 0
	defb 64+20,64+12,64+13,64+11
	defb 0
	defb 64+20,64+31,64+14,64+11



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
	ld a,(iy-8)	;check if insults are disabled
	and %00000100
	jp nz,Background_Black
	
	ld de,NewGradient
	ld b,40
	ld c,%11111100
	call Akuyou_Background_Gradient

	ld de,&0000
	ld b,55
	call BackgroundSolidFill




	;Tree!
	push hl
		ld a,25
		call GetSpriteMempos	
		ex hl,de
	pop hl
	push de				;MUST BE BYTE ALIGNED!
		ld b,32
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
	pop de

	inc d
	ld e,0

	ld b,42-32
	call BackgroundFloodFillQuadSprite

	ld de,&0000
	ld b,25
	call BackgroundSolidFill



	ld de,NewGradient2
	ld b,30
	ld c,%11111111
	call Akuyou_Background_Gradient


	;Grassy bottom!
	push hl
		ld a,24
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,8
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de



;DONE _ NOW DO BITSHIFTS


;Bitshift Tree
	ld a,25
	call GetSpriteMempos	

	ld de,0007
	add hl,de
;	push hl	
	
	ld b,&8		; Bytes
	ld c,32
	call BitShifter
;	pop hl
	inc h
	ld l,7

	ld b,&8		; Bytes
	ld c,42-32
	call BitShifter



	ld a,24
	call GetSpriteMempos	
	ld de,0007
	add hl,de
	ld b,&8		; Bytes
	ld c,8		;lines
	call BitShifter


	;ld iy,TileStrip
;	ld a,1		StageToShowB_Plus1
;	dec a
;	dec a
;	and %00001111
;	ld (StageToShowB_Plus1-1),a
;	ld c,a
;	ld b,16
;	call Background_TileA
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
gradstart2 equ 200-32

defb &0,&00	;1; first line
defb 28,&20	;10
defb 24,&80	;11
defb 22,&50	;12
defb 18,&A0	;13
defb 16,&70	;14
defb 12,&D0	;15
defb 8,&70	;16
defb 4,&50	;17
defb 02,&00	;20
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
save direct "T10-SC1.D01",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


