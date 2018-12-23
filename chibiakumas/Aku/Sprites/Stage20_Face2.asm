read "..\CoreDefs.asm" ;read "BootStrap.asm"
org &4000
jp PicStage20Face2bmp

PicStage20Face2bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Face2bmp_DrawOrder
JP JumpToNextLine


PicStage20Face2bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicStage20Face2bmp_Line_1:
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
Ld D,B
Ld E,B

call MultiPushDe5
  Push BC
Ld D,C
Ld E,C

call MultiPushDe15
call BitmapPush12
defw BitmapData+11
 jp NextLinePushDe1


PicStage20Face2bmp_Line_3:
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
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E


  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld D,B
Ld E,B

call MultiPushDe19
LD HL,&0F0B
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
Ld B,&00
  Push BC
Ld L,&0F
  jp NextLinePushHl 


PicStage20Face2bmp_Line_4:
jp MultiPushDeLast40


PicStage20Face2bmp_Line_5:
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
LD HL,&0F0B
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

call MultiPushDe15
LD BC,&0F0A
  Push BC
LD HL,&0A0E
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld B,H


  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0008
  Push HL
Ld C,&0F
 jp NextLinePushBC 


PicStage20Face2bmp_Line_4_Reuse:
LD DE,&0000
JP PicStage20Face2bmp_Line_4
PicStage20Face2bmp_Line_7:
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
call BitmapPush6
defw BitmapData+17
call MultiPushDe16
LD HL,&0A0A
  Push HL
LD BC,&0A0E
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E


  Push HL

Ld C,L

  Push BC
LD HL,&0200
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld C,&0E
 jp NextLinePushBC 


PicStage20Face2bmp_Line_9:
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
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+23
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
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face2bmp_Line_11:
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
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe19
Ld C,&0A
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


PicStage20Face2bmp_Line_13:
call BitmapPush6
defw BitmapData+41
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+47
  PUSH DE
LD HL,&0A0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe19
LD BC,&0F0A
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


PicStage20Face2bmp_Line_15:
call BitmapPush6
defw BitmapData+53
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+59
  PUSH DE
LD DE,&0F0F
call MultiPushDe20
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


PicStage20Face2bmp_Line_17:
call BitmapPush6
defw BitmapData+65
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
LD HL,&0A0E
  Push HL
Ld D,C
Ld E,C

call MultiPushDe9
LD BC,&000C
  Push BC
call MultiPushDe11
LD HL,&0A0A
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
Ld H,&0B
  Push HL
Ld C,&00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
Ld H,&08
  jp NextLinePushHl 


PicStage20Face2bmp_Line_19:
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
LD HL,&0E0F
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
Ld D,L
Ld E,L

call MultiPushDe10
LD HL,&0000
  Push HL
Ld B,&0C
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


PicStage20Face2bmp_Line_21:
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
Ld H,C
Ld L,E

  Push HL
call MultiPushDe10
LD BC,&0700
  Push BC
LD HL,&000E
  Push HL
call MultiPushDe10
LD BC,&0F0B
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


PicStage20Face2bmp_Line_23:
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
defw BitmapData+71
LD DE,&0F0F
call MultiPushDe10
LD HL,&0F07
  Push HL
LD BC,&0000
  Push BC
call MultiPushDe11
LD HL,&0A0A
  Push HL
LD BC,&0E0F
  Push BC
  PUSH DE
Ld H,&0B
  Push HL
LD BC,&0A00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face2bmp_Line_25:
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
LD HL,&0A0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe13
LD BC,&0300
  Push BC
LD HL,&080F
  Push HL
call MultiPushDe10
LD BC,&0B0A
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
  Push BC
LD BC,&0A00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face2bmp_Line_27:
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
Call PushDE_0F0Fx
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1E0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&0F00
  Push HL
Ld B,L


  Push BC
call MultiPushDe10
LD HL,&0F0A
  Push HL
LD BC,&0A0E
  Push BC
  PUSH DE
Ld H,&0B
  Push HL
Ld C,&00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0A0E
  jp NextLinePushHl 


PicStage20Face2bmp_Line_29:
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
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe5
LD HL,&F078
  Push HL
LD DE,&0F0F
call MultiPushDe6
LD BC,&000F
  Push BC
call MultiPushDe10
LD HL,&0F09
  Push HL
LD BC,&0A0A
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
LD HL,&0ACE
  jp NextLinePushHl 


PicStage20Face2bmp_Line_31:
LD HL,&FF33
  Push HL
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+77
LD DE,&F0F0
call MultiPushDe6
LD BC,&F01E
  Push BC
LD DE,&0F0F
call MultiPushDe15
LD HL,&E178
  Push HL
  PUSH DE
call FinalBitmapPush14
defw BitmapData+91


PicStage20Face2bmp_Line_33:
LD HL,&FFFF
  Push HL
LD BC,&FF19
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0E
  Push HL
LD BC,&0FE1
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+97
  PUSH DE
  PUSH DE
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&0FC3
  Push BC
LD HL,&F078
  Push HL
  PUSH DE
LD BC,&E178
  Push BC
  PUSH DE
call FinalBitmapPush14
defw BitmapData+111


PicStage20Face2bmp_Line_35:
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+133
LD DE,&0F0F
call MultiPushDe10
Call PushDE_F0F0x
call FinalBitmapPush18
defw BitmapData+151


PicStage20Face2bmp_Line_37:
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3B0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+169
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
call BitmapPush6
defw BitmapData+175
LD DE,&F0F0
call MultiPushDe7
LD HL,&1A0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+181


PicStage20Face2bmp_Line_39:
Call PushDE_FFFFx
call BitmapPush14
defw BitmapData+195
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+205
call MultiPushDe5
LD HL,&0F87
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  Push HL 
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&02CC
  Push HL
LD DE,&FFFF
 jp NextLinePushDe2


PicStage20Face2bmp_Line_40:
INC DE

jp MultiPushDeLast40


PicStage20Face2bmp_Line_41:
DEC DE

call MultiPushDe5
LD HL,&1B0A
  Push HL
LD BC,&0E0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0FE1
  Push HL
Ld B,&3C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+215
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe6
LD BC,&F0F0
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicStage20Face2bmp_Line_43:
DEC DE

call MultiPushDe6
LD HL,&0E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0F78
  Push BC
call MultiPushDe5
LD HL,&0FF0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&F03C
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1E0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&0F69
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&FFFF
jp MultiPushDeLast5


PicStage20Face2bmp_Line_45:
DEC DE

call MultiPushDe6
LD HL,&FF7F
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&873C
  Push BC
call MultiPushDe6
LD HL,&0FC3
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&1E0F
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&780F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
LD BC,&0FE9
  Push BC
LD DE,&FFFF
jp MultiPushDeLast7


PicStage20Face2bmp_Line_47:
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
defw BitmapData+225
LD DE,&0F0F
call MultiPushDe7
call BitmapPush6
defw BitmapData+231
  PUSH DE
LD HL,&0FF0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Call PushDE_0F0Fx
call BitmapPush6
defw BitmapData+237
  PUSH DE
LD BC,&0F69
  Push BC
LD HL,&0AEE
  Push HL
LD DE,&FFFF
call MultiPushDe5
LD BC,&FF0A
 jp NextLinePushBC 


PicStage20Face2bmp_Line_49:
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
LD BC,&C30F
  Push BC
call MultiPushDe8
call BitmapPush6
defw BitmapData+243
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F00F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&E1F0
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+251
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF7F
  Push HL
LD BC,&0A0A
 jp NextLinePushBC 


PicStage20Face2bmp_Line_51:
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
LD BC,&E10F
  Push BC
call MultiPushDe8
call BitmapPush6
defw BitmapData+257
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe6
LD HL,&380A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+263


PicStage20Face2bmp_Line_53:
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
LD BC,&780F
  Push BC
call MultiPushDe8
call BitmapPush10
defw BitmapData+273
  PUSH DE
  PUSH DE
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&F00A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+279


PicStage20Face2bmp_Line_55:
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
Ld H,&78
  Push HL
call MultiPushDe9
call BitmapPush8
defw BitmapData+287
  PUSH DE
LD BC,&0FE1
  Push BC
LD DE,&F0F0
call MultiPushDe7
LD HL,&F00A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+293


PicStage20Face2bmp_Line_57:
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
LD BC,&0FE1
  Push BC
Ld H,&3C
  Push HL
call MultiPushDe9
call BitmapPush8
defw BitmapData+301
  PUSH DE
LD BC,&C3F0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe7
LD HL,&F00A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+307


PicStage20Face2bmp_Line_59:
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
LD BC,&0FC3
  Push BC
LD HL,&F01E
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+313
call MultiPushDe5
call BitmapPush6
defw BitmapData+319
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+325
  PUSH DE
  PUSH DE
LD BC,&F01A
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+331


PicStage20Face2bmp_Line_61:
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
call BitmapPush6
defw BitmapData+337
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F03C
  Push BC
Call PushDE_0F0Fx
call BitmapPush6
defw BitmapData+343
  PUSH DE
LD HL,&C3F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1E0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+349
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+355


PicStage20Face2bmp_Line_63:
LD HL,&0200
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
Ld B,L
Ld C,L

  Push BC
LD DE,&0FE1
  PUSH DE
  PUSH DE
LD HL,&C3F0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
Ld B,&3C
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&E178
  Push HL
LD BC,&0FC3
  Push BC
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
  PUSH DE
call BitmapPush6
defw BitmapData+361
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+367


PicStage20Face2bmp_Line_65:
LD HL,&0300
  Push HL
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+389
LD DE,&0F0F
call MultiPushDe5
LD HL,&F078
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+395
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+405
  PUSH DE
call FinalBitmapPush8
defw BitmapData+413


PicStage20Face2bmp_Line_67:
LD HL,&0F0F
  Push HL
LD BC,&0708
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&0A
  Push HL
call BitmapPush10
defw BitmapData+423
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+429
Call PushDE_0F0Fx
Call PushDE_F0F0x
LD BC,&3C0F
  Push BC
LD HL,&0F01
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+439
  PUSH DE
call FinalBitmapPush8
defw BitmapData+447


PicStage20Face2bmp_Line_69:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F78
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+459
Call PushDE_0000x
LD BC,&00E0
  Push BC
LD HL,&F03C
  Push HL
Call PushDE_0F0Fx
LD BC,&E1F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+469
LD DE,&FFFF
call MultiPushDe7
LD HL,&FF91
  Push HL
LD DE,&F0F0
 jp NextLinePushDe3


PicStage20Face2bmp_Line_71:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+477
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F1F0
  Push HL
INC DE

call MultiPushDe6
LD BC,&80F0
  Push BC
LD HL,&3C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&E1
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+485
LD DE,&FFFF
call MultiPushDe8
LD HL,&FF11
  Push HL
LD BC,&F0E1
  Push BC
Ld D,B
Ld E,B

 jp NextLinePushDe2


PicStage20Face2bmp_Line_73:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&70EE
  Push HL
LD DE,&FFFF
call MultiPushDe5
LD BC,&FFF0
  Push BC
LD HL,&F010
  Push HL
INC DE

call MultiPushDe6
Ld B,&00
  Push BC
LD HL,&F03C
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1E0F
  Push BC
LD HL,&0100
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&88FF
  Push BC
DEC DE

call MultiPushDe7
call FinalBitmapPush8
defw BitmapData+493


PicStage20Face2bmp_Line_75:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&70EE
  Push HL
LD DE,&FFFF
call MultiPushDe5
LD BC,&F0F0
  Push BC
LD HL,&7000
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+503
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0FC3
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F03C
  Push HL
Ld C,&03
  Push BC
Call PushDE_0000x
LD HL,&EEFF
  Push HL
DEC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+509
 jp NextLinePushDe1


PicStage20Face2bmp_Line_77:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&07EE
  Push HL
Call PushDE_FFFFx
call BitmapPush6
defw BitmapData+515
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+525
  PUSH DE
  PUSH DE
LD HL,&780F
  Push HL
LD BC,&0F00
  Push BC
Call PushDE_0000x
LD HL,&0088
  Push HL
DEC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+531
 jp NextLinePushDe1


PicStage20Face2bmp_Line_79:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&03FF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+537
INC DE

  PUSH DE
  PUSH DE
LD BC,&00CC
  Push BC
LD HL,&1100
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+547
  PUSH DE
  PUSH DE
LD BC,&3C0F
  Push BC
LD HL,&0100
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
DEC DE

call MultiPushDe5
LD BC,&FF77
  Push BC
LD HL,&2C8F
  Push HL
 jp NextLinePushDe2


PicStage20Face2bmp_Line_81:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&03FF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+553
INC DE

  PUSH DE
  PUSH DE
LD BC,&8877
  Push BC
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+563
  PUSH DE
  PUSH DE
LD BC,&1E07
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
LD BC,&1100
  Push BC
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
LD BC,&FEFF
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+569
 jp NextLinePushDe1


PicStage20Face2bmp_Line_83:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0388
  Push HL
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+585
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+595
  PUSH DE
LD BC,&F078
  Push BC
LD HL,&0F03
  Push HL
Call PushDE_0000x
LD BC,&7700
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+601
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF77
  Push HL
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

 jp NextLinePushDe2


PicStage20Face2bmp_Line_85:
call BitmapPush10
defw BitmapData+611
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+623
Call PushDE_F0F0x
call BitmapPush8
defw BitmapData+631
  PUSH DE
LD HL,&F03C
  Push HL
LD BC,&0F01
  Push BC
Call PushDE_0000x
LD HL,&EE11
  Push HL
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
LD HL,&7000
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+639
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face2bmp_Line_87:
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+669
LD HL,&F01E
  Push HL
LD BC,&0700
  Push BC
Call PushDE_0000x
LD HL,&CCFF
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0CF0
  Push BC
LD HL,&7000
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+679


PicStage20Face2bmp_Line_89:
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0A0E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+709
LD BC,&F00F
  Push BC
LD HL,&4300
  Push HL
Call PushDE_0000x
LD BC,&00FF
  Push BC
LD HL,&7700
  Push HL
  PUSH DE
LD BC,&0EE1
  Push BC
Ld H,&70
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
  PUSH DE
Ld H,&80
  jp NextLinePushHl 


PicStage20Face2bmp_Line_91:
LD HL,&0F01
  Push HL
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&0A0E
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+739
LD HL,&F00F
  Push HL
LD BC,&2100
  Push BC
Call PushDE_0000x
LD HL,&00EE
  Push HL
LD BC,&FF11
  Push BC
  PUSH DE
LD HL,&68C3
  Push HL
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
Ld B,&70
  Push BC
 jp NextLinePushDe2


PicStage20Face2bmp_Line_93:
LD HL,&0F0F
  Push HL
LD BC,&0300
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
Ld H,&0A
  Push HL
call BitmapPush28
defw BitmapData+767
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Call PushDE_0000x
call BitmapPush10
defw BitmapData+777
call MultiPushDe6
LD HL,&0080
  jp NextLinePushHl 


PicStage20Face2bmp_Line_95:
call BitmapPush22
defw BitmapData+799
  PUSH DE
LD HL,&C00F
  Push HL
LD BC,&0FC3
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+805
  PUSH DE
LD HL,&0E0F
  Push HL
LD BC,&0F87
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
call BitmapPush8
defw BitmapData+813
call MultiPushDe6
LD BC,&0080
 jp NextLinePushBC 


PicStage20Face2bmp_Line_97:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+819
  PUSH DE
LD HL,&F0F0
  Push HL
LD BC,&3C8F
  Push BC
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+841
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
call BitmapPush8
defw BitmapData+849
call MultiPushDe6
LD BC,&00F0
 jp NextLinePushBC 


PicStage20Face2bmp_Line_99:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+861
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+883
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&3000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD BC,&0088
  Push BC
DEC DE

  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+889


PicStage20Face2bmp_Line_101:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&C310
  Push HL
LD DE,&FFFF
call MultiPushDe6
LD BC,&FF77
  Push BC
INC DE

  PUSH DE
  PUSH DE
LD HL,&C01E
  Push HL
LD BC,&0FC3
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+838
  PUSH DE
call BitmapPush10
defw BitmapData+899
call MultiPushDe6
LD HL,&CCFF
  Push HL
DEC DE

call MultiPushDe7
LD BC,&08C3
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face2bmp_Line_103:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&C388
  Push HL
LD DE,&FFFF
call MultiPushDe6
LD BC,&FF11
  Push BC
INC DE

  PUSH DE
  PUSH DE
LD HL,&C01E
  Push HL
LD BC,&0FC3
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+905
  PUSH DE
call BitmapPush10
defw BitmapData+915
call MultiPushDe6
LD HL,&08EF
  Push HL
DEC DE

call MultiPushDe7
LD BC,&11C3
  Push BC
LD HL,&F0F0
  jp NextLinePushHl 


PicStage20Face2bmp_Line_105:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0FCC
  Push HL
LD DE,&FFFF
call MultiPushDe6
LD BC,&FF00
  Push BC
INC DE

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+927
  PUSH DE
call BitmapPush10
defw BitmapData+937
call MultiPushDe5
LD HL,&0008
  Push HL
LD BC,&871E
  Push BC
DEC DE

call MultiPushDe7
LD HL,&33C3
  Push HL
LD BC,&D278
 jp NextLinePushBC 


PicStage20Face2bmp_Line_107:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&07EE
  Push HL
LD DE,&FFFF
call MultiPushDe6
LD BC,&3300
  Push BC
INC DE

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+949
  PUSH DE
call BitmapPush10
defw BitmapData+959
call MultiPushDe5
call BitmapPush6
defw BitmapData+965
DEC DE

call MultiPushDe6
LD HL,&330F
  Push HL
LD BC,&F078
 jp NextLinePushBC 


PicStage20Face2bmp_Line_109:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&07CC
  Push HL
LD DE,&FFFF
call MultiPushDe5
LD BC,&FF3F
  Push BC
LD HL,&0F01
  Push HL
INC DE

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+977
  PUSH DE
call BitmapPush10
defw BitmapData+987
call MultiPushDe5
call BitmapPush6
defw BitmapData+993
DEC DE

call MultiPushDe6
LD BC,&3387
  Push BC
LD HL,&F078
  jp NextLinePushHl 


PicStage20Face2bmp_Line_111:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0FCC
  Push HL
LD DE,&FFFF
call MultiPushDe5
LD BC,&3F0F
  Push BC
LD HL,&0F07
  Push HL
INC DE

  PUSH DE
  PUSH DE
LD BC,&00F0
  Push BC
Call PushDE_F0F0x
LD HL,&3000
  Push HL

Ld C,L

  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+999
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+1005
DEC DE

call MultiPushDe6
LD HL,&1187
  Push HL
LD BC,&3C78
 jp NextLinePushBC 


PicStage20Face2bmp_Line_113:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F88
  Push HL
Call PushDE_FFFFx
LD BC,&FF7B
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1011
Call PushDE_F0F0x
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1019
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1029
DEC DE

call MultiPushDe5
LD HL,&19F0
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicStage20Face2bmp_Line_115:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F03
  Push HL
LD BC,&88FF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&FF7F
  Push HL
LD BC,&0F69
  Push BC
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1035
Call PushDE_F0F0x
LD HL,&0000
  Push HL
LD BC,&0008
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1043
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1051
  PUSH DE
LD HL,&0088
  Push HL
Call PushDE_FFFFx
LD BC,&08F0
  Push BC
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicStage20Face2bmp_Line_117:
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1061
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1067
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1073
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+1097
LD DE,&0000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1107


PicStage20Face2bmp_Line_119:
LD HL,&000F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1117
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1123
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1131
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1141
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+1147


PicStage20Face2bmp_Line_121:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1157
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1163
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&000F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1171
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1181
LD DE,&0000
jp MultiPushDeLast7


PicStage20Face2bmp_Line_123:
  PUSH DE
call BitmapPush14
defw BitmapData+1195
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F03
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&80F0
  Push BC
LD HL,&3000
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0E0F
  Push BC
Ld D,C
Ld E,C

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
defw BitmapData+1201
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1207
LD DE,&0000
jp MultiPushDeLast7


PicStage20Face2bmp_Line_125:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1213
  PUSH DE
