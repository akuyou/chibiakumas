write "..\BldZX\spectest.bin"

Support64k equ 1

Font_RegularSizePos equ &0000;&F000
Font_SmallSizePos equ 	&0000;&F800

TextFirmwareFontAddr equ &3C00 ;&3800
TextScreen_MaxX equ 36 ;40
TextScreen_MinX equ 4	;0
TextScreen_MaxY equ 23	;24
TextScreen_MinY equ 0	;0

SprShow_X equ SprShow_X_Plus1-1
SprShow_Y equ SprShow_Y_Plus1-1
SprShow_BankAddr equ SprShow_BankAddr_Plus2-2   ; 
SprShow_SprNum equ SprShow_SprNum_Plus1-1

SprShow_W equ SprShow_W_Plus1-1

SprShow_Xoff equ SprShow_Xoff_Plus1-1
SprShow_Yoff equ SprShow_Yoff_Plus1-1


SprShow_TempX equ ScreenBuffer_ActiveScreenDirectC_Plus1-2
SprShow_TempY equ SprShow_TempY_Plus2-2
SprShow_TempW equ SprShow_TempW_Plus1-1
SprShow_TempH equ SprShow_TempH_Plus1-1
SprShow_OldX equ SprShow_OldX_Plus1-1




org &8000
SOF:
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			 Text Driver

;***************************************************************************************************
;--------------------------------------------------------------------------------------------

;DrawText_SetPen equ &bb90 ;set pen to A
;DrawText_Locate equ &bb75 ; set location to X=L , Y=H
;DrawText_PrintChar equ &bb5a

;screenwidth  3-35	0-39
;screenheight 0-23	0-24

	di

	ld a,1
	call SpriteBank_Font
	ld hl,&0405;14
	ld bc,txtPressButtonMsg2
	call DrawText_LocateAndPrintStringUnlimited


	ld a,2
	call SpriteBank_Font
	ld hl,&0406;14
	ld bc,txtPressButtonMsg2
	call DrawText_LocateAndPrintStringUnlimited

	ld a,2
	call SpriteBank_Font
	ld hl,&2306;14
	ld bc,txtPressButtonMsg2
	call DrawText_LocateAndPrintStringUnlimited


;	call Monitor
	di 
	halt

align 256

;Monitor_Full equ 1

Monitor:
	di
ifdef Monitor_Full
	exx
	ex af,af'
	push HL
	PUSH DE
	PUSH BC
	Push AF
	exx
	ex af,af'
	push IY
	push IX
endif
	push HL
	PUSH DE
	PUSH BC
	Push AF

	ld (MonitorStackRestore_Plus2-2),sp	
ifdef Monitor_Full
	ld hl,11*2
else
	ld hl,11-6 *2
endif
	add hl,sp
	push hl
	ld (NextMonitorPos_Plus2-2),sp	

	ld sp,Monitor_AltStack+32
	
	call SpriteBank_Font2

	ld hl,&0401 
	ld bc,Monitor_Text 
	ld de,&0000:NextMonitorPos_Plus2

MonitorAgain:


	
	push hl
	push bc
	push de
		call DrawText_LocateAndPrintStringUnlimited
	pop de
	push de
		inc de
		ld a,(de)
		call ShowHex
	pop de
	ld a,(de)
	inc de
	inc de
	push de
		call ShowHex
	pop de

	pop bc
	inc bc
	inc bc

	pop hl
	inc l
ifdef Monitor_Full
	ld a,13
else
	ld a,13-6
endif 
	cp l
	jp nz,MonitorAgain

	ld sp,&0000: MonitorStackRestore_Plus2

	Pop AF
	Pop BC
	pop DE
	pop HL
ifdef Monitor_Full

	pop IX
	pop IY
	exx
	ex af,af'
	Pop AF
	Pop BC
	pop DE
	pop HL
	exx
	ex af,af'
endif 
ret
Monitor_AltStack: Defs 32
Monitor_Text:
	db "S","p"+&80
	db "A","f"+&80
	db "B","c"+&80
	db "D","e"+&80
	db "H","l"+&80
ifdef Monitor_Full

	db "I","x"+&80
	db "I","y"+&80
	db "A","'"+&80
	db "B","'"+&80
	db "D","'"+&80
	db "H","'"+&80
endif
	db "P","c"+&80
align 256



txtPressButtonMsg2:
	db "Hello World",":"+&80







SpriteBank_Font2:			
	ld a,2
SpriteBank_Font:			;Init the spritefont location - Corrupts HL and now BC

;SpriteBank_FontNum ;A= 1 = Chibifont   2 = regularfont
	dec a
	jr z,SpriteBank_FontNumChibi
	ld bc,DrawText_DicharSprite_NextLine-DrawText_DicharSprite_Font_Plus1
	push af
;	ld hl,Font_RegularSizePos			;The font is located at &C000/4000 in bank C1/C3, or &7000 in the Bootstrap block

	xor a
	jr ShowSprite_SetFontBankAddr
SpriteBank_FontNumChibi:
		ld bc,DrawText_DicharSprite_NextLineMini-DrawText_DicharSprite_Font_Plus1
;		ld hl,Font_SmallSizePos			;The font is located at &C000 in bank C1/C3, or &7000 in the Bootstrap block
;ret
	inc a
	push af
	dec a

ShowSprite_SetFontBankAddr:
	ld (DrawText_HalfMove_Plus1-1),a
	ld (DrawText_HalfMoveB_Plus1-1),a
	pop af
	ld (DrawText_CharSpriteMoveSize_Plus1-1),a
	ld a,c
	ld (DrawText_DicharSprite_Font_Plus1-1),a
;ShowSprite_SetBankAddr:
;	ld (SprShow_BankAddr),hl
ret








; These were designed to mimic firmware functions
DrawText_LocateAndPrintStringUnlimited:
	call DrawText_LocateSprite
DrawText_PrintStringUnlimited:
	ld a,(bc)
	cp a,&80
	jr nc,DrawText_PrintLastChar

	push bc
		call DrawText_CharSprite; draw char
	pop bc

	inc bc
	jp DrawText_PrintStringUnlimited


DrawText_PrintString:
	; I Limits the number of characters to be show,
	; used for 'typing' effect during the boss sequences, and intro
	ld a,i		
	dec a
	ret z
	ld i,a
	ld a,(bc)
	cp a,&80
	jr nc,DrawText_PrintLastChar
	Call DrawText_CharSpriteProtectBC
	inc bc
	jp DrawText_PrintString
DrawText_PrintLastChar:
	and %01111111
DrawText_CharSpriteProtectBC:
	push bc
		call DrawText_CharSprite
	pop bc
	ret
	

DrawText_Decimal:
	ld c,0
	ld b,a
	ld a,&C4
	ld (DrawTextForceZeroCall_Plus3-3),a
	ld a,b
	cp 100
	jr c,SkipDigit100

	ld a,&CD
	ld (DrawTextForceZeroCall_Plus3-3),a
	ld a,b
DrawText_DecimalSub100:
	cp 100
	jr c,DrawText_DecimalLessThan100
	inc c
	sub 100
	jr DrawText_DecimalSub100

DrawText_DecimalLessThan100:
	ld b,a
	ld a,c
	or a
;	jr z,SkipDigit100
	call nz,DrawText_CharSprite48
SkipDigit100:
	ld a,b
	ld c,0
DrawText_DecimalSubTen:
	cp 10
	jr c,DrawText_DecimalLessThanTen
	inc c
	sub 10
	jr DrawText_DecimalSubTen
DrawText_DecimalLessThanTen:
	ld b,a
	ld a,c
	or a
	call nz,DrawText_CharSprite48	:DrawTextForceZeroCall_Plus3
SkipDigit10:
	ld a,b
DrawText_CharSprite48:
	add 48
	push bc
		call DrawText_CharSprite
	pop bc
ret
;end of drawtext decimal



DrawText_CarriageReturnSprite:
ld hl,&0000 :DrawText_CarriageReturnSpritePos_Plus2
inc l
DrawText_LocateSprite4CR:
ld (DrawText_CarriageReturnSpritePos_Plus2-2),hl
DrawText_LocateSprite:	; this mimics the way the firmare functions work  (DrawText_Locate)

	ld a,l
	add a
	add a
	add a
	ld (SprShow_Y),a
	ld a,h
;	add a		;for cpc
	sub TextScreen_MinX	; for speccy
	ld (SprShow_X),a

ret
DrawTextSpace:
	ld hl,DrawText_CharSpriteMoveSize_Plus1-1
	ld a,(hl)
	xor 0 	:DrawText_HalfMoveB_Plus1
	ld (hl),a
ret

; equiv of DrawText_PrintChar
DrawText_CharSprite:		; Must have already set the correct bank!
	ld b,2	:DrawText_CharSpriteMoveSize_Plus1
	cp 13
	jr z,DrawText_CarriageReturnSprite

DrawText_CharSpriteDirect:
	sub 33	
	ld (SprShow_SprNum),a
	ld e,a
		ld a,(SprShow_X)
		cp TextScreen_MaxX-TextScreen_MinX*2		;Bail if over screen width
		ret nc
		ld (SprShow_TempX),a		; move the cursor along for next char

		ld d,a
		add b
		ld (SprShow_X),a	

		ld a,(SprShow_Y)
		ld (SprShow_TempY),a
		ld c,a

	ld a,e
	cp 192
	jr NC,DrawTextSpace	; Our font has no space! so dont draw anything below 32 (above 192)

;ifdef Support64k
;JR64K_1 add 0	;faster than nop nop
;
;
;JR64K_From1:
;endif
;	ld a,(BankSwitch_C0_CurrentB_Plus2-2)
;	push af
;		ld a,Font_Membank
;		call BankSwitch_C0_SetCurrent
;		call ShowSpriteDirect 
;	pop af
;	jp BankSwitch_C0_SetCurrent
;ret

;ifdef Support64k
;JR64K_To1
DrawText_CharFirmwareFont:

	ld b,d
	push de
		call GetColMemPos

		ld (hl),%01000111
		call GetMemPos
	pop de
	push hl
		ld hl,33*8+TextFirmwareFontAddr	

		ld d,0

		rl e
		rl d
		rl e
		rl d
		rl e
		rl d
		add hl,de
		ld d,h
		ld e,l
	di
;	exx

;		ld bc,DrawText_CharFirmwareFont_GetCharEnd-DrawText_CharFirmwareFont_GetChar+1
;		ld hl,DrawText_CharFirmwareFont_GetChar
;		ld de,&FFD0
;		ldir
;
;		ld bc,&7f00+%10001101  ;10AIRRMM ... A asic exclusive / RR UpperLower Rom (1= off) / MM screen mode
;
;	exx

;	pop hl
;
;
;	push hl
;	ex hl,de
;	
;		ld de,&F7D0
;		call &FFD0	; Our temp destination for the fontcode
	ld hl,DrawText_CharSpriteMoveSize_Plus1-1
	ld a,(hl)
	ld (MinifontToggle_Plus1-1),a
	xor 0					:DrawText_HalfMove_Plus1
	ld (hl),a


	pop hl




	ld b,9
;	ld de,&F7D0
	jr DrawText_DicharSprite_NextLine2B 
DrawText_DicharSprite_NextLineMini:



	ld a,(de)
	ld c,a
	xor a
	rr c
	rra
	srl c
	rr c
	rra
	srl c
	rr c
	rra
	srl c
	rr c
	rra
	srl c

	ld c,a
	push bc
		ld a,(de)
		ld c,a
		xor a

		srl c
		rr c
		rra

		srl c
		rr c
		rra

		srl c
		rr c
		rra

		srl c
		rr c
		rra
	pop bc
	or c
	ld c,a
	ld a,1	:MinifontToggle_Plus1
	or a
	jr z,MiniFont1
;MiniFont2
	srl c
	srl c
	srl c
	srl c

	ld a,(hl)
	or c
	ld (hl),a
	


	jr DrawText_DicharSprite_NextLine2
MiniFont1:
	ld a,c
	ld (hl),a
	jr DrawText_DicharSprite_NextLine2
DrawText_DicharSprite_NextLine:
;	and &0F
;	inc hl
;	ld (hl),a
;	dec hl
;	ld a,c
;	and &F0
;	rrca
;	rrca
;	rrca
;	rrca
;	ld (hl),a

	ld a,(de)
;	ld c,a
;	and &0F
;	inc hl
;	ld (hl),a
;	dec hl
;	ld a,c
;	and &F0
;	rrca
;	rrca
;	rrca
;	rrca
	ld (hl),a



DrawText_DicharSprite_NextLine2:
	push de
		call GetNxtLin
	pop de
	inc de
DrawText_DicharSprite_NextLine2B:
	djnz DrawText_DicharSprite_NextLine 
DrawText_DicharSprite_Font_Plus1:
	ei
	ret

;endif

;DrawText_CharFirmwareFont_GetChar
;	ld bc,&7f00+%10001001  ;10AIRRMM ... A asic exclusive / RR UpperLower Rom (1= off) / MM screen mode
;	out (c),c
;	ldi
;	ldi
;	ldi
;	ldi
;	ldi
;	ldi
;	ldi
;	ldi
;	ld a,&8D	; Reset the firmware to OFF
;	out (c),a
;DrawText_CharFirmwareFont_GetCharEnd
ret




























;checksum reset
;defb "PLUS3DOS"
;StackPointerAlt equ &8500 ;need a stackpointer below &C000
;
;defb &1a
;defb &01
;defb &00
;defw EOF-SOF+128,&0000	;LOF
;
;defb &03	     ;basic header
;defw EOF-SOF
;defb &00,&80,&00,&80 ; Basic Header
;
;; all zeros
;defb &00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
;defb &00,&00,&00,&00,&00,&00,&00
;defb checksum("")

jp SpriteTest
push bc
	push hl
		push af	
			ld b,20
			ld c,10
			call GetMemPos
			ld (hl),128

			ld b,170
nxtlp:
			push bc
				call GetNxtLin
				ld a,b
				;cpl
				ld (hl),a
			pop bc
			djnz nxtlp
		pop af
	pop hl


pop bc

SpriteTest:
di
ld a,24+24
ld (SprShow_X),a
ld (SprShow_Y),a
ld a,2
ld (SprShow_SprNum),a
call ShowSprite


halt
ret
	


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








GetColMemPos: 

;	; Input  BC= XY (x=bytes - so 40 across)
;	; output HL= screen mem pos
;	; de is wiped


	ld hl,&5800

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
	
        RET


        LD A,B                                 ; Calculate Y2,Y1,Y0
        AND %00000111                          ; Mask out unwanted bits
        OR %01000000                           ; Set base address of screen
        LD H,A                                 ; Store in H
        LD A,B                                 ; Calculate Y7,Y6
        RRA                                    ; Shift to position
        RRA
        RRA
        AND %00011000                          ; Mask out unwanted bits
        OR H                                   ; OR with Y2,Y1,Y0
        LD H,A                                 ; Store in H
        LD A,B                                 ; Calculate Y5,Y4,Y3
        RLA                                    ; Shift to position
        RLA
        AND %11100000                          ;Mask out unwanted bits
        LD L,A                                 ; Store in L
        LD A,C                                 ; Calculate X4,X3,X2,X1,X0
        RRA                                    ; Shift into position
        RRA
        RRA
        AND %00011111                          ; Mask out unwanted bits
        OR L                                   ; OR with Y5,Y4,Y3
        LD L,A                                 ; Store in L
        RET

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




























TranspColors:	; Transparent colors are used by the sprite, if the byte matches it is skipped to effect transparency without an 'alpha map'
defb &00,&F0,&0F,&FF,%10101010,%01010101

;***************************************************************************************************
; Virtual Screen pos

	; Input 	B=VitrualX ;C=VirtualY

	; output 	B=ScreenByteX ;C=ScreenY	Y=255 if ofscreen
	;		H X bytes to skip	L	X bytes to remove
	;		D Y lines to skip	E	Y lines to remove
;***************************************************************************************************


; The virtual screen has a resolution of 160x200, with a 24 pixel border, which is used for clipping
; Y=0 is used by the code to denote a 'dead' object which will be deleted from the list
VirtualPosToScreenByte:


	ld HL,&0000
	ld D,h
	ld e,h

	; we use a virtual screen size
	; X width is 208	(160 onscreen - 2 per byte)
	; Y height is  248	(200 onscreen - 1 per line)

	; this is to allow for partially onscreen sprites	
	; and to keep co-ords in 1 byte
	; X<24 or x>=184 is not drawn
	; Y<24 or Y>=224 is not drawn
	;
	; only works with 24 pixel sprites
	ld a,B	;Check X
	cp 24 :SpriteSizeConfig24_Plus1
	jp NC,VirtualPos_1	; jp is faster if we expect it to be true!
; X<24
	ld a,25 :SpriteSizeConfig25_Plus1
	sub a,B
	RRA
	ld H,A	;move the sprite A left
	ld L,A	;need to plot A less bytes

	ld B,24	 :SpriteSizeConfig24B_Plus1;B was offscreen, so move it back on
	jp VirtualPos_2
VirtualPos_1:
	;ld a,B	;Check X
	cp 184-12 :SpriteSizeConfig184less12_Plus1
	jp C,VirtualPos_2
; X>184
	;push B
	ld a,B
	sub 184-12 :SpriteSizeConfig184less12B_Plus1

	RRA

;	pop B

	add L	;	X pos is ok, but plot A less bytes
	ld L,A
	;ld a,B	;Check X
VirtualPos_2:
	ld a,B	;Check X
	sub 24 :SpriteSizeConfig24C_Plus1
	RRA	; halve the result, as we have 80 bytes, but 160 x co-ords
	ld B,a	
;-------------------------------------------------------------------------
	ld a,C	;Check Y
	cp 24 :SpriteSizeConfig24D_Plus1
	jp NC,VirtualPos_3
; Y<24
	ld a,24 :SpriteSizeConfig24E_Plus1
	sub a,C
	ld D,A	;move the sprite A up
	ld E,A	;need to plot A less lines
	ld C,24 :SpriteSizeConfig24F_Plus1
	jp VirtualPos_4
