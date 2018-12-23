write "..\BldEnt\Test.com"
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
	ld a,11
	call ReadChar
;	ld a,b
;	cp 128
;	jr nc,reread
;	cp 31
;	jr c,reread
again: 
	ld a,10
;	ld b,a ;what to show
	call WriteChar
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
ReadChar:
	rst 6
	db 5 	;read from channel - result in b
ret
WriteChar:
	rst 6
	db 7 	;write to channel a
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

FileEnd:
