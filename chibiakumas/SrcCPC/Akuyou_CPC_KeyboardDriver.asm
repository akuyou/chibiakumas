
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			 Keyboard Reader

;***************************************************************************************************
;--------------------------------------------------------------------------------------------


; Don't ask me how this works - someone smarter than me wrote it!


;KeyboardScanner_Flush equ &BB03


;map with 10*8 = 80 key status bits (bit=0 key is pressed)

KeyboardScanner_Read:
        ld bc,#f782     ;PPI port A out /C out 
        ld hl,KeyboardScanner_KeyPresses    
	xor a

	di              
        out (c),c       
        ld bc,#f40e     ; Select Ay reg 14 on ppi port A 
        ld e,b          
        out (c),c       
        ld bc,#f6c0     ;This value is an AY index (R14) 
        ld d,b          
        out (c),c       
        out (c),a;c     ;Validate!! out (c),0 
        ld bc,#f792     ; PPI port A in/C out 
        out (c),c       
        ld a,#40        
        ld c,#4a        
KeyboardScanner_Loop
	ld b,d    	;d=#f6      
        out (c),a       ;4 select line
        ld b,e    	;e=#f4   
        ini             ;5 read bits and write into KEYMAP
        inc a           
        cp c            
        jp c,KeyboardScanner_Loop       ;2/3 9*16+1*15=159
        ld bc,#f782     
        out (c),c       ; PPI port A out / C out 
        ei              
        ret

;Line 	7 	6 	5 	4 	3 	2 	1 	0
;&40 	F Dot 	ENTER 	F3 	F6 	F9 	CUR D 	CUR R 	CUR U
;&41 	F0 	F2 	F1 	F5 	F8 	F7 	COPY 	CUR L
;&42 	CTRL 	\ 	SHIFT 	F4 	] 	RETN 	[ 	CLR
;&43 	. 	/ 	 : 	 ; 	P 	@ 	- 	^
;&44 	, 	M 	K 	L 	I 	O 	9 	0
;&45 	SPACE 	N 	J 	H 	Y 	U 	7 	8
;&46 	V 	B 	F 	G/J2 F1	T/ J2 R	R/ J2 L	5/ J2 D 6/ J2 U
;&47 	X 	C 	D 	S 	W 	E 	3 	4
;&48 	Z 	CAPSLK 	A 	TAB 	Q 	ESC 	2 	1
;&49 	DEL 	J1 F3 	J1 F2 	J1 F 1 	J1 R 	J1 L 	J1 D 	J1 U


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
	;call KeyboardScanner_WaitForKey2
	
;KeyboardScanner_WaitForKey2:
		call KeyboardScanner_ScanForOne
		cp 255
		jr z,KeyboardScanner_WaitForKey
	ret







; Read Controls





Player_ReadControlsClassic:	;if either player presses anything act on it - used for menus etc

	; ixl = Keypress bitmap Player 1
	; ixh = Keypress bitmap Player 2
	; HL Direct pointer to the keymap

	call KeyboardScanner_Read
	call Player_ReadControls2
	ld ixh,a
	jr Player_ReadControls

;	ret



Player_ReadControls2:
	ld hl,KeyMap2
	ld bc,&F991
	jr Player_ReadControlsB
Player_ReadControls:
	; returns
	; ixl = Keypress bitmap Player 
	; HL Direct pointer to the keymap
	ld hl,KeyMap
	ld bc,&F990

Player_ReadControlsB:
	ld a,0 :multiplaysupport_Plus2;in a,(c) ;
	cpl	
push af
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
pop af
	and c


	ld ixl,a
	ld hl,KeyboardScanner_KeyPresses	; This is the location of the real memory to do with as you wish!
ret

