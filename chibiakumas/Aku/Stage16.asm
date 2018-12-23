read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &00 ;Start of the data which is stored on disk
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
incbin "Sprites\STAGE16.SPR"



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
		ld hl,(YumiObj)
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
	jr c,InteractiveInsultsCantDraw

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
InteractiveInsultsText_More2ComeC:
	call InteractiveInsultsText_StartBattleDelayed
	jr InteractiveInsultsText_More2Come
InteractiveInsultsText_More2ComeB:
	call YumiSilent
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
	call z,YumiTalk

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


ShowInsultTextYumi:
	call YumiTalk
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


InteractiveInsultsText_StartBattleDelayed:
	push hl
		ld hl,MainBattleLoopFirst			
		ld a,100
		call Akuyou_SetLevelTime
		call YumiAnimMoveRight
	pop hl
ret ; See if we have reached the end of the string


InteractiveInsultsText_StartBattle:
	ld hl,MainBattleLoopFirst			
	ld a,100
	call Akuyou_SetLevelTime

jp InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
InsultTextBochan: 
db 2,"Level over?",13,"Awww..",13,"I was enjoying that","!"+&80,0
;db " "+&80,0
InsultText: 
;13 =newline
;11 =player 3 walk out in a huff
;10 =end of prebattle speech
;9 = new caption
;8 = new caption +stop enenmy speech anim
;1 = Chibiko
;2 = Bochan
;3 = Enemy
;4 = Achievement
;5 = Boss


db 1,"So, I'm guessing one of those",13,"fucktards will turn up",13,"with their shitty toy then run off.",13,"And I'll beat the shit out of it","!"+&80,0
;db " "+&80,0

InsultsChibikoOnly: 
db "I'm Back!",13,"And this time you will",13,"be surely crushed!"," "+&80,8
db 1,"Here it comes!",13,"Lets see what stupid",13,"shitty thing you brought"," "+&80,8
db 3,"My new Mech creation",13,"Will surely defeat you",13,"Behold!"," "+&80,8
db 1,"Er, The shockwave of that thing landing",13,"destroyed the whole city!",13,"You OK with that?"," "+&80,8
db 3,"It's a small price to pay",13,"to save it from you!"," "+&80,8
db 3,"Now! you will be beaten!",13,"by Mecha ChibikoZilla!"," "+&80,8
db 1,"It's called WHAT","?"+&80,8
db 3,"And ChibikoZuuki!",13,"oh, And Yume is selling",13,"ChibikoZilla action figures"," "+&80,8
db 1,"OK, So today it I have to",13,"beat the living fuck out of you!",13,"Then I'm calling an IP lawyer!"," "+&80,8
db 3,"This conversation is pointless!","!"+&80,11
db 1,"Come back!",13,"I've not finished insulting you!"," "+&80,9
db 1,"You just forefitted your right",13,"to a life without pain!"," "+&80,9
db 1,"I'm going to rip you into",13,"pieces so small the LHC won't",13,"be able to find proof you existed!!"," "+&80
db 0
InsultsBochanOnly: 
db "You may have won last time, But",13,"This time I will defeat you!"," "+&80,8
db 2,"Huh? What's? Why?"," "+&80,8
db 3,"You shall be crushed",13,"by my 'New creation'...",13,"Mecha ChibikoZilla!!","!"+&80,8
db 2,"WHOA! That is AWESOME","!"+&80,8
db 3,"Huh? What, er",13,"And Yume is selling",13,"action figures!","!"+&80,8
db 2,"I want one","!"+&80,8
db 3,"Well, ur, I guess you ca..",13,"This isn't right,",13,"We're supposed to fight!"," "+&80,8
db 2,"Do we have to","?"+&80,8
db 3,"Indeed we do!",13,"It is the way of things!"," "+&80,11
db 2,"Meh","!"+&80
db 0
InsultsTwoPlayer: 
db "I'm Back! My new creation",13,"Will surely defeat you!"," "+&80,8
db 1,"Here it comes!",13,"Lets see what stupid",13,"shitty thing you brought!"," "+&80,8
db 3,"Behold! My new Masterpiece!"," "+&80,8
db 1,"What's that fat ugly piece of fuck?"," "+&80,8
db 3,"I call it...",13,"Mecha ChibikoZilla!"," "+&80,8
db 1,"You call it WHAT?"," "+&80,8
db 2,"Ha!"," "+&80,8
db 3,"And ChibikoZuuki!...",13,"oh, And Yume is selling",13,"ChibikoZilla action",13,"figures on Bee-Bay!"," "+&80,8
db 2,"That sounds AWESOME!"," "+&80,8
db 1,"WTF! You can't do that!",13,"this is THE WORST THING THAT'S",13,"EVER HAPPENED TO ME!"," "+&80,8
db 3,"Such an over reaction!", " "+&80,9
db 2,"HA HA HA! It's IDENTICAL!"," "+&80,8
db 1,"Bochan STOP LAUGHING",13,"or I'll FUCKING DESTROY YOU!",13,"And Yumi!",13,"You think that's clever?"," "+&80,8
db 1,"AARGH! You'll suffer for this!",13,"I'm gonna...",13,"um... er",","+&80,9
db 1,"I'll do SOMETHING that'll make Genghis Khan",13,"look like a pacafist!"," "+&80,11
db 2,"Let's just break it!", " "+&80,9
db 1,"Yeah, OK.", " "+&80
db 0
InsultHurry: 
db 3,"Enough of this bibble!",13,"Let battle commence","!"+&80,11
db 1,"I'm gonna teach you not to fuck with me","!"+&80
db 0
InsultHurryBochan: 
db 3,"Enough!",13,"Let battle commence","!"+&80,11
db 2,"Yeah! Party time","!"+&80
db 0

;InsultAchievement
;db 4,"Achievement Unlocked13
;db   " Curse of Blackavar","!"+&80
;db 0

ObjectPointers:
YumiObj:	defw &6969
objChibikoZilla1:		defw &6969
objChibikoZilla2:		defw &6969
objChibikoZilla3:		defw &6969
objChibikoZilla4:		defw &6969
objChibikoZilla5:		defw &6969
objChibikoZilla6:		defw &6969

objChibikoZilla1b:		defw &6969
objChibikoZilla2b:		defw &6969
objChibikoZilla3b:		defw &6969
objChibikoZilla4b:		defw &6969
objChibikoZilla5b:		defw &6969
objChibikoZilla6b:		defw &6969
objChibikoZooky:		defw &6969
YumiHide:
	push hl
	ld hl,(YumiObj)
	ld (hl),0
	pop hl
ret


YumiSilent:
	push hl
	ld hl,Animator_YumiSilent
	jr YumiDoAnimSwitch
YumiAnimSwitch1:


YumiAnimMoveRight:
	push hl
	ld hl,Animator_YumiWalkRight
	jp YumiDoAnimSwitch

YumiTalk:
;	ld (YumiCurrentAnim),hl
	push hl
	ld hl,Animator_YumiTalk
	jr YumiDoAnimSwitch
YumiDoAnimSwitch:
	ld (YumiCurrentAnim),hl
	pop hl
ret


PurgeYumiObject:
	push hl
		ld hl,&6969
		ld (Yumiobj),hl
	pop hl
	ret

PurgeChibikizillaObject:
	push hl
		ld hl,&6969
		ld (objChibikoZilla1),hl
		ld (objChibikoZilla2),hl
		ld (objChibikoZilla3),hl
		ld (objChibikoZilla4),hl
		ld (objChibikoZilla5),hl
		ld (objChibikoZilla6),hl
		ld (objChibikoZilla1b),hl
		ld (objChibikoZilla2b),hl
		ld (objChibikoZilla3b),hl
		ld (objChibikoZilla4b),hl
		ld (objChibikoZilla5b),hl
		ld (objChibikoZilla6b),hl
	pop hl
	ret

BattleStart:


	push hl
		call FastAnimMCZ
		ld a,0
		ld (NoBackgroundMoves_Plus1-1),a
		ld a,1
		ld (Animator_ChibikoZilla_Body),a
		ld (Animator_ChibikoZilla_Antenna),a

		ld a,%11111100
		ld (GradientMoveA_Plus1-1),a
		ld a,%11111111
		ld (GradientMoveB_Plus1-1),a
		
	pop hl
	ret


ChibikoZookyAttack:
	push hl
		ld hl,(objChibikoZooky)

		inc h
		inc h
		inc h
			ld a,(hl)
			cp 128+8
			jr nz,ChibikoZookyAttackDone
		dec h
		dec h
		dec h

		ld a,8
		call SetObjectAnimator
		ld a,prgFireMid2+fireLeftWide
		call SetObjectProgram
ChibikoZookyAttackDone:
	pop hl
	ret
ChibikoZookyStop:
	push hl
		ld hl,(objChibikoZooky)
		ld a,&24
		call SetObjectMove
	pop hl
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
SakuyaCurrentAnim: 
	defw 0000	;1
YumiCurrentAnim: 
	defw Animator_YumiWalkLeft	;2
BossCurrentAnim:
	defw Animator_ChibikoZilla_Body	;3
	defw Animator_ChibikoZilla_Antenna;4
	defw Animator_SpriteBankAlt;5
	defw Animator_SpawnFireballs	;6
	defw Animator_SpawnMissile		;7
	defw Animator_ChibikoZooky	;8
	defw Animator_ChibikoZookyB 	;9

Animator_ChibikoZooky:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0				;End of loop



Animator_ChibikoZilla_Body:
defb %00000100		;Anim Freq
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmLoop,0,0,0

Animator_ChibikoZilla_Antenna:
defb %00000100		;Anim Freq
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank1,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank3,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank1,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank3,0,0		;Sprite Anim 0
defb anmLoop,0,0,0	
			;End of loop
Animator_SpriteBankAlt:
defb %00000001		;Anim Freq
defb anmProgram,prgSpriteBank1,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank3,0,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop

Animator_SpawnMissile:
defb %00010000		;Anim Freq
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmSpawnObject,8,0,0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop


Animator_SpawnFireballs:
defb %00000001		;Anim Freq
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank1,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank3,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank0,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank1,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank2,0,0		;Sprite Anim 0
defb anmProgram,prgSpriteBank3,0,0		;Sprite Anim 0
defb anmSpawnObject,7,0,0
defb anmLoop,0,0,0				;End of loop

Animator_YumiSilent:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,1,&24,prgSpriteBank1		;Sprite Anim 0
defb anmSpriteMoveProg,1,&24,prgSpriteBank1		;Sprite Anim 0
defb anmSpriteMoveProg,1,&24,prgSpriteBank1		;Sprite Anim 0
defb anmSpriteMoveProg,1,&24,prgSpriteBank1		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop


Animator_YumiTalk:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,0,&24,prgSpriteBank1		;Sprite Anim 0
defb anmSpriteMoveProg,0,&24,prgSpriteBank3		;Sprite Anim 0
defb anmSpriteMoveProg,1,&24,prgSpriteBank1		;Sprite Anim 1
defb anmSpriteMoveProg,1,&24,prgSpriteBank3		;Sprite Anim 1
defb anmLoop,0,0,0	


Animator_YumiWalkLeft:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+0,&22,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+1,&22,0		;Sprite Anim 1
defb anmSpriteMoveProg,TwoFrameSprite+0,&22,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+1,&22,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop

Animator_YumiWalkRight:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+2,&26,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+3,&26,0		;Sprite Anim 1
defb anmSpriteMoveProg,TwoFrameSprite+2,&26,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+3,&26,0		;Sprite Anim 1
defb anmLoop,0,0,0




Animator_ChibikoZookyB:
defb %00000100		;Anim Freq
defb anmMove,&1B,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmMove,&2D,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmMove,&1D,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmMove,&2B,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop


;defb anmSpriteMoveProg,0,&24,prgSpriteBank1		;Sprite Anim 0
;defb anmSpriteMoveProg,0,&24,prgSpriteBank3		;Sprite Anim 0
;defb anmSpriteMoveProg,1,&24,prgSpriteBank1		;Sprite Anim 1
;defb anmSpriteMoveProg,1,&24,prgSpriteBank3		;Sprite Anim 1
;defb anmLoop,0,0,0	





	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y

DoScreenShake:
	push iy
		call AkuYou_Player_GetPlayerVars
		ld a,(iy-16)
	pop iy
	and %00000001
	ret z
	
	push hl
		ld hl,ScreenShakerCommands 
		ld (ScreenShakerNext_Plus2-2),hl
	pop hl
	ret
ScreenShaker:
	ld hl,ScreenShakerDone :ScreenShakerNext_Plus2

	ld a,(hl)
	or a
	jr nz,ScreenShakerB
	ret
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

DestroyCity:

;TileSprite2NumB_Plus1

	ld a,41+2-2
	ld (TileSprite1NumA_Plus1-1),a
	ld (TileSprite1NumB_Plus1-1),a

	ld a,39+1-2
	ld (TileSprite2NumA_Plus1-1),a
	ld (TileSprite2NumB_Plus1-1),a

	ld a,42+2-2
	ld (TileSprite3NumA_Plus1-1),a
	ld (TileSprite3NumB_Plus1-1),a

;TileSprite1Num equ 42
;TileSprite2Num equ 39
;TileSprite3Num equ 41

ret

StopMissile1Animator:
	push hl
		ld hl,(objChibikoZilla3)
		call GetAnimator
		and %11110000
		or 3
	jr SetMissile1AnimatorB
SetMissile1Animator:
	push hl
		ld hl,(objChibikoZilla3)
		call GetAnimator
		and %11110000
		or 7
SetMissile1AnimatorB:
		call SetObjectAnimator
	pop hl
	ret


StopMissile2Animator:
	push hl
		ld hl,(objChibikoZilla2)
		call GetAnimator
		and %11110000
		or 3
	jr SetMissile2AnimatorB
SetMissile2Animator:
	push hl
		ld hl,(objChibikoZilla2)
		call GetAnimator
		and %11110000
		or 7
SetMissile2AnimatorB:
		call SetObjectAnimator
	pop hl
	ret

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


StopFireballAnimator:
	push hl
		ld hl,(objChibikoZilla5)
		call GetAnimator
		and %11110000
		or 4
	jr SetFireballAnimatorB
SetFireballAnimator:
	push hl
		ld hl,(objChibikoZilla5)
		call GetAnimator
		and %11110000
		or 6
SetFireballAnimatorB:
		call SetObjectAnimator
	pop hl
	ret

	
FastAnimMCZ:
	push hl
		ld a,22+128
		ld hl,(objChibikoZilla1)
		call SetObjectSprite
		ld a,23+128
		ld hl,(objChibikoZilla1b)
		call SetObjectSprite

		ld a,20+128
		ld hl,(objChibikoZilla2)
		call SetObjectSprite
		ld a,21+128
		ld hl,(objChibikoZilla2b)
		call SetObjectSprite

		ld a,18+128
		ld hl,(objChibikoZilla3)
		call SetObjectSprite
		ld a,19+128
		ld hl,(objChibikoZilla3b)
		call SetObjectSprite

		ld a,16+128
		ld hl,(objChibikoZilla4)
		call SetObjectSprite
		ld a,17+128
		ld hl,(objChibikoZilla4b)
		call SetObjectSprite

;		ld a,14+12
;		ld hl,(objChibikoZilla5)
;		call SetObjectSprite
;		ld a,15+12
;		ld hl,(objChibikoZilla5b)
;		call SetObjectSprite

;		ld a,12+12
;		ld hl,(objChibikoZilla6)
;		call SetObjectSprite
;		ld a,13+12
;		ld hl,(objChibikoZilla6b)
;		call SetObjectSprite
	pop hl
	ret
DamageMCZ:
	push hl
		ld a,22+12+128
		ld hl,(objChibikoZilla1)
		call SetObjectSprite
		ld a,23+12+128
		ld hl,(objChibikoZilla1b)
		call SetObjectSprite

		ld a,20+12+128
		ld hl,(objChibikoZilla2)
		call SetObjectSprite
		ld a,21+12+128
		ld hl,(objChibikoZilla2b)
		call SetObjectSprite

		ld a,18+12+128
		ld hl,(objChibikoZilla3)
		call SetObjectSprite
		ld a,19+12+128
		ld hl,(objChibikoZilla3b)
		call SetObjectSprite

		ld a,16+12+128
		ld hl,(objChibikoZilla4)
		call SetObjectSprite
		ld a,17+12+128
		ld hl,(objChibikoZilla4b)
		call SetObjectSprite

		ld a,14+12+128
		ld hl,(objChibikoZilla5)
		call SetObjectSprite
		ld a,15+12+128
		ld hl,(objChibikoZilla5b)
		call SetObjectSprite

		ld a,12+12+128
		ld hl,(objChibikoZilla6)
		call SetObjectSprite
		ld a,13+12+128
		ld hl,(objChibikoZilla6b)
		call SetObjectSprite





	pop hl
	ret

SetAllMCZ_Kill:
	push hl
		ld hl,SetObjectY
		ld (SetAllMCZAction_Plus2-2),hl
		ld a,0
	pop hl
	jp SetAllMCZ

SetAllMCZ_Down:
	ld a,&3C
	jr SetAllMCZ_DoMove
SetAllMCZ_Up:
	ld a,&0C
	jr SetAllMCZ_DoMove
SetAllMCZ_Stop:

	ld a,&24
SetAllMCZ_DoMove:
	push hl
		ld hl,SetObjectMove
		ld (SetAllMCZAction_Plus2-2),hl
	pop hl
	jp SetAllMCZ
;ret
SetAllMCZ:
	push hl
		ld hl,(objChibikoZilla1)
		call SetAllMCZAction
		ld hl,(objChibikoZilla2)
		call SetAllMCZAction
		ld hl,(objChibikoZilla3)
		call SetAllMCZAction
		ld hl,(objChibikoZilla4)
		call SetAllMCZAction
		ld hl,(objChibikoZilla5)
		call SetAllMCZAction
		ld hl,(objChibikoZilla6)
		call SetAllMCZAction
		ld hl,(objChibikoZilla1b)
		call SetAllMCZAction
		ld hl,(objChibikoZilla2b)
		call SetAllMCZAction
		ld hl,(objChibikoZilla3b)
		call SetAllMCZAction
		ld hl,(objChibikoZilla4b)
		call SetAllMCZAction
		ld hl,(objChibikoZilla5b)
		call SetAllMCZAction
		ld hl,(objChibikoZilla6b)
		call SetAllMCZAction
	pop hl
ret
SetAllMCZAction:
	jp SetObjectMove :SetAllMCZAction_Plus2

CustomObjectHitHandler:

	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y

di 
exx

;push hl
	;we can only speedup while the tank and Yumi are stopped
jp CanHurry :AllowHurry_Plus2
CanHurry:
	call Akuyou_GetLevelTime	
	cp 95
	jr nc,CantHurry
	cp 40
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

	ld a,iyl
	cp prgSpecial
	ret z

	push hl
	exx
	pop hl
;	inc h;dec h	;	 Animator
;	inc h;dec h	;	 Spritesize never changes
	res 6,l ;dec h

	ld a,(objChibikoZilla1)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla2)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla3)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla4)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla5)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla6)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla1b)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla2b)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla3b)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla4b)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla5b)
	cp l	
	jr z,HitBoss
	ld a,(objChibikoZilla6b)
	cp l	
	jr z,HitBoss

	ld a,(Yumiobj)
	cp l
	jr z,CustomObjectHitHandlerDone
	exx
	ei
	jp Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine


CustomObjectHitHandlerDone:
	ld ixl,lifEnemy+63
exx
ei
ret


BossStage2:
	push hl
		ld hl,MainBattleLoopV2
		ld (NextStage1_Plus2-2),hl
	pop hl
jr CustomObjectHitHandlerDone


BossStage3:
	push hl
		ld hl,MainBattleLoopV3
		ld (NextStage2_Plus2-2),hl
		ld a,%00000100
		ld (Animator_SpawnMissile),a
	pop hl
	call DamageMCZ
jr CustomObjectHitHandlerDone

bosslifeStageB equ 16
BossLifeB: defb bosslifeStageB

HitBoss:
	ld a,(BossLifeB)
	call DoHurt
	ld (BossLifeB),a
	jp z,HitBossActual
	and %00000001
	ld (BossColorFlashAction_Plus1-1),a	;nonzero=flash
	jp CustomObjectHitHandlerDone

HitBossActual:

	ld a,(BossLife)
	or a
	jr z,CustomObjectHitHandlerDone
	dec a
	ld (BossLife),a

	cp 64
	jp z,BossStage2
	cp 32
	jp z,BossStage3
	or a
	jp z,BossDead

	ld a,bosslifeStageB
	ld (BossLifeB),a
jp CustomObjectHitHandlerDone


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
		ld hl,LevelEnd			
		xor a
		call Akuyou_SetLevelTime
	pop hl
jp CustomObjectHitHandlerDone



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


; Animator_Yumi
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireSingleNorthWest,mveMisc+&22,lifEnemy+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,2



; MechaChibikoZilla
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&3C,lifEnemy+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,3
defb 	evtAddToBackground
defb 	evtSetSprite,19
defb 	evtSettingsBank_Save,3



; ChibikoZooky
;prgFireMid2+fireLeftWide
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&21,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+8
defb 	evtSettingsBank_Save,4


; Static Whine
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&24,lifDeadly+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,5



; ShockwaveL
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&60,lifDeadly+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+7
defb 	evtSettingsBank_Save,6

; Fireball
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&60,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+11
defb 	evtSettingsBank_Save,7



; Misile
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveSeaker,lifEnemy+2
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,8

; Explosion
defb 0,evtMultipleCommands+5					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&24,lifDeadly+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSettingsBank_Save,9




; MechaChibikoZilla Final
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireLeftWide,mveMisc+&24,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+8
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

; Load Palette

	defb 2,evtMultipleCommands+4			; 4 Commands
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5D,&5B,&4B	

	defb evtReprogramPalette,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 32;0;32	;delay			
	defb &54,&58,&5B,&4B	


	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
	defb &54,&58,&5B,&4B	



	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5C,&5B,&4B	


defb 2,evtCallAddress
defw RasterColorsStartPalleteFlip










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



defb 5,evtReprogramHitHandler
defw CustomObjectHitHandler


; Yumi
defb 5,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+11
defb 	evtSaveLstObjToAdd
defw 		YumiObj

defb 15,evtCallAddress
defw ShowInsultTextYumi


;MechaChibikoZilla
defb 25,evtMultipleCommands+6
defb evtSettingsBank_Load+3
defb evtSetAnimator,0
defb evtSingleSprite, 22,      110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla1
defb evtSingleSprite, 23, 12*3+110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla1b


defb 26,evtMultipleCommands+6
defb evtSettingsBank_Load+3
defb evtSetAnimator,0
defb evtSingleSprite, 20,      110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla2
defb evtSingleSprite, 21, 12*3+110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla2b

defb 27,evtMultipleCommands+6
defb evtSettingsBank_Load+3
defb evtSetAnimator,0
defb evtSingleSprite, 18,      110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla3
defb evtSingleSprite, 19, 12*3+110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla3b


defb 28,evtMultipleCommands+6
defb evtSettingsBank_Load+3
defb evtSetAnimator,0
defb evtSingleSprite, 16,      110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla4
defb evtSingleSprite, 17, 12*3+110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla4b

defb 29,evtMultipleCommands+6
defb evtSettingsBank_Load+3
defb evtSetAnimator,0*anmFrameNum+  4
defb evtSingleSprite, 14,      110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla5
defb evtSingleSprite, 15, 12*3+110+24,1
defb evtSaveLstObjToAdd
defw 	objChibikoZilla5b


defb 30,evtMultipleCommands+6
defb evtSettingsBank_Load+3
defb evtSetAnimator,1*anmFrameNum+  4
defb evtSingleSprite, 12,      110+24,1+8
defb evtSaveLstObjToAdd
defw 	objChibikoZilla6
defb evtSingleSprite, 13, 12*3+110+24,1+8
defb evtSaveLstObjToAdd
defw 	objChibikoZilla6b

;defb evtSaveLstObjToAdd
;defw 	objSakuya

defb 33,evtCallAddress
defw SetAllMCZ_Stop


;Shockwave
defb 33,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24

defb 33,evtCallAddress
defw DestroyCity

defb 33,evtCallAddress
defw DoScreenShake


;GAO!
defb 35,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24




;ChibikoZooky
defb 38,evtMultipleCommands+3
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160+24,100+24
defb evtSaveLstObjToAdd
defw 	objChibikoZooky




defb 44,evtCallAddress
defw ChibikoZookyStop

;GAO!
defb 50,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24


;Moan!
defb 52,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+4, 120+24,40+24

;Whine!
defb 54,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 4, 110+24,70+24


;Sulk!
defb 56,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+5, 100+24,80+24

;GAO!
defb 58,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24



;Moan!
defb 62,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+4, 120+24,40+24

;Whine!
defb 64,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 4, 110+24,70+24


;Sulk!
defb 66,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+5, 100+24,80+24

;GAO!
defb 68,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24

;Moan!
defb 72,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+4, 120+24,40+24

;Whine!
defb 74,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 4, 110+24,70+24


;Sulk!
defb 76,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+5, 100+24,80+24

;GAO!
defb 78,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24

;Moan!
defb 82,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+4, 120+24,40+24

;Whine!
defb 84,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 4, 110+24,70+24


;Sulk!
defb 86,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+5, 100+24,80+24

;GAO!
defb 88,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24



WaitIntro:

defb 60
defb evtJumpToNewTime	
defw WaitIntro				; pointer
defb 50					; new time


MainBattleLoopFirst:
defb 101,evtCallAddress
defw StartBossLifeBar

defb 101,evtCallAddress
defw ChibikoZookyAttack

defb 101,evtCallAddress
defw BattleStart




;;;;;;;;;;;;;;;;;;;;;;;;;;



MainBattleLoop:


defb 105,evtCallAddress
defw SetFireballAnimator

defb 105,evtCallAddress
defw SetAllMCZ_Up

defb 108,evtCallAddress
defw SetAllMCZ_Down

defb 111,evtCallAddress
defw SetAllMCZ_Stop


defb 111,evtCallAddress
defw DoScreenShake



defb 111,evtCallAddress
defw StopFireballAnimator


;Shockwave
defb 111,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24

defb 120,evtCallAddress
defw PurgeYumiObject


;ChibikoZooky
defb 120,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky

defb 120,evtCallAddress
defw SetMissile1Animator



defb 122,evtCallAddress
defw ChibikoZookyAttack


defb 130,evtCallAddress
defw SetMissile2Animator


defb 140
defb evtJumpToNewTime	
defw MainBattleLoop	:NextStage1_Plus2		; pointer
defb 100					; new time






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





MainBattleLoopV3:


;ChibikoZooky
defb 101,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky


defb 103,evtCallAddress
defw ChibikoZookyAttack


defb 105,evtCallAddress
defw SetFireballAnimator

defb 105,evtCallAddress
defw SetAllMCZ_Up


defb 108,evtCallAddress
defw SetAllMCZ_Down


;ChibikoZooky
defb 109,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky

defb 110,evtCallAddress
defw ChibikoZookyAttack



defb 111,evtCallAddress
defw SetAllMCZ_Stop

defb 111,evtCallAddress
defw DoScreenShake

defb 111,evtCallAddress
defw StopFireballAnimator

;Shockwave
defb 111,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24




;Moan!
defb 112,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+4, 120+24,40+24

;Whine!
defb 114,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 4, 110+24,70+24


;Sulk!
defb 116,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,0
defb evtSingleSprite, 128+5, 100+24,80+24

;GAO!
defb 118,evtMultipleCommands+3
defb evtSettingsBank_Load+5
defb evtSetAnimator,5
defb evtSingleSprite, 5, 100+24,60+24


;ChibikoZooky
defb 120,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky

defb 122,evtCallAddress
defw ChibikoZookyAttack


defb 125,evtCallAddress
defw SetFireballAnimator

defb 125,evtCallAddress
defw SetAllMCZ_Up


defb 128,evtCallAddress
defw SetAllMCZ_Down



defb 131,evtCallAddress
defw SetAllMCZ_Stop

defb 131,evtCallAddress
defw DoScreenShake

defb 131,evtCallAddress
defw StopFireballAnimator

;Shockwave
defb 131,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24

;ChibikoZooky
defb 131,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky

defb 132,evtCallAddress
defw ChibikoZookyAttack


defb 135,evtCallAddress
defw SetFireballAnimator

defb 135,evtCallAddress
defw SetAllMCZ_Up

defb 138,evtCallAddress
defw SetAllMCZ_Down

defb 141,evtCallAddress
defw SetAllMCZ_Stop

defb 141,evtCallAddress
defw DoScreenShake

defb 141,evtCallAddress
defw StopFireballAnimator

;Shockwave
defb 141,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24

defb 141
defb evtJumpToNewTime	
defw MainBattleLoopV3		:NextStage3_Plus2	; pointer
defb 100					; new time





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


MainBattleLoopV2:


;ChibikoZooky
defb 101,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky


defb 103,evtCallAddress
defw ChibikoZookyAttack


defb 105,evtCallAddress
defw SetFireballAnimator

defb 105,evtCallAddress
defw SetAllMCZ_Up


defb 108,evtCallAddress
defw SetAllMCZ_Down


defb 111,evtCallAddress
defw SetAllMCZ_Stop

defb 111,evtCallAddress
defw DoScreenShake

defb 111,evtCallAddress
defw StopFireballAnimator

;Shockwave
defb 111,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24

;ChibikoZooky
defb 120,evtMultipleCommands+4
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+8, 160,100+24
defb evtSetMove,&60
defb evtSaveLstObjToAdd
defw 	objChibikoZooky

defb 122,evtCallAddress
defw ChibikoZookyAttack


defb 125,evtCallAddress
defw SetFireballAnimator

defb 125,evtCallAddress
defw SetAllMCZ_Up



defb 128,evtCallAddress
defw SetAllMCZ_Down



defb 131,evtCallAddress
defw SetAllMCZ_Stop

defb 131,evtCallAddress
defw DoScreenShake

defb 131,evtCallAddress
defw StopFireballAnimator

;Shockwave
defb 131,evtMultipleCommands+4
defb evtSettingsBank_Load+6
defb evtSingleSprite, 128+7, 100+24,-32*1+200+24
defb evtSingleSprite, 128+7, 100+24,-32*2+200+24
defb evtSingleSprite, 128+7, 100+24,-32*3+200+24


defb 140
defb evtJumpToNewTime	
defw MainBattleLoopV2	:NextStage2_Plus2	; pointer
defb 100					; new time





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




LevelEnd:

defb 01,evtCallAddress
defw 	SetAllMCZ_Kill


;Blast
;defb 41,evtMultipleCommands+13
;defb evtSettingsBank_Load+5
;defb evtSetAnimator,9
;defb evtSingleSprite, 6+128, 16*1  +100+24,  24*-1  +80+24
;defb evtSingleSprite, 6+128, 16*0  +100+24,  24*0  +80+24
;defb evtSingleSprite, 6+128, 16*1  +100+24,  24*0  +80+24
;defb evtSingleSprite, 6+128, 16*2  +100+24,  24*0  +80+24
;defb evtSingleSprite, 6+128, 16*0  +100+24,  24*1  +80+24
;defb evtSingleSprite, 6+128, 16*1  +100+24,  24*1  +80+24
;defb evtSingleSprite, 6+128, 16*2  +100+24,  24*1  +80+24
;defb evtSingleSprite, 6+128, 16*0  +100+24,  24*2  +80+24
;defb evtSingleSprite, 6+128, 16*1  +100+24,  24*2  +80+24
;defb evtSingleSprite, 6+128, 16*2  +100+24,  24*2  +80+24
;defb evtSingleSprite, 6+128, 16*1  +100+24,  24*3  +80+24

;Blast
;defb 42,evtMultipleCommands+13
;defb evtSettingsBank_Load+5
;defb evtSetAnimator,9
;defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*-1  +80+24-12
;defb evtSingleSprite, 6+128, 16*0  +100+24+8,  24*0  +80+24-12
;defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*0  +80+24-12
;defb evtSingleSprite, 6+128, 16*2  +100+24+8,  24*0  +80+24-12
;defb evtSingleSprite, 6+128, 16*0  +100+24+8,  24*1  +80+24-12
;defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*1  +80+24-12
;defb evtSingleSprite, 6+128, 16*2  +100+24+8,  24*1  +80+24-12
;defb evtSingleSprite, 6+128, 16*0  +100+24+8,  24*2  +80+24-12
;defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*2  +80+24-12
;defb evtSingleSprite, 6+128, 16*2  +100+24+8,  24*2  +80+24-12
;defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*3  +80+24-12

;reset
defb 1,evtCallAddress

defw PurgeChibikizillaObject



;Blast
defb 1,evtMultipleCommands+7 ;6+2
defb evtSettingsBank_Load+9
defb evtSingleSprite, 6+128, 16*1  +100+24,  24*1  +80+24
defb evtSingleSprite, 6+128, 16*2  +100+24+8,  24*0  +80+24-12
defb evtSingleSprite, 6+128, 16*0  +100+24+8,  24*2  +80+24-12
defb evtSingleSprite, 6+128, 16*2  +100+24,  24*2  +80+24
defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*1  +80+24-12
defb evtSingleSprite, 6+128, 16*1  +100+24,  24*3  +80+24

;Blast
defb 2,evtMultipleCommands+7 ;6+2
defb evtSettingsBank_Load+9
defb evtSingleSprite, 6+128, 16*2  +100+24,  24*0  +80+24
defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*2  +80+24-12
defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*-1  +80+24-12
defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*-1  +80+24-12
defb evtSingleSprite, 6+128, 16*2  +100+24+8,  24*2  +80+24-12
defb evtSingleSprite, 6+128, 16*0  +100+24,  24*2  +80+24

;ChibikoZooky B
defb 3,evtMultipleCommands+9 ;6+2
defb evtSettingsBank_Load+10

defb evtSetAnimator,anmFrameNum*0+ 9
defb evtSingleSprite, 8+128, 16*2  +80+24,  80+24
defb evtSetAnimator,anmFrameNum*4+ 9
defb evtSingleSprite, 8+128, 16*2  +80+24,  80+24
defb evtSetAnimator,anmFrameNum*8+ 9
defb evtSingleSprite, 8+128, 16*2  +80+24,  80+24
defb evtSetAnimator,anmFrameNum*12+ 9
defb evtSingleSprite, 8+128, 16*2  +80+24,  80+24

;Blast
defb 4,evtMultipleCommands+7 ;6+2
defb evtSettingsBank_Load+9
defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*3  +80+24-12
defb evtSingleSprite, 6+128, 16*0  +100+24+8,  24*1  +80+24-12
defb evtSingleSprite, 6+128, 16*1  +100+24,  24*2  +80+24
defb evtSingleSprite, 6+128, 16*1  +100+24,  24*-1  +80+24
defb evtSingleSprite, 6+128, 16*2  +100+24+8,  24*1  +80+24-12
defb evtSingleSprite, 6+128, 16*0  +100+24+8,  24*0  +80+24-12

;Blast
defb 5,evtMultipleCommands+5 ;6+2
defb evtSettingsBank_Load+9
defb evtSingleSprite, 6+128, 16*0  +100+24,  24*0  +80+24
defb evtSingleSprite, 6+128, 16*2  +100+24,  24*1  +80+24
defb evtSingleSprite, 6+128, 16*1  +100+24+8,  24*0  +80+24-12
defb evtSingleSprite, 6+128, 16*1  +100+24,  24*0  +80+24



defb 40,%10001001			;Call a memory location
defw	ClearBadguys



defb 40
defb evtJumpToNewTime	
defw TimeShift			; pointer
defb 22

TimeShift:





defb 23,evtCallAddress
defw 	CoffeeTimeOn


defb 23,evtCallAddress			;Call a memory location
defw	ClearBadguys


defb 23,evtCallAddress
defw SetScrollUp

;Coin

coinnum equ 38-2
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




defb 40,%10001001			;Call a memory location
defw	ClearBadguys






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
	ld hl,	&0111 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return


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
;	ld (BackgroundFloodFillQuad_Minus1+1),hl
	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
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

	call ScreenShaker


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

	call InteractiveInsultsText :ShowCoffeeTime_Plus2
	

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
	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
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


;	call null BossSeekCall_Plus2

	jp LevelLoop

StopRasterFlip:
	ld a,64
	ld (PaletteNo_Plus1-1),a	; turn off the alternate palette
	ret
ClearBadguys:

	ld a,1
	ld i,a
	push hl
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




;TileSprite2NumB_Plus1
TileSprite1Num equ 41-2
TileSprite2Num equ 39-2
TileSprite3Num equ 42-2

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
	ld c,0			:GradientMoveA_Plus1
	call Akuyou_Background_Gradient

	ld de,&0000
	ld b,15
	call BackgroundSolidFill




	;Tree!
	push hl
		ld a,TileSprite1Num	:TileSprite1NumA_Plus1
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
	ld b,87-8-28
	call BackgroundSolidFill

	;Grassy bottom!
	push hl
		ld a,TileSprite3Num	:TileSprite3NumA_Plus1
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,16
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de


	ld de,&0000
	ld b,28
	call BackgroundSolidFill


	ld de,NewGradient2
	ld b,26
	ld c,0			:GradientMoveB_Plus1
	call Akuyou_Background_Gradient


	;Grassy bottom!
	push hl
		ld a,TileSprite2Num	:TileSprite2NumA_Plus1
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,8
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de



;DONE _ NOW DO BITSHIFTS

	ret :NoBackgroundMoves_Plus1


;Bitshift Tree
	ld a,0 :TopSpriteScrollerToggle_Plus1
	cpl
	ld (TopSpriteScrollerToggle_Plus1-1),a
	or a
	jp nz,TopSpriteScroller_Skip

	ld a,TileSprite1Num	:TileSprite1NumB_Plus1
	call GetSpriteMempos	

	ld de,0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,16;42-32
	call BitShifter
TopSpriteScroller_Skip:


	ld a,TileSprite2Num	:TileSprite2NumB_Plus1
	call GetSpriteMempos	
	ld de,0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,8
	call BitShifter


	ld a,TileSprite3Num	:TileSprite3NumB_Plus1
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








;read "CoreBackground_Quad.asm"
read "CoreBackground_QuadSprite.asm"
read "CoreBackground_bitshifter.asm"
;read "CoreBackground_BitShifterDouble.asm"
;read "CoreBackground_TileArray.asm"
read "CoreBackground_SolidFill.asm"
;read "CoreBackground_BitShifterReverse.asm"


;align 256,0
read "Core_StarArrayWarp.asm"

NewGradient:

defb &50,&50	;1; first line
;defb 36,&D0	;2; line num, New byte
;defb 30,&70	;3
defb 24,&A0	;4
defb 20,&50	;5
defb 16,&80	;6
defb 10,&20	;7
defb 6,&00	;8
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
defb 0,&00	;10
defb 255





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
;align 64,&00

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





StartBossLifeBar:
	push hl
;		ld hl,BossLifeBar
;		ld (BossLifeBarCall_Plus2-2),hl

	ld hl,BossMusic
	ld (BossLifeBarCall_Plus2-2),hl


	pop hl
	ret









SetScrollUp:
	push hl
	ld a,3
	call Akuyou_Background_SetScroll
	pop hl

ret
list
CoffeeTimeText:
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0

defb  "COFFEE TIME","!"+&80,0
CoffeeTimeOn:
	push hl
	ld hl,ShowCoffeeTime
CoffeeTimeB:
	ld (ShowCoffeeTime_Plus2-2),hl
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

	ld a,&C4
	ld de,Akuyou_MusicPos
	ld hl,Akuyou_MusicPosAlt
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

;org &5D06
;defb 128
;defb 128/4
;defb 0
;defb 128
;save direct "T14-SC1.D02",LevelOrigin+ LevelDataStart,&4000-LevelDataStart	;address,size...}[,exec_address]
save direct "T14-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


;DiskMap_Level2       		equ &0EC1	;14 T14-SC1.D02
;DiskMap_Level2_128   		equ &11C1	;17 T17-SC1.D02
;DiskMap_Level2_C       		equ &0EC3	;14 T14-SC3.D02
;DiskMap_Level2_D       		equ &0EC4	;14 T14-SC4.D02
;DiskMap_Level2_Disk 		equ DiskMap1
