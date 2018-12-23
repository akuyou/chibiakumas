VdpOut_Indirect equ &9B
VdpIn_Status equ &99

VDP_InterlaceFill_BusyCheck:
	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
	bit 0,a

	jr nz,VDP_InterlaceFill_BusyCheck
	di	
	;Copy an area of Vram from one place to another - with Logical conditions (Transparency)

	;Set the autoinc for more data
	ld a,32				;AutoInc From 36
	out (VdpOut_Control),a		
	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
	out (VdpOut_Control),a



	ld c,VdpOut_Indirect
	;outi x 15
	defb &ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3



;Flood fill a number of following lines

VDP_HMMV_Hyper:

	ld a,(VDP_MyLMMM_DY)
	inc a
	ld b,a
	xor a
	ld c,a

	ld a,(VDP_MyLMMM_DY+1)
	rra
	rr b
	rr c

	      rlc     b
              rla
              rlc     b
              rla
              srl     b
              srl     b
              out     (VdpOut_Control),a       ;set bits 15-17
              ld      a,14+128
              out     (VdpOut_Control),a
              ld      a,c           ;set bits 0-7
              out     (VdpOut_Control),a
              ld      a,b           ;set bits 8-14
              or      64            ; 64= write access 0=read
              out     (VdpOut_Control),a 



	ld c,2
	ld a,&11

VDP_HMMV_HyperAgain:
	ld b,8
VDP_HMMV_Hyperb:
	
	
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	out(VdpIn_Data),a
	djnz,VDP_HMMV_Hyperb	;carry on with the fill job
	dec c
	jp nz,VDP_HMMV_HyperAgain
	ei
	ret









ret
