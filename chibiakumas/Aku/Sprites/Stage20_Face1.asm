read "..\CoreDefs.asm" ;read "BootStrap.asm"
org &4000
jp PicStage20Face1bmp

PicStage20Face1bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Face1bmp_DrawOrder
JP JumpToNextLine


PicStage20Face1bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicStage20Face1bmp_Line_1:
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


PicStage20Face1bmp_Line_3:
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


PicStage20Face1bmp_Line_4:
jp MultiPushDeLast40


PicStage20Face1bmp_Line_5:
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


PicStage20Face1bmp_Line_4_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Line_4
PicStage20Face1bmp_Line_7:
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


PicStage20Face1bmp_Line_9:
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


PicStage20Face1bmp_Line_11:
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


PicStage20Face1bmp_Line_13:
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


PicStage20Face1bmp_Line_15:
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


PicStage20Face1bmp_Line_17:
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


PicStage20Face1bmp_Line_19:
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


PicStage20Face1bmp_Line_21:
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


PicStage20Face1bmp_Line_23:
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
LD BC,&080E
 jp NextLinePushBC 


PicStage20Face1bmp_Line_25:
LD HL,&0B02
  Push HL
  PUSH DE
LD BC,&080A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
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
LD BC,&080E
 jp NextLinePushBC 


PicStage20Face1bmp_Line_27:
LD HL,&0A02
  Push HL
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0A0E
  Push BC
LD HL,&0F0A
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
LD HL,&0B0A
  Push HL
Ld C,&00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0A0E
  jp NextLinePushHl 


PicStage20Face1bmp_Line_29:
LD HL,&0A00
  Push HL
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
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
LD HL,&0F09
  Push HL
Ld C,&0A
  Push BC
  PUSH DE
LD HL,&0B0A
  Push HL
Ld C,&00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0A0E
  jp NextLinePushHl 


PicStage20Face1bmp_Line_31:
LD HL,&0A00
  Push HL
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
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
  PUSH DE
call FinalBitmapPush14
defw BitmapData+87


PicStage20Face1bmp_Line_33:
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
Ld L,&0E
  Push HL
LD DE,&0F0F
call MultiPushDe24
LD BC,&E178
  Push BC
  PUSH DE
call FinalBitmapPush14
defw BitmapData+101


PicStage20Face1bmp_Line_35:
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
Ld L,&0E
  Push HL
LD DE,&0F0F
call MultiPushDe24
call FinalBitmapPush18
defw BitmapData+119


PicStage20Face1bmp_Line_37:
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
Ld L,&0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe20
LD BC,&3C0F
  Push BC
LD HL,&2D0F
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+125
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+131


PicStage20Face1bmp_Line_39:
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
Ld L,&0F
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
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+137


PicStage20Face1bmp_Line_41:
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
defw BitmapData+143
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
defw BitmapData+149


PicStage20Face1bmp_Line_43:
LD HL,&FF33
  Push HL
LD BC,&0008
  Push BC
LD DE,&0A0A
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
defw BitmapData+157
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
defw BitmapData+163


PicStage20Face1bmp_Line_45:
DEC DE

  PUSH DE
  PUSH DE
LD HL,&1B0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0F0F
  Push BC
LD HL,&0FF0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush8
defw BitmapData+171
Call PushDE_0F0Fx
LD BC,&F01E
  Push BC
LD HL,&0FC3
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1E0F
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+177
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+183


PicStage20Face1bmp_Line_47:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+193
LD DE,&F0F0
call MultiPushDe7
call BitmapPush8
defw BitmapData+201
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+207
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
LD HL,&0A00
  Push HL
LD DE,&FFFF
 jp NextLinePushDe2


PicStage20Face1bmp_Line_48:
INC DE

jp MultiPushDeLast40


PicStage20Face1bmp_Line_49:
Call PushDE_FFFFx
call BitmapPush8
defw BitmapData+215
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
LD HL,&0AEE
  Push HL
LD DE,&FFFF
 jp NextLinePushDe2


PicStage20Face1bmp_Line_51:
DEC DE

call MultiPushDe6
call BitmapPush8
defw BitmapData+223
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+233
  PUSH DE
  PUSH DE
LD BC,&0FE1
  Push BC
  PUSH DE
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+239
  PUSH DE
LD HL,&0F69
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&CEFF
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Face1bmp_Line_53:
DEC DE

call MultiPushDe7
call BitmapPush6
defw BitmapData+245
LD DE,&0F0F
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
LD BC,&C3F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&1E
  Push HL
LD BC,&0F69
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8AFF
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicStage20Face1bmp_Line_55:
DEC DE

call MultiPushDe5
LD HL,&3F0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+251
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F03C
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Call PushDE_F0F0x
Ld C,&78
  Push BC
LD HL,&0F69
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&EEFF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF33
  jp NextLinePushHl 


PicStage20Face1bmp_Line_57:
LD HL,&FFFF
  Push HL
LD BC,&110A
  Push BC
Ld D,C
Ld E,C

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
LD BC,&3C0F
  Push BC
call MultiPushDe5
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+257
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

call MultiPushDe5
LD BC,&F038
  Push BC
LD HL,&0A0A
  Push HL
LD DE,&FFFF
call MultiPushDe5
LD BC,&0200
 jp NextLinePushBC 


PicStage20Face1bmp_Line_59:
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
LD BC,&0F87
  Push BC
Ld H,&1E
  Push HL
call MultiPushDe5
Ld C,&C3
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
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&F01A
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&8AFF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&330A
  Push HL
LD BC,&0200
 jp NextLinePushBC 


PicStage20Face1bmp_Line_61:
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
call BitmapPush8
defw BitmapData+265
LD DE,&0F0F
call MultiPushDe7
LD HL,&0FF0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
Ld L,&E1
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+271
call MultiPushDe7
LD BC,&F00A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+277


PicStage20Face1bmp_Line_63:
LD HL,&0200
  Push HL
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+285
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0FC3
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+291
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+297
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+303


PicStage20Face1bmp_Line_65:
LD HL,&0200
  Push HL
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+309
Call PushDE_F0F0x
call BitmapPush6
defw BitmapData+315
  PUSH DE
  PUSH DE
LD BC,&0F87
  Push BC
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Ld C,&C3
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+331
LD DE,&0000
 jp NextLinePushDe2


PicStage20Face1bmp_Line_67:
LD HL,&0300
  Push HL
LD BC,&0008
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+339
LD DE,&F0F0
call MultiPushDe6
LD HL,&F01E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+351
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
call BitmapPush10
defw BitmapData+361
  PUSH DE
LD BC,&000A
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
LD BC,&80F0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_69:
LD HL,&0F03
  Push HL
LD BC,&0008
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+369
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+375
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+381
  PUSH DE
call BitmapPush8
defw BitmapData+389
  PUSH DE
LD HL,&780F
  Push HL
LD BC,&0F01
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+395
  PUSH DE
LD HL,&0802
  Push HL
  PUSH DE
call FinalBitmapPush8
defw BitmapData+403


PicStage20Face1bmp_Line_71:
LD HL,&0F0F
  Push HL
LD BC,&0708
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0E
  Push HL
LD BC,&0F0F
  Push BC
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&7000
  Push BC
Call PushDE_0000x
LD HL,&E0F0
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+409
  PUSH DE
LD HL,&F0F0
  Push HL
LD BC,&F078
  Push BC
  PUSH DE
Call PushDE_0000x
call BitmapPush6
defw BitmapData+415
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0AE0
  Push BC
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face1bmp_Line_73:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+421
Call PushDE_0000x
call BitmapPush22
defw BitmapData+443
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+449
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face1bmp_Line_75:
call BitmapPush6
defw BitmapData+455
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+461
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
call MultiPushDe6
LD HL,&0E0F
  Push HL
LD BC,&0F01
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+469


PicStage20Face1bmp_Line_77:
call BitmapPush8
defw BitmapData+477
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0F0F
  Push HL
LD BC,&0FCF
  Push BC
LD DE,&FFFF
  PUSH DE
  PUSH DE
LD HL,&3300
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
Ld H,&30
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+485
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F078
  Push BC
LD HL,&0F01
  Push HL
LD DE,&0000
call MultiPushDe6
LD BC,&0E87
  Push BC
LD HL,&F010
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+495


PicStage20Face1bmp_Line_79:
LD HL,&0F0F
  Push HL
LD BC,&0F61
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FFD3
  Push HL
LD BC,&F8FF
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
INC DE

  PUSH DE
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
defw BitmapData+503
  PUSH DE
  PUSH DE
LD HL,&F01E
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&0C0F
  Push HL
Ld B,&E1
  Push BC
  PUSH DE
LD HL,&88FF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+509


PicStage20Face1bmp_Line_81:
LD HL,&0F0F
  Push HL
LD BC,&0F21
  Push BC
DEC DE

call MultiPushDe7
LD HL,&FF00
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+519
  PUSH DE
  PUSH DE
LD HL,&F00F
  Push HL
LD BC,&0100
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&C01E
  Push HL
Ld B,&0F
  Push BC
Call PushDE_FFFFx
call FinalBitmapPush6
defw BitmapData+525


PicStage20Face1bmp_Line_83:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

call MultiPushDe7
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+535
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
LD DE,&0000
call MultiPushDe7
LD HL,&C0FC
  Push HL
DEC DE

call MultiPushDe6
Ld B,&0E
  Push BC
LD HL,&0F07
  jp NextLinePushHl 


PicStage20Face1bmp_Line_85:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

call MultiPushDe6
LD HL,&FF01
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00C0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+545
  PUSH DE
  PUSH DE
LD HL,&1E03
  Push HL
LD DE,&0000
call MultiPushDe6
LD BC,&00CC
  Push BC
DEC DE

call MultiPushDe7
LD HL,&D13C
  Push HL
LD BC,&C3F0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_87:
call BitmapPush6
defw BitmapData+551
Call PushDE_FFFFx
LD HL,&FF7F
  Push HL
LD BC,&C301
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
Call PushDE_F0F0x
call BitmapPush8
defw BitmapData+559
  PUSH DE
  PUSH DE
LD BC,&0F01
  Push BC
LD DE,&0000
call MultiPushDe5
LD HL,&88FF
  Push HL
DEC DE

call MultiPushDe8
LD BC,&D13C
  Push BC
LD HL,&C3F0
  jp NextLinePushHl 


PicStage20Face1bmp_Line_89:
  PUSH DE
LD HL,&0E0F
  Push HL
LD BC,&88FF
  Push BC
Call PushDE_FFFFx
LD HL,&3D0F
  Push HL
LD BC,&C301
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&88F1
  Push HL
Call PushDE_F0F0x
call BitmapPush8
defw BitmapData+567
  PUSH DE
LD BC,&F078
  Push BC
LD HL,&0700
  Push HL
Call PushDE_0000x
LD BC,&EEFF
  Push BC
DEC DE

call MultiPushDe9
LD HL,&D1F0
  Push HL
LD BC,&B070
 jp NextLinePushBC 


PicStage20Face1bmp_Line_91:
  PUSH DE
  PUSH DE
LD HL,&000C
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+573
INC DE

  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+587
  PUSH DE
call BitmapPush10
defw BitmapData+597
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&88FF
  Push BC
DEC DE

call MultiPushDe10
LD HL,&D1B0
  Push HL
LD BC,&F030
 jp NextLinePushBC 


PicStage20Face1bmp_Line_93:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+611
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+625
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
call BitmapPush8
defw BitmapData+633
Call PushDE_FFFFx
LD BC,&91F0
  Push BC
LD HL,&3000
  jp NextLinePushHl 


PicStage20Face1bmp_Line_95:
LD HL,&0100
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+647
  PUSH DE
call BitmapPush16
defw BitmapData+663
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
call BitmapPush6
defw BitmapData+633
call MultiPushDe5
LD HL,&00E0
  Push HL
 jp NextLinePushDe1


PicStage20Face1bmp_Line_97:
LD HL,&0F03
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+677
  PUSH DE
call BitmapPush8
defw BitmapData+685
  PUSH DE
call BitmapPush6
defw BitmapData+691
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
defw BitmapData+697
jp MultiPushDeLast7


