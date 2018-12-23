nolist
read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &00 ;Start of the data which is stored on disk



org &4000
LevelOrigin:
org LevelOrigin+ LevelDataStart
;LevelTiles
;incbin "Sprites\TILETEST.TLE"
LevelSprites:
;incbin "Sprites\LEVEL1A2.SPR"
incbin "Sprites\STAGE18.SPR"



;org LevelOrigin+&3500
;limit &3000
;org &2E00
;Event_SavedSettings:
;defs 4*16,&00



read "Eventstreamdefinitions.asm"

;org LevelOrigin+&3600


RasterColors_ColorArray1Alt:
	defb 1
	defb 0				
	defb &54,&46,&5F,&4B	

RasterColors_ColorArray2Alt:
	defb 1
	defb 0				
	defb &54,&46,&5F,&4B	
RasterColors_ColorArray3Alt:
	defb 1
	defb 0				
	defb &54,&46,&5F,&4B	
RasterColors_ColorArray4Alt:
	defb 1
	defb 0				
	defb &54,&46,&5F,&4B	




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
	cp 3
	jr z,Player3Insult
	cp 4
	jr z,AchievementInsult
	cp 5
	jr z,BossInsult
	ld de,Akuyou_PlayerSeparator
	add iy,de
	jr InteractiveInsultsText_GotPlayer
AchievementInsult:
	ld hl,&0f17
	jr InteractiveInsultsText_PosReady
BossInsult:
;	push bc
;		ld hl,(objSakuya)
;		ld a,(hl)
;		sub 38
;		srl a
;		srl a
;		srl a
;		ld b,a
;
;		inc h
;		ld a,(hl)
;		sub 12+64
;		srl a
;		srl a
;		ld h,a
;		ld l,b
;		
;	pop bc
	jr InteractiveInsultsText_PosReady


Player3Insult:
	push bc
		ld hl,(yumeObj)
InsultGetObjPos:
		ld a,(hl)
		sub 38
		srl a
		srl a
		srl a
		ld b,a

		inc h
		ld a,(hl)
		sub 12
		srl a
		srl a
		ld h,a
		ld l,b
		
	pop bc
	jr InteractiveInsultsText_PosReady
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
	jp z,InteractiveInsultsText_StartBattle
	or a
	jr z,InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
	cp 9
	jr z,InteractiveInsultsText_More2Come ; See if we have reached the end of the string
	cp 8
	jr z,InteractiveInsultsText_More2ComeB ; See if we have reached the end of the string
	cp 11
	jr z,InteractiveInsultsText_More2ComeC ; See if we have reached the end of the string
	cp 12
	jr z,InteractiveInsultsText_More2ComeD ; See if we have reached the end of the string
	cp 14
	jr z,InteractiveInsultsText_More2ComeE ; See if we have reached the end of the string
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

InteractiveInsultsText_More2ComeE
	call InteractiveInsultsText_SpecialEvent2
	jr InteractiveInsultsText_More2Come
InteractiveInsultsText_More2ComeD
	call InteractiveInsultsText_SpecialEvent1
	jr InteractiveInsultsText_More2Come


InteractiveInsultsText_More2ComeC:
	call InteractiveInsultsText_StartBattleDelayed
	jr InteractiveInsultsText_More2Come
InteractiveInsultsText_More2ComeB:
	call yumeSilent
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

	cp 3
	call z,yumeTalk

	inc bc
Insult_NoPlayerChange:
	ld (OnscreenTextPointer_Plus2-2),bc
	ld a,5
	ld (OnscreenTimerB_Plus1-1),a
ret


;ShowInsultAchievement
;push hl
;	ld hl,InsultAchievement
;	ld a,4
;	jr DoShowInsult
ShowInsultTextBochan:
	push hl
	ld hl,InsultTextBochan
	ld a,2
	jr DoShowInsult
ShowInsultTextHurry:

	push hl

		ld hl,InsultHurry  :PlayerCountSpecificInsultsB_Plus2
		ld a,3
		jr DoShowInsult


ShowInsultTextyume:
	call yumeTalk
push hl
	ld hl,InsultsTwoPlayer :PlayerCountSpecificInsults_Plus2
	ld a,3
DoShowInsult:
	ld (OnscreenTextPointer_Plus2-2),hl
	ld (InsultPlayerNum_Plus1-1),a

	ld a,1
	ld (InsultCharNum_Plus1-1),a
	ld a,5
	ld (OnscreenTimer_Plus1-1),a
pop hl
ret



InteractiveInsultsText_SpecialEvent1:
	push hl
		ld hl,Level_ChibikoLeave			
		ld a,50
		call Akuyou_SetLevelTime
	pop hl
ret

InteractiveInsultsText_SpecialEvent2:
	push hl
		ld hl,Level_ChibikoReturn
		ld a,50
		call Akuyou_SetLevelTime
	pop hl
ret




InteractiveInsultsText_StartBattleDelayed:
	push hl
		ld hl,MainBattleLoopFirst			
		ld a,100
		call Akuyou_SetLevelTime
		call yumeAnimMoveRight
	pop hl
ret ; See if we have reached the end of the string


InteractiveInsultsText_StartBattle:
	ld hl,MainBattleLoopFirst			
	ld a,100
	call Akuyou_SetLevelTime
	call yumeAnimMoveRight
jp InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
InsultTextBochan: 
db 2,"Level over?",13,"Awww..",13,"I was enjoying that","!"+&80,0
;db " "+&80,0
InsultText: 
;13 =newline
;11 =player 3 walk out in a huff
;10 =end of prebattle speech
;12 =Special
;14 =Special
;9 = new caption
;8 = new caption +stop enenmy speech anim
;1 = Chibiko
;2 = Bochan
;3 = Enemy
;4 = Achievement
;5 = Boss


;db 1,"So, I'm guessing one of those",13,"fucktards will turn up",13,"with their shitty toy then run off.",13,"And I'll beat the shit out of it","!"+&80,0
db " "+&80,0

InsultsChibikoOnly: 
db "Well, if it isn't everyones",13,"least favourite blood-sucker",13,"Chibiko","!"+&80,8
db 3,"How you doing?",13,"Seen your reflection recently","?"+&80,8
db 1,"Oh, you think your sooo funny dom't you","!"+&80,8
db 3,"Thanks to my superior skills",13,"I have invented this",13,"machine to defeat you","!"+&80,8
db 1,"Well I WAS wondering what all",13,"this dumb shit was","!"+&80,8
db 3,"I call it the...",13
db "'Affusionmaster De-vampifier",13
db "2000 NT/BC-PRO!","'"+&80,8
db 3,"It cures vampire-ism, baptises,",13
db "AND clenses the soul in",13
db "parts other religous purifiers",13
db "just can't reach","!"+&80,8
db 1,"That's the stupidest shit",13,"I've ever heard","!"+&80,8
db 1,"Seriously, Why can't I be",13
db "in a GOOD GAME?",13,"Fuck this shit!",13,"I'm outta here","!"+&80,12
db 3,"Er..","."+&80,8
db 3,"Um..","."+&80,8
db 3,"Well, It looks like the games over","!"+&80,8
db 3,"Thanks for playing","!"+&80,8
db 3,"See you next time in",":"+&80,8
db 3,"Chibi Akumas Ep 0:",13,"Chibiko Rising","!"+&80,8
db 3,"Learn the backstory",13,"of why Chibiko is",13,"such a whiny bitch","."+&80,8
db 3,"We've got all kinds of",13,"embarassing Chibiko",13,"gossip too","!"+&80,8
db 3,"Like the love-letters",13,"she wrote to death-row",13,"inmates",","+&80,8
db 3,"And embarassing bath-time photos",13,"of her drowning her rubber duck","!"+&80,14
db 1,"Like fuck am I letting you show that","!"+&80,9
db 1,"Er...",13,"I mean..",13,"None of that stuff exists","!"+&80,9
db 1,"Lets finish this once and for all","!"+&80
db 10
InsultsBochanOnly: 
db "Well Chibiko...",13,"Now my Anti-Vampire Ma..",13,"Huh you again","?"+&80,8
db 3,"Where IS Chibiko today","!"+&80,8
db 2,"She told me to come here and play 'decoy'",13,"While she wiped out 'VolcanoTown'","?"+&80,8
db 3,"She's doing what?",13,"I'd better go and save them","!"+&80,8
db 3,"Hang on, didn't 'VolcanoTown'?",13,"didn't they used to be called",13,"'hilltown'","?"+&80,8
db 2,"Maybe","?"+&80,8
db 3,"Oh well forget them!",13,"I'm banned from that town",13,"by court order anyway","."+&80,8
db 3,"Well, I'm not sure this machine",13,"actually works on Ghouls,",13,"but we could give it a go","?"+&80,8
db 2,"Yeah, lets party","!"+&80,8
db 3,"Ok! lets see what happens","!"+&80
db 10
InsultsTwoPlayer: 
db "Well! If it isn't everyones least",13,"favourite blood-sucker Chibiko","!"+&80,8
db 3,"How you doing? Seen your reflection recently","?"+&80,8
db 2,"HA","!"+&80,8
db 1,"Shut up","!"+&80,8
db 3,"Hey, Bochan, why are vampires easy to fool?",13,"Cos they are all SUCKERS","!"+&80,8
db 2,"HA HA","!"+&80,8
db 1,"Oh you think you're sooo funny","!"+&80,8

db 3,"Why didn't the vampire 'cross' the road!",13,"Cos they're scared of crucifixes","!"+&80,8
db 2,"HA HA HA HA","!"+&80,8
db 1,"Yume - FUCK YOU! and Bochan...",13,"double FUCK YOU too","!"+&80,8
db 1,"As a wise man once said...",13,"Screw you guys, I'm going home","!"+&80,12


db 3,"hmm - that was unexpected,","!"+&80,8
db 3,"er - what do we now?",13,"The game can't finish here","."+&80,8
db 2,"Don't worry","!"+&80,8
db 3,"But..","."+&80,8
db 2,"Just wait","!"+&80,8
db 3,"But..","."+&80,8
db 2,"Trust me! hang on","!"+&80,14
db 1,"I mean, do you seriously expect me to",13,"just sit here and take that shit","?"+&80,8
db 2,"Told you","!"+&80,8
db 3,"OK, lets fight","."+&80
db 10
InsultHurry: 
db " "," "+&80,11
db 1,"There's too much dialog in this game!",13
db "What WAS the fucktard author thinking?","?"+&80
db 0
InsultHurryBochan: 

db "You make AntiVampire Tech,",13
db "And the vampire doesn't turn up?",13
db "Why Do I bother","?"+&80
db 10

;InsultAchievement
;db 4,"Achievement Unlocked13
;db   " Curse of Blackavar","!"+&80
;db 0

ObjectPointers:
yumeObj:	defw &6969

yumeHide:
	push hl
	ld hl,(yumeObj)
	ld (hl),0
	pop hl
ret


yumeSilent:
	push hl
	ld hl,Animator_yumeSilent
	jr yumeDoAnimSwitch
yumeAnimSwitch1:


yumeAnimMoveRight:
	push hl
	ld hl,Animator_yumeWalkRight
	jp yumeDoAnimSwitch

yumeTalk:
;	ld (yumeCurrentAnim),hl
	push hl
	ld hl,Animator_yumeTalk
	jr yumeDoAnimSwitch
yumeDoAnimSwitch:
	ld (yumeCurrentAnim),hl
	pop hl
ret


PurgeyumeObject
	push hl
		ld hl,&6969
		ld (yumeobj),hl
	pop hl
	ret

BattleStart:


	push hl
;		call FastAnimMCZ
;		ld a,0
;		ld (NoBackgroundMoves_Plus1-1),a

		
	pop hl
	ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
SakuyaCurrentAnim: 
	defw 0000	;1
yumeCurrentAnim: 
	defw Animator_yumeWalkLeft	;2
	defw Animator_Crucifix	;3
	defw Animator_Shower1 	;4
ShowerAnimator:	defw Animator_Shower2 	;5
	defw Animator_LauncherDeploy 	;6
	defw Animator_LauncherUpDown    ;7
	defw Animator_LauncherDeployR 	;8
	defw Animator_Shower3 	;9
	defw Animator_FinalDown ;10
	defw Animator_FinalUp ;11
	defw Animator_FinalYoYo ;12
	defw Animator_BossCrucifix	;13
Animator_BossCrucifix:
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,128+15,0,0
defb anmSprite,128+16,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Crucifix:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,128+4,0,0
defb anmSprite,128+5,0,0
defb anmLoop,0,0,0				;End of loop




Animator_Shower1:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
;defb anmMove,&2C,0,0
defb anmSwitchAnimator,5,0,0				;End of loop

Animator_Shower2:
defb %00000100		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmMove,&23,0,0
defb anmMove,&2C,0,0
defb anmMove,&25,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0
Animator_Shower3:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0


Animator_LauncherDeploy:
defb %00001000		;Anim Freq
defb anmMove,&2C,0,0
defb anmMove,&24,0,0
defb anmMove,&24,0,0
LauncherL1:	defb anmSpawnObject,8,0,0
defb anmMove,&24,0,0
LauncherL2:	defb anmEmpty,8,0,0
defb anmMove,&24,0,0
LauncherL3:	defb anmEmpty,8,0,0
defb anmMove,&24,0,0
LauncherL4:	defb anmSpawnObject,8,0,0
defb anmMove,&24,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0				;End of loop
Animator_LauncherDeployR:
defb %00001000		;Anim Freq
defb anmMove,&2C,0,0
defb anmMove,&24,0,0
defb anmMove,&24,0,0
LauncherR1:	defb anmSpawnObject,10,0,0
defb anmMove,&24,0,0
LauncherR2:	defb anmEmpty,10,0,0
defb anmMove,&24,0,0
LauncherR3:	defb anmEmpty,10,0,0
defb anmMove,&24,0,0
LauncherR4:	defb anmSpawnObject,10,0,0
defb anmMove,&24,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0	
Animator_LauncherUpDown:
defb %00000100		;Anim Freq
defb anmMove,&3C,0,0
defb anmMove,&3C,0,0
defb anmMove,&3C,0,0
defb anmMove,&3C,0,0
defb anmMove,&3C,0,0
defb anmMove,&3C,0,0
defb anmMove,&3C,0,0
defb anmMove,&0C,0,0
defb anmMove,&0C,0,0
defb anmMove,&0C,0,0
defb anmMove,&0C,0,0
defb anmMove,&0C,0,0
defb anmMove,&0C,0,0
defb anmMove,&0C,0,0
defb anmLoop,0,0,0				;End of loop



Animator_yumeSilent:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,28,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,28,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,28,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,28,&24,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop


Animator_yumeTalk:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+27,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+28,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+27,&24,0		;Sprite Anim 1
defb anmSpriteMoveProg,TwoFrameSprite+28,&24,0		;Sprite Anim 1
defb anmLoop,0,0,0	


Animator_yumeWalkLeft:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+25,&22,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+26,&22,0		;Sprite Anim 1
defb anmSpriteMoveProg,TwoFrameSprite+25,&22,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+26,&22,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop

Animator_yumeWalkRight:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+29,&26,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+30,&26,0		;Sprite Anim 1
defb anmSpriteMoveProg,TwoFrameSprite+29,&26,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+30,&26,0		;Sprite Anim 1
defb anmLoop,0,0,0


Animator_FinalDown:
defb %00001000		;Anim Freq
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&24,0,0
defb anmSwitchAnimator,12,0,0				;End of loop

Animator_FinalUp:
defb %00001000		;Anim Freq
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&24,0,0
defb anmSwitchAnimator,12,0,0				;End of loop
Animator_FinalYoYo:
defb %00001000		;Anim Freq
defb anmMove,&1C,0,0
defb anmMove,&2C,0,0
defb anmLoop,0,0,0
	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y

;DoScreenShake
;;	push hl
;		ld hl,ScreenShakerCommands 
;		ld (ScreenShakerNext_Plus2-2),hl
;	pop hl
;	ret
ShowerOff:
	push hl
		ld hl,Animator_Shower3
		ld (ShowerAnimator),hl
	pop hl
ret


ScreenShakerOn:
	push iy
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-16)
	pop iy
	and %00000001
	ret z
	push hl
		ld hl,Animator_Shower2
		ld (ShowerAnimator),hl
		ld hl,ScreenShaker
		ld (ScreenShakeCall_Plus2-2),hl
	pop hl
ret
ScreenShakerOff:
	push hl
	push bc
		ld hl,null
		ld (ScreenShakeCall_Plus2-2),hl

		ld bc,&BC02
		out (C),C
		ld a,46
		inc B
		out (C),a

		ld bc,&BC07
		out (C),C
		ld a,30
		inc B
		out (C),a
	pop bc
	pop hl
ret
ScreenShaker:
	ld hl,ScreenShakerDone :ScreenShakerNext_Plus2

	ld a,(hl)
	or a
	jr nz,ScreenShakerB

	;ret
	;restart the loop
	ld hl,ScreenShakerCommands 
	ld a,(hl)
ScreenShakerB:
	ld bc,&BC02
	out (C),C

	
	inc hl
	inc B
	out (C),a

	ld bc,&BC07
	out (C),C
	ld a,(hl)
	inc hl
	inc B
	out (C),a
	
	ld (ScreenShakerNext_Plus2-2),hl
ret

ScreenShakerCommands:
;Reg2X 		Reg7Y
defb 47,30	;end of loop
defb 46,31	;end of loop
defb 45,30	;end of loop
defb 46,29	;end of loop
defb 46,30	;end of loop
ScreenShakerDone:
defb 0,0	;end of loop


;defb 47,31	;end of loop
;defb 45,29	;end of loop
;defb 47,29	;end of loop
;defb 45,31	;end of loop
;defb 46,30	;end of loop


GetAnimator:
; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
	push hl
;		inc h
;		inc h
;		inc h
		set 6,l
		ld a,(hl)
	pop hl
ret

CustomObjectKillHandler:

	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y

ld	a,iyl
	cp 8	;Protected Program 1
	jr z,KilledLauncher
	ld a,iyh
	cp 128+4
	jr z,KilledCrucifix
	cp 128+5
	jr z,KilledCrucifix

ret

LauncherCount: defb 4
BossStage:defb 1

KilledLauncher:
	ld a,(LauncherCount)
	dec a
	ld (LauncherCount),a
	ret nz
	inc a
	ld (RegeneratingBoss_Plus1-1),a



	push hl
		ld hl,ItShallGetTheHose			
		ld a,100
		call Akuyou_SetLevelTime
	pop hl

	ld a,(BossStage)
	inc a
	ld (BossStage),a
	cp 2
	jp z,SetLauncherMirrors
	cp 3
	jp z,SetLauncherSilver
	cp 4
	jp z,SetLauncherStJohn
	cp 5
	jp z,SetLauncherFinale
;defw SetLauncherStJohn;SetLauncherSilver;SetLauncherMirrors
ret

KilledCrucifix:
	call ScreenShakerOff
;ret
RemoveCrucifix:

push hl
push bc

	ld b,ObjectArraySize
	ld hl,ObjectArrayPointer	; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
	KillCrucifix_NextObj
	inc h
	inc h
	inc h
	ld a,(hl)
	dec h
	dec h
	dec h
	cp TwoFrameSprite+4
	jr z,FoundCrucifixKill
	cp TwoFrameSprite+5
	jr z,FoundCrucifixKill
	cp 13
	jr z,FoundCrucifixKill

KillCrucifix_Resume:
	inc l
	djnz KillCrucifix_NextObj
pop bc
pop hl

ret
FoundCrucifixKill:
	xor a
	ld (hl),a
	jr killCrucifix_Resume




StopCrucifix:

push hl
push bc

	ld b,ObjectArraySize
	ld hl,ObjectArrayPointer	; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
	StopCrucifix_NextObj
	inc h
	inc h
	inc h
	ld a,(hl)
	cp TwoFrameSprite+4
	jr z,FoundCrucifix
	cp TwoFrameSprite+5
	jr z,FoundCrucifix
	cp TwoFrameSprite+15
	jr z,FoundCrucifix
	cp TwoFrameSprite+16
	jr z,FoundCrucifix
	cp 13
	jr z,FoundCrucifix
	dec h
StopCrucifix_Resume:
	dec h
	dec h
	inc l
	djnz,StopCrucifix_NextObj
pop bc
pop hl

ret
FoundCrucifix:
	ld a,&24
	dec h
	ld (hl),a
	jr StopCrucifix_Resume
HitBossCrucifix:
	ld a,lifEnemy+63
	ld ixl,a
	call DoHitBoss

jr CustomObjectHitHandlerDoNothing
CustomObjectHitHandler:

	ld a,iyl
	cp 8	:
	jp z,HitLauncher	:LauncherHit_Plus2
	ld a,iyh
	cp 128+15	
	jr z,HitBossCrucifix
	cp 128+16
	jr z,HitBossCrucifix
CustomObjectHitHandlerDoNothing:
di 
exx

;push hl
	;we can only speedup while the tank and yume are stopped
jp CanHurry :AllowHurry_Plus2
CanHurry:
	call Akuyou_GetLevelTime	
	cp 50
	jr nc,CantHurry
	cp 10
	jr c,CantHurry
	call ShowInsultTextHurry 
	
	ld hl,CantHurry
	ld (AllowHurry_Plus2-2),hl

	ld hl,MainBattleLoopFirst			
	ld a,100
	call Akuyou_SetLevelTime
;pop hl

CantHurry:
	exx

;	cp prgSpecial
;	ret z

	push hl
	exx
	pop hl
;	inc h;dec h	;	 Animator
;	inc h;dec h	;	 Spritesize never changes
	res 6,l ;dec h

;	ld a,(objChibikoZilla1)
;	cp l	
;	jr z,HitBoss

	ld a,(yumeobj)
	cp l
	jr z,CustomObjectHitHandlerDone
	exx
	ei
	jp Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine

HitLauncher:
	call DoHitBoss
	jp Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine
CustomObjectHitHandlerDone:
	ld ixl,lifEnemy+63
exx
ei
ret


bosslifeStageB equ 8
BossLifeB: defb bosslifeStageB


HitBoss:
	call DoHitBoss
	jp CustomObjectHitHandlerDone

DoHitBoss:
	ld a,(BossLifeB)
	call DoHurt
	ld (BossLifeB),a
	jr z,HitBossActual
	and %00000010
	ld (BossColorFlashAction_Plus1-1),a	;nonzero=flash
ret
HitBossActual:

	ld a,(BossLife)
	or a
	jr z,CustomObjectHitHandlerDone
	dec a
	ld (BossLife),a


	or a
	jp z,BossDead

	ld a,bosslifeStageB
	ld (BossLifeB),a
ret


DoHurt:	;Double up hits for one player game
push af
push iy
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
pop iy
	cp 2
	jr z,DoHurtTwoPlayer
pop af
	dec a
	ret z
	dec a
ret

DoHurtTwoPlayer:
pop af

	dec a
ret


BossDead:

	push hl
		ld hl,CantHurry
		ld (AllowHurry_Plus2-2),hl

		ld hl,LevelEnd			
		xor a
		ld ixl,a	;kill the crucifix object
		ld a,22
		call Akuyou_SetLevelTime
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



defb 0,evtReprogram_PowerupSprites,128+34,128+35,128+36,128+38-2	; Define powerup sprites (Drone(2)/speed(2)/power(1)/coin)

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


; Animator_yume
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireSingleNorthWest,mveMisc+&22,lifEnemy+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,2



; Crucifix - Regular
defb 0,evtMultipleCommands+6					; 
defb 	evtSetProgMoveLife,prgSpecial,mveMisc+&1C,lifEnemy+63	; 
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,128+4
defb 	evtSettingsBank_Save,3



; Crucifix pole
;prgFireMid2+fireLeftWide
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,mveMisc+&1C,0; 
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,13
defb 	evtSettingsBank_Save,4



; Showerhead
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireBottomWide,mveMisc+&24,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,12
defb 	evtSettingsBank_Save,5



; OSD
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&24,lifTimed+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,0
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,0
defb 	evtSettingsBank_Save,6

; Deployer L
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&2C,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+14
defb 	evtSettingsBank_Save,7



; Deployer R
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&2C,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+14
defb 	evtSettingsBank_Save,9



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

; Load Palette

	defb 2,evtMultipleCommands+4			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4D,&47,&4B	

	defb evtReprogramPalette,26*0+6,2;5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;0;32	;delay			
;	defb &54,&4D,&47,&4B	


	defb evtReprogramPalette,26*1+6,2		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
;	defb &54,&4D,&47,&4B	



	defb evtReprogramPalette,26*2+6,2		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0 ; no of switches
	defb 0	;delays			
;	defb &54,&4D,&47,&4B	


;defb 2,evtCallAddress
;defw RasterColorsStartPalleteFlip

defb 2,evtReprogramCustomProg1
defw CustomProgram1Handler


;test
;defb 10
;defb evtJumpToNewTime	
;defw FinalBattle		
;defb 99
;test



;old
;defb 12,evtMultipleCommands+9
;defb evtSettingsBank_Load+8
;defb evtSetMove,&23
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&25
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&1C
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&2C
;defb evtSingleSprite, 0, 140+24,90+24

;defb 12,evtMultipleCommands+9
;defb evtSettingsBank_Load+8
;defb evtSetMove,&1B
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&1D
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&2B
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&2D
;defb evtSingleSprite, 0, 140+24,90+24

;defb 12,evtMultipleCommands+9
;defb evtSettingsBank_Load+8
;defb evtSetMove,&11
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&19
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&21
;defb evtSingleSprite, 0, 140+24,90+24
;defb evtSetMove,&29
;defb evtSingleSprite, 0, 140+24,90+24



;defb 11,evtMultipleCommands+2
;defb evtSettingsBank_Load+7
;defb evtSingleSprite+5

defb 5,evtReprogramShotToDeath
defw CustomObjectKillHandler

defb 5,evtReprogramHitHandler
defw CustomObjectHitHandler


; yume
defb 5,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+10
defb 	evtSaveLstObjToAdd
defw 		yumeObj

defb 15,evtCallAddress
defw ShowInsultTextyume


;defb 20,evtCallAddress
;defw ScreenShakerOff

WaitIntro:

defb 60
defb evtJumpToNewTime	
defw WaitIntro				; pointer
defb 50		


Level_ChibikoLeave:
defb 51,evtMultipleCommands+3
defb evtSettingsBank_Load+0
defb evtSetProgMoveLife,specMoveChibiko,&24,1
defb evtSingleSprite,128+	47,0+24,100+24	; 	



defb 52,evtMultipleCommands+5
defb evtSettingsBank_Load+0
defb evtSetProgMoveLife,prgSpriteBank2,&24,5
defb evtSingleSprite,10,50+24,20+24	; 	
defb evtSingleSprite,11,50+24,20+40+24	; 	
defb evtCallAddress
defw HideChibiko


defb 60
defb evtJumpToNewTime	
defw WaitIntro				; pointer
defb 50					; new time



Level_ChibikoReturn:
defb 51,evtMultipleCommands+4
defb evtSettingsBank_Load+0
defb evtSetProgMoveLife,specMoveChibiko,&24,1
defb evtSingleSprite,128+	47,32+24,100+24	; 	
defb evtCallAddress
defw ShowChibiko


defb 60
defb evtJumpToNewTime	
defw WaitIntro				; pointer
defb 50					; new time



MainBattleLoopFirst:  ;calls to 100 here
defb 101,evtCallAddress
defw StartBossLifeBar

defb 109,evtCallAddress
defw PurgeyumeObject


;defb 101
;defb evtJumpToNewTime	
;defw LevelEnd;ItShallGetTheHose				; pointer
;defb 22;100					; new time



DeployAWeapon:
;defb 110,evtCallAddress
;defw setFinalBattle
;defw SetLauncherStJohn;SetLauncherSilver;SetLauncherMirrors


;ld hl,FinalBattle			
;ld a,100
;call Akuyou_SetLevelTime
;defb 110
;defb evtJumpToNewTime	
;defw FinalBattle				; pointer
;defb 100					; new time


; Launcher Left
defb 110,evtMultipleCommands+6 					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1Protected,&24
LauncherLifeL:defb lifEnemy+30
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite
LauncherSpriteL:defb TwoFrameSprite+9
defb 	evtSettingsBank_Save,8



; Launcher R
defb 110,evtMultipleCommands+6 					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1Protected,&24
LauncherLifeR:defb lifEnemy+30
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite
LauncherSpriteR:defb 	TwoFrameSprite+0
defb 	evtSettingsBank_Save,10



; Deployer
defb 110,evtMultipleCommands+8
defb 	evtSettingsBank_Load+7	;Left
defb 	evtSingleSprite,TwoFrameSprite+14,024,1	
defb 	evtSettingsBank_Load+9	;Right
defb 	evtSingleSprite,TwoFrameSprite+14,160+24-16,1	
defb 	evtSettingsBank_Load+6		;osd
defb 	evtSingleSprite,17,12+24,135+24
defb 	evtSingleSprite,18+128,12+24,149+24
defb 	evtSingleSprite
DeployOSD:defb 20,12+24,145+24	;attack text

defb 110			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54
LauncherPaletteB:	defb &46
LauncherPalette:	defb &40,&4B	



MainBattleLoop:
;


defb 140
defb evtJumpToNewTime	
defw MainBattleLoop	:NextStage1_Plus2		; pointer
defb 100					; new time



ItShallGetTheHose:




; Showerhead
defb 101,evtMultipleCommands+10
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite,128+12,0+24,1
defb 	evtSingleSprite,128+12,80+24-6,1
defb 	evtSingleSprite,128+12,40+24-6,1
defb 	evtSingleSprite,128+12,120+24-6,1
defb 	evtSingleSprite,128+12,160+24-12,1
defb 	evtSettingsBank_Load+6		;osd
defb 	evtSingleSprite,17,12+24,135+24
defb 	evtSingleSprite,18+128,12+24,149+24
defb 	evtSingleSprite,19,12+24,145+24	;attack text

; Crucifix
defb 101,evtMultipleCommands+3
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite,128+4,80+24-8,199+24
defb evtCallAddress
defw 	ScreenShakerOn

;water color
defb 104			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&4D
	defb &5F,&4B	


; Crucifix
defb 104,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24


; Crucifix
defb 106,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24

; Crucifix
defb 108,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24

; Crucifix
defb 110,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24

; Crucifix
defb 112,evtCallAddress
defw 	StopCrucifix


defb 150,evtCallAddress
defw ShowerOff

defb 155
defb evtJumpToNewTime	
defw DeployAWeapon				; pointer
defb 109				; new time



FinalBattle:




; Launcher Left
defb 110,evtMultipleCommands+6 					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1Protected,&24
defb lifEnemy+62
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite
defb TwoFrameSprite+9
defb 	evtSettingsBank_Save,8



; Launcher R
defb 110,evtMultipleCommands+6 					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgCustom1Protected,&24
defb lifEnemy+62
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite
defb 	TwoFrameSprite+0
defb 	evtSettingsBank_Save,10



defb 110			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54
	defb &58
	defb &5B,&4B	


defb 110,evtMultipleCommands+14
defb 	evtSettingsBank_Load+8	;Left
defb	evtSetAnimator,10
defb 	evtSingleSprite,TwoFrameSprite+7,024,1	
defb 	evtSettingsBank_Load+10	;Right
defb	evtSetAnimator,10
defb 	evtSingleSprite,TwoFrameSprite+0,160+24-16,1	

defb 	evtSettingsBank_Load+8	;Left
defb	evtsetMove,&1C
defb	evtSetAnimator,11
defb 	evtSingleSprite,TwoFrameSprite+8,024,200+24
defb 	evtSettingsBank_Load+10	;Right
defb	evtsetMove,&1C
defb	evtSetAnimator,11
defb 	evtSingleSprite,TwoFrameSprite+3,160+24-16,200+24


; Crucifix
defb 111,evtMultipleCommands+4
defb 	evtSettingsBank_Load+3
defb	evtSetAnimator,13
defb 	evtSingleSprite,128+4,80+24-8,199+24
defb evtCallAddress
defw 	ScreenShakerOn


; Crucifix
defb 114,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24


; Crucifix
defb 116,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24

; Crucifix
defb 118,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24

; Crucifix
defb 120,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb 	evtSingleSprite,13,80+24-2,199+24


; Crucifix
defb 122,evtCallAddress
defw 	StopCrucifix


defb 140
defb evtJumpToNewTime	
defw MainBattleLoop
defb 100					; new time
			; new time



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




LevelEnd:

defb 23,evtCallAddress
defw 	CoffeeTimeOn

defb 23,evtCallAddress			;Call a memory location
defw	ClearBadguys


defb 23,evtCallAddress
defw SetScrollUp

;Coin

coinnum equ 31
defb  23,evtMultipleCommands+5					; 3 commands at the same timepoint
defb evtSetProgMoveLife,3,%10001011,64+63
defb evtSetObjectSize,16
defb evtSetAnimator,0
defb evtAddToForeground
defb 	evtSetSprite,128+coinnum;16		

defb 23,evtReprogram_PowerupSprites,128+37,128+38,128+39,128+coinnum	; Define powerup sprites (Drone(2)/speed(2)/power(1)/coin)

defb 24, evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 25,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 26,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 27,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 28,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 29,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 30,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 31,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 32,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 33,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 34,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 35,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 36,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 37,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 38,evtTileSprite+8, 24,24,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 39,evtTileSprite+8, 24,200,24,	128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum,128+coinnum

defb 40,evtCallAddress
defw 	CoffeeTimeOff


;defb 7,evtMultipleCommands+3
;defb 	evtSettingsBank_Load+2
;defb 	evtSetAnimator,6
;defb 	0,128+	30,140+24,155+24	; 	; Single Object sprite 11 (animated)



defb 43,%10001001			;Call a memory location
defw	StopRasterFlip

;Palette Change
defb 44,%01110000+4			; 4 Commands
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




defb 45,%01110000+4			; 4 Commands
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

defb 46,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&0113 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return

SetScrollUp:
	push hl
	ld a,3
	call Akuyou_Background_SetScroll
	pop hl

ret

;org &3f00
LevelInit:
	ld hl,&0C03
	call Akuyou_SetStarArrayPalette
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
	ld a,(iy-1)	;cpcver
	and 128
	jr z,systemis64k
	ld hl,DoCompiledBackground128
	ld (BackgroundSelected_Plus2-2),hl
systemis64k:
	;flip around our play character
	ld a,64
	ld (iy+1),a
	ld (iy+1+Akuyou_PlayerSeparator),a


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
;	ld de,Event_SavedSettings	;Saved Settings
	call AkuYou_Event_StreamInit


	call Akuyou_Music_Restart

;	ld hl, LevelSprites	
;	ld de, Akuyou_PlayerSpritePos
;	call AkuYou_SpritePointerInit



	call Akuyou_ScreenBuffer_Init
;	ld (BackgroundFloodFillQuad_Minus1+1),hl
;	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	call Akuyou_RasterColors_Init

	ld de,InsultHurry
	ld hl,InsultsTwoPlayer
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-7)
	cp 2	
	jr z,SetInsults
	call ShowInsultTextBochan
	ld hl,InsultsBochanOnly
	ld de,InsultHurryBochan
	ld a,(iy+9)
	or a
	jr z,SetInsults
	ld hl,InsultsChibikoOnly
	ld de,InsultHurry
SetInsults:
	ld (PlayerCountSpecificInsultsB_Plus2-2),de
	ld (PlayerCountSpecificInsults_Plus2-2),hl
	push iy
	pop hl
	ld de,-6
	add hl,de
	ld (TimerPos_Plus2-2),hl

	;call Background_SetScrollNone
	;call Background_SetScrollRun
	;call Background_SetScrollSpin

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

	call null :BossLifeBarCall_Plus2 ;call BossLifeBar

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
	call Akuyou_Player_Handler	:CurrentPlayerHandler_Plus2
	;call ChibiAkumasEp2_Player2Start

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

	call InteractiveInsultsText
	

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



	call null :ScreenShakeCall_Plus2


	call Akuyou_ScreenBuffer_Flip
;	ld (BackgroundFloodFillQuad_Minus1+1),hl
;	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl

;	ld a,r
;	bit 1,a ; nz,
;	ld a,0 Randomizer_Plus1
;	ld (Randomizer_Plus1-1),a


	ld a,0 :Randomizer_Plus1
	inc a
	and %00000011
	ld (Randomizer_Plus1-1),a
	call z,StarArrayWarp ; welcome to hell!



	jp LevelLoop

