

;Keymap_U equ 0
;Keymap_D equ 1
;Keymap_L equ 2
;Keymap_R equ 3
;Keymap_F1 equ 4
;Keymap_F2 equ 5
;Keymap_F3 equ 6
;Keymap_Pause equ 7

;Keymap_AnyFire equ %11001111



KeyboardScanner_Read:
Read_Keyboard:				
	LD HL,KeyPorts		; Point HL at the keyboard list
	ld de,KeyboardScanner_KeyPresses

	LD ixl,8					; This is the number of ports (rows) to check
	LD C,&FE				; C is always FEh for reading keyboard ports
Read_KeyboardAgain:			
	LD B,(HL)				; Get the keyboard port address from table
	INC HL					; Increment to list of keys
	IN A,(C)				; Read the row of keys in
	or %11100000			
	ld (de),a
	inc de 
	dec ixl
	jp nz,Read_KeyboardAgain


	;kempston Joystick
		
	ld bc,31            ; Kempston joystick port.
        ld a,0      :KempsonSelfMod_Plus2      ; &ED 78 ,in a,(c)
	cpl
	or %11100000;%00011111
	ld (de),a
ret

KeyboardScanner_ScanForOne:

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
		call KeyboardScanner_ScanForOne
		cp 255
		jr z,KeyboardScanner_WaitForKey
	ret

Player_ReadControlsClassic:	;if either player presses anything act on it - used for menus etc

	; ixl = Keypress bitmap Player 1
	; ixh = Keypress bitmap Player 2
	; HL Direct pointer to the keymap

	call KeyboardScanner_Read
	call Player_ReadControls2
	ld ixh,a
	call Player_ReadControls

	ret







Player_ReadControls2:
	ld hl,KeyMap2
	jr Player_ReadControlsB
Player_ReadControls:
	; returns
	; ixl = Keypress bitmap Player 
	; HL Direct pointer to the keymap
	ld hl,KeyMap

Player_ReadControlsB:
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
			add l
			ld l,a
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
	ld a,c
	ld ixl,a
	ld hl,KeyboardScanner_KeyPresses	; This is the location of the real memory to do with as you wish!
ret






;KeyMap2
;defb &FF,&00 ;Pause;
;defb %01111111,&05 ;Fire3
;defb %10111111,&06 ;Fire2L
;defb %01111111,&06 ;Fire1R
;defb %11011111,&07 ;Right
;defb %11011111,&08 ;Left
;defb %11101111,&07 ;Down
;defb %11110111,&07 ;Up

;KeyMap
;defb %11111011,&03 ;Pause bit 20
;defb %11111011,&02 ;Fire3	19
;defb %11111011,&01 ;Fire2L
;defb %11101111,&08 ;Fire1R
;defb %11111110,&08 ;Right	16
;defb %11111101,&08 ;Left	15
;defb %11111011,&08 ;Down	14
;defb %11110111,&08 ;Up	13


;align 16
;KeyboardScanner_KeyPresses  ds 10,&FF ;Player1

KeyPorts
db	&FE,&FD,&FB,&F7,&EF,&DF,&BF,&7F



;Ports

;32766 B, N, M, Sym, Space
;49150 H, J, K, L  , Enter
;57342 Y, U, I, O  , P
;61438 6, 7, 8, 9  , 0
;63486 5, 4, 3, 2  , 1
;64510 T, R, E, W  , Q
;65022 G, F, D, S  , A
;65278 V, C, X, Z  , Caps Shift


;result layout

;						0   1   2   3   4
;Keyboard_Map			0	DB &FE,"#","Z","X","C","V" #=caps shift
;				1	DB &FD,"A","S","D","F","G"
;				2	DB &FB,"Q","W","E","R","T"
;				3	DB &F7,"1","2","3","4","5"
;				4	DB &EF,"0","9","8","7","6"
;				5	DB &DF,"P","O","I","U","Y"
;				6	DB &BF,"#","L","K","J","H" #=enter
;				7	DB &7F," ","#","M","N","B"					RET
;				8 	Kempson
