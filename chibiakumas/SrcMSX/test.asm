write "..\RelMSX\disk\msxtest"

; MSX HEADER BLOAD header, before the ORG so that the header isn't counted
	db &FE     ; magic number
	dw FileBegin    ; begin address
	dw FileEnd - 1  ; end address
	dw Execute  ; program execution address (for ,R option)


;WRTVDP (012DH)
  ;Function	writes data in the VDP register
  ;Input	C for the register number, B for data
  ;Output	none
  ;Registers	AF, BC


;VDPSTA (0131H)
  ;Function	reads the VDP register
  ;Input	A for the register number (0 to 9)
  ;Output	A for data
  ;Registers	F


;SETPAG (013DH)
  ;Function	switches the page
  ;Input	DPPAGE (FAF5H) for the display page number
		;ACPAGE (FAF6H) for the active page number
  ;Output	none
  ;Registers	AF


; Compilation address, somewhere out of the way of small basic programs
	org &C000
FileBegin:

; Program code entry point
Execute:



ld hl,Introduction
	call PrintString


	ld hl,Message
	call PrintString


	call WaitChar
	cp 'A'
	call nc,ShowHex

	ld a,13
	call PrintChar

ld bc,0
ret

	PrintChar equ &00A2
	WaitChar equ &009F

ShowHex:
	ld b,16
	call MathDiv
	push af
		ld a,c
		call PrintHexChar

	pop af	;get back the remainder

	ld b,1
	call MathDiv
	ld a,c
	call PrintHexChar
ret

PrintHexChar:
	cp 10
	jr c,PrintHexCharNotAtoF
	add 7
PrintHexCharNotAtoF:
	add 48
	jp PrintChar

MathDiv: ;divide A by B , result in C, remainder in A

	cp 0		
	ret z
	ld c,0			
MathDivAgain:
	sub b			
	inc c	
	jp nc,MathDivAgain				
	add b			;Add B again, so the valid remainder is in A
	dec c					
ret

Introduction:
	db 'Thought of the day...',255
Message:
ifdef ThinkPositive
	db 'Z80 is Awesome!',255
else
	db '6510 sucks!',255
endif

PrintString:
	ld a,(hl)
	cp 255
	ret z
	inc hl
	call PrintChar
jr PrintString


FileEnd: