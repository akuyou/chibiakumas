



;***************************************************************************************************

;				Object Driver

;***************************************************************************************************
;We walk up 00XXXXXX then back down 01XXXXXX - this means the system needs half of 256*4,
;and has an upper limit of 64 items!
; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA

; Y = object y  	(1)
; X = object X		(2)
; M = object Move	(3)
; S = Object Sprite	(4)

; L = Object Life	(5)
; P = Object Program	(6)
; R = Resolution 	(7) bytes #XXXX1111
; A = Animator		(8)
ObjectArray_reConfigureForSize:
	or a
	ret z
ObjectArray_ConfigureForSizeB:
	ld (ObjectSpriteSizeCurrent_Plus1-1),a
	ld (SpriteSizeShiftFull_Plus1-1),a
	ld (SpriteSizeShiftFullB_Plus1-1),a
	ld (SpriteSizeShiftFullC_Plus1-1),a
	srl a
;	ld (SpriteSizeShiftHalf_Plus1-1),a

;	ld (SpriteSizeShiftHalfC_Plus1-1),a

	;ld (SpriteSizeShiftHalfE_Plus1-1),a
	;ld (SpriteSizeShiftHalfF_Plus1-1),a
	;ld (SpriteSizeShiftHalfG_Plus1-1),a


;	ld (SpriteSizeShiftQuarter_Plus1-1),a
;	ld (SpriteSizeShiftQuarterB_Plus1-1),a

	ld (SpriteSizeShiftHalfB_Plus1-1),a
	ld (SpriteSizeShiftHalfD_Plus1-1),a


	or %00000011
	ld (SpriteSizeShiftHalfH_Plus1-1),a
;	rrca

	;ld (SpriteSizeShiftQuarterC_Plus1-1),a

;	rrca
	;ld (SpriteSizeShiftEight_Plus1-1),a
	;ld (SpriteSizeShiftEightB_Plus1-1),a
ObjectArray_ConfigureForSize:


push iy
;	ld iy,Player_Array	;we update player location in advance for fast collision detection
;	ld a,(iy+0)	;PlayerY
	ld a,(P1_P00)	;PlayerY

;	sub 12	SpriteSizeShiftHalf_Plus1
	ld (PlayerY2_Plus1-1),a
	sub 24	:SpriteSizeShiftFull_Plus1
	call C,ZeroA
	ld (PlayerY1_Plus1-1),a
;	ld a,(iy+1)	;PlayerX
	ld a,(P1_P01)	;PlayerX
;	sub 6 SpriteSizeShiftQuarter_Plus1
	ld (PlayerX2_Plus1-1),a
	sub 12	:SpriteSizeShiftHalfB_Plus1
	call C,ZeroA
	ld (PlayerX1_Plus1-1),a


;	ld iy,Player_Array2	;we update player location in advance for fast collision detection
;	ld a,(iy+0)	;PlayerY
	ld a,(P2_P00)	;PlayerY
;	sub 12 SpriteSizeShiftHalfC_Plus1
	ld (Player2Y2_Plus1-1),a
	sub 24	:SpriteSizeShiftFullB_Plus1
	call C,ZeroA
	ld (Player2Y1_Plus1-1),a


;	ld a,(iy+1)	;PlayerX
	ld a,(P2_P01)	;PlayerX
;	sub 6	SpriteSizeShiftQuarterB_Plus1
	ld (Player2X2_Plus1-1),a
	sub 12	:SpriteSizeShiftHalfD_Plus1
	call C,ZeroA
	ld (Player2X1_Plus1-1),a
pop iy

ret
ZeroA:
	xor a
ret



ObjectArray_Redraw:
	ld a,(Timer_TicksOccured)
	or a
	ret z	; see if game is paused (TicksOccurred = 0 )


ifdef buildMSX_V9K
	;redraw the particle FX array
	call ParticleArray_Redraw
endif

	Call ObjectArray_ConfigureForSize

	ld B,ObjectArraySize ;00ObjectArray_Size_Plus1


	ld hl,ObjectArrayPointer;(ObjectArrayAddress)

	xor a ; Zero 
	;ld d,a
Objectloop2:	
	ld c,(hl)	; Y
	cp c	
	jr NZ,Objectloop_NotZero		;if object Y =0 the object is dead
ObjectArray_Turbo:
	inc l
	djnz Objectloop2
	ret

Objectloop_NotZero:
	ld a,c
ifdef BuildZXS
	and %11111000
endif
	ld (SprShow_Y),a
	push bc
	push hl
				;1
		inc h
		ld a,(hl) ; X
		ld (SprShow_X),a
		ld b,a
		;add hl,de				;2
		inc h

		;


		ld a,(hl) ; M
		ld ixh,a
		;add hl,de				;3
		inc h
		ld a,(hl) ; Sprite etc
		ld iyh,a

		;inc h
		set 6,l	;Flip to the second half

		;add hl,de 				;4

		ld a,(hl) ; Life etc
		ld ixl,a
		;add hl,de 				;5
		dec h;inc h
		ld a,(hl) ; Program Code
		ld iyl,a
		dec h;inc h
		ld a,(hl) ; Sprite Size 
		cp 0	:ObjectSpriteSizeCurrent_Plus1
		call nz,ObjectArray_reConfigureForSize		;Code to change sprite size!


		dec h;inc h
		ld a,(hl) ; animator  
		or a
		call nz,ObjectAnimator

		ld a,iyh
		and %00111111
		ld (SprShow_SprNum),a
		ld a,iyh		
		and %11000000
		jr z,Objectloop_OneFrameSprite
		bit 6,a

		ld a,(Timer_CurrentTick)
		jr z,Objectloop_TwoFrameSprite
		;if we got here it's a FourFrameSprite

ifdef buildMSX_V9K
	nop
	nop			:SpriteAnimSlowdownB_Plus2
endif

		and %00000011
		jr Objectloop_SpriteBankSet
Objectloop_OneFrameSprite:
		xor a
		jr Objectloop_SpriteBankSet
Objectloop_TwoFrameSprite:

ifdef buildMSX_V9K
	nop
	nop			:SpriteAnimSlowdownC_Plus2
endif
		cpl
		and %00000010

Objectloop_SpriteBankSet:
		ld (ObjectSpriteBank_Plus1-1),a



		
	ld a,ixl
	bit 6,a
	jr z,ObjectLoopBothPlayerSkip	; Doesn't hurt player


	;used to modify this, but now we assume the player is alway vunurable
	; we check anyway before deducting a life			
	;Jp Objectloop_PlayerVunrable ;Objectloop_DoPlayerCollisions_Plus2
Objectloop_PlayerVunrable:
;-----------------------------------player collisions---------------------------------
		
	


			ld a,b
;			add 3 SpriteSizeShiftEight_Plus1
			cp 0 :PlayerX1_Plus1
			jr c,ObjectLoopP1Skip
			cp 0 :PlayerX2_Plus1
			jr nc,ObjectLoopP1Skip

			ld a,c
;			add 12 SpriteSizeShiftHalfE_Plus1	
			cp 0 :PlayerY1_Plus1
			jr c,ObjectLoopP1Skip
			cp 0 :PlayerY2_Plus1
			jr nc,ObjectLoopP1Skip

			ld a,(P1_P09)
			or a
			jr z,ObjectLoopP1Skip

			push hl
				ld hl,Player_Array		
				call Player_Hit
			pop hl
	

		ld a,b
		or a
		;jr nz,ObjectLoopP1Skip
					
		jp z,ObjectLoop_SaveChanges

ObjectLoopP1Skip:

			;assume we're playing 1 player!
			;so check if we have a player 2.
			ld a,(P2_P09)
			or a
			jr z,ObjectLoopP2Skip

			ld a,b
;			add 3	 SpriteSizeShiftEightB_Plus1
			cp 0 :Player2X1_Plus1
			jr c,ObjectLoopP2Skip
			cp 0 :Player2X2_Plus1
			jr nc,ObjectLoopP2Skip

			ld a,c
