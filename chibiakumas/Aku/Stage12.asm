read "CoreDefs.asm"
;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &0 ;Start of the data which is stored on disk



org &4000
LevelOrigin:
org LevelOrigin+ LevelDataStart


;LevelTiles
;incbin "Sprites\TILETEST.TLE"
LevelSprites:
;incbin "Sprites\LEVEL1A2.SPR"
incbin "Sprites\STAGE12.SPR"



read "Eventstreamdefinitions.asm"

RasterColors_ColorArray1Alt:
	defb 1
	defb 1				
	defb &54,&5E,&4E,&4B		;Black,DkBlue,LtYellow,White

RasterColors_ColorArray2Alt:
	defb 0	; Switches
;	defb 16	;delay			
;	defb &54,&5D,&59,&4B
;	defb 16	;delay			
;	defb &54,&58,&5F,&4B
RasterColors_ColorArray3Alt:
	defb 0
;	defb 1
;	defb &54,&54,&54,&54		 :IlluminatedPaletteCAlt_Plus2
RasterColors_ColorArray4Alt:
	defb 0 ; no of switches
;	defb 0	;delays			
;	defb &54,&58,&51,&4B		;Black,Red,Grey,White
;	defb 32
;	defb &54,&4C,&51,&4B	





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
	ld de,Akuyou_PlayerSeparator
	add iy,de
	jr InteractiveInsultsText_GotPlayer
AchievementInsult:
	ld hl,&0f17
	jr InteractiveInsultsText_PosReady
Player3Insult:
	push bc
		ld hl,(YumiObj)
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


ShowInsultAchievement:
push hl
	push iy

		call AkuYou_Player_GetPlayerVars
		ld a,(iy-10)
		;Achievements (xxx54321)	-10
		or            %00000001
		ld (iy-10),a
	pop iy


	ld hl,InsultAchievement
	ld a,4
	jr DoShowInsult
ShowInsultTextHurry:

push hl
	ld hl,InsultHurry  :PlayerCountSpecificInsultsB_Plus2
	ld a,3
	jr DoShowInsult
ShowInsultTextYumi:
	call yumiTalk
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
InteractiveInsultsText_StartBattle:
	ld hl,HurryUpIntro
	ld a,69
	call Akuyou_SetLevelTime
jp InteractiveInsultsText_AllOnscreen ; See if we have reached the end of the string
InsultText: 
;13 =newline
;10 =end of prebattle speech
;9 = new caption
;8 = new caption +stop enenmy speech anim
;1 = Chibiko
;2 = Bochan
;3 = Enemy
;4 = Achievement

db 1,"Uh-Oh...",13,"Why has the background",13,"Stopped Moving","?"+&80,9
db 2,"YEY! A boss battle","!"+&80,0

InsultsChibikoOnly: 
db "Thy come-uppence is due",13,"You foul monster!",13,"I shalt send you to Hell!"," "+&80,8
db 1,"Yeah, Right! Hell can't handle me!",13,"Didn't you see the intro of Episode 1?"," "+&80,8
db 3,"You shalt be crushed!",13,"By my 'Kamikaze rabbit' firing",13,"Trojan Bunny Combat Tank!"," "+&80,8
db 1,"Damn, that looks stupid!",13,"And suicide bunnies?"," "+&80,8
db 1,"Do you have any idea how",13,"totally fucked up that is","?"+&80,8
db 3,"I don't care for your words!",13,"Your very existence is a blashpemy!",13,"Prepare to die!"," "+&80,8
db 1,"Well, technically I'm already dead!",13,"but whatever! I'm gonna beat you senseless!"," "+&80
db 10
InsultsBochanOnly: 
db "So we meet at last - foul monster!",13,"I shalt send you to back",13,"to your grave!"," "+&80,8
db 2,"Heh! You're funny","!"+&80,8
db 3,"You shalt be crushed!",13,"By my 'Kamikaze rabbit' firing",13,"Trojan Bunny Combat Tank!"," "+&80,8
db 2,"Bunnies? DONT HURT THE BUNNIES","!"+&80,8
db 3,"They are gladly giving",13,"their lives to clense this",13,"world of your evil!"," "+&80,8
db 2,"OOOH! I'm gonna hurt you now",13,"For the BUNNIES!"," "+&80
db 10
InsultsTwoPlayer: 
db "Thy come-uppence is due",13,"This world has no place for you!",13,"I shalt send you both Hell!"," "+&80,8
db 1,"Yeah, Right! Hell can't handle us!",13,"Didn't you see the intro of Episode 1?"," "+&80,8
db 3,"You shalt be crushed!",13,"By my 'Kamikaze rabbit' firing",13,"Trojan Bunny Combat Tank!"," "+&80,8
db 2,"DONT HURT THE BUNNIES","!"+&80,8
db 1,"You're blowing up peoples pets?",13,"and yet claim YOURE the hero?"," "+&80,8
db 1,"Those attention whores at",13,"'PITA' will have your ass",13,"when they hear about this!"," "+&80,8
db 3,"Shut your foul lying mouth!",13,"Your very existence is a blashpemy!",13,"Prepare to die!"," "+&80,8
db 1,"You think you can talk to us like that?",13,"In our own game?? We're gonna fuck you up!"," "+&80,9
db 2,"Round 1 - Fight!"," "+&80
db 10
InsultHurry: 
db 3,"Gamers today have",13,"no patience!"," "+&80,9
db 1,"Whine whine!",13,"Suck it up, Buttercup!"," "+&80
db 0
InsultHurryBochan: 
db 3,"Gamers today have",13,"no patience!"," "+&80,9
db 2,"Yeah, well, You're BORING!"," "+&80
db 0
InsultAchievement:
db 4,"Achievement Unlocked:",13
db   " Curse of Blackavar!"," "+&80
db 0

ObjectPointers:
YumiObj:	defw &6969
BodyGun1:	defw &6969
BodyGun2:	defw &6969
BodyGun3:	defw &6969
HeadTarget:	defw &6969
Head1:		defw &6969
Head2:		defw &6969
Head3:		defw &6969

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

TankAnimRight:	;Let battle commence!
	push hl
	push de
	ld a,%11111100 
	ld (BackgroundScrollRate1_Plus1-1),a
	ld a,%11111111 
	ld (BackgroundScrollRate2_Plus1-1),a

	ld hl,BossMusic
	ld (BossLifeBarCall_Plus2-2),hl

	ld hl,(BodyGun1)
;	ld a,prgFireFast+fireSingleFastWest
	ld a,prgFireMid+fireLeftWide
	call SetObjectProgram
	
	ld hl,(BodyGun2)
	ld a,prgFireFast+fireSingleFastWest
	call SetObjectProgram

	ld hl,(BodyGun3)
;	ld a,prgFireFast+fireSingleFastWest
	ld a,prgFireMid+fireLeftWide
	call SetObjectProgram

	ld hl,Animator_BunnyTank_RollRight
	ld de,Animator_BunnyTank_BodyStop
	jr TankAnimChange
TankAnimStop:
	push hl
	push de
		ld hl,Animator_BunnyTank_RollStop
		ld de,Animator_BunnyTank_BodyStop
TankAnimChange:
		ld (TankBodyCurrentAnim),de
		ld (TankWheelsCurrentAnim),hl
	pop de
	pop hl
ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
TankWheelsCurrentAnim:
	defw Animator_BunnyTank_RollLeft
YumiCurrentAnim: 
	defw Animator_YumiWalkLeft
TankBodyCurrentAnim:
	defw Animator_BunnyTank_BodyLeft
	defw Animator_BunnyBomb1
	defw Animator_BunnyBomb2
	defw Animator_YumiWalkRight

Animator_BunnyTank_RollStop:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,6,&24,prgSpriteBank0
defb anmSpriteMoveProg,6,&24,prgSpriteBank0
defb anmSpriteMoveProg,6,&24,prgSpriteBank0
defb anmSpriteMoveProg,6,&24,prgSpriteBank0
defb anmLoop,0,0,0				;End of loop 6

Animator_BunnyTank_RollRight:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,6,&24,prgSpriteBank0
defb anmSpriteMoveProg,6,&24,prgSpriteBank1
defb anmSpriteMoveProg,6,&24,prgSpriteBank2
defb anmSpriteMoveProg,6,&24,prgSpriteBank3
defb anmLoop,0,0,0	

Animator_BunnyTank_RollLeft:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,6,&23,prgSpriteBank3
defb anmSpriteMoveProg,6,&23,prgSpriteBank2
defb anmSpriteMoveProg,6,&23,prgSpriteBank1
defb anmSpriteMoveProg,6,&23,prgSpriteBank0
defb anmLoop,0,0,0				;End of loop 6


Animator_BunnyTank_RollRightDamage:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,14,&24,prgSpriteBank0
defb anmSpriteMoveProg,14,&24,prgSpriteBank1
defb anmSpriteMoveProg,14,&24,prgSpriteBank2
defb anmSpriteMoveProg,14,&24,prgSpriteBank3
defb anmLoop,0,0,0	


Animator_BunnyTank_BodyStop:
defb %00000010		;Anim Freq
defb anmMove,&24,0,0
defb anmLoop,0,0,0		

Animator_BunnyTank_BodyLeft:
defb %00000010		;Anim Freq
defb anmMove,&23,0,0
defb anmLoop,0,0,0				










Animator_YumiTalk:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+19,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+20,&24,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop

Animator_YumiSilent:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,21,&24,0		;Sprite Anim 0
defb anmSpriteMoveProg,21,&24,0		;Sprite Anim 0
defb anmLoop,0,0,0				;End of loop



Animator_YumiWalkLeft:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+21,&22,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+22,&22,0		;Sprite Anim 1
defb anmLoop,0,0,0				;End of loop
Animator_YumiWalkRight:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+23,&26,0		;Sprite Anim 0
defb anmSpriteMoveProg,TwoFrameSprite+24,&26,0		;Sprite Anim 1
defb anmLoop,0,0,0

Animator_BunnyBomb1:
defb %00000001		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
;defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmProgram,prgFireHyper+fireBurst,0,0
;defb anmEmpty,0,0,0
defb anmKill,0,0,0

Animator_BunnyBomb2:
defb %00000001		;Anim Freq
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
;defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmProgram,prgFireHyper+fireBurst,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
;defb anmEmpty,0,0,0
defb anmKill,0,0,0


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
	;we can only speedup while the tank and yumi are stopped
	call Akuyou_GetLevelTime	
	cp 69
	jr nc,CantHurry
	cp 43
	jr c,CantHurry
	call ShowInsultTextHurry
	
	ld hl,HurryUpIntro
	ld a,69
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
	ld a,(BodyGun1)
	cp l	
	jr z,HitGun1
	ld a,(BodyGun2)
	cp l	
	jr z,HitGun2
	ld a,(BodyGun3)
	cp l	
	jr z,HitGun3
	ld a,(Head1)
	cp l	
	jr z,HitEars	
	ld a,(HeadTarget)
	cp l	
	jp z,HitHead

	exx
	ei
	jp Akuyou_Object_DecreaseLifeShot	; if this object isn't the boss target, just run the normal routine



CustomObjectHitHandlerDone:
	ld ixl,lifEnemy+63
exx
ei
ret

LifeGun1: defb 32
LifeGun2: defb 32
LifeGun3: defb 32
LifeEars: defb 64

HitGun1:
	ld a,(LifeGun1)
	or a
	jr z,CustomObjectHitHandlerDoneCheckAllGunsDead

	call DoHurt

	ld (LifeGun1),a
	ld (BossColorFlashAction_Plus1-1),a
	jr nz,CustomObjectHitHandlerDoneCheckAllGunsDead
	ld iyh,128+11	;Sprite
	ld iyl,prgSpecial	;Sprite

jr CustomObjectHitHandlerDoneCheckAllGunsDead
HitEars:
	ld a,(lifeEars)
	or a
	jr z,CustomObjectHitHandlerDone

	call DoHurt

	ld (lifeEars),a
;	ld (BossColorFlashAction_Plus1-1),a
	jr nz,CustomObjectHitHandlerDone
	ld iyh,30	;Sprite
	ld iyl,prgSpecial	;Sprite
	call ShowInsultAchievement
jr CustomObjectHitHandlerDone

HitGun2:
	ld a,(LifeGun2)
	or a
	jr z,CustomObjectHitHandlerDoneCheckAllGunsDead

	call DoHurt
	ld (LifeGun2),a
	ld (BossColorFlashAction_Plus1-1),a
	jr nz,CustomObjectHitHandlerDoneCheckAllGunsDead
	ld iyh,128+12	;Sprite
	ld iyl,prgSpecial	;Sprite
jr CustomObjectHitHandlerDoneCheckAllGunsDead

HitGun3:
	ld a,(LifeGun3)
	or a
	jr z,CustomObjectHitHandlerDoneCheckAllGunsDead
	dec a
	ld (LifeGun3),a
;	ld (BossColorFlashAction_Plus1-1),a
	jr nz,CustomObjectHitHandlerDoneCheckAllGunsDead
	ld iyh,128+13	;Sprite
	ld iyl,prgSpecial	;Sprite

	push hl
		ld hl,Animator_BunnyTank_RollRightDamage
		ld (TankWheelsCurrentAnim),hl
	pop hl
jr CustomObjectHitHandlerDoneCheckAllGunsDead

;CustomObjectHitHandlerDoneHurtBoss
;	ld a,(BossLife)

;	call DoHurt

;	ld (BossLife),a
CustomObjectHitHandlerDoneCheckAllGunsDead:
	ld a,(LifeGun1)
	or a
	jr nz,CustomObjectHitHandlerDone
	ld a,(LifeGun2)
	or a
	jr nz,CustomObjectHitHandlerDone
	ld a,(LifeGun3)
	or a
	jp nz,CustomObjectHitHandlerDone
	push hl
		;make bullets go through the head!
		ld hl,(head1)
		ld a,0
		call SetObjectLife
		ld hl,(head2)
		ld a,0
		call SetObjectLife
		ld hl,(head3)
		ld a,0
		call SetObjectLife

		ld hl,SecondBattleLoopStart			
		ld a,150		
		call Akuyou_SetLevelTime
	pop hl
	;if we got here all guns are dead!
jp CustomObjectHitHandlerDone

HitHead:
	ld a,(BossLife)
	or a
	jp z,CustomObjectHitHandlerDone
	call DoHurt

	ld (BossLife),a
	jp z,BossDead
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


read "Core_StarArrayWarp.asm"

BossDead:

	push hl

		ld hl,(HeadTarget)
		xor a
		call SetObjectLife

;		ld hl,(Head2)
;		ld a,128+9
;		call SetObjectSprite
		
		ld hl,(Head3)
		ld a,128+10
		call SetObjectSprite
		
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



defb 0,evtReprogram_PowerupSprites,128+7,128+8,128+9,128+28	; Define powerup sprites

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
defb 	evtSetProgMoveLife,prgFireMid+fireSingleNorthWest,mveMisc+&22,lifImmortal	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+19
defb 	evtSettingsBank_Save,2



; Bunny UP!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,PrgBitShift,mveMisc+&44,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSettingsBank_Save,3


; Bunny Down!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&7C,lifEnemy+6	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+16
defb 	evtSettingsBank_Save,4


; Bunny Seaker 1!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveSeaker+2,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBank_Save,5



; Bunny Seaker 2!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveSeaker+2,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBank_Save,6


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
;	defb &54,&5C,&4E,&4B		;Black,DkBlue,LtYellow,White
	defb &54,&4E,&4A,&4B		;Black,DkBlue,LtYellow,White

	defb evtReprogramPalette,26*0+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0


	defb evtReprogramPalette,26*1+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches

	defb evtReprogramPalette,26*2+6,1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0 ; no of switches

defb 2,evtCallAddress
defw RasterColorsStartPalleteFlip



; Yumi
defb 5,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+11
defb 	evtSaveLstObjToAdd
defw 		YumiObj

defb 15,evtCallAddress
defw ShowInsultTextYumi


defb 28,evtMultipleCommands+4
defb evtSettingsBank_Load+0
defb evtSetProgMoveLife,0,mveBackground+%00000001,lifImmortal	;
defb evtSetAnimator,3
defb evtSingleSprite, 7, 160+24,24*2+32+8-1

;Trojan Bunny - Combat tank!
defb 30,evtMultipleCommands+12
defb evtSettingsBank_Load+0
defb evtSetAnimator,3
defb evtSetObjectSize,24
defb evtSetProgMoveLife,0,mveBackground+%00000001,lifEnemy+63	;
defb evtSingleSprite, 0, 160+24,24*0+32+8
defb evtSaveLstObjToAdd
defw 	Head1
defb evtSetProgMoveLife,prgSpecial,mveBackground+%00000001,lifEnemy+63	;
defb evtSingleSprite, 1, 160+24,24*1+32+8
defb evtSaveLstObjToAdd
defw 	Head2
defb evtSingleSprite, 2, 160+24,24*2+32+8
defb evtSaveLstObjToAdd
defw 	Head3
defb evtSetLife,lifEnemy+63


defb 30,evtMultipleCommands+9
defb evtSingleSprite, 3, 160+24,24*3+32+8+8
defb evtSaveLstObjToAdd
defw 	BodyGun1
defb evtSingleSprite, 4, 160+24,24*4+32+8+8
defb evtSaveLstObjToAdd
defw 	BodyGun2
defb evtSingleSprite, 5, 160+24,24*5+32+8
defb evtSaveLstObjToAdd
defw 	BodyGun3
defb evtSetAnimator,1
defb evtSetLife,0
defb evtSingleSprite, 6+FourFrameSprite, 160+24,24*6+32

defb 30,evtReprogramHitHandler
defw CustomObjectHitHandler

defb 42,evtCallAddress
defw TankAnimStop

HurryUpIntro:
defb 70,evtCallAddress
defw YumiAnimMoveRight


defb 74,evtCallAddress
defw YumiHide

defb 76,evtMultipleCommands+4
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
defb evtSetProgMoveLife,0,&24,lifTimed+3	;
defb evtSingleSprite, 25, 165,150+24-16



defb 80,evtCallAddress
defw TankAnimRight

defb 81
defb evtJumpToNewTime	
defw MainBattleLoop			; pointer
defb 130				; new time

MainBattleLoop:


;bunny up
defb 151,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 152,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 153,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

defb 154,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 155,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

;bunny down
defb 160,evtMultipleCommands+11
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, TwoFrameSprite+16, 16*0+24,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*1+24,12-11

defb evtSingleSprite, TwoFrameSprite+16, 16*2+24,24
defb evtSingleSprite, TwoFrameSprite+16, 16*3+24,12

defb evtSingleSprite, TwoFrameSprite+16, 16*4+24,24+12
defb evtSingleSprite, TwoFrameSprite+16, 16*5+24,12+12

defb evtSingleSprite, TwoFrameSprite+16, 16*6+24,24
defb evtSingleSprite, TwoFrameSprite+16, 16*7+24,12

defb evtSingleSprite, TwoFrameSprite+16, 16*8+24,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*9+24,12-11




;bunny up
defb 171,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 172,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 173,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

defb 174,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 175,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

;bunny down
defb 180,evtMultipleCommands+11
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, TwoFrameSprite+16, 16*0+24+8,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*1+24+8,12-11

defb evtSingleSprite, TwoFrameSprite+16, 16*2+24+8,24
defb evtSingleSprite, TwoFrameSprite+16, 16*3+24+8,12

defb evtSingleSprite, TwoFrameSprite+16, 16*4+24+8,24+12
defb evtSingleSprite, TwoFrameSprite+16, 16*5+24+8,12+12

defb evtSingleSprite, TwoFrameSprite+16, 16*6+24+8,24
defb evtSingleSprite, TwoFrameSprite+16, 16*7+24+8,12

defb evtSingleSprite, TwoFrameSprite+16, 16*8+24+8,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*9+24+8,12-11


defb 240
defb evtJumpToNewTime	
defw MainBattleLoop			; pointer
defb 130					; new time





SecondBattleLoopStart:
defb 151,evtMultipleCommands+4
defb evtSetObjectSize,24
defb evtSetProgMoveLife,0,mveMisc+&24,lifEnemy+63	;
defb evtSingleSprite, 30, 120+24,	45+24
defb evtSaveLstObjToAdd
defw HeadTarget

SecondBattleLoop:

;bunny up
defb 151,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 152,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up

defb 152,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb evtSingleSprite, TwoFrameSprite+17, 8*12+24,48+24+8



;bunny up
defb 153,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 154,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24


defb 154,evtStarburt+fireBurst,130+24,	55+24
;bunny up
defb 155,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

defb 156,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb evtSingleSprite, TwoFrameSprite+17, 8*12+24,48+24+8

defb 158,evtStarburt+fireBurst,130+24+2,	55+24+2

;bunny down
defb 160,evtMultipleCommands+11
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, TwoFrameSprite+16, 16*0+24,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*1+24,12-11

defb evtSingleSprite, TwoFrameSprite+16, 16*2+24,24
defb evtSingleSprite, TwoFrameSprite+16, 16*3+24,12

defb evtSingleSprite, TwoFrameSprite+16, 16*4+24,24+12
defb evtSingleSprite, TwoFrameSprite+16, 16*5+24,12+12

defb evtSingleSprite, TwoFrameSprite+16, 16*6+24,24
defb evtSingleSprite, TwoFrameSprite+16, 16*7+24,12

defb evtSingleSprite, TwoFrameSprite+16, 16*8+24,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*9+24,12-11



defb 160,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb evtSingleSprite, TwoFrameSprite+17, 8*12+24,48+24+12

defb 162,evtStarburt+fireBurst,130+24-2,	55+24-2

defb 164,evtMultipleCommands+2
defb 	evtSettingsBank_Load+6
defb evtSingleSprite, TwoFrameSprite+18, 8*12+24,48+24+12

defb 166,evtStarburt+fireBurst,130+24+4,	55+24+4

defb 168,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb evtSingleSprite, TwoFrameSprite+17, 8*12+24,48+24+12

defb 170,evtStarburt+fireBurst,130+24,	55+24

;bunny up
defb 171,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24
;bunny up
defb 172,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

defb 172,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb evtSingleSprite, TwoFrameSprite+17, 8*12+24,48+24+12


;bunny up
defb 173,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

defb 174,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24


defb 174,evtStarburt+fireBurst,130+24-4,	55+24+4
;bunny up
defb 175,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb evtSingleSprite, TwoFrameSprite+15, 150+24,32+24

defb 176,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb evtSingleSprite, TwoFrameSprite+17, 8*12+24,48+24+12

defb 178,evtStarburt+fireBurst,130+24+6,	55+24-6


;bunny down
defb 180,evtMultipleCommands+11
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, TwoFrameSprite+16, 16*0+24+8,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*1+24+8,12-11

defb evtSingleSprite, TwoFrameSprite+16, 16*2+24+8,24
defb evtSingleSprite, TwoFrameSprite+16, 16*3+24+8,12

defb evtSingleSprite, TwoFrameSprite+16, 16*4+24+8,24+12
defb evtSingleSprite, TwoFrameSprite+16, 16*5+24+8,12+12

defb evtSingleSprite, TwoFrameSprite+16, 16*6+24+8,24
defb evtSingleSprite, TwoFrameSprite+16, 16*7+24+8,12

defb evtSingleSprite, TwoFrameSprite+16, 16*8+24+8,24-11
defb evtSingleSprite, TwoFrameSprite+16, 16*9+24+8,12-11


defb 180,evtMultipleCommands+2
defb 	evtSettingsBank_Load+6
defb evtSingleSprite, TwoFrameSprite+18, 8*12+24,48+24+12

defb 182,evtStarburt+fireBurst,130+24-6,	55+24+6

defb 183
defb evtJumpToNewTime	
defw SecondBattleLoop			; pointer
defb 150					; new time

LevelEnd:



defb 23,evtCallAddress
defw 	CoffeeTimeOn

defb 23,evtCallAddress			;Call a memory location
defw	ClearBadguys


defb 23,evtCallAddress
defw SetScrollUp

;Coin

coinnum equ 28
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


;defb 6,evtMultipleCommands+4
;defb evtSettingsBank_Load+0
;defb evtSetAnimator,0
;defb evtSetProgMoveLife,0,&24,lifTimed+30	;
;defb evtSingleSprite, 25, 165,150+24-16


defb 7,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSetAnimator,6
defb 	0,128+	30,140+24,155+24	; 	; Single Object sprite 11 (animated)



;skip moving the player as the tank hurts us!
;defb 10,%01110000+3			; 3 commands at the same timepoint
;defb evtSetProgMoveLife,prgMovePlayer,&24,10
;defb 	evtSetAnimator,0
;defb 	0,128+	30,140+24,100+24	; 	; Single Object sprite 11 (animated)


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
	ld hl,	&010D 				;load level 2
	jp	Akuyou_ExecuteBootStrap	; Start the game, no return


;org &3f00
LevelInit:

	; wipe our memory, to clear out any junk from old levels
;	ld de,LevelOrigin+1
;	ld hl,LevelOrigin
;	ld bc,&5FF
;	ld (hl),0
;	ldir 


	;ld a, StarArraySize
	;ld hl,StarArrayPointer
	;call AkuYou_StarArrayInit_Enemy 

	;ld a, PlayerStarArraySize
	;ld hl,PlayerStarArrayPointer
	;call AkuYou_StarArrayInit_Player 

	;ld a,ObjectArraySize
	;ld hl,ObjectArrayPointer
	;call AkuYou_ObjectArray_Init


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
;	ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	call Akuyou_RasterColors_Init

	ld de,InsultHurryBochan
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

	call InteractiveInsultsText	:ShowCoffeeTime_Plus2
	

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
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl

;	ld a,r
;	bit 1,a ; nz,
	ld a,r
	xor 0 :Randomizer_Plus1
	ld (Randomizer_Plus1-1),a
	and %00000010;%00001110

	call z,StarArrayWarp ; welcome to hell!

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
	ld c,%0 :BackgroundScrollRate1_Plus1
	call Akuyou_Background_Gradient

	ld de,&0000
	ld b,55+25+8+42
	call BackgroundSolidFill



	ld de,NewGradient2
	ld b,30
	ld c,%0 :BackgroundScrollRate2_Plus1
	call Akuyou_Background_Gradient


	;Grassy bottom!
;	push hl
;		ld a,24
;		call GetSpriteMempos	
;		ex hl,de
;	pop hl
	;push de				;MUST BE BYTE ALIGNED!
;		ld b,8
;	ld de,Tile_Start
;		call BackgroundFloodFillQuadSprite
;	pop de

ret

;DONE _ NOW DO BITSHIFTS




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
;read "CoreBackground_bitshifter.asm"
;read "CoreBackground_TileArray.asm"
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
save direct "T14-SC1.D01",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]