VirtualPos_3:
	;ld a,C	;Check Y
	cp 224-24 :SpriteSizeConfig224less24_Plus1
	jp C,VirtualPos_4
; Y>224
	ld a,C
	sub 224-24 :SpriteSizeConfig224less24B_Plus1
	ld E,A
VirtualPos_4:
	ld a,C	;Check Y
	sub 24 :SpriteSizeConfig24G_Plus1
	ld C,a
	ret	

;***************************************************************************************************

; 					Show Sprite

;***************************************************************************************************
;SpritePointerInit	; We have two sprite pointers, one for player sprites (which actually never moves!) and one for level sprites
			; Note.. the second bank of sprites (128k only) is always located in &D000 in memory config C1/C3
;	ld (ObjectSpritePointer_Plus2-2),hl
;	ld (PlayerSpritePointer_Plus2-2),de


;SprShow_TempW defw &00


SprShow_TempAddr equ SprShow_TempAddr_Plus2-2 ; defw &0000

;SprShow_Address  defw &0000


; We can preread a sprite to get the width/height
; This is used for Direct sprites, and was used by the object loop - the object loop now assumes the sprite is 24x24, this was done to save time as 97% of the time - it is
ShowSprite_ReadInfo:
ld a,&0 :SprShow_SprNum_Plus1
	ld c,a
	
	ld b,0
        or a ; only done to clear carry flag
	rl b
	rl c

	ld hl,SpriteMemory :SprShow_BankAddr_Plus2
	ld d,h
	ld e,l
	add hl,bc
	add hl,bc	; 6 bytes per sprite
	add hl,bc

;	add hl,bc
;	add hl,bc
;	add hl,bc

	ld a,(hl)
;	ld (SprShow_H),a
;	ld a,&18 SprShow_H_Plus1		;(Sprite Height)
	or a
	jr z,SpriteGiveUp
	ld (SprShow_TempH),a

	inc hl

	ld a,(hl)
	ld (SprShow_TempW),a
	ld (SprShow_W),a
	ld b,a

	inc hl
	ld a,(hl)
	ld (SprShow_Yoff),a
	inc hl

	ld a,(hl)
	ld (SprShow_Xoff),a		; Note Xoffset is never actually used for x-coords
					; the mem pos is actually sprite attribs
					; such as PSet, Doubleheight and trans color
	inc hl
	;leave with Sprbankaddr in DE 
	;Width in B and Xoff in A
	
ret
SpriteGiveUp:
	pop af ;Forcably quit not just getting info - but showing the sprite
ret
;ShowSpriteDirect is a cruder version of ShowSprite, it does not use the 'virtual' screen res of (160x200) and cannot do clipping - it was designed for the UI objects 
;which never moved and never needed clipping 
ShowSpriteDirect:
	;ld hl,SprDrawChooseRender;pset
	;ld (ShowSprite_Ready_Return_Plus2-2),hl
	;set draw pos into Temp_X and Temp_Y
	call ShowSprite_ReadInfo
	

	ld c,(hl)
	inc hl
	ld b,(hl)


	ex de,hl
	add hl,bc
	ld (SprShow_TempAddr),hl
	ex de,hl



	


	;loald (SprShow_TempX),a



	
;		ld A,B
		
		ld a,(SprShow_Yoff)
		ld c,a
		ld a,(SprShow_TempY)
		add c
		ld (SprShow_TempY),A


	;Quick shortcuts for fonts
	ld a,(SprShow_TempW)
	ld (SprShow_W),a
	dec a
	jr z,ShowSpriteDirectOneByteSpecial
	dec a
	jp z,ShowSpriteDirectTwoByteSpecial
	dec a
	dec a
	jr z,ShowSpriteDirectFourByteSpecial

	xor a
	ld (TranspBitA_Plus1-1),a

	ld hl,SprDrawChooseRender;pset	
	ld a,(SprShow_Xoff_Plus1-1)
	bit 7,a
	jp z,ShowSprite_OK_Xoff2
	ld hl,SprDrawChooseRenderpset


	ShowSprite_OK_Xoff2:

	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready

ShowSpriteDirectFourByteSpecial:
	ld (TranspBitA_Plus1-1),a
;	ld (SprShow_Xoff),a
	ld hl,SprDraw16pxInit
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready
ShowSpriteDirectTwoByteSpecial:
	;shortcut for our minifont!
;	ld (SprShow_Xoff),a
	ld hl, SprDrawPset8pxInit
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready

ShowSpriteDirectOneByteSpecial:
	;shortcut for our minifont!
;	ld (SprShow_Xoff),a
	ld hl, SprDrawLnStartBegin
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	jp ShowSprite_Ready
ShowSpriteReconfigureEnableDisable:
	ld hl,null
	or a
	jr z,ShowSpriteReconfigureEnableDisableB
	ld hl,ShowSpriteReconfigure	
ShowSpriteReconfigureEnableDisableB:
	ld (ShowSpriteReconfigureCommand_Plus2-2),hl
	jr ShowSpriteReconfigure_24px
ShowSpriteReconfigure:
	ld (SpriteSizeConfig6_Plus1-1),a

	;Akuyou was designed for 24x24 sprites, but this module can 'reconfigure' it for other sizes
	cp 6 ;24px
	jp z,ShowSpriteReconfigure_24px
	cp 8 ;32px
	jp z,ShowSpriteReconfigure_32px
	cp 12 ;32px
	jp z,ShowSpriteReconfigure_48px
	cp 16 ;64px
	jr z,ShowSpriteReconfigure_64px
	cp 20 ;80px
	jr z,ShowSpriteReconfigure_80px
	cp 24 ;96px
	jr z,ShowSpriteReconfigure_96px
	cp 32 ;128px
	jr z,ShowSpriteReconfigure_128px
	cp 2 ;8px
	jr z,ShowSpriteReconfigure_8px
	cp 4 ;16px
	jr z,ShowSpriteReconfigure_16px
ret

ShowSpriteReconfigure_128px:			;Not actually used!
;	ld a,32
;	ld (SpriteSizeConfig6_Plus1-1),a
;	ld a,128
	ld a,184-64
	ld b,224-24;	ld b,224-128
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_104px:			;Not actually used!
;	ld a,24
;	ld (SpriteSizeConfig6_Plus1-1),a
	;ld a,96
	ld a,184-52
	ld b,224-96
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_96px:			;Used by Boss 1
;	ld a,24
;	ld (SpriteSizeConfig6_Plus1-1),a
	;ld a,96
	ld a,184-48
	ld b,224-24;	ld b,224-96
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_80px:			;Not actually used!
;	ld a,20
;	ld (SpriteSizeConfig6_Plus1-1),a
	;ld a,80
	ld a,184-40
	ld b,224-80
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_48px:
	ld a,184-24
	ld b,224-48
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_32px:
;	ld a,8
;	ld (SpriteSizeConfig6_Plus1-1),a
	;ld a,32
	ld a,184-16
	ld b,224-32
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_64px:			;not actually used
;	ld a,16
;	ld (SpriteSizeConfig6_Plus1-1),a
	;ld a,64
	ld a,184-32
	ld b,224-64
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_16px:
	ld a,184-8
	ld b,224-16
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_8px:
	ld a,184-4
	ld b,224-8
	jr ShowSpriteReconfigure_all
ShowSpriteReconfigure_24px:
	;ld a,6

	;ld a,24
	ld a,184-12
	ld b,224-24

ShowSpriteReconfigure_all:

	;top pos checks
;	ld (SpriteSizeConfig24_Plus1-1),a
;	ld (SpriteSizeConfig24D_Plus1-1),a


	;relocate offscreen sprites data back onscreen
;	ld (SpriteSizeConfig24B_Plus1-1),a
;	ld (SpriteSizeConfig24F_Plus1-1),a





;subtract 24px border from topleft
;	ld (SpriteSizeConfig24C_Plus1-1),a
;	ld (SpriteSizeConfig24G_Plus1-1),a

	;y correction
;	ld (SpriteSizeConfig24E_Plus1-1),a


	;X correction
;	inc a
;	ld (SpriteSizeConfig25_Plus1-1),a

;	ld a,c
	;Right X
	ld (SpriteSizeConfig184less12_Plus1-1),a
	ld (SpriteSizeConfig184less12B_Plus1-1),a
	ld a,B
	;Bottom Y
	ld (SpriteSizeConfig224less24_Plus1-1),a
	ld (SpriteSizeConfig224less24B_Plus1-1),a
ret
GetSpriteXY
	ld a,(SprShow_X)
	ld b,a
	ld a,(SprShow_Y)
 	ld c,a
ret


ShowSprite:	
; ShowSprite is the main routine of our program!
	
	;ld hl,SprDrawChooseRender;pset
	;ld (ShowSprite_Ready_Return_Plus2-2),hl


 		; *********  Get Sprite Details *********
	call ShowSprite_ReadInfo
	di

	ex af,af'
	ld a,b
	cp 6 :SpriteSizeConfig6_Plus1
	call  nz,ShowSpriteReconfigure	:ShowSpriteReconfigureCommand_Plus2


	ld c,(hl)
	inc hl
	ld b,(hl)


	ex de,hl
	add hl,bc
	ld (SprShow_TempAddr),hl
	ex de,hl

	ld bc,TranspColors
	ex af,af'
	;ld a,(SprShow_Xoff) - we are relying on this still being in A 
	and %00000111
	add c
	ld c,a
	ld a,(bc)
	ld (TranspBitA_Plus1-1),a

;	ld a,(SprShow_Y)
;	or a
;	ret Z


 		; *********  show a new sprite *********


ShowSprite_OK:

	;ld (SprShow_Y),a
;	ld C,a				; load C for the Screen lookup

	ld a,48: SprShow_Yoff_Plus1
	add 48:SprShow_Y_Plus1
	ld C,a



	;ld (SprShow_TempY),a


	ld B,48 :SprShow_X_Plus1

;	ld B,a				; load B for the Screen lookup

	ld a,48: SprShow_Xoff_Plus1


	bit 6,a
	jp z,ShowSprite_OK_NoDoubler
	ld hl,SprDrawChooseRenderLineDoubler ; Doubler gives an interlacing effect, used for faux big sprites without slowdown
	
	bit 7,a
	jp z,ShowSprite_OK_Xoff
	ld hl,SprDrawChooseRenderLineDoublerPset  ;Double height with Pset (no transparency - much faster)

	jp ShowSprite_OK_Xoff
ShowSprite_OK_NoDoubler:			
	;push hl
	ld hl,SprDrawChooseRender;pset		; Normal sprite	
	bit 7,a
	jp z,ShowSprite_OK_Xoff

;	ld hl,SprDrawChooseRenderPsetAligned - Tested code - incomplete
	ld hl,SprDrawChooseRenderpset		; PSET sprite - deletes background, fast no transp


ShowSprite_OK_Xoff:
	and %00000000 ; Bit 7 forces "pset" - wipes background but faster ; Bit 6 doubles height ;123=transp
	add B
	ld B,a
	
	ld (ShowSprite_Ready_Return_Plus2-2),hl
	;pop hl
	

;	ex af,af'	;	push af 			;store width for later


		call VirtualPosToScreenByte
		;		H X bytes to skip	L	X bytes to remove
		;		D Y bytes to skip	E	Y bytes to remove

		ld A,B
		ld (SprShow_TempX),A
		ld A,C
		ld (SprShow_TempY),A

		ld a,h
		or l
		or d			; if all are zero, do nothing
		or e
		jp Z,ShowSprite_SkipChanges

	ifdef Debug
		call Debug_NeedEXX
	endif
		exx;push hl
			ld hl,SprDrawLnStartBegin
			ld (ShowSprite_Ready_Return_Plus2-2),hl

		exx;pop hl
	ifdef Debug
		call Debug_ReleaseEXX
	endif

		ld a,h
		ld (SprShow_OldX),a
		push de

			ld a,(SprShow_TempH)
			dec a
			cp E
			jr NC,ShowSprite_HeiNotZero		; check if new width is <0
				;pop af ; use up the pushed val
				pop af
