write "disk\msxtest"

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

WRTVDP equ &012D
VDPSTA equ &0131
SETPAG equ &013D

CHPUT  equ &00A2
GRPPRT equ &0089
POSIT  equ &00C6

; Compilation address, somewhere out of the way of small basic programs
	org &C000
FileBegin:

; Program code entry point
Execute:





;Primary slot select register

;The 64k of MSX main memory is divided into four blocks of 16k, referred to as pages. 
;This register controls which primary slot will be mapped to each page of memory.
;PPI-register A (#A8)
;Memory Mapper registers

;The Z80 used in the MSX has 64k of addressable memory. To be able to use more memory,
;memory mappers are used in MSX2 computers and above. A memory mapper divides the 64k 
;of RAM into four 16k blocks called pages, into which up to 256 different memory segments 
;can be mapped. Note that these segments are shared ? it is possible to map a segment used 
;in page 0 into page 1 as well.

;Port range 		Description
;#FC (write) 	Mapper segment for page 0 (#0000-#3FFF)
;#FD (write) 	Mapper segment for page 1 (#4000-#7FFF)
;#FE (write) 	Mapper segment for page 2 (#8000-#BFFF)
;#FF (write) 	Mapper segment for page 3 (#C000-#FFFF)

	di

keyagain:
	ld h,5 ;x
	ld l,1 ;y
	call POSIT
	

;lets read the keyboard!
	ld b,10
keynextline:
	in	a,(#AA)
	and	#F0		;only change bits 0-3
	or	b		;take row number from B
	out	(#AA),a
	in	a,(#A9)		;read row into A
	call CHPUT;GRPPRT
	djnz keynextline

;lets read the joystick too!
	ld b,2
joynextjoy:
	ld	a, 15	; Lee el puerto de joystick y almacena
	out	(&A0), a	; los estados en las variables.
	in	a, (&A2)
	and	128
	ld c,a

	ld a,b
	dec a 	;1/0
	rrca
	rrca	;64/0
	add 15
	or c

;	or	0  *64+15  ;Joyport	
	out	(&A1), a
	ld	a, 14
	out	(&A0), a

	in	a, (&A2) ;read left right up down and button 1 and 2
	call CHPUT;GRPPRT
	djnz joynextjoy



	jp keyagain



	ei


ret





FileEnd: