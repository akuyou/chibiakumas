write "..\RelEnt\Test.com"
MODE_VID  equ 22
COLR_VID  equ 23
X_SIZ_VID equ 24
Y_SIZ_VID equ 25


ORG &00F0
	DB 0,5		;type 5 = machine code application program
	DW FileEnd-FileStart	;16 bit lenght
	DB 0,0,0,0,0,0,0,0,0,0,0,0 ;not used bytes
; org &0100
FileStart:
di
	LD SP,&100	;set the User Stack, 164 bytes free
ei

	ld c,MODE_VID
	ld d,0
	call Writevar

	ld c,COLR_VID
	ld d,0
	call Writevar


	ld c,X_SIZ_VID
	ld d,40
	call Writevar

	ld c,Y_SIZ_VID
	ld d,24
	call Writevar



	ld de,Screenname
	ld a,10
	;rst 6
	;db 1 	;open stream
	call OpenStream


	ld a,10	; A channel number (1..255)
	ld b,1	; B @@DISP (=1) (special function code)
	ld c,1	; C 1st row in page to display (1..size)
	ld d,24  ; D number of rows to display (1..27)
	ld e,1  ; E row on screen where first row should appear (1..27)
	call SpecialFunc

	ld de,Keboardname
	ld a,11
	call OpenStream
	;rst 6
	;db 1 	;open stream


reread:


call Player_ReadControlsClassic

	ld a,ixl ;= Keypress bitmap Player 1
call ShowHex
	ld a,ixh ;= Keypress bitmap Player 2
call ShowHex
call NewLine
	jp reread

ret
Screenname: db 6,'VIDEO:'
Keboardname: db 9,'KEYBOARD:'

OpenStream:
	;Open stream A from device string DE 
	;DE should point to a string like...  db 6,'VIDEO;'  or db 9,'KEYBOARD;' (replace ; with a colon)
	rst 6
	db 1 	;open stream
ret







WaitChar:
	push de
	push hl
	push bc
		ld a,11
		rst 6
		db 5 	;read from channel - result in b
		ld a,b
	pop bc
	pop hl
	pop de
ret
PrintChar:
	push de
	push hl
	push bc
		ld b,a
		ld a,10
		rst 6
		db 7 	;write to channel a
	pop bc
	pop hl
	pop de
ret

NewLine:
	ld a,13
	call PrintChar
	ld a,10
	call PrintChar
ret






readvar:		;readvar C
	ld b,0
	rst 6
	db 16
ret

Writevar:		;WriteVar C=D
	ld b,1
	rst 6
	db 16
ret
SpecialFunc:
	rst 6
	db 11
ret




ShowHex:			
	ld b,16				;Divide A by 16 - this gives our first Hex digit
	call MathDiv
	push af
		ld a,c			;put our result in A
		call PrintHexChar	;Call our HEX printer

	pop af	;get back the remainder
	call PrintHexChar		;Print it
ret

PrintHexChar:
	cp 10				;If we're less then 10, add Ascii '0' to it (48) to print a Digit
	jr c,PrintHexCharNotAtoF
					;Our digit is 10 or above so we need to print an Ascii letter 
	add 7				;A-F, so add another 7
PrintHexCharNotAtoF:
	add 48				;Add 48 (character '0')
	jp PrintChar			;print it

MathDiv: 		;divide A by B , result in C, remainder in A
	ld c,0		;Our result will be in C
	cp 0		
	ret z		;Return if dividing by zero

MathDivAgain:
	sub b			;Subtract one B
	inc c			;increase our result
	jp nc,MathDivAgain	;Repeat if we're not below zero	

	add b			;we went too far, so Add B again, so the valid remainder is in A
	dec c			;we went too far, so subtract 
ret

read "Akuyou_Enterprise_KeyboardDriver.asm"

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
	defb %11111111,&0A ;Pause bit 20
	defb %10111111,&0A ;Fire3	19
	defb %11011111,&0A ;Fire2L
	defb %11101111,&0A ;Fire1R
	defb %11110111,&0A ;Right	16
	defb %11111011,&0A ;Left	15
	defb %11111101,&0A ;Down	14
	defb %11111110,&0A ;Up	13
align 16
	KeyboardScanner_KeyPresses  ds 11 ;Player1
FileEnd:



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
; 10     	F3    F2    F1     U     D    L      R
; 11     	F3    F2    F1     U     D    L      R
 
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