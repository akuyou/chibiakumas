
Monitor_Full equ 1

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






