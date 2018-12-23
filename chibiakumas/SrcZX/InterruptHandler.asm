;write "..\spectest.bin"

org &7000
FileStart:
ld a,&80
ld i,a
im 2
Infloop:
jp Infloop

org &8000
InterruptHandler:
defs 257,&81

org &8181
Interrupt:
	ld a,69
	rst 16          ; print it.
	ei
reti
FileEnd:defb 0
save "..\spectest.bin",FileStart,FileEnd-FileStart	;address,size...}[,exec_address]
