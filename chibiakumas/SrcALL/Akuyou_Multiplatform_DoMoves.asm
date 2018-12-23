
;See EventStreamDirections for details of how DoMoves works
DoMoves: 

	; B=X C=Y D=Move
	;SDYYYXXX	S=1 means 'special move'
	; all others work in the format D = Doubler (speed up move)
	; YYY Y movement bits
	; XXX X movement bits

	bit 7,d			; See if we are using a SPECIAL move pattern
	jr nz,DoMoves_Spec
;DoMovesStars 			
	ld a,D
	and %00111000
	rrca
	rrca
	;rrca

	sub 8
	;sub 4
	bit 6,d
	jp z,DoMoves_NoMult2
	 rlca
	DoMoves_NoMult2:
ifdef buildMSX_V9K
	nop
	or a			:MovesSlowdownA_Plus2
;	jr nz,DoMovesADCSkipA
;	adc 0			MovesSlowdownADCA_Plus2
;DoMovesADCSkipA
endif
	add C

;	jp PE,DoMoves_Kill	;overflow
	cp 199+24		;we are at the bottom of the screen
	jr NC,DoMoves_Kill	;over the page
;	cp 0			;we are at the bottom of the screen
;	jr C,DoMoves_Kill	;over the page
	ld c,a


	ld a,D
	and %00000111
	sub 4
	bit 6,d
	jp z,DoMoves_NoMult
		 rlca
	DoMoves_NoMult:
ifdef buildMSX_V9K
	nop
	or a			:MovesSlowdownB_Plus2
	jr nz,DoMovesADCSkipB
	adc 0			:MovesSlowdownADCB_Plus2
DoMovesADCSkipB
endif
	add b

	cp 160+24		;we are at the bottom of the screen
	jr NC,DoMoves_Kill	;over the page
;	cp 0			;we are at the bottom of the screen
;	jr C,DoMoves_Kill	;over the page
	ld b,a

	
	ret
DoMoves_Kill:			; Object has gone offscreen
	ld C,0
	;ld B,0
	;ld C,b		 ; shouldn't need these! only Y needs to be Zero to mark object as dead
	;ld D,b
	ret
DoMoves_Background:	; Background sprites move much more slowly, and only in 1 direction
	ld a,d
	and %00001111	
	rla		
ifdef buildMSX_V9K
	nop :BackgroundMoveSpeed_Plus1
endif
	ld e,a
	;----XXXX
	;XXXX tick point
	ld a,(Timer_TicksOccured)
	and e
	ret z
	; time for a left move
	dec b		:DoMovesBGShift_Plus1	;check xpos 
	ld a,b
	cp 160+24+24		;we are offscreen
	jr NC,DoMoves_Kill	;over the page
	ret
DoMoves_Spec:	;Special moves - various kinds
	ld a,(Timer_TicksOccured)
	and %11111111			:SpecialMoveSlowdown_Plus1
	ret z
	ld a,d
	and %11110000	;
	cp %11000000	;1100XXXX ; Background
	jr z,DoMoves_Background	


;	cp %10010000	;1001XXXX ; Wave
;	jr z,DoMoves_WaveSmall
	cp %10100000	;1010XXXX ; Wave
	jr z,DoMoves_Wave				;Wave pattern - pretty naff, but it seemed a good idea at the time


	; Level specifics are overriden by the code in the level
	cp %10110000 	;1011XXXX ; Level Specific 4
	jp z,null 	:LevelSpecificMoveD_Plus2
	cp %11010000 	;1101XXXX ; Level Specific 3
	jp z,null 	:LevelSpecificMoveC_Plus2
	cp %11100000 	;1110XXXX ; Level Specific 2
	jp z,null 	:LevelSpecificMoveB_Plus2
	cp %11110000 	;1111XXXX ; Level Specific 1
	jp z,null 	:LevelSpecificMove_Plus2

	ld a,d		;1000XXXX
	and %11111100	;101111XX
	cp  %10010000				; P2 Used by 'Chu attack' - and also coins!	
	jr z,DoMoves_Seekerp2			; Used by 'Chu attack' - and also coins!
	cp  %10000100
	jr z,DoMoves_Seeker			; Used by 'Chu attack' - and also coins!
	cp  %10001000
	jr z,DoMoves_SeekerAuto			; Pick a live player to target!
	ret
DoMoves_Wave:
	;		    3210
	; wave pattern  1010DSPP	D = Depth bit, S= Speed, PP Position

	ld a,b
	bit 3,d
	jr nz,DoMoves_TwoShifts
	srl a
	srl a
DoMoves_TwoShifts:
	;srl a	; unrem for speedup
	and %00011111
	cp  %00010000
	jr C,DoMoves_WaveContinue
	xor %00011111
DoMoves_WaveContinue:
	bit 2,d
	jr nz,DoMoves_WaveSlowSpeed
	sll a
	
DoMoves_WaveSlowSpeed
	sll a
	sll a   ; rem to reduce wave depth

	ld C,a
	ld a,d
	and %0000011
DoMoves_WaveEnd
	rrca
	rrca
	rrca		; equivalent to 5 left shifts
	or %00011100

	add C
	ld C,a

	dec B
	ld a,b
	cp 24			;we are at the bottom of the screen
	jr C,DoMoves_Kill	;over the page
	ret

DoMoves_SeekerAuto:
		push bc
		

			ld c,%10010000	;p2

			ld a,(P1_P09)	;See how many lives are left
			or a
			jr z,SeakChoosePlayerDone
			;if player 1 is dead, always home on player 2

			ld a,(P2_P09)	;See how many lives are left
			or a
			jr z,SeakChoosePlayerP1
			;if player 2 is dead, always home on player 1

			ld a,0 :SeakChoosePlayer_Plus1
			or a
			cpl 
			ld (SeakChoosePlayer_Plus1-1),a

			jr nz,SeakChoosePlayerDone

SeakChoosePlayerP1:
			ld c,%10000100; p1
SeakChoosePlayerDone:

			ld a,d
			and %00000011
			or c
			ld d,a
		pop bc

		jp DoMoves_Spec

DoMoves_Seekerp2:		;Home in on player 2
	push iy
		ld iy,Player_Array2
	jr DoMoves_SeekerContinue
DoMoves_Seeker:			;Home in on player 1

	push iy
		ld iy,Player_Array


DoMoves_SeekerContinue:
	push de
	ld a,d
	and %00000011	; Speed
	sll a
	inc a
	ld d,a
	ld a,r			; Crude randomizer, as we move so fast the object may never hit the player otherwise
	bit 0,a
	jr z,DoMoves_SeekerS
	inc d
DoMoves_SeekerS:


		; B=X C=Y D=Move speed




		ld a,(iy)	;Y
		sub 8
		cp C
		jr NC,DoMoves_Seeker_Ylower
		ld a,C
		sub d
		jr DoMoves_Seeker_CheckX
	DoMoves_Seeker_Ylower:
		ld a,C
		add d
	DoMoves_Seeker_CheckX:
		ld C,a
		ld a,(iy+1)	;X
		sub 3
		cp B
		jr NC,DoMoves_Seeker_Xlower
		ld a,B
		sub d
		jr DoMoves_Seeker_Done
	DoMoves_Seeker_Xlower:
		ld a,B
		add d
	DoMoves_Seeker_Done:
		ld B,a

	pop de
	pop iy

	ret