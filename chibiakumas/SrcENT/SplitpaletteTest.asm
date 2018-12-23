write "..\BldEnt\Test.com"
ORG &00F0
	DB 0,5		;type 5 = machine code application program
	DW FileEnd-FileStart	;16 bit lenght
	DB 0,0,0,0,0,0,0,0,0,0,0,0 ;not used bytes
; org &0100
FileStart:
   LD SP,&100	;set the User Stack, 164 bytes free
				;EXOS use own system stack
				;When EXOS called or EXOS IRQ routine runing
				;only 8 bytes required in the User Stack
                LD HL,EXIT
                LD (&BFF8),HL	;set the EXOS Warm ReStart address

				;this routine run whne the rest button pressed once
				;Now we use same routine as the "exit on error"
				;The EXIT ruotine release the allocated memory and
				;properly exit to ENTERPRISE logo.
				;With this way the program exit properly when the reset
				;pressed, no data loss (RAMDISK, System settings, loaded extensions, etc)
				;because no cold restart.

                LD A,12		;disable
                OUT (191),A	;memory wait states
		
		;setting the Border color to black

                LD BC,&100+27	;B=1 write
				;C=27 number of system variable (BORDER)	
                LD D,0		;new value
                rst 6
		db 16		;handling EXOS variable

                CALL VID	;get a free Video segment
                JP NZ,EXIT	;if not available then exit
                LD A,C		;store
                LD (VIDS),A	;segment number
		OUT (&B3),A	;paging to the page 3.

		
                LD DE,0		;segment number low
                RRA		;two bits
                RR D		;will be the
                RRA		;top two bits
                RR D		;of the video address
                LD (VIDADR1),DE ;this is the start of
				;pixel data in the video memory


		LD HL,&3F00	;after the pixel bytes
		ADD HL,DE	;starting the
		LD (LPTADR),HL	;Line Parameter Table (LPT)
		rst 6
			db 24		;get a free segment
		JP NZ,EXIT	;if not available then exit
                LD A,C		;store
                LD (P1S),A	;segment number
                OUT (&B1),A	;paging to the page 1.
                rst 6
			db 24		;get a free segment
		JP NZ,EXIT	;if not available then exit
                LD A,C		;store
                LD (P2S),A	;segment number
                OUT (&B2),A	;paging to the page 2.

		LD HL,&4000	;zero fill
		LD DE,&4001	;all
		LD (HL),h	;alocated
		LD BC,&BFFF	;memory
		LDIR

                LD HL,LPT	;Line Parameter Table
                LD DE,&FF00	;copy to
                LD BC,LPTH	;the end of video
                LDIR		;segment
		
                LD HL,(LPTADR)	;LPT video address
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
	
	;memory allocated, and 320x200 4 color display is ready

	;there is the room for the main program


	ld hl,&c000+80
	ld bc,150
	ld de,80
FillAgain:
	ld (hl),255
	add hl,de
	dec bc
	ld a,b
	or c
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	jr nz,FillAgain










	;wait for SPACE key
                DI
                LD A,8		;number of Space row
                OUT (&B5),A	;select at the keyboard matrix
SPACE           IN A,(&B5)	;read the selected row from matrix
                BIT 6,A		;SPACE pressed?
                JR NZ,SPACE	;continue waiting if no
                JP EXIT		;go to EXIT

 ;EP keyboard matrix:
 ;        b7    b6    b5    b4    b3    b2    b1    b0
 ;Row    80H   40H   20H   10H   08H   04H   02H   01H
 ; 0   L.SH.     Z     X     V     C     B     \     N
 ; 1    CTRL     A     S     F     D     G  LOCK     H
 ; 2     TAB     W     E     T     R     Y     Q     U
 ; 3     ESC     2     3     5     4     6     1     7
 ; 4      F1    F2    F7    F5    F6    F3    F8    F4
 ; 5         ERASE     ^     0     -     9           8
 ; 6             ]     :     L     ;     K           J
 ; 7     ALT ENTER   LEFT  HOLD   UP   RIGHT DOWN  STOP
 ; 8     INS SPACE R.SH.     .     /     ,   DEL     M
 ; 9                   [     P     @     0           I

	;EXIT routine at error or reset

EXIT:           DI
                LD SP,&100	;set User Stack
                LD A,255	;system segment
                OUT (&B2),A	;to page 2.
                LD HL,EXIT
                LD (&BFF8),HL	;set Warm ReStart address
                LD HL,(&BFF4)	;EXOS LPT address
                SET 6,H		;convert to video address
                LD B,4		;rotate with 4 bits
ELPT:           SRL H
                RR L
                DJNZ ELPT
                LD A,L		;low byte
                OUT (&82),A	;send to Nick
                LD A,H		;high 4 bits
                OR &C0		;enable Nick running
				;switch to the new LPT
				;at the end of current frame
                OUT (&83),A	;send to Nick
                LD A,&F5	;restore original
                LD HL,&1837	;EXOS IRQ routine
                LD (&38),A	;starting
                LD (&39),HL	;
				;If we make a own IRQ
				;routine with placing
				;JP instruction to 38h
                
                LD C,&40	;reset code=40 Deallocate all User RAM
                rst 6
			db 0		;EXOS reset
                LD A,1		;ROM 1.
                OUT (&B3),A	;to page 3.
                LD A,6		;6. function= Enterprise logo screen
                JP &C00D	;exit to ROM

	;video segment allocating routine

VID:            LD HL,FileEnd	;puffer area
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
                rst 6 
			db 25		;non video segments
                DEC HL		;previoud puffer address
                JR Z,FREES	;continue deallocating
				;when call the EXOS 25 function with
				;c=0 which is stored at the start of
				;list, then got a error, flag is NZ
                POP BC		;get back the video segment number
                XOR A		;Z = no error

                RET		;return

	;variables for storing allocated memory

VIDS            DB 0
P1S             DB 0
P2S             DB 0
LPTADR          DW 0

	;NICK Line Parameter Table (LPT)

LPT:        DB -100 ;200 lines.... Two's complement of the number of scanlines in this mode line. Zero means 256 scanlines. 
            DB &32  ;0 01 1 001 0
		    ;I CC R MMM L
                    ;I   VINT=0, no IRQ
                    ;CC  Colour Mode=01, 4 colours mode (2/4/16/256)
                    ;R   VRES=1, full vertical resolution (full/half)
                    ;MMM Video Mode=001, pixel graphics mode
                    ;L   Reload=0, LPT will continue
            DB 11   ;left margin=11
            DB 51   ;right margin=51
VIDADR1:    DW 0    ;primary video address, address of pixel data
            DW 0    ;secondary videEaddress, not used in pixel graphics mode
PALETTE:    DB 0,36,219,73,0,0,0,0 ;black, blue, yellow, red (not used colour are black)  g0 | r0 | b0 | g1 | r1 | b1 | g2 | r2 | - x0 = lsb 

	;  -lines,;ICCRMMML,LM,RM,
	db -100  ,%00110010,11,51
	dw 80*100+&0000

	dw &0000
	;   grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr, grbgrbbr
	db %11100000,%00011100,%11100000,%00011100,%00000000,%00000000,%00000000,%00000000


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


FileEnd:
