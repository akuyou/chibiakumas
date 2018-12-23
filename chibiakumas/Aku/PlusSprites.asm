load;Convert CPC sprite to Plus sprite
;by Redbox, February 2010
;Public Domain 
; Modified by Keith for Chibiakumas game 
; Now skips every other line for square sprites!
		org &7000

	ld hl,&3000
	ld de,&3001
	ld bc,&800
	xor a
	ld (hl),a
	ldir
	ret
		org &8000

		ld hl,&C000
		ld d,0
		ld a,(ix+2)	;x
		srl a	
		ld e,a
		add hl,de


		ld a,(ix+0)	;y
	 	or a
		jp z,FindMemPos
		ld b,a
ReNextLine
		call nextlineB		;work out next screen line down		
		call nextlineB		;work out next screen line down		
		djnz ReNextLine		

FindMemPos:
		ld (scraddr),hl		;and store the screen address
		ld (scraddr2),hl		;and store the screen address
		ld a,(ix+4)	
		ld hl,&3000

		push af
		and %00000001
		rrca
		ld e,a

		pop af
		srl a
		ld d,a
		
		;l;d de,&100
		;j;p z,JustStart
		;ld b,a
MemInc:		add hl,de
		;djnz,MemInc


JustStart
		ld (spraddr),hl
		ld b,16			;loop counter, sprite is 16 lines high

mainloop:	push bc			;preserve loop counter
		
		call doline

;		ld a,l			;load A with L (low byte of screen address)
;		sub 8			;subtract the 8 bytes we've already done
;		ld l,a			;and load it back into L
		ld hl,(scraddr2)		;load HL with screen address
		call nextlineB		;Move two lines!
		call nextlineb		;work out next screen line down


		ld (scraddr2),hl		;and store the screen address
		ld (scraddr),hl		;and store the screen address




		pop bc			;restore loop counter
		djnz mainloop		;decrease B and jump back to loop if not 0

		jp InitSprites
		ret			;exit

doline:		ld b,8			;loop counter, sprite is 8 bytes wide = 16 pixels

lineloop:	push bc			;store counter

		ld hl,(scraddr)		;get screen location
		ld a,(hl)		;and load data from it into A

		bit 7,a			;does bit equal 1? if so, reset Z
		ld b,&1			;pixel 0, bit 0 = &1
		call nz,addbit		;add the bit to our pixel

		bit 3,a			;does bit equal 1? if so, reset Z
		ld b,&2			;pixel 0, bit 1 (%0010) = &2
		call nz,addbit		;add the bit to our pixel

		bit 5,a			;does bit equal 1? if so, reset Z
		ld b,&4			;pixel 0, bit 2 (%0100) = &4
		call nz,addbit		;add the bit to our pixel

		bit 1,a			;does bit equal 1? if so, reset Z
		ld b,&8			;pixel 0, bit 3 (%1000) = &8
		call nz,addbit		;add the bit to our pixel

		call storeit		;store pixel at sprite address

		ld a,&0			;reset pixel
		ld (pixel),a		;and store reset

		ld hl,(scraddr)		;get data from current screen location
		ld a,(hl)		;and load it into A

		bit 6,a			;does bit equal 1? if so, reset Z
		ld b,&1			;pixel 1, bit 0 (%0001) = &1
		call nz,addbit		;add the bit to our pixel

		bit 2,a			;does bit equal 1? if so, reset Z
		ld b,&2			;pixel 1, bit 1 (%0010) = &2
		call nz,addbit		;add the bit to our pixel

		bit 4,a			;does bit equal 1? if so, reset Z
		ld b,&4			;pixel 1, bit 2 (%0100) = &4
		call nz,addbit		;add the bit to our pixel

		bit 0,a			;does bit equal 1? if so, reset Z
		ld b,&8			;pixel 1, bit 3 (%1000) = &8
		call nz,addbit		;add the bit to our pixel

		call storeit		;store pixel at sprite address

		ld a,&0			;reset pixel
		ld (pixel),a		;and store reset

		ld hl,(scraddr)		;get screen address
		inc hl			;increase it
		ld (scraddr),hl		;store it for next time

		pop bc			;restore loop counter
		djnz lineloop		;decrease B and jump back to loop if not 0
		

		ret			;else return

addbit:		push af			;preserve screen data
		ld a,(pixel)		;load A with pixel 
		add b			;add what we've found to it
		ld (pixel),a		;store it again
		pop af			;restore screen data
		ret

storeit:	ld hl,(spraddr)		;load HL with sprite address
		push bc
		ld a,(hl)
		rrca
		rrca
		rrca
		rrca
		ld b,a
		ld a,(pixel)		;load pixel into A
		rlca
		rlca
		rlca
		rlca
		or b
		ld (hl),a		;load sprite address with pixel value
		ld a,0	:Otherbit_Plus1
		cpl
		ld (Otherbit_Plus1-1),a
		or a
		jp nz,SameByte
		inc hl			;increase sprite address
SameByte:
		pop bc
		ld (spraddr),hl		;and store it for next time
		ret			

	

nextlineB:	ld a,8			;load A with 8
	        add a,h         	;which means we add &800 for the next pixel line down
	        ld h,a			;write new address back to H
	        ret nc          	;and return if no overflow

	        ld de,&C050		;else loop back round to top of screen plus one pixel line
	        add hl,de       	;by adding &C000+&50 to HL
	        ret

scraddr:	dw	&C000		;screen address to grab CPC sprite from
scraddr2:	dw	&C000		;screen address to grab CPC sprite from
pixel:		db	&0		;pixel store

spraddr:	dw	&3000		;address Plus sprite is stored (&100 bytes in length)


InitSprites
di
ld b,&bc
ld hl,sequence
ld e,17
.seq 
ld a,(hl)
out (c),a
inc hl
dec e
jr nz,seq
ei

;; page-in asic registers to &4000-&7fff
ld bc,&7fb8
out (c),c
ld hl,&3000
ld de,&4000
ld bc,&800
NextByte:
ld a,(hl)
ld (de),a
inc de
rrca
rrca
rrca
rrca
ld (de),a
inc de
inc hl
dec bc
ld a,b
or c
jp nz,NextByte

ld bc,&7fa0
out (c),c





;;--------------------------------------------------
;; STEP 3 - Setup sprite palette
;;
;; The sprites use a single 15 entry sprite palette.
;; pen 0 is ALWAYS transparent.
;;
;; The sprite palette is different to the screen palette.

;; page-in asic registers to &4000-&7fff
ld bc,&7fb8
out (c),c

;; copy colours into ASIC sprite palette registers
ld hl,sprite_colours
ld de,&6422
ld bc,15*2
ldir

;; page-out asic registers
ld bc,&7fa0
out (c),c






ret 



org &9000



;;--------------------------------------------------
;; STEP 4 - Setup sprite properties
;;
;; Each sprite has properties which define the x,y coordinates 
;; and x,y magnification.

;; page-in asic registers to &4000-&7fff
ld bc,&7fb8
out (c),c

ld h,&60

ld a,(ix+6)
sla a
sla a
sla a


ld l,a


;; set x coordinate for sprite 0
ld a,(ix+4)
ld d,0
ld e,a
ld (hl),e
inc hl
ld (hl),d
inc hl
;; set y coordinate for sprite 0
ld a,(ix+2)
ld d,0
ld e,a
ld (hl),e
inc hl
ld (hl),d
inc hl
ld a,(ix+0)
;ld a,%1001
ld (hl),a


;; page-out asic registers
ld bc,&7fa0
out (c),c

;;--------------------------------------------------
ret


;;--------------------------------------------------
;; - there is two bytes per colour.
;; - these are stored in a form that can be written direct 
;; to the CPC+ colour palette registers (i.e. xGRB)
;; - pen 0 is always transparent and doesn't have a entry
;; in the CPC+ palette

.sprite_colours
defw &0111			;; colour for sprite pen 1
defw &0222			;; colour for sprite pen 2
defw &0333			;; colour for sprite pen 3
defw &0444			;; colour for sprite pen 4
defw &0555			;; colour for sprite pen 5
defw &0666			;; colour for sprite pen 6
defw &0777			;; colour for sprite pen 7
defw &0888			;; colour for sprite pen 8
defw &0999			;; colour for sprite pen 9
defw &0aaa			;; colour for sprite pen 10
defw &0bbb			;; colour for sprite pen 11
defw &0ccc			;; colour for sprite pen 12
defw &0ddd			;; colour for sprite pen 13
defw &0eee			;; colour for sprite pen 14
defw &0fff			;; colour for sprite pen 15


;;----------------------------------------------------------
;; this is the sequence to unlock the ASIC extra features
.sequence
defb &ff,&00,&ff,&77,&b3,&51,&a8,&d4,&62,&39,&9c,&46,&2b,&15,&8a,&cd,&ee