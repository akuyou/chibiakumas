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
incbin "Sprites\STAGE14.SPR"



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
	defb &54,&4F,&5A,&4B

RasterColors_ColorArray2Alt:
	defb 1
	defb 0				
	defb &54,&4F,&5A,&4B
RasterColors_ColorArray3Alt:
	defb 1
	defb 0				
	defb &54,&4F,&5A,&4B
RasterColors_ColorArray4Alt:
	defb 1
	defb 0				
	defb &54,&4F,&5A,&4B




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
	push bc
		ld hl,(objSakuya)
		ld a,(hl)
		sub 38
		srl a
		srl a
		srl a
		ld b,a

		inc h
		ld a,(hl)
		sub 12+64
		srl a
		srl a
		ld h,a
		ld l,b
		
	pop bc
	jr InteractiveInsultsText_PosReady


Player3Insult:
	push bc
		ld hl,(YumeObj)
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
	call YumeSilent
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
	call z,YumeTalk

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
ShowInsultTextHurry:

push hl
	ld hl,InsultHurry  :PlayerCountSpecificInsultsB_Plus2
	ld a,3
	jr DoShowInsult

ShowInsultTextBoss:
push hl
	ld hl,InsultBoss
	ld a,5
	jr DoShowInsult


ShowInsultTextYume:
	call YumeTalk
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
		ld hl,HurryUpIntroDelayed
		ld a,63
		call Akuyou_SetLevelTime
		call YumeAnimMoveRight
	pop hl
ret ; See if we have reached the end of the string


InteractiveInsultsText_StartBattle:
	ld hl,HurryUpIntroB
	ld a,74
	call Akuyou_SetLevelTime
jp InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
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


db " "+&80,0

InsultsChibikoOnly: 
db "We meet again! Count Chibiko!",13
db "I've brought a companion who'll",13
db "send you back to your grave","!"+&80,8
db 1,"What's with the 'Count' shit?",13,"Enough of the dated vampire stereotypes!",13,"and since when did you have any friends","!"+&80,8
db 3,"You know 'Sakuya-chan'?",13
db "I gave her REAL magic powers!",13
db "Like Us she fights for justice","!"+&80,8
db 1,"That wannabe 'Magical Girl' who lurks",13,"round the town wearing a miniskirt",13,"that barely covers her pants","?"+&80,8
db 1,"Don't make me laugh!",13,"All she's fighting for is a photo op",13,"on a milk carton","!"+&80,8
;db 3,"You're all talk '","!"+&80,8
db 3,"I've no time to talk to",13
db "Chibiko 'queen of the dumbed!",13
db "I'm channeling 'Mehdonah' for a",13
db "paid recording session","!"+&80,8
db 1,"Chanelling? But She's not even dead","!"+&80,8
db 3,"That's a technicallity I'm not",13
db "letting get between me and $500",13
db "worth of Pakurimon dolls","!"+&80
db 10
InsultsBochanOnly: 
db "Well, if it isn't Ko-Chibi's",13
db "braindead brother","!"+&80,8
db 2,"Your mean! I hate you","!"+&80,8
db 3,"I've brought my friend Mahou",13
db "Shoujo 'Sakuya' to meet and beat",13
db "you!"," "+&80,8
db 3,"After she's finished with you",13
db "There won't be enough left",13
db "for Chibiko to ressurect again","!"+&80,8
db 2,"I HATE Sakuya - She's STUPID,",13,"and a GIRL, and UGLY,",13,"and SMELLY, and STUPID","!"+&80,8
db 3,"You said Stupid twice","!"+&80,8
db 2,"I like stupid","!"+&80,8
db 3,"Why do I even bother talking to ",13
db   "you? I might as well talk to a",13
db   "spectrum user!"," "+&80,8
db 3,"Come back with Chibiko next time","!"+&80
db 10
InsultsTwoPlayer: 
db "Well if it isn't Akuma and",13,"Akuma-er","!"+&80,8
db 2,"Shut up Yume! You're rude","!"+&80,8
db 3,"Today I, Yume Yuusha will prove my",13
db   "awesomeness as supreme Alchemist",13
db   "and Sorcerer and Exorcist",13
db   "By purging you two monsters","!"+&80,8
db 2,"You're a SUPREME BIGMOUTH!","!"+&80,8
db 1,"HA! nice one Bochan!",13,"that's funny because it's true","!"+&80,8
db 3,"Say what you want!",13
db  "The newly empowered 'Magical girl",13
db  "Card Hoarder Sakuya' will finish",13,"you off","!"+&80,8
db 1,"Soo, by 'prove yourself' you meant",13,"let someone else do all the work",13,"while you sit on the sofa",13,"watching cartoons & eating icecream","?"+&80,8
db 3,"Why, That's... You! YOU!!!", "!"+&80,9
db 3,"I'm not standing for this", "!"+&80,11
db 1,"Nooo, you're going home to sulk",13,"& eat ice cream - AREN'T YOU!",13,"You're SO going to get fat one day","!"+&80
db 1,"And I'll be here laughing at you",13,"with my unchanging wasteline","!"+&80
db 0
InsultHurry: 
db 3,"Why do I waste my time?",13,"I could be watching",13,"Pakurimon","!"+&80,9
db 1,"WELL FUCK OFF THEN! NO ONE WANTS YOU HERE","!"+&80
db 0
InsultHurryBochan: 
db 3,"Why do I waste my time?",13,"I could be watching Pakurimon","!"+&80,9
db 2,"HA HA! You Suck!","!"+&80
db 0

