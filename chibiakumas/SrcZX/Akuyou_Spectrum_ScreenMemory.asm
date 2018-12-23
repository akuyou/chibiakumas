

   ;0 1 0 Y7 Y6 Y2	Y1 Y0	 Y5 Y4 Y3 X4 X3 X2 X1 X0
GetNxtLin:
	inc h
	ld a,h
	and  %00000111;7
	ret nz
	ld a,l
	add a,%00100000;32
	ld l,a
	ret c
	ld a,h
	sub %00001000;8
	ld h,a

ret
ifdef buildZXS
	ShowCompiledSprite:
			ld de,CompiledSprite_Pos
			ld e,a
			ld a,CompiledSprite_Membank
			ld hl,Rle_FromPointers
			call Akuyou_Bankswapper_CallHL
	ld iy,&5C3A	;apparently good practice?
	ret
endif

GetColMemPos: 

;	; Input  BC= XY (x=bytes - so 40 across)
;	; output HL= screen mem pos
;	; de is wiped


	ld hl,&5800 :GetMemPos_BufferFlipperColpos_Plus1

	ld a,B
	add l
	ld l,a

	ld a,C

	push af
		and %11000000
		rlca
		rlca
		ld d,a
	pop af
	and %00111000
	rlca
	rlca

	ld e,a
;	ex hl,de
		add hl,de
;	ex hl,de
ret





GetMemPos:		; This version needs a 400 byte lookup table, but is faster  
;	; Input  BC= XY (x=bytes - so 40 across)
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

	add B
	ld l,a	; hl now is the memory loc of the line
GetMemPos_BufferFlipper_Minus1:	res 7,H;set 7,H


       RET


;        LD A,B                                 ; Calculate Y2,Y1,Y0
;        AND %00000111                          ; Mask out unwanted bits
;        OR %01000000                           ; Set base address of screen
;        LD H,A                                 ; Store in H
;        LD A,B                                 ; Calculate Y7,Y6
;        RRA                                    ; Shift to position
;        RRA
;        RRA
;        AND %00011000                          ; Mask out unwanted bits
;        OR H                                   ; OR with Y2,Y1,Y0
;;        LD H,A                                 ; Store in H
;        LD A,B                                 ; Calculate Y5,Y4,Y3
;        RLA                                    ; Shift to position
;        RLA
;        AND %11100000                          ;Mask out unwanted bits
;        LD L,A                                 ; Store in L
;        LD A,C                                 ; Calculate X4,X3,X2,X1,X0
;        RRA                                    ; Shift into position
;        RRA
;        RRA
;        AND %00011111                          ; Mask out unwanted bits
;        OR L                                   ; OR with Y5,Y4,Y3
;        LD L,A                                 ; Store in L
;        RET

get_scr_addr_table:
ld hl,scr_addr_table
ret
align 2
scr_addr_table:
dw &4000,&4100,&4200,&4300,&4400,&4500,&4600,&4700
dw &4020,&4120,&4220,&4320,&4420,&4520,&4620,&4720
dw &4040,&4140,&4240,&4340,&4440,&4540,&4640,&4740
dw &4060,&4160,&4260,&4360,&4460,&4560,&4660,&4760
dw &4080,&4180,&4280,&4380,&4480,&4580,&4680,&4780
dw &40A0,&41A0,&42A0,&43A0,&44A0,&45A0,&46A0,&47A0
dw &40C0,&41C0,&42C0,&43C0,&44C0,&45C0,&46C0,&47C0
dw &40E0,&41E0,&42E0,&43E0,&44E0,&45E0,&46E0,&47E0
dw &4800,&4900,&4A00,&4B00,&4C00,&4D00,&4E00,&4F00
dw &4820,&4920,&4A20,&4B20,&4C20,&4D20,&4E20,&4F20
dw &4840,&4940,&4A40,&4B40,&4C40,&4D40,&4E40,&4F40
dw &4860,&4960,&4A60,&4B60,&4C60,&4D60,&4E60,&4F60
dw &4880,&4980,&4A80,&4B80,&4C80,&4D80,&4E80,&4F80
dw &48A0,&49A0,&4AA0,&4BA0,&4CA0,&4DA0,&4EA0,&4FA0
dw &48C0,&49C0,&4AC0,&4BC0,&4CC0,&4DC0,&4EC0,&4FC0
dw &48E0,&49E0,&4AE0,&4BE0,&4CE0,&4DE0,&4EE0,&4FE0
dw &5000,&5100,&5200,&5300,&5400,&5500,&5600,&5700
dw &5020,&5120,&5220,&5320,&5420,&5520,&5620,&5720
dw &5040,&5140,&5240,&5340,&5440,&5540,&5640,&5740
dw &5060,&5160,&5260,&5360,&5460,&5560,&5660,&5760
dw &5080,&5180,&5280,&5380,&5480,&5580,&5680,&5780
dw &50A0,&51A0,&52A0,&53A0,&54A0,&55A0,&56A0,&57A0
dw &50C0,&51C0,&52C0,&53C0,&54C0,&55C0,&56C0,&57C0
dw &50E0,&51E0,&52E0,&53E0,&54E0,&55E0,&56E0,&57E0



;ScreenBufferMSX_Reset
;ScreenBufferMSX_Init

ScreenBuffer_Reset:
	ld a,&80	;This gets flipped later
	jr ScreenBuffer_Initb
ScreenBuffer_Init:	;8036 Init the double buffer
	xor a
ScreenBuffer_Initb:
	ld (ScreeBuffer_ZX_Plus1-1),a
	ld   a,(out7ffdBak)  ;BANKM (23388)
        and  %11110111
;	 or  %00001000
	jr ScreenBuffer_FlipB
ScreenBuffer_Flip:	;8039 Flip the buffer

        ld   a,(out7ffdBak)  ;BANKM (23388)
	;     --IRSMMM
        xor  %00001000
ScreenBuffer_FlipB:	;8039 Flip the buffer
        ld   (out7ffdBak),a  ;BANKM (23388)       
        ld   bc,&7ffd   ;32765
        out  (c),a

	ld b,&80
	ld a,&00	:ScreeBuffer_ZX_Plus1
	xor b
	ld (ScreeBuffer_ZX_Plus1-1),a

;	ld a,(ScreenBuffer_ActiveScreenDirectC_Plus1-1)
;	xor b
;	ld (ScreenBuffer_ActiveScreenDirectC_Plus1-1),a

;	ld a,(ScreenBuffer_ActiveScreenDirectB_Plus1-1)
;	xor b
;	ld (ScreenBuffer_ActiveScreenDirectB_Plus1-1),a
	ld a,(ScreeBuffer_ZX_Plus1-1)
	ld hl,&BC58
	or a
	jr z,ScreenBuffer_ApplyB
	ld hl,&FCD8
ScreenBuffer_ApplyB:
	ld a,l
	;&5800/&D800
	ld (ScreenBuffer_ActiveScreenDirectD_Plus1-1),a
	ld (GetMemPos_BufferFlipperColpos_Plus1-1),a
	and %11100000
	;&4000/&C000
	ld (ScreenBuffer_ActiveScreenDirectE_Plus1-1),a
	ld (ScreenBuffer_ActiveScreen_Plus1-1),a

	and %10000000	;&0000/&8000
	ld (ScreenBuffer_ActiveScreenDirectC_Plus1-1),a
	ld (ScreenBuffer_ActiveScreenDirectB_Plus1-1),a

	ld a,h
	ld (GetMemPos_BufferFlipper_Minus1+1),a





ret


ScreenBuffer_GetActiveScreen:
	ld a,&40	:ScreenBuffer_ActiveScreen_Plus1

ret





CLS:
CLSB:
	ld a,(ScreenBuffer_ActiveScreen_Plus1-1)
	ld h,a
	xor a
	ld l,a
	ld d,h
	ld e,&01
	ld BC,&1800;-1
	ld (hl),a
	ldir
	ld BC,&0300-1
	ld a,%01000111	;white on black
	ld (hl),a
	ldir
ret






ZXSGPU_VectorArray:
	defw ZXSGPU_GetVectorArray		;0
	defw DrawText_ZXTextColor		;1 -Set Textcolor to C

ZXSGPU_GetVectorArray:
	ld hl,ZXSGPU_VectorArray
	ret

ZXSGPU_CommandNum:
	push hl			;
	ld hl,ZXSGPU_VectorArray
jp VectorJump_PushHlFirst
