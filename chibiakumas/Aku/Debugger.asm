Debug_NeedEXX:
	push af
		ld a,0 :Debug_NeedEXXflag_Plus1
		or a
		jp nz,Debug_NeedEXX_Error
		inc a
		ld (Debug_NeedEXXflag_Plus1-1),a
	pop af
	ret
Debug_NeedEXX_Error:
	pop af
	ld a,&5F
	jp ErrorMsg

;Declare we need the shadowRegs
Debug_ReleaseEXX:
	push af
		xor a
		ld (Debug_NeedEXXflag_Plus1-1),a
	pop af
	ret


 ;return if Interrupts disabled
Debug_ObsoleteCode:
	ld a,&4E
	jr ErrorMsg

Debug_CheckIntOff:
	ld a,i
	ret po 
	ld a,&4C
	jr ErrorMsg
Debug_CheckIntOn:
	ei
	ld a,i
	ret PE ;return if Interrupts Enabled
	ld a,&4F
	jr ErrorMsg

ErrorMsg:
	push bc
 	ld bc,&7f00 + %00010000
	out (C),c
 	ld c,&5c	;border
	out (C),a

 	ld c,&00
	out (C),c
 	ld c,&5c	;middle
	out (C),a
	pop bc
di
halt
ret