InsultBoss: 
db 5,"You've been a very very bad child!",13,"and Naughty children must be punished","!"+&80,9
db 1,"Oh, I hate you so, so much!",13
db  "I swear, you're the most annoying",13
db  "entity on the planet!","!"+&80
db 0
;InsultAchievement
;db 4,"Achievement Unlocked13
;db   " Curse of Blackavar","!"+&80
;db 0

ObjectPointers:
YumeObj:	defw &6969

objSakuya:		defw &6969
objSakuyaShield:	defw &6969
objBricks:		defw &6969

YumeHide:
	push hl
	ld hl,(YumeObj)
	ld (hl),0
	pop hl
ret


YumeSilent:
	push hl
	ld hl,Animator_YumeSilent
	jr YumeDoAnimSwitch
YumeAnimSwitch1:


YumeAnimMoveRight:
	push hl
	ld hl,Animator_YumeWalkRight
	jp YumeDoAnimSwitch

YumeTalk:
;	ld (YumeCurrentAnim),hl
	push hl
	ld hl,Animator_YumeTalk
	jr YumeDoAnimSwitch
YumeDoAnimSwitch:
	ld (YumeCurrentAnim),hl
	pop hl
ret


BossAnimStop:
	push hl

		ld hl,(objSakuya)
		ld a,&24
		call SetObjectMove
		ld a,12
		call SetObjectSprite
		ld a,1
		call SetObjectAnimator
		
	pop hl

ret

BossSeekStart:			; Seek to A  - Set MetTargetAction_Plus2 to the call to run on completion
	ld hl,(objSakuya)
	ld h,(hl)

	cp h
	jr c,DoBossSeekUp
DoBossSeekDown:
	ld (BossDownTarget_Plus1-1),a
	ld hl,BossSeekTickDown
	ld (BossSeekCall_Plus2-2),hl
	ld a,&2C
	ret
DoBossSeekUp:
	ld (BossUpTarget_Plus1-1),a
	ld hl,BossSeekTickUp
	ld (BossSeekCall_Plus2-2),hl
	ld a,&1C
	ret
BossSeekTickDown:
	ld hl,(objSakuya)
	ld a,(hl)
	cp 0	:BossDownTarget_Plus1
	ret c
jr BossSeekMetTarget

BossSeekTickUp:
	ld hl,(objSakuya)
	ld a,(hl)
	cp 0	:BossUpTarget_Plus1
	ret nc
BossSeekMetTarget:
	ld hl,null
	ld (BossSeekCall_Plus2-2),hl
	jp null :MetTargetAction_Plus2
ret
SpawnSmiley:
	push de
	push bc
		push hl
			ld hl,(objSakuya)
			;C=y ;b=x
			ld C,(hl)
			inc h
			ld B,(hl)
			di
			exx
			ld a,7	
			call Akuyou_DoObjectSpawn
			exx
			ei

		pop hl
	
	pop bc
	pop de
ret



SpawnFlower:
	push de
	push bc
		push hl
			ld hl,(objSakuya)
			;C=y ;b=x
			ld a,(hl)
			add 16
			ld c,a
			inc h
			ld B,(hl)

			di
			exx
			ld a,6
			call Akuyou_DoObjectSpawn
			exx
			ei
		pop hl
	pop bc
	pop de
ret
SpawnShield:
	push de
	push bc
		push hl		
			ld hl,(objSakuya)		; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
			;C=y ;b=x
			ld a,(hl)
			sub 8
			ld c,a
			inc h
			ld B,(hl)
			inc h
			ld a,(hl)
			ld (RestoreMove_Plus1-1),a

			dec h
			dec h

			set 6,l
			ld a,(hl)
			ld (RestoreAnimator_Plus1-1),a
;			di
			exx
			push af
				ld a,3
				call Akuyou_DoObjectSpawn
				ld (objSakuyaShield),hl
			pop af
			
			exx
;			ei
		ld hl,(objSakuyaShield)
		;C=y ;b=x
		inc h
		inc h
		ld (hl),0:RestoreMove_Plus1
		;inc h
		dec h
		dec h
		set 6,l
		ld a,0:RestoreAnimator_Plus1
		and %11110000	;keep frame but change animator - needed to make sure shield moves with Sakuya!
		or 4
		ld (hl),a

		pop hl
	pop bc
	pop de