;				ei
				ret
			ShowSprite_HeiNotZero:
			inc a
			sub E
			ld (SprShow_TempH),a

			ld a,(SprShow_TempW)
			ld (SprShow_W),a
			dec a
			cp L
			jr NC,ShowSprite_WidthNotZero		; check if new width is <0
				;pop af ; use up the pushed val
				pop af
;				ei
				ret
			ShowSprite_WidthNotZero:
			inc a
			sub L
			ld (SprShow_TempW),a
	ex af,af'
			ld hl,(SprShow_TempAddr)
	
		pop af 		;restore width
		ld d,0
		ld e,a		; store width for loop

	; we can only use the basic slow render - the others cannot clip

	;pop bc  	; Get the counter out the stack
	ex af,af'
	ld b,a
	;ld a,b
	or a
	jr Z,ShowSprite_AddressOK
 
	ShowSprite_AddressDown:
		add hl,de
	djnz ShowSprite_AddressDown

ShowSprite_AddressOK:	;Address does not need changing
	ld b,0
	ld c,&00 :SprShow_OldX_Plus1
;	ld bc,(SprShow_OldX)
	add hl,bc ; add the width to the address

	ld (SprShow_TempAddr),hl ; save the new start address


	jp ShowSprite_Ready
	;we have messed with the co-ords, so can only use the basic render not supefast ones



ShowSprite_SkipChanges:
	; No co-ord tweaks were needed, all sprite is onscreen
	;pop af 		;restore width
	ex af,af'
;	jp ShowSprite_Ready


ShowSprite_Ready:
;	ld B,&69SprShow_TempX_Plus1		;xpos
;	ld C,&00 SprShow_TempY_Plus1 ;(SprShow_TempY)
;	call GetMemPosQuickA
	ld hl,&0000 :SprShow_TempY_Plus2
	add hl,hl 		; table is two bytes so double hl

	ld de,scr_addr_table	; get table
	add hl,de		;add line num

	ld a,(hl)		; read the two bytes in		
	inc l ;inc hl
	ld h,(hl)
	ld l,a	; hl now is the memory loc of the line
	
;	ld a,b	;get the X col
	ld de,&0020 :ScreenBuffer_ActiveScreenDirectC_Plus1


	add hl,de  	; hl = memory line, bc = X pos = hl is now the location on screen
	

;;;;;;;;;;;;;;;;

	ld c,&00 :SprShow_TempH_Plus1
	ld iy,&0000 :SprShow_TempAddr_Plus2

	
	jp SprDrawLnStartBegin :ShowSprite_Ready_Return_Plus2






SprDrawChooseRenderLineDoubler:
;	ex af,af'
	rlc c
;	ld a,c
;	add c
;	ld c,a

	ld de,Sprdraw24PxVer_Double
;	ex af,af'
	jp SprDrawTurboPrep

SprDrawChooseRender:	; Pick the render based on width
	ld a,(SprShow_TempW)
	cp 6
	jp z,SprDraw24pxInit
	cp 8
	jr z,SprDraw32pxInit
	cp 4
	jr z,SprDraw16pxInit
	cp 2
	jr z,SprDraw8pxInit
	cp 12
	jr z,SprDraw48pxInit
	cp 10
	jr z,SprDraw40pxInit
	cp 24
	jr z,SprDraw96pxInit
	;cp 255
	;jr z,SprDraw24pxInit

SprDrawLnStartBegin:			; This is our most basic render, its slow, but can do any size and clipping



SprDrawLnStartBeginB:
	ld a,(TranspBitA_Plus1-1)	
	ld (TranspBitB_Plus1-1),a
	push hl
	ld hl, SprDrawLnStart2

	ld a,(SprShow_Xoff)
	bit 6,a
	jp z,SprDrawLn_NoDoubler

	ld hl,SprDrawLnDoubleLine
	;ld a,c
	;add c
	;ld c,a

SprDrawLn_NoDoubler:
	ld (SprDrawLnDoubleLineJump_Plus2-2),hl
	pop hl


SprDrawLnStart2:
	;push bc
	push hl
	

		ld d,IYH
		ld e,IYL



		ld b,&00 :SprShow_TempW_Plus1;a	
		SprDrawPixelLoop:
			ld a,(de)
			cp 1 :TranspBitB_Plus1
			jr z,SprDrawSkipPixelLoop
			ifdef DebugSprite
				or %11000000 ; test code, marks slow sprites so we can see they will be slow
			endif
			ld (hl),a
		SprDrawSkipPixelLoop:
			inc hl
			inc de
		djnz SprDrawPixelLoop	

		ld d,0 
		ld e,0 :SprShow_W_Plus1
		add iy,de
	pop hl


;	call GetNxtLin

;	ld a,h
;	add a,&08
;	ld h,a

;GetNextLineBasicSpriteCheck_Minus1
;	bit 7,h
;	jp nz,GetNextLineBasicSpriteCheckDone
;	ld de,&c050
;	add hl,de

	inc h
	ld a,h
	and  %00000111;7
	jp nz,GetNextLineBasicSpriteCheckDone
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,GetNextLineBasicSpriteCheckDone
	ld a,h
	sub %00001000;8
	ld h,a


GetNextLineBasicSpriteCheckDone:
	dec c
;	ei
;	ret z
	jp z,SpeccyColorIY
	jp SprDrawLnStart2 :SprDrawLnDoubleLineJump_Plus2
SprDrawLnDoubleLine:
	call GetNxtLin

	jr SprDrawLnStart2

SprDrawLineEnd2:

;--------------------Turbo Version! misuse the stack for faster writes ----------------
SprDraw8pxInit:
	ld de,Sprdraw8PxVer
	jp SprDrawTurboPrep
SprDraw16pxInit:
	ld de,Sprdraw16PxVer
	jp SprDrawTurboPrep
SprDraw32pxInit:
	ld de,Sprdraw32PxVer
	jp SprDrawTurboPrep
SprDraw48pxInit:
	ld de,Sprdraw48PxVer
	jp SprDrawTurboPrep
SprDraw24pxInit:
	ld de,Sprdraw24PxVer
	jp SprDrawTurboPrep
SprDraw40pxInit:
	ld de,Sprdraw40PxVer
	jp SprDrawTurboPrep
