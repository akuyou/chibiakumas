write "..\SPECTEST.C"

org &8000
FileBegin:



			di
			LD C,0		;DOS_RESET
			CALL &3D13 ; to volume a disk

			LD A,0		;Disk drive initialisation
			LD C,1
			CALL &3D13 ; to volume a disk

			LD C,&18
			CALL &3D13 ; to volume a disk

			ld a,65
			rst 16          ; print it.

			LD HL,filename ; to create a descriptor  
  			LD C,&13  
  			CALL &3D13  
    
  			LD C,&0A; find file  
  			CALL &3D13  

 			LD A,C  
  			INC C  
  			JR Z,  nofile  


			push af
				ld a,66
				rst 16          ; print it.
			pop af

  			LD C,&08  ;Read file descriptor to DOS  variable  area
  			CALL &3D13  
;
			push af
				ld a,67
				rst 16          ; print it.
  			pop af
  
  			XOR A  
  			LD (&5CF9),A  
  			LD (&5D10),A  
  			LD HL,&9000 ;Destination  
			ld (&5CE6),hl
			ld (&5CED),hl
			LD A,&FF  

  			LD C,&0E ; read from disk into memory area for an address  
  			CALL &3D13  

			ld a,68
			rst 16          ; print it.
;			di 
;			halt
  			JR Done
  nofile:  
  			LD BC,&0FFE  
  			LD A,2  
  			OUT (C),A  
			ei
Done:  
  ret

filename: defb  "spectestC"


FileEnd: