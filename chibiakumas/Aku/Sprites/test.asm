read "..\CoreDefs.asm" ;read "BootStrap.asm"
org &4000
jp PicWingsComplete0bmp
jp PicWingsComplete6bmp
jp PicStage20Face1bmp_Processedpng_Processedpng

PicWingsComplete0bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete0bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete0bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicWingsComplete0bmp_Line_1:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Ld D,L
Ld E,L

call MultiPushDe16
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_5:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+5
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+11
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_7:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Call PushDE_0000x
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_9:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
Ld B,E


  Push BC
Call PushDE_0000x
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_11:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
Call PushDE_0000x
LD BC,&4010
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&50
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_13:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld B,&00
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
Call PushDE_0000x
LD HL,&4010
  Push HL

Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_15:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
Call PushDE_0000x
Ld C,&10
  Push BC
Ld H,E
Ld L,B

  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&50
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_17:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
Call PushDE_0000x
Ld H,E
Ld L,C

  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
Ld C,&00
  Push BC
Call PushDE_0000x
LD HL,&4010
  Push HL
Ld B,E
Ld C,H

  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_23:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
Call PushDE_0000x
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
LD DE,&0000
call MultiPushDe5
LD BC,&5050
  Push BC
LD HL,&0040
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_25:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  Push HL 
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld D,H
Ld E,H

call MultiPushDe7
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+23
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete0bmp_Line_27:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&5010
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+35
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete0bmp_Line_29:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+41
call MultiPushDe8
LD HL,&5010
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete0bmp_Line_31:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+47
call MultiPushDe8
call BitmapPush6
defw BitmapData+47
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_33:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld B,L


  Push BC
call MultiPushDe8
LD HL,&5010
  Push HL
Ld C,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_35:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
LD BC,&0000
  Push BC
call MultiPushDe8
LD HL,&1000
  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_37:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
LD BC,&0040
  Push BC
call MultiPushDe6
Ld H,E
Ld L,B

  Push HL

Ld C,L

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_39:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+53
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+59
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_41:
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,L

  Push BC

Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_43:
  PUSH DE
  PUSH DE
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
Ld L,&50
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicWingsComplete0bmp_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+67
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
Ld L,&50
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
LD HL,&5000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe3


PicWingsComplete0bmp_Line_46:
jp MultiPushDeLast40


PicWingsComplete0bmp_Line_47:
call MultiPushDe6
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld C,&50
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&40
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld D,B
Ld E,B

jp MultiPushDeLast6


PicWingsComplete0bmp_Line_46_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_46
PicWingsComplete0bmp_Line_49:
call MultiPushDe7
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld C,&50
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&40
  Push BC
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld D,B
Ld E,B

jp MultiPushDeLast7


PicWingsComplete0bmp_Line_51:
call MultiPushDe11
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld C,&50
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,L
Ld E,L

jp MultiPushDeLast11


PicWingsComplete0bmp_Line_53:
call MultiPushDe13
LD HL,&0040
  Push HL
LD BC,&5050
  Push BC
  PUSH DE
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
Ld B,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

jp MultiPushDeLast13


PicWingsComplete0bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe34
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete0bmp_Line_81:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

call MultiPushDe22
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete0bmp_Line_83:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld B,L


  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E


  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

  Push BC
LD HL,&4050
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
 jp NextLinePushDe2


PicWingsComplete0bmp_Line_121:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
call MultiPushDe20
LD HL,&0000
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete0bmp_Line_123:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
call MultiPushDe30
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete0bmp_Line_125:
LD DE,&5050
call MultiPushDe10
LD HL,&1000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,L

  Push BC

Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
jp MultiPushDeLast15


PicWingsComplete0bmp_Line_127:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
Ld B,&40
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,L
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,L

  Push BC

Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
jp MultiPushDeLast5


PicWingsComplete0bmp_Line_131:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,C
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,C

  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&10
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete0bmp_Line_131_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_131
PicWingsComplete0bmp_Line_151:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld D,C
Ld E,C

call MultiPushDe8
LD BC,&0050
  Push BC
LD HL,&1000
  Push HL
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete0bmp_Line_153:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+79
LD DE,&0000
call MultiPushDe15
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete0bmp_Line_155:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld D,H
Ld E,H

call MultiPushDe18
LD HL,&0040
  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&00
  jp NextLinePushHl 


PicWingsComplete0bmp_Line_157:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+85
LD DE,&0000
call MultiPushDe24
call BitmapPush6
defw BitmapData+91
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
 jp NextLinePushBC 


PicWingsComplete0bmp_Line_159:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe28
LD HL,&0040
  Push HL
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H


 jp NextLinePushBC 


PicWingsComplete0bmp_Line_161:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe31
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,C
Ld L,C

  jp NextLinePushHl 


PicWingsComplete0bmp_Line_163:
  PUSH DE
LD HL,&4050
  Push HL
LD BC,&5010
  Push BC
call MultiPushDe14
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
LD DE,&0000
call MultiPushDe14
LD BC,&4050
  Push BC
Ld H,C
Ld L,C

  Push HL
 jp NextLinePushDe1


PicWingsComplete0bmp_Line_165:
  PUSH DE
LD HL,&4050
  Push HL
call MultiPushDe14
LD BC,&4050
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&5010
  Push HL
LD DE,&0000
call MultiPushDe14
  Push BC
 jp NextLinePushDe1


PicWingsComplete0bmp_Line_167:
call MultiPushDe16
LD DE,&5050
call MultiPushDe8
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast15


PicWingsComplete0bmp_Line_169:
call MultiPushDe8
LD HL,&0040
  Push HL
LD BC,&1000
  Push BC
call MultiPushDe5
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD BC,&5010
  Push BC
Call PushDE_0000x
call BitmapPush6
defw BitmapData+97
jp MultiPushDeLast8


PicWingsComplete0bmp_Line_171:
call MultiPushDe8
call BitmapPush8
defw BitmapData+105
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe10
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+113
jp MultiPushDeLast8


PicWingsComplete0bmp_Line_173:
call MultiPushDe8
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
Ld D,L
Ld E,L

call MultiPushDe10
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&4050
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

jp MultiPushDeLast8


PicWingsComplete0bmp_Line_175:
call MultiPushDe10
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe19
LD BC,&1000
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast9


PicWingsComplete0bmp_Line_175_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_175
PicWingsComplete0bmp_Line_179:
call MultiPushDe7
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe24
LD BC,&5010
  Push BC
LD DE,&0000
jp MultiPushDeLast7


PicWingsComplete0bmp_Line_181:
call MultiPushDe5
LD HL,&0040
  Push HL
LD DE,&5050
call MultiPushDe8
LD BC,&5010
  Push BC
LD HL,&1000
  Push HL
call MultiPushDe8
LD BC,&0040
  Push BC
call MultiPushDe9
Ld H,E
Ld L,B

  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast5


PicWingsComplete0bmp_Line_183:
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe11
Ld E,&10
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
Ld E,&50
call MultiPushDe6
LD BC,&1000
  Push BC
Ld D,&00
  PUSH DE
  PUSH DE
Ld D,E
call MultiPushDe11
Ld D,C
Ld E,C

 jp NextLinePushDe3


PicWingsComplete0bmp_Line_185:
  PUSH DE
  PUSH DE
LD HL,&0050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&5000
  Push BC
  PUSH DE
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
Ld C,&10
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+119
LD DE,&5050
call MultiPushDe11
LD HL,&5000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete0bmp_Line_187:
  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

call MultiPushDe11
LD BC,&5000
  Push BC
  PUSH DE
  PUSH DE
  Push BC
Call PushDE_0000x
LD HL,&0040
  Push HL
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
LD BC,&1040
  Push BC
call MultiPushDe12
LD DE,&0000
 jp NextLinePushDe2


PicWingsComplete0bmp_Line_189:
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe12
LD HL,&5040
  Push HL
call MultiPushDe10
LD BC,&1040
  Push BC
call MultiPushDe12
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicWingsComplete0bmp_Line_191:
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe36
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 



PicWingsComplete0bmp_DrawOrder: 

  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_5
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_7
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_9
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_11
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_13
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_15
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_17
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_23
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_25
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_27
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_29
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_31
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_33
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_35
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_37
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_39
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_41
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_43
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_45
  DEFW PicWingsComplete0bmp_Line_46
  DEFW PicWingsComplete0bmp_Line_47
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_49
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_51
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_53
defw looper
  DEFB 1,25
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_79
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_81
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_83
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_121
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_123
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_125
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_127
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_127
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_151
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_153
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_155
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_157
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_159
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_161
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_163
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_165
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_167
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_169
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_171
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_173
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_175
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_175_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_179
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_181
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_183
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_185
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_187
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_189
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW EndCode
PicWingsComplete6bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete6bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete0bmp_Line_45_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_45
PicWingsComplete0bmp_Line_47_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_47
PicWingsComplete0bmp_Line_49_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_49
PicWingsComplete0bmp_Line_51_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_51
PicWingsComplete0bmp_Line_53_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_53
PicWingsComplete6bmp_Line_56:
call MultiPushDe8
LD HL,&8800
  Push HL
call MultiPushDe22
LD BC,&0044
  Push BC
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_56_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_56
PicWingsComplete6bmp_Line_58:
call MultiPushDe7
call BitmapPush6
defw BitmapData+125
call MultiPushDe20
call BitmapPush6
defw BitmapData+131
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_59:
call MultiPushDe7
call BitmapPush6
defw BitmapData+137
  PUSH DE
LD HL,&0088
  Push HL
call MultiPushDe16
LD BC,&4400
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1144
  Push HL
Ld B,&88
  Push BC
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_60:
call MultiPushDe7
call BitmapPush6
defw BitmapData+143
  PUSH DE
LD HL,&0088
  Push HL
call MultiPushDe16
LD BC,&4400
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1144
  Push HL
  Push BC
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_61:
call MultiPushDe7
call BitmapPush6
defw BitmapData+149
  PUSH DE
LD HL,&4488
  Push HL
Ld B,E
Ld C,H

  Push BC
call MultiPushDe14
LD HL,&8800
  Push HL
LD BC,&4488
  Push BC
  PUSH DE
  PUSH DE
LD HL,&2244
  Push HL

Ld C,E

  Push BC
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_62:
call MultiPushDe7
call BitmapPush6
defw BitmapData+155
  PUSH DE
LD HL,&4488
  Push HL
LD BC,&0022
  Push BC
  PUSH DE
  PUSH DE
Ld L,&00
  Push HL
call MultiPushDe8
Ld C,&88
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
Ld B,&44
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+163
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_63:
call MultiPushDe7
call BitmapPush6
defw BitmapData+169
  PUSH DE
LD HL,&8888
  Push HL
LD BC,&0022
  Push BC
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
call MultiPushDe8
Ld C,&88
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
LD BC,&4444
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+175
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_64:
call MultiPushDe7
call BitmapPush6
defw BitmapData+181
  PUSH DE
LD HL,&8888
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+187
call MultiPushDe7
LD HL,&1188
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
LD HL,&0022
  Push HL
LD BC,&4444
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+193
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_65:
call MultiPushDe6
call BitmapPush22
defw BitmapData+215
call MultiPushDe7
call BitmapPush20
defw BitmapData+235
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_66:
call MultiPushDe6
call BitmapPush22
defw BitmapData+257
call MultiPushDe7
LD HL,&2288
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+271
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_67:
call MultiPushDe7
call BitmapPush18
defw BitmapData+289
call MultiPushDe8
LD HL,&4488
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+303
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_68:
call MultiPushDe7
call BitmapPush12
defw BitmapData+315
  PUSH DE
call BitmapPush6
defw BitmapData+321
call MultiPushDe6
call BitmapPush20
defw BitmapData+341
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_69:
call MultiPushDe8
call BitmapPush20
defw BitmapData+361
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+381
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_70:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+387
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC33
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+403
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+419
  PUSH DE
LD BC,&00FF
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+425
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_71:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+445
Call PushDE_0000x
call BitmapPush22
defw BitmapData+467
DEC DE

  PUSH DE
  PUSH DE
LD BC,&FF33
  Push BC
Call PushDE_0000x
jp NextLine


PicWingsComplete6bmp_Line_72:
call MultiPushDe6
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+487
Call PushDE_0000x
call BitmapPush14
defw BitmapData+501
  PUSH DE
call BitmapPush10
defw BitmapData+511
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_73:
call MultiPushDe8
call BitmapPush10
defw BitmapData+521
  PUSH DE
call BitmapPush8
defw BitmapData+529
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&8811
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+545
LD DE,&0000
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_74:
call MultiPushDe6
call BitmapPush14
defw BitmapData+559
  PUSH DE
call BitmapPush8
defw BitmapData+567
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+575
  PUSH DE
call BitmapPush14
defw BitmapData+589
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_75:
call MultiPushDe5
call BitmapPush10
defw BitmapData+599
  PUSH DE
call BitmapPush6
defw BitmapData+605
  PUSH DE
call BitmapPush8
defw BitmapData+613
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+619
  PUSH DE
call BitmapPush18
defw BitmapData+637
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_76:
call MultiPushDe5
call BitmapPush22
defw BitmapData+659
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&7700
  Push HL
  PUSH DE
call BitmapPush22
defw BitmapData+681
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_77:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+691
LD DE,&DD11
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+707
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
call BitmapPush24
defw BitmapData+731
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_78:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+741
LD DE,&3322
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+757
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+767
  PUSH DE
call BitmapPush14
defw BitmapData+781
  PUSH DE
LD HL,&EE77
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+793
LD DE,&BB33
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+809
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+827
LD DE,&3377
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+839
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_80:
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8877
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+847
LD DE,&BB33
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+877
call BitmapPush8
defw BitmapData+885
LD DE,&3377
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+895
LD DE,&0000
 jp NextLinePushDe3


PicWingsComplete6bmp_Line_81:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+925
call BitmapPush24
defw BitmapData+949
LD DE,&3366
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+961
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_82:
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+967
LD DE,&BB11
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+997
call BitmapPush8
defw BitmapData+1005
LD DE,&3366
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1011
LD DE,&0000
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_83:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1021
LD DE,&BB99
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1051
call BitmapPush26
defw BitmapData+1077
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_84:
LD DE,&0000
call MultiPushDe5
call BitmapPush30
defw BitmapData+1107
call BitmapPush28
defw BitmapData+1135
  PUSH DE
LD HL,&3300
  Push HL
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_85:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1165
call BitmapPush30
defw BitmapData+1195
LD HL,&9822
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1201
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_86:
Call PushDE_0000x
LD HL,&0033
  Push HL
  PUSH DE
call BitmapPush30
defw BitmapData+1231
call BitmapPush26
defw BitmapData+1257
  PUSH DE
LD BC,&0033
  Push BC
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_87:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&CC00
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+1287
call BitmapPush30
defw BitmapData+1317
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_88:
Call PushDE_0000x
LD HL,&3300
  Push HL
  PUSH DE
call BitmapPush30
defw BitmapData+1347
call BitmapPush28
defw BitmapData+1375
  PUSH DE
LD BC,&3300
  Push BC
 jp NextLinePushDe3


PicWingsComplete6bmp_Line_89:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1405
call BitmapPush24
defw BitmapData+1429
LD DE,&DD88
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1441
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_90:
LD DE,&0000
call MultiPushDe5
call BitmapPush6
defw BitmapData+1447
LD DE,&66CC
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1465
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+1483
LD DE,&DD88
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1489
LD DE,&0000
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_91:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1519
call BitmapPush24
defw BitmapData+1543
LD DE,&DD88
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1555
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_92:
LD DE,&0000
call MultiPushDe5
LD HL,&0066
  Push HL
  PUSH DE
call BitmapPush26
defw BitmapData+1581
  PUSH DE
call BitmapPush20
defw BitmapData+1601
Ld D,&DD
  PUSH DE
  PUSH DE
LD BC,&2200
  Push BC
LD HL,&8811
  Push HL
Ld D,C


jp MultiPushDeLast5


PicWingsComplete6bmp_Line_93:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1631
call BitmapPush26
defw BitmapData+1657
LD DE,&DD40
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1667
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_94:
LD DE,&0000
call MultiPushDe5
call BitmapPush28
defw BitmapData+1695
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+1715
Ld D,&BB
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
Ld B,E
Ld C,H

  Push BC
Ld D,L


jp MultiPushDeLast5


PicWingsComplete6bmp_Line_95:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1745
call BitmapPush30
defw BitmapData+1775
call BitmapPush10
defw BitmapData+1785
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_96:
LD DE,&0000
call MultiPushDe5
LD HL,&2200
  Push HL
Ld E,&44
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+1807
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1833
  PUSH DE
LD BC,&1100
  Push BC
 jp NextLinePushDe4


PicWingsComplete6bmp_Line_97:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1863
call BitmapPush30
defw BitmapData+1893
LD HL,&9840
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+1899
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_98:
LD DE,&0000
call MultiPushDe6
call BitmapPush26
defw BitmapData+1925
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+1951
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_99:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+1981
call BitmapPush20
defw BitmapData+2001
LD DE,&AA40
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2011
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_100:
LD DE,&0000
call MultiPushDe6
call BitmapPush26
defw BitmapData+2037
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2057
Ld D,&AA
  PUSH DE
  PUSH DE
LD HL,&0022
  Push HL
Ld D,H


jp MultiPushDeLast6


PicWingsComplete6bmp_Line_101:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+2087
call BitmapPush26
defw BitmapData+2113
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_102:
LD DE,&0000
call MultiPushDe6
call BitmapPush26
defw BitmapData+2139
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+2165
jp MultiPushDeLast6


PicWingsComplete6bmp_Line_103:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
call BitmapPush30
defw BitmapData+2195
call BitmapPush20
defw BitmapData+2215
LD DE,&CC40
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2225
LD DE,&5050
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_104:
LD DE,&0000
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2245
Ld E,&00
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2265
Ld D,&CC
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_105:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2295
call BitmapPush22
defw BitmapData+2317
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_106:
LD DE,&0000
call MultiPushDe7
Ld E,&CC
  PUSH DE
  PUSH DE
LD HL,&0055
  Push HL
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+2331
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2349
Ld D,&CC
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_107:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+2377
  PUSH DE
call BitmapPush22
defw BitmapData+2399
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_108:
LD DE,&0000
call MultiPushDe7
Ld E,&44
  PUSH DE
  PUSH DE
LD HL,&0055
  Push HL
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+2413
Ld E,&00
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2431
Ld D,&88
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_109:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
Ld E,&54
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2461
call BitmapPush18
defw BitmapData+2479
Ld E,&50
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_110:
LD DE,&0000
call MultiPushDe7
Ld E,&44
  PUSH DE
  PUSH DE
LD HL,&0033
  Push HL
LD BC,&00AA
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+2491
Call PushDE_0000x
call BitmapPush18
defw BitmapData+2509
Ld D,&88
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast7


PicWingsComplete6bmp_Line_111:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
Ld E,&54
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+2539
call BitmapPush18
defw BitmapData+2557
Ld E,&50
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_112:
LD DE,&0000
call MultiPushDe8
call BitmapPush20
defw BitmapData+2577
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2597
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_113:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2617
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2637
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_114:
LD DE,&0000
call MultiPushDe8
call BitmapPush20
defw BitmapData+2657
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2677
jp MultiPushDeLast8


PicWingsComplete6bmp_Line_115:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2697
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2717
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_116:
LD DE,&0000
call MultiPushDe9
call BitmapPush18
defw BitmapData+2735
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2753
jp MultiPushDeLast9


PicWingsComplete6bmp_Line_117:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2771
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2791
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_118:
LD DE,&0000
call MultiPushDe9
call BitmapPush18
defw BitmapData+2809
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2827
jp MultiPushDeLast9


PicWingsComplete6bmp_Line_119:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2845
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush20
defw BitmapData+2865
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_120:
LD DE,&0000
call MultiPushDe10
call BitmapPush16
defw BitmapData+2881
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2897
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_121:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2915
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2935
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_122:
LD DE,&0000
call MultiPushDe10
call BitmapPush12
defw BitmapData+2947
  PUSH DE
LD HL,&5500
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2963
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_123:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
call MultiPushDe5
call BitmapPush12
defw BitmapData+2975
  PUSH DE
LD HL,&5550
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2991
call MultiPushDe5
call BitmapPush6
defw BitmapData+73
 jp NextLinePushDe2


PicWingsComplete6bmp_Line_124:
LD DE,&0000
call MultiPushDe10
call BitmapPush12
defw BitmapData+3003
  PUSH DE
LD HL,&5500
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3019
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_125:
LD DE,&5050
call MultiPushDe10
call BitmapPush12
defw BitmapData+3031
  PUSH DE
LD HL,&6650
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+3047
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_126:
LD DE,&0000
call MultiPushDe10
LD HL,&0044
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+3055
  PUSH DE
LD BC,&6600
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3061
LD DE,&1188
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3067
LD DE,&0000
jp MultiPushDeLast10


PicWingsComplete6bmp_Line_127:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3079
  PUSH DE
LD HL,&6650
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3085
LD DE,&5198
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3091
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_128:
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+3099
  PUSH DE
LD HL,&6600
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3109
  PUSH DE
LD BC,&2200
  Push BC
jp MultiPushDeLast11


PicWingsComplete6bmp_Line_129:
LD DE,&5050
call MultiPushDe5
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3121
  PUSH DE
LD HL,&6650
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+3137
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
jp MultiPushDeLast5


PicWingsComplete6bmp_Line_131:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld D,&40
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3151
call BitmapPush14
defw BitmapData+3165
  PUSH DE
LD HL,&0010
  Push HL
Ld B,H
Ld C,D

  Push BC
Ld D,E
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&50
  Push HL
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&00
 jp NextLinePushBC 


PicWingsComplete6bmp_Line_132:
LD DE,&0000
call MultiPushDe13
call BitmapPush6
defw BitmapData+3171
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3177
jp MultiPushDeLast13


PicWingsComplete6bmp_Line_133:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+3183
  PUSH DE
LD BC,&5450
  Push BC
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L


  Push BC
  PUSH DE
call BitmapPush16
defw BitmapData+3199
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  jp NextLinePushHl 


PicWingsComplete6bmp_Line_134:
LD DE,&0000
call MultiPushDe14
LD HL,&4400
  Push HL
LD BC,&8811
  Push BC
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL
  PUSH DE
LD BC,&0066
  Push BC
  Push HL 
jp MultiPushDeLast14


PicWingsComplete6bmp_Line_135:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
LD BC,&5450
  Push BC
LD HL,&8811
  Push HL
  PUSH DE
  Push BC
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+3209
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_135_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_135
PicWingsComplete6bmp_Line_138:
LD DE,&0000
call MultiPushDe14
LD HL,&4400
  Push HL
LD BC,&8811
  Push BC
call MultiPushDe8
LD HL,&0066
  Push HL
LD BC,&0088
  Push BC
jp MultiPushDeLast14


PicWingsComplete6bmp_Line_139:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
Ld C,&50
  Push BC
LD HL,&0011
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC

Ld L,E

  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3215
  PUSH DE
LD BC,&5010
  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_140:
LD DE,&0000
call MultiPushDe15
LD HL,&0011
  Push HL
call MultiPushDe8
LD BC,&0022
  Push BC
jp MultiPushDeLast15


PicWingsComplete6bmp_Line_141:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,&10
  Push BC
Ld H,&40
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,E
Ld L,B

  Push HL

Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1022
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,H
Ld C,H

 jp NextLinePushBC 


PicWingsComplete6bmp_Line_141_Reuse:
LD DE,&0000
JP PicWingsComplete6bmp_Line_141
PicWingsComplete0bmp_Line_151_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_151
PicWingsComplete0bmp_Line_153_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_153
PicWingsComplete0bmp_Line_155_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_155
PicWingsComplete0bmp_Line_157_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_157
PicWingsComplete0bmp_Line_159_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_159
PicWingsComplete0bmp_Line_161_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_161
PicWingsComplete0bmp_Line_163_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_163
PicWingsComplete0bmp_Line_165_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_165
PicWingsComplete0bmp_Line_169_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_169
PicWingsComplete0bmp_Line_171_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_171
PicWingsComplete0bmp_Line_173_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_173
PicWingsComplete0bmp_Line_179_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_179
PicWingsComplete0bmp_Line_181_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_181
PicWingsComplete0bmp_Line_185_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_185
PicWingsComplete0bmp_Line_187_Reuse:
LD DE,&0000
JP PicWingsComplete0bmp_Line_187

PicWingsComplete6bmp_DrawOrder: 

  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_5
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_7
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_9
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_11
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_13
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_15
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_17
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_1
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_23
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_25
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_27
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_29
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_31
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_33
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_35
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_37
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_39
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_41
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_43
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_45_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_47_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_49_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_51_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_53_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete6bmp_Line_56
  DEFW PicWingsComplete6bmp_Line_56_Reuse
  DEFW PicWingsComplete6bmp_Line_58
  DEFW PicWingsComplete6bmp_Line_59
  DEFW PicWingsComplete6bmp_Line_60
  DEFW PicWingsComplete6bmp_Line_61
  DEFW PicWingsComplete6bmp_Line_62
  DEFW PicWingsComplete6bmp_Line_63
  DEFW PicWingsComplete6bmp_Line_64
  DEFW PicWingsComplete6bmp_Line_65
  DEFW PicWingsComplete6bmp_Line_66
  DEFW PicWingsComplete6bmp_Line_67
  DEFW PicWingsComplete6bmp_Line_68
  DEFW PicWingsComplete6bmp_Line_69
  DEFW PicWingsComplete6bmp_Line_70
  DEFW PicWingsComplete6bmp_Line_71
  DEFW PicWingsComplete6bmp_Line_72
  DEFW PicWingsComplete6bmp_Line_73
  DEFW PicWingsComplete6bmp_Line_74
  DEFW PicWingsComplete6bmp_Line_75
  DEFW PicWingsComplete6bmp_Line_76
  DEFW PicWingsComplete6bmp_Line_77
  DEFW PicWingsComplete6bmp_Line_78
  DEFW PicWingsComplete6bmp_Line_79
  DEFW PicWingsComplete6bmp_Line_80
  DEFW PicWingsComplete6bmp_Line_81
  DEFW PicWingsComplete6bmp_Line_82
  DEFW PicWingsComplete6bmp_Line_83
  DEFW PicWingsComplete6bmp_Line_84
  DEFW PicWingsComplete6bmp_Line_85
  DEFW PicWingsComplete6bmp_Line_86
  DEFW PicWingsComplete6bmp_Line_87
  DEFW PicWingsComplete6bmp_Line_88
  DEFW PicWingsComplete6bmp_Line_89
  DEFW PicWingsComplete6bmp_Line_90
  DEFW PicWingsComplete6bmp_Line_91
  DEFW PicWingsComplete6bmp_Line_92
  DEFW PicWingsComplete6bmp_Line_93
  DEFW PicWingsComplete6bmp_Line_94
  DEFW PicWingsComplete6bmp_Line_95
  DEFW PicWingsComplete6bmp_Line_96
  DEFW PicWingsComplete6bmp_Line_97
  DEFW PicWingsComplete6bmp_Line_98
  DEFW PicWingsComplete6bmp_Line_99
  DEFW PicWingsComplete6bmp_Line_100
  DEFW PicWingsComplete6bmp_Line_101
  DEFW PicWingsComplete6bmp_Line_102
  DEFW PicWingsComplete6bmp_Line_103
  DEFW PicWingsComplete6bmp_Line_104
  DEFW PicWingsComplete6bmp_Line_105
  DEFW PicWingsComplete6bmp_Line_106
  DEFW PicWingsComplete6bmp_Line_107
  DEFW PicWingsComplete6bmp_Line_108
  DEFW PicWingsComplete6bmp_Line_109
  DEFW PicWingsComplete6bmp_Line_110
  DEFW PicWingsComplete6bmp_Line_111
  DEFW PicWingsComplete6bmp_Line_112
  DEFW PicWingsComplete6bmp_Line_113
  DEFW PicWingsComplete6bmp_Line_114
  DEFW PicWingsComplete6bmp_Line_115
  DEFW PicWingsComplete6bmp_Line_116
  DEFW PicWingsComplete6bmp_Line_117
  DEFW PicWingsComplete6bmp_Line_118
  DEFW PicWingsComplete6bmp_Line_119
  DEFW PicWingsComplete6bmp_Line_120
  DEFW PicWingsComplete6bmp_Line_121
  DEFW PicWingsComplete6bmp_Line_122
  DEFW PicWingsComplete6bmp_Line_123
  DEFW PicWingsComplete6bmp_Line_124
  DEFW PicWingsComplete6bmp_Line_125
  DEFW PicWingsComplete6bmp_Line_126
  DEFW PicWingsComplete6bmp_Line_127
  DEFW PicWingsComplete6bmp_Line_128
  DEFW PicWingsComplete6bmp_Line_129
  DEFW PicWingsComplete6bmp_Line_128
  DEFW PicWingsComplete6bmp_Line_131
  DEFW PicWingsComplete6bmp_Line_132
  DEFW PicWingsComplete6bmp_Line_133
  DEFW PicWingsComplete6bmp_Line_134
  DEFW PicWingsComplete6bmp_Line_135
  DEFW PicWingsComplete6bmp_Line_134
  DEFW PicWingsComplete6bmp_Line_135_Reuse
  DEFW PicWingsComplete6bmp_Line_138
  DEFW PicWingsComplete6bmp_Line_139
  DEFW PicWingsComplete6bmp_Line_140
  DEFW PicWingsComplete6bmp_Line_141
  DEFW PicWingsComplete6bmp_Line_140
  DEFW PicWingsComplete6bmp_Line_141_Reuse
  DEFW PicWingsComplete6bmp_Line_140
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_131_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_151_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_153_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_155_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_157_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_159_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_161_Reuse
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_163_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_165_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_167
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_169_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_171_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_173_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_175_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_175_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_179_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_181_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_183
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_185_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_187_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicWingsComplete0bmp_Line_189
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicWingsComplete0bmp_Line_191
  DEFW EndCode
PicStage20Face1bmp_Processedpng_Processedpng:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicStage20Face1bmp_Processedpng_Processedpng_DrawOrder
JP JumpToNextLine


PicStage20Face1bmp_Processedpng_Processedpng_Line_1:
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
LD BC,&0E0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F0B
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E


  Push BC
Ld D,H
Ld E,H

call MultiPushDe15
call BitmapPush6
defw BitmapData+3221
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&080E
  Push HL
LD BC,&0F0F
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_1_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_1
PicStage20Face1bmp_Processedpng_Processedpng_Line_5:
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
Ld C,&0F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3227
call MultiPushDe14
call BitmapPush6
defw BitmapData+3233
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F0A
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0F
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_5_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_5
PicStage20Face1bmp_Processedpng_Processedpng_Line_9:
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
  PUSH DE
  Push HL 
LD HL,&0A0E
  Push HL
call MultiPushDe18
Ld C,&0A
  Push BC
LD HL,&0E0F
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3239
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&080E
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_9_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_9
PicStage20Face1bmp_Processedpng_Processedpng_Line_13:
call BitmapPush6
defw BitmapData+3245
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
Ld B,E
Ld C,H

  Push BC
Ld L,&0E
  Push HL
call MultiPushDe19
Ld C,&0B
  Push BC
LD HL,&0A0A
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


PicStage20Face1bmp_Processedpng_Processedpng_Line_17:
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
defw BitmapData+3253
LD DE,&0F0F
call MultiPushDe8
LD HL,&0F0B
  Push HL
LD BC,&0A02
  Push BC
call MultiPushDe11
LD HL,&0B0A
  Push HL
Ld C,&0E
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


PicStage20Face1bmp_Processedpng_Processedpng_Line_17_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_17
PicStage20Face1bmp_Processedpng_Processedpng_Line_21:
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
LD HL,&0E0F
  Push HL
Ld B,L
Ld C,L

  Push BC
LD HL,&0B0A
  Push HL
Ld B,&0E
  Push BC
Ld D,C
Ld E,C

call MultiPushDe9
LD HL,&0F0B
  Push HL
LD BC,&0A0E
  Push BC
call MultiPushDe10
call BitmapPush6
defw BitmapData+3259
  PUSH DE
LD HL,&0B0A
  Push HL
LD BC,&0A00
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&080E
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_21_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_21
PicStage20Face1bmp_Processedpng_Processedpng_Line_25:
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
Ld B,L


  Push BC
Ld D,L
Ld E,L

call MultiPushDe12
LD HL,&0B0A
  Push HL
Ld B,L
Ld C,E

  Push BC
call MultiPushDe10
Ld H,E
Ld L,B

  Push HL
Ld C,&0E
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


PicStage20Face1bmp_Processedpng_Processedpng_Line_25_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_25
PicStage20Face1bmp_Processedpng_Processedpng_Line_29:
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
LD HL,&0A0A
  Push HL
  PUSH DE
LD BC,&0B0A
  Push BC
Ld L,&02
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0A0E
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_29_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_29
PicStage20Face1bmp_Processedpng_Processedpng_Line_33:
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
LD BC,&E1F0
  Push BC
  PUSH DE
call FinalBitmapPush14
defw BitmapData+3273


PicStage20Face1bmp_Processedpng_Processedpng_Line_37:
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

call MultiPushDe19
LD BC,&E1F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3279
  PUSH DE
LD HL,&1A0A
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3285


PicStage20Face1bmp_Processedpng_Processedpng_Line_41:
LD HL,&3B00
  Push HL
LD BC,&0008
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3291
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3297
  PUSH DE
LD HL,&1E0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe8
LD DE,&F0F0
call MultiPushDe7
LD BC,&F078
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3303


PicStage20Face1bmp_Processedpng_Processedpng_Line_45:
DEC DE

  PUSH DE
  PUSH DE
LD HL,&FF3B
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3309
LD DE,&F0F0
call MultiPushDe7
LD BC,&1E0F
  Push BC
Ld H,C
Ld L,C

  Push HL
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3315
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F078
  Push BC
Call PushDE_0F0Fx
LD HL,&0FC3
  Push HL
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3321


PicStage20Face1bmp_Processedpng_Processedpng_Line_49:
DEC DE

call MultiPushDe5
call BitmapPush14
defw BitmapData+3335
Call PushDE_F0F0x
call BitmapPush10
defw BitmapData+3345
  PUSH DE
  PUSH DE
LD HL,&0FE1
  Push HL
  PUSH DE
LD BC,&780F
  Push BC
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  Push HL 
LD HL,&F01E
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0F78
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CEFF
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicStage20Face1bmp_Processedpng_Processedpng_Line_50:
INC DE

jp MultiPushDeLast40


PicStage20Face1bmp_Processedpng_Processedpng_Line_53:
DEC DE

call MultiPushDe7
call BitmapPush6
defw BitmapData+3351
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0FE1
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3359
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3365
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F00F
  Push BC
LD HL,&0F69
  Push HL
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD BC,&0AEE
  Push BC
Call PushDE_FFFFx
jp NextLine


PicStage20Face1bmp_Processedpng_Processedpng_Line_57:
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
Ld H,&3C
  Push HL
call MultiPushDe5
Ld C,&F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3371
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3377
call MultiPushDe6
call BitmapPush6
defw BitmapData+3383
LD DE,&FFFF
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF1B
  Push HL
LD BC,&0200
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_61:
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
defw BitmapData+3391
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3397
  PUSH DE
  PUSH DE
LD HL,&0FC3
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3409
  PUSH DE
  PUSH DE
LD BC,&F01E
  Push BC
LD HL,&0F87
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&0A
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3415


PicStage20Face1bmp_Processedpng_Processedpng_Line_65:
LD HL,&0200
  Push HL
LD BC,&0008
  Push BC
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
LD BC,&87F0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe6
LD HL,&780F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD BC,&1E0F
  Push BC
LD HL,&C3F0
  Push HL
Ld B,&78
  Push BC
Ld H,C


  Push HL
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3425
  PUSH DE
call FinalBitmapPush16
defw BitmapData+3441


PicStage20Face1bmp_Processedpng_Processedpng_Line_69:
LD HL,&0F0F
  Push HL
LD BC,&0008
  Push BC
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A0E
  Push HL
call BitmapPush10
defw BitmapData+3451
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush26
defw BitmapData+3477
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3483
  PUSH DE
LD BC,&0802
  Push BC
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3491


PicStage20Face1bmp_Processedpng_Processedpng_Line_73:
call BitmapPush6
defw BitmapData+3497
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3503
LD DE,&0000
call MultiPushDe5
LD HL,&E0F0
  Push HL
LD BC,&F00F
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
Ld H,&E1
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld B,&3C
  Push BC
LD HL,&0100
  Push HL
Ld D,L
Ld E,L

call MultiPushDe5
Ld B,&0E
  Push BC
LD HL,&0F01
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3509


PicStage20Face1bmp_Processedpng_Processedpng_Line_77:
call BitmapPush16
defw BitmapData+3525
DEC DE

  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
INC DE

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3531
  PUSH DE
call BitmapPush8
defw BitmapData+3539
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F03C
  Push BC
LD HL,&0F00
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
LD BC,&0E0F
  Push BC
LD HL,&F000
  Push HL
  PUSH DE
LD BC,&0088
  Push BC
DEC DE

  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+3545


PicStage20Face1bmp_Processedpng_Processedpng_Line_81:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

call MultiPushDe7
LD HL,&7700
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3555
  PUSH DE
  PUSH DE
LD BC,&780F
  Push BC
LD DE,&0000
call MultiPushDe7
LD HL,&C078
  Push HL
LD BC,&8FFF
  Push BC
DEC DE

call MultiPushDe5
LD HL,&0E0F
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_85:
LD HL,&0F0F
  Push HL
LD BC,&0F03
  Push BC
DEC DE

call MultiPushDe6
LD HL,&F301
  Push HL
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&00E0
  Push BC
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3565
  PUSH DE
  PUSH DE
LD HL,&1E01
  Push HL
LD DE,&0000
call MultiPushDe6
DEC DE

call MultiPushDe8
LD BC,&D13C
  Push BC
LD HL,&D2F0
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_89:
  PUSH DE
LD HL,&000E
  Push HL
LD BC,&00EE
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3571
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+3595
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&88FF
  Push HL
DEC DE

call MultiPushDe10
LD BC,&D1B0
  Push BC
LD HL,&F030
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_89_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_89
PicStage20Face1bmp_Processedpng_Processedpng_Line_93:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3609
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3623
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3629
LD DE,&0000
call MultiPushDe6
call BitmapPush6
defw BitmapData+3635
  PUSH DE
  PUSH DE
LD HL,&00EE
  Push HL
DEC DE

  PUSH DE
  PUSH DE
LD BC,&80F0
  Push BC
LD HL,&1000
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_93_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_93
PicStage20Face1bmp_Processedpng_Processedpng_Line_97:
call BitmapPush18
defw BitmapData+3653
  PUSH DE
call BitmapPush8
defw BitmapData+3661
  PUSH DE
call BitmapPush6
defw BitmapData+3667
  PUSH DE
call BitmapPush10
defw BitmapData+3677
call MultiPushDe6
call BitmapPush6
defw BitmapData+3683
jp MultiPushDeLast7


PicStage20Face1bmp_Processedpng_Processedpng_Line_97_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_97
PicStage20Face1bmp_Processedpng_Processedpng_Line_101:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+3713
call BitmapPush6
defw BitmapData+3719
  PUSH DE
call BitmapPush6
defw BitmapData+3725
LD DE,&0000
call MultiPushDe6
call BitmapPush6
defw BitmapData+3731
call MultiPushDe6
LD HL,&00F0
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_105:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&88FF
  Push HL
LD BC,&FF3B
  Push BC
  PUSH DE
call BitmapPush22
defw BitmapData+3753
  PUSH DE
call BitmapPush6
defw BitmapData+3759
  PUSH DE
  PUSH DE
LD HL,&E1F0
  Push HL
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
call BitmapPush6
defw BitmapData+3765
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+3771


PicStage20Face1bmp_Processedpng_Processedpng_Line_109:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&CCFF
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F0FC
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+3791
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&E1F0
  Push HL
LD BC,&F000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&00CC
  Push HL
Ld B,&FF
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+3797
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3805


PicStage20Face1bmp_Processedpng_Processedpng_Line_113:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
call BitmapPush6
defw BitmapData+3811
Call PushDE_F0F0x
LD BC,&3000
  Push BC
LD HL,&0008
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3817
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&00FF
  Push BC
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3825
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FFD1
  Push HL
LD BC,&1E87
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_117:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&8BFF
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush8
defw BitmapData+3833
Call PushDE_F0F0x
LD BC,&0000
  Push BC
LD HL,&000E
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3841
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&CFFF
  Push BC
Ld D,C
Ld E,C

call MultiPushDe9
LD HL,&FF91
  Push HL
LD BC,&960F
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_121:
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F00
  Push HL
LD BC,&0AFF
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&FF7F
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3847
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3853
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&010E
  Push BC
  PUSH DE
LD HL,&F0F0
  Push HL
LD BC,&F01E
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3859
LD DE,&FFFF
call MultiPushDe8
LD HL,&7700
  Push HL
LD BC,&0020
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_125:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3869
Call PushDE_0F0Fx
call BitmapPush12
defw BitmapData+3881
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0108
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+3891
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F0FC
  Push BC
LD DE,&FFFF
call MultiPushDe5
LD HL,&FF77
  Push HL
INC DE

 jp NextLinePushDe3


PicStage20Face1bmp_Processedpng_Processedpng_Line_125_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_125
PicStage20Face1bmp_Processedpng_Processedpng_Line_129:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3899
  PUSH DE
LD HL,&690F
  Push HL
call MultiPushDe13
call BitmapPush14
defw BitmapData+3913
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+3919
Call PushDE_0000x
call FinalBitmapPush6
defw BitmapData+3925


PicStage20Face1bmp_Processedpng_Processedpng_Line_133:
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3933
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0F03
  Push HL
call MultiPushDe11
call BitmapPush24
defw BitmapData+3957
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+3965


PicStage20Face1bmp_Processedpng_Processedpng_Line_137:
call BitmapPush6
defw BitmapData+3971
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3983
LD DE,&0F0F
call MultiPushDe10
call BitmapPush24
defw BitmapData+4007
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&EEFF
  Push HL
DEC DE

  PUSH DE
  PUSH DE
LD BC,&33CF
  Push BC
LD HL,&FFD3
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_141:
call BitmapPush6
defw BitmapData+4013
DEC DE

call MultiPushDe5
call BitmapPush12
defw BitmapData+4025
LD DE,&0F0F
call MultiPushDe7
call BitmapPush14
defw BitmapData+4039
LD DE,&FFFF
call MultiPushDe10
LD HL,&770E
  Push HL
LD BC,&07C0
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_145:
call BitmapPush6
defw BitmapData+4045
DEC DE

call MultiPushDe10
LD HL,&1F0F
  Push HL
Ld D,L
Ld E,L

call MultiPushDe6
call BitmapPush10
defw BitmapData+4055
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&1E07
  Push BC
LD HL,&00CC
  Push HL
LD DE,&FFFF
call MultiPushDe9
LD BC,&77E0
  Push BC
LD HL,&F0E0
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_149:
call BitmapPush8
defw BitmapData+4063
DEC DE

call MultiPushDe8
call BitmapPush6
defw BitmapData+4069
LD DE,&0F0F
call MultiPushDe5
LD HL,&0700
  Push HL
  PUSH DE
LD BC,&C3F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+4079
LD DE,&FFFF
call MultiPushDe6
LD HL,&1100
  Push HL
INC DE

 jp NextLinePushDe2


PicStage20Face1bmp_Processedpng_Processedpng_Line_153:
LD HL,&8070
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4085
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+4101
LD DE,&0F0F
call MultiPushDe6
call BitmapPush20
defw BitmapData+4121
LD DE,&FFFF
  PUSH DE
  PUSH DE
LD BC,&FF33
  Push BC
INC DE

jp MultiPushDeLast5


PicStage20Face1bmp_Processedpng_Processedpng_Line_153_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_153
PicStage20Face1bmp_Processedpng_Processedpng_Line_157:
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
defw BitmapData+4141
LD DE,&0F0F
call MultiPushDe5
call BitmapPush6
defw BitmapData+4147
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+4159
call MultiPushDe6
LD BC,&E0E0
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_157_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_157
PicStage20Face1bmp_Processedpng_Processedpng_Line_161:
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
LD BC,&C2F0
  Push BC
LD HL,&F00F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0903
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4165
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0F87
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&3000
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+4173
call MultiPushDe5
LD BC,&C070
  Push BC
LD HL,&E01E
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_161_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_161
PicStage20Face1bmp_Processedpng_Processedpng_Line_165:
LD HL,&0F03
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+4185
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0700
  Push BC
Call PushDE_0000x
call BitmapPush10
defw BitmapData+4195
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+4209
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0A02
  Push HL
LD DE,&0000
call MultiPushDe5
LD BC,&60C0
  Push BC
LD HL,&3C0F
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_165_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_165
PicStage20Face1bmp_Processedpng_Processedpng_Line_169:
call BitmapPush24
defw BitmapData+4233
  PUSH DE
LD HL,&003C
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0C00
  Push BC
  PUSH DE
LD HL,&780F
  Push HL
Ld B,&01
  Push BC
  PUSH DE
LD HL,&E1F0
  Push HL
LD BC,&F030
  Push BC
  PUSH DE
LD HL,&E003
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+4241
LD DE,&0A0A
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+4249


PicStage20Face1bmp_Processedpng_Processedpng_Line_169_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_169
PicStage20Face1bmp_Processedpng_Processedpng_Line_173:
call BitmapPush8
defw BitmapData+4257
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&F0F0
  Push HL
LD BC,&F03C
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4263
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C003
  Push HL
  PUSH DE
LD BC,&0C0F
  Push BC
LD HL,&E1F0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0002
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+4277
DEC DE

call MultiPushDe5
LD HL,&77F7
  Push HL
LD BC,&F01E
 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_177:
LD HL,&0F0F
  Push HL
LD BC,&0F88
  Push BC
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+4291
call BitmapPush8
defw BitmapData+4299
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0001
  Push HL
  PUSH DE
LD BC,&080F
  Push BC
LD HL,&E100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4305
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&FFFF
call MultiPushDe7
LD BC,&77F0
  Push BC
LD HL,&F030
  jp NextLinePushHl 


PicStage20Face1bmp_Processedpng_Processedpng_Line_181:
LD HL,&0F0F
  Push HL
LD BC,&0FCC
  Push BC
Call PushDE_FFFFx
Ld H,B
Ld L,B

  Push HL
Ld C,&CF
  Push BC
  PUSH DE
LD HL,&FFF7
  Push HL
LD BC,&F078
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&030C
  Push HL
LD BC,&0700
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD HL,&000C
  Push HL
Ld B,&30
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4311
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD HL,&0E0F
  Push HL
LD BC,&0BEE
  Push BC
LD DE,&FFFF
call MultiPushDe5
LD HL,&7700
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 


PicStage20Face1bmp_Processedpng_Processedpng_Line_185:
call BitmapPush6
defw BitmapData+4317
DEC DE

call MultiPushDe6
call BitmapPush12
defw BitmapData+4329
INC DE

call MultiPushDe5
LD HL,&0008
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0068
  Push BC
LD HL,&0700
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+4335
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4341
LD DE,&0000
jp MultiPushDeLast6


PicStage20Face1bmp_Processedpng_Processedpng_Line_189:
  PUSH DE
  PUSH DE
LD HL,&080F
  Push HL
LD BC,&0FFF
  Push BC
DEC DE

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4347
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0F0F
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4353
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush22
defw BitmapData+4375
jp MultiPushDeLast6


PicStage20Face1bmp_Processedpng_Processedpng_Line_189_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_189
PicStage20Face1bmp_Processedpng_Processedpng_Line_193:
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
defw BitmapData+4389
  PUSH DE
call BitmapPush14
defw BitmapData+4403
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4409
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4415
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face1bmp_Processedpng_Processedpng_Line_193_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_193
PicStage20Face1bmp_Processedpng_Processedpng_Line_197:
  PUSH DE
  PUSH DE
LD HL,&0C0F
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4421
LD DE,&0A0A
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+4437
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&E0F0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&F00A
  Push HL
Ld B,L
Ld C,L

  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+4443
LD DE,&0000
jp MultiPushDeLast5


PicStage20Face1bmp_Processedpng_Processedpng_Line_197_Reuse:
LD DE,&0000
JP PicStage20Face1bmp_Processedpng_Processedpng_Line_197

PicStage20Face1bmp_Processedpng_Processedpng_DrawOrder: 

  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_1
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_1_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_5
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_5_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_9
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_9_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_13
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_13
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_17
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_17_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_21
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_21_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_25
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_25_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_29
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_29_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_33
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_33
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_37
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_37
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_41
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_41
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_45
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_45
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_49
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_49
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_53
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_53
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_57
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_57
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_61
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_61
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_65
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_65
  DEFW PicWingsComplete0bmp_Line_0
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_69
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_69
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_73
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_73
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_77
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_77
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_81
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_81
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_85
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_85
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_89
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_89_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_93
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_93_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_97
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_97_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_101
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_101
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_105
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_105
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_109
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_109
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_113
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_113
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_117
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_117
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_121
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_121
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_125
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_125_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_129
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_129
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_133
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_133
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_137
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_137
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_141
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_141
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_145
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_145
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_149
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_149
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_153
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_153_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_157
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_157_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_161
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_161_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_165
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_165_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_169
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_169_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_173
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_173
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_177
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_177
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_181
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_181
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_50
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_185
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_185
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_189
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_189_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_193
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_193_Reuse
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_197
  DEFW PicWingsComplete0bmp_Line_46_Reuse
  DEFW PicStage20Face1bmp_Processedpng_Processedpng_Line_197_Reuse
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
MultiPushDe36: pop HL
jp MultiPushDe36B 
MultiPushDe34: pop HL
jp MultiPushDe34B 
MultiPushDe31: pop HL
jp MultiPushDe31B 
MultiPushDe30: pop HL
jp MultiPushDe30B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe24: pop HL
jr MultiPushDe24B 
MultiPushDe22: pop HL
jr MultiPushDe22B 
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDeLast15: ld HL,NextLine
jr MultiPushDe15B 
MultiPushDe15: pop HL
jr MultiPushDe15B 
MultiPushDeLast14: ld HL,NextLine
jr MultiPushDe14B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDeLast13: ld HL,NextLine
jr MultiPushDe13B 
MultiPushDe13: pop HL
jr MultiPushDe13B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDeLast11: ld HL,NextLine
jr MultiPushDe11B 
MultiPushDe11: pop HL
jr MultiPushDe11B 
MultiPushDeLast10: ld HL,NextLine
jr MultiPushDe10B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDeLast9: ld HL,NextLine
jr MultiPushDe9B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDeLast8: ld HL,NextLine
jr MultiPushDe8B 
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

finalBitmapPush16: ld b,&08
jr finalBitmapPush

finalBitmapPush14: ld b,&07
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

defb &10,&50,&50,&50,&50,&00,&00,&50,&50,&50
defb &50,&40,&00,&10,&50,&40,&00,&50,&40,&00
defb &50,&50,&40,&00,&10,&50,&50,&40,&00,&50
defb &40,&00,&50,&50,&50,&00,&50,&00,&00,&00
defb &00,&10,&50,&00,&00,&00,&10,&50,&50,&40
defb &10,&50,&00,&00,&00,&10,&50,&40,&10,&50
defb &50,&40,&00,&50,&50,&50,&50,&00,&50,&40
defb &00,&00,&10,&50,&00,&10,&50,&40,&00,&10
defb &00,&50,&50,&00,&00,&50,&40,&00,&10,&50
defb &50,&00,&00,&50,&40,&00,&10,&40,&00,&10
defb &50,&50,&00,&10,&50,&40,&50,&50,&40,&10
defb &50,&50,&40,&00,&50,&00,&50,&50,&40,&00
defb &00,&44,&00,&88,&44,&00,&00,&88,&44,&00
defb &88,&00,&00,&22,&00,&88,&44,&00,&00,&22
defb &00,&88,&88,&00,&00,&11,&00,&88,&88,&00
defb &44,&11,&00,&99,&00,&22,&00,&11,&00,&22
defb &44,&22,&00,&88,&22,&00,&88,&99,&00,&44
defb &88,&22,&44,&44,&11,&00,&11,&88,&88,&AA
defb &11,&88,&00,&22,&00,&44,&22,&00,&66,&11
defb &44,&44,&66,&00,&00,&11,&00,&44,&22,&00
defb &00,&44,&11,&00,&99,&00,&22,&00,&00,&CC
defb &55,&AA,&33,&00,&66,&00,&11,&88,&33,&11
defb &66,&88,&CC,&00,&11,&00,&22,&44,&22,&00
defb &88,&00,&11,&00,&88,&22,&00,&11,&00,&44
defb &44,&00,&00,&22,&00,&88,&99,&00,&44,&33
defb &00,&77,&55,&88,&EE,&11,&88,&00,&00,&66
defb &11,&CC,&66,&BB,&88,&33,&00,&88,&22,&44
defb &44,&11,&88,&44,&44,&00,&00,&11,&88,&88
defb &AA,&11,&88,&00,&CC,&33,&99,&BB,&CC,&66
defb &00,&11,&88,&FF,&66,&77,&00,&CC,&00,&66
defb &11,&44,&44,&66,&CC,&55,&AA,&33,&00,&66
defb &33,&11,&CC,&33,&99,&88,&22,&00,&88,&44
defb &88,&11,&66,&77,&00,&EE,&33,&11,&88,&33
defb &11,&66,&88,&CC,&00,&22,&00,&44,&88,&44
defb &11,&00,&00,&44,&11,&00,&44,&44,&88,&22
defb &33,&00,&77,&55,&88,&EE,&11,&88,&00,&CC
defb &99,&88,&66,&44,&CC,&00,&66,&11,&CC,&66
defb &BB,&88,&33,&11,&00,&44,&88,&88,&22,&00
defb &88,&00,&00,&FF,&FF,&FF,&EE,&00,&00,&88
defb &00,&CC,&44,&55,&00,&CC,&00,&44,&33,&99
defb &BB,&CC,&66,&00,&11,&88,&FF,&66,&77,&00
defb &88,&00,&CC,&22,&88,&88,&CC,&00,&44,&00
defb &11,&FF,&FF,&FF,&CC,&00,&11,&00,&00,&66
defb &22,&DD,&11,&88,&33,&33,&11,&CC,&33,&99
defb &88,&00,&00,&77,&77,&66,&FF,&DD,&BB,&BB
defb &88,&00,&00,&66,&77,&00,&EE,&33,&33,&00
defb &66,&22,&DD,&11,&88,&00,&22,&00,&33,&11
defb &88,&33,&AA,&CC,&77,&00,&CC,&00,&CC,&99
defb &88,&00,&00,&11,&BB,&FF,&66,&EE,&00,&66
defb &44,&CC,&00,&CC,&33,&88,&DD,&77,&00,&66
defb &33,&00,&00,&33,&FF,&FF,&FF,&DD,&DD,&BB
defb &FF,&66,&00,&33,&DD,&88,&DD,&FF,&BB,&88
defb &33,&CC,&66,&00,&66,&11,&CC,&DD,&EE,&33
defb &FF,&00,&77,&77,&EE,&CC,&66,&FF,&00,&00
defb &00,&33,&11,&EE,&CC,&EE,&FF,&77,&66,&FF
defb &DD,&EE,&00,&BB,&55,&99,&BB,&CC,&FF,&88
defb &EE,&00,&11,&88,&EE,&11,&CC,&CC,&CC,&EE
defb &11,&CC,&66,&00,&11,&CC,&77,&CC,&FF,&66
defb &66,&BB,&44,&11,&EE,&FF,&DD,&BB,&BB,&CC
defb &77,&33,&66,&55,&DD,&33,&33,&FF,&88,&00
defb &66,&EE,&FF,&66,&EE,&FF,&00,&11,&CC,&00
defb &00,&66,&44,&CC,&CC,&99,&88,&00,&00,&EE
defb &00,&77,&FF,&33,&22,&EE,&99,&BB,&33,&88
defb &00,&33,&DD,&DD,&BB,&DD,&DD,&88,&11,&EE
defb &00,&DD,&EE,&EE,&00,&33,&CC,&00,&33,&66
defb &33,&EE,&77,&66,&AA,&FF,&CC,&33,&FF,&88
defb &77,&FF,&00,&FF,&DD,&55,&BB,&99,&FF,&11
defb &BB,&00,&00,&FF,&00,&11,&DD,&EE,&CC,&11
defb &EE,&00,&77,&66,&DD,&11,&FF,&00,&33,&FF
defb &88,&00,&00,&77,&00,&00,&00,&33,&BB,&BB
defb &77,&DD,&88,&11,&66,&55,&AA,&00,&00,&77
defb &FF,&00,&33,&EE,&22,&DD,&BB,&AA,&EE,&22
defb &EE,&00,&11,&66,&99,&AA,&00,&66,&FF,&BB
defb &77,&77,&33,&66,&66,&88,&77,&CC,&00,&11
defb &FF,&88,&11,&EE,&00,&00,&11,&FF,&BB,&77
defb &77,&00,&00,&33,&EE,&66,&77,&00,&33,&BB
defb &BB,&77,&EE,&00,&00,&11,&EE,&00,&FF,&88
defb &55,&99,&BB,&33,&11,&33,&11,&00,&33,&99
defb &99,&FF,&33,&AA,&BB,&44,&11,&FF,&00,&00
defb &11,&FF,&88,&00,&33,&EE,&00,&00,&DD,&FF
defb &11,&EE,&00,&99,&88,&55,&DD,&33,&BB,&88
defb &77,&00,&77,&77,&22,&EE,&88,&66,&44,&11
defb &EE,&33,&EE,&CC,&00,&11,&FF,&00,&50,&40
defb &00,&77,&EE,&00,&00,&33,&EE,&00,&BB,&55
defb &33,&AA,&DD,&AA,&00,&77,&88,&00,&EE,&22
defb &DD,&00,&66,&FF,&88,&00,&EE,&77,&88,&00
defb &00,&77,&99,&CC,&00,&77,&DD,&88,&22,&DD
defb &11,&FF,&88,&66,&33,&33,&BB,&88,&77,&00
defb &77,&77,&33,&11,&88,&77,&77,&88,&00,&00
defb &00,&77,&88,&11,&66,&DD,&22,&FF,&CC,&66
defb &33,&33,&88,&FF,&44,&77,&BB,&11,&DD,&88
defb &33,&BB,&11,&BB,&11,&AA,&AA,&DD,&10,&11
defb &EE,&50,&50,&40,&00,&00,&77,&00,&66,&EE
defb &33,&77,&88,&BB,&CC,&77,&33,&11,&88,&FF
defb &DD,&00,&44,&88,&44,&00,&00,&88,&44,&88
defb &50,&40,&00,&00,&10,&50,&11,&EE,&10,&22
defb &DD,&55,&66,&66,&88,&00,&33,&00,&22,&66
defb &FF,&11,&CC,&11,&DD,&EE,&11,&77,&AA,&00
defb &11,&77,&AA,&11,&EE,&EE,&00,&EE,&33,&DD
defb &99,&00,&CC,&33,&BB,&99,&DD,&CC,&66,&00
defb &EE,&EE,&77,&77,&00,&CC,&33,&00,&00,&55
defb &99,&BB,&55,&33,&44,&50,&00,&CC,&50,&40
defb &00,&00,&EE,&40,&CC,&CC,&11,&FF,&AA,&CC
defb &DD,&00,&22,&CC,&DD,&77,&EE,&00,&CC,&CC
defb &11,&EE,&CC,&FF,&44,&33,&BB,&88,&EE,&CC
defb &51,&DD,&50,&40,&00,&00,&10,&00,&CC,&50
defb &40,&BB,&22,&BB,&66,&77,&66,&66,&EE,&40
defb &DD,&CC,&77,&77,&40,&BB,&CC,&DD,&22,&88
defb &55,&77,&88,&33,&77,&AA,&11,&EE,&CC,&FF
defb &66,&33,&DD,&88,&66,&EE,&11,&DD,&99,&DD
defb &88,&DD,&33,&00,&AA,&00,&00,&33,&11,&44
defb &33,&22,&CC,&66,&EE,&66,&EE,&11,&DD,&88
defb &66,&FF,&11,&BB,&CC,&DD,&EE,&11,&77,&BB
defb &00,&77,&AA,&88,&55,&00,&77,&00,&00,&77
defb &51,&EE,&CC,&77,&66,&33,&DD,&DC,&77,&66
defb &40,&DD,&99,&DD,&88,&DD,&11,&88,&55,&10
defb &50,&00,&CC,&40,&00,&00,&66,&22,&DC,&66
defb &EE,&66,&CC,&51,&BB,&88,&EE,&FF,&51,&BB
defb &88,&DD,&EE,&33,&88,&00,&33,&99,&AA,&88
defb &55,&00,&22,&88,&55,&66,&50,&40,&00,&00
defb &00,&CC,&DD,&00,&22,&CC,&DD,&11,&66,&00
defb &FF,&BB,&00,&FF,&66,&77,&AA,&11,&DD,&CC
defb &77,&66,&00,&DD,&99,&DD,&88,&DD,&99,&88
defb &22,&88,&55,&00,&66,&66,&CC,&66,&EE,&66
defb &CC,&11,&BB,&88,&EE,&EE,&11,&77,&99,&BB
defb &CC,&33,&77,&CC,&11,&AA,&22,&CC,&AA,&00
defb &11,&77,&AA,&33,&DD,&40,&77,&BB,&40,&FF
defb &66,&77,&BB,&51,&EE,&DC,&33,&BB,&40,&DD
defb &DD,&DD,&88,&DD,&88,&DC,&11,&44,&CC,&50
defb &50,&40,&AA,&40,&CC,&66,&DC,&66,&EE,&EE
defb &DC,&33,&77,&00,&DD,&EE,&33,&77,&99,&BB
defb &DC,&33,&77,&98,&22,&FF,&11,&77,&44,&00
defb &00,&88,&44,&44,&33,&00,&33,&BB,&00,&FF
defb &77,&33,&BB,&00,&EE,&CC,&33,&BB,&00,&EE
defb &CC,&DD,&88,&55,&88,&CC,&00,&AA,&00,&11
defb &44,&00,&CC,&66,&88,&66,&CC,&DD,&CC,&33
defb &77,&00,&DD,&CC,&33,&77,&33,&BB,&CC,&33
defb &77,&00,&33,&00,&88,&88,&BB,&50,&33,&DD
defb &88,&77,&BB,&33,&DD,&00,&FF,&66,&33,&BB
defb &00,&EE,&CC,&66,&DC,&66,&88,&66,&40,&55
defb &10,&50,&50,&00,&CC,&00,&DC,&33,&77,&51
defb &BB,&DC,&22,&FF,&33,&77,&98,&66,&FF,&50
defb &33,&77,&99,&77,&98,&00,&00,&77,&AA,&77
defb &50,&40,&00,&CC,&10,&50,&50,&22,&98,&51
defb &98,&55,&88,&22,&00,&33,&88,&00,&22,&77
defb &BB,&00,&33,&DD,&88,&77,&BB,&11,&DD,&88
defb &FF,&66,&11,&DD,&88,&66,&88,&66,&EE,&11
defb &BB,&CC,&66,&EE,&33,&77,&88,&66,&FF,&00
defb &33,&77,&99,&00,&00,&77,&00,&11,&00,&55
defb &DD,&98,&33,&DD,&98,&77,&BB,&11,&DD,&88
defb &77,&66,&51,&DD,&98,&66,&CC,&66,&DC,&66
defb &DC,&33,&50,&00,&CC,&50,&50,&40,&00,&00
defb &98,&66,&EE,&11,&BB,&88,&66,&EE,&33,&77
defb &98,&66,&FF,&50,&66,&FF,&33,&BB,&50,&00
defb &00,&33,&77,&33,&50,&40,&00,&00,&10,&50
defb &40,&CC,&50,&33,&40,&DD,&00,&33,&DD,&33
defb &DD,&88,&33,&DD,&88,&33,&DD,&88,&DD,&CC
defb &77,&77,&11,&DD,&88,&66,&CC,&66,&CC,&22
defb &CC,&11,&88,&DD,&88,&66,&EE,&33,&BB,&88
defb &EE,&CC,&66,&FF,&00,&66,&FF,&00,&66,&FF
defb &22,&FF,&DD,&98,&11,&DD,&98,&33,&DD,&88
defb &EE,&DC,&77,&BB,&40,&EE,&98,&33,&44,&66
defb &DC,&22,&DC,&51,&98,&50,&11,&10,&50,&40
defb &00,&00,&88,&BB,&00,&55,&CC,&33,&77,&88
defb &DD,&DC,&66,&FF,&00,&66,&EE,&50,&66,&EE
defb &22,&EE,&50,&00,&00,&11,&DD,&11,&50,&40
defb &00,&00,&10,&50,&22,&10,&50,&66,&DD,&99
defb &DD,&88,&11,&EE,&CC,&11,&DD,&88,&EE,&CC
defb &33,&BB,&00,&EE,&CC,&33,&66,&77,&44,&33
defb &44,&00,&88,&00,&00,&88,&99,&BB,&00,&DD
defb &CC,&33,&77,&00,&DD,&CC,&66,&EE,&00,&DD
defb &EE,&00,&66,&EE,&66,&CC,&EE,&DC,&51,&EE
defb &DC,&11,&DD,&88,&EE,&EE,&33,&BB,&00,&EE
defb &DC,&33,&66,&11,&54,&33,&54,&40,&DC,&50
defb &40,&44,&50,&40,&00,&00,&40,&BB,&40,&AA
defb &11,&BB,&40,&DD,&DC,&33,&77,&51,&DD,&CC
defb &66,&EE,&00,&DD,&EE,&40,&DD,&EE,&66,&DC
defb &50,&00,&00,&40,&DD,&99,&50,&40,&00,&00
defb &10,&40,&98,&50,&40,&DC,&EE,&88,&EE,&CC
defb &00,&EE,&CC,&11,&EE,&CC,&66,&EE,&11,&DD
defb &88,&66,&CC,&33,&66,&11,&44,&33,&00,&88
defb &00,&BB,&00,&AA,&11,&BB,&00,&DD,&88,&66
defb &EE,&11,&DD,&88,&DD,&EE,&00,&DD,&CC,&00
defb &DD,&CC,&55,&CC,&EE,&CC,&40,&EE,&CC,&00
defb &EE,&DC,&77,&66,&51,&DD,&98,&77,&44,&33
defb &66,&11,&54,&33,&54,&50,&44,&50,&50,&11
defb &50,&40,&00,&00,&40,&BB,&40,&AA,&11,&BB
defb &40,&BB,&98,&66,&EE,&51,&BB,&88,&DD,&CC
defb &00,&DD,&DC,&40,&DD,&CC,&55,&98,&50,&00
defb &00,&40,&66,&88,&50,&40,&00,&00,&10,&22
defb &66,&CC,&FF,&66,&00,&FF,&66,&00,&EE,&CC
defb &77,&66,&11,&DD,&88,&77,&66,&11,&AA,&11
defb &44,&33,&44,&00,&22,&00,&11,&00,&00,&BB
defb &00,&AA,&11,&66,&11,&BB,&88,&66,&EE,&11
defb &BB,&88,&DD,&CC,&11,&BB,&CC,&11,&BB,&CC
defb &DD,&88,&50,&00,&00,&50,&22,&CC,&77,&66
defb &40,&FF,&66,&00,&FF,&66,&33,&66,&51,&DD
defb &98,&33,&66,&51,&AA,&11,&54,&11,&54,&50
defb &22,&50,&11,&66,&51,&BB,&10,&66,&EE,&51
defb &BB,&11,&BB,&CC,&11,&BB,&DC,&51,&BB,&88
defb &DD,&10,&50,&40,&00,&00,&10,&50,&50,&50
defb &11,&50,&33,&44,&77,&66,&00,&77,&66,&00
defb &77,&66,&33,&66,&00,&DD,&88,&33,&66,&11
defb &AA,&11,&44,&11,&44,&00,&11,&00,&11,&66
defb &11,&BB,&00,&66,&CC,&11,&BB,&11,&BB,&88
defb &11,&BB,&88,&11,&BB,&88,&BB,&00,&50,&00
defb &00,&50,&11,&54,&77,&66,&50,&77,&66,&00
defb &77,&66,&33,&77,&40,&DD,&98,&33,&AA,&51
defb &BB,&00,&DC,&51,&DC,&50,&51,&10,&22,&50
defb &40,&EE,&40,&CC,&33,&66,&51,&77,&40,&66
defb &DC,&33,&BB,&51,&BB,&88,&11,&BB,&98,&51
defb &BB,&88,&AA,&50,&00,&CC,&77,&66,&00,&77
defb &BB,&00,&77,&66,&33,&BB,&00,&EE,&CC,&11
defb &AA,&00,&DD,&00,&CC,&11,&CC,&00,&00,&88
defb &44,&00,&00,&EE,&00,&CC,&22,&CC,&11,&66
defb &00,&DD,&CC,&33,&77,&11,&BB,&88,&33,&77
defb &88,&11,&BB,&88,&CC,&00,&50,&00,&00,&50
defb &40,&DC,&33,&BB,&50,&33,&BB,&00,&77,&AA
defb &33,&BB,&40,&EE,&DC,&51,&AA,&40,&DD,&00
defb &DC,&40,&DC,&50,&40,&98,&22,&CC,&51,&66
defb &40,&DD,&DC,&33,&77,&11,&77,&88,&33,&77
defb &10,&33,&77,&00,&DC,&50,&50,&40,&00,&00
defb &10,&50,&50,&50,&54,&50,&00,&44,&33,&BB
defb &00,&33,&BB,&00,&33,&BB,&11,&BB,&00,&66
defb &CC,&11,&AA,&00,&DD,&00,&22,&CC,&11,&66
defb &00,&DD,&88,&33,&66,&33,&77,&00,&33,&77
defb &00,&33,&77,&00,&88,&00,&98,&50,&50,&00
defb &00,&50,&50,&44,&33,&BB,&10,&33,&DD,&88
defb &33,&BB,&51,&BB,&50,&66,&DC,&51,&AA,&40
defb &DD,&00,&DC,&40,&DC,&50,&40,&DC,&40,&CC
defb &22,&CC,&51,&66,&40,&DD,&98,&33,&66,&33
defb &77,&00,&66,&FF,&50,&33,&77,&40,&00,&22
defb &33,&BB,&88,&11,&DD,&88,&33,&BB,&00,&BB
defb &00,&66,&22,&88,&11,&44,&00,&DD,&88,&33
defb &44,&33,&77,&00,&66,&EE,&00,&77,&77,&11
defb &50,&00,&00,&50,&50,&22,&11,&BB,&98,&51
defb &DD,&88,&33,&DD,&88,&DD,&50,&22,&DC,&40
defb &AA,&50,&55,&00,&54,&40,&54,&50,&40,&98
defb &40,&88,&22,&88,&51,&54,&40,&DD,&10,&22
defb &DC,&66,&FF,&00,&66,&EE,&50,&77,&66,&51
defb &00,&22,&11,&BB,&88,&11,&DD,&88,&11,&DD
defb &88,&DD,&00,&33,&22,&88,&11,&44,&00,&BB
defb &00,&22,&CC,&66,&EE,&00,&66,&EE,&00,&77
defb &66,&11,&50,&66,&EE,&51,&50,&50,&50,&00
defb &00,&50,&50,&22,&51,&DD,&98,&51,&DD,&88
defb &11,&DD,&88,&DD,&50,&33,&54,&40,&AA,&50
defb &55,&00,&40,&98,&40,&88,&22,&88,&51,&54
defb &40,&BB,&50,&22,&DC,&66,&EE,&00,&66,&EE
defb &00,&DD,&88,&00,&EE,&CC,&11,&DD,&88,&DD
defb &00,&33,&33,&00,&11,&44,&00,&BB,&00,&22
defb &CC,&66,&EE,&00,&DD,&CC,&00,&66,&CC,&00
defb &50,&66,&DC,&50,&50,&50,&50,&00,&00,&50
defb &50,&50,&40,&DD,&98,&40,&EE,&CC,&00,&DD
defb &88,&DD,&50,&33,&54,&40,&AA,&50,&33,&00
defb &40,&98,&40,&88,&33,&00,&51,&54,&40,&BB
defb &50,&22,&DC,&66,&CC,&00,&DD,&DC,&00,&DD
defb &88,&00,&EE,&CC,&00,&DD,&88,&55,&00,&33
defb &44,&00,&AA,&00,&33,&00,&44,&00,&00,&88
defb &33,&00,&11,&44,&00,&BB,&00,&22,&88,&66
defb &CC,&00,&DD,&CC,&00,&66,&CC,&00,&40,&DD
defb &98,&40,&EE,&EE,&00,&DD,&98,&55,&50,&33
defb &54,&40,&AA,&50,&33,&00,&54,&50,&40,&88
defb &33,&00,&51,&54,&40,&BB,&50,&22,&98,&66
defb &CC,&11,&DD,&DC,&50,&66,&DC,&50,&00,&DD
defb &88,&00,&66,&EE,&00,&DD,&88,&55,&00,&33
defb &88,&00,&CC,&00,&22,&00,&44,&00,&00,&88
defb &11,&00,&00,&CC,&00,&77,&00,&22,&88,&66
defb &CC,&11,&DD,&88,&00,&66,&CC,&00,&40,&DD
defb &98,&50,&66,&EE,&00,&EE,&98,&66,&50,&33
defb &98,&40,&DC,&50,&22,&00,&54,&50,&40,&88
defb &11,&00,&40,&DC,&50,&77,&50,&11,&98,&55
defb &CC,&11,&DD,&98,&50,&66,&DC,&50,&00,&DD
defb &88,&00,&66,&EE,&00,&EE,&88,&66,&00,&11
defb &88,&00,&CC,&00,&22,&00,&11,&00,&00,&CC
defb &00,&66,&00,&11,&88,&55,&CC,&11,&DD,&88
defb &00,&66,&CC,&00,&40,&55,&98,&50,&33,&66
defb &00,&EE,&98,&66,&50,&51,&98,&40,&EE,&50
defb &22,&00,&50,&40,&11,&00,&51,&DC,&50,&66
defb &50,&51,&98,&55,&CC,&11,&BB,&10,&50,&66
defb &98,&50,&00,&55,&88,&00,&33,&66,&00,&66
defb &88,&66,&00,&11,&88,&00,&EE,&00,&22,&00
defb &11,&00,&11,&CC,&00,&66,&00,&11,&88,&55
defb &88,&11,&BB,&00,&00,&66,&88,&00,&50,&55
defb &98,&50,&33,&66,&00,&66,&98,&66,&50,&51
defb &98,&40,&66,&50,&00,&00,&50,&40,&00,&00
defb &51,&98,&50,&66,&50,&51,&98,&55,&88,&11
defb &BB,&50,&50,&66,&98,&50,&00,&55,&88,&00
defb &33,&66,&00,&66,&88,&66,&00,&11,&88,&00
defb &66,&00,&11,&88,&00,&66,&00,&11,&88,&55
defb &88,&11,&BB,&00,&00,&66,&88,&00,&50,&55
defb &10,&50,&33,&66,&50,&66,&98,&66,&50,&51
defb &98,&50,&44,&50,&00,&00,&50,&40,&00,&00
defb &40,&98,&50,&66,&50,&51,&98,&55,&98,&51
defb &BB,&50,&50,&22,&98,&50,&33,&66,&00,&77
defb &00,&66,&00,&11,&88,&00,&44,&00,&00,&88
defb &00,&66,&00,&11,&88,&33,&88,&11,&BB,&00
defb &00,&22,&88,&00,&33,&66,&50,&77,&50,&66
defb &50,&51,&98,&50,&54,&50,&40,&98,&50,&66
defb &50,&51,&98,&33,&98,&51,&BB,&50,&50,&22
defb &98,&50,&11,&66,&00,&77,&00,&66,&00,&11
defb &88,&00,&44,&00,&00,&88,&00,&66,&00,&11
defb &88,&33,&88,&11,&AA,&00,&00,&22,&88,&00
defb &11,&66,&50,&77,&50,&44,&50,&51,&10,&40
defb &44,&10,&40,&98,&50,&22,&50,&40,&98,&33
defb &98,&51,&AA,&10,&50,&11,&98,&50,&11,&66
defb &00,&66,&00,&44,&00,&11,&AA,&00,&00,&11
defb &88,&00,&00,&88,&00,&22,&00,&00,&11,&66
defb &50,&66,&50,&54,&50,&51,&50,&40,&00,&10
defb &AA,&10,&50,&51,&98,&50,&40,&00,&10,&22
defb &50,&40,&11,&CC,&00,&66,&00,&44,&00,&11
defb &88,&11,&88,&00,&EE,&00,&00,&11,&88,&00
defb &11,&CC,&50,&66,&50,&54,&50,&51,&50,&40
defb &00,&10,&40,&00,&10,&22,&50,&40,&98,&51
defb &98,&40,&EE,&10,&50,&51,&98,&50,&00,&50
defb &50,&50,&50,&66,&50,&50,&11,&CC,&50,&66
defb &50,&54,&98,&51,&98,&40,&EE,&10,&50,&51
defb &98,&50,&50,&50,&50,&00,&11,&88,&00,&66
defb &00,&44,&88,&11,&88,&00,&66,&00,&11,&88
defb &50,&44,&50,&54,&40,&00,&10,&50,&50,&40
defb &98,&40,&98,&50,&66,&10,&50,&40,&98,&50
defb &50,&40,&98,&50,&66,&10,&50,&40,&98,&50
defb &50,&40,&10,&50,&22,&10,&02,&0A,&0A,&0A
defb &0B,&0F,&0F,&0E,&0A,&0A,&0A,&0F,&0F,&0A
defb &0A,&0A,&0B,&0F,&00,&02,&0A,&0A,&0B,&0F
defb &08,&00,&00,&02,&0A,&0B,&0E,&0A,&0B,&0F
defb &0F,&0F,&0F,&0E,&0F,&0E,&0A,&0A,&0B,&0F
defb &0F,&0A,&08,&00,&00,&00,&02,&0A,&0A,&0B
defb &0F,&0E,&0A,&0B,&F0,&0F,&3C,&F0,&0F,&F0
defb &8F,&0E,&08,&00,&00,&02,&F0,&87,&0F,&0F
defb &0F,&0E,&87,&0F,&0F,&0F,&0F,&F0,&FF,&EE
defb &08,&00,&00,&02,&F0,&0F,&0F,&0F,&0E,&0A
defb &C3,&0F,&3C,&F0,&F0,&87,&FF,&FF,&FF,&CC
defb &00,&0A,&C3,&0F,&0F,&0F,&69,&0F,&3C,&F0
defb &F0,&87,&0F,&0F,&0F,&3F,&87,&0F,&0F,&78
defb &E1,&0F,&0F,&0F,&0F,&F0,&0F,&E1,&0F,&0F
defb &0F,&7F,&E1,&3C,&F0,&0F,&0F,&0F,&3C,&F0
defb &87,&0F,&0F,&0F,&0F,&3C,&F0,&0F,&0F,&0F
defb &78,&F0,&87,&0F,&0F,&0F,&0F,&1E,&FF,&0A
defb &0A,&0A,&1A,&F0,&F0,&F0,&87,&0F,&0F,&0F
defb &0F,&0E,&0F,&1E,&F0,&F0,&F0,&87,&F0,&0F
defb &0F,&0F,&3C,&F0,&F0,&E1,&0F,&0F,&1E,&F0
defb &00,&00,&02,&00,&02,&0A,&87,&0F,&0E,&00
defb &00,&00,&01,&0F,&0F,&3C,&70,&80,&00,&00
defb &00,&0A,&0A,&08,&00,&00,&02,&0A,&0A,&0A
defb &0A,&0F,&10,&F0,&F0,&F0,&1E,&F0,&F0,&0F
defb &0F,&0F,&00,&03,&0F,&0F,&F0,&F0,&F0,&E1
defb &0F,&1E,&F0,&87,&0F,&78,&F0,&F0,&87,&0F
defb &0F,&0F,&1E,&F0,&F0,&F0,&F0,&C0,&10,&E1
defb &0F,&0F,&0E,&00,&F0,&C0,&70,&F0,&E0,&0A
defb &08,&00,&0A,&10,&87,&0F,&0F,&0F,&77,&FF
defb &FE,&F0,&F0,&C3,&07,&78,&F0,&F0,&C0,&88
defb &FF,&CF,&0F,&3C,&C2,&0A,&1B,&FF,&FF,&FF
defb &FF,&EE,&61,&0F,&0F,&0F,&30,&F0,&F0,&F0
defb &C0,&00,&E1,&0F,&0F,&0F,&0F,&3C,&F0,&C0
defb &0F,&0F,&0F,&1E,&33,&FF,&87,&0F,&0F,&0F
defb &3C,&F0,&00,&00,&00,&F0,&C3,&0F,&0F,&78
defb &F0,&00,&00,&00,&70,&F0,&01,&E1,&0F,&3C
defb &1F,&FF,&00,&07,&1E,&F0,&F0,&C3,&0F,&0F
defb &1E,&F0,&80,&00,&00,&30,&F0,&F0,&F0,&C0
defb &30,&F0,&F0,&F0,&F0,&EE,&01,&69,&0F,&3C
defb &F0,&C3,&0F,&0F,&0F,&0A,&0A,&0A,&0A,&08
defb &00,&70,&F0,&C3,&E0,&00,&00,&30,&3C,&F0
defb &F0,&D1,&FF,&FF,&00,&30,&F0,&F0,&F0,&C3
defb &00,&30,&F0,&E1,&0C,&00,&03,&3C,&0F,&3C
defb &F0,&F0,&0F,&0F,&0F,&0E,&0A,&0A,&0F,&08
defb &00,&03,&0F,&0F,&C3,&0F,&0F,&C0,&33,&FF
defb &FF,&EE,&00,&C3,&0F,&1E,&C0,&00,&00,&30
defb &F0,&F0,&F0,&C3,&0F,&0F,&0F,&0E,&00,&10
defb &F0,&F0,&0F,&00,&0F,&1E,&C0,&00,&00,&00
defb &C3,&0F,&1E,&C0,&00,&33,&FF,&FF,&FF,&CC
defb &07,&1E,&87,&1E,&F0,&F0,&C3,&0F,&0F,&0E
defb &0A,&0B,&44,&0F,&0F,&0E,&00,&00,&00,&C3
defb &00,&30,&F0,&F0,&87,&0F,&00,&10,&F0,&F0
defb &0F,&08,&C0,&00,&00,&00,&C3,&0F,&1E,&C0
defb &00,&00,&77,&FF,&FF,&FF,&FF,&CF,&C3,&1E
defb &F0,&F0,&F0,&0F,&0F,&0E,&00,&00,&00,&E1
defb &F0,&F0,&1E,&87,&0C,&00,&87,&78,&F0,&FF
defb &88,&00,&0F,&0E,&00,&00,&00,&F0,&F0,&F0
defb &E0,&00,&00,&10,&F0,&F0,&F0,&80,&00,&00
defb &00,&77,&78,&F0,&C3,&C3,&0E,&00,&F0,&69
defb &E0,&FF,&FF,&FF,&FF,&EE,&F0,&00,&00,&00
defb &00,&17,&00,&07,&0F,&F0,&F0,&E1,&FF,&00
defb &00,&00,&78,&F0,&F1,&FF,&C0,&00,&00,&00
defb &07,&0F,&0F,&3F,&0F,&3C,&F0,&F0,&E1,&0F
defb &0F,&01,&F0,&C0,&00,&00,&00,&03,&0F,&0C
defb &00,&00,&10,&F0,&FF,&EF,&78,&F0,&C3,&0F
defb &0F,&C3,&F0,&0F,&0F,&0F,&0E,&0A,&0A,&08
defb &0C,&00,&00,&00,&00,&30,&F0,&80,&00,&00
defb &01,&0F,&0F,&F0,&F0,&87,&C3,&0F,&F0,&F0
defb &F0,&E1,&0F,&0E,&0A,&0A,&0A,&08,&11,&EE
defb &87,&3C,&F0,&87,&78,&0F,&1E,&F0,&F0,&E1
defb &0F,&0C,&00,&0F,&00,&02,&0A,&78,&F0,&87
defb &30,&C0,&00,&20,&88,&00,&0E,&0A,&0A,&0A
defb &3B,&FF,&FF,&EE,&00,&02,&0A,&38,&F0,&87
defb &1E,&F0,&F0,&F0,&0F,&F0,&F0,&D2,&E1,&3C
defb &87,&1E,&F0,&F0,&0F,&00,&03,&0F,&E1,&0F
defb &78,&91,&FF,&FF,&FF,&00,&FF,&EE,&07,&0F
defb &0F,&0F,&0E,&00,&07,&0F,&0F,&0F,&0F,&1E
defb &F0,&0A,&1B,&FF,&00,&02,&0A,&1A,&F0,&C0
defb &25,&0F,&78,&F7,&FF,&FF,&FC,&F0,&E1,&0F
defb &F0,&0F,&78,&F0,&0F,&00,&07,&0F,&FF,&CC
defb &07,&0F,&0F,&78,&7F,&0F,&0F,&0E,&00,&00
defb &00,&01,&0F,&0F,&7F,&FF,&FC,&F0,&F0,&F0
defb &F0,&3C,&96,&E1,&1E,&E1,&0F,&0C,&00,&0F
defb &FF,&CC,&0F,&F0,&F0,&87,&96,&F0,&0F,&F0
defb &87,&0F,&0C,&00,&01,&0F,&FF,&88,&00,&07
defb &0F,&0F,&78,&0F,&0F,&00,&00,&07,&78,&33
defb &FF,&FC,&08,&00,&00,&00,&04,&01,&0F,&3C
defb &FF,&8A,&0A,&0A,&0A,&00,&0F,&08,&00,&00
defb &00,&0F,&C0,&00,&00,&00,&01,&0F,&0F,&0F
defb &7F,&FF,&CE,&0A,&38,&F0,&0E,&07,&48,&00
defb &07,&3C,&80,&00,&30,&F0,&F0,&E1,&0F,&F0
defb &F0,&87,&0F,&08,&00,&C0,&00,&00,&00,&02
defb &00,&00,&03,&C0,&07,&0F,&0F,&0F,&0F,&1E
defb &F0,&F0,&F0,&E1,&1E,&F0,&F0,&F0,&02,&0A
defb &0A,&0A,&0A,&78,&2D,&18,&80,&00,&03,&E0
defb &0F,&00,&03,&0F,&F0,&00,&02,&0A,&0A,&0A
defb &0A,&1A,&F0,&86,&78,&F0,&F0,&0A,&0A,&0A
defb &0A,&0B,&0F,&0F,&0A,&0A,&C3,&0F,&0F,&0F
defb &08,&10,&C0,&00,&03,&3C,&78,&96,&08,&00
defb &00,&00,&00,&0C,&00,&00,&03,&1E,&81,&F0
defb &03,&0F,&0F,&0F,&0F,&3C,&F0,&F0,&E0,&0A
defb &0A,&0A,&0A,&0F,&0F,&0F,&0E,&0A,&00,&02
defb &03,&0F,&0F,&0F,&1A,&78,&A5,&08,&00,&0F
defb &1E,&80,&0F,&0F,&F8,&B3,&FF,&FF,&FF,&88
defb &0F,&0E,&7F,&FF,&8B,&0F,&0F,&0F,&00,&01
defb &3C,&E0,&00,&01,&EE,&0A,&0F,&0A,&FF,&FF
defb &8A,&38,&F0,&0F,&68,&03,&68,&00,&1F,&BC
defb &F0,&F0,&F0,&82,&0A,&0A,&0A,&0F,&0F,&0A
defb &0A,&0F,&00,&03,&3C,&80,&03,&0F,&0F,&0F
defb &78,&78,&0F,&C0,&40,&00,&0A,&F0,&F0,&5A
defb &80,&00,&FF,&88,&01,&0F,&0F,&00,&00,&0F
defb &01,&0F,&0F,&0F,&0F,&78,&F0,&F0,&F0,&E0
defb &0A,&1A,&F0,&78,&96,&80,&02,&0A,&0A,&0F
defb &0F,&0E,&C2,&0A,&0A,&0A,&7F,&FF,&04,&00
defb &00,&00,&00,&01,&0A,&0A,&0B,&0F,&0F,&0F
defb &0A,&0A,&0A,&0F,&0E,&0A,&38,&F0,&F0,&78
defb &C0,&00,&07,&78,&C0,&00,&3C,&F0,&F0,&F0
defb &F0,&82,&0A,&0A,&0A,&0B,&0F,&0A,&0A,&0F
defb &00,&10,&87,&0C,&00,&00,&00,&10,&87,&00
defb &00,&00,&01,&0F,&0B,&0F,&0F,&0A,&0A,&1A
defb &00,&02,&0A,&0F,&0E,&0A,&0A,&0F,&0E,&0A
defb &0A,&0B,&00,&F0,&0F,&0F,&08,&00,&00,&F0
defb &0F,&0C,&00,&0F,&0F,&0F,&1E,&F0,&00,&02
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
list
push DE
push DE
push DE
jp (hl)