SprDraw96pxInit:
	ld de,Sprdraw96PxVer
	jr SprDrawTurboPrep

SprDrawTurboPrep:
	ld (Sprdraw24PxJumpPos_Plus2-2),de
	;ld  	B,0 ;B is ZERO

SprDrawTurboPrep2:
	di
	ld (SprDrawTurbo_StackRestore_Plus2-2),sp
	ld sp,iy
SprDrawTurbo_StartLine:
	ld (SprDrawTurbo_HLrestore_Plus2-2),hl

		Ld a,0	:TranspBitA_Plus1 ; Set A to ZERO / Transp byte
		jp	Sprdraw24PxVer :Sprdraw24PxJumpPos_Plus2	; we change the jump here to alter the width of the sprite quickly

		; ********** A MUST BE the transparent byte for THIS WHOLE LOOP! ***********

Sprdraw24PxVer_Double:	;Line doubler - does two nextlines each time
		
		bit 0,C
		jp z,SprDrawTurbo_LineSkip
		jp Sprdraw24PxVer
Sprdraw96PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipFb
		ld (hl),e
		SprDraw24pxW_SkipFb:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipEb
		ld (hl),d
		SprDraw24pxW_SkipEb:
		inc hl
Sprdraw88PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipCb
		ld (hl),e
		SprDraw24pxW_SkipCb:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipDb
		ld (hl),d
		SprDraw24pxW_SkipDb:
		inc hl
Sprdraw80PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipAb
		ld (hl),e
		SprDraw24pxW_SkipAb:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipBb
		ld (hl),d
		SprDraw24pxW_SkipBb:
		inc hl


Sprdraw72PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip1b
		ld (hl),e

		SprDraw24pxW_Skip1b:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip2b
		ld (hl),d
		SprDraw24pxW_Skip2b:
		inc hl

Sprdraw64PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip3b
		ld (hl),e
		SprDraw24pxW_Skip3b:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_Skip4b
		ld (hl),d
		SprDraw24pxW_Skip4b:
		inc hl

Sprdraw56PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip5b
		ld (hl),e
		SprDraw24pxW_Skip5b:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip6b
		ld (hl),d
		SprDraw24pxW_Skip6b:
		inc hl
Sprdraw48PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipF
		ld (hl),e
		SprDraw24pxW_SkipF:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipE
		ld (hl),d
		SprDraw24pxW_SkipE:
		inc hl
Sprdraw40PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipC
		ld (hl),e
		SprDraw24pxW_SkipC:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipD
		ld (hl),d
		SprDraw24pxW_SkipD:
		inc hl
Sprdraw32PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_SkipA
		ld (hl),e
		SprDraw24pxW_SkipA:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_SkipB
		ld (hl),d
		SprDraw24pxW_SkipB:
		inc hl


Sprdraw24PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip1
		ld (hl),e

		SprDraw24pxW_Skip1:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip2
		ld (hl),d
		SprDraw24pxW_Skip2:
		inc hl

Sprdraw16PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip3
		ld (hl),e
		SprDraw24pxW_Skip3:
		inc hl

		; Byte Start
		cp d
		jr z,SprDraw24pxW_Skip4
		ld (hl),d
		SprDraw24pxW_Skip4:
		inc hl

Sprdraw8PxVer:
		pop de
		cp e
		jr z,SprDraw24pxW_Skip5
		ld (hl),e
		SprDraw24pxW_Skip5:
		inc hl

		cp d
		jr z,SprDraw24pxW_Skip6
		ld (hl),d
		SprDraw24pxW_Skip6:
SprDrawTurbo_LineSkip:
	dec c
	jr z,SprDrawTurbo_Done

	ld hl,&6969 :SprDrawTurbo_HLrestore_Plus2



;	ld a,h
;	add a,&08
;	ld h,a;
;TurboScreenLoopCheck_Minus1
;	bit 7,h
;	jp nz,SprDrawTurbo_AllowInterrupts
;SprDrawTurbo_AllowInterruptsB
;	ld de,&c050
;	add hl,de
	inc h
	ld a,h
	and  %00000111;7
	jp nz,SprDrawTurbo_AllowInterrupts
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,SprDrawTurbo_AllowInterrupts
	ld a,h
	sub %00001000;8
	ld h,a
SprDrawTurbo_AllowInterrupts:	; We need to allow interrupts every few lines to keep the raster colors consistant
	;bit 0,c
	ld a,c
	and %00000011
	jp nz,SprDrawTurbo_StartLine

	ld (SprDrawTurbo_StackRestoreSprite_Plus2-2),sp
;	ei
	ld sp,&6969 :SprDrawTurbo_StackRestore_Plus2
	di
	ld sp,&6969 :SprDrawTurbo_StackRestoreSprite_Plus2
	jp SprDrawTurbo_StartLine



SprDrawTurbo_Done:
	ld hl,&0000
	add hl,sp
	ld sp,(SprDrawTurbo_StackRestore_Plus2-2)
;	ei
;	ret
jp SpeccyColor







;--------------------Pset Version! no transparentcy, so fast! ----------------
SprDrawChooseRenderLineDoublerPset:
	di
	
	ex af,af';push af
	ld a,c
	add c
	ld c,a
	ex af,af';pop af
	ld de,SprdrawPset_Double
	jp SprDrawPsetPrep


SprDrawChooseRenderPset:		; Can do any size between 8-48 pixels
	ld a,(SprShow_TempW)
	cp 6
	jp z,SprDrawPset24pxInit
	cp 8
	jr z,SprDrawPset32pxInit
	cp 4
	jr z,SprDrawPset16pxInit
	cp 2
	jr z,SprDrawPset8pxInit
	cp 12
	jr z,SprDrawPset48pxInit
	cp 16
	jr z,SprDrawPset64pxInit
	cp 20
	jr z,SprDrawPset80pxInit
	cp 24
	jr z,SprDrawPset96pxInit
	cp 32
	jr z,SprDrawPset128pxInit
	cp 18
	jr z,SprDrawPset72pxInit
	cp 10
	jr z,SprDrawPset40pxInit
	jp SprDrawLnStart2
