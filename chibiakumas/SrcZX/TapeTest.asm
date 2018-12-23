write "..\BldZX\spectest.bin"
org &8000
tapetest:

ld sp,&9000
di
ld a,6
call Bankswapper_ZXBank_SetCurrent

halt

				ld a,66
				rst 16          ; print it.
				ld a,67
				rst 16          ; print it.
				ld a,68
				rst 16          ; print it.
				ld a,69
				rst 16          ; print it.
 

    loadhdr:
  	ld ix, TapeHeader
  	ld de, 17  
  	xor a  
  	scf  
  	call 1366  
  	jr nc,TapeEnd
    
  	; check header  
  	ld b,10  
  	ld de,TapeHeader+1  
  	ld hl,FileName 
    
 	 chckname:  
  	ld a,(de)  
	  cp (hl)  
  	jr nz,loadhdr
  	inc HL  
  	inc DE  
  	djnz chckname
    
  	; load block   
  	ld ix, &9000 ;destination  
  	ld de,(TapeHeader+11)  
  	ld a,&FF  
  	scf  
 	call 1366  

TapeEnd:
ret

TapeHeader:
defs 20
FileName:
defb "TapeTestC",32

read "Akuyou_Spectrum_Bankswapper.asm"