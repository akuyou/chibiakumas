write "spectest"
checksum reset
defb "PLUS3DOS"
StackPointerAlt equ &8500 ;need a stackpointer below &C000

defb &1a
defb &01
defb &00
defw EOF-SOF+128,&0000	;LOF

defb &03	     ;basic header
defw EOF-SOF
defb &00,&80,&00,&80 ; Basic Header

; all zeros
defb &00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00
defb checksum("")

org &8000
SOF:
push bc
	push hl
		push af	
			ld b,10
			ld c,10
			call GetMemPos
			ld (hl),128

			ld b,170
nxtlp:
			push bc
				call GetNxtLin
				ld (hl),b
			pop bc
			djnz nxtlp
		pop af
	pop hl


pop bc
di
halt
ret
	
   
GetNxtLin:
;0 1 0 Y7 Y6 Y2	Y1 Y0	 Y5 Y4 Y3 X4 X3 X2 X1 X0
	ld a,h
	and %00000111
	cp  %00000111
	jp z,GetNxtLinB
	inc h
ret


GetNxtLinB:
	ld a,l
	and %11100000
	cp  %11100000
	jp z,GetNxtLinC
	ld a,h
	and %11111000
	ld h,a
	ld a,l
	add %00100000
	ld l,a
ret
GetNxtLinC:
	ld a,h
	add %00001000
	and %11111000
	ld h,a
	ld a,l
	and %00011111
	ld l,a
ret


GetMemPos:
; Get screen address
; B = Y pixel position
; C = X pixel position
; Returns address in HL

        LD A,B                                 ; Calculate Y2,Y1,Y0
        AND %00000111                          ; Mask out unwanted bits
        OR %01000000                           ; Set base address of screen
        LD H,A                                 ; Store in H
        LD A,B                                 ; Calculate Y7,Y6
        RRA                                    ; Shift to position
        RRA
        RRA
        AND %00011000                          ; Mask out unwanted bits
        OR H                                   ; OR with Y2,Y1,Y0
        LD H,A                                 ; Store in H
        LD A,B                                 ; Calculate Y5,Y4,Y3
        RLA                                    ; Shift to position
        RLA
        AND %11100000                          ;Mask out unwanted bits
        LD L,A                                 ; Store in L
        LD A,C                                 ; Calculate X4,X3,X2,X1,X0
        RRA                                    ; Shift into position
        RRA
        RRA
        AND %00011111                          ; Mask out unwanted bits
        OR L                                   ; OR with Y5,Y4,Y3
        LD L,A                                 ; Store in L
        RET


align 128

EOF:
;save "spectest",&8000,EOF-&8000