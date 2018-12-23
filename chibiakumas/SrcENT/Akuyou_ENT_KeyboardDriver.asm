
; --------------------------------------------------------------------------------------------
;***************************************************************************************************

;			 Keyboard Reader

;***************************************************************************************************
;--------------------------------------------------------------------------------------------


; Don't ask me how this works - someone smarter than me wrote it!


;KeyboardScanner_Flush equ &BB03


;map with 10*8 = 80 key status bits (bit=0 key is pressed)


KeyboardScanner_Read:
di
	ld hl,KeyboardScanner_KeyPresses
;lets read the keyboard!
	ld b,0
	ld c,&B5
keynextline:
	out	(c),b
	in	a,(c)		;read row into A
	ld (hl),a
	inc hl
	inc b
	ld a,b
	cp 10
	jp nz,keynextline

;ret KeyboardScanner_NoJoy_Plus1

	ld b,0
keynextlineJoy2:
	ld c,0
keynextlineJoyFire:
	ld a,b
	out	(&B5),a
	in	a,(&B6)		;read row into A
	rr a			;Read 3 fires
	rl c	
	rr a
	rl c	
	rr a
	rl c	
	inc b

keynextlineJoy:
	ld a,b
	out	(&B5),a
	in	a,(&B6)		;read row into A
	rr a			;Read a joy button
	rl c	
	inc b
	ld a,b
	cp 5
	jr z,keynextJoy
	cp 10
	jr nz,keynextlineJoy
keynextJoy:
	ld a,c
	or %10000000
	ld (hl),a
	inc hl 
	ld a,b
	cp 10
	jr c,keynextlineJoy2

	ei
ret






 ;EP keyboard matrix &B5

 ;        b7    b6    b5    b4    b3    b2    b1    b0
 ;Row    80H   40H   20H   10H   08H   04H   02H   01H
 ; 0   L.SH.     Z     X     V     C     B     \     N
 ; 1    CTRL     A     S     F     D     G  LOCK     H
 ; 2     TAB     W     E     T     R     Y     Q     U
 ; 3     ESC     2     3     5     4     6     1     7
 ; 4      F1    F2    F7    F5    F6    F3    F8    F4
 ; 5         ERASE     ^     0     -     9           8
 ; 6             ]     colon L     ;     K           J
 ; 7     ALT ENTER   LEFT  HOLD   UP   RIGHT DOWN  STOP
 ; 8     INS SPACE R.SH.     .     /     ,   DEL     M
 ; 9                   [     P     @     0           I


;B6						    
;0 Joy1 Fire
;1 Joy1 UP
;2 Joy1 Down
;3 Joy1 Left
;4 Joy1 Right
;5 Joy2 Fire
;6 Joy2 Up
;7 Joy2 Down
;8 Joy2 Left
;9 Joy2 Right


KeyboardScanner_ScanForOne:
	call KeyboardScanner_Read

	ld b,12
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

