read "..\CoreDefs.asm" ;read "BootStrap.asm"
org &4000
jp PicStage20Face3bmp

PicStage20Face3bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Face3bmp_DrawOrder
JP JumpToNextLine


PicStage20Face3bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicStage20Face3bmp_Line_1:
LD HL,&0F0F
  Push HL
LD BC,&0A0A
  Push BC
  PUSH DE
LD HL,&0008
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F07
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld D,H
Ld E,H

call MultiPushDe15
call BitmapPush12
defw BitmapData+11
 jp NextLinePushDe1


PicStage20Face3bmp_Line_3:
LD HL,&0F0F
  Push HL
LD BC,&0A0A
  Push BC
  PUSH DE
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Call PushDE_0F0Fx
Ld B,&0B
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe15
LD BC,&0F0B
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld C,&0F
 jp NextLinePushBC 


PicStage20Face3bmp_Line_4:
jp MultiPushDeLast40


PicStage20Face3bmp_Line_5:
LD HL,&0F0B
  Push HL
LD BC,&0A02
  Push BC
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&0E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
  PUSH DE
call BitmapPush6
defw BitmapData+23
call MultiPushDe10
LD HL,&0F0A
  Push HL
LD BC,&0A0E
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
Ld H,B


  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0008
  Push BC
Ld L,&0F
  jp NextLinePushHl 


PicStage20Face3bmp_Line_4_Reuse:
LD DE,&0000
JP PicStage20Face3bmp_Line_4
PicStage20Face3bmp_Line_7:
LD HL,&0F0B
  Push HL
LD BC,&0A00
  Push BC
  PUSH DE
LD HL,&080A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0E0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&0F
  Push HL
LD BC,&0A0E
  Push BC
call MultiPushDe16
Ld H,B
Ld L,B

  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,L

  Push BC
  Push HL 
LD HL,&0200
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0A0E
 jp NextLinePushBC 


PicStage20Face3bmp_Line_9:
LD HL,&0F0A
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Call PushDE_0F0Fx
Ld H,B
Ld L,B

  Push HL
call MultiPushDe17
call BitmapPush6
defw BitmapData+29
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+35
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&080E
 jp NextLinePushBC 


PicStage20Face3bmp_Line_11:
LD HL,&0F0A
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0B0A
  Push BC

Ld L,E

  Push HL
call MultiPushDe18
Ld B,C
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld C,&00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face3bmp_Line_13:
call BitmapPush6
defw BitmapData+41
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0F0B
  Push BC
Ld L,&0A
  Push HL
call MultiPushDe19
Ld C,&0A
  Push BC
Ld H,C
Ld L,C

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD BC,&0A00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face3bmp_Line_15:
call BitmapPush6
defw BitmapData+47
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0B0A
  Push BC
  Push HL 
call MultiPushDe19
call BitmapPush6
defw BitmapData+29
  PUSH DE
  PUSH DE
LD HL,&0A0A
  Push HL
LD BC,&0A00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face3bmp_Line_17:
call BitmapPush6
defw BitmapData+53
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0A0A
  Push BC
call MultiPushDe8
LD HL,&0F0B
  Push HL
Ld C,&0F
  Push BC
call MultiPushDe11
Ld H,B
Ld L,B

  Push HL
  Push BC
  PUSH DE
  PUSH DE
LD BC,&0B0A
  Push BC
Ld L,&00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,&08
 jp NextLinePushBC 


PicStage20Face3bmp_Line_19:
LD HL,&0B0A
  Push HL
  PUSH DE
Ld B,E
Ld C,L

  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+61
LD DE,&0F0F
call MultiPushDe9
LD HL,&0B0A
  Push HL
LD BC,&0E0F
  Push BC
call MultiPushDe10
LD HL,&0B0A
  Push HL
LD BC,&0A0E
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&0A00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,&08
 jp NextLinePushBC 


PicStage20Face3bmp_Line_21:
LD HL,&0B0A
  Push HL
  PUSH DE
LD BC,&080A
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&0E0F
  Push HL
call MultiPushDe9
Ld B,&0F
  Push BC
LD HL,&0A0E
  Push HL
call MultiPushDe10
Ld C,&0B
  Push BC
LD HL,&0A0A
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0B0A
  Push BC
Ld L,&00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&080E
 jp NextLinePushBC 


PicStage20Face3bmp_Line_23:
LD HL,&0B0A
  Push HL
  PUSH DE
LD BC,&080A
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+67
LD DE,&0F0F
call MultiPushDe11
LD HL,&0A0A
  Push HL
call MultiPushDe11
LD BC,&0A0A
  Push BC
LD HL,&0E0F
  Push HL
  PUSH DE
Ld B,&0B
  Push BC
LD HL,&0A00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&088E
 jp NextLinePushBC 


PicStage20Face3bmp_Line_25:
call BitmapPush6
defw BitmapData+73
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+79
LD DE,&0F0F
call MultiPushDe11
LD HL,&0B0A
  Push HL
LD BC,&0E0F
  Push BC
call MultiPushDe10
LD HL,&0B0A
  Push HL
Ld B,L


  Push BC
  PUSH DE
  Push HL 
LD HL,&0A00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&CCFF
 jp NextLinePushBC 


PicStage20Face3bmp_Line_27:
DEC DE

  PUSH DE
  PUSH DE
LD HL,&7F0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0A0E
  Push BC
Ld H,&0F
  Push HL
Ld D,H
Ld E,H

call MultiPushDe12
LD BC,&0F0A
  Push BC
Ld H,C
Ld L,E

  Push HL
call MultiPushDe10
  Push BC
LD BC,&0A0E
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+89


PicStage20Face3bmp_Line_29:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF1B
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&0A0E
  Push BC
LD DE,&0F0F
call MultiPushDe13
LD HL,&0F0B
  Push HL
Ld C,&0F
  Push BC
call MultiPushDe10
LD HL,&0FFF
  Push HL
LD BC,&FF0A
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+95
LD DE,&FFFF
 jp NextLinePushDe2


PicStage20Face3bmp_Line_30:
INC DE

jp MultiPushDeLast40


PicStage20Face3bmp_Line_31:
DEC DE

call MultiPushDe5
LD HL,&3B0A
  Push HL
LD BC,&0A0E
  Push BC
LD DE,&0F0F
call MultiPushDe14
Ld H,B
Ld L,E

  Push HL
call MultiPushDe9
LD BC,&E178
  Push BC
LD HL,&0F8F
  Push HL
LD DE,&FFFF
jp MultiPushDeLast7


PicStage20Face3bmp_Line_33:
DEC DE

call MultiPushDe6
LD HL,&FF0E
  Push HL
LD DE,&0F0F
call MultiPushDe24
LD BC,&E178
  Push BC
  PUSH DE
LD HL,&CEFF
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast6


PicStage20Face3bmp_Line_35:
DEC DE

call MultiPushDe7
LD HL,&FF0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe23
call BitmapPush6
defw BitmapData+101
LD DE,&FFFF
jp MultiPushDeLast6


PicStage20Face3bmp_Line_37:
Call PushDE_FFFFx
call BitmapPush6
defw BitmapData+107
LD DE,&0F0F
call MultiPushDe20
LD HL,&3C0F
  Push HL
LD BC,&2D0F
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+115
Call PushDE_FFFFx
LD HL,&FF7F
  jp NextLinePushHl 


PicStage20Face3bmp_Line_39:
LD HL,&FFFF
  Push HL
LD BC,&7708
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0F
  Push HL
Call PushDE_0F0Fx
LD BC,&0FC3
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe10
Ld C,&E1
  Push BC
LD DE,&F0F0
call MultiPushDe7
LD DE,&0A0A
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+125


PicStage20Face3bmp_Line_41:
LD HL,&0A00
  Push HL
LD BC,&0008
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+131
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1E0F
  Push HL
LD BC,&0FC3
  Push BC
  PUSH DE
LD HL,&F01E
  Push HL
Ld D,B
Ld E,B

call MultiPushDe9
LD BC,&E1F0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe7
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+137


PicStage20Face3bmp_Line_43:
LD HL,&0A00
  Push HL
LD BC,&0008
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&F0F0
call MultiPushDe5
call BitmapPush8
defw BitmapData+145
LD DE,&0F0F
call MultiPushDe5
LD HL,&E10F
  Push HL
LD BC,&0F87
  Push BC
Call PushDE_F0F0x
Ld H,E
Ld L,B

  Push HL
Ld C,&E1
  Push BC
  PUSH DE
  PUSH DE
Ld L,&78
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+137


PicStage20Face3bmp_Line_45:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F0F
  Push HL
LD BC,&0FF0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
call BitmapPush8
defw BitmapData+153
Call PushDE_0F0Fx
LD HL,&F01E
  Push HL
LD BC,&0FC3
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+159
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+39


PicStage20Face3bmp_Line_47:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+165
LD DE,&F0F0
call MultiPushDe7
call BitmapPush8
defw BitmapData+173
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+179
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F00F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&F078
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+185


PicStage20Face3bmp_Line_49:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+191
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&0F0F
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&1E
  Push HL

Ld C,L

  Push BC
LD HL,&E1F0
  Push HL
Ld B,&1E
  Push BC
LD HL,&0FE1
  Push HL
  PUSH DE
LD BC,&F078
  Push BC
  Push HL 
  PUSH DE
LD HL,&F03C
  Push HL
LD DE,&0F0F
call MultiPushDe6
Ld B,&C3
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A00
  Push HL
LD BC,&0008
  Push BC
 jp NextLinePushDe1


PicStage20Face3bmp_Line_51:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+207
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+217
  PUSH DE
  PUSH DE
LD HL,&0FE1
  Push HL
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+223
  PUSH DE
LD BC,&0F69
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+229


PicStage20Face3bmp_Line_53:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF7F
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C3F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F00F
  Push BC
Ld H,C
Ld L,C

  Push HL
LD BC,&C3F0
  Push BC
LD HL,&87F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1EE1
  Push BC
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+241
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+229


PicStage20Face3bmp_Line_55:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&CFFF
  Push BC
LD HL,&FF1F
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E1F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+247
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F03C
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+255
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+261


PicStage20Face3bmp_Line_57:
LD HL,&0A00
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+271
LD DE,&0F0F
call MultiPushDe5
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+277
  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&F0FC
  Push BC
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+283


PicStage20Face3bmp_Line_59:
LD HL,&0F07
  Push HL
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
LD BC,&EFFF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
Ld H,&1F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&0FC3
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  Push HL
LD BC,&87F0
  Push BC
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  Push BC
Call PushDE_F0F0x
LD HL,&F0FF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF1B
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+289


PicStage20Face3bmp_Line_61:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0B0A
  Push HL
LD BC,&CEFF
  Push BC
Call PushDE_FFFFx
LD HL,&FFF7
  Push HL
LD DE,&0F0F
call MultiPushDe7
LD BC,&0FF0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&780F
  Push HL
Ld C,&E1
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+295
call MultiPushDe6
LD HL,&FCFF
  Push HL
Call PushDE_FFFFx
call FinalBitmapPush8
defw BitmapData+303


PicStage20Face3bmp_Line_63:
call BitmapPush6
defw BitmapData+309
DEC DE

call MultiPushDe5
LD HL,&F7F0
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&0FC3
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+315
  PUSH DE
  PUSH DE
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&E1F0
  Push BC
LD HL,&F0F8
  Push HL
LD DE,&FFFF
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+321


PicStage20Face3bmp_Line_65:
call BitmapPush6
defw BitmapData+327
Call PushDE_FFFFx
call BitmapPush8
defw BitmapData+335
Call PushDE_F0F0x
call BitmapPush6
defw BitmapData+341
  PUSH DE
  PUSH DE
LD HL,&0F87
  Push HL
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld L,&C3
  Push HL
  PUSH DE
  PUSH DE
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+347
Call PushDE_FFFFx
LD BC,&FFC0
  Push BC
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face3bmp_Line_67:
call BitmapPush6
defw BitmapData+327
Call PushDE_FFFFx
call BitmapPush8
defw BitmapData+355
Call PushDE_F0F0x
LD HL,&F01E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+367
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&0F0F
  Push BC
LD HL,&0100
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+375
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF80
  Push BC
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face3bmp_Line_69:
call BitmapPush6
defw BitmapData+381
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+397
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+403
  PUSH DE
call BitmapPush8
defw BitmapData+411
  PUSH DE
call BitmapPush6
defw BitmapData+417
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+425
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+431


PicStage20Face3bmp_Line_71:
call BitmapPush6
defw BitmapData+437
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3F0F
  Push HL
LD BC,&0FE1
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&FC33
  Push HL
Call PushDE_0000x
LD BC,&E0F0
  Push BC
Ld H,C
Ld L,C

  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+443
  PUSH DE
LD BC,&F0F0
  Push BC
LD HL,&F078
  Push HL
  PUSH DE
call BitmapPush18
defw BitmapData+461
LD DE,&FFFF
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+467


PicStage20Face3bmp_Line_73:
call BitmapPush6
defw BitmapData+473
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF3B
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+479
Call PushDE_0000x
call BitmapPush22
defw BitmapData+501
  PUSH DE
  PUSH DE
LD BC,&FF00
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+507
  PUSH DE
  PUSH DE
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+513


PicStage20Face3bmp_Line_75:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&08FF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0A0A
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+519
LD DE,&0000
call MultiPushDe5
LD HL,&80F0
  Push HL
LD BC,&F01E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0FC3
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1E07
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC77
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0E0F
  Push BC
LD HL,&0F01
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+529


PicStage20Face3bmp_Line_77:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+537
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+543
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&3000
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+551
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F078
  Push HL
LD BC,&0F01
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
LD HL,&0E87
  Push HL
LD BC,&F010
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+559


PicStage20Face3bmp_Line_79:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+577
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

  Push BC
call BitmapPush8
defw BitmapData+585
  PUSH DE
  PUSH DE
LD HL,&F01E
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00EE
  Push HL
LD BC,&FF11
  Push BC
  PUSH DE
LD HL,&0C0F
  Push HL
LD BC,&E100
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF80
  Push HL
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face3bmp_Line_81:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+597
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+607
  PUSH DE
  PUSH DE
LD HL,&F00F
  Push HL
LD BC,&0100
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&FFFF
  Push BC
  PUSH DE
LD HL,&C01E
  Push HL
LD BC,&0F00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face3bmp_Line_83:
LD HL,&0007
  Push HL
LD BC,&0008
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+617
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+627
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
LD DE,&0000
call MultiPushDe5
call BitmapPush8
defw BitmapData+635
call MultiPushDe5
LD HL,&00E0
  Push HL
LD BC,&F0F0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_85:
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+641
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+651
  PUSH DE
  PUSH DE
LD BC,&1E03
  Push BC
LD DE,&0000
call MultiPushDe5
call BitmapPush8
defw BitmapData+659
call MultiPushDe6
LD HL,&30F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_87:
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+665
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
Call PushDE_F0F0x
call BitmapPush8
defw BitmapData+673
  PUSH DE
  PUSH DE
LD BC,&0F01
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&00EE
  Push HL
DEC DE

  PUSH DE
  PUSH DE
LD BC,&7700
  Push BC
INC DE

call MultiPushDe6
LD HL,&00C0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_89:
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+679
LD DE,&FFFF
  PUSH DE
  PUSH DE
LD HL,&FF00
  Push HL
INC DE

  PUSH DE
  PUSH DE
LD BC,&00F0
  Push BC
Call PushDE_F0F0x
call BitmapPush8
defw BitmapData+687
  PUSH DE
LD HL,&F078
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&EEFF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
Ld B,&11
  Push BC
INC DE

jp MultiPushDeLast6


PicStage20Face3bmp_Line_91:
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0A0E
  Push HL
LD BC,&0FCF
  Push BC
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
INC DE

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+699
  PUSH DE
call BitmapPush10
defw BitmapData+709
call MultiPushDe6
LD BC,&00EE
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF11
  Push HL
INC DE

jp MultiPushDeLast5


PicStage20Face3bmp_Line_93:
  PUSH DE
call BitmapPush6
defw BitmapData+715
DEC DE

call MultiPushDe5
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+727
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&000C
  Push BC
LD HL,&EFFF
  Push HL
Call PushDE_FFFFx
Call PushDE_0000x
jp NextLine


PicStage20Face3bmp_Line_95:
call BitmapPush6
defw BitmapData+733
DEC DE

call MultiPushDe5
LD HL,&FF11
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+745
  PUSH DE
LD BC,&0E0F
  Push BC
LD HL,&0F87
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&000C
  Push HL
LD BC,&E1FE
  Push BC
DEC DE

call MultiPushDe5
LD HL,&FF33
  Push HL
INC DE

 jp NextLinePushDe2


PicStage20Face3bmp_Line_97:
call BitmapPush6
defw BitmapData+751
DEC DE

call MultiPushDe5
LD HL,&FF03
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&C02D
  Push BC
LD HL,&0FC3
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+757
  PUSH DE
LD BC,&0E0F
  Push BC
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
call BitmapPush6
defw BitmapData+763
DEC DE

call MultiPushDe5
LD HL,&77E0
  Push HL
LD BC,&0000
 jp NextLinePushBC 


PicStage20Face3bmp_Line_99:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&CCFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&3D03
  Push BC
INC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+769
  PUSH DE
call BitmapPush6
defw BitmapData+775
  PUSH DE
LD HL,&0E0F
  Push HL
LD BC,&0FE1
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush6
defw BitmapData+781
DEC DE

call MultiPushDe5
LD BC,&77C0
  Push BC
LD HL,&F040
  jp NextLinePushHl 


PicStage20Face3bmp_Line_101:
call BitmapPush6
defw BitmapData+381
Call PushDE_FFFFx
call BitmapPush30
defw BitmapData+811
LD HL,&F0F0
  Push HL
LD BC,&3000
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC00
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+819
Call PushDE_FFFFx
LD BC,&FF80
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_103:
call BitmapPush6
defw BitmapData+381
Call PushDE_FFFFx
call BitmapPush30
defw BitmapData+849
LD HL,&F0F0
  Push HL
LD BC,&3000
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8833
  Push HL
  PUSH DE
  PUSH DE
LD BC,&080F
  Push BC
LD HL,&E1F0
  Push HL
  PUSH DE
LD BC,&0088
  Push BC
Call PushDE_FFFFx
LD HL,&FF80
  Push HL
LD BC,&1EE1
 jp NextLinePushBC 


PicStage20Face3bmp_Line_105:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&88FF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+879
call BitmapPush6
defw BitmapData+885
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&88FF
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+891
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF91
  Push BC
LD HL,&0F87
  jp NextLinePushHl 


PicStage20Face3bmp_Line_107:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&01FF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+921
call BitmapPush6
defw BitmapData+927
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+937
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00CC
  Push BC
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF91
  Push HL
LD BC,&0F0F
 jp NextLinePushBC 


PicStage20Face3bmp_Line_109:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&03EE
  Push HL
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+967
call BitmapPush8
defw BitmapData+975
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+985
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+993


PicStage20Face3bmp_Line_111:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F08
  Push HL
LD BC,&0A0A
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+999
  PUSH DE
call BitmapPush20
defw BitmapData+1019
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1025
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1035
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+1041


PicStage20Face3bmp_Line_113:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F08
  Push HL
LD BC,&0A0A
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+1047
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1053
Call PushDE_F0F0x
LD HL,&7000
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1061
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1071
call MultiPushDe6
LD HL,&0008
  Push HL
LD BC,&0FF0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_115:
call BitmapPush22
defw BitmapData+1093
  PUSH DE
LD HL,&00E0
  Push HL
Call PushDE_F0F0x
LD BC,&3000
  Push BC
LD HL,&0008
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1101
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1109
call MultiPushDe6
LD BC,&00C0
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_117:
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1127
  PUSH DE
LD HL,&00C0
  Push HL
Call PushDE_F0F0x
LD BC,&1000
  Push BC
LD HL,&000C
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+1151
LD DE,&0000
call MultiPushDe6
LD BC,&00E0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_119:
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1169
  PUSH DE
LD HL,&0080
  Push HL
Call PushDE_F0F0x
LD BC,&0000
  Push BC
LD HL,&000E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1177
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0FFF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&FF38
  Push HL
LD BC,&0200
  Push BC
INC DE

jp MultiPushDeLast7


PicStage20Face3bmp_Line_121:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1187
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1193
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1199
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1207
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C3FE
  Push HL
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&FF00
  Push BC
INC DE

jp MultiPushDeLast7


PicStage20Face3bmp_Line_123:
  PUSH DE
call BitmapPush22
defw BitmapData+1229
  PUSH DE
LD HL,&80F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1235
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&010C
  Push BC
LD HL,&0FC3
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1241
  PUSH DE
LD BC,&FEFF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF00
  Push HL
INC DE

jp MultiPushDeLast6


PicStage20Face3bmp_Line_125:
  PUSH DE
LD HL,&0E0F
  Push HL
LD BC,&03FF
  Push BC
DEC DE

call MultiPushDe6
LD HL,&7F0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1253
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&010C
  Push BC
LD HL,&0FC3
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1259
  PUSH DE
LD BC,&F0FF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe7
call FinalBitmapPush6
defw BitmapData+1265


PicStage20Face3bmp_Line_127:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&89FF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&FF7F
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F03
  Push HL
Call PushDE_0000x
LD BC,&000E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0100
  Push HL
LD BC,&0FE1
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1259
  PUSH DE
  PUSH DE
LD DE,&FFFF
call MultiPushDe8
LD HL,&9100
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicStage20Face3bmp_Line_129:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&89FF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&7F0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe12
call BitmapPush14
defw BitmapData+1279
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3CEF
  Push HL
LD DE,&FFFF
call MultiPushDe7
LD BC,&B3F0
  Push BC
LD HL,&3000
  jp NextLinePushHl 


PicStage20Face3bmp_Line_131:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&89FF
  Push HL
Call PushDE_FFFFx
LD BC,&FF7F
  Push BC
LD DE,&0F0F
call MultiPushDe13
call BitmapPush22
defw BitmapData+1301
LD DE,&FFFF
call MultiPushDe6
LD HL,&33F0
  Push HL
LD BC,&F010
 jp NextLinePushBC 


PicStage20Face3bmp_Line_133:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&89FF
  Push HL
Call PushDE_FFFFx
LD BC,&FF0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe13
call BitmapPush22
defw BitmapData+1323
LD DE,&FFFF
call MultiPushDe6
LD HL,&331E
  Push HL
LD BC,&E1F0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_135:
call BitmapPush6
defw BitmapData+1329
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF7F
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0F03
  Push BC
LD HL,&2E0F
  Push HL
call MultiPushDe10
call BitmapPush10
defw BitmapData+1339
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1347
LD DE,&FFFF
call MultiPushDe5
LD BC,&330F
  Push BC
LD HL,&87F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_137:
call BitmapPush14
defw BitmapData+1361
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F07
  Push HL
LD BC,&330F
  Push BC
call MultiPushDe11
call BitmapPush8
defw BitmapData+1369
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1379
Call PushDE_FFFFx
LD HL,&19CF
  Push HL
LD BC,&1FE1
 jp NextLinePushBC 


PicStage20Face3bmp_Line_139:
call BitmapPush8
defw BitmapData+1387
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1397
LD DE,&0F0F
call MultiPushDe10
call BitmapPush10
defw BitmapData+1407
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1417
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
LD BC,&910F
  Push BC
LD HL,&FF87
  jp NextLinePushHl 


PicStage20Face3bmp_Line_141:
LD HL,&0FE1
  Push HL
LD BC,&0F03
  Push BC
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1429
LD DE,&0F0F
call MultiPushDe9
call BitmapPush10
defw BitmapData+1439
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1449
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1457


PicStage20Face3bmp_Line_143:
LD HL,&0F07
  Push HL
  PUSH DE
  PUSH DE
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1471
LD DE,&0F0F
call MultiPushDe8
LD HL,&0700
  Push HL
LD BC,&0EC3
  Push BC
Ld D,&F0
  PUSH DE
  PUSH DE
Ld E,&F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1481
LD DE,&0000
call MultiPushDe5
LD HL,&E078
  Push HL
LD BC,&0F87
 jp NextLinePushBC 


PicStage20Face3bmp_Line_145:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1491
LD DE,&0000
  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe7
call BitmapPush10
defw BitmapData+1501
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1511
LD DE,&0000
call MultiPushDe5
LD BC,&40C0
  Push BC
LD HL,&1E87
  jp NextLinePushHl 


PicStage20Face3bmp_Line_147:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1527
LD DE,&0F0F
call MultiPushDe6
call BitmapPush10
defw BitmapData+1537
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&7803
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1543
call MultiPushDe5
LD HL,&00C0
  Push HL
LD BC,&F0F0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_149:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1559
LD DE,&0F0F
call MultiPushDe6
LD BC,&0700
  Push BC
LD HL,&0C0F
  Push HL
  PUSH DE
Call PushDE_F0F0x
call BitmapPush12
defw BitmapData+1571
LD DE,&0000
call MultiPushDe6
LD BC,&40E0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_151:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1589
LD DE,&0F0F
call MultiPushDe5
LD BC,&070E
  Push BC
  PUSH DE
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1603
LD DE,&0000
jp MultiPushDeLast7


PicStage20Face3bmp_Line_153:
  PUSH DE
LD HL,&000F
  Push HL
  PUSH DE
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1623
LD DE,&0F0F
call MultiPushDe6
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1637
Call PushDE_0000x
LD BC,&00CC
  Push BC
LD HL,&C000
  Push HL
 jp NextLinePushDe1


PicStage20Face3bmp_Line_155:
call BitmapPush8
defw BitmapData+1645
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0AEE
  Push HL
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1659
LD DE,&0F0F
call MultiPushDe6
call BitmapPush20
defw BitmapData+1679
LD DE,&FFFF
  PUSH DE
  PUSH DE
LD BC,&99FF
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&11F0
  Push HL
LD BC,&7000
 jp NextLinePushBC 


PicStage20Face3bmp_Line_157:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF3B
  Push HL
LD BC,&0ACE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1693
LD DE,&0F0F
call MultiPushDe5
call BitmapPush22
defw BitmapData+1715
LD DE,&FFFF
call MultiPushDe6
LD HL,&33F0
  Push HL
LD BC,&F010
 jp NextLinePushBC 


PicStage20Face3bmp_Line_159:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

call MultiPushDe6
call BitmapPush18
defw BitmapData+1733
Call PushDE_0F0Fx
call BitmapPush8
defw BitmapData+1741
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&C003
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1747
DEC DE

call MultiPushDe6
LD BC,&77E0
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_161:
LD HL,&0F0F
  Push HL
LD BC,&0F01
  Push BC
DEC DE

call MultiPushDe6
LD HL,&FF1F
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD BC,&4803
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1753
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F87
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0012
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+1761
DEC DE

call MultiPushDe5
LD BC,&77E6
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_163:
LD HL,&0F0F
  Push HL
LD BC,&0F89
  Push BC
DEC DE

call MultiPushDe6
LD HL,&F31E
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD BC,&0103
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1767
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&87F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1002
  Push BC
Call PushDE_0000x
call BitmapPush8
defw BitmapData+1775
DEC DE

call MultiPushDe5
LD HL,&77EE
  Push HL
LD BC,&3F3C
 jp NextLinePushBC 


PicStage20Face3bmp_Line_165:
LD HL,&0F0F
  Push HL
LD BC,&0F89
  Push BC
DEC DE

call MultiPushDe5
LD HL,&FFF7
  Push HL
LD BC,&F03C
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0300
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
LD HL,&3C07
  Push HL
  PUSH DE
Ld C,&0E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1783
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&1EF0
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0A02
  Push HL
LD BC,&CCFF
  Push BC
Call PushDE_FFFFx
LD HL,&772C
  Push HL
LD BC,&0F2D
 jp NextLinePushBC 


PicStage20Face3bmp_Line_167:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

call MultiPushDe5
LD HL,&7FF0
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
Call PushDE_0000x
call BitmapPush6
defw BitmapData+1789
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1807
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
  Push BC
LD HL,&CCFF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&33F0
  Push BC
LD HL,&3C3C
  jp NextLinePushHl 


PicStage20Face3bmp_Line_169:
call BitmapPush6
defw BitmapData+1813
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1829
INC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1835
  PUSH DE
call BitmapPush6
defw BitmapData+1841
  PUSH DE
LD HL,&7803
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+1849
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe5
LD BC,&80F0
  Push BC
LD HL,&F03C
  jp NextLinePushHl 


PicStage20Face3bmp_Line_171:
call BitmapPush6
defw BitmapData+1813
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1867
INC DE

  PUSH DE
  PUSH DE
LD HL,&0400
  Push HL
  PUSH DE
LD BC,&780F
  Push BC
  PUSH DE
  PUSH DE
LD HL,&00F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&C003
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+1875
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe6
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_173:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&0A0F
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1885
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1891
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E007
  Push HL
  PUSH DE
LD BC,&0E0F
  Push BC
LD HL,&6100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0003
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+1905
call MultiPushDe6
LD HL,&70E0
  jp NextLinePushHl 


PicStage20Face3bmp_Line_175:
call BitmapPush12
defw BitmapData+1917
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
LD BC,&F078
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1923
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C003
  Push HL
  PUSH DE
LD BC,&0C0F
  Push BC
LD HL,&E170
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1939
call MultiPushDe5
LD BC,&80F0
 jp NextLinePushBC 


PicStage20Face3bmp_Line_177:
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1965
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8001
  Push HL
  PUSH DE
LD BC,&080F
  Push BC
LD HL,&E110
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1971
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&0E0F
  Push BC
  PUSH DE
LD HL,&0200
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast6


PicStage20Face3bmp_Line_179:
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1989
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&003C
  Push HL
LD BC,&0700
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&01
  Push HL
  PUSH DE
LD BC,&000F
  Push BC
LD HL,&6100
  Push HL
call MultiPushDe5
LD BC,&C0D2
  Push BC
LD HL,&7838
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1995
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face3bmp_Line_181:
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2013
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&032C
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&000E
  Push HL
Ld B,&30
  Push BC
call MultiPushDe5
LD HL,&78E1
  Push HL
LD BC,&F01A
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1995
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face3bmp_Line_183:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2027
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&070C
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&000C
  Push HL
Ld B,&10
  Push BC
  PUSH DE
Ld L,&02
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2033
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2039
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face3bmp_Line_185:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2053
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2061
LD DE,&0000
call MultiPushDe5
LD HL,&0008
  Push HL
  PUSH DE
  PUSH DE
LD BC,&002C
  Push BC
LD HL,&0100
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+2067
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2039
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face3bmp_Line_187:
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2093
call MultiPushDe8
LD HL,&00C0
  Push HL
LD BC,&0F01
  Push BC
  PUSH DE
LD HL,&68E1
  Push HL
LD BC,&F0F0
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2099
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face3bmp_Line_189:
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2119
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe5
LD HL,&0002
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2141
jp MultiPushDeLast6


PicStage20Face3bmp_Line_191:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2153
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2163
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0043
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2185
jp MultiPushDeLast6


PicStage20Face3bmp_Line_193:
  PUSH DE
  PUSH DE
LD HL,&080F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2199
  PUSH DE
call BitmapPush6
defw BitmapData+2205
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&08C3
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&3080
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2215
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face3bmp_Line_195:
  PUSH DE
  PUSH DE
LD HL,&0C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2229
  PUSH DE
call BitmapPush14
defw BitmapData+2243
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2128
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2249
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face3bmp_Line_197:
  PUSH DE
  PUSH DE
LD HL,&0C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2259
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2275
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2283
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2289
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face3bmp_Line_199:
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2295
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2317
Call PushDE_F0F0x
LD BC,&380A
  Push BC
Ld H,C
Ld L,C

  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2323
LD DE,&0000
jp MultiPushDeLast5



PicStage20Face3bmp_DrawOrder: 

  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_1
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_3
  DEFW PicStage20Face3bmp_Line_4
  DEFW PicStage20Face3bmp_Line_5
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_7
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_9
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_11
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_13
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_15
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_17
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_19
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_21
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_23
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_25
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_27
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_29
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_31
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_33
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_35
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_37
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_39
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_41
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_43
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_45
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_47
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_49
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_51
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_53
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_55
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_57
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_59
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_61
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_63
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_65
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_67
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_69
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_71
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_73
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_75
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_77
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_79
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_81
  DEFW PicStage20Face3bmp_Line_0
  DEFW PicStage20Face3bmp_Line_83
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_85
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_87
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_89
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_91
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_93
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_95
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_97
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_99
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_101
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_103
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_105
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_107
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_109
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_111
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_113
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_115
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_117
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_119
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_121
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_123
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_125
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_127
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_129
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_131
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_133
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_135
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_137
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_139
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_141
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_143
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_145
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_147
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_149
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_151
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_153
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_155
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_157
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_159
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_161
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_163
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_165
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_167
  DEFW PicStage20Face3bmp_Line_30
  DEFW PicStage20Face3bmp_Line_169
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_171
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_173
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_175
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_177
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_179
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_181
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_183
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_185
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_187
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_189
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_191
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_193
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_195
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_197
  DEFW PicStage20Face3bmp_Line_4_Reuse
  DEFW PicStage20Face3bmp_Line_199
  DEFW EndCode







;Global Code
EndCode:
ld sp,(StackRestore_Plus2-2)
ei
ret

MultiPushDeLast40: ld HL,NextLine
jp MultiPushDe40B 
MultiPushDe40: pop HL
jp MultiPushDe40B 
MultiPushDe24: pop HL
jr MultiPushDe24B 
MultiPushDe23: pop HL
jr MultiPushDe23B 
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDe17: pop HL
jr MultiPushDe17B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe15: pop HL
jr MultiPushDe15B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDe13: pop HL
jr MultiPushDe13B 
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
MultiPushDeLast7: ld HL,NextLine
jr MultiPushDe7B 
MultiPushDe7: pop HL
jr MultiPushDe7B 
MultiPushDeLast6: ld HL,NextLine
jr MultiPushDe6B 
MultiPushDe6: pop HL
jr MultiPushDe6B 
MultiPushDeLast5: ld HL,NextLine
jr MultiPushDe5B 
MultiPushDe5: pop HL
jr MultiPushDe5B 
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

BitmapPush30: ld b,&0F
jr BitmapPush
BitmapPush26: ld b,&0D
jr BitmapPush
BitmapPush24: ld b,&0C
jr BitmapPush
BitmapPush22: ld b,&0B
jr BitmapPush
BitmapPush20: ld b,&0A
jr BitmapPush
BitmapPush18: ld b,&09
jr BitmapPush
BitmapPush16: ld b,&08
jr BitmapPush
BitmapPush14: ld b,&07
jr BitmapPush
BitmapPush12: ld b,&06
jr BitmapPush
BitmapPush10: ld b,&05
jr BitmapPush
BitmapPush8: ld b,&04
jr BitmapPush
BitmapPush6: ld b,&03
jr BitmapPush

finalBitmapPush18: ld b,&09
jr finalBitmapPush

finalBitmapPush14: ld b,&07
jr finalBitmapPush

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
ld hl,&0850
add hl,sp
ei
ld sp,&0000:StackRestore_Plus2
di
ld sp,hl
Background_CompiledSprite_Minus1:
bit 7,h
jp z,JumpToNextLine
ld hl,&c050
add hl,sp
ld sp,hl
;push hl
jp JumpToNextLine
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


BitmapData: 

defb &0F,&0A,&08,&00,&00,&00,&02,&0A,&0A,&0A
defb &0A,&0F,&0E,&0A,&0A,&0A,&0B,&0F,&0F,&0A
defb &0A,&0A,&0A,&0B,&0F,&0E,&0A,&0A,&0B,&0F
defb &00,&02,&0A,&0A,&0B,&0F,&08,&00,&00,&02
defb &0A,&0F,&08,&00,&00,&02,&0A,&0B,&0A,&00
defb &00,&02,&0A,&0B,&0E,&0A,&0A,&0F,&0F,&0F
defb &0F,&0E,&0E,&0A,&0F,&0F,&0F,&0E,&0A,&08
defb &00,&11,&FF,&FF,&0F,&0E,&0B,&0F,&0F,&0A
defb &FF,&FF,&EE,&00,&00,&00,&00,&0A,&0A,&0B
defb &FF,&00,&00,&0A,&0A,&0B,&EE,&0B,&0F,&1E
defb &F0,&C3,&0F,&0A,&0A,&0A,&0A,&7F,&FF,&8A
defb &0A,&1A,&F0,&F0,&F0,&87,&0F,&0E,&08,&00
defb &77,&FF,&FF,&FF,&FF,&EE,&87,&0F,&0F,&0F
defb &0F,&0E,&0F,&0E,&08,&00,&00,&02,&3C,&F0
defb &F0,&C3,&0F,&0F,&1E,&F0,&0F,&F0,&F0,&0F
defb &0F,&0F,&1E,&F0,&78,&F0,&F0,&F0,&C3,&0F
defb &F0,&0F,&0F,&0F,&0E,&0A,&0F,&78,&F0,&87
defb &0F,&0F,&0F,&78,&C3,&0F,&3C,&F0,&F0,&0F
defb &0A,&0F,&08,&00,&00,&0A,&F0,&87,&0F,&0F
defb &0F,&0E,&E1,&0F,&0F,&0F,&0F,&1F,&FC,&87
defb &0F,&78,&F0,&0F,&0F,&0F,&0F,&0E,&F0,&0F
defb &1E,&F0,&87,&0F,&0F,&0F,&3C,&F0,&0F,&1E
defb &F0,&F0,&F0,&0F,&02,&0A,&08,&00,&00,&0A
defb &69,&0F,&0F,&1E,&F0,&F0,&F7,&FE,&F6,&F0
defb &F0,&C3,&C3,&0F,&0F,&0F,&78,&F0,&69,&0F
defb &79,&FF,&FF,&FF,&FF,&FC,&00,&0A,&08,&00
defb &02,&0A,&0F,&3F,&FF,&FF,&EF,&0F,&0F,&0F
defb &0F,&0E,&F0,&C3,&0F,&0F,&0F,&F0,&00,&02
defb &08,&00,&02,&0A,&00,&02,&0A,&00,&02,&0A
defb &87,&0F,&0F,&0F,&78,&F0,&00,&00,&0A,&00
defb &02,&0A,&0A,&1B,&FF,&88,&87,&0F,&0F,&0F
defb &F0,&E1,&0F,&0F,&1E,&F0,&00,&80,&30,&F0
defb &C2,&7F,&FF,&CC,&87,&0F,&0F,&0F,&F4,&C3
defb &78,&F0,&F0,&E1,&7F,&FF,&F0,&0F,&0F,&0F
defb &0F,&1E,&FF,&8E,&F0,&F0,&E1,&0F,&F2,&F0
defb &F0,&F0,&F0,&87,&78,&7F,&F0,&87,&0F,&3C
defb &F0,&F0,&0F,&3C,&F0,&F0,&F0,&C3,&FF,&EE
defb &0A,&0F,&3C,&E1,&0F,&0F,&FF,&CC,&07,&0F
defb &0F,&0F,&C0,&00,&00,&00,&00,&10,&F3,&F0
defb &F0,&F0,&D2,&F0,&F0,&0F,&3F,&FF,&E1,&0F
defb &0F,&0F,&0F,&3C,&F0,&C3,&0F,&1E,&F0,&E1
defb &0F,&78,&66,&00,&01,&0F,&0F,&78,&CC,&00
defb &10,&87,&0F,&0F,&0F,&08,&F0,&E1,&0F,&3C
defb &91,&FF,&FF,&CE,&07,&0F,&0F,&0F,&F0,&E1
defb &0F,&3C,&F0,&E1,&FF,&88,&00,&00,&10,&F0
defb &E1,&0F,&0C,&00,&00,&00,&00,&11,&88,&00
defb &00,&00,&C3,&0F,&0F,&1E,&33,&FF,&FF,&88
defb &07,&0F,&0F,&0F,&11,&EE,&30,&F0,&F0,&F0
defb &00,&07,&0F,&F0,&F0,&F0,&E1,&3C,&F0,&F0
defb &0F,&0F,&69,&0F,&0F,&0F,&0F,&3C,&F0,&F0
defb &C0,&00,&01,&0F,&0F,&0F,&0C,&00,&0F,&0F
defb &0F,&1E,&33,&FF,&11,&FF,&00,&70,&D2,&C3
defb &0F,&0F,&0F,&78,&91,&FF,&FF,&FF,&EE,&00
defb &0A,&0A,&0A,&FF,&FF,&FF,&EE,&01,&11,&FF
defb &EE,&30,&F0,&C3,&F0,&0F,&0F,&0F,&0F,&1E
defb &F0,&E0,&0F,&0F,&0F,&78,&91,&FF,&FF,&CC
defb &00,&FF,&FF,&CC,&F0,&F0,&E1,&0F,&0F,&F0
defb &C2,&0A,&0A,&0A,&0A,&1B,&EE,&03,&F0,&87
defb &0F,&0F,&0F,&78,&F0,&00,&00,&33,&FF,&FF
defb &CF,&F0,&0F,&1E,&F0,&87,&0F,&0A,&F0,&87
defb &0F,&0F,&1E,&F0,&80,&00,&00,&70,&FF,&FF
defb &FF,&CB,&0F,&3C,&87,&0F,&0F,&0E,&F0,&87
defb &0F,&0F,&78,&E0,&00,&00,&10,&F0,&00,&F0
defb &F0,&C0,&33,&FF,&FF,&FF,&77,&FF,&FF,&FF
defb &8F,&3C,&F0,&87,&0F,&3C,&F0,&80,&00,&00
defb &30,&F0,&00,&70,&F1,&FF,&FF,&FF,&FF,&CC
defb &11,&FF,&FF,&FF,&FF,&FE,&F0,&0F,&0F,&F0
defb &E0,&00,&00,&00,&FF,&0F,&0F,&0F,&0E,&0A
defb &E1,&0F,&1E,&F0,&80,&00,&00,&30,&00,&70
defb &F0,&F0,&F0,&80,&00,&F0,&F0,&F0,&F0,&80
defb &00,&07,&1E,&F0,&F0,&F0,&87,&0F,&1E,&F0
defb &CE,&0A,&0A,&30,&0C,&00,&00,&70,&F0,&F0
defb &E0,&00,&00,&30,&F0,&F0,&F0,&C0,&FF,&30
defb &87,&0F,&0F,&0F,&00,&F0,&96,&87,&E0,&00
defb &00,&30,&96,&C3,&78,&C0,&FF,&98,&C3,&0F
defb &0F,&0F,&00,&C3,&0F,&0F,&C0,&00,&FF,&FE
defb &F0,&F0,&0E,&00,&C3,&0F,&0F,&C0,&00,&11
defb &00,&C3,&0F,&1E,&C0,&00,&EE,&10,&F0,&F0
defb &0F,&08,&F0,&0F,&0F,&0F,&0F,&0E,&00,&00
defb &00,&C3,&0F,&1E,&C0,&00,&00,&00,&C3,&0F
defb &0F,&C0,&00,&00,&88,&00,&00,&00,&03,&3C
defb &B7,&FF,&FF,&EE,&00,&10,&F0,&F0,&0F,&08
defb &E1,&0F,&0F,&0F,&0F,&0E,&00,&00,&00,&C3
defb &0F,&0F,&C0,&00,&00,&00,&C3,&0F,&1E,&C0
defb &00,&00,&44,&00,&00,&00,&07,&1E,&87,&3F
defb &0F,&0F,&0F,&0E,&00,&00,&00,&E1,&0F,&0F
defb &C0,&00,&00,&00,&C3,&0F,&1E,&C0,&00,&00
defb &66,&00,&00,&00,&0F,&1E,&C3,&1E,&F3,&FF
defb &00,&30,&F0,&F0,&C3,&0F,&F0,&F0,&1E,&87
defb &08,&00,&0F,&0F,&0F,&0E,&00,&00,&00,&E1
defb &0F,&0F,&C0,&00,&00,&00,&C3,&0F,&78,&C0
defb &00,&00,&77,&00,&00,&03,&0F,&0F,&C3,&1E
defb &F0,&F1,&00,&70,&F0,&F0,&87,&0F,&F0,&F0
defb &1E,&87,&0C,&00,&00,&33,&FF,&00,&0F,&0E
defb &00,&00,&00,&F0,&F0,&F0,&E0,&00,&00,&10
defb &C3,&F0,&F0,&80,&00,&00,&77,&CC,&01,&0F
defb &0F,&0F,&C3,&1E,&F0,&F0,&F1,&FF,&00,&F0
defb &F0,&F0,&87,&0F,&0F,&0F,&78,&F0,&87,&C3
defb &0E,&00,&11,&FF,&EE,&00,&0F,&1E,&33,&FF
defb &FF,&FF,&FF,&00,&C3,&0F,&F0,&F0,&F0,&0F
defb &00,&00,&00,&70,&F0,&F0,&F0,&00,&00,&30
defb &F0,&F0,&F0,&80,&00,&00,&33,&EE,&07,&0F
defb &07,&F0,&F0,&F0,&E1,&0F,&78,&F0,&F0,&F0
defb &0F,&0E,&77,&FF,&EE,&00,&0F,&E1,&11,&FF
defb &CC,&00,&69,&0F,&F0,&F0,&F0,&0F,&F0,&00
defb &00,&00,&00,&FF,&00,&01,&0F,&F0,&F0,&F0
defb &E1,&0F,&78,&F0,&F0,&F0,&0F,&F3,&FF,&FF
defb &88,&00,&00,&7F,&EF,&0F,&0F,&0F,&69,&0F
defb &78,&F0,&F0,&0F,&0F,&0F,&0A,&0A,&08,&00
defb &07,&0F,&0F,&0C,&07,&0F,&0F,&F0,&F0,&F0
defb &87,&0F,&38,&F0,&F0,&B4,&7F,&FF,&FF,&FF
defb &03,&3F,&FF,&EF,&0F,&0F,&78,&0F,&78,&F0
defb &E1,&0F,&0F,&0E,&0A,&0A,&08,&00,&00,&02
defb &38,&F0,&D3,&FF,&FF,&FF,&FF,&CF,&0F,&08
defb &00,&00,&07,&0F,&0F,&3C,&F0,&F0,&F0,&C3
defb &0F,&01,&0F,&1F,&FF,&FF,&EF,&0F,&3C,&87
defb &78,&F0,&E1,&0F,&0F,&0E,&0A,&0A,&08,&00
defb &0F,&3C,&F0,&F0,&F0,&0F,&0F,&01,&1E,&87
defb &78,&F0,&C3,&0F,&0F,&0A,&0A,&0A,&00,&00
defb &00,&03,&0F,&0F,&0F,&00,&00,&00,&30,&F0
defb &1E,&F0,&F0,&F0,&E1,&0F,&0E,&01,&03,&0F
defb &0F,&0F,&3F,&FF,&FF,&FF,&FF,&87,&F0,&F0
defb &0F,&0F,&0F,&0A,&7F,&FF,&EE,&07,&0C,&00
defb &0F,&0E,&00,&00,&00,&70,&C3,&78,&F0,&0F
defb &0F,&0F,&08,&00,&00,&00,&30,&F0,&F0,&F0
defb &80,&00,&00,&07,&0F,&F0,&F0,&87,&C3,&0F
defb &00,&00,&00,&80,&00,&00,&0F,&78,&F0,&87
defb &F0,&0F,&1E,&F0,&F0,&F0,&E1,&0E,&00,&07
defb &FF,&FC,&E1,&0F,&3C,&F0,&F0,&F0,&87,&78
defb &F0,&0F,&3C,&0F,&0F,&F0,&F0,&F0,&E1,&0C
defb &00,&0F,&8A,&78,&F0,&0F,&1E,&F0,&F0,&F0
defb &0F,&78,&F0,&87,&F0,&3C,&0F,&3C,&F0,&F0
defb &E1,&00,&01,&0F,&FF,&89,&1E,&F0,&F0,&F0
defb &E1,&3C,&87,&0F,&F0,&F0,&C3,&00,&07,&0F
defb &FF,&02,&0A,&0B,&78,&E1,&69,&78,&0E,&0A
defb &0A,&7F,&FF,&FF,&8A,&00,&00,&03,&0F,&0F
defb &F0,&87,&E1,&1E,&F0,&0F,&78,&F0,&C3,&00
defb &FF,&EE,&00,&02,&0A,&0B,&F0,&C0,&43,&0F
defb &0A,&00,&00,&03,&0F,&0F,&F0,&0F,&08,&11
defb &CF,&0F,&0F,&0F,&0F,&1E,&F0,&0A,&E1,&1E
defb &F0,&87,&3C,&F0,&C3,&00,&07,&0F,&00,&0A
defb &0A,&0B,&F0,&E0,&00,&0F,&1E,&F0,&0F,&08
defb &00,&11,&EF,&0F,&0F,&0F,&0F,&78,&F0,&0A
defb &E1,&3C,&96,&E1,&1E,&F0,&C3,&08,&00,&0F
defb &00,&0A,&0A,&1A,&F0,&A4,&00,&00,&0F,&F0
defb &B7,&CF,&3C,&C0,&FF,&FF,&CC,&00,&0F,&08
defb &00,&00,&00,&01,&FF,&8F,&0F,&0F,&0F,&78
defb &F0,&0A,&00,&0A,&0A,&0A,&F0,&C3,&00,&00
defb &01,&0F,&00,&03,&FF,&FF,&0F,&0F,&0F,&F0
defb &E0,&0A,&87,&F0,&0F,&F0,&C3,&0F,&00,&00
defb &07,&0F,&00,&0A,&0A,&0A,&F0,&E1,&00,&00
defb &00,&10,&0F,&08,&12,&E0,&00,&00,&00,&07
defb &7F,&FF,&EF,&0F,&0F,&F0,&E0,&0A,&96,&F0
defb &0F,&F0,&C3,&0F,&0E,&00,&00,&07,&00,&0A
defb &0A,&0A,&79,&EF,&00,&03,&3C,&80,&00,&00
defb &00,&07,&1F,&FF,&FF,&8F,&1E,&F0,&C2,&0A
defb &00,&0A,&0A,&1B,&FF,&E9,&08,&00,&00,&00
defb &00,&07,&0E,&00,&01,&0F,&78,&00,&00,&00
defb &00,&0F,&0F,&FF,&FF,&FF,&BC,&F0,&82,&0A
defb &00,&0A,&3B,&FF,&FE,&F0,&08,&00,&02,&00
defb &07,&00,&07,&F0,&0F,&0E,&00,&00,&00,&0F
defb &C0,&00,&00,&00,&00,&0F,&0F,&7F,&FF,&FF
defb &FF,&F8,&82,&0A,&33,&FF,&FF,&FF,&38,&F0
defb &0E,&0F,&68,&00,&07,&2C,&00,&70,&0A,&00
defb &77,&EE,&07,&0F,&0F,&00,&0F,&00,&00,&00
defb &00,&0F,&C0,&00,&00,&00,&03,&0F,&0F,&1F
defb &FF,&CE,&1A,&F0,&87,&07,&C0,&00,&07,&78
defb &C0,&00,&10,&F0,&F0,&E1,&0F,&F0,&F0,&E1
defb &00,&40,&00,&00,&00,&12,&00,&00,&12,&80
defb &03,&0F,&0F,&0F,&FF,&0A,&0A,&F0,&4B,&18
defb &80,&00,&03,&68,&00,&00,&00,&30,&F0,&E1
defb &0F,&F0,&F0,&F0,&C3,&0F,&0E,&00,&70,&80
defb &00,&00,&00,&02,&00,&00,&03,&E0,&07,&0F
defb &0F,&0F,&7F,&FF,&70,&F0,&1E,&F0,&F0,&F0
defb &87,&0F,&8A,&0A,&0A,&78,&A5,&0C,&0F,&0E
defb &00,&07,&F0,&00,&FF,&8A,&0A,&0A,&0A,&38
defb &D2,&0E,&08,&00,&0F,&0F,&E0,&00,&CE,&0A
defb &0A,&0A,&0A,&1A,&F0,&86,&03,&08,&30,&F0
defb &F0,&F0,&F0,&C3,&00,&70,&C0,&00,&03,&3C
defb &78,&E1,&0C,&00,&00,&00,&03,&48,&00,&00
defb &03,&3C,&C0,&70,&F0,&F0,&F0,&C3,&FF,&EE
defb &07,&0F,&0F,&0F,&24,&00,&00,&00,&01,&0F
defb &0F,&0F,&0F,&1E,&F0,&F0,&E0,&0A,&7F,&FF
defb &0F,&78,&80,&00,&00,&2C,&F0,&F0,&F0,&E1
defb &0F,&0F,&29,&78,&69,&00,&00,&03,&1E,&80
defb &3C,&00,&00,&00,&07,&0F,&0F,&0F,&0F,&78
defb &F0,&F0,&C2,&0A,&0A,&0A,&3B,&FF,&0A,&78
defb &87,&84,&03,&0F,&3C,&80,&0F,&F0,&F0,&F0
defb &82,&0A,&0A,&0A,&0B,&0F,&00,&01,&3C,&C0
defb &00,&00,&0A,&0A,&0F,&0A,&0A,&0A,&0A,&78
defb &F0,&0F,&C0,&07,&78,&00,&0F,&0E,&0B,&0F
defb &0F,&0E,&08,&00,&00,&03,&0F,&0F,&00,&03
defb &3C,&F0,&00,&03,&00,&02,&0A,&0A,&0F,&0A
defb &0A,&0A,&0A,&1A,&F0,&B4,&3C,&01,&E0,&00
defb &00,&03,&3C,&C0,&01,&0F,&0F,&0F,&0F,&1E
defb &F0,&F0,&F0,&82,&0A,&0A,&0A,&0B,&0F,&0A
defb &0B,&0F,&0F,&0F,&0C,&00,&F0,&69,&5A,&80
defb &C0,&00,&0F,&78,&F0,&F0,&F0,&82,&0A,&0A
defb &0A,&0F,&0F,&0A,&0A,&0B,&0F,&0F,&0C,&00
defb &00,&0A,&0A,&0B,&0F,&0E,&3C,&F0,&F0,&F0
defb &E0,&0A,&0A,&0F,&0F,&0F,&0F,&0A,&0A,&0B
defb &0F,&0F,&0C,&00,&C2,&0A,&0B,&0F,&0F,&0F
defb &0F,&0E,&0A,&0B,&0F,&0F,&0C,&00,&0A,&78
defb &F0,&C3,&80,&00,&02,&0A,&0A,&0F,&0F,&0E
defb &0A,&0A,&0B,&0F,&0F,&0F,&0F,&0E,&0A,&0B
defb &0F,&0F,&0F,&00,&00,&0F,&01,&0F,&0F,&0F
defb &0F,&3C,&0A,&38,&F0,&78,&68,&00,&00,&0E
defb &03,&0F,&0F,&0F,&0F,&F0,&F0,&F0,&F0,&C2
defb &0A,&0A,&0B,&0E,&0F,&0F,&0F,&0E,&0A,&0F
defb &0F,&0F,&0F,&08,&02,&0A,&0B,&0F,&0F,&0F
defb &78,&F0,&F0,&F0,&E0,&0A,&0A,&0A,&0F,&0E
defb &0B,&0F,&0F,&0F,&0A,&0F,&0F,&0F,&0F,&08
defb &02,&0A,&0B,&0F,&0F,&0F,&0A,&0A,&0A,&0F
defb &0A,&0A,&78,&F0,&C3,&D2,&80,&00,&0F,&3C
defb &C0,&00,&0F,&0A,&0B,&0F,&0F,&0F,&0B,&0F
defb &0F,&0F,&0F,&08,&04,&00,&00,&00,&00,&01
defb &0F,&0F,&0F,&3C,&0A,&0A,&0B,&0F,&0F,&0F
defb &0A,&0A,&0A,&0F,&0E,&0A,&0A,&F0,&F0,&78
defb &F0,&00,&03,&F0,&80,&00,&1E,&F0,&F0,&F0
defb &F0,&C2,&0A,&0A,&0A,&0B,&0F,&0A,&0B,&0F
defb &87,&00,&00,&00,&00,&0F,&0A,&0F,&0A,&0A
defb &0B,&0F,&0F,&0A,&0A,&38,&78,&F0,&F0,&F0
defb &F0,&0A,&0A,&0A,&0A,&0B,&0F,&0A,&0A,&0F
defb &00,&30,&87,&0C,&00,&00,&00,&30,&87,&08
defb &00,&00,&07,&0F,&00,&02,&0A,&0F,&0E,&0A
defb &82,&0A,&0A,&0A,&0A,&0B,&0E,&0A,&0A,&0F
defb &00,&F0,&0F,&0F,&00,&00,&00,&F0,&0F,&0C
defb &00,&07,&0F,&0F,&0F,&3C,&0F,&0F,&0F,&0E
defb &0A,&0A,&38,&F0,&00,&02,&0B,&0F,&0F,&0A
defb &0A,&0F,&0E,&0A,&0A,&0B,&C0,&00,&10,&E1
defb &0F,&0F,&08,&00,&10,&F0,&0F,&0E,&87,&0F
defb &0F,&0F,&3C,&F0,&F0,&F0,&F0,&E0,&00,&02
defb &0F,&0F,&0F,&0E
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









LevelEnd:
list
defb 0
save direct "T32-SC2.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]