write "..\spectest.bin"

org &8000
SOF:
infloop:
	di

	ld hl,&0101
	call setxy

	call KeyboardScanner_Read
	call Player_ReadControls
;	di
;	halt
ld a,ixl
	rst 16          ; print it.
jp infloop


	push af
	push hl
ReadKeyboardAgain:
	ld hl,&0F00
	call setxy      ; set up our x/y coords.







KeyboardScanner_Read:
Read_Keyboard:				LD HL,KeyPorts		; Point HL at the keyboard list
					ld ix,KeyboardScanner_KeyPresses

					LD d,8					; This is the number of ports (rows) to check
					LD C,&FE				; C is always FEh for reading keyboard ports
Read_KeyboardAgain:			LD B,(HL)				; Get the keyboard port address from table
					INC HL					; Increment to list of keys
					IN A,(C)				; Read the row of keys in
					or %11100000;%00011111				
					ld (ix),a
					inc ix 

;					push hl
;					push bc
;					push de
;					        rst 16          ; print it.
;					pop de
;					pop bc
;					pop hl
	
					dec d
					jp nz,Read_KeyboardAgain


;kempston Joystick
		
					ld bc,31            ; Kempston joystick port.
				        in a,(c)            ; read input.
					cpl
					or %11100000;%00011111
					ld (ix),a
		ret










KeyboardScanner_ScanForOne:

;	ld a,254
;        rst 16          ; print it.

	call KeyboardScanner_Read

	ld b,10
	ld c,0
	ld hl,KeyboardScanner_KeyPresses
KeyboardScanner_WaitForKey_Check:
	ld a,(hl)
	cp 255
	ret nz
	inc hl
	inc c
	djnz KeyboardScanner_WaitForKey_Check
	ret

KeyboardScanner_WaitForKey:
	;call KeyboardScanner_WaitForKey2
	
;KeyboardScanner_WaitForKey2:
		call KeyboardScanner_ScanForOne
		cp 255
		jr z,KeyboardScanner_WaitForKey
	ret




















Player_ReadControls2:
	ld hl,KeyMap2
;	ld bc,&F991
	jr Player_ReadControlsB
Player_ReadControls:
	; returns
	; ixl = Keypress bitmap Player 
	; HL Direct pointer to the keymap
	ld hl,KeyMap
;	ld bc,&F990

Player_ReadControlsB:
;	ld a,0 multiplaysupport_Plus2;in a,(c) ;
;	cpl	
;push af
	ld c,0
	ld b,8			
	; We compare the keypresses to the 8 key map, 
	; and store the result as a single byte
	; when 2player support is done, we will do this twice one for
	; each controller

Player_Handler_ReadNext:

	push bc

		ld d,(hl)	;Bitmap
		inc hl
		ld a,(hl)	;line num
		inc hl

		push hl
			ld hl,KeyboardScanner_KeyPresses
			;push de
;				ld d,0
		;		add hl,de
			add l
			ld l,a
	;		pop de
			ld a,(hl)
			or d
			inc a ; see if A is 255!
			ld e,0
			jr nz,Player_Handler_notPressed
			inc e
Player_Handler_notPressed:
		pop hl
	pop bc
	ld a,c
	rlca
	add e
	ld c,a
	djnz Player_Handler_ReadNext
;pop af
;	and c
	ld a,c

	ld ixl,a
	ld hl,KeyboardScanner_KeyPresses	; This is the location of the real memory to do with as you wish!
ret












KeyMap2:
defb &FF,&00 ;Pause
defb %01111111,&05 ;Fire3
defb %10111111,&06 ;Fire2L
defb %01111111,&06 ;Fire1R
defb %11011111,&07 ;Right
defb %11011111,&08 ;Left
defb %11101111,&07 ;Down
defb %11110111,&07 ;Up

KeyMap: 
defb %11111011,&03 ;Pause bit 20
defb %11111011,&02 ;Fire3	19
defb %11111011,&01 ;Fire2L
defb %11101111,&08 ;Fire1R
defb %11110111,&08 ;Right	16
defb %11111011,&08 ;Left	15
defb %11111101,&08 ;Down	14
defb %11111110,&08 ;Up	13


align 16
KeyboardScanner_KeyPresses  ds 10,&FF ;Player1

KeyPorts
db	&FE,&FD,&FB,&F7,&EF,&DF,&BF,&7F





;Keyboard_Map			0	DB &FE,"#","Z","X","C","V"
;				1	DB &FD,"A","S","D","F","G"
;				2	DB &FB,"Q","W","E","R","T"
;				3	DB &F7,"1","2","3","4","5"
;				4	DB &EF,"0","9","8","7","6"
;				5	DB &DF,"P","O","I","U","Y"
;				6	DB &BF,"#","L","K","J","H"
;				7	DB &7F," ","#","M","N","B"					RET
;				8 	Kempson


	halt 

	ei	


	pop hl
	pop af
	ret




;locate command

setxy  ;locate H , L
       ld a,22         ; ASCII control code for AT.
       rst 16          ; print it.
       ld a,l
       rst 16          ; print it.
       ld a,h
       rst 16          ; print it.
       ret



EOF:
;save "spectest",&8000,EOF-&8000