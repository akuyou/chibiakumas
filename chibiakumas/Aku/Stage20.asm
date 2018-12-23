read "CoreDefs.asm"

;debug equ 1
;Debug_ShowLevelTime equ 1
LevelDataStart equ &0 ;Start of the data which is stored on disk
nolist

list
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
incbin "Sprites\STAGE20.SPR"



;org LevelOrigin+&3500
;limit &3000
;org &2E00
;Event_SavedSettings:
;defs 4*16,&00

objWings1: defw &6969
objWings2: defw &6969


Event_SavedSettingsB:
defs 128,&00


read "Eventstreamdefinitions.asm"

;org LevelOrigin+&3600

KillMiniWings:
push hl
	ld hl,(objWings1)
	ld a,0
	call SetObjectY
	ld hl,(objWings2)
	ld a,0
	call SetObjectY
pop hl
ret

ModeOmega:
push hl
	ld hl, FireOmega
	ld (StararrayCall_Plus2-2),hl
	ld hl,OmegaArray_Redraw
	ld (ObjectarrayCall_Plus2-2),hl
	push bc
	push de
	call DisableOmegaArray
	pop de
	pop bc
pop hl

ret


ModeOmegaNoFire:
push hl
	ld hl, null
	ld (StararrayCall_Plus2-2),hl
	ld hl,OmegaArray_Redraw
	ld (ObjectarrayCall_Plus2-2),hl


pop hl
ret
ModeRegular:
push hl


	ld hl,Akuyou_StarArray_Redraw
	ld (StararrayCall_Plus2-2),hl
	ld hl, Akuyou_ObjectArray_Redraw
	ld (ObjectarrayCall_Plus2-2),hl
pop hl
ret


BossText: 

db  11,"W A R N I N G ! ! ","!"+&80
db  05,""," "+&80

db 06,"The Last Boss Is approachin","g"+&80

db  13,"Necro Shoujo",":"+&80
;      .1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 
;      .9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
db  09,"Corpse Carver Sakuya","!"+&80
db  05,""," "+&80
db &0



ShowBossText:
	ld a,15 :OnscreenTimer_Plus1
	cp 10
	ret c

	ld a,2
	call Akuyou_SpriteBank_Font

	ld bc,BossText :OnscreenTextPointer_Plus2
ShowBossText_StartText:
	;ld hl,&C000
	;call Akuyou_ShowSprite_SetBankAddr

	ld l,4
	ld a,1:BossCharNum_Plus1
	ld i,a	; show up to 255 chars
	
ShowBossText_MoreText:
	ld a,(bc)

	or a
	jp z,ShowBossText_AllOnscreen ; See if we have reached the end of the string

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
	jp nz,ShowBossText_MoreText

	ld a,(bc)
	or a
	jp z,ShowBossText_AllOnscreen ; See if we have reached the end of the string
	ld a,(BossCharNum_Plus1-1)
	inc a
	nop
	nop :ShowTextSpeedup_Plus1
ShowBossTextNoSpeedup:
	ld (BossCharNum_Plus1-1),a

ret
ShowBossText_AllOnscreen:
	ld a,(OnscreenTimer_Plus1-1)
	dec a
	ld (OnscreenTimer_Plus1-1),a

	cp 10
	ret nz
	ld a,0;9; only one page of text
	ld (OnscreenTimer_Plus1-1),a
;	ld a,BossText2End-BossText2-20
	ld a,1
	ld (BossCharNum_Plus1-1),a
ret


ObjectPointers:


BattleStart:

	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Animators! - Max 15 (Starting 1), each can have 16 stages (0-15)
AnimatorPointers:
SakuyaCurrentAnim: 
	defw AnimatorSakuraHuge_UP
	defw BladeBurst
	defw BladeBurstR
	defw BladeBurstL
	defw UpFireBurst
	defw Toxic
	defw FireLeftRight
	defw Fall
	defw YumiYume

YumiYume:
defb %00000100		;Anim Freq
defb anmMove,&3C,0,0
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
defb anmMove,&0C,0,0
defb anmLoop,0,0,0
Fall:
defb %00000100		;Anim Freq
defb anmMove,&3C+mveFast,0,0
defb anmMove,&3C+mveFast,0,0
defb anmMove,&3C+mveFast,0,0
defb anmSpriteMoveProg,128+16,&24,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmEmpty,0,0,0
defb anmKill,0,0,0


FireLeftRight:
defb %00000100		;Anim Freq
defb anmprogram,prgFireFast+fireLeftWide,0,0
defb anmprogram,prgFireFast+fireRightWide,0,0
defb anmLoop,0,0,0

Toxic:
defb %00000010		;Anim Freq
defb anmSpawnObject,11,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,12,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0



AnimatorSakuraHuge_UP:
defb %00001000		;Anim Freq
defb anmMove,&1C,0,0
defb anmLoop,0,0,0


AnimatorSakuraHuge_Stop:
; First byte is the 'Tick map' which defines when the animation should update
defb %00001000		;Anim Freq
defb anmMove,&24,0,0
defb anmLoop,0,0,0

AnimatorSakuraHuge_Vanish:
defb %00001000		;Anim Freq
defb anmKill,0,0,0
defb anmLoop,0,0,0

UpFireBurst:
defb %00000010		;Anim Freq
defb anmprogram,0,0,0
defb anmprogram,prgFireHyper+fireSingleNorth,0,0
defb anmprogram,prgFireFast+fireTopWide,0,0
defb anmprogram,prgFireHyper+fireSingleNorth,0,0
defb anmprogram,prgFireFast+fireOuterBurst,0,0
defb anmprogram,prgFireHyper+fireSingleNorth,0,0
defb anmprogram,prgFireFast+fireTop,0,0
defb anmLoop,0,0,0

BladeBurst:
defb %00000010		;Anim Freq
defb anmSpawnObject,3,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,10,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,4,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,9,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,5,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,6,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,7,0,0
defb anmEmpty,0,0,0
defb anmLoop,0,0,0

BladeBurstR:
defb %00000010		;Anim Freq
defb anmSpawnObject,3,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,4,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,5,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,6,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,7,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,9,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,10,0,0
defb anmLoop,0,0,0



BladeBurstL:
defb %00000010		;Anim Freq
defb anmSpawnObject,10,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,9,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,8,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,7,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,6,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,5,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,4,0,0
defb anmEmpty,0,0,0
defb anmSpawnObject,3,0,0
defb anmLoop,0,0,0
DekaSakuyaVanish:
	push hl
		ld hl,AnimatorSakuraHuge_Vanish
	jr DekaSakuyaSet

DekaSakuyaUP:
	push hl
		push bc
			ld a,0
			call Akuyou_ShowSpriteReconfigureEnableDisable
		pop bc
		ld hl,AnimatorSakuraHuge_UP
	jr DekaSakuyaSet
DekaSakuyaStop:
	push hl
		push bc
			ld a,1
			call Akuyou_ShowSpriteReconfigureEnableDisable
		pop bc
		ld hl,AnimatorSakuraHuge_Stop
DekaSakuyaSet:
		ld (SakuyaCurrentAnim),hl
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
minisakurapower: defb 72
MinisakurapowerB:defb 72
CustomObjectHitHandler:

	;iyl ; Program Code
	;ixl ;Life
	;iyh  ;spr
	;ixh ;Move
	;b ;X
	;c ;Y

di 
exx

	ld a,iyh
	cp 128+15
	jr z,HitSakuya
	cp 128+14
	jr z,HitSakuya
	cp 128+16
	jp z,HitBossActual
	cp 128+17
	jr z,HitBossActual
	jr CustomObjectHitHandlerDone

;push hl
HitSakuya:





	ld a,(Minisakurapower)
	or a
	call nz,DoHurt
	ld (Minisakurapower),a
CustomObjectHitHandlerDoneB:
	ld ixl,lifEnemy+63
CustomObjectHitHandlerDone:
exx
ei
ret
Minisakurapowercheck:
	push hl
	ld a,(minisakurapower)
	or a
	jr nz,StillAlive
		ld a,(MinisakurapowerB)
		ld (Minisakurapower),a
		pop hl
		ld hl,SakuraFallEasy		:ChosenSakuyaFall_Plus2			
		ld a,11
		call Akuyou_SetLevelTime
		dec hl
		ret
StillAlive:
	pop hl
ret

BossStage2:
	push hl
	ld hl,SakuraFallHard
	ld (ChosenSakuyaFall_Plus2-2),hl
	pop hl
jr CustomObjectHitHandlerDoneB


BossStage3:
	push hl
		ld hl,BladeAttackMax
		ld (ChosenBladeAttack_Plus2-2),hl
	pop hl
jr CustomObjectHitHandlerDoneB

bosslifeStageB equ 32
BossLifeB: defb bosslifeStageB

HitBoss:
	ld a,(BossLifeB)
	call DoHurt
	ld (BossLifeB),a
	jp z,HitBossActual
	and %00000001
	ld (BossColorFlashAction_Plus1-1),a	;nonzero=flash
	jp CustomObjectHitHandlerDoneB

BossRechargeOff:
	push hl
	ld hl,null
	jr BossRechargeB
BossRechargeOn:
	push hl
	ld hl,BossRecharge
BossRechargeB:
	ld (ScreenShakeCall_Plus2-2),hl
	pop hl
ret

BossRechargeTimer: defb 2
BossRecharge:
	ld a,(BossRechargeTimer)
	dec a
	ld (BossRechargeTimer),a
	ret nz
	ld a,2
	ld (BossRechargeTimer),a
	ld a,(BossLife)
	cp 32*3
	ret nc
	inc a
	ld (BossLife),a
ret

HitBossActual:

	ld a,(BossLife)
	or a
	jr z,CustomObjectHitHandlerDoneB
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
jp CustomObjectHitHandlerDoneB


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
		ld a,22
		call Akuyou_SetLevelTime
	
	pop hl
	call BossRechargeOff
jp CustomObjectHitHandlerDoneB



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

defb 0,evtReprogramHitHandler
defw CustomObjectHitHandler


defb 0,evtReprogramSmartBombSpecial
defw DisableOmegaArraySmart

defb 0,evtReprogram_PowerupSprites,128+99,128+99,128+99,128+21+1	; Define powerup sprites (Drone(2)/speed(2)/power(1)/coin)

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


; GiantSakuyaGenericObject
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&1C,0	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,32
defb 	evtSetAnimator,1
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBank_Save,2



; Blade NE
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&06+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,22+1
defb 	evtSettingsBank_Save,3

; Blade E
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&26+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,23+1
defb 	evtSettingsBank_Save,4


; Blade SE
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&3E+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,24+1
defb 	evtSettingsBank_Save,5

; Blade S
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&3C+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,25+1
defb 	evtSettingsBank_Save,6

; Blade SW
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&39+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,26+1
defb 	evtSettingsBank_Save,7

; Blade W
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&21+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,27+1
defb 	evtSettingsBank_Save,8


; Blade W
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&09+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,28+1
defb 	evtSettingsBank_Save,9

; Blade NW
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&0C+mveFast,lifEnemy+8	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,16
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,29+1
defb 	evtSettingsBank_Save,10

; Toxic Drop 1
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&3C+mveFast,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,8
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,20
defb 	evtSettingsBank_Save,11

; Toxic Drop 1
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,mveMisc+&3C+mveFast,lifEnemy+20	; Program - Fire Left... Move - wave 10101100 ... Hurt by bullets, hurts player, life 4
defb 	evtSetObjectSize,8
defb 	evtSetAnimator,0
defb 	evtAddToForeground
defb 	evtSetSprite,21
defb 	evtSettingsBank_Save,12


; GiantSakuyaGenericObject
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&24,lifTimed+8
defb 	evtSetAnimator,2
defb 	evtSetObjectSize,16
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+0
defb 	evtSettingsBankEXT_Save,0

; MiniSakuya L
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,&27+mveFast,0
defb 	evtSetAnimator,6
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+10
defb 	evtSettingsBankEXT_Save,1

; MiniSakuya R
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgSpecial,&21+mveFast,lifEnemy+63
defb 	evtSetAnimator,5
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+15
defb 	evtSettingsBankEXT_Save,2

; MiniSakuyaFall
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,0,&3C,lifEnemy+63
defb 	evtSetAnimator,8
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+17
defb 	evtSettingsBankEXT_Save,3


; Yume
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireMid2+fireRightWide,&3C,lifTimed+8
defb 	evtSetAnimator,9
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+10
defb 	evtSettingsBankEXT_Save,4

; Yumi
defb 0,evtMultipleCommands+6					; 3 commands at the same timepoint
defb 	evtSetProgMoveLife,prgFireHyper+fireSingleWest,&0C,lifTimed+8
defb 	evtSetAnimator,7*16+9;8*16+9;
defb 	evtSetObjectSize,32
defb 	evtAddToForeground
defb 	evtSetSprite,TwoFrameSprite+11
defb 	evtSettingsBankEXT_Save,5

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
	defb &54,&5F,&5A,&4B	

	defb evtReprogramPalette,26*0+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 32;0;32	;delay			
	defb &54,&58,&5B,&4B	

	defb evtReprogramPalette,26*1+6,5*1+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0	; Switches
	defb 0;32	;delay			
	defb &54,&58,&5B,&4B	

	defb evtReprogramPalette,26*2+6,5+1		; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 21*2+5
	defb 0 ; no of switches
	defb 0	;delays			
	defb &54,&5C,&5B,&4B	

defb 2,evtCallAddress
defw StartBossLifeBar

;defb 5
;defb evtJumpToNewTime	
;defw SakuraFall			; pointer
;defb 10


;defb 5
;defb evtJumpToNewTime	
;defw LevelEnd			; pointer
;defb 22

;defb 5
;defb evtJumpToNewTime	
;defw MegaSakuyaE			; pointer
;defb 9

defb 5
defb evtJumpToNewTime	
defw DekaSakuyaFirst			; pointer
defb 1

;defb 5
;defb evtJumpToNewTime	
;defw SakuyaFly
;defb 10





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Mega Sakuya
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MegaSakuyaE:

	defb 10
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5D,&5F,&4B	

defb 10,evtCallAddress			;Call a memory location
defw	setAnim_MegaSakuya

defb 14,evtCallAddress
defw ModeOmega;

defb 30,evtCallAddress			;Call a memory location
defw	setAnim_Black



defb 40,evtCallAddress
defw ModeOmegaNoFire



defb 60
defb evtJumpToNewTime	
defw SakuyaFly
defb 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Mini Sakuya
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SakuyaFly:
	defb 5
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&5A,&4B	


defb 5,evtCallAddress			;Call a memory location
defw	SetAnim_Rotate1

defb 5,evtCallAddress
defw ModeRegular;

; SakuyaL
defb 11,evtMultipleCommands+5
defb 	evtSettingsBankExt_Load+1
defb 	evtSingleSprite, 48, 16,8+24+40
defb 	evtSetAnimator,7
defb 	evtsetLife,lifEnemy+63
defb 	evtSingleSprite, 128+14, 0,8+24


; SakuyaR
defb 21,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+2
defb 	evtSingleSprite, 128+15, 160+24,24+200-48

; SakuyaL
defb 31,evtMultipleCommands+5
defb 	evtSettingsBankExt_Load+1
defb 	evtSingleSprite, 48, 16,8+24+40
defb 	evtSetAnimator,7
defb 	evtsetLife,lifEnemy+63
defb 	evtSingleSprite, 128+14, 0,8+24



; SakuyaR
defb 41,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+2
defb 	evtSingleSprite, 128+15, 160+24,24+200-48

; SakuyaL
defb 51,evtMultipleCommands+5
defb 	evtSettingsBankExt_Load+1
defb 	evtSingleSprite, 48, 16,8+24+40
defb 	evtSetAnimator,7
defb 	evtsetLife,lifEnemy+63
defb 	evtSingleSprite, 128+14, 0,8+24



; SakuyaR
defb 61,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+2
defb 	evtSingleSprite, 128+15, 160+24,24+200-48

defb 71,evtCallAddress			;Call a memory location
defw	Minisakurapowercheck


;defb 72
;defb evtJumpToNewTime	
;defw SakuyaFly
;defb 10



defb 71
defb evtJumpToNewTime	
defw DekaSakuya;DekaSakuya			; pointer
defb 4


SakuraFallHard:

; Yumi
defb 12,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+5
defb 	evtSingleSprite, 12+128, 160+24-16,200+24-48

; Yume
defb 12,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+4
defb 	evtSingleSprite, 13+128, 0+24,24
SakuraFallEasy:

; Sakuya Fall
defb 12,evtMultipleCommands+2
defb 	evtSettingsBankExt_Load+3
defb 	evtSingleSprite, 17+128, 80+24-8,24



defb 12,evtCallAddress			;Call a memory location
defw	SetAnim_Rotate2

defb 16,evtCallAddress			;Call a memory location
defw	BossRechargeOn

defb 26,evtCallAddress			;Call a memory location
defw	BossRechargeOff

;defb 28
;defb evtJumpToNewTime	
;defw SakuyaFly;DekaSakuya			; pointer
;defb 10;9

defb 28
defb evtJumpToNewTime	
defw DekaSakuya;DekaSakuya			; pointer
defb 4



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Largish Sakya
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




DekaSakuya:

defb 10,evtCallAddress			;Call a memory location
defw 	BackgroundDoFlash

defb 10,evtCallAddress
defw ScreenShakerOn;

DekaSakuyaFirst:


	defb 10
	defb evtReprogramPalette,0,6				; (Time,Cmd,Off,Bytes) load 5 bytes into the palette Offset 0
	defb 1
	defb 0				
	defb &54,&5F,&5A,&4B	



defb 10,evtCallAddress			;Call a memory location
defw	DekaSakuyaUP

defb 10,evtCallAddress			;Call a memory location
defw	SetAnim_ClosedWings

defb 10,evtCallAddress
defw ModeRegular


nolist
; Giant NSCC Sakuya!
defb 10,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+0, 80+24-24+6,200+24

defb 13,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+1, 80+24-24+6,200+24

;attack source 
defb 13,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,prgFireMid2+fireOuterBurst,&1C,lifEnemy+30
defb 	evtSingleSprite, 48, 80+24-4-8,200+24-16



defb 14,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+2, 80+24-24+12,200+24

defb 16,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+3, 80+24-24+6,200+24



defb 16,evtMultipleCommands+6
defb 	evtSettingsBank_Load+2
defb 	evtAddToBackground
defb 	evtSingleSprite, 128+11, 80+24-24+4,200+24
defb evtSaveLstObjToAdd
defw 	objWings1
defb 	evtSingleSprite, 128+10, 80+24+4,200+24
defb evtSaveLstObjToAdd
defw 	objWings2

defb 17,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+4, 80+24-24,200+24

defb 17,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+5, 80+24,200+24

;attack source 
defb 17,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,&1C,lifEnemy+30
defb 	evtSingleSprite, 48, 80+24-22-8,200+24-16

;attack source 
defb 18,evtMultipleCommands+3
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,prgFireMid+fireOuterBurst,&1C,lifEnemy+30
defb 	evtSingleSprite, 48, 80+24+22-8,200+24-18



defb 20,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+6, 80+24-24+16,200+24
defb 21,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+7, 80+24-24+16,200+24
defb 23,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+8, 80+24-24+18,200+24

defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+9, 80+24-24+14,200+24

defb 31,evtCallAddress
defw ScreenShakerOff;


defb 31,evtCallAddress			;Call a memory location
defw	DekaSakuyaStop


defb 35,evtCallAddress			;Call a memory location
defw	SetAnim_OpenWings

defb 35,evtCallAddress			;Call a memory location
defw 	KillMiniWings


;attack source 
defb 40,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,0,&24,lifTimed+8
defb 	evtSetAnimator,3
defb 	evtSingleSprite, 48, 80+24+18,100+24-28
;attack source 
defb 40,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,0,&24,lifTimed+8
defb 	evtSetAnimator,4
defb 	evtSingleSprite, 48, 80+24-18,100+24-28


;attack source 
defb 42,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,0,&24,lifTimed+6
defb 	evtSetAnimator,4
defb 	evtSingleSprite, 48, 80+24+30,100+24-32
;attack source 
defb 42,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,0,&24,lifTimed+6
defb 	evtSetAnimator,3
defb 	evtSingleSprite, 48, 80+24-30,100+24-32



;attack source 
defb 46,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,0,&24,lifTimed+4
defb 	evtSetAnimator,3
defb 	evtSingleSprite, 48, 80+24+42,100+24-36
;attack source 
defb 46,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtSetProgMoveLife,0,&24,lifTimed+4
defb 	evtSetAnimator,4
defb 	evtSingleSprite, 48, 80+24-42,100+24-36


defb 48,evtCallAddress			;Call a memory location
defw 	BackgroundDoFlash


defb 48,evtCallAddress			;Call a memory location
defw	DekaSakuyaVanish

defb 48,evtCallAddress			;Call a memory location
defw	SetAnim_ClosedWings


;attack source 
defb 50,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 0+24,0+24

defb 51,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 0+24,200+12;+24

defb 52,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 160+18,0+24


defb 53,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 160+18,200+12;+24




defb 53
defb evtJumpToNewTime	
defw BladeAttackMid			:ChosenBladeAttack_Plus2
defb 53





BladeAttackMid:


;attack source Middles
defb 55,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 0+24,100+24

defb 56,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 160+24-12,100+24

defb 57,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 80+24,0+24

defb 58,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 80+24,200+12;+24
;attack source Middles End




defb 80
defb evtJumpToNewTime	
defw MegaSakuyaE			; pointer
defb 9




BladeAttackMax:


;attack source Middles X2
defb 55,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 0+24,66+24-12

defb 56,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 160+18,66+24+12


defb 57,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 0+24,133+24-12


defb 58,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 160+18,133+24+12


defb 59,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 52+24-6,200+12;+24

defb 60,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 104+24+6,0+24


defb 61,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 52+24-6,0+24


defb 62,evtMultipleCommands+2
defb 	evtSettingsBankEXT_Load+0
defb 	evtSingleSprite, 48, 104+24+6,200+12;+24
;attack source Middles X2 End


defb 80
defb evtJumpToNewTime	
defw MegaSakuyaE			; pointer
defb 9





defb 16,evtMultipleCommands+4
defb 	evtSettingsBank_Load+2
defb 	evtAddToBackground
defb 	evtSingleSprite, 128+7, 80+24-24+4,200+24
defb 	evtSingleSprite, 128+6, 80+24+4,200+24


defb 16,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+2, 80+24-24,200+24


defb 19,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+3, 80+24-24,200+24


defb 22,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+4, 80+24-12,200+24

defb 25,evtMultipleCommands+2
defb 	evtSettingsBank_Load+2
defb 	evtSingleSprite, 128+5, 80+24-12,200+24





defb 235,evtCallAddress			;Call a memory location
defw	DekaSakuyaStop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;







;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





LevelEnd:

defb 23,evtCallAddress
defw 	CoffeeTimeOn


defb 23,evtCallAddress			;Call a memory location
defw ShowInsultAchievement

defb 23,evtCallAddress			;Call a memory location
defw	ClearBadguys


defb 23,evtCallAddress
defw SetScrollUp

;Coin

coinnum equ 21+1
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
	ld hl,	&01F2 				;load level 2
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
	call Akuyou_get_scr_addr_table
	ld (scr_addr_tablePos_Plus2-2),hl

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
;	ld (BackgroundFloodFillQuad_Minus1+1),hl
	;ld (BackgroundFloodFillQuadSprite_Minus1+1),hl
;	ld (GetNextLineTileLoopCheckB_Minus1+1),hl
	ld (BackgroundSolidFillNextLine_Minus1+1),hl
	call Akuyou_RasterColors_Init

	
	call AkuYou_Player_GetPlayerVars



	;flip around our play character
	ld a,80+24-20
	ld (iy+1),a
	ld a,80+24+20
	ld (iy+1+Akuyou_PlayerSeparator),a

	ld a,50+24
	ld (iy+0),a
	ld (iy+Akuyou_PlayerSeparator),a
	ld (iy+0+Akuyou_PlayerSeparator),a


	ld a,128+0
	ld (iy+8),a
	ld (iy+8+Akuyou_PlayerSeparator),a
	;end of character flip




	ld a,&7C	; FIRE DOWN by default
	ld (iy+15),a
	ld (iy+15+Akuyou_PlayerSeparator),a




	ld a,(iy-1)	;cpcver
	and 128
	jr z,systemis64k
	ld a,(iy-1)	;cpcver
	and 64
	jr z,systemis128k
systemis256k:
	ld hl,DoCompiledBackground128
	ld (BackgroundSelected_Plus2-2),hl
	ld (BackgroundSelectedbak),hl
	jr systemis64k ;continue with general stuff
systemis128k:
	ld hl,DoCompiledBackground128
	ld (BackgroundSelected_Plus2-2),hl
	ld (BackgroundSelectedbak),hl


	ld hl,MegaSakuya_128k
	ld (ChosenAnim_MegaSakuya_Plus2-2),hl

	ld hl,OpenWings_128k
	ld (ChosenAnim_OpenWings_Plus2-2),hl
	ld (ChosenAnim_OpenWingsLoop_Plus2-2),hl

	ld hl,ClosedWings
	ld (ChosenAnim_Rotate1_Plus2-2),hl
	ld (ChosenAnim_Rotate2_Plus2-2),hl
systemis64k:


	push iy
	pop hl
	ld de,-6
	add hl,de
	ld (TimerPos_Plus2-2),hl

	ld a,1
	ld (OmegaFireRate_Plus1-1),a

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
	call Akuyou_ObjectArray_Redraw	:ObjectarrayCall_Plus2

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

	call Akuyou_StarArray_Redraw	:StararrayCall_Plus2
	
	ifdef Debug
		call Timer_Stop
		ld a,'S'
		call Akuyou_DrawText_CharSprite
	endif


	call AkuYou_Player_StarArray_Redraw


	;halt


	call ShowBossText	 :ScreenShakeCall_Plus2

	call AkuYou_Player_DrawUI

	ifdef Debug
		call Timer_Stop
		ld a,'U'
		call Akuyou_DrawText_CharSprite
	endif

	

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

;	call OmegaArray_Redraw
;	call FireOmega



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
;	ld a,0 Randomizer_Plus1
;	ld (Randomizer_Plus1-1),a


	ld a,0 :Randomizer_Plus1
	inc a
	and %00000011
	ld (Randomizer_Plus1-1),a
	call z,StarArrayWarp ; welcome to hell!


;	call null BossSeekCall_Plus2

	jp LevelLoop

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



RasterColorsSetPalette1:
	ld a,0
;	ld bc,RasterColors_ColorArray1
;	ld de,RasterColors_ColorArray2
;	ld hl,RasterColors_ColorArray3
;	ld ix,RasterColors_ColorArray4
	ld iy,null; DisablePaletteSwitcher_Plus2
jp Akuyou_RasterColors_SetPointers




Background_SmartBomb:
	ld e,d
jr Background_Fill

Background_Black:
	ld de,&0000
Background_Fill:
	ld b,200
	jp BackgroundSolidFill


Background_Draw: 

	call Akuyou_Timer_UpdateTimer

	push af	; need to keep the smartbomb color
		call Akuyou_ScreenBuffer_GetActiveScreen
		ld h,a
		ld l,&4F+1
	pop af
	or a
	jp nz,Background_SmartBomb

	ld a,0	:BackgroundFlashCount_Plus1
	or a
	jr nz,Background_Flash

	call AkuYou_Player_GetPlayerVars
	ld a,(iy-8)	;Backgrounds can be disabled for a speedup
	and %00000100
	jp nz,Background_Black
jp Background_Black	:BackgroundSelected_Plus2
BackgroundSelectedbak:	defw Background_Black
BackgroundDoFlash:
push hl
	ld a,12
	ld (BackgroundFlashCount_Plus1-1),a
	ld hl,BackgroundFlashList 
	ld (BackgroundFlashListPos_Plus2-2),hl
pop hl
ret


Background_Flash:
	dec a
	ld (BackgroundFlashCount_Plus1-1),a
	push hl
		ld hl,BackgroundFlashList :BackgroundFlashListPos_Plus2
		ld d,(hl)
		inc hl
		ld (BackgroundFlashListPos_Plus2-2),hl
	pop hl
jp Background_SmartBomb


BackgroundFlashList:
defb 00
defb %00001111
defb %11110000
defb %11111111
defb %11110000
defb %00001111
defb 00
defb %00001111
defb %11110000
defb %11111111
defb %11110000
defb %00001111
defb 00

	


DoCompiledBackground128:
	ld hl,ClosedWings	:NextBackSeq_Plus2
	ld d,(hl)	;bank
	inc hl
	ld e,(hl)	;jump
	inc hl


	ld a,(hl)
	or a
	jr nz,BackgroundContinue
	ld hl,ClosedWings 	:BackReset_Plus2
BackgroundContinue:
	ld (NextBackSeq_Plus2-2),hl


	
	ld a,d
	ld l,e
	ld h,&40
	ld de,(BackgroundSolidFillNextLine_Minus1+1)
	jp Akuyou_BankSwitch_C0_CallHL


setAnim_Black:
	push hl
		ld hl,Background_Black
		ld (BackgroundSelected_Plus2-2),hl
	pop hl
ret	

setAnim_MegaSakuya:
	push hl
	ld hl,MegaSakuya	:ChosenAnim_MegaSakuya_Plus2
	jr SetAnim

SetAnim_OpenWings:
	push hl
	ld hl,OpenWingsLoop	:ChosenAnim_OpenWingsLoop_Plus2
	ld (BackReset_Plus2-2),hl
	ld hl,OpenWings		:ChosenAnim_OpenWings_Plus2
	jr SetAnimB
SetAnim_Rotate2:
	push hl
	ld hl,Anim_Rotate2	:ChosenAnim_Rotate2_Plus2
	jr SetAnim
SetAnim_Rotate1:
	push hl
	ld hl,Anim_Rotate1  	:ChosenAnim_Rotate1_Plus2
	jr SetAnim
SetAnim_ClosedWings:
	push hl
	ld hl,ClosedWings	:ChosenAnim_ClosedWings_Plus2
SetAnim:
	ld (BackReset_Plus2-2),hl
SetAnimB:
	ld (NextBackSeq_Plus2-2),hl

	ld hl,(BackgroundSelectedbak)
	ld (BackgroundSelected_Plus2-2),hl
	pop hl
ret
ClosedWings:
;defb Bank,Jump
defb &C4,0
;defb &C4,3
;defb &C4,6
defb 0,0

OpenWings_128k:
;defb Bank,Jump
;defb &C4,0
defb &C4,3
;defb &C4,6
defb 0,0

OpenWings:
defb &CC,3
defb &CC,6

defb &CC,9
defb &CC,6

defb &CD,0
defb &CC,9

defb &CD,3
defb &CD,0
;defb &C4,6
defb 0,0

OpenWingsLoop:
defb &CE,0
defb &CE,3
;defb &C4,6
defb 0,0


MegaSakuya_128k:
;defb Bank,Jump
;defb &C4,0
defb &C4,6
;defb &C4,6
defb 0,0

MegaSakuya:
defb &CF,0
defb &D6,0
defb &D7,0
defb &D6,0
defb 0,0

Anim_Rotate1:
defb &D4,0
defb &D4,3
defb &D4,6
defb &D4,9
defb &D5,0
defb &D5,3
defb &D5,6
defb &D5,9
defb 0,0

Anim_Rotate2:
defb &D5,9
defb &D5,6
defb &D5,3
defb &D5,0
defb &D4,9
defb &D4,6
defb &D4,3
defb &D4,0
defb 0,0

DoCompiledBackground:
	ld de,(BackgroundSolidFillNextLine_Minus1+1)


read "CoreBackground_SolidFill.asm"




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








read "Core_StarArrayWarp.asm"




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

	ld a,0 :BossColorFlashAction_Plus1
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
align 64,&00

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
		ld hl,BossLifeBar
		ld (BossLifeBarCall_Plus2-2),hl
	pop hl
	ret





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Start of omega code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



DisableOmegaArraySmart:
	ld a,1
	ld (SmartbombUsed_Plus1-1),a

DisableOmegaArray:
	ld de,&0000
	ld hl,OmegaArrayPointer1+256
	ld b,4
	call SpFill

	ld hl,OmegaArrayPointer2+256
	ld b,4
	call SpFill

	ld hl,OmegaArrayPointer3+256
	ld b,4
	call SpFill

	ld hl,OmegaArrayPointer4+256
	ld b,4
	jp SpFill



SpFill:
	ld (SpRestoreFill_Plus2-2),sp

SpFillContinue:
	ld sp,hl
	ld hl,retpoint

	jp PushDe32
retpoint:
	ld hl,&0000
	add hl,sp
	ei
	ld sp,&0000:SpRestoreFill_Plus2
	di


	djnz SpFillContinue
	ei

	ret



FireOmega:

	ld a,0 :nextOmegaTick_Plus1
	inc a
	and %00000011		:OmegaFireRate_Plus1