ShowChibiko:
	push hl
;	call Akuyou_Player_Handler	
	ld hl,Akuyou_Player_Handler
	jr HideChibikoB
HideChibiko:
	push hl

;	call Akuyou_Player_Handler	
	ld hl,HideChibikoFirst;ChibiAkumasEp2_Player2Start
HideChibikoB:
	ld (CurrentPlayerHandler_Plus2-2),hl
	;call ChibiAkumasEp2_Player2Start

	pop hl
ret

HideChibikoFirst:
	ld hl,ChibiAkumasEp2_Player2Start
	ld (CurrentPlayerHandler_Plus2-2),hl
	jp Akuyou_Plus_HideSprites
;ret

StopRasterFlip:
	ld a,64
	ld (PaletteNo_Plus1-1),a	; turn off the alternate palette
	ret
ClearBadguys:


	push hl

		ld a,ObjectArraySize
		ld hl,ObjectArrayPointer
ClearBadguysB:
		ld (hl),0
		inc l
		dec a
		jr nz,ClearBadguysB

	ld a,1
	ld i,a
	call Akuyou_DoSmartBombCall
	pop hl
null:ret

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

CoffeeTimeText:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0

defb  "COFFEE TIME","!"+&80,0
CoffeeTimeOn:
	push hl
	ld hl,ShowCoffeeTime
CoffeeTimeB:
	ld (ScreenShakeCall_Plus2-2),hl
	pop hl
ret
CoffeeTimeOff:
	push hl
	ld hl,null
	jr CoffeeTimeB
ShowCoffeeTime:

	ld a,2		;Remember to set the font!
	call Akuyou_SpriteBank_Font

	ld hl,&0E07
	call Akuyou_DrawText_LocateSprite
	ld a,255
	ld i,a
	ld bc,CoffeeTimeText
	jp Akuyou_DrawText_PrintString
;ret;
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

read "Core_ObjectReprogrammers.asm"





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
jp DoCompiledBackground	:BackgroundSelected_Plus2


DoCompiledBackground128:
	ld a,(CompiledBank_Plus2-2)
	xor 3
	ld (CompiledBank_Plus2-2),a
	ld de,(BackgroundSolidFillNextLine_Minus1+1)
	ld a,&C4
	ld hl,&4000	:CompiledBank_Plus2
	call Akuyou_BankSwitch_C0_CallHL

	ret

DoCompiledBackground:
	ld de,(BackgroundSolidFillNextLine_Minus1+1)


read "Stage18_Background64k.asm"


CustomProgram1Handler:
call Akuyou_Timer_GetTimer
LauncherSpeed_Minus1: and %00000010
ret z


ld a,b
cp 80+24
jr nc,CustomProgram1HandlerRight

LauncherActionL_Minus1:	ld a,prgFireFast+fireSingleEast
	ld iyl,a
	jp Akuyou_FireStar

CustomProgram1HandlerRight:
LauncherActionR_Minus1:	ld a,prgFireFast+fireSingleWest
	ld iyl,a
	jp Akuyou_FireStar



Background_Black:
	ld de,&0000
Background_Fill:
	ld b,200
	jp BackgroundSolidFill



Background_SmartBomb:
	ld e,d
jr Background_Fill


SetLauncherMirrors:
	;push hl
		ld a,&49
		ld (LauncherPalette),a

		ld a,&58
		ld (LauncherPaletteB),a

		ld a,prgFireFast+fireRightWide
		ld (LauncherActionL_Minus1+1),a

		ld a,prgFireFast+fireLeftWide
		ld (LauncherActionR_Minus1+1),a

		ld a,%00001000
		ld (LauncherSpeed_Minus1+1),a

		ld a,21
		ld (DeployOSD),a

		ld a,TwoFrameSprite+8
		ld (LauncherSpriteL),a

		ld a,TwoFrameSprite+1
		ld (LauncherSpriteR),a
		ld a,lifEnemy+40
		ld (LauncherLifeR),a
		ld (LauncherLifeL),a

		ld a,4
		ld (LauncherCount),a
;	pop hl
ret


SetLauncherSilver:
	;push hl
		ld a,&5B
		ld (LauncherPalette),a

		ld a,&4E
		ld (LauncherPaletteB),a

		ld a,prgFireFast+fireSingleEast
		ld (LauncherActionL_Minus1+1),a

		ld a,prgFireFast+fireSingleWest
		ld (LauncherActionR_Minus1+1),a

		ld a,%00000010
		ld (LauncherSpeed_Minus1+1),a

		ld a,23
		ld (DeployOSD),a

		ld a,TwoFrameSprite+7
		ld (LauncherSpriteL),a

		ld a,TwoFrameSprite+2
		ld (LauncherSpriteR),a

		ld a,lifEnemy+40
		ld (LauncherLifeR),a
		ld (LauncherLifeL),a

		ld a,6
		ld (LauncherCount),a
		ld a,anmSpawnObject
		ld (LauncherR2),a
		ld (LauncherL2),a
;	pop hl
ret


SetLauncherStJohn:
	;push hl
		ld a,&4A
		ld (LauncherPalette),a

		ld a,&56
		ld (LauncherPaletteB),a

		ld a,prgFireFast+fireRightWide
		ld (LauncherActionL_Minus1+1),a

		ld a,prgFireFast+fireLeftWide
		ld (LauncherActionR_Minus1+1),a

		ld a,%00000100
		ld (LauncherSpeed_Minus1+1),a

		ld a,22
		ld (DeployOSD),a

		ld a,TwoFrameSprite+6
		ld (LauncherSpriteL),a

		ld a,TwoFrameSprite+3
		ld (LauncherSpriteR),a

		ld a,lifEnemy+50
		ld (LauncherLifeR),a
		ld (LauncherLifeL),a

		ld a,8
		ld (LauncherCount),a
		ld a,anmSpawnObject
		ld (LauncherR2),a
		ld (LauncherL2),a
		ld (LauncherR3),a
		ld (LauncherL3),a
