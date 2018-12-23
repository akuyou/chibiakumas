
SetObjectcheck:
	ldia
	ld a,h
	cp &69
	ret nz		;stay if not on screen yet
	pop af		;steal a return!
	ret

SetObjectProgram:
	call SetObjectcheck
	push hl
	set 6,l;inc h;	add hl,de 	;spr
	jr SetObjectH2


;ret
; YYYYYXXXXMMMMSSS LLLLPPPRRRAAAA


SetObjectLife:;
	call SetObjectcheck
	push hl
	set 6,l;inc h;	add hl,de 	;spr
	jr SetObjectH3

SetObjectY:;
	call SetObjectcheck
	push hl
	jr SetObjectH0



SetObjectMove:;
	call SetObjectcheck
	push hl
	jr SetObjectH2

SetObjectAnimator:;
	call SetObjectcheck
	push hl
	set 6,l
	jr SetObjectH0

SetObjectSprite:
	call SetObjectcheck
	push hl
SetObjectH3:
	inc h;	add hl,de 	
SetObjectH2:
	inc h;	add hl,de 	
SetObjectH1:
	inc h;	add hl,de 	
SetObjectH0:
SetObjectFound:
	ldai
	ld (hl),a
	pop hl
ret
