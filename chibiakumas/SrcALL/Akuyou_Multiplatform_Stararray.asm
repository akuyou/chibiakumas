
;***************************************************************************************************

;				 Star Array

;***************************************************************************************************


SetStarArrayPalette:
	ifndef buildZXS
		ld (StarArrayColors_Plus2-2),hl
	endif
ret
if buildCPCv+buildENTv
	Stars_Color2a equ Stars_Color2a_Plus1-1
	Stars_Color1a equ Stars_Color1a_Plus1-1
endif

ifdef buildMSX_V9K

	ParticleArray_Redraw:

		ld hl,3
		ld bc,64+6+10

		ld a,(Timer_TicksOccured)
		and %00000010			:StarSlowdown_A_Plus1
		jr z,ParticleArray_RedrawF2
		ld bc,64+6+10+3			
ParticleArray_RedrawF2:

		call StarArray_InitColors

		ld hl,null
		ld (CurrentStarArrayCollisionsB2_Plus2-2),hl
		ld (CurrentStarArrayCollisions2B2_Plus2-2),hl
	
		ld hl,ParticleArrayPointer
		ld b,StarArraySize
		ld c,8	:ParticleVmoveSize_Plus1

		ld de,&00C6

		ld a,(Timer_TicksOccured)
		and %00000100
		ld a,c
		jp z,Starloop2_Startb
		dec a
		dec a :ParticleFallDoubleSpeed_Plus1
		cp 250
		jp z,Starloop2_Startb
		ld (ParticleVmoveSize_Plus1-1),a
		jp Starloop2_Startb
endif


;ifdef buildZXS
;SetZXStarColors
;	ld a,H
;	ld (StarOR1_Plus1-1),a
;	ld a,L
;	ld (StarXOR1_Plus1-1),a
;
;	ld a,B
;	ld (StarOR2_Plus1-1),a
;	ld a,C
;	ld (StarXOR2_Plus1-1),a
;
;	ld a,D
;	ld (StarOR3_Plus1-1),a
;	ld a,E
;	ld (StarXOR3_Plus1-1),a
;
;	exx
;
;	ld a,H
;	ld (StarOR4_Plus1-1),a
;	ld a,L
;	ld (StarXOR4_Plus1-1),a
;ret
;endif





Player_StarArray_Redraw:

	; Redraw the enemy star array

;	ld B,a ;StarLastGood_Plus1


ifdef BuildZXS
	ld hl, smallstar
	ld (StarSizeSelfMod_Plus2-2),hl
endif


ifndef buildZXS
	ifdef buildMSX
		ld a,&77 :PlayerStarColor_Plus1 ;&12 ;6f
	else
		ld a,&06 :PlayerStarColor_Plus1 ;&12 ;6f
	endif
	ifdef buildMSX_V9K
		ld hl,5
		ld bc,64+6

		ld a,(Timer_TicksOccured)
		and %00000010			:StarSlowdown_B_Plus1
		jr z,Player_StarArray_RedrawV2
		ld bc,64+6+5
Player_StarArray_RedrawV2:


		call StarArray_InitColors
	else
		call StarArray_InitColorsOne
	endif

endif


	;configure the loop for the player star array
	ld hl,null
	ld (CurrentStarArrayCollisionsB2_Plus2-2),hl
	ld (CurrentStarArrayCollisions2B2_Plus2-2),hl

	
	ld hl,PlayerStarArrayPointer;(StarArrayMemloc_Player)
	ld b,PlayerStarArraySize;36 StarArraySize_Player_Plus1
	;add l
	;ld b,a

;	jr z,Starloop2_StartA

ifdef buildMSX_V9K
	ld a,(Timer_TicksOccured)
	ld de,&2FCB	:StarSlowdownC_Plus2		;SRA		A
	and %00000001	:SlowdownFreqC_Plus1
	jp z,Starloop2_StartA
endif


	jp Starloop2_Start


if buildCPCv+buildENTv
	StarArray_InitColorsOne:
		ld d,a
		ld e,a
endif
StarArray_InitColors:
	ifdef buildMSX_V9K
		ld (VDP_Star_SX),bc
		ld (VDP_Star_NX),hl
		ld (VDP_Star_NY),hl
	endif


	ifdef buildMSX
		ld a,e
StarArray_InitColorsOne:
		ld (Stars_Color1a_Plus1-1),a
	endif 
if buildCPCv+buildENTv
		ld a,e
		ld (Stars_Color1a),a
		ld a,d
		ld (Stars_Color2a),a
	endif
ret


StarArray_Redraw:

	ld a,(Timer_TicksOccured)
	or a
	ret z	; see if game is paused (TicksOccurred = 0 )
;	ld de,&3807
push af
ifdef BuildZXS

	ld hl, bigstar
	ld (StarSizeSelfMod_Plus2-2),hl


endif

;	ld de,&2FCB
;	and %00000010
;	jp z,FlipperA
;	ld de,%0011000000000110
;	ld de,&0000
;	FlipperA
;	ld (StarSlowdownB_Plus2-2),de
;	ld (StarSlowdownA_Plus2-2),de
;	ld a,d
;	ld (StarFlipperB_Plus1-1),a
;	ld a,e
;	ld (StarFlipperA_Plus1-1),a

 


	; Redraw the enemy star array
	ld B,StarArraySize; 255 StarArraySize_Enemy_Plus1
	;ld B,a ;StarLastGood_Plus1
if buildCPCv+buildENTv
	ld de,&CC33 :StarArrayColors_Plus2
	call StarArray_InitColors
endif
ifdef buildMSX

	ifdef buildMSX_V9K

		ld hl,6
		ld bc,64+0			:StarArray_Xpos_Plus2
	endif

	ld de,&4444 :StarArrayColors_Plus2
	call StarArray_InitColors
endif


	;ld hl,&1221
	;ld de,&4884 






;;;;;;;;;;;;;;;;;;;;; Player 1 handler



	;configure the loop for the enemy star array
	ld hl,Player_Hit_Injure_1
;	ld iy,Player_Array
;	ld a,(iy+4)	;invincibility
	ld a,(P1_P07)	;invincibility
	or a
	jp z,StarArray_PlayerVunrable

	; player invincible
	ld hl,null
StarArray_PlayerVunrable:
	; load player 1 location - do it in advance to save time during the loop

;	ld a,(iy+1)
	ld a,(P1_P01)	
	sub 2
	ld (Player1LocX_Plus1-1),a
	add 4
	ld (Player1LocXB_Plus1-1),a
	ld a,(P1_P00)	
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
	ld a,(P2_P07)	
	or a
	jp z,StarArray_PlayerVunrable2

	; player invincible
	ld hl,null
StarArray_PlayerVunrable2:
	; load player 2 location - do it in advance to save time during the loop
	ld a,(P2_P01)	
;	ld a,(iy+1)
	dec a
	dec a
	ld (Player2LocX_Plus1-1),a
	add 4
	ld (Player2LocXB_Plus1-1),a
	ld a,(P2_P00)	
;	ld a,(iy+0)
	dec a
	dec a
	ld (Player2LocY_Plus1-1),a
	add 4
	ld (Player2LocYB_Plus1-1),a


	ld (CurrentStarArrayCollisions2B2_Plus2-2),hl


	ld hl,StarArrayPointer;&0000 StarArrayMemloc_Enemy_Plus2

ifdef buildMSX_V9K
	ld a,8
	ld (StarVerticalMove_Plus1-1),a
endif


	pop af ;get back time
	ld de,&2FCB	:StarSlowdown_Plus2		;SRA		A
	and %00000010	:SlowdownFreq_Plus1
	jr z,Starloop2_Start2


Starloop2_Start:
	ld de,&00C6	:PlayerFireSpeed_Plus2
Starloop2_StartA:

ifdef buildMSX_V9K
	ld a,8
Starloop2_Startb:
	ld (StarVerticalMove_Plus1-1),a

endif


Starloop2_Start2:

ifdef buildMSX_V9K
VDP_Star_BusyCheck:
	in a,(Vdp9k_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	bit 0,a
	jr nz,VDP_Star_BusyCheck
	ld a,45
	out (Vdp9k_RegSel),a
	ld a,%00011100		;logical op
	out (Vdp9k_RegData),a

endif



	ld (StarSlowdownB_Plus2-2),de
	ld (StarSlowdownA_Plus2-2),de



	;Reset the star array to allow more stars to be added
	xor a 
	ld (StarArrayFullMarker_Plus1-1),a
Starloop2:

	ld a,(hl)	; Y
	or a
	jr NZ,StarArray_FoundOne	;Y=0 means a dead object in the array
StarArray_Turbo:
	inc l
	djnz starloop2
	ret
DoMovesStars_Kill:
	pop hl
	ld (hl),0
	pop bc
	jp StarArray_Turbo

StarArray_FoundOne:
push bc
	ld c,a
	;push bc
	push hl

		;ld de,&6969 CurrentStarArraySize_Plus2
		;add hl,de
		inc h
		ld b,(hl) ; X
		inc h
		;add hl,de

		ld d,(hl) ; M
	
		;call DoMovesStars	; Slightly quicker than domoves  - also remember firsy bit in stars notes player!
	ld a,D
	and %00111000		:StarFlipperB_Plus1
	rrca
	rrca
	;rrca

	sub 8 			:StarVerticalMove_Plus1 ;Used for Particle array
	;sub 4
	bit 6,d
	jp z,DoMovesStars_NoMult2
	 rlca
	DoMovesStars_NoMult2:
	sra a			:StarSlowdownA_Plus2
	add C

;	jp PE,DoMoves_Kill	;overflow
ifdef CPC320
	cp 199+24		;we are at the bottom of the screen
else
	ifdef buildZXS
	cp 190+24		;we are at the bottom of the screen
	else
	cp 191+24		;we are at the bottom of the screen
	endif
endif
	jR NC,DoMovesStars_Kill	;over the page
ifdef CPC320
	cp 24
else
	ifdef buildZXS
		cp 33
	else
		ifdef buildMSX_V9K	
			cp 34
		else
			cp 32
		endif
	endif
endif
	jR C,DoMovesStars_Kill


;	cp 0			;we are at the bottom of the screen
;	jr C,DoMoves_Kill	;over the page
	ld c,a


	ld a,D
	and %00000111		:StarFlipperA_Plus1
	sub 4			
	bit 6,d
	jp z,DoMovesStars_NoMult
		 rlca
	DoMovesStars_NoMult:
	sra a			:StarSlowdownB_Plus2
	add b
ifdef CPC320
	cp 160+24		;we are at the bottom of the screen
else
	ifdef buildMSX_V9K	
		cp 168-3
	else
		ifdef BuildZXS
		cp 168-2
		else
			cp 168
		endif
	endif
endif
	JR NC,DoMovesStars_Kill	;over the page
ifdef CPC320
	cp 24
else
	ifdef buildMSX_V9K	
	cp 40
	else
	cp 41
	endif
endif
	jr C,DoMovesStars_Kill


	ld b,a

PlayerCollisions:

;		ld a,B
		cp 0:Player1LocX_Plus1
		jr c,StarLoopP1Skip
		cp 0:Player1LocXB_Plus1
		jr nc,StarLoopP1Skip

		ld a,c
		cp 0:Player1LocY_Plus1
		jr c,StarLoopP1Skip
		cp 0:Player1LocYB_Plus1
		;jr nc,StarLoopP1Skip

;		push hl
;			ld hl,Player_Array
;			ld (PlayerHitMempointer_Plus2-2),hl
;		pop hl
		call C,Player_Hit_Injure_1 :CurrentStarArrayCollisionsB2_Plus2
		
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
;		jr nc,StarLoopP2Skip


;StarLoopP2Hit
;		push hl
;			ld hl,Player_Array2
;			ld (PlayerHitMempointer_Plus2-2),hl
;		pop hl
		call C,Player_Hit_Injure_2 :CurrentStarArrayCollisions2B2_Plus2
		
StarLoopP2Skip:
StarCollisionsDone:
		;ld (hl),d ;m - this never changes!
		;ld de,-255 CurrentStarArraySizeNegative_Plus2
		;add hl,de 
		dec h
		ld (hl),b ;X
		;add hl,de 
StarCollisionsStardead:
		dec h
		ld (hl),c ;Y

		;add hl,de



			ld a,c	
ifdef CPC320

			sub 24	
else
			ifdef buildZXS
				sub 33	;4 px bullets
			else
				ifdef buildMSX_V9K
					sub 34 ;6 px bullets
				else		
					ifdef BuildZXS
						sub 34 ;6 px bullets
					else
						sub 32
					endif
				endif
			endif
endif
ifdef BuildMSX

	ifndef buildMSX_V9K
		srl a
		or 0 :StardrawBuffer_Plus1
		ld h,A
	else
		ld l,A
	endif
	
else
			ld l,A
endif

			ld a,b
ifdef CPC320
			sub 24
else

		ifdef buildMSX_V9K
			sub 41
		else
			ifdef BuildZXS
				sub 41;6 pixel ver
			else
				sub 40
			endif
		endif
endif





if buildCPCv+buildENTv
	read "..\SrcCPC\Akuyou_CPC_StarDraw.asm"
endif
ifdef buildZXS
	read "..\srcZX\Akuyou_Spectrum_StarDraw.asm"
endif
ifdef buildMSX
	read "..\srcMSX\Akuyou_MSX_StarDraw.asm"
endif




StarArray_Next:
	pop hl
	pop bc
	jp StarArray_Turbo

;jp StarCollisionsDone


ifdef buildMSX
ifndef buildMSX_V9K
	VDP_Star:	
	VDP_Star_DX:	defw &0000 ;DX 36,37
	VDP_Star_DY:	defw &0000 ;DY 38,39
	VDP_Star_NX:	defw &0002 ;NX 40,41
	VDP_Star_NY:	defw &0002 ;NY 42,43
	VDP_Star_Byte:defb   %01000100   ;Color 44
		defb 0     ;Move 45
		defb %11000000 ;Command 46	
else
	VDP_Star:	
	VDP_Star_SX:	defw &0000 ;SY 32,33
	VDP_Star_SY:	defw &0000+Akuyou_PlusSpritesPos_Y ;SY 34,35
	VDP_Star_DX:	defw &0000 ;DX 36,37
	VDP_Star_DY:	defw &0000 ;DY 38,39
	VDP_Star_NX:	defw &0006 ;NX 40,41
	VDP_Star_NY:	defw &0006 ;NY 42,43
	VDP_Star_Byte:defb   %01000100   ;Color 44
		defb 0     ;Move 45
		defb %10011000  ;Command 46	
Stars_Color1a_Plus1: defb 0
endif
endif