;			add 12	SpriteSizeShiftHalfF_Plus1
			cp 0 :Player2Y1_Plus1
			jr c,ObjectLoopP2Skip
			cp 0 :Player2Y2_Plus1
			jr nc,ObjectLoopP2Skip



			push hl
				ld hl,Player_Array2
				call Player_Hit
			pop hl


			ld a,b
			or a
			;jr nz,ObjectLoopP2Skip
					; check if we killed object
			jr z,ObjectLoop_SaveChanges

ObjectLoopP2Skip:
ObjectLoopBothPlayerSkip:
	;if the object is dead, there is no point checking if its shot


	; Life BPxxxxx 		B=hurt by bullets, P=hurts player, xxxxxx = hit points (if not B then ages over time)


	ld a,ixl
	or a
	jr z,ObjectLoopP1StarSkip	; immortal object (background)
;	bit 6,a
;	ld a,ixl
	bit 7,a
	jr nz,ObjectLoop_AgelessIXLCheck	; If it can be shot, it doesn't auto age

	
	ld a,(Timer_TicksOccured)	; see if its time to age the sprite
	and %00001000
	jr z,ObjectLoop_Ageless
	
	call Object_DecreaseLife
	ld a,c
	or a
	jr z,ObjectLoop_SaveChanges
;	pop de
ObjectLoop_Ageless:
 	ld a,ixl
ObjectLoop_AgelessB:
	bit 7,a
	jr z,ObjectLoop_NotShot	; cant be shot
ObjectLoop_AgelessIXLCheck:
;-----------------------------------player bullet collisions---------------------------------
	; B=Obj X
	; C=Obj Y


	ld a,b
	;sub 6	;SpriteSizeShiftQuarterC_Plus1
	ld (ObjectHitXA_Plus1-1),a
	add 12 	:SpriteSizeShiftHalfH_Plus1
	ld (ObjectHitXB_Plus1-1),a
		
	ld a,c
	;sub 12	;SpriteSizeShiftHalfG_Plus1
	ld (ObjectHitYA_Plus1-1),a
	add 24	:SpriteSizeShiftFullC_Plus1
	ld (ObjectHitYB_Plus1-1),a
	


	ifdef Debug
		call Debug_NeedEXX
	endif

	push bc
	push de
	push hl

ObjectLoop_HeightNZ:

		

		ld b ,PlayerStarArraySize;36 StarArraySize_PlayerB_Plus1
		ld hl,PlayerStarArrayPointer;&0000 StarArrayMemloc_Player_Plus2
	ObjectLoop_PlayerStarNext:
		ld a,(hl)	;check Y of star
		cp 00 :ObjectHitYA_Plus1
		;jp c,ObjectLoop_PlayerStarSkip
		jr nc,ObjectLoop_PlayerStarScanContinue
	ObjectLoop_PlayerStarSkip:	
		inc l
		djnz ObjectLoop_PlayerStarNext
		jr ObjectLoop_PlayerStarEnd



ObjectLoop_PlayerStarScanContinue:

		cp 00 :ObjectHitYB_Plus1
		jr nc,ObjectLoop_PlayerStarSkip
	
		inc h
		ld a,(hl)
		dec h
		cp 00 :ObjectHitXA_Plus1
		jr c,ObjectLoop_PlayerStarSkip
		cp 00 :ObjectHitXB_Plus1
		jr nc,ObjectLoop_PlayerStarSkip
	
		inc h
		inc h
		ld a,(hl)
		and %10000000	; CHeck if this is player 1's bullet or not
		dec h
		dec h
		inc a
		ld (ObjectShotShooter_Plus1-1),a
;ObjectShotShooter
		xor a
		ld (ObjectLoop_IFShot_Plus1-1),a
		ld (hl),0 ; star hit so lets remove it

;		inc l
;		djnz nz,ObjectLoop_PlayerStarNext
	ObjectLoop_PlayerStarEnd:

	pop hl
	pop de
	pop bc

	ifdef Debug
		call Debug_ReleaseEXX
	endif		

ObjectLoopP1StarSkip:

		jr $+10 :ObjectLoop_IFShot_Plus1
		call Object_DecreaseLifeShot :ObjectShotOverride_Plus2		;3 bytes
		ld a,8								;2 bytes
		ld (ObjectLoop_IFShot_Plus1-1),a				;3 bytes
		;jr ObjectLoop_SaveChanges
ObjectLoop_NotShot:

		ld d,ixh
		call DoMoves	:ObjectDoMovesOverride_Plus2
		ld ixh,d
		
ObjectLoop_SaveChanges:
		inc h;dec h	;	 Animator
		inc h;dec h	;	 Spritesize never changes

		ld a,iyl
		ld (hl),a ; Program Code
		inc h ;dec h
		ld a,ixl 
		ld (hl),a ;Life
		res 6,l ;dec h
		ld a,iyh 
		ld (hl),a ;spr
		dec h
		ld a,ixh
		ld (hl),a ;Move
		dec h
		ld (hl),b ;X
		dec h
		ld (hl),c ;Y
		
		ld a,iyl
		or a
		call nz, ObjectProgram
ObjectLoop_ShowSprite:



	ifdef buildMSX
		ld bc,&0000:Bank0_Ypos_Plus2
	else
		ld b,Akuyou_LevelStart_Bank;&C0
	endif
		ld hl,Akuyou_LevelStart;&4000	;ObjectSpritePointer_Plus2

ifdef Support64k

JR64K_2:	add 0
JR64K_From2:
		;ld a,(CPCVer)			;64k only has 1 bank
;		and 128
;		jr z, ObjectLoop_ShowSprite_BankSet
endif



		ld a,0 :ObjectSpriteBank_Plus1
		or a
		jr z,ObjectLoop_ShowSprite_BankSet
		dec a;cp 1
		jr z,ObjectLoop_ShowSprite_BankSet3
		dec a; cp 2
		jr z,ObjectLoop_ShowSprite_BankSet1
		;dec a ;cp 3
		;jr z,ObjectLoop_ShowSprite_BankSet2
		jr ObjectLoop_ShowSprite_BankSet2
ObjectLoop_ShowSprite_BankSet1:		


	ifdef buildMSX
		ld bc,&0000:Bank1_Ypos_Plus2
		ld hl,LevelData128kpos   
	else
		ld a,LevelData128kpos_Bank;&C7
	endif

		jr ObjectLoop_ShowSprite_BankSetA;ObjectLoop_ShowSprite_BankSet40

ObjectLoop_ShowSprite_BankSet3:	
	ifdef buildMSX
		ld bc,&0000:Bank3_Ypos_Plus2
		ld hl,LevelData128kpos_D 
	else
		ld a,LevelData128kpos_D_Bank;&C4

		ifdef BuildZXS
			ld h,&E0
		else
			ld h,LevelData128kpos_D_OneByte
		endif
	endif

		jr ObjectLoop_ShowSprite_BankSetA
ObjectLoop_ShowSprite_BankSet2:	

	ifdef buildMSX
		ld bc,&0000:Bank2_Ypos_Plus2
		ld hl,LevelData128kpos_C  
	else
		ld b,LevelData128kpos_C_Bank;&C4
	endif
	ifdef BuildENT
		ld h,LevelData128kpos_C_OneByte
	endif
ObjectLoop_ShowSprite_BankSet40:
		;ld h,&40
JR64K_To2:
ObjectLoop_ShowSprite_BankSet:
		ld a,b
ObjectLoop_ShowSprite_BankSetA:

	if buildCPCv + buildENTv
 		call BankSwitch_C0_SetCurrent
		ld (SprShow_BankAddr),hl
		call ShowSprite
		call BankSwitch_C0_SetCurrentToC0
	endif
	ifdef buildZXS
		ld (SprShow_BankAddr),hl
		ld hl,ShowSprite	
		call Bankswapper_CallHL

		ld a,0 :SpriteForceCount_Plus1
		inc a
		cp 8
		jp nz,SpriteForceCountSkip
		call INT_Force
		xor a
SpriteForceCountSkip:
		ld (SpriteForceCount_Plus1-1),a
	endif

	ifdef buildMSX
		ld (SprShow_MsxBankYpos_Plus2-2),bc
		ld (SprShow_BankAddr),hl
		call ShowSprite
	endif

ObjectArray_Next:
	pop hl
	pop bc
	xor a ; Zero 
	jp ObjectArray_Turbo


Animator_VectorArray:
defw ObjectAnimator_Update	;1
defw ObjectAnimator_Sprite	;2
defw ObjectAnimator_Move	;3
defw ObjectAnimator_Program	;4
defw ObjectAnimator_EndOfLoop	;5
defw ObjectAnimator_SpriteMoveProg;6
defw ObjectAnimator_Animator;7
defw ObjectAnimator_CondLoop;8
defw ObjectAnimator_CondJmp;9
defw ObjectAnimator_Spawn;10
defw ObjectAnimator_Kill;11
defw ObjectAnimator_Call;12
defw ObjectAnimator_Halt;13


ObjectAnimator_Spawn:

	ld a,(hl)
	push hl
		call DoObjectSpawn
	pop hl
	call ObjectAnimator_IncreaseTick
	jr ObjectAnimatorAgain

ObjectAnimator_CondLoopTrue:
	Call ObjectAnimator_IncreaseTick

	exx
ObjectAnimator:
	;our animator is in A
	;format is
	;TTTTAAAA 
	;	AAAA = animator (1-15) ; 0 = do nothing
	;	TTTT = time	(0-15) ; loops
	; If you need more than that use custommoves!

	ifdef Debug
		call Debug_NeedEXX
	endif
	exxdi	
	exx
ObjectAnimatorAgain:
		call getAnimatorMempos
		;check if a tick has occured	
		ld a,(hl)
		ld e,a
		ld a,(Timer_TicksOccured)
		and e
		jp z,ObjectAnimator_Done	;no tick, so end
		inc hl	

ObjectAnimator_ExecuteTick:
		ld a,b
		and %11110000	;convert ticknum to a byte
		rrca		;each tick's commands takes 4 bytes
		rrca

		ld d,0
		ld e,a
		add hl,de
		ld a,(hl)
		inc hl	

		push hl			;
		ld hl,Animator_VectorArray
		jp VectorJump_PushHlFirst

		jr ObjectAnimator_Update
ObjectAnimator_Sprite:
		ld a,(hl)
		ld iyh,a
		jr ObjectAnimator_Update
ObjectAnimator_Move:
		ld a,(hl)
		ld ixh,a
		jr ObjectAnimator_Update
ObjectAnimator_SpriteMoveProg:
		ld a,(hl)
		ld iyh,a
		inc hl
		ld a,(hl)
		ld ixh,a
		inc hl	;Fall in to program
ObjectAnimator_Program:
		ld a,(hl)
		ld iyl,a
		jr ObjectAnimator_Update
ObjectAnimator_Call:
	;	push de
			ld e,(hl)
			inc hl
			ld d,(hl)
			inc hl
			call CallDE
;		pop de
		jr ObjectAnimator_Update
ObjectAnimator_Animator:
		ld a,(hl)
		or a				;see if new animator is zero (No animator)
		jr z,ObjectAnimator_Save
		jr ObjectAnimatorAgain
ObjectAnimator_CondJmp:
		ld e,(hl)
		ld a,(Timer_TicksOccured)	
		and e
		jr z,ObjectAnimator_CondLoopTrue	; Just read the next frame
		inc hl
		ld c,(hl)
		;change tick if condition is true
ObjectAnimatorNextTick:
		ld a,b
		and %00001111
		or c
		jr ObjectAnimatorAgain
ObjectAnimator_CondLoop:
		ld e,(hl)
		ld a,(Timer_TicksOccured)	
		and e
		jp nz,ObjectAnimator_CondLoopTrue	;Fall into endofloop
ObjectAnimator_EndOfLoop:
		ld a,b
		and %00001111
		call GetAnimatorMempos
		inc hl
		jp ObjectAnimator_ExecuteTick
ObjectAnimator_IncreaseTick:
		ld a,b
		add %00010000
		and %11110000
		ld c,a
		ld a,b
		and %00001111
		or c
ret
ObjectAnimator_Halt:
		ld a,b
		jr ObjectAnimator_Save
ObjectAnimator_Update:
		;We're done, so update the tick
		Call ObjectAnimator_IncreaseTick
ObjectAnimator_Save:
	exx
	exxei 
	ld (hl),a
	ifdef Debug
		call Debug_ReleaseEXX
	endif
ret
ObjectAnimator_Kill:
	exx
;	ei  
; *********** SHOULD THERE BE AN EI HERE?

	xor a
	ld c,a
	ld iyl,a	;wipe program
	ld ixh,a
ret

ObjectAnimator_Done:
	exx
	exxei 
	ifdef Debug
		call Debug_ReleaseEXX
	endif
ret

GetAnimatorMempos:
	ld b,a
	ld hl,&6969	:AnimatorPointers_Plus2
	ld d,0
	and %00001111
	dec a
	rlca
	ld e,a
	;read the mempointer to the animator
	add hl,de
	ld a,(hl)
	inc hl		
	ld h,(hl)
	ld l,a
ret
DoObjectSpawn:
push de
push bc
push iy


	ld iy,LdAFromHLIncHL	; Set RST 6 to do our bidding

	ld hl,Event_SavedSettings ;Event_SavedSettings_Plus2
	ld (Event_SavedSettingsFinal_Plus2-2),hl
	
	call SettingsGetLocation
	Call DoSettingsLoad
	exx
	push bc
	exx
	pop bc
	ld d,b
	call Event_AddObject	;C=y ;d=x
pop iy
pop bc
pop de
ld hl,(Objects_LastAdded_Plus2-2)
ret


ObjectProgram:
	ret z		; return if zero
	cp %00000001
	jp z,ObjectProgram_BitShiftSprite	; Used by background, sprite bank based on X co-ord
	and %11111000

					;00000XXX = Powerup
	jr z,ObjectProgram_PowerUps
	cp %11110000			;11110XXX = Animate every X frames
	jp z,ObjectProgram_FrameAnimate
	and %11100000
	jr z,ObjectProgram_PowerUps	;0001XXXX = Smartbombable Powerup

	cp  %00100000			;001XXXXX = Fastfire
	jp z,ObjectProgram_FastFire
	cp  %01000000			;010XXXXX = Fastfire
	jp z,ObjectProgram_MidFire
	cp  %01100000			;011XXXXX = Fastfire
	jp z,ObjectProgram_SlowFire
	cp  %10000000			;100XXXXX = Fastfire
	jp z,ObjectProgram_SnailFire
	cp  %11000000			;110XXXXX = Fastfire
	jp z,ObjectProgram_Mid2Fire
	cp  %10100000			;110XXXXX = Fastfire
	jp z,ObjectProgram_HyperFire
ifdef buildMSX_V9K
	ld a,(Timer_TicksOccured_Plus1-1)
	and %11111111:TurboRCustomProgSlowdown_Plus1	;00000010 
	ret z
endif
	ld a,iyl
	cp %11111100			;Custom 1
	jr z,ObjectProgram_Custom1
	cp %11111101			;Custom 2
	jp z,null :CustomProgram2_Plus2
	cp %11111110			;Custom 3
	jp z,null :CustomProgram3_Plus2
;	cp %11111111			;Custom 4
;	jp z,null CustomProgram4_Plus2

	cp 255
	ret nz	;Only used by ep2 for a crap joke!
SpecialMoveChibiko:
	push iy
	jr ObjectProgram_MovePlayerB
ObjectProgram_Custom1:
	jp null :CustomProgram1_Plus2
ObjectProgram_PowerUps:
	ld a,iyl
	and %00001111
	cp 4
	jr z,ObjectProgram_MovePlayer
	cp 5
	jr z,ObjectProgram_SpriteBankSwitchCustom
	cp 6
	jr z,ObjectProgram_SpriteBankSwitchCustom
	cp 7
	jr z,ObjectProgram_SpriteBankSwitchCustom
	cp 8				;Custom 1
	jr z,ObjectProgram_Custom1
ifdef buildMSX_V9K
	cp 3
	jp z,V9K_CoinStars
endif 
	ret
ObjectProgram_MovePlayer:	; Used by end of level code to make player fly to a point
	;b=x ;c=y
	push iy

		ld iy,Player_Array2
		call ObjectProgram_DoMovePlayer
ObjectProgram_MovePlayerB:
		ld iy,Player_Array  
		call ObjectProgram_DoMovePlayer
	pop iy
	ret

ObjectProgram_DoMovePlayer:
	ld a,(iy)	;Y
	cp c
	jr z,  ObjectProgram_MovePlayerX
	jr nc, ObjectProgram_MovePlayerYUp
	add 8
	jr ObjectProgram_MovePlayerX
ObjectProgram_MovePlayerYUp:
	sub 8
ObjectProgram_MovePlayerX:
	ld (iy),a
	ld a,(iy+1)	;X
	cp b
	jr z,  ObjectProgram_MovePlayerDone
	jr nc, ObjectProgram_MovePlayerXUp
	add 6
	jr ObjectProgram_MovePlayerDone
ObjectProgram_MovePlayerXUp:
	sub 6
ObjectProgram_MovePlayerDone:
	ld (iy+1),a

	ret
ObjectProgram_FrameAnimate:	; Used To animate spider legs in 1st boss
	push bc
		ld a,iyl
		and %00000111
		ld b,a
		inc b
		ld a,128	; do at least 1 shift, so result is at least 1
ObjectProgram_FrameAnimate_Bitshifts:
		rlca
		djnz ObjectProgram_FrameAnimate_Bitshifts
		ld b,a
		ld a,(Timer_CurrentTick)
		and b
		
	pop bc
	ret z
	jr ObjectProgram_SpriteBankSwitch

ObjectProgram_BitShiftSprite:	; Every other X column uses an alternate sprite - for background anim
ifdef buildMSX
	ret
endif
ifdef buildZXS
	ret		;doesn't work so great on speccy
endif
if buildCPCv + buildENTv

	ld a,b
	ld (SprShow_X),a	; Makesure sprite pos is updated for Domoves
	if buildCPCv + buildENTv
		bit 0,b ;2 pixel
	endif
	ifdef buildZXS
		bit 1,b	; 4 pixel
	endif
	ret nz
endif
ObjectProgram_SpriteBankSwitch:		; an object which uses sprite bank 2
	ld a,2				; this is to split one sprite into 2 non animated
					; for basic background objects / enemies
ObjectProgram_SpriteBankSwitchCustomB:		; an object which uses sprite bank 2
	ld (ObjectSpriteBank_Plus1-1),a	; second anim frame

	ret
ObjectProgram_SpriteBankSwitchCustom:
	and %00000011
jr ObjectProgram_SpriteBankSwitchCustomB

ObjectProgram_SnailFire:
	ld a,%00010000	:FireFrequencyA_Plus1
	jr ObjectProgram_Fire
ObjectProgram_SlowFire:
	ld a,%00001000	:FireFrequencyB_Plus1
	jr ObjectProgram_Fire
ObjectProgram_MidFire:
	ld a,%00001000	:FireFrequencyC_Plus1
	jr ObjectProgram_Fire
ObjectProgram_Mid2Fire:
	ld a,%00000100;	:FireFrequencyD_Plus1
	jr ObjectProgram_Fire
ObjectProgram_FastFire:
	ld a,%00000010;	:FireFrequencyE_Plus1
	;jr ObjectProgram_Fire

ObjectProgram_Fire:

	ld d,a ;ld iyh,a

	ei	; Why is interrupts disabled here??
	ld a,(Timer_TicksOccured)

ifdef buildMSX_V9K
nop
nop	:FireSpeedTweak_Plus2
endif


	and d;iyh
	ret z
	
ObjectProgram_HyperFire:
	ld a,2
	call SFX_QueueSFX_Generic

	ld a,(SpriteSizeShiftHalfB_Plus1-1)
	ld d,a
	add c
	;	add 12		ObjectFirePosY_Plus1
	ld c,a

	ld a,d
;	ld a,(SpriteSizeShiftHalfB_Plus1-1)
	rrca
	rrca
	add b
;	ld a,b
;	add 3		;ObjectFirePosX_Plus1
	ld d,a


	ld a,iyl
	and %00011111
	ld b,a	; top left

FireCustomStar:
	
;		call Stars_AddToDefault
		jp Stars_AddObjectBatchDefault
