INT_Init:
	im 1
	ei
	ld hl,INT_Execute

INT_Define:	;Jump to HL on interrupt
	ld a,&C3
	ld (&38),a
	ld (&38+1),hl
ret

INT_Execute:
	push af
	push bc
	push de
	push hl
	push ix
	push iy
	exx
	ex af,af'



		xor a;	ld a,0
ifdef buildMSX_V9K				;we cap the V9990 to 30fps on non turbo-r to keep things stable
		ld (TwoHalts_Plus1-1),a
endif
		out (VdpOut_Control),a
		ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
		out (VdpOut_Control),a
		in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
		ld a,2
		out (VdpOut_Control),a
		ld a,128+15		;R#15  [ 0 ] [ 0 ] [ 0 ] [ 0 ] [S3 ] [S2 ] [S1 ] [S0 ] - Set Stat Reg to read
		out (VdpOut_Control),a

		call PLY_Play

	ex af,af'
	exx

	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	pop af

	ei
ret


