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
incbin "Sprites\STAGE15.SPR"



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
	ld hl,&0c16
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
	or            %00000100
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
db 4,"       Achievement Unlocked:",13
db   "     Thermo-Nuclear Monster!!",13
db   "50 Megatons of 'Fuck You' Power","!"+&80
db 0

InsultsTwoPlayer: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db 1,"Huh? What's all this sci-fi shit","?"+&80,9
db 2,"Now it's the future","!"+&80,9
db 1,"If the FUTURE was NOW,",13,"then it'd be the PRENSENT,",13,"DumbAss","!"+&80,9
db 2,"That makes my brains hurt","!"+&80,0
db 1,"Well, at least that's something!",13,"I didn't think you had any brains","!"+&80,0

InsultsBochanOnly:
db 2,"It's the Future!",13,"Mech Warrior Bochan to the rescue","!"+&80,9
db 2,"Yeoooooowm!!","!"+&80,0

InsultsChibikoOnly: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db  "What the fuck?",13,"Why is there a Sci-Fi Level!",13,"In a 'gothic' theme game?","!"+&80,9
db 1,"I swear the developer of this game",13,"would lose in a battle of wits",13,"with a stuffed iguana","!"+&80,0


ObjSun:	defw &6969
ObjSunFire: defw &6969

InsultText1: 
;db  "Blah blah blah",13,"blah blah blah blah blah blah blah","!"+&80,9,"blah blah blah blah blah blah blah!",13,"blah blah blah blah blah blah blah!","!"+&80
;db &0
db 2," "," "+&80,0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
defw Animator_Satellite_Attack ;1
defw Animator_Satellite_Defence   ;2
defw Animator_CyberPunk    ;3
defw Animator_AES	   ;4
defw Animator_Holowhip     ;5
defw Animator_Toaster       ;6
defw Animator_Toast     ;7
defw Animator_Toast2    ;8
defw Animator_Germinator   ;9
defw Animator_Unvader    ;10
defw Animator_Cow      ;11
defw Animator_CubeGenerator   ;12
defw Animator_Cube      ;13
defw Animator_AESstatic ;14

Animator_Satellite_Attack:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+7,&2B,prgFireFast+fireSingleSouth		
defb anmSpriteMoveProg,TwoFrameSprite+8,&2B,prgFireFast+fireSingleSouth
defb anmSpriteMoveProg,TwoFrameSprite+7,&2B,prgFireFast+fireSingleSouth		
defb anmSpriteMoveProg,TwoFrameSprite+8,&2B,prgFireFast+fireSingleSouth
defb anmSpriteMoveProg,TwoFrameSprite+7,&1B,prgFireFast+fireSingleSouth		
defb anmSpriteMoveProg,TwoFrameSprite+8,&1B,prgFireFast+fireSingleSouth
defb anmSpriteMoveProg,TwoFrameSprite+7,&1B,prgFireFast+fireSingleSouth		
defb anmSpriteMoveProg,TwoFrameSprite+8,&1B,prgFireFast+fireSingleSouth
defb anmLoop,0,0,0				;End of loop

Animator_Satellite_Defence:
; First byte is the 'Tick map' which defines when the animation should update
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+9,&2B,0
defb anmSpriteMoveProg,TwoFrameSprite+10,&2B,0
defb anmSpriteMoveProg,TwoFrameSprite+9,&2B,0
defb anmSpriteMoveProg,TwoFrameSprite+10,&2B,0
defb anmSpriteMoveProg,TwoFrameSprite+9,&1B,0
defb anmSpriteMoveProg,TwoFrameSprite+10,&1B,0
defb anmSpriteMoveProg,TwoFrameSprite+9,&1B,0
defb anmSpriteMoveProg,TwoFrameSprite+10,&1B,0
defb anmLoop,0,0,0				;End of loop

Animator_Germinator
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,26,&24,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,26,&24,prgFireFast+fireSmallBurst
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,27+128,&25,0
defb anmSpriteMoveProg,28,&24,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,28,&24,prgFireFast+fireTopWide
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0				;End of loop

Animator_CyberPunk:
defb %00000001		;Anim Freq
defb anmSpriteMoveProg,1,&22,prgSmartBombableSpriteBank0
defb anmSpriteMoveProg,1,&22,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,1,&22,prgSmartBombableSpriteBank0
defb anmSpriteMoveProg,1,&22,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,2,&24,prgFireHyper+fireSingleNorthWest
defb anmSpriteMoveProg,2,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,2,&24,prgFireHyper+fireSingleNorthWest
defb anmSpriteMoveProg,2,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,2,&24,prgFireHyper+fireSingleNorthWest
defb anmSpriteMoveProg,2,&23,prgSmartBombableSpriteBank2
defb anmSpriteMoveProg,2,&24,prgFireHyper+fireSingleNorthWest
defb anmSpriteMoveProg,2,&23,prgSmartBombableSpriteBank2
defb anmLoop,0,0,0				;End of loop

Animator_AESstatic:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+42,&23,prgFireFast+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&23,prgFireFast+fireOuterBurst
defb anmSpriteMoveProg,TwoFrameSprite+42,&23,prgFireFast+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&23,prgFireFast+fireBurst

defb anmSpriteMoveProg,TwoFrameSprite+42,&23,prgFireFast+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&23,prgFireFast+fireOuterBurst

defb anmLoop,0,0,0				;End of loop

Animator_AES:
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,TwoFrameSprite+22,&23,0
defb anmSpriteMoveProg,TwoFrameSprite+25,&23,0
defb anmCondLoop,%01000000,0,0			;Repeat loop
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireTopLeft
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireTopLeft
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireTopLeft
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireTopLeft
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireTopLeft
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireLeftWide
defb anmSpriteMoveProg,TwoFrameSprite+42,&24,prgFireHyper+fireTopLeft

defb anmLoop,0,0,0				;End of loop

Animator_Holowhip:
defb %00000010		;Anm Freq
; all remaining bytes are anim frames in the form Command-Var-Var-Var
defb anmSprite,TwoFrameSprite+14,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+20,0,0		;Sprite Anim 1 
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmCondjmp, %01000000,7*anmFrameNum,0			;Anim switch
defb anmSpriteMoveProg,TwoFrameSprite+14,&1B,prgFireMid2+fireOuterBurst		;Sprite Anim 4
defb anmSpriteMoveProg,TwoFrameSprite+20,&1B,prgFireMid2+fireOuterBurst		;Sprite Anim 5
defb anmLoop,0,0,0				;End of loop 6
defb anmSpriteMoveProg,TwoFrameSprite+14,&2B,prgFireMid2+fireOuterBurst		;Sprite Anim 7
defb anmSpriteMoveProg,TwoFrameSprite+20,&2B,prgFireMid2+fireOuterBurst		;Sprite Anim 8
defb anmLoop,0,0,0				;End of loop


Animator_Toaster:
defb %00001000		;Anim Freq
defb anmMove,&23,0,0
defb anmMove,&24,0,0
defb anmSpawnObject,6,0,0
defb anmMove,&24,0,0
defb anmSpawnObject,7,0,0
defb anmMove,&24,0,0
defb anmSpawnObject,8,0,0
defb anmMove,&23,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Toast:
defb %00000010		;Anim Freq
defb anmMove,&43,0,0
defb anmMove,&43,0,0
defb anmMove,&43,0,0
defb anmMove,&43,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmMove,&7B,0,0
defb anmLoop,0,0,0				;End of loop

Animator_Toast2:
defb %00000010		;Anim Freq
defb anmMove,&45,0,0
defb anmMove,&45,0,0
defb anmMove,&45,0,0
defb anmMove,&45,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmMove,&7D,0,0
defb anmLoop,0,0,0				;End of loop


Animator_Unvader
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,23,&15,0		 		;Sprite Anim 0
defb anmSpriteMoveProg,23,&15,0		 		;Sprite Anim 0
defb anmSpriteMoveProg,23,&15,0		 		;Sprite Anim 0
defb anmSpriteMoveProg,23,&35,0		 		;Sprite Anim 0

defb anmSprite,TwoFrameSprite+23,0,0		;Sprite Anim 0
defb anmSprite,TwoFrameSprite+24,0,0		;Sprite Anim 0
defb anmSpawnObject,9,0,0
defb anmLoop,0,0,0				;End of loop



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



Animator_CubeGenerator
defb %00000010		;Anim Freq
defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0
defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0

defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0
defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0



defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0
defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0

defb anmSpriteMoveProg,17,&23,prgSmartBombableSpriteBank0		;Sprite Anim 0
defb anmSpriteMoveProg,17,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0
defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank0		;Sprite Anim 0
defb anmSpawnObject,10,0,0
defb anmSpriteMoveProg,21,&23,prgSmartBombableSpriteBank2		;Sprite Anim 0

defb anmLoop,0,0,0				;End of loop


Animator_Cube
defb %00000010		;Anim Freq
defb anmProgram,prgFireFast+fireSingleWest,0,0	;Sprite Anim 0
defb anmProgram,prgFireFast+fireSingleEast,0,0	;Sprite Anim 0
defb anmCondLoop,%00100000,0,0			;Repeat loop
defb anmCondjmp, %01000000,7*anmFrameNum,0			;Anim switch
defb anmMove,&1C,0,0
defb anmMove,&1C,0,0
defb anmLoop,0,0,0				;End of loop 6
defb anmMove,&2C,0,0
defb anmMove,&2C,0,0
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
	

			call AchievementHandlerB
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
AchievementHandlerB:
	cp TwoFrameSprite+18
	jp z,HorizontalLaserDead
	cp TwoFrameSprite+19
	jp z,DiaganolLaserDead
	cp TwoFrameSprite+10
	jp z,NukeSatelliteDead
	cp TwoFrameSprite+9
	jp z,NukeSatelliteDead

ret

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
	cp TwoFrameSprite+6	;laser beam
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
	djnz,HorizontalLaserDead_NextObj
pop bc
pop hl

ret
callNukeBlastRestore:
push hl
	ld a,0
	ld (AbandonNuke_Plus1-1),a
pop hl

	ld hl,&6969	:NukeBlastRestoreLoc_Plus2
	ld a,0		:NukeBlastRestoreTime_Plus1
	call Akuyou_SetLevelTime

ret
NukeSatelliteDead:
	nop :AbandonNuke_Plus1
	ld a,&C9
	ld (AbandonNuke_Plus1-1),a

	push hl
		push bc
			call Akuyou_GetLevelTime
		pop bc

		dec hl
		ld (NukeBlastRestoreLoc_Plus2-2),hl
		ld (NukeBlastRestoreTime_Plus1-1),a

;		ld (NukeBlastRestore),hl
;		ld (NukeBlastRestore+2),a


		ld hl,NukeBlast
		ld a,13
		call Akuyou_SetLevelTime
		ld a,c
		ld (NukeBlastPos),a
		ld a,b
		ld (NukeBlastPos+1),a


	

		ld hl,AchievementTargetCount
		dec (hl)
	pop hl
	ret nz
		jp ShowInsultAchievement	
ret
InitOptionalDiaganolLaserDead:
	push hl
		ld hl,null
		ld (OptionalDiaganolLaserDead+1),hl
	pop hl
	ret
OptionalDiaganolLaserDead:	;used to kill laserbeam as it fires - for if player predestroyed canon
	jp null ;***

DiaganolLaserDead:
push hl
push bc
	ld hl,DiaganolLaserDead
	ld (OptionalDiaganolLaserDead+1),hl

	ld b,ObjectArraySize
	ld hl,ObjectArrayPointer	; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA
DiaganolLaserDead_NextObj
	inc h
	inc h
	inc h
	ld a,(hl)
	cp TwoFrameSprite+29	;laser beam
	jr nz,NotLaserBeamB
	dec h
	dec h
	dec h
	xor a
	ld (hl),a
	inc l
	djnz,DiaganolLaserDead_NextObj
NotLaserBeamB:
	dec h
	dec h
	dec h
	inc l
	djnz,DiaganolLaserDead_NextObj
pop bc
pop hl

ret

EventStreamArray:

;defb 1,128,&24,128+64+60		; Move Static

defb 0,evtSetAnimatorPointers
defw	AnimatorPointers

defb 0,evtReprogramSmartBombed
defw SmartBombCustom

defb 0,evtResetPowerup

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



defb 0,evtReprogram_PowerupSprites,128+34,128+35,128+36,128+33	; Define powerup sprites (Drone(2)/speed(2)/power(1)/coin)
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


; Satellite - Attack
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireFast+fireSingleSouth,mveMisc+&23,lifEnemy+7	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+7
defb 	evtSettingsBank_Save,2



; Satellite - Preemptive defence
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,2
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+9
defb 	evtSettingsBank_Save,3




; tousatsu supreme - 360 degree VR TOU-PRO!
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid+fireSmallBurst,mveMisc+&25,lifEnemy+5	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBank_Save,4



; Cyber Punk
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+10	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,0;24
defb 	evtSetAnimator,3
defb 	evtAddToForeground
defb 	evtSetSprite,1
defb 	evtSettingsBank_Save,5

; Toast1
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&44,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+30
defb 	evtSettingsBank_Save,6


; Toast2
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&44,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,8
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+31
defb 	evtSettingsBank_Save,7



; Toast3
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&44,lifEnemy+4	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,7
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+32
defb 	evtSettingsBank_Save,8



; Unvader Cow
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&44,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,11
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+3
defb 	evtSettingsBank_Save,9


; Cube
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,mveMisc+&1C,lifEnemy+1	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16		     ;&3A
defb 	evtSetAnimator,13
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+5
defb 	evtSettingsBank_Save,10



; Automated Execution System 256 Static
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,14
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBank_Save,11



;;;;;;;;;;;;;;;;;;;;;;;EXT;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Meat Bag
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireSnail+fireTopLeft,mveMisc+&23,lifEnemy+15	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+4
defb 	evtSettingsBankEXT_Save,0


; Automated Execution System 256
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+30	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,48
defb 	evtSetAnimator,4
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+22
defb 	evtSettingsBankEXT_Save,1

; Hover Biker
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireFast+fireSingleFastWest,mveMisc+&21,lifEnemy+7	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSettingsBankEXT_Save,2


; Holowhip Citizen control Bot
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireMid2+fireRightWide,mveMisc+&23,lifEnemy+9	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,5
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+14
defb 	evtSettingsBankEXT_Save,3



; Recycl-O-matic
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireFast+fireTopWide,mveMisc+&22,lifEnemy+3	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+13
defb 	evtSettingsBankEXT_Save,4


; Talky Toaster
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&23,lifEnemy+11	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,6
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+11
defb 	evtSettingsBankEXT_Save,5


; Germinator G-1000
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,0,mveMisc+&25,lifEnemy+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,9
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+27
defb 	evtSettingsBankEXT_Save,6



; Unvader
defb 0,evtMultipleCommands+6
defb 	evtSetProgMoveLife,prgFireMid2+fireLeftWide,mveMisc+&25,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,10
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+27
defb 	evtSettingsBankEXT_Save,7


; Block Printer
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+16	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,12
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBankEXT_Save,8



; Stand
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,0
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+40
defb 	evtSettingsBankEXT_Save,9


; Hoverpad
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,0
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+41
defb 	evtSettingsBank_Save,13




; Laser Canon Horizontal
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+18
defb 	evtSettingsBankEXT_Save,10



; Laser Canon Horizontal Beam
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+6
defb 	evtSettingsBankEXT_Save,11



; Laser Canon Diagonal
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+19
defb 	evtSettingsBankEXT_Save,12



; Laser Canon Diagonal Beam
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+29
defb 	evtSettingsBankEXT_Save,13








; Laser Canon Diagonal Beam
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgNothing,&23,lifDeadly+40	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+12
defb 	evtSettingsBankEXT_Save,14






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
	defb &54,&58,&4A,&4B		;Black,DkBlue,LtYellow,White

	defb evtReprogramPalette,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1	; Switches
	defb 32;0;32	;delay			
	defb &54,&4C,&57,&4B


	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
	defb &54,&4D,&4A,&4B



	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 1 ; no of switches
	defb 0	;delays			
	defb &54,&5F,&59,&4B	 ;5b	


;defb 10,evtJumpToNewTime
;defw AesTest
;defb 140


; Cyber Punk
defb 5,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11


; Powerup Speed (Dots) max 2
defb 10,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 35,160+24,50+24	; 



; Satellite - Preemptive defence!
defb 15,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite+2



; tousatsu supreme - 360 degree VR TOU-PRO!
defb 20,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,5*24+24

; tousatsu supreme - 360 degree VR TOU-PRO!
defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,9*24+24

; Satellite - Attack
defb 30,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+2

; tousatsu supreme - 360 degree VR TOU-PRO!
defb 35,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,7*24+24

; Powerup Speed (Dots) max 2
defb 40,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 35,160+24,100+24	; 

; Talkie Toaster
defb 45,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite+12

defb 63,evtCallAddress			;Call a memory location
defw	InitOptionalHorizontalLaserDead

; Laser Canon Horizontal
defb 63,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb 	evtSingleSprite+7
; Hoverpad
defb 63,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb 	evtSingleSprite+9

; Laser Canon Horizontal Beam
defb 73,evtMultipleCommands+11
defb 	evtSettingsBankEXT_Load+11
defb evtSingleSprite, 128+6,-12*4+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*5+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*6+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*7+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*8+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*9+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*10+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*11+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*12+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*13+160+22,45+24+48
defb 73,evtCallAddress			;Call a memory location
defw	OptionalHorizontalLaserDead


; Hover Biker
defb 74,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+5



; Hover Biker
defb 74,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+9



; Unvader
defb 75,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb evtSingleSprite, 128+0,1,60+24

; Block Printer
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+11

; Hover Biker
defb 85,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+7


; Powerup Drone (Plus) max 2
defb 85,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 34,160+24,150+24	; 


; Satellite - Attack
defb 90,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite+2

; Powerup Drone (Plus) max 2
defb 95,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 34,160+24,50+24	; 

; Germinator G-1000
defb 95,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb evtSingleSprite, 128+0,0,200+24-48






; Talkie Toaster
defb 100,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite+12


; Unvader
defb 105,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb evtSingleSprite, 128+0,1,60+24


defb 115,evtCallAddress			;Call a memory location
defw	InitOptionalDiaganolLaserDead
; Laser Canon Diagonal
defb 115,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb 	evtSingleSprite+12


; Laser Canon Diaganol Beam
defb 125,evtMultipleCommands+12
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+29,-8*1+127+24,-16*0+160+20
defb evtSingleSprite, 128+29,-8*2+127+24,-16*1+160+20
defb evtSingleSprite, 128+29,-8*3+127+24,-16*2+160+20
defb evtSingleSprite, 128+29,-8*4+127+24,-16*3+160+20
defb evtSingleSprite, 128+29,-8*5+127+24,-16*4+160+20
defb evtSingleSprite, 128+29,-8*6+127+24,-16*5+160+20
defb evtSingleSprite, 128+29,-8*7+127+24,-16*6+160+20
defb evtSingleSprite, 128+29,-8*8+127+24,-16*7+160+20
defb evtSingleSprite, 128+29,-8*9+127+24,-16*8+160+20
defb evtSingleSprite, 128+29,-8*10+127+24,-16*9+160+20
defb evtSingleSprite, 128+29,-8*11+127+24,-16*10+160+20

defb 125,evtCallAddress			;Call a memory location
defw	OptionalDiaganolLaserDead

; Satellite - Preemptive defence!
defb 130,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite+2



; Germinator G-1000
defb 130,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb evtSingleSprite, 128+0,0,200+24-48

; Cyber Punk
defb 135,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11


; Recycl-O-matic
defb 145,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11


; Unvader
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+7
defb evtSingleSprite, 128+0,1,60+24

; Cyber Punk
defb 155,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11


defb 163,evtCallAddress			;Call a memory location
defw	InitOptionalHorizontalLaserDead

; Laser Canon Horizontal
defb 163,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb 	evtSingleSprite+7
; Hoverpad
defb 163,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb 	evtSingleSprite+9


; Recycl-O-matic
defb 170,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11


