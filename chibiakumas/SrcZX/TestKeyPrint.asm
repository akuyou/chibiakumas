write "..\BldZX\spectest.bin"
org &8000
FileStart:


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


WaitChar:
	push hl
	push af
;	push bc
		ld a,0
		call &1601
	pop af
	call &15D4
;	pop bc
	pop hl
ret
PrintChar:
	push hl
;	push bc
	push af
		ld a,2
		call &1601
	pop af
	call &0010
;	pop bc
	pop hl
ret
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