Object_DecreaseShot_Player2:
	ld iy,Player_Array2
	jr Object_DecreaseShot_Start
 Object_DecreaseLifeShot:
	ld a,ixl
	and %00111111
	ret z	; if life is zero drop out (For custom hit code callback)
	push bc
	push IY
		;see if player has POWERSHOT!
		;Uhh, this was soo much easier before 2 player support!
		ld b,a
		ld a,0:ObjectShotShooter_Plus1	;1=Player 1, 129 = player 2
		dec a
		jr nz,Object_DecreaseShot_Player2
		ld iy,Player_Array
		;Double power shot!
	;	nop PlayerShootPower_Plus1 ;dec a
Object_DecreaseShot_Start:
		ld a,(IY+14)
		or a
		ld a,b
		jp z,Object_DecreaseShot_OnlyOne
		dec a
		jr z, Object_DecreaseShotToDeath
Object_DecreaseShot_OnlyOne:
	pop IY
	pop bc
	dec a
	jr nz,Object_DecreaseLife_AgeUpdate

	jr Object_DecreaseShotToDeathB
Object_DecreaseShotToDeath:	
	pop IY
	pop bc
Object_DecreaseShotToDeathB:
	;object has been shot to death
	
	call null :CustomShotToDeathCall_Plus2

	xor a
	ld (hl),a ;Clear object animator

	ld a,3
	call SFX_QueueSFX_Generic

ifdef buildMSX_V9K
	ld a,8
	ld (ParticleVmoveSize_Plus1-1),a

	ld a,13
	call V9K_ParticleBurst
endif



	;create a coin
	ld iyh,128+16 :PointsSpriteC_Plus1	; Sprite
	ld ixh,%10000111; Seaker Fast 1000001XX XX=Speed
	ld a,(ObjectShotShooter_Plus1-1)	;1=Player 1, 129 = player 2
	dec a
	jr z,Object_DecreaseShotToDeath_Player1
	ld ixh,%10010011; Seaker Fast P2 1000100XX XX=Speed
Object_DecreaseShotToDeath_Player1:
	ld ixl,64+63	; Life ; must "hurt" player for hit to be detected
	ld iyl,3	; Program

	ret


Object_DecreaseLife:
	ld a,ixl
	and %00111111
	dec a
	jr nz,Object_DecreaseLife_AgeUpdate
	;object has died of old age
	ld b,0
	ld C,b
	ld ixl,b

	ret
	Object_DecreaseLife_AgeUpdate:
	ifdef Debug
		call Debug_NeedEXX
	endif
	exxdi
	exx
	
		ld d,a
		ld a,ixl
		and %11000000		; Keep the 1st 2 bytes, format is ;MMLLLLLL
		or d			; MM = life mode, LLLLLL = life qty
	exx
	exxei
	ifdef Debug
		call Debug_ReleaseEXX
	endif
	ld ixl,a	
ret
ifdef buildMSX_V9K	
V9K_CoinStars:
	ld a,(Timer_TicksOccured)
	bit 3,a;and %00000100
	ret z
	bit 6,a
	jr nz,V9K_CoinStarsNoBounce
		ld a,8
		ld (ParticleVmoveSize_Plus1-1),a



V9K_CoinStarsNoBounce:
push bc
	ld a,ixh
	bit 7,a
	jr z,V9K_ParticleBurstAll
	ld b,4;fireRightWide;12
	and %00000111
	cp 5
	jr nc,V9K_ParticleBurstStart
	dec b
	dec b
	cp 1
	jr nc,V9K_ParticleBurstStart
V9K_ParticleBurstAll:
	ld b,14
V9K_ParticleBurstStart:
	ld a,b
pop bc
V9K_ParticleBurst:
	;a=burst type
	;b=X
	;c=Y
	push de
	push bc
	push hl
		push af
			ld a,b
			add 4
			ld d,a
			ld a,c
			add 12
			ld c,a
			; C = Y pos, D= X pos
			call Stars_AddToParticles
	;		ld hl,Stars_AddBurst
		pop af
		ld b,a
		call Stars_AddObjectBatch
	pop hl
	pop bc
	pop de
ret
endif
 