SprDrawPset8pxInit:
	ld de,SprDrawPset8PxVer
	jr SprDrawPsetPrep
SprDrawPset16pxInit:
	ld de,SprDrawPset16PxVer
	jr SprDrawPsetPrep
SprDrawPset32pxInit:
	ld de,SprDrawPset32PxVer
	jr SprDrawPsetPrep
SprDrawPset40pxInit:
	ld de,SprDrawPset40PxVer
	jr SprDrawPsetPrep
SprDrawPset48pxInit:
	ld de,SprDrawPset48PxVer
	jr SprDrawPsetPrep
SprDrawPset64pxInit:
	ld de,SprDrawPset64PxVer
	jr SprDrawPsetPrep
SprDrawPset72pxInit:
	ld de,SprDrawPset72PxVer
	jr SprDrawPsetPrep
SprDrawPset80pxInit:
	ld de,SprDrawPset80PxVer
	jr SprDrawPsetPrep
SprDrawPset96pxInit:
	ld de,SprDrawPset96PxVer
	jr SprDrawPsetPrep
SprDrawPset128pxInit:
	ld de,SprDrawPset128PxVer
	jr SprDrawPsetPrep
SprDrawPset24pxInit:
	ld de,SprDrawPset24PxVer
SprDrawPsetPrep:

	ld (SprDrawPset24PxJumpPos_Plus2-2),de
	
SprDrawPsetPrep2:

	di
	ld (SprDrawPset_StackRestore_Plus2-2),sp
	ld sp,iy
SprDrawPset_StartLine:
	ld (SprDrawPset_HLrestore_Plus2-2),hl

		ld a,(TranspBitA_Plus1-1) ; Set A to ZERO
		jp	SprDrawPset24PxVer :SprDrawPset24PxJumpPos_Plus2

		; ********** A MUST BE ZERO THIS WHOLE LOOP! ***********

SprdrawPset_Double:				;Line doubler, moves down two lines instead of one
		
		bit 0,C
		jr z,SprDrawPset_LineSkip
		jp SprDrawPset24PxVer
SprDrawPset128PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl

		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset96PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset80PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset72PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset64PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl

		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset48PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset40PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset32PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset24PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset16PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d
		inc hl
SprDrawPset8PxVer:
		pop de
		ld (hl),e
		inc hl
		ld (hl),d

SprDrawPset_LineSkip:
	dec c
	jr z,SprDrawPset_Done
	ld hl,&6969 :SprDrawPset_HLrestore_Plus2


;	ld a,h
;	add a,&08
;	ld h,a

;PsetScreenLoopCheck_Minus1
;	bit 7,h
;	jp nz,SprDrawPset_AllowInterrupts
;SprDrawPset_AllowInterruptsB
;	ld de,&c050
;	add hl,de


	inc h
	ld a,h
	and  %00000111;7
	jp nz,SprDrawPset_AllowInterrupts
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,SprDrawPset_AllowInterrupts
	ld a,h
	sub %00001000;8
	ld h,a


SprDrawPset_AllowInterrupts:		; Let interrupts run once every few lines to keep interrupts stable
	ld a,c
	and %00000111
	jp nz,SprDrawPset_StartLine

	ld (SprDrawPset_StackRestoreSprite_Plus2-2),sp
;	ei
	ld sp,&6969 :SprDrawPset_StackRestore_Plus2
	di
	ld sp,&6969 :SprDrawPset_StackRestoreSprite_Plus2
	jp SprDrawPset_StartLine	



SprDrawPset_Done:
	ld hl,&0000
	add hl,sp
	ld sp,(SprDrawPset_StackRestore_Plus2-2)
;	ei

SpeccyColor:
;	ld hl,&8000	;we have currently the pointer to the color ram
	ld de,&5800


	ld a,(SprShow_TempX)
;	ld a,0		;XXXX
;	and %11111111
;	and %11111000
;	rrca
;	rrca
;	rrca
	add e
	ld e,a






	ld a,(SprShow_TempY)
	;ld a,0 ;%01100100	;YYYY
		 ;  1100

	push af
		and %11000000
		rlca
		rlca
		ld b,a
	pop af
	and %00111000
	rlca
	rlca

	ld c,a
	ex hl,de
		add hl,bc
	ex hl,de

	ld a,(SprShow_TempH)
	add 7
	and %11111000
	rrca
	rrca
	rrca
	ld ixl,a		;Y hei
;	ld b,0
NextColLine:
	ld a,(SprShow_TempW)
	ld b,a
	push de
;		ldir
NextColLineLoop:
		ld a,(hl)
;		and %00000111
;	 	ld c,a
;		ld a,(de)
;		and %11111000
;		or c
		ld (de),a
		inc hl
		inc de
		djnz NextColLineLoop
		
	pop de
	ex hl,de
		ld bc,&0020
		add hl,bc
	ex hl,de
	dec ixl
	jp nz,NextColLine
di
halt
ret





di
halt

SpeccyColorIY:
Push IY
pop HL
jr SpeccyColor

null:	ret


nolist
;read "Akuyou_Spectrum_Keyreader.asm"



ShowHex:


	push af         ;store original byte value
		rrca            
		rrca
		rrca
		rrca
		call DrawText_PrintHexDigit
	pop af          ;retrieve original byte value

DrawText_PrintHexDigit:
	;	and %00001111   ;isolate lower nibble. (This contains the digit value 0...15)
	;	add a,"0"       ;add ASCII for 0. Digits 0...9 become "0"..."9", digits 10..15
	;	cp "9"+1        
	;	jr c,ShowHexDigitNum     ;if number is in digit range 0...9, display digit
	;	add a,"A"-"9"-1 ;modify ASCII value so that digits in the range 10...15
	and %00001111   ;isolate lower nibble. (This contains the digit value 0...15)
	cp &a           ;Less than 10?  Set carry if so
	sbc a,&69
	daa             ;Because previous instruction was a subtract operation this
                ;is known as 'das' in x86
DrawText_PrintHexDigitNum:
	jp DrawText_CharSprite   ;display digit





align 256
SpriteMemory:
incbin "speccy.spr"
EOF:
;save "spectest",&8000,EOF-&8000





