write "..\spectest"
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
	
   	push af
	push bc
	push de
	push hl

		ld (SPRestore_Plus2-2),sp
		ld sp,StackPointerAlt
		
	        ld   a,7
	        call PageIn

	;	CALL &0100    ;DOS_INITIALISE

		ld b,1 ;	B = File number 0...15
		ld c,5;		C = Access mode required
		ld d,0;	D = Create action
		ld e,1;	E = Open action
		ld hl,TestFileName ;	HL = Address of filename (no wildcards FF term)
		call &0106    ;DOS_OPEN
		jr   nc,Error

	ld b,1;B = File number
	call &010F ;DOS REF HEAD
	ld e,(IX+1)
	ld d,(IX+2) ;get file size

	ld b,1;B = File number
	ld c,7;C = Page for C000h (49152)...FFFFh (65535)
	;ld DE,16 ; Number of bytes to read (0 means 64K)
	ld HL, &9000; Address for bytes to be read
	call &0112 ;DOS_READ
	ld b,1
	call &0109 ;DOS CLOSE



	call PageOut
        ld   iy,&5C3A   ;restore ERR_NR
	ld sp,&0000 :SPRestore_Plus2

	pop hl
	pop de
	pop bc
   	pop af

	ret

PageIn: di
        ld   c,a
        ld   a,(&5b5c)  ;BANKM (23388)
        and  %11101000
        or   c
        ld   (&5b5c),a
        ld   bc,&7ffd   ;32765
        out  (c),a
        ei
        reti

PageOut:di
        ld   a,(&5b5c)  ;BANKM (23388)
        set  4,a
        and  %11111000
        ld   (&5b5c),a
        ld   bc,&7ffd   ;32765
        out  (c),a
        ei
        reti

Error:
di
halt

defb &00
defb &00
defb &00
defb &00


TestFileName:
defb 'SPECTEST'
defb &ff
align 128

EOF:
;save "spectest",&8000,EOF-&8000