write "..\RelMSX\testrom"

INITTXT equ &006c	; switch to screen 0 (text mode 40x24)

CHPUT equ &00A2

org &4000
db "AB"
dw FileStart
db 00,00,00,00,00,00

FileStart:

call INITTXT
LD HL,message
loop:
LD A,(HL)
call CHPUT
inc HL
ld a,0
cp (HL)
JR NZ, loop

di
halt


message:
DB 'Hello World!',00



FileEnd: