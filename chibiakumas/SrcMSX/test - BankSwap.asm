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

;WRTVDP equ &012D
;VDPSTA equ &0131
;SETPAG equ &013D
;CHPUT  equ &00A2
RSLREG equ &0138
WSLREG equ &013B

RAMAD0 equ	#F341	;Slot address of RAM in page 0 (DOS)
RAMAD1 equ	#F342	;Slot address of RAM in page 1 (DOS)
RAMAD2 equ	#F343	;Slot address of RAM in page 2 (DOS/BASIC)
RAMAD3 equ	#F344	;Slot address of RAM in page 3 (DOS/BASIC)


;RSLREG
;Address   #0138
;Function  Reads the primary slot register
;Output    A  - for the value which was read
;           33221100
;           ||||||- Pagina 0 (#0000-#3FFF)
;           ||||--- Pagina 1 (#4000-#7FFF)
;           ||----- Pagina 2 (#8000-#BFFF)
;           ------- Pagina 3 (#C000-#FFFF)
;Registers A

;WSLREG
;Address   #013B
;Function  Writes value to the primary slot register
;Input     A  - value value to (see RSLREG)




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


	;Remeber out current slot layout
	in a,(&A8)
	ld (SlotRestoreA),a
	ld a,(&FFFF)	
	cpl
	ld (SlotRestoreB),a



ld bc,&0000
	ld a,(RAMAD3)
	call ProcessSlotData
	ld a,(RAMAD2)
	call ProcessSlotData
	ld a,(RAMAD1)
	call ProcessSlotData
	ld a,(RAMAD0)
	call ProcessSlotData


;Address   #0024
;Function  Switches indicated slot at indicated page on perpetual
;Input     A  - ExxxSSPP
;                +-?------ see RDSLT
;           H - Bit 6 and 7 must contain the page number (00-11)


	;100% Ram
	;   %DDCCBBAA
;	ld a,%11111111
;	ld (&FFFF),a
;	ld a,%11111111
	ld a,b
	out (&A8),a
	ld a,c
	ld (&FFFF),a



	ld a,(SlotRestoreA)
	out (&A8),a
	ld a,(SlotRestoreB)
	ld (&FFFF),a




;	halt
	ei


ret
ProcessSlotData:
;Input     A  - ExxxSSPP
	push af
		and %00000011
		rlc b
		rlc b
		or b
		ld b,a
	pop af 
	and %00001100
	rrca
	rrca
	rlc c
	rlc c
	or c
	ld c,a

ret
SlotRestoreA: defb &00
SlotRestoreB: defb &00
FileEnd: