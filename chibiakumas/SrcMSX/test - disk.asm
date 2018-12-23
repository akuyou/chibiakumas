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







	;100% Ram
	;   %DDCCBBAA
;	ld a,%00000000
;	ld (&FFFF),a

;	ld a,%11111111
;	out (&A8),a

	;Remeber out current slot layout
	in a,(&A8)
	ld (SlotRestoreA),a
	ld a,(&FFFF)	
	cpl
	ld (SlotRestoreB),a


	ld de,&1000
	ld hl,filename
	call LoadFile
	halt



	;Restore Basic Layout
	;   %DDCCBBAA
;	ld a,%00001000
;	ld (&FFFF),a
;	ld a,%11110000
;	out (&A8),a



;	halt
	ei


ret

LoadFile:
	ld (FileDestination_Plus2-2),de
	ld de,FNAME
	ld bc,8+3
	ldir

DBASIC	EQU &F37D
FOPEN	EQU &0F
FCLOSE	EQU &10
CREATE	EQU &16
BLWRITE	EQU &26
BLREAD	EQU &27
SETDMA	EQU &1A

code_start:
; set the reading buffer addr
		ld	de,blheader
		ld	c,SETDMA
		call	DBASIC
		
; open file
		call	clearfcb
		ld	de,FCB
		ld	c,FOPEN
		call	DBASIC
		and	a
		jr	nz,diskerr
		
; read the bload header
		call	resetfcb
		ld	hl,7
		ld	de,FCB
		ld	c,BLREAD
		call	DBASIC
		and	a
		jr	nz,diskerr
		
		ld	a,(signature)
		cp	&FE	; is it a bload file?
		jr	nz,diskerr

; starting address of the bl block
;		ld	de,(blstart)
		ld	de,DiskTemp
		ld	c,SETDMA
		call	DBASIC

; calculate length in bytes
;		ld	de,(blstart)
;		ld	hl,(blend)
;		and	a
;		sbc	hl,de
;		inc	hl
		
; load the data block
LoadAgain:
		ld	de,FCB
		ld	c,BLREAD
		ld 	hl,128
		call	DBASIC
		ld a,l
		push af


			di
			;100% Ram
			;   %DDCCBBAA
			ld a,%11111111
			out (&A8),a
			ld a,%11111111
			ld (&FFFF),a


			ld bc,128
			ld hl,DiskTemp
			ld de,&0000:FileDestination_Plus2
			ldir
			ld (FileDestination_Plus2-2),de

			ld a,(SlotRestoreA)
			out (&A8),a
			ld a,(SlotRestoreB)
			ld (&FFFF),a
			ei
		pop af
		cp 128
		jp z,LoadAgain

;Function	27H
;Setup		DE register <-- starting address of opened FCB
;		FCB record size <-- record size to be read
;		FCB random record <-- record to start reading
;		HL register <-- number of records to be read
;Return value	00H is set in the A register when data is read successfully;
;		otherwise 01H is read. The number of records actually read
;		is set back in the HL register. When this number is almost
;		one, the data which has been read is set in the area
;		indicated by DMA.
;After readout, the random record field is automatically updated. After 
;executing this system call, the total number of records actually read is set 
;in the HL register. That is, if the end of file is reached before the 
;specified number of records have been read, the actual number of records read 
;will be returned in the HL register.	


		and	a
		jr	nz,diskerr
		
		; OK!
		ret
		
diskerr:
; handle the error somehow
		or a
		or a
		or a

		ret

clearfcb:
		ld	bc,24
		ld	hl,FCBEND
		ld	de,FCBEND+1
		ld	(hl),0
		ldir
		ret

; Set record size, and reset the current record no
; This must be called after the OPEN!
resetfcb:
; record size 1 byte
		ld	hl,1
		ld	(FCB+14),hl
; reset current record
		ld	hl,0
		ld	(FCB+33),hl
		ld	(FCB+35),hl
		ret

blheader:
signature:	defb	0
blstart:	defw	0
blend:		defw	0
blrun:		defw	0
	
FCB:	defb	0
	;        12345678ABC
FNAME:	defb	"           "	
FCB_CurrentBlock: defw &0000
FCB_RecordSize: defw &0000
FCB_FileSize: 	defw &0000
		defw &0000
FCB_DATE:	defw &0000
FCB_Time:	defw &0000
FCB_DeviceID:	defb &00
FCB_DirectoryLoc:	defb &00
FCB_TopCluster:	defw &0000
FCB_LastCluster:defw &0000
FCB_RelCluster:defw &0000
FCB_CurrentRec:defb &00
FCB_RandomRecord:defw &0000
		 defw &0000
FCBEND:	



filename: db "MSXTEST    "	

DiskTemp:Defs 128

SlotRestoreA: defb &00
SlotRestoreB: defb &00


FileEnd: