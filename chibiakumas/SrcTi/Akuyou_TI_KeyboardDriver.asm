

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
	di

	ld de,KeyboardScanner_KeyPresses
	ld hl,TIKeygroups

	ld b,0
	ld c,1
keynextline:
	ld a,(hl)
	out (c),a

	in	a,(c)
	ld (de),a

	inc de
	inc hl

	inc b
	ld a,b
	cp 7
	jp nz,keynextline

	ei
ret

TIKeygroups:
db &BF,&DF,&EF,&F7,&FB,&FD,&DE



; Key Code 
;   	0	1	2 	3	4	5	6	7
;0  	GRAPH 	TRACE 	ZOOM 	WINDOW 	Y= 	2nd 	MODE 	DEL 
;1  		STO 	LN 	LOG 	x2 	x-1 	MATH 	ALPHA 
;2  	0 	1 	4 	7 	,  	SIN 	APPS 	xTOn
;3  	. 	2 	5 	8 	) 	COS 	PRGM 	STAT 
;4  	(-) 	3 	6 	9 	( 	TAN 	VARS  
;5  	ENTER 	+ 	- 	* 	/ 	^ 	CLEAR  
;6  	down 	left 	right 	up 





KeyboardScanner_ScanForOne:

;	ld a,254
;        rst 16          ; print it.

	call KeyboardScanner_Read

	ld b,13
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


; 	bit 7 	bit 6 	bit 5 	bit 4 	bit 3 	bit 2 	bit 1 	bit 0 
;row 0 	7 & 	6 ^ 	5 % 	4 $ 	3 # 	2 @ 	1 ! 	0 ) 
;row 1 	;colon	] } 	[ { 	\ | 	= + 	- _ 	9 ( 	8 * 
;row 2 	B 	A 	DEAD 	/ ? 	. > 	, < 	` ~ 	' " 
;row 3 	J 	I 	H 	G 	F 	E 	D 	C 
;row 4 	R 	Q 	P 	O 	N 	M 	L 	K 
;row 5 	Z 	Y 	X 	W 	V 	U 	T 	S 
;row 6 	F3 	F2 	F1 	CODE 	CAPS 	GRAPH 	CTRL 	SHIFT 
;row 7 	RET 	SELECT BS 	STOP 	TAB 	ESC 	F5 	F4 
;row 8 	¨ 	« 	ª 	© 	DEL 	INS 	HOME 	SPACE 
;row 9 	NUM4 	NUM3 	NUM2 	NUM1 	NUM0 	NUM/ 	NUM+ 	NUM* 
;row 10 NUM. 	NUM, 	NUM- 	NUM9 	NUM8 	NUM7 	NUM6 	NUM5 




;KeyMap2
;defb &FF,&00 ;Pause
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
;defb %11101111,&0B ;Fire1R
;defb %11110111,&0B ;Right	16
;defb %11111011,&0B ;Left	15
;defb %11111101,&0B ;Down	14
;defb %11111110,&0B ;Up	13