LD HL,&C3F0
  Push HL
LD BC,&C31E
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0700
  Push HL
Call PushDE_0000x
LD BC,&0008
  Push BC
LD DE,&0F0F
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
defw BitmapData+1219
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F01A
  Push HL
LD BC,&0200
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast7


PicStage20Face2bmp_Line_127:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1225
  PUSH DE
LD HL,&0FC3
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&FF
  Push HL
LD BC,&3300
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&01
  Push BC
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1233
  PUSH DE
  PUSH DE
LD BC,&F00A
  Push BC
LD HL,&0200
  Push HL
Call PushDE_0000x
LD BC,&00F0
  Push BC
 jp NextLinePushDe2


PicStage20Face2bmp_Line_129:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&07EE
  Push HL
LD DE,&FFFF
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1239
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8FFF
  Push BC
LD HL,&FF3F
  Push HL
call MultiPushDe8
call BitmapPush24
defw BitmapData+1263
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1271


PicStage20Face2bmp_Line_131:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&07EE
  Push HL
LD DE,&FFFF
call MultiPushDe5
call BitmapPush6
defw BitmapData+1277
  PUSH DE
LD BC,&3F0F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
call BitmapPush24
defw BitmapData+1301
Call PushDE_FFFFx
call FinalBitmapPush6
defw BitmapData+1307


PicStage20Face2bmp_Line_133:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&07EE
  Push HL
LD DE,&FFFF
call MultiPushDe8
LD BC,&FF7F
  Push BC
LD DE,&0F0F
call MultiPushDe9
call BitmapPush12
defw BitmapData+1319
LD DE,&FFFF
call MultiPushDe10
call FinalBitmapPush6
defw BitmapData+1325


PicStage20Face2bmp_Line_135:
call BitmapPush6
defw BitmapData+1331
DEC DE

call MultiPushDe8
LD HL,&FF0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe9
call BitmapPush14
defw BitmapData+1345
LD DE,&FFFF
call MultiPushDe9
call FinalBitmapPush6
defw BitmapData+1351


PicStage20Face2bmp_Line_137:
call BitmapPush6
defw BitmapData+1357
DEC DE

call MultiPushDe8
LD HL,&1F0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe10
call BitmapPush12
defw BitmapData+1369
LD DE,&FFFF
call MultiPushDe9
call FinalBitmapPush6
defw BitmapData+1375


PicStage20Face2bmp_Line_139:
call BitmapPush6
defw BitmapData+1381
DEC DE

call MultiPushDe7
LD HL,&FF19
  Push HL
LD DE,&0F0F
call MultiPushDe10
call BitmapPush10
defw BitmapData+1391
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&FCFF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe8
call FinalBitmapPush6
defw BitmapData+1397


PicStage20Face2bmp_Line_141:
call BitmapPush8
defw BitmapData+1405
DEC DE

call MultiPushDe5
call BitmapPush6
defw BitmapData+1411
LD DE,&0F0F
call MultiPushDe9
call BitmapPush10
defw BitmapData+1421
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F00F
  Push HL
LD BC,&CCFF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe7
call FinalBitmapPush6
defw BitmapData+1427


PicStage20Face2bmp_Line_143:
LD HL,&8778
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&070A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1435
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&080F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
call BitmapPush10
defw BitmapData+1445
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1453
LD DE,&FFFF
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+1459


PicStage20Face2bmp_Line_145:
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
call BitmapPush8
defw BitmapData+1467
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe7
call BitmapPush12
defw BitmapData+1479
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1489
Call PushDE_0000x
LD HL,&07C0
  Push HL
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face2bmp_Line_147:
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
LD HL,&0AE0
  Push HL
LD BC,&F00F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1497
call MultiPushDe6
call BitmapPush10
defw BitmapData+1507
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&7803
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1513
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1519


PicStage20Face2bmp_Line_149:
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
LD HL,&0AC2
  Push HL
LD BC,&780F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1527
call MultiPushDe6
LD HL,&0700
  Push HL
LD BC,&0C0F
  Push BC
  PUSH DE
LD HL,&F0F0
  Push HL
Ld B,E
Ld C,L

  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD HL,&0700
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1533
jp MultiPushDeLast7


PicStage20Face2bmp_Line_151:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0AE0
  Push BC
LD HL,&780F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1543
call MultiPushDe5
LD BC,&070E
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+1555
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1561
jp MultiPushDeLast7


PicStage20Face2bmp_Line_153:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&000A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0AE0
  Push BC
LD HL,&F00F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1573
call MultiPushDe6
LD BC,&0FE1
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7000
  Push HL
LD BC,&2C07
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1579
jp MultiPushDeLast7


PicStage20Face2bmp_Line_155:
LD HL,&0300
  Push HL
  PUSH DE
  PUSH DE
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0AC2
  Push HL
LD BC,&F01E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1591
call MultiPushDe6
LD HL,&E1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1607
Call PushDE_0000x
LD BC,&8070
  Push BC
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face2bmp_Line_157:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0AC2
  Push HL
LD BC,&F01E
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1200
  Push BC
  PUSH DE
Ld H,&40
  Push HL
LD DE,&0F0F
call MultiPushDe5
LD BC,&0FC3
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1623
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+1629


PicStage20Face2bmp_Line_159:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
LD BC,&000A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0A82
  Push HL
LD BC,&F03C
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0200
  Push BC
  PUSH DE
LD HL,&8070
  Push HL
LD BC,&000E
  Push BC
Call PushDE_0F0Fx
LD HL,&0F87
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1641
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
LD BC,&77C0
  Push BC
LD DE,&F0F0
 jp NextLinePushDe2


PicStage20Face2bmp_Line_161:
call BitmapPush8
defw BitmapData+1649
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&F078
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0F01
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+1655
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
call BitmapPush12
defw BitmapData+1667
  PUSH DE
LD HL,&0088
  Push HL
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1673


PicStage20Face2bmp_Line_163:
call BitmapPush10
defw BitmapData+1683
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&F0F0
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0F03
  Push BC
LD HL,&0012
  Push HL
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1689
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&87F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&1002
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1699
Call PushDE_FFFFx
call FinalBitmapPush6
defw BitmapData+1705


PicStage20Face2bmp_Line_165:
call BitmapPush10
defw BitmapData+1715
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1725
LD DE,&0000
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
defw BitmapData+1733
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1739
DEC DE

call MultiPushDe6
call FinalBitmapPush6
defw BitmapData+1745


PicStage20Face2bmp_Line_167:
call BitmapPush6
defw BitmapData+1683
DEC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+1751
Call PushDE_0000x
call BitmapPush6
defw BitmapData+1757
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1765
Call PushDE_0000x
LD HL,&0C96
  Push HL
LD BC,&380A
  Push BC
DEC DE

call MultiPushDe6
call FinalBitmapPush6
defw BitmapData+1771