; Laser Canon Horizontal Beam
defb 173,evtMultipleCommands+11
defb 	evtSettingsBankEXT_Load+11
defb evtSingleSprite, 128+6,-12*4+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*5+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*6+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*7+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*8+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*9+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*10+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*11+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*12+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*13+160+22,45+24+48

defb 173,evtCallAddress			;Call a memory location
defw	OptionalHorizontalLaserDead


; Satellite - Preemptive defence!
defb 175,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite+2





; Recycl-O-matic
defb 180,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11




; Hover Biker
defb 185,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11


; Talkie Toaster
defb 200,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite+12



defb 215,evtCallAddress			;Call a memory location
defw	InitOptionalDiaganolLaserDead

; Laser Canon Diagonal
defb 215,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb 	evtSingleSprite+12





; Recycl-O-matic
defb 220,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11



; Laser Canon Diaganol Beam
defb 225,evtMultipleCommands+12
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+29,-8*1+127+24,-16*0+160+20
defb evtSingleSprite, 128+29,-8*2+127+24,-16*1+160+20
defb evtSingleSprite, 128+29,-8*3+127+24,-16*2+160+20
defb evtSingleSprite, 128+29,-8*4+127+24,-16*3+160+20
defb evtSingleSprite, 128+29,-8*5+127+24,-16*4+160+20
defb evtSingleSprite, 128+29,-8*6+127+24,-16*5+160+20
defb evtSingleSprite, 128+29,-8*7+127+24,-16*6+160+20
defb evtSingleSprite, 128+29,-8*8+127+24,-16*7+160+20
defb evtSingleSprite, 128+29,-8*9+127+24,-16*8+160+20
defb evtSingleSprite, 128+29,-8*10+127+24,-16*9+160+20
defb evtSingleSprite, 128+29,-8*11+127+24,-16*10+160+20

defb 225,evtCallAddress			;Call a memory location
defw	OptionalDiaganolLaserDead


; Hover Biker
defb 230,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+5



; Hover Biker
defb 235,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+7




; Germinator G-1000
defb 240,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb evtSingleSprite, 128+0,0,200+24-48


; Hover Biker
defb 240,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+9

; Hover Biker
defb 245,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+5
; Hover Biker
defb 250,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+7

; Hover Biker
defb 255,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+9

; Hover Biker
defb 255,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+5



; Advanced Execution System - 256
defb 1,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+1
defb 	evtSingleSprite+10





; Hover Biker
defb 5,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11


; Recycl-O-matic
defb 10,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+4
defb 	evtSingleSprite+11




; Hover Biker
defb 15,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11
; Cyber Punk
defb 20,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11

; Powerup Power (Star) max 1
defb 30,evtMultipleCommands+5
defb 	evtSetProgMoveLife,prgBonus,&22,lifDeadly+63
defb 	evtSetObjectSize,24
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSingleSprite,TwoFrameSprite+ 36,160+24,150+24	; 

; Cyber Punk
defb 35,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11

; Block Printer
defb 40,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+11


; Holowhip Citizen control Bot
defb 45,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite+5


; Meat Bag
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+11



; Hover Biker
defb 55,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+11


; Satellite - Preemptive defence!
defb 60,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite+2



defb 63,evtCallAddress			;Call a memory location
defw	InitOptionalHorizontalLaserDead


; Laser Canon Horizontal
defb 63,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+10
defb 	evtSingleSprite+7
; Hoverpad
defb 63,evtMultipleCommands+2
defb 	evtSettingsBank_Load+13
defb 	evtSingleSprite+9

; Holowhip Citizen control Bot
defb 65,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite+5



; Cyber Punk
defb 70,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11

; Laser Canon Horizontal Beam
defb 73,evtMultipleCommands+11
defb 	evtSettingsBankEXT_Load+11
defb evtSingleSprite, 128+6,-12*4+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*5+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*6+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*7+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*8+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*9+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*10+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*11+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*12+160+22,45+24+48
defb evtSingleSprite, 128+6,-12*13+160+22,45+24+48


defb 73,evtCallAddress			;Call a memory location
defw	OptionalHorizontalLaserDead




; Hover Biker
defb 75,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+9

; Hover Biker
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+5


; Germinator G-1000
defb 80,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb evtSingleSprite, 128+0,0,200+24-48



; Hover Biker
defb 85,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+7



; Talkie Toaster
defb 85,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+5
defb 	evtSingleSprite+12


; Satellite - Preemptive defence!
defb 90,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite+2


; Hover Biker
defb 90,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+9

; tousatsu supreme - 360 degree VR TOU-PRO!
defb 93,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,4*24+24

; Hover Biker
defb 95,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+2
defb 	evtSingleSprite+5





; tousatsu supreme - 360 degree VR TOU-PRO!
defb 96,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,7*24+24




; tousatsu supreme - 360 degree VR TOU-PRO!
defb 99,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,6*24+24


; Block Printer
defb 99,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+8
defb 	evtSingleSprite+11

; Cyber Punk
defb 100,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11


; Meat Bag
defb 105,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite+11



; Satellite - Preemptive defence!
defb 110,evtMultipleCommands+2
defb 	evtSettingsBank_Load+3
defb 	evtSingleSprite+2


defb 115,evtCallAddress			;Call a memory location
defw	InitOptionalDiaganolLaserDead

; Laser Canon Diagonal
defb 115,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+12
defb 	evtSingleSprite+12


; Holowhip Citizen control Bot
defb 120,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+3
defb 	evtSingleSprite+5


; Laser Canon Diaganol Beam
defb 125,evtMultipleCommands+12
defb 	evtSettingsBankEXT_Load+13
defb evtSingleSprite, 128+29,-8*1+127+24,-16*0+160+20
defb evtSingleSprite, 128+29,-8*2+127+24,-16*1+160+20
defb evtSingleSprite, 128+29,-8*3+127+24,-16*2+160+20
defb evtSingleSprite, 128+29,-8*4+127+24,-16*3+160+20
defb evtSingleSprite, 128+29,-8*5+127+24,-16*4+160+20
defb evtSingleSprite, 128+29,-8*6+127+24,-16*5+160+20
defb evtSingleSprite, 128+29,-8*7+127+24,-16*6+160+20
defb evtSingleSprite, 128+29,-8*8+127+24,-16*7+160+20
defb evtSingleSprite, 128+29,-8*9+127+24,-16*8+160+20
defb evtSingleSprite, 128+29,-8*10+127+24,-16*9+160+20
defb evtSingleSprite, 128+29,-8*11+127+24,-16*10+160+20

defb 125,evtCallAddress			;Call a memory location
defw	OptionalDiaganolLaserDead


; tousatsu supreme - 360 degree VR TOU-PRO!
defb 125,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,7*24+24
defb 125,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,5*24+24
defb 125,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,9*24+24


; Germinator G-1000
defb 135,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+6
defb evtSingleSprite, 128+0,0,200+24-48


; Cyber Punk
defb 140,evtMultipleCommands+2
defb 	evtSettingsBank_Load+5
defb 	evtSingleSprite+11



; tousatsu supreme - 360 degree VR TOU-PRO!
defb 145,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,7*24+24
defb 145,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,5*24+24
defb 145,evtMultipleCommands+2
defb 	evtSettingsBank_Load+4
defb evtSingleSprite, 128+0,8 ,9*24+24




; Advanced Execution System - 256 Static
defb 150,evtMultipleCommands+2
defb 	evtSettingsBank_Load+11
defb 	evtSingleSprite+7
; Stand
defb 150,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+9
defb 	evtSingleSprite+10

defb 155,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+9
defb 	evtSingleSprite+10



LevelEnding:
defb 185,%10001001			;Call a memory location
defw	ClearBadguys
;Palette Change

LevelEndAnim:
defb 185,evtMultipleCommands+4			; 3 commands at the same timepoint
defb evtSettingsBank_Load+0
defb evtSetAnimator,0
defb evtSetProgMoveLife,prgMovePlayer,&24,10
defb evtSingleSprite,128+	47,140+24,100+24	; 	

;Palette Change
defb 186,%01110000+4			; 4 Commands
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




defb 187,%01110000+4			; 4 Commands
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

defb 188,evtCallAddress			;Call a memory location
defw	EndLevel

NukeBlast:


defb 14,evtReprogramObjectBurstPosition
NukeBlastPos:
defb 140+24,90+24

;outer burst
defb 14,evtMultipleCommands+9
defb 	evtSettingsBankEXT_Load+14
defb evtSetMove,&09,evtBurstSprite
defb evtSetMove,&0B,evtBurstSprite
defb evtSetMove,&0D,evtBurstSprite
defb evtSetMove,&0F,evtBurstSprite


defb 14,evtMultipleCommands+8
defb evtSetMove,&39,evtBurstSprite
defb evtSetMove,&3B,evtBurstSprite
defb evtSetMove,&3D,evtBurstSprite
defb evtSetMove,&3F,evtBurstSprite

defb 14,evtMultipleCommands+8
defb evtSetMove,&21,evtBurstSprite
defb evtSetMove,&27,evtBurstSprite
defb evtSetMove,&3D,evtBurstSprite
defb evtSetMove,&3F,evtBurstSprite

defb 14,evtMultipleCommands+8
defb evtSetMove,&12,evtBurstSprite
defb evtSetMove,&14,evtBurstSprite
defb evtSetMove,&16,evtBurstSprite
defb evtSetMove,&22,evtBurstSprite

defb 14,evtMultipleCommands+8
defb evtSetMove,&26,evtBurstSprite
defb evtSetMove,&32,evtBurstSprite
defb evtSetMove,&34,evtBurstSprite
defb evtSetMove,&36,evtBurstSprite


defb 14,evtMultipleCommands+8
defb evtSetMove,&1A,evtBurstSprite
defb evtSetMove,&2A,evtBurstSprite
defb evtSetMove,&1E,evtBurstSprite
defb evtSetMove,&2E,evtBurstSprite


defb 14,evtMultipleCommands+8
defb evtSetMove,&1B,evtBurstSprite
defb evtSetMove,&2B,evtBurstSprite
defb evtSetMove,&1D,evtBurstSprite
defb evtSetMove,&2D,evtBurstSprite


defb 14,evtMultipleCommands+8
defb evtSetMove,&13,evtBurstSprite
defb evtSetMove,&33,evtBurstSprite
defb evtSetMove,&15,evtBurstSprite
defb evtSetMove,&35,evtBurstSprite

defb 14,evtCallAddress
defw callNukeBlastRestore
;defb 14,evtJumpToNewTime	
;NukeBlastRestore
;defw NukeBlast		; pointer
;defb 13			; new time


EndLevel:
	pop hl	;
	ld hl,	&0110 				;load level 2
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

;	ld a, PlayerStarArraySize;
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



	ld b,1
	ld hl,InsultsTwoPlayer
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




TileSprite1Num equ 37
TileSprite2Num equ 39
TileSprite3Num equ 38

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
	ld b,87-8-28
	call BackgroundSolidFill

	;Grassy bottom!
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


	ld de,&0000
	ld b,28
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
		ld b,8
;	ld de,Tile_Start
		call BackgroundFloodFillQuadSprite
;	pop de



;DONE _ NOW DO BITSHIFTS


;Bitshift Tree
	ld a,0 :TopSpriteScrollerToggle_Plus1
	cpl
	ld (TopSpriteScrollerToggle_Plus1-1),a
	or a
	jp nz,TopSpriteScroller_Skip

	ld a,TileSprite1Num
	call GetSpriteMempos	

	ld de,0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,16;42-32
	call BitShifter
TopSpriteScroller_Skip:


	ld a,TileSprite2Num
	call GetSpriteMempos	
	ld de,0007
	add hl,de
	ld b,&8		; Bytes - always 8
	ld c,8
	call BitShifter


	ld a,TileSprite3Num
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









read "Core_ObjectReprogrammers.asm"






LevelText: 

db 16,"Level 3:"," "+&80
db 12,"Dark-Tech (Noir)"," "+&80
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
;save direct "T10-SC1.D02",LevelOrigin+ LevelDataStart,&4000-LevelDataStart	;address,size...}[,exec_address]
save direct "T10-SC1.D02",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]

;Extra sprites are T12-SC1.D02

