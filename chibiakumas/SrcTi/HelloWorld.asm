write "..\BldTI\Test.bin"
curRow			equ &844B
curCol			equ &844C
PutString		equ &450A
Org &9D93
	db &BB,&6d	;Header
	;Program actually starts at 9D95
	ld a,0           ; load the value 0 to register a, the ''accumulator''
      	ld (CURCOL),a    ; assign the contents of register a to memory address (CURCOL) in the RAM
      	ld (CURROW),a    ; assign the contents of register a to memory address (CURROW) in the RAM
  	ld hl,mytext       ; load the data in label "text" to register hl

 	rst 5 	;Bcall
	dw PutString   ; calls a function in ti83plus.inc to print text



      ret              ; returns from the program to the calc's OS
mytext:
      db 'I am awesome!!  And modest!',0