; %00000011 = slow //  1 = fast
	ld (nextOmegaTick_Plus1-1),a
	jp nz,OmegaSkipFrame
	
	push bc
	push de

		ld a,0 :nextOmega_Plus1
		inc a
		and %00011111
		ld (nextOmega_Plus1-1),a
		call	OmegaBurstGeneral

	pop de
	pop bc
OmegaSkipFrame:

ret
OmegaBurstGeneral:
		push hl
			push af
				ld d,0
				call OmegaArray_GetPointer	
				ld b,32
;				call OmegaArray_Engage_Center
				call OmegaArray_Engage_Outer
			pop af
			;ld d,2
			;call OmegaArray_GetPointer	
			;ld c,32
			;call OmegaArray_Engage_Loopb
		pop hl
ret





align 256,&00
OmegaArraySize equ 256
OmegaArrayPointer1: 	
defs OmegaArraySize*3,&0
OmegaArrayPointer2: 	
defs OmegaArraySize*3,&0
OmegaArrayPointer3: 	
defs OmegaArraySize*3,&0
OmegaArrayPointer4: 	
defs OmegaArraySize*3,&0



OmegaArray_EngageV2:

	ld b,OmegaArraySize
	ld de,&8000
	ld a,r
	ld e,a
OmegaArray_Engage_LoopV2:

	ld a,(hl)
	or a
	jp z,OmegaArray_EngageV2MoveNext
	and %00001111
	ld c,a

	ld a,(NextShot_Plus1-1)
	inc a 
	ld (NextShot_Plus1-1),a

	and %01110000
	or c

	ld (hl),a
OmegaArray_EngageV2MoveNext:
	inc l
	djnz OmegaArray_Engage_LoopV2

ret

OmegaArray_GetPointer:
	;000BBPPP
	ld e,a
	and %00011000
	cp  %00000000
	jp z,OmegaBank1
	cp  %00001000
	jp z,OmegaBank2
	cp  %00010000
	jp z,OmegaBank3
	cp  %00011000
	jp z,OmegaBank4
OmegaBank1:
	ld hl,OmegaArrayPointer1
	jr OmegaArray_GetPointer_Finish
OmegaBank2:
	ld hl,OmegaArrayPointer2
	jr OmegaArray_GetPointer_Finish
OmegaBank3:
	ld hl,OmegaArrayPointer3
	jr OmegaArray_GetPointer_Finish
OmegaBank4:
	ld hl,OmegaArrayPointer4
	jr OmegaArray_GetPointer_Finish
OmegaArray_GetPointer_Finish:
	ld a,e
	rrca
	rrca
	rrca
	ld e,a
	
 
	add hl,de
ret
OmegaArray_Engage_Center:
OmegaArray_Engage_Loop:

	ld a,(hl)
	or a
	jp nz,OmegaArray_Engage_Loop_Skip
	ld a,&0 :NextShot_Plus1
	inc a 
	ld (NextShot_Plus1-1),a
	and %01111110
	inc a
	ld (hl),a
	inc h
	ld (hl),&80	:OmegaX_Plus1
	inc h
	ld (hl),&80	:OmegaY_Plus1
	dec h
	dec h
OmegaArray_Engage_Loop_Skip:
	inc l
	djnz OmegaArray_Engage_Loop

ret


OmegaArray_Engage_Outer:
OmegaArray_Engage_LoopB:

	ld a,(hl)
	or a
	jp nz,OmegaArray_Engage_Loop_SkipB

	ld de,LROmegas;LeftOmegas :NextOmegas_Plus2
;	ld a,e
;	xor 64
;	ld d,a
;
	ld a,(de)
	inc a
	jr nz,NoOmegaReset
	ld de,LROmegas;LeftOmegas
	ld a,(de)
	inc a
NoOmegaReset:

	inc de
	ld (NextOmegas_Plus2-2),de


;	ld a,&0 :NextShotB_Plus1
;	inc a 
;	ld (NextShotB_Plus1-1),a
;	and %01111110

	ld (hl),a
	inc h

;36
;172

	ld a,32;36		:OmegaXB_Plus1
	xor 144;136
	ld (OmegaXB_Plus1-1),a
	ld (hl),a
	inc h
	ld a,100+24	:OmegaYB_Plus1
	sub 40
	jp nc,OmegaYset
	or a
OmegaYset:
	ld (OmegaYB_Plus1-1),a
	ld (hl),a
	dec h
	dec h
OmegaArray_Engage_Loop_SkipB:
	inc l
	djnz OmegaArray_Engage_LoopB

ret

Player_Hit_Injure_2:
	ld sp,(SpRestore_Plus2-2)
	call AkuYou_Player_Hit_Injure_2
	di
	jp StarLoopP2Skip

Player_Hit_Injure_1:
	ld sp,(SpRestore_Plus2-2)
	call AkuYou_Player_Hit_Injure_1
	di
	jp StarLoopP1Skip
LROmegas:
defb 2-2,8-2,4-2,10-2,16-2,12-2
defb 18-2,26-2,20-2,28-2,22-2,30-2
defb 32,36,44,38,46,40
defb 48,52,60,54,62,56
defb 78,84,80,86,92,88
defb 94,102,96,104,98,106
defb 110,114,122,116,124,118

defb 255


OmegaArray_Redraw:

	ld a,(NextShot_Plus1-1)
	ld c,a
	ld a,r
	xor c 
	ld (NextShot_Plus1-1),a

call OmegaArray_Init

ld hl,OmegaArrayPointer1
call OmegaArray_RedrawChunk
ld hl,OmegaArrayPointer2
call OmegaArray_RedrawChunk
ld hl,OmegaArrayPointer3
call OmegaArray_RedrawChunk
ld hl,OmegaArrayPointer4
call OmegaArray_RedrawChunk
;call OmegaArray_RedrawChunk
;call OmegaArray_RedrawChunk


ret

OmegaArray_Init:
	call Akuyou_ScreenBuffer_GetActiveScreen 
	ld (GetMemPos_ScreenOffset_Plus1-1),a

	call Akuyou_Timer_GetTimer	;ld a,(Timer_TicksOccured)
	or a
	ret z	; see if game is paused (TicksOccurred = 0 )


	ld a,0:OmegaTick_Plus1
	inc a
	ld (OmegaTick_Plus1-1),a
	ld c,a

	and %00000001

	ld a,%00001111 ;basic move
	jr z,FrameDone
	;ld a,r
	;xor c
	;and %00010000
	;ld (StarLoopTimeSwitch_Plus1-1),a
	;ld a,&7E
	ld a,%01111111 ;advanced move
FrameDone:
	;ld (StarLoopAltMove_Plus1-1),a
ld (StarLoopTimeSwitch_Plus1-1),a
	
;	rrca
;	rrca
;	rrca

;	ld(TimeOffset_Plus1-1),a
;	inc a
;	ld (OmegaTick_Plus1-1),a
;	ld (OmegaTickB_Plus1-1),a
;	ld (OmegaTickB2_Plus1-1),a
	;xor b
	;ld (OmegaTickB_Plus1-1),a
	;Reset the star array to allow more stars to be added
	;ld a,0	
	;ld (StarArrayFullMarker_Plus1-1),a

	; Redraw the enemy star array

	;or B
	;ret z

	;configure the loop for the enemy star array
	ld hl,&0000

	call AkuYou_Player_GetPlayerVars

	;configure the loop for the enemy star array
	ld hl,Player_Hit_Injure_1
;	ld iy,Player_Array


;	ld a,(iy+4)	;invincibility
	ld a,(iy+4)	;invincibility
	and %11100000	
	jp z,StarArray_PlayerVunrable

	; player invincible
	ld hl,StarLoopP1Skip
StarArray_PlayerVunrable:
	; load player 1 location - do it in advance to save time during the loop

;	ld a,(iy+1)
	ld a,(iy+1)	
	sub 2
	ld (Player1LocX_Plus1-1),a
	add 4
	ld (Player1LocXB_Plus1-1),a
	ld a,(iy+0)	
;	ld a,(iy+0)
	sub 2
	ld (Player1LocY_Plus1-1),a
	add 4
	ld (Player1LocYB_Plus1-1),a


	ld (CurrentStarArrayCollisionsB2_Plus2-2),hl





;;;;;;;;;;;;;;;;;;;;; Player 2 handler



	;configure the loop for the enemy star array
	ld hl,Player_Hit_Injure_2
;	ld iy,Player_Array2
;	ld a,(iy+4)	;invincibility
	ld a,(iy+4+Akuyou_PlayerSeparator)
	
	and %11100000	
	jp z,StarArray_PlayerVunrable2

	; player invincible
	ld hl,StarLoopP2Skip
StarArray_PlayerVunrable2:
	; load player 2 location - do it in advance to save time during the loop
	ld a,(iy+1+Akuyou_PlayerSeparator)
;	ld a,(iy+1)
	dec a
	dec a
	ld (Player2LocX_Plus1-1),a
	add 4
	ld (Player2LocXB_Plus1-1),a
	ld a,(iy+0+Akuyou_PlayerSeparator)
;	ld a,(iy+0)
	dec a
	dec a
	ld (Player2LocY_Plus1-1),a
	add 4
	ld (Player2LocYB_Plus1-1),a


	ld (CurrentStarArrayCollisions2B2_Plus2-2),hl


	ld a,(OmegaTick_Plus1-1)
	and %00000111
	ret nz


	ld a,(OmegaTick_Plus1-1)
	and %00011000

	cp  %00011000
	jp z,OmegaArray_RedrawA
	cp  %00001000
	jp z,OmegaArray_RedrawB
	cp  %00010000
	jp z,OmegaArray_RedrawC
OmegaArray_RedrawD:
	ld hl,OmegaArrayPointer4
	jp OmegaArray_EngageV2
OmegaArray_RedrawA:
	ld hl,OmegaArrayPointer1
	jp OmegaArray_EngageV2
OmegaArray_RedrawB:
	ld hl,OmegaArrayPointer2
	jp OmegaArray_EngageV2
OmegaArray_RedrawC:
	ld hl,OmegaArrayPointer3
	jp OmegaArray_EngageV2

OmegaArray_RedrawChunk:

	ld bc,OmegaArraySize

	ld (SpRestore_Plus2-2),sp
	di
Starloop2:

	ld a,(hl)	; MX
	and 255 :StarLoopTimeSwitch_Plus1
	jp Z,StarArray_Turbo

	ld (Hlrestore_Plus2-2),hl
	inc h

	;ld a,(hl)StarLoopAltMove_Plus1
	;xor 0 
	ld (MovePointer_Plus2-2),a

	;inc h

	ld B,(hl) ; X
	inc h
	ld C,(hl) ; Y
	
Starloop_NotZero:




PlayerCollisions:

		ld a,B
		cp 0:Player1LocX_Plus1
		jr c,StarLoopP1Skip
		cp 0:Player1LocXB_Plus1
		jr nc,StarLoopP1Skip

		ld a,c
		cp 0:Player1LocY_Plus1
		jr c,StarLoopP1Skip
		cp 0:Player1LocYB_Plus1
		;jr nc,StarLoopP1Skip

		jp C,AkuYou_Player_Hit_Injure_1 :CurrentStarArrayCollisionsB2_Plus2
		
StarLoopP1Skip:

		ld a,c
		cp 0:Player2LocY_Plus1
		jr c,StarLoopP2Skip
		cp 0:Player2LocYB_Plus1
		jr nc,StarLoopP2Skip

		ld a,B
		cp 0:Player2LocX_Plus1
		jr c,StarLoopP2Skip
		cp 0:Player2LocXB_Plus1
		;jr nc,StarLoopP2Skip

		jp C,Player_Hit_Injure_2 :CurrentStarArrayCollisions2B2_Plus2
		
StarLoopP2Skip:
StarCollisionsDone:





		ld de,(MoveArray1) :MovePointer_Plus2
;		pop de 
		ld (OmegaMoves),de

OmegaMoves:	nop
		nop

		;add c 
		ld (hl),c
		dec h
		ld (hl),b 

		bit 0,b
	ex af,af'
			;	call GetMemPos		

;GetMemPos:
		; Input  BC= XY (x=bytes - so 80 across)
		; output HL= screen mem pos
			ld h,0
			ld a,c
			sub 24	
			cp 199			;we are at the bottom of the screen
			jr NC,DoMoves_Kill	;over the page
			ld l,a
	
			add hl,hl 		; table is two bytes so double hl

			ld de,&6969 :scr_addr_tablePos_Plus2	; get table
			add hl,de		;add line num
			ld sp,hl
			pop de
			pop hl			
			ld a,b	;get the X col
			sub 24
			cp 160			;we are at the bottom of the screen
			jr NC,DoMoves_Kill	;over the page
			srl a
			ld c,a

			ld b,0:GetMemPos_ScreenOffset_Plus1 ; screen offset

			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
			ex de,hl

			add hl,bc  	; hl = memory line, bc = X pos = hl is now the location on screen
			;ret ;return memory location in hl
	
	ex af,af'
			;ld bc,&CC33
			jr z,Stars_DrawDot_B2

			ld a,(hl)	;7

			or &33;c;&33	;7	:Stars_Color1a_Plus1
			ld (hl),a

			ex de,hl

			;ld a,(hl)
			;and b;&CC
			;or c;&33		:Stars_Color1b_Plus1
			ld (hl),a

		jp StarArray_Next

Stars_DrawDot_B2:

			ld a,(hl)
			;and b;&33
			or &CC;c;&CC		:Stars_Color2a_Plus1
			ld (hl),a

			ex de,hl

			;ld a,(hl)
			;and b;&33	
			;or c;&CC		:Stars_Color2b_Plus1
			ld (hl),a

StarArray_Next:
	
	ei
	ld sp,&1234 :SpRestore_Plus2
	di

StarArray_Finish:
	ld hl,&0000 :Hlrestore_Plus2
StarArray_Turbo:
	inc l


	jp nz,starloop2

	ld sp,(SpRestore_Plus2-2)
	ei
	ret

DoMoves_Kill:
	ld hl,(Hlrestore_Plus2-2)
	xor a
	ld (hl),a ;MX

	jp StarArray_Turbo

align 256,&00
MoveArray1:
	nop ; Zero marks a dead command

	nop	;L			LEFT 	0
	dec b	;L

	dec c	;UL			LEFT	2
	dec b	;DL

	dec c	;U			X	4
	nop	;U

	dec c	;UR			RIGHT	6
	inc b	;UR

	nop	;R			RIGHT	8
	inc b	;R

	inc c	;DR			RIGHT	10
	inc b	;DR 

	inc c	;D			X	12
	nop	;D

	inc c	;DL			LEFT	14
	dec b	;DL

MoveArray4:


	inc c	;DL			LEFT 16
	dec b	;DL
	
	nop	;L			LEFT 18
	dec b	;L

	dec c	;UL			LEFT 20
	dec b	;DL

	dec c	;U			X 22
	nop	;U

	dec c	;UR			RIGHT 24
	inc b	;UR

	nop	;R			RIGHT 26
	inc b	;R

	inc c	;DR			RIGHT 28
	inc b	;DR 

	inc c	;D			X	30
	nop	;D

;17 bytes later 1

MoveArray6:

	dec c	;UL			LEFT	32
	dec b	;DL

	dec c	;U			X	34
	nop	;U

	dec c	;UR			RIGHT	36
	inc b	;UR

	nop	;R			RIGHT	38
	inc b	;R

	inc c	;DR			RIGHT	40
	inc b	;DR 

	inc c	;D			X	42
	nop	;D

	inc c	;DL			LEFT	44
	dec b	;DL

	nop	;L			LEFT	46
	dec b	;L

MoveArrayLR:


	dec b	;DL			LEFT	48
	dec b	;DL

	defb &18,&3 ;jr 3		X	50

	inc b	;UR			RIGHT	52
	inc b	;UR

	inc b	;R			RIGHT	54
	inc b	;R

	inc b	;DR 			RIGHT	56
	inc b	;DR 

	defb &18,&3 ;jr 3			X 58

	dec b	;DL			DOWN	60
	dec b	;DL

	dec b	;L			DOWN	62
	dec b	;L
MoveArrayUD:



	dec c	;UL			X	64
	dec c	;UL

	dec c	;U			X	66
	dec c	;U

	dec c	;U			X	68
	dec c	;U

	defb &18,&3 ;jr 3		X	70

	inc c	;DR			X	72
	inc c	;DR

	inc c	;D			X	74
	inc c	;D

	inc c	;DL			X	76
	inc c	;DL			

	defb &18,&3 ;jr 3
MoveArray2:
	nop	;L			LEFT	78
	dec b	;L

	dec c	;UL			LEFT	80
	dec b	;DL

	dec c	;U			X	82
	nop	;U

	dec c	;UR			RIGHT	84
	inc b	;UR

	nop	;R			RIGHT	86
	inc b	;R

	inc c	;DR			RIGHT	88
	inc b	;DR 

	inc c	;D			X	90
	nop	;D

	inc c	;DL			LEFT	92
	dec b	;DL
MoveArray7:
	inc c	;DL			LEFT	94
	dec b	;DL

	nop	;L			LEFT	96
	dec b	;L

	dec c	;UL			LEFT	98
	dec b	;DL

	dec c	;U			X	100
	nop	;U

	dec c	;UR			RIGHT	102
	inc b	;UR

	nop	;R			RIGHT	104
	inc b	;R

	inc c	;DR			RIGHT	106
	inc b	;DR 

	inc c	;D			X	108
	nop	;D

MoveArray8:

	dec c	;UL			LEFT  	110
	dec b	;DL

	dec c	;U			X	112
	nop	;U

	dec c	;UR			RIGHT	114
	inc b	;UR

	nop	;R			RIGHT	116
	inc b	;R

	inc c	;DR			RIGHT	118
	inc b	;DR 

	inc c	;D			X	120
	nop	;D

	inc c	;DL			LEFT	122
	dec b	;DL

	nop	;L			LEFT	124
	dec b	;L

;,&21
;;;;;;;;;;;;;;;;; End Of Omega Array Code





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






ShowInsultAchievement:

;	push iy
;	call AkuYou_Player_GetPlayerVars
;	ld a,(iy-10)
	;Achievements (Wxx54321)	-10

;	ld (iy-10),a
;	pop iy



	ld a,0			:SmartbombUsed_Plus1
	or a			; no achievement if smartbombs used!
	ret nz
	push iy
	call AkuYou_Player_GetPlayerVars
	ld a,(iy-10)
	;Achievements (Wxx54321)	-10
	or            %00010000
	ld (iy-10),a
	pop iy

push hl

	ld hl,InteractiveInsultsText
	ld (ScreenShakeCall_Plus2-2),hl

	ld hl,InsultAchievement
	ld a,4
;	jr DoShowInsult
DoShowInsult:
	ld (IOnscreenTextPointer_Plus2-2),hl
	ld (InsultPlayerNum_Plus1-1),a
	ld a,1
	ld (InsultCharNum_Plus1-1),a
	ld a,5
	ld (IOnscreenTimer_Plus1-1),a
pop hl
ret


InsultAchievement:
db 4,"       Achievement Unlocked:",13
db   "         Hardcore Akuma!!",13
db   " Last Boss with No Smartbombs Used","!"+&80
db 0

InteractiveInsultsText:
	ld a,5 :IOnscreenTimer_Plus1
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

	ld bc,&6969 :IOnscreenTextPointer_Plus2

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
	ld (IOnscreenTimer_Plus1-1),a
	ret

InteractiveInsultsText_AllOnscreen:
	ld a,(IOnscreenTimer_Plus1-1)
	dec a
	ld (IOnscreenTimer_Plus1-1),a
	or a
	ret nz
	ld (IOnscreenTimer_Plus1-1),a
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
	ld (IOnscreenTextPointer_Plus2-2),bc
	ld a,5
	ld (OnscreenTimerB_Plus1-1),a
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
save "lz48\T31-SC1.D03",LevelOrigin+ LevelDataStart,&3ff8-LevelDataStart	;address,size...}[,exec_address]

; Bank 2 T31-SC2.D03