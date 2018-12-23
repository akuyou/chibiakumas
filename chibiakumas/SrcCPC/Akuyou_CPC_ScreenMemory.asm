



;***************************************************************************************************

; 					Get Mem Pos

;***************************************************************************************************

;Generic Get next line routine - note most routines have their own to save a call
GetNxtLin:
	;ld de,&800

;	jp GetNxtLinMain GetNxtLinJump_Plus2
	;ld a,(ScreenBuffer_ActiveScreen)
	;cp &c0
	;jr NZ,GetNxtLinAlt
	ld a,h
	add a,&08
	ld h,a

GetNextLineScreenLoopCheck_Minus1:
	bit 7,h
	ret nz

	ld de,&c050
	add hl,de
	ret



; This is the LARGE version of GetMemPos - it needs a 400 byte lookup table


GetMemPosQuickA:	; kept for compatibility with the minimal one
GetMemPos:		; This version needs a 400 byte lookup table, but is faster
;	; Input  BC= XY (x=bytes - so 80 across)
;	; output HL= screen mem pos
;	; de is wiped

	ld h,0
	ld l,C
	add hl,hl 		; table is two bytes so double hl

	ld de,scr_addr_table	; get table
	add hl,de		;add line num

	ld a,(hl)		; read the two bytes in		
	inc l;inc hl
	ld h,(hl)
	ld l,a	; hl now is the memory loc of the line
	
;	ld a,b	;get the X col
	ld d,&C0 :ScreenBuffer_ActiveScreenDirect_Plus1
	ld e,b

	add hl,de  	; hl = memory line, bc = X pos = hl is now the location on screen
	
	ret ;return memory location in hl




ifndef MinimizeCore

list

get_scr_addr_table:
ld hl,scr_addr_table
ret

align 2
scr_addr_table:
defb &00,&00,&00,&08,&00,&10,&00,&18,&00,&20,&00,&28,&00,&30,&00,&38;1
defb &50,&00,&50,&08,&50,&10,&50,&18,&50,&20,&50,&28,&50,&30,&50,&38;2
defb &A0,&00,&A0,&08,&A0,&10,&A0,&18,&A0,&20,&A0,&28,&A0,&30,&A0,&38;3
defb &F0,&00,&F0,&08,&F0,&10,&F0,&18,&F0,&20,&F0,&28,&F0,&30,&F0,&38;4
defb &40,&01,&40,&09,&40,&11,&40,&19,&40,&21,&40,&29,&40,&31,&40,&39;5
defb &90,&01,&90,&09,&90,&11,&90,&19,&90,&21,&90,&29,&90,&31,&90,&39;6
defb &E0,&01,&E0,&09,&E0,&11,&E0,&19,&E0,&21,&E0,&29,&E0,&31,&E0,&39;7
defb &30,&02,&30,&0A,&30,&12,&30,&1A,&30,&22,&30,&2A,&30,&32,&30,&3A;8
defb &80,&02,&80,&0A,&80,&12,&80,&1A,&80,&22,&80,&2A,&80,&32,&80,&3A;9
defb &D0,&02,&D0,&0A,&D0,&12,&D0,&1A,&D0,&22,&D0,&2A,&D0,&32,&D0,&3A;10
defb &20,&03,&20,&0B,&20,&13,&20,&1B,&20,&23,&20,&2B,&20,&33,&20,&3B;11
defb &70,&03,&70,&0B,&70,&13,&70,&1B,&70,&23,&70,&2B,&70,&33,&70,&3B;12
defb &C0,&03,&C0,&0B,&C0,&13,&C0,&1B,&C0,&23,&C0,&2B,&C0,&33,&C0,&3B;13
defb &10,&04,&10,&0C,&10,&14,&10,&1C,&10,&24,&10,&2C,&10,&34,&10,&3C;14
defb &60,&04,&60,&0C,&60,&14,&60,&1C,&60,&24,&60,&2C,&60,&34,&60,&3C;15
defb &B0,&04,&B0,&0C,&B0,&14,&B0,&1C,&B0,&24,&B0,&2C,&B0,&34,&B0,&3C;16
defb &00,&05,&00,&0D,&00,&15,&00,&1D,&00,&25,&00,&2D,&00,&35,&00,&3D
defb &50,&05,&50,&0D,&50,&15,&50,&1D,&50,&25,&50,&2D,&50,&35,&50,&3D
defb &A0,&05,&A0,&0D,&A0,&15,&A0,&1D,&A0,&25,&A0,&2D,&A0,&35,&A0,&3D
defb &F0,&05,&F0,&0D,&F0,&15,&F0,&1D,&F0,&25,&F0,&2D,&F0,&35,&F0,&3D;20
defb &40,&06,&40,&0E,&40,&16,&40,&1E,&40,&26,&40,&2E,&40,&36,&40,&3E
defb &90,&06,&90,&0E,&90,&16,&90,&1E,&90,&26,&90,&2E,&90,&36,&90,&3E
defb &E0,&06,&E0,&0E,&E0,&16,&E0,&1E,&E0,&26,&E0,&2E,&E0,&36,&E0,&3E
defb &30,&07,&30,&0F,&30,&17,&30,&1F,&30,&27,&30,&2F,&30,&37,&30,&3F
defb &80,&07,&80,&0F,&80,&17,&80,&1F,&80,&27,&80,&2F,&80,&37,&80,&3F
endif
;,&21




; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			Screen Buffer

;***************************************************************************************************
;--------------------------------------------------------------------------------------------


ScreenBuffer_GetActiveScreen:
	ld a,(ScreenBuffer_ActiveScreen)
	ret


ScreenBuffer_Reset:	;set everything back up to defaults (no screenbuffer screen at C000
;	ld a,&C0
;	call BankSwitch_C0_SetCurrent
	call BankSwitch_C0_SetCurrentToC0
;	ld a,&c0
ScreenBuffer_Alt:
	ld (ScreenBuffer_ActiveScreen),a
	call SetActiveScreenJumps

	push af
		call SetScreenMemPos
	pop af
	ld b,a
	jr ScreenBuffer_SwapDone
SetScreenMemPos: ;basic version of call mc_screen_offset

		rrca    
		rrca    
		and     &30
		 ld      bc,&bc0c			
		 out     (c),c			; select CRTC register 12
		 inc     b				; BC = bd0c
	 	 out     (c),a			; set CRTC register 12 data
		 ;dec     b				; BC = bc0c
		 ;inc     c				; BC = bc0d
		 ;out     (c),c			; select CRTC register 13
		 ;inc     b				; BC = bd0d
		 ;xor a
		 ;out     (c),a			; set CRTC register 13 data
	ret



ScreenBuffer_Init:

	ld a,ScreenBuffer2Pos
	ld (ScreenBuffer_VisibleScreen),a
	ld a,&C0
	ld (ScreenBuffer_ActiveScreen),a
ScreenBuffer_Flip:
	call ScreenBuffer_SwapVariables
ScreenBuffer_Apply:
	ld a,(ScreenBuffer_VisibleScreen)
	call SetScreenMemPos
	ld a,(ScreenBuffer_ActiveScreen)
	;jp SetActiveScreenJumps


;We have Code which needs to be altered depending on our screen location, we do it all here
;to save time
SetActiveScreenJumps:	;ld a,(ScreenBuffer_ActiveScreen)
	ld (ScreenBuffer_ActiveScreenDirect_Plus1-1),a
	ld (ScreenBuffer_ActiveScreenDirectB_Plus1-1),a
	ld (ScreenBuffer_ActiveScreenDirectC_Plus1-1),a

	cp &c0
	jr nz,Player_StarArray_Alt;Player_StarArray_Default
	;jr Player_StarArray_Alt
	;setup our linejumps
Player_StarArray_Default:

	ld bc,&C07C ; ret nz
	ld hl,&C27C ;jp nz
	;ld bc,GetNxtLinMain
	jr Player_StarArray_Prep2
Player_StarArray_Alt:

if ScreenBuffer2Pos=&40 
	ld bc,&C87C ;ret z
	ld hl,&CA7C ;jp z  
else 
	ld bc,&C874 ;ret z
	ld hl,&CA74 ;jp z  
endif
	;ld bc,GetNxtLinAlt
Player_StarArray_Prep2:
	;ld (GetNxtLinJump_Plus2-2),bc
	ld (GetNextLineScreenLoopCheck_Minus1+1),bc
	ld (BackgroundScreenLoopCheck_Minus1+1),hl

	ld (TurboScreenLoopCheck_Minus1+1),hl
	ld (GetNextLineBasicSpriteCheck_Minus1+1),hl

	dec l
	dec l
	ld (PsetScreenLoopCheck_Minus1+1),hl
	inc l
	inc l

	ei	;ScreenJumpsReEnableInterrupts_Plus1


	;We need to leave this function with the RET Z ver in BC , and the JP Z version in hl
	;this is so our level can do it's own tricks!
	ret




ScreenBuffer_SwapVariables:
	ld a,(ScreenBuffer_VisibleScreen)
	ld b,a
	cp &c0
	ld a,ScreenBuffer2Pos
	jr z,ScreenBuffer_SwapDone
	ld a,&c0
ScreenBuffer_SwapDone:

	ld (ScreenBuffer_VisibleScreen),a
	ld a,b
	ld (ScreenBuffer_ActiveScreen),a
	ret


