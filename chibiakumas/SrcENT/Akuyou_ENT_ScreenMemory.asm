



;***************************************************************************************************

; 					Get Mem Pos

;***************************************************************************************************

;Generic Get next line routine - note most routines have their own to save a call
GetNxtLin:
	ld a,l
	add a,&50
	ld l,a
	
	ret nc
	inc h
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
	inc l
	ld h,(hl)
	ld l,a	; hl now is the memory loc of the line
	
	ld d,&C0 :ScreenBuffer_ActiveScreenDirect_Plus1
	ld e,b

	add hl,de  	; hl = memory line, bc = X pos = hl is now the location on screen
	
	ret ;return memory location in hl




ifndef MinimizeCore


get_scr_addr_table:
ld hl,scr_addr_table
ret

align 2
scr_addr_table:
	defw &0000,	&0050,	&00A0,	&00F0,	&0140,	&0190,	&01E0,	&0230
	defw &0280,	&02D0,	&0320,	&0370,	&03C0,	&0410,	&0460,	&04B0
	defw &0500,	&0550,	&05A0,	&05F0,	&0640,	&0690,	&06E0,	&0730
	defw &0780,	&07D0,	&0820,	&0870,	&08C0,	&0910,	&0960,	&09B0
	defw &0A00,	&0A50,	&0AA0,	&0AF0,	&0B40,	&0B90,	&0BE0,	&0C30
	defw &0C80,	&0CD0,	&0D20,	&0D70,	&0DC0,	&0E10,	&0E60,	&0EB0
	defw &0F00,	&0F50,	&0FA0,	&0FF0,	&1040,	&1090,	&10E0,	&1130
	defw &1180,	&11D0,	&1220,	&1270,	&12C0,	&1310,	&1360,	&13B0
	defw &1400,	&1450,	&14A0,	&14F0,	&1540,	&1590,	&15E0,	&1630
	defw &1680,	&16D0,	&1720,	&1770,	&17C0,	&1810,	&1860,	&18B0
	defw &1900,	&1950,	&19A0,	&19F0,	&1A40,	&1A90,	&1AE0,	&1B30
	defw &1B80,	&1BD0,	&1C20,	&1C70,	&1CC0,	&1D10,	&1D60,	&1DB0
	defw &1E00,	&1E50,	&1EA0,	&1EF0,	&1F40,	&1F90,	&1FE0,	&2030
	defw &2080,	&20D0,	&2120,	&2170,	&21C0,	&2210,	&2260,	&22B0
	defw &2300,	&2350,	&23A0,	&23F0,	&2440,	&2490,	&24E0,	&2530
	defw &2580,	&25D0,	&2620,	&2670,	&26C0,	&2710,	&2760,	&27B0
	defw &2800,	&2850,	&28A0,	&28F0,	&2940,	&2990,	&29E0,	&2A30
	defw &2A80,	&2AD0,	&2B20,	&2B70,	&2BC0,	&2C10,	&2C60,	&2CB0
	defw &2D00,	&2D50,	&2DA0,	&2DF0,	&2E40,	&2E90,	&2EE0,	&2F30
	defw &2F80,	&2FD0,	&3020,	&3070,	&30C0,	&3110,	&3160,	&31B0
	defw &3200,	&3250,	&32A0,	&32F0,	&3340,	&3390,	&33E0,	&3430
	defw &3480,	&34D0,	&3520,	&3570,	&35C0,	&3610,	&3660,	&36B0
	defw &3700,	&3750,	&37A0,	&37F0,	&3840,	&3890,	&38E0,	&3930
	defw &3980,	&39D0,	&3A20,	&3A70,	&3AC0,	&3B10,	&3B60,	&3BB0
	defw &3C00,	&3C50,	&3CA0,	&3CF0,	&3D40,	&3D90,	&3DE0,	&3E30
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

	call BankSwitch_C0_SetCurrentToC0
	ld a,&C0
ScreenBuffer_Alt:
	ld (ScreenBuffer_ActiveScreen),a
	call SetActiveScreenJumps

	push af
		call SetScreenMemPos
	pop af
	ld b,a
	jr ScreenBuffer_SwapDone
SetScreenMemPos: ;basic version of call mc_screen_offset
	push bc
	push hl

		ld c,a
		ld b,8
		ld hl,&FF00+5
FlipAgain:
		ld a,(hl)
		and %00111111
		xor c
		and %01111111
		ld (hl),a

		ld a,16
		add l
		ld l,a
		djnz FlipAgain
		ld a,c
	pop hl
	pop bc


	ret



ScreenBuffer_Init:
ifdef BuildENT
	ld a,&FC
	out (&B2),a

	ld a,&FD
	out (&B3),a

;	ld a,(BankDefault2)
;	ld (&B2),a

;	ld a,(BankDefault3)
;	ld (&B3),a
endif

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



;We have Code which needs to be altered depending on our screen location, we do it all here
;to save time
SetActiveScreenJumps:	
	ld (ScreenBuffer_ActiveScreenDirect_Plus1-1),a
	ld (ScreenBuffer_ActiveScreenDirectB_Plus1-1),a
	ld (ScreenBuffer_ActiveScreenDirectC_Plus1-1),a

	cp &c0
	jr nz,Player_StarArray_Alt;Player_StarArray_Default

	;setup our linejumps
Player_StarArray_Default:

	ld bc,&C07C ; ret nz
	ld hl,&C27C ;jp nz

	jr Player_StarArray_Prep2
Player_StarArray_Alt:

if ScreenBuffer2Pos=&40 
	ld bc,&C87C ;ret z
	ld hl,&CA7C ;jp z  
else 
	ld bc,&C874 ;ret z
	ld hl,&CA74 ;jp z  
endif

Player_StarArray_Prep2:

;	ld (GetNextLineScreenLoopCheck_Minus1+1),bc
;	ld (BackgroundScreenLoopCheck_Minus1+1),hl

;	ld (TurboScreenLoopCheck_Minus1+1),hl
;	ld (GetNextLineBasicSpriteCheck_Minus1+1),hl

;	dec l
;	dec l
;	ld (PsetScreenLoopCheck_Minus1+1),hl
;	inc l
;	inc l

	ei	

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


