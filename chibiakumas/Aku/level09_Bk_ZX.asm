PicClipImage:
call Akuyou_ScreenBuffer_GetActiveScreen
;ld hl,&4000+0+32
ld l,32
ld h,a
add &1B
ld (ColorMapScreenPos_Plus1-1),a
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


LD IX,PicClipImage_DrawOrder
JP JumpToNextLine


PicClipImage_Line_0:
call BitmapPush6
defw BitmapData+5
LD DE,&0000
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+11


PicClipImage_Line_1:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EFAE
  Push HL
LD BC,&2202
  Push BC
INC DE

call MultiPushDe6
LD HL,&4044
  Push HL
LD BC,&7577
  Push BC
DEC DE

 jp NextLinePushDe3


PicClipImage_Line_2:
call BitmapPush6
defw BitmapData+17
INC DE

call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+23


PicClipImage_Line_3:
call BitmapPush8
defw BitmapData+31
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+39


PicClipImage_Line_4:
call BitmapPush6
defw BitmapData+17
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+23


PicClipImage_Line_3_Reuse:
LD DE,&0000
JP PicClipImage_Line_3
PicClipImage_Line_4_Reuse:
LD DE,&0000
JP PicClipImage_Line_4
PicClipImage_Line_7:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EEAE
  Push HL
LD BC,&2202
  Push BC
INC DE

call MultiPushDe6
LD HL,&4044
  Push HL
LD BC,&7577
  Push BC
DEC DE

 jp NextLinePushDe3


PicClipImage_Line_8:
call BitmapPush8
defw BitmapData+47
INC DE

call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+55


PicClipImage_Line_9:
call BitmapPush10
defw BitmapData+65
call MultiPushDe6
call FinalBitmapPush10
defw BitmapData+75


PicClipImage_Line_10:
call BitmapPush8
defw BitmapData+47
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+55


PicClipImage_Line_9_Reuse:
LD DE,&0000
JP PicClipImage_Line_9
PicClipImage_Line_10_Reuse:
LD DE,&0000
JP PicClipImage_Line_10
PicClipImage_Line_13:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EEAE
  Push HL
LD BC,&2202
  Push BC
INC DE

call MultiPushDe6
LD HL,&4044
  Push HL
LD BC,&7477
  Push BC
DEC DE

 jp NextLinePushDe3


PicClipImage_Line_14:
call BitmapPush6
defw BitmapData+5
INC DE

call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+11


PicClipImage_Line_15:
call BitmapPush8
defw BitmapData+55
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+47


PicClipImage_Line_16:
call BitmapPush6
defw BitmapData+5
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+11


PicClipImage_Line_15_Reuse:
LD DE,&0000
JP PicClipImage_Line_15
PicClipImage_Line_16_Reuse:
LD DE,&0000
JP PicClipImage_Line_16
PicClipImage_Line_19:
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+81
INC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+87
DEC DE

 jp NextLinePushDe2


PicClipImage_Line_25:
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+93
INC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+99
DEC DE

 jp NextLinePushDe2


PicClipImage_Line_26:
call BitmapPush6
defw BitmapData+23
INC DE

call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+17


PicClipImage_Line_28:
call BitmapPush6
defw BitmapData+23
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+17


PicClipImage_Line_28_Reuse:
LD DE,&0000
JP PicClipImage_Line_28
PicClipImage_Line_31:
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+105
INC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+111
DEC DE

 jp NextLinePushDe2


PicClipImage_Line_32:
call BitmapPush6
defw BitmapData+11
INC DE

call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+5


PicClipImage_Line_33:
call BitmapPush10
defw BitmapData+121
call MultiPushDe6
call FinalBitmapPush10
defw BitmapData+131


PicClipImage_Line_34:
call BitmapPush6
defw BitmapData+11
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+5


PicClipImage_Line_33_Reuse:
LD DE,&0000
JP PicClipImage_Line_33
PicClipImage_Line_34_Reuse:
LD DE,&0000
JP PicClipImage_Line_34
PicClipImage_Line_37:
call BitmapPush10
defw BitmapData+141
call MultiPushDe6
call FinalBitmapPush10
defw BitmapData+151


PicClipImage_Line_38:
call BitmapPush6
defw BitmapData+46
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+54


PicClipImage_Line_39:
call BitmapPush8
defw BitmapData+64
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+74


PicClipImage_Line_38_Reuse:
LD DE,&0000
JP PicClipImage_Line_38
PicClipImage_Line_39_Reuse:
LD DE,&0000
JP PicClipImage_Line_39
PicClipImage_Line_43:
call BitmapPush8
defw BitmapData+159
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+167


PicClipImage_Line_44:
call BitmapPush6
defw BitmapData+173
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+179


PicClipImage_Line_45:
LD HL,&0001
  Push HL
call MultiPushDe14
LD BC,&8000
 jp NextLinePushBC 


PicClipImage_Line_44_Reuse:
LD DE,&0000
JP PicClipImage_Line_44
PicClipImage_Line_47:
jp MultiPushDeLast16


PicClipImage_Line_49:
LD DE,&EEEE
  PUSH DE
  PUSH DE
LD HL,&2E22
  Push HL
LD BC,&2202
  Push BC
LD DE,&0000
call MultiPushDe8
LD HL,&4044
  Push HL
LD BC,&4474
  Push BC
LD DE,&7777
 jp NextLinePushDe2


PicClipImage_Line_50:
LD HL,&2000
  Push HL
LD BC,&0220
  Push BC
Ld D,L
Ld E,L

call MultiPushDe12
LD HL,&0440
  Push HL
Ld B,E
Ld C,H

 jp NextLinePushBC 


PicClipImage_Line_51:
call BitmapPush8
defw BitmapData+63
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+75


PicClipImage_Line_52:
LD HL,&2000
  Push HL
LD BC,&0220
  Push BC
call MultiPushDe12
LD HL,&0440
  Push HL
Ld B,E
Ld C,H

 jp NextLinePushBC 


PicClipImage_Line_51_Reuse:
LD DE,&0000
JP PicClipImage_Line_51
PicClipImage_Line_54:
LD HL,&2000
  Push HL
LD BC,&0200
  Push BC
call MultiPushDe12
LD HL,&0040
  Push HL
LD BC,&0004
 jp NextLinePushBC 


PicClipImage_Line_55:
call BitmapPush8
defw BitmapData+187
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+195


PicClipImage_Line_56:
LD HL,&0220
  Push HL
call MultiPushDe14
LD BC,&0440
 jp NextLinePushBC 


PicClipImage_Line_57:
call BitmapPush8
defw BitmapData+46
call MultiPushDe8
call FinalBitmapPush8
defw BitmapData+56


PicClipImage_Line_56_Reuse:
LD DE,&0000
JP PicClipImage_Line_56
PicClipImage_Line_60:
LD HL,&0200
  Push HL
call MultiPushDe14
LD BC,&0040
 jp NextLinePushBC 


PicClipImage_Line_61:
LD HL,&2A22
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe10
LD DE,&4444
 jp NextLinePushDe3


PicClipImage_Line_62:
LD DE,&0000
jp MultiPushDeLast16


PicClipImage_Line_47_Reuse:
LD DE,&0000
JP PicClipImage_Line_47
PicClipImage_Line_67:
LD DE,&2222
  PUSH DE
  PUSH DE
LD HL,&2200
  Push HL
Ld D,L
Ld E,L

call MultiPushDe10
LD BC,&0044
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicClipImage_Line_52_Reuse:
LD DE,&0000
JP PicClipImage_Line_52
PicClipImage_Line_73:
LD HL,&2222
  Push HL
LD BC,&2202
  Push BC
call MultiPushDe12
LD HL,&4044
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicClipImage_Line_60_Reuse:
LD DE,&0000
JP PicClipImage_Line_60
PicClipImage_Line_73_Reuse:
LD DE,&0000
JP PicClipImage_Line_73
PicClipImage_Line_130:
LD DE,&2222
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe10
LD DE,&4444
  PUSH DE
  PUSH DE
LD HL,&4454
  jp NextLinePushHl 


PicClipImage_Line_131:
LD HL,&0200
  Push HL
Ld D,L
Ld E,L

call MultiPushDe14
LD BC,&0040
 jp NextLinePushBC 


PicClipImage_Line_57_Reuse:
LD DE,&0000
JP PicClipImage_Line_57
PicClipImage_Line_55_Reuse:
LD DE,&0000
JP PicClipImage_Line_55
PicClipImage_Line_54_Reuse:
LD DE,&0000
JP PicClipImage_Line_54
PicClipImage_Line_143:
call BitmapPush6
defw BitmapData+173
LD DE,&0000
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+179


PicClipImage_Line_45_Reuse:
LD DE,&0000
JP PicClipImage_Line_45
PicClipImage_Line_43_Reuse:
LD DE,&0000
JP PicClipImage_Line_43
PicClipImage_Line_37_Reuse:
LD DE,&0000
JP PicClipImage_Line_37
PicClipImage_Line_178:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EE2E
  Push HL
LD BC,&2202
  Push BC
INC DE

call MultiPushDe6
LD HL,&4044
  Push HL
LD BC,&7577
  Push BC
DEC DE

 jp NextLinePushDe3


PicClipImage_Line_184:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EEAE
  Push HL
INC DE

call MultiPushDe8
LD BC,&7577
  Push BC
DEC DE

 jp NextLinePushDe3


PicClipImage_Line_190:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EEAE
  Push HL
INC DE

call MultiPushDe8
LD BC,&75F7
  Push BC
DEC DE

 jp NextLinePushDe3


ColorMap_PicClipImage:
ld sp,&5B00 :ColorMapScreenPos_Plus1
LD DE,&4242
push de
push de
push de
push de
LD DE,&0707
push de
call MultiPushDe7
LD DE,&4444
push de
push de
push de
push de
LD DE,&4242
push de
call MultiPushDe4
LD DE,&4747
push de
call MultiPushDe5
LD DE,&4444
push de
call MultiPushDe4
LD DE,&4242
push de
call MultiPushDe4
LD DE,&4747
push de
call MultiPushDe5
LD DE,&4444
push de
call MultiPushDe4
LD DE,&4242
push de
push de
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe5
LD DE,&4444
push de
call MultiPushDe4
LD DE,&4242
push de
push de
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe5
Ld E,&44
push de
Ld D,E
push de
push de
push de
push de
LD DE,&4242
push de
push de
push de
push de
LD DE,&4747
push de
call MultiPushDe7
LD DE,&4444
push de
push de
push de
push de
LD DE,&4242
push de
push de
push de
push de
LD DE,&4747
push de
call MultiPushDe7
LD DE,&4444
push de
push de
push de
push de
LD DE,&4242
push de
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe7
Ld E,&44
push de
Ld D,E
push de
push de
push de
LD DE,&4242
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe9
Ld E,&44
push de
Ld D,E
push de
push de
LD DE,&4242
push de
push de
LD DE,&4747
push de
call MultiPushDe11
LD DE,&4444
push de
push de
LD DE,&4747
push de
call MultiPushDe40
call MultiPushDe23
LD DE,&4444
push de
push de
LD DE,&4747
push de
call MultiPushDe11
LD DE,&4242
push de
push de
LD DE,&4444
push de
push de
push de
LD DE,&4747
push de
call MultiPushDe9
LD DE,&4242
push de
push de
push de
LD DE,&4444
push de
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe7
Ld E,&42
push de
Ld D,E
push de
push de
push de
LD DE,&4444
push de
push de
push de
push de
LD DE,&4747
push de
call MultiPushDe7
LD DE,&4242
push de
push de
push de
push de
LD DE,&4444
push de
push de
push de
push de
LD DE,&4747
push de
call MultiPushDe7
LD DE,&4242
push de
push de
push de
push de
LD DE,&4444
push de
push de
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe5
Ld E,&42
push de
Ld D,E
push de
push de
push de
push de
LD DE,&4444
push de
push de
push de
push de
Ld E,&47
push de
Ld D,E
push de
call MultiPushDe5
LD DE,&4242
push de
call MultiPushDe4
LD DE,&4444
push de
call MultiPushDe4
LD DE,&4747
push de
call MultiPushDe5
LD DE,&4242
push de
call MultiPushDe4
LD DE,&4444
push de
call MultiPushDe4
LD DE,&4747
push de
call MultiPushDe5
LD DE,&4242
push de
call MultiPushDe4
LD DE,&4444
push de
call MultiPushDe4
LD DE,&4747
push de
call MultiPushDe5
LD DE,&4242
push de
call MultiPushDe4
  jp EndCode

PicClipImage_DrawOrder: 

  DEFW PicClipImage_Line_0
  DEFW PicClipImage_Line_1
  DEFW PicClipImage_Line_2
  DEFW PicClipImage_Line_3
  DEFW PicClipImage_Line_4
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_7
  DEFW PicClipImage_Line_8
  DEFW PicClipImage_Line_9
  DEFW PicClipImage_Line_10
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_10_Reuse
  DEFW PicClipImage_Line_13
  DEFW PicClipImage_Line_14
  DEFW PicClipImage_Line_15
  DEFW PicClipImage_Line_16
  DEFW PicClipImage_Line_15_Reuse
  DEFW PicClipImage_Line_16_Reuse
  DEFW PicClipImage_Line_19
  DEFW PicClipImage_Line_2
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_25
  DEFW PicClipImage_Line_26
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_28
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_28_Reuse
  DEFW PicClipImage_Line_31
  DEFW PicClipImage_Line_32
  DEFW PicClipImage_Line_33
  DEFW PicClipImage_Line_34
  DEFW PicClipImage_Line_33_Reuse
  DEFW PicClipImage_Line_34_Reuse
  DEFW PicClipImage_Line_37
  DEFW PicClipImage_Line_38
  DEFW PicClipImage_Line_39
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_39_Reuse
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_43
  DEFW PicClipImage_Line_44
  DEFW PicClipImage_Line_45
  DEFW PicClipImage_Line_44_Reuse
  DEFW PicClipImage_Line_47
  DEFW PicClipImage_Line_44_Reuse
  DEFW PicClipImage_Line_49
  DEFW PicClipImage_Line_50
  DEFW PicClipImage_Line_51
  DEFW PicClipImage_Line_52
  DEFW PicClipImage_Line_51_Reuse
  DEFW PicClipImage_Line_54
  DEFW PicClipImage_Line_55
  DEFW PicClipImage_Line_56
  DEFW PicClipImage_Line_57
  DEFW PicClipImage_Line_56_Reuse
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_60
  DEFW PicClipImage_Line_61
  DEFW PicClipImage_Line_62
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_67
  DEFW PicClipImage_Line_62
  DEFW PicClipImage_Line_52_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_52_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_73
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_56_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_60_Reuse
defw looper
  DEFB 1,36
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_60_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_56_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_73_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_52_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_52_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_67
  DEFW PicClipImage_Line_62
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_130
  DEFW PicClipImage_Line_131
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_56_Reuse
  DEFW PicClipImage_Line_57_Reuse
  DEFW PicClipImage_Line_56_Reuse
  DEFW PicClipImage_Line_55_Reuse
  DEFW PicClipImage_Line_54_Reuse
  DEFW PicClipImage_Line_51_Reuse
  DEFW PicClipImage_Line_52_Reuse
  DEFW PicClipImage_Line_51_Reuse
  DEFW PicClipImage_Line_52_Reuse
  DEFW PicClipImage_Line_49
  DEFW PicClipImage_Line_143
  DEFW PicClipImage_Line_47_Reuse
  DEFW PicClipImage_Line_44_Reuse
  DEFW PicClipImage_Line_45_Reuse
  DEFW PicClipImage_Line_44_Reuse
  DEFW PicClipImage_Line_43_Reuse
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_39_Reuse
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_39_Reuse
  DEFW PicClipImage_Line_38_Reuse
  DEFW PicClipImage_Line_37_Reuse
  DEFW PicClipImage_Line_34_Reuse
  DEFW PicClipImage_Line_33_Reuse
  DEFW PicClipImage_Line_34_Reuse
  DEFW PicClipImage_Line_33_Reuse
  DEFW PicClipImage_Line_34_Reuse
  DEFW PicClipImage_Line_31
  DEFW PicClipImage_Line_26
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_28_Reuse
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_28_Reuse
  DEFW PicClipImage_Line_25
  DEFW PicClipImage_Line_2
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_19
  DEFW PicClipImage_Line_14
  DEFW PicClipImage_Line_15_Reuse
  DEFW PicClipImage_Line_16_Reuse
  DEFW PicClipImage_Line_15_Reuse
  DEFW PicClipImage_Line_16_Reuse
  DEFW PicClipImage_Line_178
  DEFW PicClipImage_Line_8
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_10_Reuse
  DEFW PicClipImage_Line_9_Reuse
  DEFW PicClipImage_Line_10_Reuse
  DEFW PicClipImage_Line_184
  DEFW PicClipImage_Line_2
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_3_Reuse
  DEFW PicClipImage_Line_4_Reuse
  DEFW PicClipImage_Line_190
  DEFW PicClipImage_Line_14
  DEFW ColorMap_PicClipImage







;Global Code
RLE_ImageWidth equ 0
RLE_NextScreenLineHL:
	push de
	ld b,RLE_ImageWidth :ImageWidthE_Plus1
	ld de,&000+RLE_ImageWidth :ImageWidthD_Plus2
	add hl,de
	inc h
	ld a,h
	and  %00000111;7
	jp nz,JumpToNextLineBB
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,JumpToNextLineBB
	ld a,h
	sub %00001000;8
	ld h,a
JumpToNextLineBB: 
	pop de
	ret

EndCode:
ld sp,&0000:StackRestore_Plus2
ei
ret
MultiPushDe23: pop HL
jp MultiPushDe23B 
MultiPushDe40: pop HL
jp MultiPushDe40B 
MultiPushDeLast16: ld HL,NextLine
jr MultiPushDe16B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDe11: pop HL
jr MultiPushDe11B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
MultiPushDe7: pop HL
jr MultiPushDe7B 
MultiPushDe6: pop HL
jr MultiPushDe6B 
MultiPushDe5: pop HL
jr MultiPushDe5B 
MultiPushDe4: pop HL
jr MultiPushDe4B 
MultiPushDe40B: Push DE
MultiPushDe39B: Push DE
MultiPushDe38B: Push DE
MultiPushDe37B: Push DE
MultiPushDe36B: Push DE
MultiPushDe35B: Push DE
MultiPushDe34B: Push DE
MultiPushDe33B: Push DE
MultiPushDe32B: Push DE
MultiPushDe31B: Push DE
MultiPushDe30B: Push DE
MultiPushDe29B: Push DE
MultiPushDe28B: Push DE
MultiPushDe27B: Push DE
MultiPushDe26B: Push DE
MultiPushDe25B: Push DE
MultiPushDe24B: Push DE
MultiPushDe23B: Push DE
MultiPushDe22B: Push DE
MultiPushDe21B: Push DE
MultiPushDe20B: Push DE
MultiPushDe19B: Push DE
MultiPushDe18B: Push DE
MultiPushDe17B: Push DE
MultiPushDe16B: Push DE
MultiPushDe15B: Push DE
MultiPushDe14B: Push DE
MultiPushDe13B: Push DE
MultiPushDe12B: Push DE
MultiPushDe11B: Push DE
MultiPushDe10B: Push DE
MultiPushDe9B: Push DE
MultiPushDe8B: Push DE
MultiPushDe7B: Push DE
MultiPushDe6B: Push DE
MultiPushDe5B: Push DE
MultiPushDe4B: Push DE
MultiPushDe3B: Push DE
MultiPushDe2B: Push DE
MultiPushDe1B: Push DE
jp (hl)

BitmapPush:
ld (BitmapPushDeRestore_Plus2-2),de
pop iy
ld l,(iy)
inc iy
ld h,(iy)
inc iy
BitmapPushRepeat:
ld d,(hl)
dec hl
ld e,(hl)
dec hl
push de
djnz BitmapPushRepeat

ld de,&0000 :BitmapPushDeRestore_Plus2

jp (iy)

BitmapPush10: ld b,&05
jr BitmapPush
BitmapPush8: ld b,&04
jr BitmapPush
BitmapPush6: ld b,&03
jr BitmapPush

finalBitmapPush10: ld b,&05
jr finalBitmapPush

finalBitmapPush8: ld b,&04
jr finalBitmapPush

finalBitmapPush6: ld b,&03
jr finalBitmapPush
finalBitmapPush:
ld (BitmapPushDeRestore_Plus2-2),de
pop iy
ld l,(iy)
inc iy
ld h,(iy)
inc iy
ld iy,nextline
jp BitmapPushRepeat
NextLinePushDe4: push de
NextLinePushDe3: push de
NextLinePushDe2: push de
NextLinePushDe1: push de

NextLine: 
ld hl,&0000+31
add hl,sp
inc h
	ld a,h
	and  %00000111;7
	jp nz,JumpToNextLineB
	ld a,l
	add a,%00100000;32
	ld l,a
	jp c,JumpToNextLineB
	ld a,h
	sub %00001000;8
	ld h,a
JumpToNextLineB: 
inc hl
ld sp,hl

JumpToNextLine: 
LD L,(IX)
INC IX
LD H,(IX)
INC IX
JP (HL)
NextLinePushHl: Push HL
jr NextLine
NextLinePushBC: Push BC
jr NextLine
NextLineSPshift:add hl,sp
ld sp,hl
jr NextLine
NextLineDecSP8:dec sp
dec sp
dec sp
dec sp
NextLineDecSP4:dec sp
dec sp
dec sp
dec sp
jr NextLine
CompiledSprite_GetNxtLinbc: defw &0000 :CompiledSprite_NextLineJumpBC_Plus2

LooperContinueAddress:defw LooperContinue
Looper:
ld b,ixh
ld c,ixl
LD a,(bc)
INC bc
ld (Looper_CountB_Plus1-1),a
LD a,(bc)
INC bc
ld (Looper_CountSize_Plus1-1),a
ld (RestoreLooperAddress_Plus2-2),bc
LooperNextStage:
	ld hl,&0000 :RestoreLooperAddress_Plus2
	ld (Looper_Address_Plus2-2),hl
	ld a,0:Looper_CountB_Plus1
	ld (Looper_Count_Plus1-1),a
	LooperRepeat:
		ld hl,&0000 :Looper_Address_Plus2
		LD c,(hl)
		INC hl
		LD b,(hl)
		INC hl
		ld (Looper_Address_Plus2-2),hl
		ld h,b
		ld l,c
		ld ix,LooperContinueAddress
		jp (hl)
   LooperContinue:
		ld a,0:Looper_Count_Plus1
		dec a
		ld (Looper_Count_Plus1-1),a
	jp nz,LooperRepeat
	ld a,0:Looper_CountSize_Plus1
	dec a
	ld (Looper_CountSize_Plus1-1),a
jp nz,LooperNextStage
ld ix,(Looper_Address_Plus2-2)
LD L,(IX)
INC IX
LD H,(IX)
INC IX
JP (HL)


BitmapData: 

defb &04,&00,&40,&04,&00,&40,&02,&00,&20,&02
defb &00,&20,&00,&40,&04,&00,&40,&04,&20,&02
defb &00,&20,&02,&00,&00,&04,&00,&40,&04,&00
defb &40,&04,&20,&02,&00,&20,&02,&00,&20,&00
defb &02,&00,&20,&02,&00,&20,&02,&00,&00,&40
defb &04,&00,&40,&04,&00,&40,&00,&20,&02,&00
defb &20,&02,&00,&20,&02,&00,&00,&40,&04,&00
defb &40,&04,&00,&40,&04,&00,&02,&22,&2A,&EE
defb &EF,&FF,&FF,&F7,&77,&54,&44,&40,&00,&22
defb &22,&EE,&EE,&FF,&FF,&77,&77,&44,&44,&00
defb &00,&22,&22,&2E,&EE,&EF,&F7,&77,&74,&44
defb &44,&00,&00,&02,&00,&20,&02,&00,&20,&02
defb &00,&20,&04,&00,&40,&04,&00,&40,&04,&00
defb &40,&00,&00,&02,&22,&22,&EE,&EE,&EF,&FF
defb &FF,&FF,&FF,&FF,&FF,&F7,&77,&77,&44,&44
defb &40,&00,&22,&22,&2E,&EE,&EE,&EE,&FF,&FF
defb &FF,&FF,&77,&77,&77,&74,&44,&44,&00,&01
defb &00,&10,&01,&00,&00,&80,&08,&00,&80,&00
defb &00,&22,&22,&22,&22,&EE,&EE,&EE,&77,&77
defb &77,&44,&44,&44,&44,&00
DoubleByteDE:
pop iy
ld a,(iy)
inc iy
ld d,a
ld e,a
push de
push de
jp(iy)

PushDE_0000x:
Ld DE,&0000
jr PushDE_Multi
PushDE_F0F0x:
Ld DE,&F0F0
jr PushDE_Multi
PushDE_0F0Fx:
Ld DE,&0F0F
jr PushDE_Multi
PushDE_FFFFx:
Ld DE,&FFFF
PushDE_Multi
pop hl
push DE
push DE
push DE
push DE
jp (hl)