PicStage20Face2bmp_Line_169:
call BitmapPush6
defw BitmapData+1403
DEC DE

call MultiPushDe6
call BitmapPush6
defw BitmapData+1777
Call PushDE_0000x
call BitmapPush6
defw BitmapData+1783
  PUSH DE
call BitmapPush6
defw BitmapData+1789
  PUSH DE
LD HL,&7803
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1795
DEC DE

call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+1801


PicStage20Face2bmp_Line_171:
call BitmapPush6
defw BitmapData+1807
DEC DE

call MultiPushDe5
LD HL,&FF3D
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0302
  Push BC
Call PushDE_0000x
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
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C369
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&8AFF
  Push BC
Call PushDE_FFFFx
call FinalBitmapPush6
defw BitmapData+1813


PicStage20Face2bmp_Line_173:
call BitmapPush6
defw BitmapData+1819
DEC DE

call MultiPushDe5
LD HL,&F178
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
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
Ld H,&0C
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+1831
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1837


PicStage20Face2bmp_Line_175:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&03EE
  Push HL
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1843
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1849
Call PushDE_0000x
LD BC,&C003
  Push BC
  PUSH DE
LD HL,&0C0F
  Push HL
LD BC,&E170
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&C0
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+1861
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1869


PicStage20Face2bmp_Line_177:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&010C
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+1881
  PUSH DE
call BitmapPush6
defw BitmapData+1887
Call PushDE_0000x
LD BC,&8001
  Push BC
  PUSH DE
LD HL,&080F
  Push HL
LD BC,&E110
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1903
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1909


PicStage20Face2bmp_Line_179:
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1925
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&803C
  Push BC
Call PushDE_0000x
LD HL,&0001
  Push HL
  PUSH DE
LD BC,&000F
  Push BC
LD HL,&6100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1941
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00F0
  Push BC
 jp NextLinePushDe1


PicStage20Face2bmp_Line_181:
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1957
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1963
LD DE,&0000
call MultiPushDe5
LD HL,&000E
  Push HL
LD BC,&3000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1979
jp MultiPushDeLast6


PicStage20Face2bmp_Line_183:
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1995
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2001
LD DE,&0000
call MultiPushDe5
LD HL,&000C
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2007
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2013
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face2bmp_Line_185:
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2039
call MultiPushDe5
LD HL,&0008
  Push HL
call MultiPushDe5
call BitmapPush6
defw BitmapData+2045
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2013
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face2bmp_Line_187:
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2063
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&013C
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe12
LD HL,&E0E1
  Push HL
LD BC,&F01A
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2069
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face2bmp_Line_189:
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2087
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&030C
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe11
call BitmapPush6
defw BitmapData+2093
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2069
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face2bmp_Line_191:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2107
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2115
LD DE,&0000
call MultiPushDe8
LD HL,&0024
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2131
jp MultiPushDeLast6


PicStage20Face2bmp_Line_193:
  PUSH DE
  PUSH DE
LD HL,&080F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2143
  PUSH DE
LD BC,&0F01
  Push BC
LD HL,&0F00
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&0068
  Push BC
LD HL,&0700
  Push HL
  PUSH DE
call BitmapPush12
defw BitmapData+2155
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face2bmp_Line_195:
  PUSH DE
  PUSH DE
LD HL,&0C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2167
  PUSH DE
LD BC,&0F07
  Push BC
LD HL,&0C00
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&00C0
  Push BC
LD HL,&1E03
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+2175
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2181
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face2bmp_Line_197:
  PUSH DE
  PUSH DE
LD HL,&0C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2189
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2195
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0002
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2209
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2215
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face2bmp_Line_199:
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2229
  PUSH DE
call BitmapPush6
defw BitmapData+2235
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0843
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2249
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2255
LD DE,&0000
jp MultiPushDeLast5



PicStage20Face2bmp_DrawOrder: 

  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_1
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_3
  DEFW PicStage20Face2bmp_Line_4
  DEFW PicStage20Face2bmp_Line_5
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_7
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_9
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_11
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_13
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_15
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_17
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_19
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_21
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_23
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_25
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_27
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_29
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_31
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_33
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_35
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_37
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_39
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_41
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_43
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_45
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_47
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_49
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_51
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_53
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_55
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_57
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_59
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_61
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_63
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_65
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_67
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_69
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_71
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_73
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_75
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_77
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_79
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_81
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_83
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_85
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_87
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_89
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_91
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_93
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_95
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_97
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_99
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_101
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_103
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_105
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_107
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_109
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_111
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_113
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_115
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_117
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_119
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_121
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_123
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_125
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_127
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_129
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_131
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_133
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_135
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_137
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_139
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_141
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_143
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_145
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_147
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_149
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_151
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_153
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_155
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_157
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_159
  DEFW PicStage20Face2bmp_Line_0
  DEFW PicStage20Face2bmp_Line_161
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_163
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_165
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_167
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_169
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_171
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_173
  DEFW PicStage20Face2bmp_Line_40
  DEFW PicStage20Face2bmp_Line_175
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_177
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_179
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_181
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_183
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_185
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_187
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_189
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_191
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_193
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_195
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_197
  DEFW PicStage20Face2bmp_Line_4_Reuse
  DEFW PicStage20Face2bmp_Line_199
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
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe17: pop HL
jr MultiPushDe17B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe15: pop HL
jr MultiPushDe15B 
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
BitmapPush26: ld b,&0D
jr BitmapPush
BitmapPush24: ld b,&0C
jr BitmapPush
BitmapPush22: ld b,&0B
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
defb &0A,&0F,&0F,&0E,&0A,&0A,&0A,&0B,&0E,&0A
defb &0A,&0A,&0A,&0F,&0F,&0E,&0A,&0A,&0B,&0F
defb &00,&02,&0A,&0A,&0B,&0F,&08,&00,&00,&02
defb &0A,&0F,&0B,&0F,&0F,&0F,&0F,&0A,&08,&00
defb &00,&02,&0A,&0B,&0A,&0B,&0F,&0F,&0F,&0A
defb &0A,&00,&00,&02,&0A,&0B,&0F,&0E,&0F,&0F
defb &0F,&0E,&F0,&C3,&0F,&0F,&0E,&0A,&FF,&8A
defb &08,&00,&00,&00,&02,&0A,&0A,&0B,&0F,&0E
defb &0A,&0A,&F0,&87,&0F,&0F,&3C,&F0,&FF,&FF
defb &08,&00,&00,&00,&02,&0A,&0A,&0B,&0F,&0E
defb &0A,&0B,&3C,&F0,&F0,&F0,&F0,&C3,&0F,&0F
defb &3C,&F0,&C3,&0F,&0F,&0F,&1E,&F0,&F0,&F0
defb &F0,&0F,&0E,&0A,&FF,&FF,&EE,&00,&00,&00
defb &0A,&0A,&0A,&0B,&0F,&0A,&0A,&0B,&0F,&1E
defb &F0,&C3,&87,&0F,&F0,&F0,&C3,&0F,&3C,&F0
defb &E1,&0F,&0F,&0F,&78,&F0,&F0,&0F,&0F,&0A
defb &F0,&0F,&1E,&F0,&87,&0F,&FF,&FF,&FF,&CC
defb &00,&02,&F0,&E1,&0F,&0F,&0F,&3C,&F0,&0F
defb &0F,&0A,&0A,&0A,&0A,&1B,&78,&F0,&F0,&F0
defb &E1,&0F,&3C,&F0,&C3,&0F,&0F,&78,&F0,&F0
defb &F0,&E1,&1E,&F0,&E1,&0F,&1E,&C3,&0F,&0F
defb &0F,&6F,&0F,&0F,&0E,&0A,&0F,&F0,&F0,&F0
defb &F0,&87,&0F,&F0,&F0,&F0,&F0,&E1,&87,&0F
defb &3C,&F0,&F0,&F0,&EE,&0A,&0A,&0A,&0A,&0B
defb &0F,&3C,&87,&1E,&F0,&F0,&F0,&87,&02,&0A
defb &08,&11,&FF,&8A,&1E,&F0,&F0,&F0,&0F,&F0
defb &F0,&F0,&C3,&0F,&02,&0A,&08,&00,&00,&0A
defb &0F,&78,&F0,&F0,&3C,&F0,&F0,&F0,&00,&0A
defb &08,&00,&02,&0A,&0F,&3C,&F0,&E1,&78,&F0
defb &F0,&87,&00,&02,&08,&00,&02,&0A,&78,&F0
defb &F0,&F0,&F0,&87,&F0,&E1,&78,&F0,&C3,&0F
defb &F0,&87,&0F,&0F,&78,&F0,&00,&02,&0A,&00
defb &02,&0A,&E1,&3C,&F0,&F0,&C3,&0F,&78,&E1
defb &78,&F0,&87,&0F,&0A,&F0,&F0,&F0,&F0,&C3
defb &80,&00,&0A,&00,&02,&0A,&0A,&F0,&F0,&F0
defb &C3,&0F,&C0,&00,&02,&00,&02,&0A,&3C,&F0
defb &F0,&F0,&F0,&C0,&00,&00,&10,&F0,&F3,&FF
defb &FC,&0F,&78,&F0,&E1,&0F,&0F,&0F,&0F,&0A
defb &00,&07,&0F,&0F,&3C,&F0,&02,&0A,&0A,&0A
defb &0A,&0F,&3C,&E1,&0F,&0F,&F0,&E0,&10,&F0
defb &F0,&F0,&0A,&08,&70,&F7,&FF,&FF,&FF,&FC
defb &87,&0F,&0F,&0F,&0F,&3C,&F0,&F0,&80,&00
defb &02,&0A,&0A,&0A,&0A,&0F,&0F,&0F,&0F,&08
defb &F0,&F0,&E1,&3C,&F0,&F0,&E0,&00,&00,&F0
defb &F3,&FF,&FF,&FF,&FF,&EF,&0F,&0F,&0E,&0A
defb &CC,&00,&00,&00,&00,&01,&0F,&0F,&3C,&F0
defb &EE,&0A,&0A,&0A,&0A,&7F,&88,&61,&CC,&00
defb &00,&00,&03,&0F,&0F,&78,&0F,&0F,&78,&87
defb &1E,&F0,&33,&FF,&F0,&F0,&80,&00,&30,&F0
defb &F0,&F0,&C0,&00,&8F,&78,&F0,&E0,&33,&FF
defb &00,&30,&F0,&F0,&0F,&3F,&F0,&0F,&0F,&0F
defb &0F,&78,&F0,&80,&00,&10,&FF,&F8,&F0,&0E
defb &77,&FF,&C3,&C3,&0F,&0F,&7F,&FF,&F0,&87
defb &0F,&0F,&3C,&F0,&C0,&00,&00,&F0,&07,&C3
defb &0F,&1E,&F0,&97,&F0,&87,&0F,&0F,&78,&E0
defb &00,&00,&30,&F0,&F0,&F0,&F0,&68,&77,&FF
defb &E0,&00,&33,&FF,&88,&00,&00,&00,&03,&C3
defb &0F,&3C,&87,&0F,&0F,&7F,&F0,&87,&0F,&3C
defb &F0,&C0,&00,&00,&70,&F0,&FF,&88,&00,&F0
defb &F0,&C0,&0A,&0A,&0A,&0F,&03,&0E,&01,&0F
defb &0F,&08,&F0,&00,&00,&FF,&EE,&00,&00,&00
defb &01,&C3,&0F,&3C,&F0,&87,&0F,&F0,&F0,&00
defb &00,&10,&E1,&E0,&77,&FF,&FF,&FF,&FF,&00
defb &F0,&F0,&F0,&0F,&1E,&F0,&80,&00,&00,&30
defb &F0,&F0,&F0,&C0,&30,&F0,&F0,&F0,&F0,&80
defb &00,&33,&FF,&CC,&00,&00,&01,&C3,&0F,&3C
defb &F0,&F0,&F0,&78,&C3,&E0,&33,&FF,&FF,&00
defb &F0,&F0,&E1,&0F,&3C,&F0,&00,&00,&00,&70
defb &F0,&F0,&F0,&00,&00,&70,&F0,&F0,&F0,&C0
defb &00,&11,&FF,&FF,&CC,&00,&01,&C3,&0F,&3C
defb &F0,&F0,&87,&0F,&1E,&87,&00,&00,&00,&70
defb &F0,&C3,&E0,&00,&00,&30,&3C,&F0,&F0,&C0
defb &00,&00,&77,&FF,&FF,&00,&01,&E1,&0F,&3C
defb &00,&00,&00,&E1,&87,&0F,&C0,&00,&00,&10
defb &87,&0F,&78,&C0,&00,&00,&33,&FF,&FF,&FF
defb &01,&69,&0F,&3C,&F0,&87,&0F,&0F,&00,&30
defb &C3,&E1,&0C,&11,&FF,&FF,&CC,&00,&00,&FF
defb &FF,&FF,&EF,&78,&0F,&3C,&F0,&E1,&0F,&0F
defb &0F,&0A,&0B,&0F,&0E,&08,&07,&0F,&0F,&0F
defb &00,&C3,&0F,&1E,&C0,&00,&00,&30,&F0,&E1
defb &7F,&FF,&FF,&EE,&0F,&0E,&0B,&78,&87,&0F
defb &E1,&0F,&0F,&0E,&00,&00,&00,&C3,&0F,&1E
defb &C0,&00,&00,&00,&C3,&0F,&0F,&C0,&00,&00
defb &00,&33,&00,&10,&F3,&FF,&FF,&FF,&FF,&00
defb &FF,&FE,&F0,&F0,&87,&0F,&0F,&0E,&0B,&68
defb &70,&0F,&E1,&0F,&0F,&0E,&00,&00,&00,&C3
defb &0F,&1E,&C0,&00,&00,&00,&C3,&0F,&1E,&C0
defb &00,&00,&00,&11,&F0,&F0,&80,&20,&70,&C0
defb &00,&30,&F0,&F0,&F0,&0F,&0F,&0F,&0F,&0E
defb &00,&E1,&0F,&0F,&C0,&00,&00,&30,&F0,&F0
defb &E1,&0F,&0F,&0F,&0F,&0E,&00,&E1,&3C,&87
defb &E0,&00,&00,&10,&C3,&1E,&F0,&80,&00,&30
defb &F0,&F0,&C3,&0F,&0F,&0F,&0F,&0E,&00,&F0
defb &F0,&F0,&E0,&00,&00,&10,&F0,&F0,&F0,&80
defb &00,&70,&F0,&F0,&87,&0F,&0F,&0F,&0F,&0E
defb &FF,&8F,&3C,&87,&0C,&00,&00,&70,&F0,&F0
defb &F0,&80,&00,&F0,&F0,&F0,&F0,&00,&00,&F0
defb &F0,&F0,&87,&0F,&0F,&0F,&0F,&0E,&FE,&F0
defb &F0,&C3,&0E,&00,&07,&F0,&F0,&F0,&E1,&0F
defb &78,&F0,&F0,&C3,&0F,&0E,&E0,&00,&00,&00
defb &00,&01,&00,&01,&0F,&F0,&F0,&F0,&E1,&0F
defb &88,&00,&78,&F0,&F0,&87,&1E,&C3,&0C,&00
defb &C0,&00,&00,&00,&00,&0F,&07,&0F,&0F,&F0
defb &F0,&F0,&87,&0F,&38,&F0,&F0,&0F,&78,&C3
defb &0F,&0E,&78,&0F,&78,&F0,&E1,&0F,&0F,&0E
defb &0A,&0F,&80,&00,&00,&00,&03,&0F,&0C,&00
defb &00,&00,&70,&F0,&00,&02,&38,&F0,&C3,&78
defb &F0,&0F,&E1,&0F,&0F,&08,&00,&00,&07,&0F
defb &0F,&3C,&F0,&F0,&F0,&C3,&0F,&01,&C2,&00
defb &30,&86,&70,&C2,&33,&FF,&FF,&FF,&3C,&87
defb &78,&F0,&E1,&0F,&0F,&0E,&0A,&0B,&0E,&00
defb &00,&00,&10,&F0,&0F,&3C,&F0,&F0,&F0,&0F
defb &0F,&01,&00,&02,&38,&F0,&0F,&F0,&E1,&3C
defb &87,&0F,&C0,&00,&30,&C0,&10,&C0,&1E,&87
defb &78,&F0,&C3,&0F,&0F,&0A,&0A,&0A,&E0,&00
defb &00,&00,&00,&03,&1E,&F0,&F0,&F0,&E1,&0F
defb &0E,&01,&00,&02,&1A,&E1,&3C,&F0,&E1,&3C
defb &87,&4B,&1E,&87,&F0,&F0,&0F,&0F,&0F,&0A
defb &0A,&0B,&0F,&0F,&0F,&0E,&0F,&78,&F0,&0F
defb &0F,&0F,&00,&02,&1A,&F0,&78,&F0,&0E,&0A
defb &0A,&0B,&88,&0F,&0F,&F0,&F0,&87,&C3,&0F
defb &0A,&1B,&FF,&FF,&CC,&0F,&F0,&E1,&3C,&F0
defb &E1,&3C,&C3,&0F,&0F,&69,&0F,&0F,&0F,&3F
defb &00,&02,&0A,&F0,&E1,&3C,&F0,&F0,&F0,&C3
defb &3C,&F0,&C3,&3C,&E1,&0F,&3C,&F0,&F0,&F0
defb &E1,&0E,&00,&07,&00,&34,&F0,&F0,&F0,&33
defb &FF,&FF,&FF,&EF,&0F,&0F,&0F,&3F,&FF,&8A
defb &0A,&78,&E1,&0F,&3C,&F0,&F7,&FF,&FF,&FF
defb &FF,&F0,&87,&4B,&1E,&F0,&F0,&F0,&E1,&0C
defb &00,&0F,&10,&F0,&F0,&00,&C2,&77,&FC,&F0
defb &87,&78,&0F,&F0,&F0,&F0,&E1,&00,&01,&0F
defb &F0,&87,&3C,&F0,&C2,&77,&CC,&07,&0F,&0F
defb &0F,&78,&FF,&F8,&F0,&F0,&0F,&F0,&87,&78
defb &F0,&F0,&C3,&00,&07,&0F,&97,&FF,&FF,&F0
defb &0C,&77,&88,&0F,&78,&F0,&F0,&F0,&FE,&F0
defb &F0,&F0,&0F,&F0,&C3,&1E,&F0,&F0,&C3,&00
defb &1F,&FF,&FF,&CF,&08,&FF,&01,&0F,&78,&F0
defb &F0,&87,&0F,&F0,&E1,&0F,&F0,&F0,&C3,&00
defb &07,&0F,&0F,&7F,&FF,&F8,&91,&FF,&FF,&CC
defb &07,&0F,&0F,&0F,&3C,&87,&0F,&08,&00,&00
defb &03,&7F,&0F,&F0,&F0,&0F,&78,&F0,&C3,&08
defb &00,&0F,&C3,&0F,&1E,&F0,&91,&FF,&03,&0F
defb &0F,&0F,&0F,&78,&F0,&0A,&F0,&C3,&78,&87
defb &3C,&F0,&C3,&0E,&00,&07,&FF,&FE,&F0,&C0
defb &00,&00,&01,&0F,&F0,&87,&F0,&F0,&80,&FF
defb &07,&0F,&0F,&0F,&0F,&F0,&E0,&0A,&F0,&C3
defb &78,&87,&3C,&F0,&C3,&0F,&00,&00,&07,&0F
defb &00,&0A,&0A,&1A,&F0,&C0,&00,&00,&00,&10
defb &0F,&08,&12,&E0,&00,&00,&00,&01,&F0,&87
defb &3C,&F0,&C3,&0F,&0E,&00,&00,&07,&00,&0A
defb &0A,&1A,&F0,&E0,&C0,&00,&0F,&10,&F0,&00
defb &00,&03,&3C,&80,&00,&00,&00,&01,&00,&0A
defb &0A,&1A,&F0,&86,&0E,&00,&01,&0F,&78,&00
defb &00,&00,&00,&03,&07,&00,&07,&F0,&F0,&F0
defb &F0,&3C,&F0,&F0,&E1,&0F,&00,&0A,&0A,&0A
defb &F0,&C3,&0F,&0E,&00,&00,&00,&0F,&C0,&00
defb &00,&00,&00,&03,&02,&0A,&0A,&0A,&F0,&E1
defb &0F,&00,&00,&00,&00,&0F,&C0,&00,&00,&00
defb &00,&07,&02,&0A,&0A,&0A,&78,&E1,&08,&00
defb &00,&00,&07,&78,&C0,&00,&10,&F0,&02,&0A
defb &0A,&0A,&38,&F0,&08,&00,&00,&00,&03,&68
defb &00,&00,&00,&30,&10,&F0,&C0,&10,&F0,&84
defb &02,&0A,&0A,&0A,&38,&F0,&0C,&01,&2C,&00
defb &03,&C0,&0A,&08,&11,&88,&87,&0F,&0F,&0F
defb &0F,&0E,&00,&07,&F0,&00,&02,&0A,&0A,&0A
defb &38,&F0,&0E,&07,&48,&00,&12,&00,&1E,&F0
defb &F0,&F0,&80,&FF,&0A,&0B,&0A,&FF,&FF,&EE
defb &07,&0F,&0F,&0F,&08,&00,&0F,&0F,&E0,&00
defb &8A,&0A,&0A,&0A,&7F,&FF,&87,&12,&80,&00
defb &0F,&F2,&F0,&F0,&33,&FF,&0E,&3F,&FF,&FF
defb &FF,&EE,&07,&0F,&0F,&0F,&03,&C0,&07,&7F
defb &FF,&FF,&EF,&1E,&F0,&F0,&03,&08,&30,&F0
defb &F0,&F0,&F0,&C3,&FF,&78,&2D,&18,&80,&00
defb &0F,&F3,&F8,&E0,&33,&FF,&03,&C0,&0F,&0F
defb &3F,&FF,&00,&70,&C0,&00,&03,&3C,&03,&3C
defb &C0,&70,&F0,&F0,&F0,&C3,&0F,&79,&FF,&EC
defb &77,&FF,&03,&09,&0F,&0F,&0F,&1F,&0F,&78
defb &80,&00,&00,&2C,&F0,&F0,&F0,&E1,&0F,&0F
defb &FF,&0A,&0A,&1A,&F0,&86,&0F,&78,&F1,&EC
defb &77,&FF,&FF,&88,&87,&0F,&0F,&0F,&0F,&78
defb &F0,&E0,&77,&FF,&FF,&10,&87,&0F,&0F,&0F
defb &FF,&CC,&0A,&0A,&0F,&0A,&0A,&0A,&78,&96
defb &08,&00,&F0,&F0,&F0,&E0,&33,&FF,&F0,&F0
defb &E0,&0A,&0A,&FF,&04,&00,&00,&00,&00,&0F
defb &00,&02,&0A,&0A,&0F,&0A,&0A,&0A,&29,&E1
defb &4A,&00,&E0,&30,&F0,&B0,&80,&FF,&FF,&88
defb &0F,&3C,&F0,&F0,&E0,&0A,&0A,&0B,&0F,&0A
defb &3B,&0F,&3C,&00,&00,&00,&03,&0F,&00,&02
defb &0A,&0A,&0F,&0E,&0A,&0A,&1A,&78,&A5,&08
defb &00,&0F,&1E,&80,&B0,&F0,&F0,&F0,&C0,&00
defb &0F,&78,&F0,&F0,&C2,&0A,&0A,&0F,&0F,&0A
defb &0A,&0B,&0F,&0F,&0C,&00,&00,&0A,&0A,&0B
defb &0F,&0E,&0A,&0A,&0A,&78,&C3,&87,&01,&0F
defb &3C,&00,&3C,&F0,&F0,&F0,&0A,&0F,&0F,&0F
defb &0F,&0A,&0A,&0B,&0F,&0F,&0C,&00,&00,&01
defb &3C,&E0,&00,&01,&00,&0A,&0A,&0B,&0F,&0E
defb &0A,&0A,&0A,&38,&F0,&0F,&68,&03,&68,&00
defb &F0,&F0,&F0,&C2,&0B,&0F,&0F,&0F,&0F,&0E
defb &0A,&0B,&0F,&0F,&0C,&00,&00,&03,&3C,&C0
defb &00,&07,&F0,&E1,&1E,&01,&E0,&00,&02,&0A
defb &0A,&0F,&0F,&0E,&00,&03,&3C,&80,&03,&0F
defb &0F,&0F,&0F,&3C,&F0,&F0,&F0,&82,&0B,&0F
defb &0F,&0F,&0F,&0E,&0A,&0B,&0F,&0F,&0F,&00
defb &78,&78,&0F,&C0,&40,&00,&1E,&F0,&F0,&F0
defb &F0,&0A,&0B,&0E,&0F,&0F,&0F,&0E,&0A,&0F
defb &0F,&0F,&0F,&08,&02,&0A,&0B,&0F,&0F,&0F
defb &78,&F0,&F0,&F0,&E0,&0A,&0F,&0E,&0B,&0F
defb &0F,&0F,&0A,&0F,&0F,&0F,&0F,&08,&0A,&F0
defb &F0,&5A,&80,&00,&82,&0A,&0F,&0A,&0B,&0F
defb &0F,&0F,&0B,&0F,&0F,&0F,&0F,&08,&00,&07
defb &08,&0F,&0F,&0F,&0F,&1E,&0A,&0A,&0B,&0F
defb &0F,&0F,&0A,&0A,&0A,&0F,&0E,&78,&F0,&69
defb &C0,&00,&0F,&78,&F0,&F0,&F0,&E0,&0A,&0B
defb &0F,&0A,&0B,&0F,&0A,&0F,&0A,&0A,&0B,&0F
defb &0F,&18,&F0,&78,&96,&80,&3C,&F0,&F0,&F0
defb &F0,&0A,&0A,&0B,&0F,&0A,&0A,&0F,&0F,&0F
defb &0F,&08,&F0,&F0,&C3,&96,&00,&02,&0A,&0F
defb &0E,&0A,&C2,&0A,&0A,&0B,&0E,&0A,&0A,&0F
defb &04,&00,&00,&00,&00,&01,&0F,&0F,&0F,&0E
defb &30,&F0,&F0,&78,&C0,&00,&07,&78,&C0,&00
defb &00,&02,&0B,&0F,&0F,&0A,&0F,&78,&F0,&F0
defb &F0,&E0,&0A,&0A,&0A,&0F,&0E,&0A,&0A,&0B
defb &86,&00,&00,&00,&00,&03,&0F,&0F,&0F,&0E
defb &00,&70,&F0,&F0,&F0,&E0,&00,&F0,&80,&00
defb &00,&02,&0F,&0F,&0F,&0E
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
save direct "T32-SC1.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]