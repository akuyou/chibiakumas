Write direct -1,-1,&C1
org &C000
Limit &FFFF

incbin "Sprites\LEVEL9B.SPR"

	read "CoreDefs.asm"





save direct "T29-SC2.D02",&C000,&500	;address,size...}[,exec_address]