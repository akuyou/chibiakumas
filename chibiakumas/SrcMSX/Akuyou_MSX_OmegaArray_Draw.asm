jp OmegaV9990 :OMegaMSXJump_Plus2
OmegaV9990:
;GetMemPos:
		; Input  BC= XY (x=bytes - so 80 across)
		; output HL= screen mem pos
;			ld h,0
			ld a,c
		
ifdef CPC320
			sub 24	
			cp 199			;we are at the bottom of the screen
else
			sub 34
			cp 191-4			;we are at the bottom of the screen
endif

			jp NC,DoMoves_Kill	;over the page
			ld (VDP_Star_DY),a

			srl a
;
;			ld h,A

;	;		pop hl			
			ld a,b	;get the X col
ifdef CPC320
			sub 24
			cp 160		;we are at the bottom of the screen
else
			sub 41
			cp 128-3			;we are at the bottom of the screen
endif
			jp NC,DoMoves_Kill	;over the page

Vdp9k_RegData equ &63	;Register data port
Vdp9k_RegSel equ &64	;Register select port (write only)


	rlca
	ld (VDP_Star_DX),a
	ld hl,VDP_Star

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
;	ld a,45
;	out (Vdp9k_RegSel),a
;	ld a,%00011100		;logical op
;	out (c),a

	ld a,52
	out (Vdp9k_RegSel),a
	     ;CCCC----
	ld a,%01000000;4	LMMM	Rectangle area data is transferred from VRAM to VRAM. 
	out (c),a




;	call Null LMMMCall_plus2		

		jp StarArray_Next

	VDP_Star:	
	VDP_Star_SX:	defw &0000 ;SY 32,33
	VDP_Star_SY:	defw &0000 ;SY 34,35
	VDP_Star_DX:	defw &0000 ;DX 36,37
	VDP_Star_DY:	defw &0000 ;DY 38,39
	VDP_Star_NX:	defw &0006 ;NX 40,41
	VDP_Star_NY:	defw &0006 ;NY 42,43
	VDP_Star_Byte:defb   %01000100   ;Color 44
		defb 0     ;Move 45
		defb %10011000  ;Command 46	


OmegaMSX2:

VdpOut_Control equ &99
VdpIn_Data equ &98


	;ld a,%00000011
;	and b
;	ex af,af'
			;	call GetMemPos		

;GetMemPos:
		; Input  BC= XY (x=bytes - so 80 across)
		; output HL= screen mem pos
;			ld h,0
			ld a,c
		
ifdef CPC320
			sub 24	
			cp 199			;we are at the bottom of the screen
else
			sub 32
			cp 191			;we are at the bottom of the screen
endif

			jr NC,DoMoves_Kill	;over the page

			srl a
			or 0 :GetMemPos_ScreenOffset_Plus1
			ld h,A

;			ld l,a
	
;			add hl,hl 		; table is two bytes so double hl

;			ld de,&6969 scr_addr_tablePos_Plus2	; get table
;			add hl,de		;add line num
;			ld sp,hl
;			pop de
;	;		pop hl			
			ld a,b	;get the X col
ifdef CPC320
			sub 24
			cp 160			;we are at the bottom of the screen
else
			sub 40
			cp 128			;we are at the bottom of the screen
endif
			jr NC,DoMoves_Kill	;over the page
              di
  	    ld l,a
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



		jp StarArray_Next