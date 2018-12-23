
BuildENT equ 1
read "..\Aku\CoreDefs.asm"

write "..\BldEnt\disk"
;write "..\BldEnt\boot"
MODE_VID  equ 22
COLR_VID  equ 23
X_SIZ_VID equ 24
Y_SIZ_VID equ 25


ORG &37F0
	DB 0,5		;type 5 = machine code application program
	DW FileEnd-FileStart	;16 bit lenght
	DB 0,0,0,0,0,0,0,0,0,0,0,0 ;not used bytes
; org &0100
FileStart:
di
	LD SP,&100	;set the User Stack, 164 bytes free
	ld hl,&100
	ld de,&3800
	ld bc,FileEnd-FileStart
	ldir
	jp ActualStart

ActualStart:



	ld a,&0C
	out (&BF),a

	;we want 2 screenbuffers
	call BankSwitch_RequestVidBank
	ld a,c
	push af
	call BankSwitch_RequestVidBank
	pop af
	ld b,a
	push bc

	
	;We want 4 general banks (excluding F8
	ld a,4
GetMoreMem:
	push af
		 rst 6
		db 24		;get a free segment
		jp nz,MemFail
	pop af
	dec a
	jr nz,GetMoreMem




	ld a,Akuyou_BootStrap_Bank
	ld de,Akuyou_BootStrapStart
	ld hl,BootStrapFile
	call DiskDriver_LoadDirect
	jr nc,DiskFail	


	;System memory will be at &3800 now!
	in a,(&B0)
;;	ld a,&F8
	ld de,&500
	ld hl,CoreFile
	call DiskDriver_LoadDirect
	jr nc,DiskFail






	ld a,&FD
	OUT (&B3),A



        LD HL,LPT	;Line Parameter Table
        LD DE,&FF00	;copy to
        LD BC,LPTH	;the end of video
        LDIR		;segment



	ld hl,&7F00

 		LD B,4		;4 bit rotate
LPTA:           SRL H
                RR L
                DJNZ LPTA
                LD A,L		;low byte
                OUT (&82),A	;send to Nick
                LD A,H		;high 4 bits
                OR &C0		;enable Nick running
				;switch to the new LPT
				;at the end of current frame
                OUT (&83),A	;send to Nick
	




	ld a,Akuyou_BootStrap_Bank
	out (&B2),a

	ld a,&FC
	OUT (&B1),A

	ld bc,&2500
	ld de,&4000
	ld hl,&8000
	ldir		


	ld a,&FC
	OUT (&B2),A

	ld a,&FD
	OUT (&B3),A


list
;	Akuyou_BootStrap_Bank equ &FD
;	Akuyou_BootStrapStart equ &8000
	jp Akuyou_BootStrapStart
DiskFail:
	call cls
	call TextInit
	ld hl,DiskFailMsg
	call PrintString
	di 
	halt
DiskFailMsg:	defb "File Load Error",255

MemFail:
        rst 6 
	db 25		;free non video segments
	call cls
	call TextInit
	ld hl,MemFailMsg
	call PrintString
	di 
	halt
MemFailMsg:	defb "Your Enterprise is too CHIBI!!!",13,10,"128K required!",255

null:
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Cls:
	ld a,10
	ld bc,2
	ld de,ENT_CLS_Command
	call ENT_WriteBlock
ret
ENT_CLS_Command: db &1B,&1A ; ESC ^Z - clear screen command
ENT_WriteBlock:	;A=Channel ; BC = number of bytes ; DE=Source string 
	rst 6
	db 8
ret

TextInit:
	ld c,22			;MODE_VID
	ld d,0			;Set text mode
	call ENT_Writevar

	ld c,23			;COLR_VID
	ld d,0			;Set 2 color
	call ENT_Writevar


	ld c,24			;X_SIZ_VID
	ld d,40			; 40 Chars Wide
	call ENT_Writevar

	ld c,25			;Y_SIZ_VID
	ld d,24			;24 chars tall
	call ENT_Writevar

	ld de,ENT_Screenname
	ld a,10			;Open Screen as stream 10
	call ENT_OpenStream


	ld a,10	; A channel number (1..255)
	ld b,1	; B @@DISP (=1) (special function code)
	ld c,1	; C 1st row in page to display (1..size)
	ld d,24  ; D number of rows to display (1..27)
	ld e,1  ; E row on screen where first row should appear (1..27)
	call ENT_SpecialFunc

ret
ENT_Writevar:		;WriteVar C=D to Enterprise OS
	ld b,1
	rst 6
	db 16
ret

ENT_OpenStream:
	;Open stream A from device string DE 
	;DE should point to a string like...  db 6,'VIDEO;'  or db 9,'KEYBOARD;' (replace ; with a colon)
	rst 6
	db 1 	;open stream
ret

ENT_SpecialFunc:	;Special Function (for displaying screen)
	rst 6
	db 11
ret
ENT_Screenname: db 6,'VIDEO:'

PrintString:
	push de
	push bc
PrintStringAgain:
		ld a,(hl)	;Print a 255 terminated character to screen
		cp 255
		jr z,PrintStringDone
		inc hl
		ld b,a
		ld a,10	;Screen is channel 10
		rst 6
		db 7 	;write to channel a
		jr PrintStringAgain
PrintStringDone:
	pop bc
	pop de
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


   	;  	     123456789012
BootStrapFile:db 12,"BootStrp.aku"
CoreFile:     db 08,"Core.aku"



read "..\SrcEnt\ENT_V1_DiskDriver.asm"


BankSwitch_RequestBank:
	rst 6	;Segment please!
	db 24
	ld a,c
ret

BankSwitch_RequestVidBank:
	        LD HL,BankReqTemp;puffer area
                LD (HL),0	;start of the list
GETS:           rst 6
		db 24		;get a free segment
                RET NZ		;if error then return
                LD A,C		;segment number
                CP &FC		;<0FCh?, no video segment?
                JR NC,ENDGET	;exit cycle if video
                INC HL		;next puffer address
                LD (HL),C	;store segment number
                JR GETS		;get next segment
ENDGET          PUSH BC		;store segment number
FREES           LD C,(HL)	;deallocate onwanted
f
                rst 6 
		db 25		;free non video segments

                DEC HL		;previoud puffer address
                JR Z,FREES	;continue deallocating
				;when call the EXOS 25 function with
				;c=0 which is stored at the start of
				;list, then got a error, flag is NZ
                POP BC		;get back the video segment number
                XOR A		;Z = no error

                RET		;return












	;NICK Line Parameter Table (LPT)

LPT:         ;200 lines.... Two's complement of the number of scanlines in this mode line. Zero means 256 scanlines. 
;           DB &32  ;0 01 1 001 0
		    ;I CC R MMM L
                    ;I   VINT=0, no IRQ
                    ;CC  Colour Mode=01, 4 colours mode (2/4/16/256)
                    ;R   VRES=1, full vertical resolution (full/half)
                    ;MMM Video Mode=001, pixel graphics mode
                    ;L   Reload=0, LPT will continue
	   ;ICCRMMML
   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
VIDADR1:   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

   DB -25
   db %00110010;	db %01010010 16 color ver
   DB 11   ;left margin=15
   DB 51   ;right margin=47
   DW &4000    ;primary video address, address of pixel data
   DW 0    ;secondary vide・address, not used in pixel graphics mode
   DB 0,0,0,0,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 



	;  -lines,;ICCRMMML,LM,RM,
;	db -100  ,%00110010,11,51
;	dw 80*100+&0000

;	dw &0000
;	;   grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr
;	db %11100000,%00011100,%11100000,%00011100,%00000000,%00000000,%00000000,%00000000


            DB -50,&12,63,0,0,0,0,0,0,0,0,0,0,0,0,0
               ;50 lines of border, this is the bottom margin,
            DB -3,16,63,0,0,0,0,0,0,0,0,0,0,0,0,0
               ;3 black lines, syncronization off
            DB -4,16,6,63,0,0,0,0,0,0,0,0,0,0,0,0
               ;4 lines, syncronization on
            DB -1,&90,63,32,0,0,0,0,0,0,0,0,0,0,0,0
               ;1 line, syncronization will switch off at half of line
               ;the NICK chip generate video IRQ at this line
            DB 252,&12,6,63,0,0,0,0,0,0,0,0,0,0,0,0
               ;4 black lines
            DB -50,&13,63,0,0,0,0,0,0,0,0,0,0,0,0,0
               ;50 lines of border, this is the top margin,


LPTEnd:              
LPTH equ LPTEnd-LPT ;length of LPT

BankReqTemp:
		ds 64








FileEnd:

write "..\BldEnt\start"
incbin "..\BldEnt\disk"