ret

BossAnimChange_SeekDying:
	push hl
		ld hl,Animator_Sakuya_Dying
		ld (SakuyaCurrentAnim),hl

		ld hl,BossAnimChange_SeekDead
		ld (MetTargetAction_Plus2-2),hl
		ld a,165
		call BossSeekStart	;Returns with Y move for object

		ld hl,(objSakuya)
		call SetObjectMove
		ld a,1
		call SetObjectAnimator

	pop hl
ret

BossAnimChange_SeekDead:
	push hl
		ld hl,Animator_Sakuya_Dead
		ld (SakuyaCurrentAnim),hl

		ld hl,(objSakuya)
		call SetObjectMove
		ld a,1
		call SetObjectAnimator

	pop hl
ret


BossAnimChange_SeekCentre1:
	push hl
		ld hl,Animator_Sakuya_RunSimple
		ld (SakuyaCurrentAnim),hl

		ld hl,BossAnimChange_RunFirst
		ld (MetTargetAction_Plus2-2),hl
		ld a,170
		call BossSeekStart	;Returns with Y move for object
		ld hl,(objSakuya)
		call SetObjectMove
		ld a,1
		call SetObjectAnimator


		ld hl,Animator_YumeWalkRight
		ld (YumeCurrentAnim),hl

	;init boss life bar
	ld hl,BossMusic
	ld (BossLifeBarCall_Plus2-2),hl

	pop hl
	call ShowInsultTextBoss
ret


BossAnimChange_RunFirst:
	push hl
		;start the battle hit handler
		ld hl,CantHurry
		ld (AllowHurry_Plus2-2),hl

		ld hl,HitSakuya
		ld (HitSakuyaHandler_Plus2-2),hl

		ld hl,(objBricks)
		ld a,&22
		call SetObjectMove
		ld hl,(objSakuya)
		ld a,&14
		call SetObjectMove
		ld a,1
		call SetObjectAnimator
		ld hl,Animator_Sakuya_Run
		ld (SakuyaCurrentAnim),hl

		xor a
		call Akuyou_Timer_SetCurrentTick
		call Background_SetScrollRun
	pop hl
;	call ShowInsultTextBoss

	jp BossAnimChange_HeartShield
ret


BossAnimChange_RunFirstAgain:
	push hl
		ld hl,(objSakuya)
		ld a,1
		call SetObjectAnimator
		xor a
		call Akuyou_Timer_SetCurrentTick

	pop hl
ret


BossAnimChange_HeartShield:

;HeartShield
		push hl
			push bc
			call Akuyou_GetLevelTime
			pop bc
			ld (EndHeartPointer_Plus2-2),hl
			ld (EndHeartTime_Plus1-1),a
			ld hl,(objSakuya)
			ld a,(hl)
			sub 8
			ld (BigHeartY_Plus1-1),a
			inc h
			ld a,(hl)
			ld (BigHeartX_Plus1-1),a

			ld hl,HeartShield
			ld a,59
			call Akuyou_SetLevelTime
		pop hl
ret

BossAnimChange_Stop:
	push hl
		ld hl,(objSakuya)
		ld a,&24
		call SetObjectMove
		ld a,1
		call SetObjectAnimator
		ld hl,Animator_Sakuya_Stop
		ld (SakuyaCurrentAnim),hl
		
	pop hl
ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
SakuyaCurrentAnim: 
	defw Animator_Sakuya_Stop 	;1
YumeCurrentAnim: 
	defw Animator_YumeWalkLeft	;2
TankBodyCurrentAnim:
	defw Animator_Sakuya_Left	;3
	defw Animator_HeartShield	;4
	defw null	;5
	defw Animator_YumeWalkRight	;6
	defw Animator_Fire_Notes	;7
	defw Animator_Fire_Flowers	;8
	defw Animator_Smiley 		;9
	defw Animator_Fire_Heart	;10

Animator_Sakuya_Stop:
defb %00000010		;Anim Freq
defb anmSprite,12,0,0
defb anmLoop,0,0,0				;End of loop 6



Animator_Sakuya_RunSimple: ;19,20
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+13,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+14,0,0		;Sprite Anim 1 
defb anmLoop,0,0,0				;End of loop


Animator_Sakuya_Run: ;19,20
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+13,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+14,0,0		;Sprite Anim 1 
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmCondjmp, %01000000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+13,&34,prgFireSlow+fireSmallBurst		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+14,&34,prgFireSlow+fireSmallBurst		;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+13,&14,prgFireSlow+fireSmallBurst		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+14,&14,prgFireSlow+fireSmallBurst	;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop



Animator_HeartShield: ;19,20
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+19,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+19,0,0		;Sprite Anim 1 
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmCondjmp, %01000000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+19,&34,0		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+19,&34,0		;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+19,&14,0		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+19,&14,0	;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop

Animator_Sakuya_Fight:
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+15,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+16,0,0		;Sprite Anim 1 
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmCondjmp, %01000000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+15,&34,prgFireMid+fireSmallBurst		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+16,&34,prgFireMid+fireLeftWide		;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+15,&14,prgFireMid+fireSmallBurst		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+16,&14,prgFireMid+fireLeftWide	;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop


Animator_Sakuya_Left: ;21,22
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,6,&23,prgSpriteBank3
defb anmSpriteMoveProg,6,&23,prgSpriteBank2
defb anmSpriteMoveProg,6,&23,prgSpriteBank1
defb anmSpriteMoveProg,6,&23,prgSpriteBank0
defb anmLoop,0,0,0				;End of loop 6


Animator_Sakuya_RightDamage:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,14,&24,prgSpriteBank0
defb anmSpriteMoveProg,14,&24,prgSpriteBank1
defb anmSpriteMoveProg,14,&24,prgSpriteBank2
defb anmSpriteMoveProg,14,&24,prgSpriteBank3
defb anmLoop,0,0,0	


Animator_Sakuya_Stop2:
defb %00000010		;Anim Freq
defb anmMove,&24,0,0
defb anmLoop,0,0,0		

Animator_Sakuya_Left2:
defb %00000010		;Anim Freq
defb anmMove,&23,0,0
defb anmLoop,0,0,0				



Animator_Fire_Notes:
defb %00000010		;Anim Freq
defb anmSprite,128+1,0,0
defb anmSprite,128+5,0,0
defb anmCondLoop,%00010000,0,0			;Repeat loop
defb anmSpriteMoveProg,128+1,&21,0
defb anmSpriteMoveProg,128+5,&21,0
defb anmLoop,0,0,0	





Animator_Fire_Flowers:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,128+2,&1A,0
defb anmSpriteMoveProg,128+6,&1A,0
defb anmSpriteMoveProg,128+2,&1A,0
defb anmSpriteMoveProg,128+6,&1A,0
defb anmSpriteMoveProg,128+2,&2A,0
defb anmSpriteMoveProg,128+6,&2A,0
defb anmSpriteMoveProg,128+2,&2A,0
defb anmSpriteMoveProg,128+6,&2A,0
defb anmLoop,0,0,0	



Animator_Smiley:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+3,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+7,0,0		;Sprite Anim 1 
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmCondjmp, %01000000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+3,&1B,0		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+7,&1B,0		;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+3,&2B,0		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+7,&2B,0	;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop


Animator_Fire_Heart:
defb %00000010		;Anim Freq
defb anmSprite,128+0,0,0
defb anmSprite,128+4,0,0
defb anmLoop,0,0,0	



Animator_YumeTalk:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+10,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+11,&24,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop

Animator_YumeSilent:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,10,&24,prgSpriteBank2		;Sprite Anim 0
defb anmSpriteMoveProg,10,&24,prgSpriteBank2		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop



Animator_YumeWalkLeft:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+8,&22,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+9,&22,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop

Animator_YumeWalkRight:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+29,&26,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+30,&26,0		;Sprite Anim 1
defb anmLoop,0,0,0





Animator_Sakuya_Dying:
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSpriteMoveProg,TwoFrameSprite+17,&34,0
defb anmLoop,0,0,0				;End of loop

Animator_Sakuya_Dead:
defb %00000010		;Anim Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSpriteMoveProg,TwoFrameSprite+18,&24,0
defb anmLoop,0,0,0				;End of loop









	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y


CustomObjectHitHandler:

di 
exx

;push hl
	;we can only speedup while the tank and Yume are stopped
jp CanHurry :AllowHurry_Plus2
CanHurry:
	call Akuyou_GetLevelTime	
	cp 60
	jr nc,CantHurry
	cp 16
	jr c,CantHurry
	
	ld hl,CustomObjectHitHandlerSkip
	ld (AllowHurry_Plus2-2),hl

	call ShowInsultTextHurry


	ld hl,HurryUpIntro
	ld a,64
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
	ld a,(objSakuya)
	cp l	
	jp z,CustomObjectHitHandlerDone		:HitSakuyaHandler_Plus2
	ld a,(Yumeobj)
	cp l
	jr z,CustomObjectHitHandlerDone
	exx
	ei
	jp Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine



CustomObjectHitHandlerDone:
	ld ixl,lifEnemy+63
CustomObjectHitHandlerSkip:
exx
ei
ret
ShieldLife:defb 32
ShieldRegen:defb 32


HitSakuya:
	ld a,(ShieldLife)
	or a
	jp z,HitSakuyaNoShield

	call DoHurt

	ld (ShieldLife),a
	or a
	jp z,SakuraShieldGone
	and %00000010
	ld (BossColorFlashAction_Plus1-1),a	;nonzero=flash
	jp HitSakuyaDone
SakuraShieldGone:
	push hl
		ld hl,(objSakuya)
		ld a,(hl)
		sub 24
		ld (GiantHeartYPos1_Plus1-1),a
		ld (GiantHeartYPos2_Plus1-1),a
		ld (GiantHeartYPos3_Plus1-1),a
		ld (GiantHeartYPos4_Plus1-1),a

		ld hl,GiantHeartAttack
		ld a,98
		call Akuyou_SetLevelTime
		ld a,32
		ld (ShieldRegen),a
	
		ld hl,Animator_Sakuya_Fight
		ld (SakuyaCurrentAnim),hl

		call Background_SetScrollSpin

		ld hl,(objSakuyaShield)
		ld a,&60
		call SetObjectMove
		ld a,&0
		call SetObjectAnimator

	pop hl

jp HitSakuyaDone
HitSakuyaNoShield:

	ld a,(BossLife)
	or a
	jr z,HitSakuyaDone

	call DoHurt
	ld (BossLife),a
	jp z,BossDead

	ld a,(ShieldRegen)
	call DoHurt
	ld (ShieldRegen),a
	or a
	jp z,ShieldDoRegen
	jr nz,HitSakuyaDone

;	ld iyh,128+11	;Sprite
;	ld iyl,prgSpecial	;Sprite

HitSakuyaDone:
jp CustomObjectHitHandlerDone

ShieldDoRegen:

		push hl
		ld hl,Animator_Sakuya_Run
		ld (SakuyaCurrentAnim),hl
		exx
		ld a,c
		add 24
		ld (HeartShieldRepeat+2),a
		ld a,b
		ld (HeartShieldRepeat+3),a
		exx
		ld hl,HeartShieldRepeat
		ld a,104
		call Akuyou_SetLevelTime
		pop hl
		call Background_SetScrollRun
		ld a,32
		ld (ShieldLife),a
		call SpawnShield
		
jr HitSakuyaDone


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


read "Core_StarArrayWarp.asm"

BossDead:

	push hl

		call BossAnimChange_SeekDying


		ld hl,LevelEnd			
		ld a,22
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



defb 0,evtReprogram_PowerupSprites,128+7,128+8,128+9,128+31	; Define powerup sprites



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


; Animator_Yume
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireSingleNorthWest,mveMisc+&22,lifEnemy+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,2



; BigHeart
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&60,lifEnemy+63	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+19
defb 	evtSettingsBank_Save,3


; GiantHeart
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&61,lifEnemy+60	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,96
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+19
defb 	evtSettingsBank_Save,4


; Notes
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSettingsBank_Save,5



; Flowers
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSettingsBank_Save,6

; Smiley
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&2B,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+1
defb 	evtSettingsBank_Save,7



; heart
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+3
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBank_Save,8


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;       Start of level data

; Blocks
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&24,lifImmortal	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb evtSingleSprite, 24, 120+24,120+24+16

defb 0,	evtSaveLstObjToAdd
defw objBricks

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
;	defb &54,&5C,&4E,&4B		;Black,DkBlue,LtYellow,White
	defb &54,&5F,&56,&4B		;Black,DkBlue,LtYellow,White

	defb evtReprogramPalette,26*0+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 32				
	defb &54,&4F,&5A,&4B


	defb evtReprogramPalette,26*1+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0
	defb 0				
	defb &54,&4F,&5A,&4B

	defb evtReprogramPalette,26*2+6,6		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1
	defb 0				
	defb &54,&48,&56,&4B

defb 2,evtCallAddress
defw RasterColorsStartPalleteFlip









;defb 13,evtReprogramObjectBurstPosition
;defb 140+24,90+24

;outer burst
;defb 14,evtMultipleCommands+9
;defb evtSettingsBank_Load+8
;defb evtSetMove,&09,evtBurstSprite
;defb evtSetMove,&0A,evtBurstSprite
;defb evtSetMove,&0B,evtBurstSprite
;defb evtSetMove,&0C,evtBurstSprite

;defb 14,evtMultipleCommands+14
;defb evtSetMove,&0D,evtBurstSprite
;defb evtSetMove,&0E,evtBurstSprite
;defb evtSetMove,&0F,evtBurstSprite
;defb evtSetMove,&39,evtBurstSprite
;defb evtSetMove,&3A,evtBurstSprite
;defb evtSetMove,&3B,evtBurstSprite
;defb evtSetMove,&3C,evtBurstSprite

;defb 14,evtMultipleCommands+14
;defb evtSetMove,&3D,evtBurstSprite
;defb evtSetMove,&3E,evtBurstSprite
;defb evtSetMove,&3F,evtBurstSprite
;defb evtSetMove,&11,evtBurstSprite
;defb evtSetMove,&19,evtBurstSprite
;defb evtSetMove,&21,evtBurstSprite
;defb evtSetMove,&29,evtBurstSprite

;defb 14,evtMultipleCommands+12
;defb evtSetMove,&31,evtBurstSprite
;defb evtSetMove,&17,evtBurstSprite
;defb evtSetMove,&1F,evtBurstSprite
;defb evtSetMove,&27,evtBurstSprite
;defb evtSetMove,&2F,evtBurstSprite
;defb evtSetMove,&37,evtBurstSprite
;






;small burst
;defb 14,evtMultipleCommands+13
;defb evtSettingsBank_Load+8
;defb evtSetMove,&52,evtBurstSprite
;defb evtSetMove,&53,evtBurstSprite
;defb evtSetMove,&54,evtBurstSprite
;defb evtSetMove,&55,evtBurstSprite
;defb evtSetMove,&56,evtBurstSprite
;defb evtSetMove,&5A,evtBurstSprite	
;
;defb 14,evtMultipleCommands+12
;defb evtSetMove,&5B,evtBurstSprite	 
;defb evtSetMove,&5C,evtBurstSprite	
;defb evtSetMove,&5D,evtBurstSprite	
;defb evtSetMove,&5E,evtBurstSprite
;defb evtSetMove,&6A,evtBurstSprite	
;defb evtSetMove,&6B,evtBurstSprite	 
;
;defb 14,evtMultipleCommands+12
;defb evtSetMove,&6C,evtBurstSprite	
;defb evtSetMove,&6D,evtBurstSprite	
;defb evtSetMove,&6E,evtBurstSprite
;defb evtSetMove,&72,evtBurstSprite	
;defb evtSetMove,&73,evtBurstSprite	 
;defb evtSetMove,&74,evtBurstSprite	

;defb 14,evtMultipleCommands+12
;defb evtSetMove,&75,evtBurstSprite	
;defb evtSetMove,&76,evtBurstSprite
;defb evtSetMove,&62,evtBurstSprite
;defb evtSetMove,&63,evtBurstSprite		
;defb evtSetMove,&65,evtBurstSprite
;defb evtSetMove,&66,evtBurstSprite






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


; Yume
defb 5,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+11
defb 	evtSaveLstObjToAdd
defw 		YumeObj

defb 15,evtCallAddress
defw ShowInsultTextYume


;defb 28,evtMultipleCommands+4
;defb evtSettingsBank_Load+0
;defb evtSetProgMoveLife,0,mveBackground+%00000001,lifImmortal	;
;defb evtSetAnimator,3
;defb evtSingleSprite, 7, 160+24,24*2+32+8-1


;Mid heart
;defb 30,evtMultipleCommands+2
;defb evtSettingsBank_Load+3
;defb evtSingleSprite, 128+19, 120+24,100+24


;Giant Heart
;defb 40,evtMultipleCommands+6
;defb evtSettingsBank_Load+4
;defb evtSingleSprite, 128+20, 12*0+120+24,100+24
;defb evtSetLife,0
;defb evtSingleSprite, 128+21, 12*1+120+24,100+24
;defb evtSingleSprite, 128+22, 12*2+120+24,100+24
;defb evtSingleSprite, 128+23, 12*3+120+24,100+24

;sakuya
defb 70,evtMultipleCommands+6
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
defb evtSetObjectSize,40
defb evtSetProgMoveLife,0,&3C,lifEnemy+63	;
defb evtSingleSprite, 128+12, 120+24,1
defb evtSaveLstObjToAdd
defw 	objSakuya

defb 75,evtCallAddress
defw BossAnimStop


WaitIntro:

defb 60
defb evtJumpToNewTime	
defw WaitIntro				; pointer
defb 30					; new time






HeartShield:
;Mid heart
defb 60,evtMultipleCommands+4
defb evtSettingsBank_Load+3
defb evtSetMove,&14
defb evtSingleSprite 
defb	128+19
defb 	120+24 :BigHeartX_Plus1
defb 	100+24 :BigHeartY_Plus1
defb evtSaveLstObjToAdd
defw 	objSakuyaShield

;Reset animator to sync with heartshield
defb 60,evtCallAddress
defw 	BossAnimChange_RunFirstAgain

defb 60
defb evtJumpToNewTime	
defw WaitIntro 	:EndHeartPointer_Plus2				; pointer
defb 30		:EndHeartTime_Plus1				; new time



HeartShieldRepeat:

defb 105,evtReprogramObjectBurstPosition

defb 	140+24,90+24

;outer burst
defb 105,evtMultipleCommands+9
defb evtSettingsBank_Load+8
defb evtSetMove,&09,evtBurstSprite
defb evtSetMove,&0A,evtBurstSprite
defb evtSetMove,&0B,evtBurstSprite
defb evtSetMove,&0C,evtBurstSprite

defb 105,evtMultipleCommands+14
defb evtSetMove,&0D,evtBurstSprite
defb evtSetMove,&0E,evtBurstSprite
defb evtSetMove,&0F,evtBurstSprite
defb evtSetMove,&39,evtBurstSprite
defb evtSetMove,&3A,evtBurstSprite
defb evtSetMove,&3B,evtBurstSprite
defb evtSetMove,&3C,evtBurstSprite

defb 105,evtMultipleCommands+14
defb evtSetMove,&3D,evtBurstSprite
defb evtSetMove,&3E,evtBurstSprite
defb evtSetMove,&3F,evtBurstSprite
defb evtSetMove,&11,evtBurstSprite
defb evtSetMove,&19,evtBurstSprite
defb evtSetMove,&21,evtBurstSprite
defb evtSetMove,&29,evtBurstSprite

defb 105,evtMultipleCommands+12
defb evtSetMove,&31,evtBurstSprite
defb evtSetMove,&17,evtBurstSprite
defb evtSetMove,&1F,evtBurstSprite
defb evtSetMove,&27,evtBurstSprite
defb evtSetMove,&2F,evtBurstSprite
defb evtSetMove,&37,evtBurstSprite



MainBattleLoop:

defb 105,evtCallAddress
defw SpawnSmiley

defb 110,evtCallAddress
defw SpawnSmiley

defb 115,evtCallAddress
defw SpawnSmiley

defb 120,evtCallAddress
defw SpawnSmiley

defb 120
defb evtJumpToNewTime	
defw MainBattleLoop			; pointer
defb 100					; new time




HurryUpIntro:
defb 67,evtCallAddress
defw YumeAnimMoveRight

defb 70,evtMultipleCommands+6
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
defb evtSetObjectSize,40
defb evtSetProgMoveLife,0,&3C,lifEnemy+63	;
defb evtSingleSprite, 128+12, 120+24,1
defb evtSaveLstObjToAdd
defw 	objSakuya

defb 75,evtCallAddress
defw BossAnimStop

HurryUpIntroB:
defb 80,evtCallAddress
defw BossAnimChange_SeekCentre1

defb 80
defb evtJumpToNewTime	
defw MainBattleLoop			; pointer
defb 100				; new time



HurryUpIntroDelayed:

defb 65,evtCallAddress
defw BossAnimStop

defb 75,evtCallAddress
defw BossAnimChange_SeekCentre1

defb 75
defb evtJumpToNewTime	
defw MainBattleLoop			; pointer
defb 100				; new time


GiantHeartAttack:
defb 99,evtMultipleCommands+6
defb evtSettingsBank_Load+4
defb evtSingleSprite, 128+20, 12*0+120+24
defb 	100+24	:GiantHeartYPos1_Plus1
defb evtSetLife,0
defb evtSingleSprite, 128+21, 12*1+120+24
defb 	100+24	:GiantHeartYPos2_Plus1
defb evtSingleSprite, 128+22, 12*2+120+24
defb 	100+24	:GiantHeartYPos3_Plus1
defb evtSingleSprite, 128+23, 12*3+120+24
defb 	100+24	:GiantHeartYPos4_Plus1

AttackBattleLoop2:
;Note Attack
defb 103,evtCallAddress
defw SpawnFlower

defb 106,evtCallAddress
defw SpawnFlower

defb 109,evtCallAddress
defw SpawnFlower



defb 110,evtMultipleCommands+5
defb evtSettingsBank_Load+5
defb evtSingleSprite+2
defb evtSingleSprite+5
defb evtSingleSprite+8
defb evtSingleSprite+11

defb 112,evtCallAddress
defw SpawnFlower

defb 114,evtCallAddress
defw SpawnFlower

defb 115,evtMultipleCommands+5
defb evtSettingsBank_Load+5
defb evtSingleSprite+4
defb evtSingleSprite+7
defb evtSingleSprite+10
defb evtSingleSprite+13

defb 116,evtCallAddress
defw SpawnFlower

defb 118,evtCallAddress
defw SpawnFlower

defb 120,evtMultipleCommands+5
defb evtSettingsBank_Load+5
defb evtSingleSprite+3
defb evtSingleSprite+6
defb evtSingleSprite+9
defb evtSingleSprite+12

defb 120,evtCallAddress
defw SpawnFlower

defb 122,evtCallAddress
defw SpawnFlower

defb 124,evtCallAddress
defw SpawnFlower

defb 125,evtMultipleCommands+5
defb evtSettingsBank_Load+5
defb evtSingleSprite+2
defb evtSingleSprite+5
defb evtSingleSprite+8
defb evtSingleSprite+11

defb 126,evtCallAddress
defw SpawnFlower

defb 128,evtCallAddress
defw SpawnFlower

AttackBattleLoop:
defb 130
defb evtJumpToNewTime	
defw AttackBattleLoop2			; pointer
defb 100					; new time



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




defb 40,%10001001			;Call a memory location
defw	ClearBadguys

defb 40
defb evtJumpToNewTime	
defw TimeShift			; pointer
defb 4

TimeShift:





defb 5,%10001001			;Call a memory location
defw	ClearBadguys


;defb 7,evtMultipleCommands+3
;defb 	evtSettingsBank_Load+2
;defb 	evtSetAnimator,6
;defb 	0,128+	30,140+24,155+24	; 	; Single Object sprite 11 (animated)



defb 15,%10001001			;Call a memory location
defw	StopRasterFlip

;Palette Change
defb 16,%01110000+4			; 4 Commands
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




defb 17,%01110000+4			; 4 Commands
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

defb 18,evtCallAddress			;Call a memory location
defw	EndLevel


EndLevel:
	pop hl	;
	ld hl,	&010F 				;load level 2
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
;	call AkuYou_SpritePointerInit



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

	call Background_SetScrollNone
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


	call null :BossSeekCall_Plus2

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


Background_SetScrollNone:
xor a
ld (BackgroundScrollRate2_Plus1-1),a
ld (BackgroundScrollRate1_Plus1-1),a
ld a,&C9
ld (Background_NoScrollRet_Plus1-1),a
ret



Background_SetScrollRun:
ld a,&FF
ld (BackgroundScrollRate2_Plus1-1),a
ld a,%00001000
ld (BackgroundScrollRate1_Plus1-1),a
ld a,0
ld (Background_NoScrollRet_Plus1-1),a
ld a,7
ld (BitshiftPosMountains_Plus2-2),a
ld (SkyScrollDir_Plus1-1),a
ld hl,BitShifterDouble
ld (Background_GrassBitshift_Plus2-2),hl
ld hl,BitShifter
ld (Background_MountainsBitshift_Plus2-2),hl 
ld hl,null
ld (Background_SkyBitshift_Plus2-2),hl 
 
ret

Background_SetScrollSpin:
ld a,&FF
ld (BackgroundScrollRate2_Plus1-1),a
ld (BackgroundScrollRate1_Plus1-1),a
ld a,0
ld (Background_NoScrollRet_Plus1-1),a
ld (BitshiftPosMountains_Plus2-2),a
ld a,1
ld (SkyScrollDir_Plus1-1),a
ld hl,BitShifter
ld (Background_GrassBitshift_Plus2-2),hl

ld hl,BitShifterReverse
ld (Background_MountainsBitshift_Plus2-2),hl  
ld (Background_SkyBitshift_Plus2-2),hl 
ret


TileSprite1Num equ 26
TileSprite2Num equ 25
TileSprite3Num equ 27

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
	



	;Stars
	push hl
		ld a,TileSprite3Num
		call GetSpriteMempos	
		ex hl,de
	pop hl
	;push de				;MUST BE BYTE ALIGNED!
		ld b,16
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de


	ld a,1 :SkyScrollDir_Plus1
	call Akuyou_Background_GradientScroll



	ld de,NewGradient
	ld b,24
	ld c,%11111111 :BackgroundScrollRate1_Plus1
	call Akuyou_Background_Gradient

	ld de,&0000
	ld b,15
	call BackgroundSolidFill



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
	ld b,87-8
	call BackgroundSolidFill


	ld a,0
	call Akuyou_Background_GradientScroll

	ld de,NewGradient2
	ld b,26
	ld c,%11111111 :BackgroundScrollRate2_Plus1
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

	ld de,&0F0F
	ld b,8
	call BackgroundSolidFill

	ret:Background_NoScrollRet_Plus1

;DONE _ NOW DO BITSHIFTS

	ld a,TileSprite1Num
	call GetSpriteMempos	

	ld de,0007 :BitshiftPosMountains_Plus2
	add hl,de

	ld b,&8		; Bytes - always 8
	ld c,16;42-32
	call BitShifter  :Background_MountainsBitshift_Plus2



	ld a,TileSprite2Num
	call GetSpriteMempos	
	ld de,0007 
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,16
	call BitShifterDouble :Background_GrassBitshift_Plus2

	ld a,TileSprite3Num
	call GetSpriteMempos	
;	ld de,0007
;	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,16
	call BitShifterReverse :Background_SkyBitshift_Plus2

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
read "CoreBackground_BitShifterDouble.asm"
;read "CoreBackground_TileArray.asm"
read "CoreBackground_SolidFill.asm"
read "CoreBackground_BitShifterReverse.asm"
align 256,0


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
defb 0,&00	;10
defb 255





DiskMap_MusicBoss 	  		equ &24C1 ;36 ;T36-SC1.D00
DiskMap_MusicBoss_Size 			equ 2
DiskMap_MusicBoss_Disk 			equ 0



BossMusic:
	di

	ld hl,BossLifeBar
	ld (BossLifeBarCall_Plus2-2),hl

	nop	:BossMusicDone_Plus1
	ld a,&C9
	ld (BossMusicDone_Plus1-1),a
	


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
save "lz48\T24-SC1.D01",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