;	pop hl
ret
SetLauncherFinale:
setFinalBattle:
	push hl
		ld a,prgFireFast+fireRightWide
		ld (LauncherActionL_Minus1+1),a

		ld a,prgFireFast+fireLeftWide
		ld (LauncherActionR_Minus1+1),a

		ld a,%00000100
		ld (LauncherSpeed_Minus1+1),a

	
		ld hl,CustomObjectHitHandlerDoNothing
		ld (LauncherHit_Plus2-2),hl
		ld hl,FinalBattle			
		ld a,100
		call Akuyou_SetLevelTime
	pop hl
ret





;read "CoreBackground_Quad.asm"
;read "CoreBackground_QuadSprite.asm"
;read "CoreBackground_bitshifter.asm"
;read "CoreBackground_BitShifterDouble.asm"
;read "CoreBackground_TileArray.asm"
read "CoreBackground_SolidFill.asm"
;read "CoreBackground_BitShifterReverse.asm"


;align 256,0
read "Core_StarArrayWarp.asm"



;Warning! This must not cross a 256 byte boundary!
pushde32:push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
push de
jp (hl)




BossLife: defb 32*3

BossColor0:
	ld de,&FFFF
	ld bc,&0000
ret
BossColor1:
	ld de,&0F0F
	ld bc,&FFFF
ret
BossColor2:
	ld de,&F0F0
	ld bc,&0F0F
ret
BossColorFlash:
	ld de,&0000
	ld bc,&0000
	xor a
	ld (BossColorFlashAction_Plus1-1),a
jr BossLifeBarDisplayB
BossColor3:
	ld de,&0000
	ld bc,&F0F0
ret
BossLifeBarInit:
	ld (barinitcount_Plus1-1),a
	ld de,&0000
	ld bc,&FFFF
	jr BossLifeBarDisplay
BossLifeBar:			
	di
	ld a,0	:RegeneratingBoss_Plus1
	or a
	jr z,NoRegen
	ld a,(BossLife)
	inc a
	ld (BossLife),a
	cp 32*3
	jr c,NoRegen

	xor a
	ld (RegeneratingBoss_Plus1-1),a

NoRegen:
	call Akuyou_ScreenBuffer_GetActiveScreen
	ld hl,&2780 +72
	add h
	ld h,a
	ld ixl,4

	ld a,0:barinitcount_Plus1
	inc a
	cp 32
	jr c,BossLifeBarInit

	ld a,1 :BossColorFlashAction_Plus1
	or a
	jr nz,BossColorFlash



	ld a,(BossLife)

	and %01100000
	cp  %01100000
	call z,BossColor0
	cp  %01000000
	call z,BossColor1
	cp  %00100000
	call z,BossColor2
	cp  %00000000
	call z,BossColor3

BossLifeBarDisplayB:
	ld a,(BossLife)
	and %00011111

BossLifeBarDisplay:

	ld (BarFull_Plus2-2),bc
	ld (BarEmpty_Plus2-2),de


	ld b,a
	ld a,32
	sub b
	ld c,a

BossLifeBarLineLoop:	

	push hl
		di
		ld (SpRestoreFillB_Plus2-2),sp
		ld sp,hl
		
		ld a, b
		cp 32
		jp z,BossLifeBarContinue


		ld de,pushde32
		ld a,e
		add b
		ld e,a

		push de
	
			ld de,&0F0F	:BarEmpty_Plus2
			ld hl,BossLifeBarContinue

		ret	;effectively call the pushed DE
BossLifeBarContinue:
		ld a, c
		cp 32
		jp z,BossLifeBarContinueB

		ld de,pushde32
		ld a,e
		add c
		ld e,a

		push de
	
			ld de,&F0F0 	:BarFull_Plus2
			ld hl,BossLifeBarContinueB

		ret	;effectively call the pushed DE

BossLifeBarContinueB:
		ei
		ld sp,&0000:SpRestoreFillB_Plus2

	pop hl

	ld a,8
	add h
	ld h,a
	dec ixl
	jp nz, BossLifeBarLineLoop
ret





StartBossLifeBar:
	push hl
		ld hl,BossMusic
		ld (BossLifeBarCall_Plus2-2),hl
	pop hl
	ret






DiskMap_MusicBoss 	  		equ &24C1 ;36 ;T36-SC1.D00
DiskMap_MusicBoss_Size 			equ 2
DiskMap_MusicBoss_Disk 			equ 0




BossMusic:

	ld hl,BossLifeBar
	ld (BossLifeBarCall_Plus2-2),hl

	nop	:BossMusicDone_Plus1
	ld a,&C9
	ld (BossMusicDone_Plus1-1),a
	
	

	di
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-1)	;cpcver
	and 128
	jr z,BossMusic_systemis64k

	ld a,&C7
	ld de,Akuyou_MusicPos
	ld hl,&6200
	ld bc,&400
	call Akuyou_BankSwitch_C0_BankCopy
jr BossMusicDone

BossMusic_systemis64k:
	call Akuyou_RasterColors_Disable
	;call Akuyou_Music_Stop

	call Akuyou_ScreenBuffer_Reset	
	call Akuyou_CLS
	call Akuyou_Firmware_Restore

	ld a,&C0
	ld hl,DiskMap_MusicBoss
	ld c,DiskMap_MusicBoss_Disk
	ld de,Akuyou_MusicPos
	ld ix,Akuyou_MusicPos+&400
	call Akuyou_LoadDiscSectorZ

	call Akuyou_Firmware_kill
	call Akuyou_RasterColors_Init
BossMusicDone:
	call Akuyou_Music_Restart
	ei
ret





org LevelOrigin+ &3ff0
jp LevelInit; - Level Start &3ff0
jp LevelLoop; - Level loop &3ff3
;jp null     ; - Level resume &3ff6
;jp null     ; - Level Shutdown &3ff9




limit &FFFF

;save direct "T24-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]
save  "lz48\T24-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]



;	ld a,&C0
;	ld hl,DiskMap_Level4
;	ld c,2
;	ld de,Akuyou_LevelStart+&400	;T24-SC1.D02
;	call Akuyou_LoadDiscSector

;	ld a,&C1
;	ld hl,DiskMap_Level4_128	;T27-SC1.D02
;	ld c,2
;	ld de,&D000
;	call Akuyou_LoadDiscSector
