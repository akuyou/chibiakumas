;buildMSX_V9K

ifndef buildMSX_V9K

              di
ld l,a
;ld a,l
;ld l,h
;ld h,a
	    xor a
;(ScreenBufferMSX_YY)

	      rlc     h
              rla
              rlc     h
              rla
              srl     h
              srl     h

	      ld b,a
              out     (VdpOut_Control),a       ;set bits 15-17
              ld      a,14+128
              out     (VdpOut_Control),a
              ld      a,l           ;set bits 0-7
              out     (VdpOut_Control),a
              ld      a,h           ;set bits 8-14
              or      64           ; 64= write access 0=read

              out     (VdpOut_Control),a 

	      ld a,%01000100	:Stars_Color1a_Plus1
	      out (VdpIn_Data),a
	      ex af,af'
	    
	      ld a,b
              out     (VdpOut_Control),a       ;set bits 15-1

              ld      a,14+128
              out     (VdpOut_Control),a
              ld      a,l           ;set bits 0-7
	      or %10000000	
              out     (VdpOut_Control),a
              ld      a,h           ;set bits 8-14
              or      64           ; 64= write access 0=read

              out     (VdpOut_Control),a 

	      ex af,af'
	      out (VdpIn_Data),a

              ei

else
	rlca
	ld (VDP_Star_DX),a
	ld a,l
	ld (VDP_Star_DY),a
	ld hl,VDP_Star

;call VDP_LMMM_BusyCheck


	ld a,32			;Auto Inc from 36
	out (Vdp9k_RegSel),a
	ld c,Vdp9k_RegData

	defb &ED,&A3,&ED,&A3
	defb &ED,&A3,&ED,&A3

	defb &ED,&A3,&ED,&A3
	defb &ED,&A3,&ED,&A3

	defb &ED,&A3,&ED,&A3
	defb &ED,&A3,&ED,&A3

	;set default fill commands

	ld a,52
	out (Vdp9k_RegSel),a
	     ;CCCC----
	ld a,%01000000;4	LMMM	Rectangle area data is transferred from VRAM to VRAM. 
	out (c),a









;else
;VDP_HMMVStar_BusyCheck:
;	in a,(VdpIn_Status)	;S#2  [TR ] [VR ] [HR ] [BD ] [ 1 ] [ 1 ] [EO ] [CE ] - Status register 2
;	bit 0,a
;	jr nz,VDP_HMMVStar_BusyCheck
;	ld a,36				;AutoInc From 36
;	out (VdpOut_Control),a		
;	ld a,128+17			;R#17  [AII] [ 0 ] [R5 ] [R4 ] [R3 ] [R2 ] [R1 ] [R0 ] 		Indirect Register 128=no inc
;	out (VdpOut_Control),a
;
;	ld c,VdpOut_Indirect
;	defb &ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3,&ED,&A3

endif