PicStage20Face1bmp_Line_99:
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+727
call BitmapPush6
defw BitmapData+733
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush6
defw BitmapData+739
jp MultiPushDeLast7


PicStage20Face1bmp_Line_101:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+769
call BitmapPush6
defw BitmapData+775
  PUSH DE
call BitmapPush6
defw BitmapData+781
LD DE,&0000
call MultiPushDe6
call BitmapPush6
defw BitmapData+739
call MultiPushDe6
LD HL,&00E0
  jp NextLinePushHl 


PicStage20Face1bmp_Line_103:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+809
  PUSH DE
call BitmapPush6
defw BitmapData+775
  PUSH DE
call BitmapPush6
defw BitmapData+815
LD DE,&0000
call MultiPushDe6
LD HL,&080F
  Push HL
LD BC,&E1F0
  Push BC
call MultiPushDe7
LD HL,&C0F0
  jp NextLinePushHl 


PicStage20Face1bmp_Line_105:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
LD BC,&3B0A
  Push BC
  PUSH DE
call BitmapPush22
defw BitmapData+837
  PUSH DE
call BitmapPush6
defw BitmapData+843
  PUSH DE
call BitmapPush6
defw BitmapData+849
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+855
call MultiPushDe6
LD HL,&EEF0
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicStage20Face1bmp_Line_107:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+867
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+895
INC DE

call MultiPushDe5
call BitmapPush6
defw BitmapData+901
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+907


PicStage20Face1bmp_Line_109:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&CCFF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+913
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+941
INC DE

  PUSH DE
  PUSH DE
LD BC,&00EE
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+947
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+955


PicStage20Face1bmp_Line_111:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
call BitmapPush18
defw BitmapData+973
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+979
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
LD HL,&FF77
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+985
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FFE0
  Push HL
LD BC,&87F0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_113:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
call BitmapPush6
defw BitmapData+991
Call PushDE_F0F0x
LD BC,&7000
  Push BC
Ld H,C
Ld L,C

  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+999
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1009
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF1D
  Push HL
LD BC,&0FD2
 jp NextLinePushBC 


PicStage20Face1bmp_Line_115:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&CDFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
call BitmapPush6
defw BitmapData+1015
Call PushDE_F0F0x
LD BC,&3000
  Push BC
LD HL,&0008
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1023
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00EE
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF39
  Push HL
call MultiPushDe6
LD BC,&FFD1
  Push BC
LD HL,&1E87
  jp NextLinePushHl 


PicStage20Face1bmp_Line_117:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&89FF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush8
defw BitmapData+1031
Call PushDE_F0F0x
LD BC,&1000
  Push BC
LD HL,&000C
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1047
LD DE,&FFFF
call MultiPushDe9
LD BC,&FF91
  Push BC
LD HL,&D20F
  jp NextLinePushHl 


PicStage20Face1bmp_Line_119:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&03FF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&FF7F
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&0080
  Push BC
Call PushDE_F0F0x
Ld H,B
Ld L,B

  Push HL
Ld C,&0E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1055
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8FFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe9
LD BC,&FF91
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face1bmp_Line_121:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0700
  Push HL
LD BC,&EEFF
  Push BC
Call PushDE_FFFFx
LD HL,&3F0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0300
  Push BC
Ld H,C
Ld L,C

  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
  Push HL 
Ld L,&0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1063
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&C3FC
  Push BC
LD DE,&FFFF
call MultiPushDe9
LD HL,&FF91
  Push HL
LD BC,&10F0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_123:
call BitmapPush10
defw BitmapData+1073
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF3F
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1079
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1085
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
defw BitmapData+1091
  PUSH DE
LD BC,&F0FF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
INC DE

 jp NextLinePushDe2


PicStage20Face1bmp_Line_125:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1101
Call PushDE_0F0Fx
call BitmapPush12
defw BitmapData+1113
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&010C
  Push HL
LD BC,&0FC3
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1119
  PUSH DE
  PUSH DE
LD HL,&F8FF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&3300
  Push BC
INC DE

 jp NextLinePushDe2


PicStage20Face1bmp_Line_127:
LD HL,&0008
  Push HL
LD BC,&0F03
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1129
Call PushDE_0F0Fx
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
defw BitmapData+1119
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FEFF
  Push HL
Call PushDE_FFFFx
LD BC,&1100
  Push BC
INC DE

 jp NextLinePushDe3


PicStage20Face1bmp_Line_129:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1104
  PUSH DE
LD HL,&690F
  Push HL
call MultiPushDe13
call BitmapPush14
defw BitmapData+1143
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1153
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face1bmp_Line_131:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1161
  PUSH DE
LD HL,&2D0F
  Push HL
call MultiPushDe13
call BitmapPush24
defw BitmapData+1185
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+1191


PicStage20Face1bmp_Line_133:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1199
call MultiPushDe15
call BitmapPush24
defw BitmapData+1223
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1231


PicStage20Face1bmp_Line_135:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F03
  Push HL
LD BC,&0E0F
  Push BC
call MultiPushDe10
call BitmapPush10
defw BitmapData+1241
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1249
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1257


PicStage20Face1bmp_Line_137:
call BitmapPush6
defw BitmapData+1263
DEC DE

  PUSH DE
  PUSH DE
LD HL,&0A0A
  Push HL
LD BC,&0A0E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F07
  Push HL
LD BC,&000F
  Push BC
call MultiPushDe11
call BitmapPush22
defw BitmapData+1285
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&88FF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
LD BC,&33EF
  Push BC
LD HL,&FFD3
  jp NextLinePushHl 


PicStage20Face1bmp_Line_139:
call BitmapPush6
defw BitmapData+1263
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3BF0
  Push HL
LD BC,&1E0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
call MultiPushDe10
call BitmapPush12
defw BitmapData+1297
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1309
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&778F
  Push BC
LD HL,&3FC3
  jp NextLinePushHl 


PicStage20Face1bmp_Line_141:
call BitmapPush6
defw BitmapData+1315
Call PushDE_FFFFx
LD HL,&FF7F
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0000
  Push BC
LD HL,&080F
  Push HL
call MultiPushDe9
call BitmapPush14
defw BitmapData+1329
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1335
call MultiPushDe5
LD BC,&770E
  Push BC
LD HL,&0FC3
  jp NextLinePushHl 


PicStage20Face1bmp_Line_143:
call BitmapPush6
defw BitmapData+1341
DEC DE

call MultiPushDe7
call BitmapPush8
defw BitmapData+1349
LD DE,&0F0F
call MultiPushDe7
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
LD DE,&FFFF
call MultiPushDe10
LD HL,&77E0
  Push HL
LD BC,&F0F0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_145:
call BitmapPush6
defw BitmapData+1355
DEC DE

call MultiPushDe10
LD HL,&7F0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush10
defw BitmapData+1365
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&10FF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe9
LD HL,&77E0
  Push HL
LD BC,&F0F0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_147:
call BitmapPush6
defw BitmapData+1371
DEC DE

call MultiPushDe9
LD HL,&FF77
  Push HL
LD BC,&080F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
call BitmapPush10
defw BitmapData+1381
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&7803
  Push HL
LD BC,&0000
  Push BC
LD DE,&FFFF
call MultiPushDe9
LD HL,&77E0
  Push HL
LD BC,&B068
 jp NextLinePushBC 


PicStage20Face1bmp_Line_149:
call BitmapPush6
defw BitmapData+1387
DEC DE

call MultiPushDe9
LD HL,&F73C
  Push HL
LD BC,&0300
  Push BC
LD DE,&0F0F
call MultiPushDe6
LD HL,&0700
  Push HL
LD BC,&0C0F
  Push BC
  PUSH DE
Call PushDE_F0F0x
call BitmapPush6
defw BitmapData+1393
LD DE,&FFFF
call MultiPushDe7
LD HL,&FF33
  Push HL
INC DE

 jp NextLinePushDe2


PicStage20Face1bmp_Line_151:
call BitmapPush8
defw BitmapData+1401
DEC DE

call MultiPushDe7
call BitmapPush8
defw BitmapData+1409
LD DE,&0F0F
call MultiPushDe5
LD HL,&070E
  Push HL
  PUSH DE
LD BC,&0FE1
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1419
LD DE,&FFFF
call MultiPushDe5
LD HL,&FF11
  Push HL
INC DE

 jp NextLinePushDe3


PicStage20Face1bmp_Line_153:
LD HL,&8078
  Push HL
LD BC,&0F03
  Push BC
  PUSH DE
LD HL,&000A
  Push HL
LD BC,&8AFF
  Push BC
DEC DE

call MultiPushDe5
call BitmapPush12
defw BitmapData+1431
LD DE,&0F0F
call MultiPushDe6
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1443
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&7700
  Push BC
Call PushDE_0000x
jp NextLine


PicStage20Face1bmp_Line_155:
LD HL,&8070
  Push HL
  PUSH DE
  PUSH DE
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1463
LD DE,&0F0F
call MultiPushDe6
call BitmapPush22
defw BitmapData+1485
LD DE,&0000
call MultiPushDe6
LD HL,&0080
  jp NextLinePushHl 


PicStage20Face1bmp_Line_157:
LD HL,&0070
  Push HL
  PUSH DE
  PUSH DE
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F0F0
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1497
call MultiPushDe5
call BitmapPush24
defw BitmapData+1521
LD DE,&0000
call MultiPushDe6
LD BC,&00C0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_159:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1541
Call PushDE_0F0Fx
call BitmapPush8
defw BitmapData+1549
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&C003
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+1557
call MultiPushDe5
LD HL,&0080
  Push HL
LD BC,&F0E0
 jp NextLinePushBC 


PicStage20Face1bmp_Line_161:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&080A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
LD HL,&780F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&4803
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1563
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
defw BitmapData+1571
call MultiPushDe5
LD BC,&C0F0
  Push BC
LD HL,&F078
  jp NextLinePushHl 


PicStage20Face1bmp_Line_163:
LD HL,&0100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&080A
  Push BC
LD HL,&0B0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&82F0
  Push BC
LD HL,&F01E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0103
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1577
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
defw BitmapData+1585
call MultiPushDe5
LD HL,&D070
  Push HL
LD BC,&680F
 jp NextLinePushBC 


PicStage20Face1bmp_Line_165:
LD HL,&0700
  Push HL
  PUSH DE
  PUSH DE
LD BC,&080A
  Push BC
LD HL,&0F0E
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD BC,&82F0
  Push BC
LD HL,&F03C
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0300
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&3C07
  Push BC
  PUSH DE
Ld L,&0E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1593
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0008
  Push BC
LD HL,&1EF0
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&0A02
  Push BC
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+1599


PicStage20Face1bmp_Line_167:
LD HL,&0F0F
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0A0A
  Push BC
call BitmapPush10
defw BitmapData+1609
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
Call PushDE_0000x
call BitmapPush6
defw BitmapData+1615
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1633
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe5
LD BC,&C0F0
  Push BC
LD HL,&1E0F
  jp NextLinePushHl 


PicStage20Face1bmp_Line_169:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
  PUSH DE
LD HL,&0A0E
  Push HL
call BitmapPush16
defw BitmapData+1649
  PUSH DE
LD BC,&0024
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1655
  PUSH DE
call BitmapPush6
defw BitmapData+1661
  PUSH DE
LD HL,&7803
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+1669
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+1675


PicStage20Face1bmp_Line_171:
call BitmapPush24
defw BitmapData+1699
  PUSH DE
LD HL,&003C
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0400
  Push BC
  PUSH DE
LD HL,&780F
  Push HL
  PUSH DE
  PUSH DE
LD BC,&00F0
  Push BC
  PUSH DE
  PUSH DE
LD HL,&C003
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+1707
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00CC
  Push BC
DEC DE

  PUSH DE
  PUSH DE
LD HL,&33FE
  Push HL
LD BC,&1F0F
 jp NextLinePushBC 


PicStage20Face1bmp_Line_173:
call BitmapPush20
defw BitmapData+1727
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1733
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
defw BitmapData+1747
  PUSH DE
LD HL,&00FF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&77FF
  Push BC
LD HL,&F01E
  jp NextLinePushHl 


PicStage20Face1bmp_Line_175:
call BitmapPush12
defw BitmapData+1759
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
defw BitmapData+1765
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
call BitmapPush10
defw BitmapData+1775
DEC DE

call MultiPushDe7
LD BC,&77E0
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face1bmp_Line_177:
call BitmapPush30
defw BitmapData+1805
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
call BitmapPush10
defw BitmapData+1815
DEC DE

call MultiPushDe7
LD BC,&77F0
  Push BC
LD HL,&40E0
  jp NextLinePushHl 


PicStage20Face1bmp_Line_179:
LD HL,&0F0F
  Push HL
LD BC,&0F88
  Push BC
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1829
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
LD BC,&CEFF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&77F0
  Push HL
LD BC,&F000
 jp NextLinePushBC 


PicStage20Face1bmp_Line_181:
LD HL,&0F0F
  Push HL
LD BC,&0FCC
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&1B
  Push HL
call BitmapPush6
defw BitmapData+1835
  PUSH DE
LD BC,&F13C
  Push BC
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
LD HL,&0ECF
  Push HL
LD DE,&FFFF
call MultiPushDe6
LD BC,&7730
  Push BC
LD HL,&0000
  jp NextLinePushHl 


PicStage20Face1bmp_Line_183:
LD HL,&0F0F
  Push HL
LD BC,&0FCC
  Push BC
DEC DE

call MultiPushDe7
LD HL,&FFF1
  Push HL
LD BC,&F0F0
  Push BC
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
defw BitmapData+1841
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1847
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
INC DE

 jp NextLinePushDe2


PicStage20Face1bmp_Line_185:
call BitmapPush6
defw BitmapData+1853
DEC DE

call MultiPushDe6
call BitmapPush12
defw BitmapData+1865
INC DE

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
defw BitmapData+1871
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1877
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face1bmp_Line_187:
  PUSH DE
  PUSH DE
LD HL,&08EF
  Push HL
DEC DE

call MultiPushDe5
call BitmapPush14
defw BitmapData+1891
INC DE

call MultiPushDe8
LD BC,&00C0
  Push BC
LD HL,&0F01
  Push HL
  PUSH DE
LD BC,&68E1
  Push BC
LD HL,&F0F0
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1897
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face1bmp_Line_189:
  PUSH DE
  PUSH DE
LD HL,&080F
  Push HL
LD BC,&CFFF
  Push BC
Call PushDE_FFFFx
call BitmapPush8
defw BitmapData+1905
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
defw BitmapData+1927
jp MultiPushDeLast6


PicStage20Face1bmp_Line_191:
  PUSH DE
  PUSH DE
LD HL,&080F
  Push HL
LD BC,&0F8F
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&1B
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1937
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0043
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+1959
jp MultiPushDeLast6


PicStage20Face1bmp_Line_193:
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
defw BitmapData+1973
  PUSH DE
call BitmapPush6
defw BitmapData+1979
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
defw BitmapData+1989
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face1bmp_Line_195:
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
defw BitmapData+2003
  PUSH DE
call BitmapPush14
defw BitmapData+2017
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
defw BitmapData+645
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2023
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face1bmp_Line_197:
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
defw BitmapData+2033
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2049
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2057
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2063
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face1bmp_Line_199:
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
defw BitmapData+2069
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+2091
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
defw BitmapData+2097
LD DE,&0000
jp MultiPushDeLast5



PicStage20Face1bmp_DrawOrder: 

  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_1
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_3
  DEFW PicStage20Face1bmp_Line_4
  DEFW PicStage20Face1bmp_Line_5
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_7
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_9
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_11
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_13
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_15
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_17
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_19
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_21
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_23
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_25
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_27
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_29
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_31
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_33
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_35
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_37
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_39
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_41
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_43
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_45
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_47
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_49
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_51
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_53
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_55
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_57
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_59
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_61
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_63
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_65
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_67
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_69
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_71
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_73
  DEFW PicStage20Face1bmp_Line_0
  DEFW PicStage20Face1bmp_Line_75
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_77
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_79
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_81
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_83
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_85
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_87
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_89
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_91
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_93
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_95
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_97
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_99
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_101
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_103
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_105
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_107
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_109
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_111
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_113
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_115
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_117
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_119
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_121
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_123
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_125
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_127
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_129
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_131
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_133
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_135
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_137
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_139
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_141
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_143
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_145
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_147
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_149
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_151
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_153
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_155
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_157
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_159
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_161
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_163
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_165
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_167
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_169
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_171
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_173
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_175
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_177
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_179
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_181
  DEFW PicStage20Face1bmp_Line_48
  DEFW PicStage20Face1bmp_Line_183
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_185
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_187
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_189
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_191
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_193
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_195
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_197
  DEFW PicStage20Face1bmp_Line_4_Reuse
  DEFW PicStage20Face1bmp_Line_199
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
BitmapPush28: ld b,&0E
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
defb &0F,&0E,&0E,&0A,&0F,&0F,&0F,&0E,&0F,&0E
defb &0B,&0F,&0F,&0A,&0E,&0A,&08,&00,&00,&00
defb &02,&0A,&0A,&0B,&0F,&0E,&0A,&0A,&0F,&0A
defb &08,&00,&00,&00,&02,&0A,&0A,&0B,&0F,&0E
defb &0A,&0A,&0F,&0A,&08,&00,&00,&00,&0A,&0A
defb &0A,&0B,&0F,&0A,&0A,&0B,&0F,&1E,&F0,&C3
defb &0A,&1A,&F0,&F0,&F0,&87,&0F,&0E,&08,&00
defb &00,&02,&CF,&0E,&08,&00,&00,&02,&87,&0F
defb &0F,&0F,&0F,&0E,&FF,&8E,&08,&00,&00,&02
defb &3C,&F0,&F0,&C3,&0F,&0F,&1E,&F0,&FF,&FF
defb &88,&00,&00,&02,&0F,&F0,&F0,&0F,&0F,&0F
defb &1E,&F0,&78,&F0,&F0,&F0,&C3,&0F,&FF,&FF
defb &FF,&00,&00,&02,&F0,&0F,&0F,&0F,&0E,&0A
defb &0A,&0A,&0A,&7F,&0F,&78,&F0,&87,&0F,&0F
defb &0F,&78,&C3,&0F,&3C,&F0,&F0,&0F,&F0,&87
defb &0F,&0F,&0F,&0E,&3B,&FF,&78,&87,&0F,&78
defb &F0,&0F,&0F,&0F,&F0,&0F,&1E,&F0,&87,&0F
defb &0F,&0F,&3C,&F0,&0F,&1E,&F0,&F0,&F0,&0F
defb &1E,&C3,&0F,&0F,&3F,&FF,&C3,&0F,&0F,&0F
defb &78,&F0,&F0,&C3,&0F,&0F,&0F,&F0,&D2,&F0
defb &87,&0F,&0F,&0F,&0F,&0E,&87,&0F,&0F,&0F
defb &78,&F0,&00,&00,&0A,&00,&02,&0A,&F0,&F0
defb &87,&0F,&0F,&0F,&0F,&0E,&F0,&E1,&0F,&0F
defb &1E,&F0,&0A,&F0,&F0,&F0,&F0,&E1,&00,&00
defb &02,&00,&02,&0A,&F0,&C3,&78,&F0,&F0,&E1
defb &F0,&0F,&0F,&0F,&0F,&1E,&00,&0A,&0A,&08
defb &00,&00,&02,&0A,&0A,&0A,&0A,&0E,&F0,&F0
defb &E1,&0F,&F0,&87,&78,&0F,&0F,&0F,&0F,&0A
defb &F0,&87,&0F,&3C,&F0,&F0,&0F,&3C,&F0,&F0
defb &F0,&C3,&02,&0A,&0A,&0A,&0A,&0F,&3C,&E1
defb &0F,&0F,&D2,&F0,&F0,&0F,&0F,&0F,&0E,&0A
defb &C0,&00,&00,&00,&00,&10,&E1,&0F,&0F,&0F
defb &0F,&3C,&F0,&C3,&0F,&1E,&F0,&E1,&0F,&78
defb &10,&87,&0F,&0F,&0F,&08,&F0,&80,&00,&E0
defb &00,&0A,&0A,&00,&F0,&E1,&0F,&3C,&F0,&E1
defb &10,&F0,&E1,&0F,&0C,&00,&FF,&CC,&30,&F0
defb &F0,&F0,&00,&07,&0F,&F0,&F0,&F0,&E1,&3C
defb &F0,&F0,&0F,&0F,&69,&0F,&0F,&0F,&0F,&3C
defb &F0,&F0,&C0,&00,&01,&0F,&0F,&0F,&0C,&00
defb &0A,&00,&C3,&0F,&0F,&0F,&33,&FF,&FF,&FF
defb &D2,&C3,&07,&1E,&F0,&F0,&80,&FF,&88,&00
defb &1B,&FF,&FF,&CC,&61,&0F,&0F,&0F,&F0,&0F
defb &0F,&0F,&0F,&1E,&F0,&E0,&07,&0F,&0F,&38
defb &11,&FF,&FF,&FF,&EE,&00,&F0,&87,&0F,&0F
defb &0F,&78,&F0,&00,&0F,&0F,&0F,&0E,&33,&FF
defb &F0,&87,&0F,&0F,&1E,&F0,&80,&00,&00,&70
defb &0F,&0F,&0F,&0E,&77,&FF,&F0,&87,&0F,&0F
defb &78,&E0,&00,&00,&10,&F0,&F0,&87,&0F,&3C
defb &F0,&80,&00,&00,&30,&F0,&FF,&EE,&03,&0F
defb &0F,&0F,&F0,&0F,&0F,&F0,&E0,&00,&00,&00
defb &E1,&0F,&1E,&F0,&80,&00,&00,&30,&01,&E1
defb &0F,&3C,&0F,&1F,&00,&70,&F0,&F0,&F0,&80
defb &00,&F0,&F0,&F0,&F0,&FF,&88,&00,&00,&07
defb &1E,&F0,&F0,&F0,&87,&0F,&1E,&F0,&01,&69
defb &0F,&3C,&F0,&87,&0F,&0F,&7F,&FF,&CE,&0A
defb &0A,&0A,&00,&70,&F0,&F0,&E0,&00,&00,&30
defb &F0,&F0,&F0,&F3,&FF,&CC,&FF,&CC,&00,&30
defb &F0,&E1,&0C,&00,&01,&78,&0F,&3C,&F0,&E1
defb &0F,&0F,&0F,&0A,&0A,&0A,&0A,&08,&00,&F0
defb &96,&87,&E0,&00,&00,&30,&96,&C3,&78,&D1
defb &FF,&FF,&CC,&00,&03,&3C,&0F,&3C,&F0,&F0
defb &0F,&0F,&0F,&0E,&0A,&0A,&0A,&08,&C3,&0F
defb &2D,&C0,&33,&FF,&FF,&88,&00,&C3,&0F,&0F
defb &C0,&00,&00,&10,&F0,&F0,&0E,&00,&00,&C3
defb &0F,&1E,&C0,&00,&00,&00,&C3,&0F,&0F,&C0
defb &33,&FF,&FF,&FF,&88,&00,&03,&3C,&0F,&3C
defb &F0,&F0,&87,&0F,&0F,&0E,&0A,&0A,&E1,&0F
defb &0F,&0E,&00,&00,&00,&10,&F0,&F0,&0F,&08
defb &0F,&1E,&C0,&00,&00,&00,&C3,&0F,&0F,&C0
defb &00,&FF,&FF,&FF,&FF,&00,&03,&3C,&87,&1E
defb &F0,&F0,&C3,&0F,&0F,&0E,&0A,&0A,&01,&0F
defb &0F,&0E,&00,&00,&00,&C3,&00,&30,&F0,&F0
defb &F0,&0F,&C0,&00,&00,&00,&C3,&0F,&1E,&C0
defb &00,&33,&FF,&FF,&FF,&EE,&07,&1E,&87,&1E
defb &F0,&F0,&E1,&0F,&0F,&0E,&0A,&0B,&66,&07
defb &00,&30,&F0,&F0,&E1,&0F,&C0,&00,&00,&00
defb &C3,&0F,&1E,&C0,&00,&00,&77,&FF,&FF,&FF
defb &FF,&1E,&C3,&1E,&F0,&F0,&F0,&0F,&0F,&0E
defb &00,&00,&00,&E1,&00,&30,&F0,&F0,&C3,&0F
defb &F0,&F0,&1E,&87,&08,&00,&CB,&1E,&F0,&F0
defb &F0,&0F,&0F,&7F,&FF,&FF,&FF,&88,&00,&70
defb &F0,&F0,&87,&0F,&0F,&0F,&0F,&0E,&00,&00
defb &00,&E1,&0F,&0F,&C0,&00,&00,&00,&C3,&0F
defb &78,&C0,&00,&00,&33,&FF,&F0,&F0,&1E,&87
defb &0C,&00,&0F,&F0,&E0,&FF,&EE,&00,&FF,&9E
defb &F0,&F0,&F0,&7F,&00,&F0,&F0,&F0,&87,&0F
defb &0F,&0F,&0F,&0E,&00,&00,&00,&F0,&F0,&F0
defb &E0,&00,&00,&10,&C3,&F0,&F0,&80,&00,&00
defb &00,&FF,&78,&F0,&87,&C3,&0E,&00,&F0,&F0
defb &E0,&FF,&FF,&FF,&EE,&00,&00,&00,&00,&70
defb &F0,&F0,&F0,&00,&00,&30,&F0,&F0,&F0,&80
defb &00,&00,&00,&77,&07,&F0,&F0,&F0,&E1,&0F
defb &78,&F0,&F0,&F0,&0F,&0E,&F0,&00,&00,&00
defb &00,&11,&00,&01,&0F,&F0,&F0,&F0,&E1,&0F
defb &78,&F0,&F0,&F0,&3F,&FF,&FF,&FF,&FF,&88
defb &E0,&00,&00,&00,&00,&0F,&07,&0F,&0F,&F0
defb &F0,&F0,&87,&0F,&C0,&00,&00,&00,&03,&0F
defb &0F,&7F,&FF,&EF,&0F,&08,&00,&00,&07,&0F
defb &0F,&3C,&F0,&F0,&F0,&C3,&0F,&01,&0F,&3C
defb &F0,&F0,&F0,&0F,&0F,&01,&1E,&F0,&F0,&F0
defb &E1,&0F,&0E,&01,&FF,&EE,&0A,&0A,&00,&07
defb &0F,&0F,&0F,&0C,&F0,&80,&00,&00,&03,&0F
defb &0F,&0E,&00,&00,&00,&70,&C3,&78,&F0,&0F
defb &0F,&0F,&1E,&C3,&F0,&C3,&0F,&0F,&0E,&0A
defb &0A,&0A,&08,&00,&00,&00,&30,&F0,&F0,&F0
defb &80,&00,&00,&07,&0F,&F0,&F0,&87,&C3,&0F
defb &0F,&C3,&C3,&0F,&0F,&0F,&0A,&0A,&0A,&08
defb &0F,&78,&F0,&87,&F0,&0F,&1E,&F0,&F0,&F0
defb &E1,&0E,&00,&07,&33,&FF,&FF,&FF,&FF,&02
defb &0A,&F0,&E1,&3C,&0F,&0E,&0A,&0A,&0A,&00
defb &77,&EE,&00,&02,&0A,&78,&E1,&0F,&3C,&F0
defb &F0,&F0,&87,&78,&F0,&0F,&3C,&0F,&0F,&F0
defb &F0,&F0,&E1,&0C,&00,&0F,&70,&E0,&00,&D1
defb &FF,&00,&0F,&0A,&0A,&0A,&0A,&33,&FF,&EE
defb &00,&02,&0A,&78,&F0,&0F,&1E,&F0,&F0,&F0
defb &0F,&78,&F0,&87,&F0,&3C,&0F,&3C,&F0,&F0
defb &E1,&00,&01,&0F,&F0,&87,&F0,&91,&FF,&FF
defb &88,&00,&E1,&3C,&87,&0F,&F0,&F0,&C3,&00
defb &07,&0F,&00,&02,&0A,&0B,&78,&E1,&69,&78
defb &C3,&0F,&0F,&B3,&FF,&FF,&FF,&CC,&FF,&EE
defb &07,&0F,&0F,&0F,&00,&02,&0A,&0B,&F0,&C0
defb &43,&0F,&F0,&F0,&F0,&F7,&FE,&F0,&E1,&1E
defb &F0,&0F,&78,&F0,&C3,&00,&F0,&F0,&E1,&1E
defb &F0,&87,&3C,&F0,&C3,&00,&07,&0F,&CC,&00
defb &00,&00,&00,&0A,&0A,&0B,&F0,&E0,&00,&3F
defb &FF,&EE,&07,&0F,&0F,&1E,&FF,&F0,&F0,&F0
defb &E1,&3C,&96,&E1,&1E,&F0,&C3,&08,&00,&0F
defb &FF,&CE,&0A,&1A,&F3,&FF,&FF,&CC,&07,&0F
defb &3C,&F0,&3F,&FF,&8F,&08,&00,&00,&00,&77
defb &FF,&CC,&07,&F0,&F0,&E1,&87,&F0,&0F,&F0
defb &C3,&0F,&00,&00,&07,&0F,&FF,&CD,&0F,&0F
defb &78,&0F,&96,&F0,&0F,&F0,&C3,&0F,&0E,&00
defb &00,&07,&00,&03,&0F,&0F,&78,&0F,&88,&00
defb &00,&00,&00,&07,&EE,&00,&00,&03,&0F,&0F
defb &78,&0F,&0E,&00,&01,&0F,&78,&00,&00,&FF
defb &FC,&F0,&08,&00,&02,&00,&07,&00,&07,&F0
defb &0F,&0E,&00,&00,&00,&0F,&C0,&00,&00,&00
defb &00,&3F,&FF,&0A,&38,&F0,&0E,&0F,&68,&00
defb &07,&2C,&00,&70,&0F,&00,&00,&00,&00,&0F
defb &C0,&00,&00,&00,&03,&0F,&0F,&0F,&0F,&1F
defb &FF,&FF,&FF,&EE,&02,&0A,&0A,&0A,&1A,&F0
defb &87,&07,&C0,&00,&07,&78,&C0,&00,&10,&F0
defb &F0,&E1,&0F,&F0,&F0,&E1,&00,&40,&00,&00
defb &00,&12,&00,&00,&12,&80,&03,&0F,&02,&0A
defb &0A,&0A,&0A,&F0,&4B,&18,&80,&00,&03,&68
defb &00,&00,&00,&30,&F0,&E1,&0F,&F0,&F0,&F0
defb &C3,&0F,&0E,&00,&70,&80,&00,&00,&00,&02
defb &00,&00,&03,&E0,&07,&0F,&0F,&0F,&0F,&3C
defb &F0,&E0,&70,&F0,&1E,&F0,&F0,&F0,&87,&0F
defb &02,&0A,&0A,&0A,&0A,&78,&A5,&0C,&0F,&0E
defb &00,&07,&F0,&00,&02,&0A,&0A,&0A,&0A,&38
defb &D2,&0E,&08,&00,&0F,&0F,&E0,&00,&02,&0A
defb &0A,&0A,&0A,&1A,&F0,&86,&03,&08,&30,&F0
defb &F0,&F0,&F0,&C3,&0F,&3C,&C0,&70,&80,&00
defb &F0,&F0,&F0,&0A,&0A,&0A,&0A,&0B,&0F,&0F
defb &00,&70,&C0,&00,&03,&3C,&78,&E1,&0C,&00
defb &00,&00,&03,&48,&00,&00,&03,&3C,&C0,&70
defb &F0,&F0,&F0,&C3,&01,&0F,&0F,&0F,&0F,&1E
defb &F0,&F0,&E0,&0A,&0A,&0A,&0A,&0F,&0F,&0F
defb &0F,&78,&80,&00,&00,&2C,&F0,&F0,&F0,&E1
defb &0F,&0F,&29,&78,&69,&00,&00,&03,&1E,&80
defb &0F,&0F,&78,&B3,&FF,&EE,&07,&0F,&0F,&0F
defb &0F,&78,&F0,&F0,&C2,&0A,&0A,&0A,&0A,&0F
defb &0F,&0F,&0E,&0A,&00,&13,&03,&0F,&0F,&0F
defb &0A,&78,&87,&84,&03,&0F,&3C,&80,&0F,&F0
defb &F0,&F0,&82,&0A,&0A,&0A,&0B,&0F,&0F,&0F
defb &0F,&0A,&11,&FF,&8B,&0F,&0F,&0F,&00,&01
defb &3C,&C0,&00,&00,&0A,&0A,&0F,&0A,&0A,&3B
defb &CE,&78,&F0,&0F,&C0,&07,&78,&00,&0F,&0E
defb &0B,&0F,&0F,&1F,&FF,&FF,&89,&0F,&0F,&0F
defb &00,&03,&3C,&F0,&00,&03,&FF,&CE,&0A,&1A
defb &F0,&B4,&3C,&01,&E0,&00,&00,&03,&3C,&C0
defb &01,&0F,&0F,&0F,&0F,&1E,&F0,&F0,&F0,&82
defb &0A,&0A,&0A,&0B,&0F,&0A,&0B,&0F,&3F,&FF
defb &FF,&FF,&88,&0F,&0F,&0F,&EE,&0A,&0A,&0A
defb &F0,&69,&5A,&80,&C0,&00,&0F,&FF,&F8,&F0
defb &F0,&82,&0A,&0A,&0A,&0F,&0F,&0A,&0A,&7F
defb &EC,&0A,&0A,&0F,&0F,&0F,&0A,&78,&F0,&C3
defb &80,&00,&EE,&0A,&0A,&0F,&0F,&0E,&FF,&EF
defb &00,&0F,&0F,&0E,&00,&0F,&01,&0F,&0F,&0F
defb &0F,&3C,&F0,&F0,&F0,&F3,&0A,&38,&F0,&78
defb &68,&00,&02,&0A,&0A,&0F,&0F,&0E,&00,&0E
defb &03,&0F,&0F,&0F,&0F,&F0,&F0,&F0,&F0,&C2
defb &3B,&FF,&02,&0A,&0B,&0F,&0F,&0F,&78,&F0
defb &F0,&F0,&E0,&0A,&0A,&7F,&02,&0A,&0B,&0F
defb &0F,&0F,&0A,&0A,&0A,&0F,&0A,&0A,&78,&F0
defb &C3,&D2,&80,&00,&0F,&3C,&C0,&00,&04,&00
defb &00,&00,&00,&01,&0F,&0F,&0F,&3C,&0A,&0A
defb &0B,&0F,&0F,&0F,&0A,&0A,&0A,&0F,&0E,&0A
defb &0A,&F0,&F0,&78,&F0,&00,&03,&F0,&80,&00
defb &1E,&F0,&F0,&F0,&F0,&C2,&0A,&0A,&0A,&0B
defb &0F,&0A,&0B,&0F,&87,&00,&00,&00,&00,&0F
defb &0A,&0F,&0A,&0A,&0B,&0F,&0F,&0A,&0A,&38
defb &78,&F0,&F0,&F0,&F0,&0A,&0A,&0A,&0A,&0B
defb &0F,&0A,&0A,&0F,&00,&30,&87,&0C,&00,&00
defb &00,&30,&87,&08,&00,&00,&07,&0F,&00,&02
defb &0A,&0F,&0E,&0A,&82,&0A,&0A,&0A,&0A,&0B
defb &0E,&0A,&0A,&0F,&00,&F0,&0F,&0F,&00,&00
defb &00,&F0,&0F,&0C,&00,&07,&0F,&0F,&0F,&3C
defb &0F,&0F,&0F,&0E,&0A,&0A,&38,&F0,&00,&02
defb &0B,&0F,&0F,&0A,&0A,&0F,&0E,&0A,&0A,&0B
defb &C0,&00,&10,&E1,&0F,&0F,&08,&00,&10,&F0
defb &0F,&0E,&87,&0F,&0F,&0F,&3C,&F0,&F0,&F0
defb &F0,&E0,&00,&02,&0F,&0F,&0F,&0E
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
save direct "T31-SC7.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]