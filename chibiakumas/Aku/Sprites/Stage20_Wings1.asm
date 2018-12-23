read "..\CoreDefs.asm" ;read "BootStrap.asm"
org &4000
jp PicWingsComplete1abmp
jp PicWingsComplete1bmp
jp PicWingsComplete2bmp
jp PicWingsComplete3bmp

PicWingsComplete1abmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete1abmp_DrawOrder
JP JumpToNextLine


PicWingsComplete1abmp_Line_0:
LD DE,&0000
jp MultiPushDeLast40


PicWingsComplete1abmp_Line_1:
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


PicWingsComplete1abmp_Line_5:
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


PicWingsComplete1abmp_Line_7:
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


PicWingsComplete1abmp_Line_9:
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


PicWingsComplete1abmp_Line_11:
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


PicWingsComplete1abmp_Line_13:
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


PicWingsComplete1abmp_Line_15:
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


PicWingsComplete1abmp_Line_17:
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


PicWingsComplete1abmp_Line_23:
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


PicWingsComplete1abmp_Line_25:
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


PicWingsComplete1abmp_Line_27:
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


PicWingsComplete1abmp_Line_29:
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


PicWingsComplete1abmp_Line_31:
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


PicWingsComplete1abmp_Line_33:
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


PicWingsComplete1abmp_Line_35:
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


PicWingsComplete1abmp_Line_37:
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


PicWingsComplete1abmp_Line_39:
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


PicWingsComplete1abmp_Line_41:
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


PicWingsComplete1abmp_Line_43:
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


PicWingsComplete1abmp_Line_45:
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


PicWingsComplete1abmp_Line_46:
jp MultiPushDeLast40


PicWingsComplete1abmp_Line_47:
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


PicWingsComplete1abmp_Line_46_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_46
PicWingsComplete1abmp_Line_49:
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


PicWingsComplete1abmp_Line_51:
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


PicWingsComplete1abmp_Line_53:
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


PicWingsComplete1abmp_Line_71:
call MultiPushDe15
LD HL,&1100
  Push HL
call MultiPushDe9
LD BC,&2200
  Push BC
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_72:
call MultiPushDe14
LD HL,&0011
  Push HL
LD BC,&1122
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE

Ld L,C

  Push HL
  PUSH DE
  PUSH DE
LD BC,&0011
  Push BC
Ld H,L
  Push HL
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_73:
call MultiPushDe14
call BitmapPush6
defw BitmapData+73
  PUSH DE
LD HL,&0011
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0022
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+79
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_74:
call MultiPushDe14
LD HL,&0044
  Push HL
LD DE,&8888
  PUSH DE
  PUSH DE
LD BC,&0022
  Push BC
Ld L,&33
  Push HL
Ld D,H
Ld E,H

  PUSH DE
  PUSH DE
  Push HL 
Ld C,&11
  Push BC
LD DE,&4444
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast14


PicWingsComplete1abmp_Line_75:
call MultiPushDe15
call BitmapPush8
defw BitmapData+87
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+97
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_76:
call MultiPushDe13
call BitmapPush12
defw BitmapData+109
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+121
jp MultiPushDeLast13


PicWingsComplete1abmp_Line_77:
call MultiPushDe14
call BitmapPush10
defw BitmapData+131
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+141
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_78:
call MultiPushDe15
LD HL,&33EE
  Push HL
LD BC,&AADD
  Push BC
  PUSH DE
Ld H,&77
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+151
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe11
call BitmapPush10
defw BitmapData+161
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+173
call MultiPushDe10
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete1abmp_Line_80:
LD DE,&0000
call MultiPushDe14
call BitmapPush24
defw BitmapData+197
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_81:
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

call MultiPushDe5
call BitmapPush24
defw BitmapData+221
call MultiPushDe5
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

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


PicWingsComplete1abmp_Line_82:
LD DE,&0000
call MultiPushDe14
call BitmapPush24
defw BitmapData+245
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_83:
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
call BitmapPush26
defw BitmapData+271
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_84:
LD DE,&0000
call MultiPushDe14
call BitmapPush24
defw BitmapData+295
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_85:
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
call BitmapPush24
defw BitmapData+319
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_86:
LD DE,&0000
call MultiPushDe14
call BitmapPush24
defw BitmapData+343
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_87:
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
call BitmapPush24
defw BitmapData+367
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_88:
LD DE,&0000
call MultiPushDe14
call BitmapPush24
defw BitmapData+391
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_89:
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
call BitmapPush24
defw BitmapData+415
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_90:
LD DE,&0000
call MultiPushDe14
call BitmapPush10
defw BitmapData+425
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+435
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_91:
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
call BitmapPush24
defw BitmapData+459
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_92:
LD DE,&0000
call MultiPushDe14
call BitmapPush12
defw BitmapData+471
  PUSH DE
call BitmapPush10
defw BitmapData+481
jp MultiPushDeLast14


PicWingsComplete1abmp_Line_93:
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
call BitmapPush24
defw BitmapData+505
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_94:
LD DE,&0000
call MultiPushDe15
call BitmapPush8
defw BitmapData+513
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+521
jp MultiPushDeLast15


PicWingsComplete1abmp_Line_95:
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
call BitmapPush24
defw BitmapData+545
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_96:
LD DE,&0000
call MultiPushDe15
call BitmapPush8
defw BitmapData+553
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+561
jp MultiPushDeLast15


PicWingsComplete1abmp_Line_97:
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
call BitmapPush24
defw BitmapData+585
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_98:
LD DE,&0000
call MultiPushDe16
LD HL,&2222
  Push HL
  PUSH DE
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
Ld H,&00
  Push HL
  PUSH DE
  Push BC
LD BC,&1100
  Push BC
jp MultiPushDeLast15


PicWingsComplete1abmp_Line_99:
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
call BitmapPush6
defw BitmapData+591
  PUSH DE
call BitmapPush8
defw BitmapData+599
  PUSH DE
call BitmapPush6
defw BitmapData+605
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_101:
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


PicWingsComplete1abmp_Line_121:
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


PicWingsComplete1abmp_Line_123:
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
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_125:
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


PicWingsComplete1abmp_Line_127:
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


PicWingsComplete1abmp_Line_131:
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


PicWingsComplete1abmp_Line_131_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_131
PicWingsComplete1abmp_Line_151:
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


PicWingsComplete1abmp_Line_153:
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
defw BitmapData+617
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


PicWingsComplete1abmp_Line_155:
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


PicWingsComplete1abmp_Line_157:
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+597
LD DE,&0000
call MultiPushDe24
call BitmapPush6
defw BitmapData+623
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&0000
 jp NextLinePushBC 


PicWingsComplete1abmp_Line_159:
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


PicWingsComplete1abmp_Line_161:
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


PicWingsComplete1abmp_Line_163:
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


PicWingsComplete1abmp_Line_165:
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


PicWingsComplete1abmp_Line_167:
call MultiPushDe16
LD DE,&5050
call MultiPushDe8
LD HL,&1000
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast15


PicWingsComplete1abmp_Line_169:
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
defw BitmapData+629
jp MultiPushDeLast8


PicWingsComplete1abmp_Line_171:
call MultiPushDe8
call BitmapPush8
defw BitmapData+637
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
defw BitmapData+645
jp MultiPushDeLast8


PicWingsComplete1abmp_Line_173:
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


PicWingsComplete1abmp_Line_175:
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


PicWingsComplete1abmp_Line_175_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_175
PicWingsComplete1abmp_Line_179:
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


PicWingsComplete1abmp_Line_181:
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


PicWingsComplete1abmp_Line_183:
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


PicWingsComplete1abmp_Line_185:
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
defw BitmapData+651
LD DE,&5050
call MultiPushDe11
LD HL,&5000
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete1abmp_Line_187:
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


PicWingsComplete1abmp_Line_189:
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


PicWingsComplete1abmp_Line_191:
  PUSH DE
  PUSH DE
LD DE,&5050
call MultiPushDe36
LD HL,&1000
  Push HL
Ld B,L
Ld C,L

 jp NextLinePushBC 



PicWingsComplete1abmp_DrawOrder: 

  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_5
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_7
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_9
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_11
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_13
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_15
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_17
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_23
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_25
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_27
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_29
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_31
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_33
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_35
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_37
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_39
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_41
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_43
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_45
  DEFW PicWingsComplete1abmp_Line_46
  DEFW PicWingsComplete1abmp_Line_47
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_49
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_51
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_53
defw looper
  DEFB 1,17
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_71
  DEFW PicWingsComplete1abmp_Line_72
  DEFW PicWingsComplete1abmp_Line_73
  DEFW PicWingsComplete1abmp_Line_74
  DEFW PicWingsComplete1abmp_Line_75
  DEFW PicWingsComplete1abmp_Line_76
  DEFW PicWingsComplete1abmp_Line_77
  DEFW PicWingsComplete1abmp_Line_78
  DEFW PicWingsComplete1abmp_Line_79
  DEFW PicWingsComplete1abmp_Line_80
  DEFW PicWingsComplete1abmp_Line_81
  DEFW PicWingsComplete1abmp_Line_82
  DEFW PicWingsComplete1abmp_Line_83
  DEFW PicWingsComplete1abmp_Line_84
  DEFW PicWingsComplete1abmp_Line_85
  DEFW PicWingsComplete1abmp_Line_86
  DEFW PicWingsComplete1abmp_Line_87
  DEFW PicWingsComplete1abmp_Line_88
  DEFW PicWingsComplete1abmp_Line_89
  DEFW PicWingsComplete1abmp_Line_90
  DEFW PicWingsComplete1abmp_Line_91
  DEFW PicWingsComplete1abmp_Line_92
  DEFW PicWingsComplete1abmp_Line_93
  DEFW PicWingsComplete1abmp_Line_94
  DEFW PicWingsComplete1abmp_Line_95
  DEFW PicWingsComplete1abmp_Line_96
  DEFW PicWingsComplete1abmp_Line_97
  DEFW PicWingsComplete1abmp_Line_98
  DEFW PicWingsComplete1abmp_Line_99
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_121
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_123
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_125
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_151
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_153
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_155
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_157
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_159
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_161
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_163
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_165
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_167
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_169
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_171
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_173
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_179
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_181
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_183
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_185
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_187
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_189
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW EndCode
PicWingsComplete1bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete1bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete1abmp_Line_45_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_45
PicWingsComplete1abmp_Line_47_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_47
PicWingsComplete1abmp_Line_49_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_49
PicWingsComplete1abmp_Line_51_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_51
PicWingsComplete1abmp_Line_53_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_53
PicWingsComplete1bmp_Line_71:
call MultiPushDe13
LD HL,&0022
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
Ld B,L
Ld C,L

  Push BC
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_72:
call MultiPushDe13
call BitmapPush8
defw BitmapData+659
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+667
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_73:
call MultiPushDe13
call BitmapPush8
defw BitmapData+675
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+683
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_74:
call MultiPushDe13
call BitmapPush8
defw BitmapData+691
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+697
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_75:
call MultiPushDe14
LD HL,&3300
  Push HL
LD BC,&CC00
  Push BC
  PUSH DE
LD HL,&0022
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
Ld L,&CC
  Push HL
  PUSH DE
LD BC,&3300
  Push BC
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_76:
call MultiPushDe12
call BitmapPush14
defw BitmapData+711
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+725
jp MultiPushDeLast12


PicWingsComplete1bmp_Line_77:
call MultiPushDe13
call BitmapPush12
defw BitmapData+737
  PUSH DE
  PUSH DE
LD HL,&8811
  Push HL
LD BC,&2299
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+743
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_78:
call MultiPushDe14
call BitmapPush10
defw BitmapData+753
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+761
Ld D,&33
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe10
call BitmapPush12
defw BitmapData+773
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+785
call MultiPushDe10
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete1bmp_Line_80:
LD DE,&0000
call MultiPushDe12
call BitmapPush30
defw BitmapData+815
LD HL,&7700
  Push HL
jp MultiPushDeLast12


PicWingsComplete1bmp_Line_81:
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
Call PushDE_0000x
call BitmapPush28
defw BitmapData+843
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

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


PicWingsComplete1bmp_Line_82:
LD DE,&0000
call MultiPushDe13
call BitmapPush28
defw BitmapData+871
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_83:
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
call BitmapPush30
defw BitmapData+901
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_84:
LD DE,&0000
call MultiPushDe13
call BitmapPush28
defw BitmapData+929
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_85:
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
call BitmapPush30
defw BitmapData+959
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_86:
LD DE,&0000
call MultiPushDe13
call BitmapPush28
defw BitmapData+987
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_87:
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
call BitmapPush28
defw BitmapData+1015
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_88:
LD DE,&0000
call MultiPushDe13
call BitmapPush28
defw BitmapData+1043
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_89:
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
call BitmapPush28
defw BitmapData+1071
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_90:
LD DE,&0000
call MultiPushDe13
call BitmapPush12
defw BitmapData+1083
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1093
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_91:
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
call BitmapPush14
defw BitmapData+1107
call BitmapPush14
defw BitmapData+1121
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_92:
LD DE,&0000
call MultiPushDe13
call BitmapPush14
defw BitmapData+1135
  PUSH DE
call BitmapPush12
defw BitmapData+1147
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_93:
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
call BitmapPush14
defw BitmapData+1161
call BitmapPush14
defw BitmapData+1175
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_94:
LD DE,&0000
call MultiPushDe13
call BitmapPush12
defw BitmapData+1187
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1199
jp MultiPushDeLast13


PicWingsComplete1bmp_Line_95:
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
call BitmapPush14
defw BitmapData+1213
call BitmapPush14
defw BitmapData+1227
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_96:
LD DE,&0000
call MultiPushDe14
call BitmapPush10
defw BitmapData+1237
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1247
jp MultiPushDeLast14


PicWingsComplete1bmp_Line_97:
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
call BitmapPush24
defw BitmapData+1271
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_98:
LD DE,&0000
call MultiPushDe14
call BitmapPush10
defw BitmapData+1281
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1291
jp MultiPushDeLast14


PicWingsComplete1bmp_Line_99:
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
call BitmapPush24
defw BitmapData+1315
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_100:
LD DE,&0000
call MultiPushDe15
call BitmapPush8
defw BitmapData+1323
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1331
jp MultiPushDeLast15


PicWingsComplete1bmp_Line_101:
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
call BitmapPush24
defw BitmapData+1355
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_102:
LD DE,&0000
call MultiPushDe15
call BitmapPush8
defw BitmapData+1363
  PUSH DE
  PUSH DE
LD HL,&0022
  Push HL
LD BC,&0088
  Push BC
  PUSH DE
Ld H,&11
  Push HL
jp MultiPushDeLast15


PicWingsComplete1bmp_Line_103:
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
call BitmapPush24
defw BitmapData+1387
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1bmp_Line_104:
LD DE,&0000
call MultiPushDe16
LD HL,&2200
  Push HL
call MultiPushDe7
LD BC,&1100
  Push BC
jp MultiPushDeLast15


PicWingsComplete1bmp_Line_105:
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
call BitmapPush6
defw BitmapData+1393
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5110
  Push HL
Ld C,&40
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete1abmp_Line_151_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_151
PicWingsComplete1abmp_Line_153_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_153
PicWingsComplete1abmp_Line_155_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_155
PicWingsComplete1abmp_Line_157_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_157
PicWingsComplete1abmp_Line_159_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_159
PicWingsComplete1abmp_Line_161_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_161
PicWingsComplete1abmp_Line_163_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_163
PicWingsComplete1abmp_Line_165_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_165
PicWingsComplete1abmp_Line_169_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_169
PicWingsComplete1abmp_Line_171_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_171
PicWingsComplete1abmp_Line_173_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_173
PicWingsComplete1abmp_Line_179_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_179
PicWingsComplete1abmp_Line_181_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_181
PicWingsComplete1abmp_Line_185_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_185
PicWingsComplete1abmp_Line_187_Reuse:
LD DE,&0000
JP PicWingsComplete1abmp_Line_187

PicWingsComplete1bmp_DrawOrder: 

  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_5
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_7
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_9
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_11
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_13
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_15
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_17
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_23
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_25
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_27
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_29
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_31
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_33
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_35
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_37
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_39
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_41
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_43
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_45_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_47_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_49_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_51_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_53_Reuse
defw looper
  DEFB 1,17
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1bmp_Line_71
  DEFW PicWingsComplete1bmp_Line_72
  DEFW PicWingsComplete1bmp_Line_73
  DEFW PicWingsComplete1bmp_Line_74
  DEFW PicWingsComplete1bmp_Line_75
  DEFW PicWingsComplete1bmp_Line_76
  DEFW PicWingsComplete1bmp_Line_77
  DEFW PicWingsComplete1bmp_Line_78
  DEFW PicWingsComplete1bmp_Line_79
  DEFW PicWingsComplete1bmp_Line_80
  DEFW PicWingsComplete1bmp_Line_81
  DEFW PicWingsComplete1bmp_Line_82
  DEFW PicWingsComplete1bmp_Line_83
  DEFW PicWingsComplete1bmp_Line_84
  DEFW PicWingsComplete1bmp_Line_85
  DEFW PicWingsComplete1bmp_Line_86
  DEFW PicWingsComplete1bmp_Line_87
  DEFW PicWingsComplete1bmp_Line_88
  DEFW PicWingsComplete1bmp_Line_89
  DEFW PicWingsComplete1bmp_Line_90
  DEFW PicWingsComplete1bmp_Line_91
  DEFW PicWingsComplete1bmp_Line_92
  DEFW PicWingsComplete1bmp_Line_93
  DEFW PicWingsComplete1bmp_Line_94
  DEFW PicWingsComplete1bmp_Line_95
  DEFW PicWingsComplete1bmp_Line_96
  DEFW PicWingsComplete1bmp_Line_97
  DEFW PicWingsComplete1bmp_Line_98
  DEFW PicWingsComplete1bmp_Line_99
  DEFW PicWingsComplete1bmp_Line_100
  DEFW PicWingsComplete1bmp_Line_101
  DEFW PicWingsComplete1bmp_Line_102
  DEFW PicWingsComplete1bmp_Line_103
  DEFW PicWingsComplete1bmp_Line_104
  DEFW PicWingsComplete1bmp_Line_105
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_121
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_123
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_125
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_151_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_153_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_155_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_157_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_159_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_161_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_163_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_165_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_167
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_169_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_171_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_173_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_179_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_181_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_183
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_185_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_187_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_189
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW EndCode
PicWingsComplete2bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete2bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete2bmp_Line_69:
call MultiPushDe12
LD HL,&8888
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4400
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0088
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0044
  Push HL
Ld B,L
Ld C,L

  Push BC
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_70:
call MultiPushDe12
LD HL,&0099
  Push HL
LD BC,&4400
  Push BC
  PUSH DE
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
Ld B,&88
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0044
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+685
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_71:
call MultiPushDe12
LD HL,&00AA
  Push HL
LD BC,&2200
  Push BC
  PUSH DE
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
LD BC,&8811
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0066
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&2200
  Push BC
  PUSH DE
LD HL,&5511
  Push HL
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_72:
call MultiPushDe12
LD HL,&0088
  Push HL
  PUSH DE
LD BC,&0011
  Push BC
Ld H,C
Ld L,C

  Push HL
  PUSH DE
  PUSH DE
Ld C,&33
  Push BC
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0022
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
LD HL,&4400
  Push HL
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_73:
call MultiPushDe12
call BitmapPush8
defw BitmapData+1401
  PUSH DE
LD HL,&2200
  Push HL
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
call BitmapPush10
defw BitmapData+1411
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_74:
call MultiPushDe12
LD HL,&00CC
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+1421
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1431
  PUSH DE
LD BC,&CC00
  Push BC
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_75:
call MultiPushDe10
call BitmapPush8
defw BitmapData+1439
LD DE,&8833
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1445
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1451
Ld E,&77
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1459
Ld E,&00
jp MultiPushDeLast10


PicWingsComplete2bmp_Line_76:
call MultiPushDe12
call BitmapPush14
defw BitmapData+1473
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1479
  PUSH DE
call BitmapPush6
defw BitmapData+1485
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_77:
call MultiPushDe12
call BitmapPush10
defw BitmapData+1495
  PUSH DE
LD HL,&00CC
  Push HL
LD BC,&1100
  Push BC
  PUSH DE
LD HL,&EE00
  Push HL
  PUSH DE
Ld E,&77
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1503
Ld E,&00
jp MultiPushDeLast11


PicWingsComplete2bmp_Line_78:
call MultiPushDe11
call BitmapPush18
defw BitmapData+1521
  PUSH DE
call BitmapPush16
defw BitmapData+1537
jp MultiPushDeLast11


PicWingsComplete2bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe8
call BitmapPush16
defw BitmapData+1553
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1569
call MultiPushDe8
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete2bmp_Line_80:
LD DE,&0000
call MultiPushDe11
call BitmapPush30
defw BitmapData+1599
call BitmapPush6
defw BitmapData+1605
jp MultiPushDeLast11


PicWingsComplete2bmp_Line_81:
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

  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1615
  PUSH DE
call BitmapPush26
defw BitmapData+1641
  PUSH DE
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

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


PicWingsComplete2bmp_Line_82:
LD DE,&0000
call MultiPushDe11
call BitmapPush30
defw BitmapData+1671
call BitmapPush6
defw BitmapData+1677
jp MultiPushDeLast11


PicWingsComplete2bmp_Line_83:
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
call BitmapPush30
defw BitmapData+1707
call BitmapPush6
defw BitmapData+1713
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_84:
LD DE,&0000
call MultiPushDe11
call BitmapPush30
defw BitmapData+1743
call BitmapPush6
defw BitmapData+1749
jp MultiPushDeLast11


PicWingsComplete2bmp_Line_85:
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
call BitmapPush30
defw BitmapData+1779
call BitmapPush6
defw BitmapData+1785
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_86:
LD DE,&0000
call MultiPushDe12
call BitmapPush30
defw BitmapData+1815
LD HL,&5511
  Push HL
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_87:
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
call BitmapPush30
defw BitmapData+1845
LD HL,&5551
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0000
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


PicWingsComplete2bmp_Line_88:
LD DE,&0000
call MultiPushDe12
call BitmapPush30
defw BitmapData+1875
LD HL,&9911
  Push HL
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_89:
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
call BitmapPush30
defw BitmapData+1905
LD HL,&9951
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0000
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


PicWingsComplete2bmp_Line_90:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+1919
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1933
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_91:
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
call BitmapPush30
defw BitmapData+1963
LD HL,&2251
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0000
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


PicWingsComplete2bmp_Line_92:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+1977
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1991
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_93:
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
call BitmapPush30
defw BitmapData+2021
LD HL,&2222
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0000
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


PicWingsComplete2bmp_Line_94:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+2035
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2049
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_95:
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
LD HL,&5099
  Push HL
LD BC,&CC88
  Push BC
LD DE,&AAAA
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+2065
LD DE,&5555
  PUSH DE
  PUSH DE
LD HL,&55CC
  Push HL
LD BC,&4422
  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_96:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+2079
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2093
jp MultiPushDeLast12


PicWingsComplete2bmp_Line_97:
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
call BitmapPush30
defw BitmapData+2123
LD HL,&0000
  Push HL
  PUSH DE
  PUSH DE
  Push HL 
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_98:
LD DE,&0000
call MultiPushDe13
call BitmapPush12
defw BitmapData+2135
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2147
jp MultiPushDeLast13


PicWingsComplete2bmp_Line_99:
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
call BitmapPush30
defw BitmapData+2177
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_100:
LD DE,&0000
call MultiPushDe13
call BitmapPush12
defw BitmapData+2189
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2201
jp MultiPushDeLast13


PicWingsComplete2bmp_Line_101:
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
call BitmapPush30
defw BitmapData+2231
  PUSH DE
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_102:
LD DE,&0000
call MultiPushDe14
call BitmapPush10
defw BitmapData+2241
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2253
jp MultiPushDeLast13


PicWingsComplete2bmp_Line_103:
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
call BitmapPush26
defw BitmapData+2279
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_104:
LD DE,&0000
call MultiPushDe14
call BitmapPush10
defw BitmapData+2289
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2301
jp MultiPushDeLast13


PicWingsComplete2bmp_Line_105:
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
call BitmapPush26
defw BitmapData+2327
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_106:
LD DE,&0000
call MultiPushDe14
call BitmapPush8
defw BitmapData+2335
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2343
jp MultiPushDeLast14


PicWingsComplete2bmp_Line_107:
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
call BitmapPush8
defw BitmapData+2351
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+2359
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_108:
LD DE,&0000
call MultiPushDe14
LD HL,&0022
  Push HL
LD BC,&4488
  Push BC
call MultiPushDe8
  Push BC
LD HL,&0011
  Push HL
jp MultiPushDeLast14


PicWingsComplete2bmp_Line_109:
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
call BitmapPush6
defw BitmapData+2365
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1098
  Push HL
Ld C,&51
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete2bmp_Line_110:
LD DE,&0000
call MultiPushDe14
LD HL,&0022
  Push HL
call MultiPushDe10
LD BC,&0011
  Push BC
jp MultiPushDeLast14



PicWingsComplete2bmp_DrawOrder: 

  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_5
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_7
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_9
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_11
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_13
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_15
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_17
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_23
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_25
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_27
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_29
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_31
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_33
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_35
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_37
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_39
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_41
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_43
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_45_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_47_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_49_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_51_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_53_Reuse
defw looper
  DEFB 1,15
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete2bmp_Line_69
  DEFW PicWingsComplete2bmp_Line_70
  DEFW PicWingsComplete2bmp_Line_71
  DEFW PicWingsComplete2bmp_Line_72
  DEFW PicWingsComplete2bmp_Line_73
  DEFW PicWingsComplete2bmp_Line_74
  DEFW PicWingsComplete2bmp_Line_75
  DEFW PicWingsComplete2bmp_Line_76
  DEFW PicWingsComplete2bmp_Line_77
  DEFW PicWingsComplete2bmp_Line_78
  DEFW PicWingsComplete2bmp_Line_79
  DEFW PicWingsComplete2bmp_Line_80
  DEFW PicWingsComplete2bmp_Line_81
  DEFW PicWingsComplete2bmp_Line_82
  DEFW PicWingsComplete2bmp_Line_83
  DEFW PicWingsComplete2bmp_Line_84
  DEFW PicWingsComplete2bmp_Line_85
  DEFW PicWingsComplete2bmp_Line_86
  DEFW PicWingsComplete2bmp_Line_87
  DEFW PicWingsComplete2bmp_Line_88
  DEFW PicWingsComplete2bmp_Line_89
  DEFW PicWingsComplete2bmp_Line_90
  DEFW PicWingsComplete2bmp_Line_91
  DEFW PicWingsComplete2bmp_Line_92
  DEFW PicWingsComplete2bmp_Line_93
  DEFW PicWingsComplete2bmp_Line_94
  DEFW PicWingsComplete2bmp_Line_95
  DEFW PicWingsComplete2bmp_Line_96
  DEFW PicWingsComplete2bmp_Line_97
  DEFW PicWingsComplete2bmp_Line_98
  DEFW PicWingsComplete2bmp_Line_99
  DEFW PicWingsComplete2bmp_Line_100
  DEFW PicWingsComplete2bmp_Line_101
  DEFW PicWingsComplete2bmp_Line_102
  DEFW PicWingsComplete2bmp_Line_103
  DEFW PicWingsComplete2bmp_Line_104
  DEFW PicWingsComplete2bmp_Line_105
  DEFW PicWingsComplete2bmp_Line_106
  DEFW PicWingsComplete2bmp_Line_107
  DEFW PicWingsComplete2bmp_Line_108
  DEFW PicWingsComplete2bmp_Line_109
  DEFW PicWingsComplete2bmp_Line_110
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_121
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_123
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_125
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_151_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_153_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_155_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_157_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_159_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_161_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_163_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_165_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_167
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_169_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_171_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_173_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_179_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_181_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_183
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_185_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_187_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_189
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW EndCode
PicWingsComplete3bmp:
ld (Background_CompiledSprite_Minus1+1),de
call Akuyou_ScreenBuffer_GetActiveScreen
ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
LD IX,PicWingsComplete3bmp_DrawOrder
JP JumpToNextLine


PicWingsComplete3bmp_Line_67:
call MultiPushDe12
LD HL,&2200
  Push HL
call MultiPushDe15
LD BC,&1100
  Push BC
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_68:
call MultiPushDe11
LD HL,&0011
  Push HL
LD BC,&2244
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
Ld B,&00
  Push BC
call MultiPushDe5
LD HL,&8800
  Push HL
LD BC,&1122
  Push BC
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_69:
call MultiPushDe11
LD HL,&0022
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
  Push HL 
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
  PUSH DE
  Push HL 
Ld B,L
Ld C,L

  Push BC
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_70:
call MultiPushDe11
LD HL,&0044
  Push HL
LD BC,&2211
  Push BC
  PUSH DE
Ld H,C
Ld L,B

  Push HL
LD BC,&4400
  Push BC
  PUSH DE
  PUSH DE
LD HL,&8800
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2375
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_71:
call MultiPushDe11
LD HL,&0088
  Push HL
LD BC,&AA00
  Push BC
  PUSH DE
LD HL,&2222
  Push HL
Ld B,L


  Push BC
  PUSH DE
  PUSH DE
LD HL,&0011
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0022
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2383
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_72:
call MultiPushDe11
call BitmapPush10
defw BitmapData+2393
  PUSH DE
LD HL,&2200
  Push HL
LD BC,&0033
  Push BC
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
Ld H,&11
  Push HL
  PUSH DE
LD BC,&2299
  Push BC
  PUSH DE
LD HL,&EE33
  Push HL
LD BC,&00FF
  Push BC
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_73:
call MultiPushDe12
LD HL,&3300
  Push HL
  PUSH DE
LD BC,&88AA
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+2399
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2405
  PUSH DE
LD HL,&4455
  Push HL
  PUSH DE
  PUSH DE
LD BC,&3300
  Push BC
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_74:
call MultiPushDe9
call BitmapPush20
defw BitmapData+2425
  PUSH DE
  PUSH DE
call BitmapPush20
defw BitmapData+2445
jp MultiPushDeLast9


PicWingsComplete3bmp_Line_75:
call MultiPushDe10
call BitmapPush10
defw BitmapData+2455
  PUSH DE
call BitmapPush6
defw BitmapData+2461
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2467
  PUSH DE
call BitmapPush10
defw BitmapData+2477
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_76:
call MultiPushDe11
call BitmapPush16
defw BitmapData+2493
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+2505
  PUSH DE
LD HL,&7700
  Push HL
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_77:
call MultiPushDe10
call BitmapPush14
defw BitmapData+2519
  PUSH DE
LD HL,&00AA
  Push HL
  PUSH DE
  PUSH DE
LD BC,&4411
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+2533
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_78:
call MultiPushDe10
call BitmapPush18
defw BitmapData+2551
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2569
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_79:
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe7
call BitmapPush18
defw BitmapData+2587
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+2605
call MultiPushDe7
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

 jp NextLinePushDe2


PicWingsComplete3bmp_Line_80:
LD DE,&0000
call MultiPushDe10
call BitmapPush30
defw BitmapData+2635
call BitmapPush8
defw BitmapData+2643
Ld D,&11
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast9


PicWingsComplete3bmp_Line_81:
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
call BitmapPush30
defw BitmapData+2673
call BitmapPush16
defw BitmapData+2689
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_82:
LD DE,&0000
call MultiPushDe10
call BitmapPush26
defw BitmapData+2715
  PUSH DE
call BitmapPush12
defw BitmapData+2727
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_83:
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
call BitmapPush30
defw BitmapData+2757
call BitmapPush16
defw BitmapData+2773
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_84:
LD DE,&0000
call MultiPushDe10
call BitmapPush30
defw BitmapData+2803
call BitmapPush10
defw BitmapData+2813
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_85:
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
call BitmapPush14
defw BitmapData+2827
LD DE,&BBAA
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2837
LD DE,&7755
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+2851
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_86:
LD DE,&0000
call MultiPushDe10
call BitmapPush26
defw BitmapData+2877
LD DE,&6655
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2887
LD DE,&0000
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_87:
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
call BitmapPush30
defw BitmapData+2917
call BitmapPush16
defw BitmapData+2933
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_88:
LD DE,&0000
call MultiPushDe11
call BitmapPush30
defw BitmapData+2963
call BitmapPush8
defw BitmapData+2971
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_89:
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
call BitmapPush10
defw BitmapData+2981
LD DE,&55AA
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+2989
LD DE,&6699
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3005
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_90:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3021
  PUSH DE
  PUSH DE
call BitmapPush18
defw BitmapData+3039
jp MultiPushDeLast10


PicWingsComplete3bmp_Line_91:
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
call BitmapPush10
defw BitmapData+3049
LD DE,&55BB
  PUSH DE
  PUSH DE
call BitmapPush28
defw BitmapData+3077
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_92:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3093
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3109
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_93:
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
call BitmapPush30
defw BitmapData+3139
call BitmapPush6
defw BitmapData+3145
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_94:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3161
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3177
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_95:
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
call BitmapPush28
defw BitmapData+3205
LD DE,&3355
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+3215
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_96:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3231
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+3239
LD DE,&3355
  PUSH DE
  PUSH DE
LD HL,&AA44
  Push HL
LD BC,&8800
  Push BC
Ld D,C
Ld E,C

jp MultiPushDeLast11


PicWingsComplete3bmp_Line_97:
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
call BitmapPush30
defw BitmapData+3269
call BitmapPush6
defw BitmapData+3275
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_98:
LD DE,&0000
call MultiPushDe11
call BitmapPush10
defw BitmapData+3285
LD DE,&66BB
  PUSH DE
  PUSH DE
LD HL,&8866
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3301
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_99:
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
call BitmapPush8
defw BitmapData+3309
LD DE,&66AA
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3321
LD DE,&5599
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3335
LD DE,&5050
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+611
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_100:
LD DE,&0000
call MultiPushDe11
call BitmapPush8
defw BitmapData+3343
LD DE,&66AA
  PUSH DE
  PUSH DE
LD HL,&44BB
  Push HL
LD BC,&8822
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0055
  Push HL
call BitmapPush6
defw BitmapData+3349
LD DE,&1133
  PUSH DE
  PUSH DE
LD BC,&4488
  Push BC
LD HL,&8800
  Push HL
Ld D,L
Ld E,L

jp MultiPushDeLast11


PicWingsComplete3bmp_Line_101:
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
call BitmapPush30
defw BitmapData+3379
call BitmapPush6
defw BitmapData+3385
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_102:
LD DE,&0000
call MultiPushDe11
call BitmapPush16
defw BitmapData+3401
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+3417
jp MultiPushDeLast11


PicWingsComplete3bmp_Line_103:
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
call BitmapPush30
defw BitmapData+3447
call BitmapPush6
defw BitmapData+3453
  PUSH DE
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_104:
LD DE,&0000
call MultiPushDe12
call BitmapPush14
defw BitmapData+3467
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+3481
jp MultiPushDeLast12


PicWingsComplete3bmp_Line_105:
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
call BitmapPush30
defw BitmapData+3511
LD HL,&5450
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0000
  Push BC
Ld H,&40
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


PicWingsComplete3bmp_Line_106:
LD DE,&0000
call MultiPushDe13
call BitmapPush12
defw BitmapData+3523
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+3535
jp MultiPushDeLast13


PicWingsComplete3bmp_Line_107:
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
call BitmapPush24
defw BitmapData+3559
LD HL,&0000
  Push HL
LD BC,&5051
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push HL 
LD HL,&4050
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
Ld C,&10
  Push BC
LD HL,&0000
  Push HL
LD BC,&4050
  Push BC
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_108:
LD DE,&0000
call MultiPushDe13
LD HL,&0022
  Push HL
  PUSH DE
LD DE,&8888
  PUSH DE
  PUSH DE
LD BC,&88CC
  Push BC
LD HL,&8800
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&0044
  Push BC
LD HL,&CC44
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
Ld C,&00
  Push BC
LD HL,&0011
  Push HL
Ld D,H
Ld E,H

jp MultiPushDeLast13


PicWingsComplete3bmp_Line_109:
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
call BitmapPush28
defw BitmapData+3587
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_110:
LD DE,&0000
call MultiPushDe16
LD HL,&1100
  Push HL
LD BC,&9944
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8844
  Push HL
Ld D,&22
  PUSH DE
  PUSH DE
Ld D,E
jp MultiPushDeLast15


PicWingsComplete3bmp_Line_111:
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
call BitmapPush8
defw BitmapData+3595
  PUSH DE
LD HL,&5000
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+3603
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_112:
LD DE,&0000
call MultiPushDe17
LD HL,&1144
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8800
  Push BC
LD HL,&2200
  Push HL
jp MultiPushDeLast16


PicWingsComplete3bmp_Line_113:
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
LD HL,&4054
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
LD BC,&9840
  Push BC
call BitmapPush6
defw BitmapData+623
  PUSH DE
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
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2


PicWingsComplete3bmp_Line_114:
LD DE,&0000
call MultiPushDe17
LD HL,&0044
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8800
  Push BC
jp MultiPushDeLast17


PicWingsComplete3bmp_Line_115:
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
LD HL,&5010
  Push HL
  PUSH DE
LD BC,&5000
  Push BC
Ld H,C
Ld L,E

  Push HL
  PUSH DE
LD BC,&1040
  Push BC
  PUSH DE
Ld H,E
Ld L,B

  Push HL
Ld B,&00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld H,B
Ld L,B

  Push HL
LD BC,&4050
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5010
  Push HL
LD BC,&0000
  Push BC
LD HL,&4050
  Push HL
 jp NextLinePushDe2



PicWingsComplete3bmp_DrawOrder: 

  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_5
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_7
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_9
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_11
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_13
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_15
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_17
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_1
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_23
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_25
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_27
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_29
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_31
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_33
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_35
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_37
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_39
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_41
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_43
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_45_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_47_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_49_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_51_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_53_Reuse
defw looper
  DEFB 1,13
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete3bmp_Line_67
  DEFW PicWingsComplete3bmp_Line_68
  DEFW PicWingsComplete3bmp_Line_69
  DEFW PicWingsComplete3bmp_Line_70
  DEFW PicWingsComplete3bmp_Line_71
  DEFW PicWingsComplete3bmp_Line_72
  DEFW PicWingsComplete3bmp_Line_73
  DEFW PicWingsComplete3bmp_Line_74
  DEFW PicWingsComplete3bmp_Line_75
  DEFW PicWingsComplete3bmp_Line_76
  DEFW PicWingsComplete3bmp_Line_77
  DEFW PicWingsComplete3bmp_Line_78
  DEFW PicWingsComplete3bmp_Line_79
  DEFW PicWingsComplete3bmp_Line_80
  DEFW PicWingsComplete3bmp_Line_81
  DEFW PicWingsComplete3bmp_Line_82
  DEFW PicWingsComplete3bmp_Line_83
  DEFW PicWingsComplete3bmp_Line_84
  DEFW PicWingsComplete3bmp_Line_85
  DEFW PicWingsComplete3bmp_Line_86
  DEFW PicWingsComplete3bmp_Line_87
  DEFW PicWingsComplete3bmp_Line_88
  DEFW PicWingsComplete3bmp_Line_89
  DEFW PicWingsComplete3bmp_Line_90
  DEFW PicWingsComplete3bmp_Line_91
  DEFW PicWingsComplete3bmp_Line_92
  DEFW PicWingsComplete3bmp_Line_93
  DEFW PicWingsComplete3bmp_Line_94
  DEFW PicWingsComplete3bmp_Line_95
  DEFW PicWingsComplete3bmp_Line_96
  DEFW PicWingsComplete3bmp_Line_97
  DEFW PicWingsComplete3bmp_Line_98
  DEFW PicWingsComplete3bmp_Line_99
  DEFW PicWingsComplete3bmp_Line_100
  DEFW PicWingsComplete3bmp_Line_101
  DEFW PicWingsComplete3bmp_Line_102
  DEFW PicWingsComplete3bmp_Line_103
  DEFW PicWingsComplete3bmp_Line_104
  DEFW PicWingsComplete3bmp_Line_105
  DEFW PicWingsComplete3bmp_Line_106
  DEFW PicWingsComplete3bmp_Line_107
  DEFW PicWingsComplete3bmp_Line_108
  DEFW PicWingsComplete3bmp_Line_109
  DEFW PicWingsComplete3bmp_Line_110
  DEFW PicWingsComplete3bmp_Line_111
  DEFW PicWingsComplete3bmp_Line_112
  DEFW PicWingsComplete3bmp_Line_113
  DEFW PicWingsComplete3bmp_Line_114
  DEFW PicWingsComplete3bmp_Line_115
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_101
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_121
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_123
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_125
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_127
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_131_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_151_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_153_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_155_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_157_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_159_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_161_Reuse
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_163_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_165_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_167
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_169_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_171_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_173_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_175_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_179_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_181_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_183
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_185_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_187_Reuse
  DEFW PicWingsComplete1abmp_Line_46_Reuse
  DEFW PicWingsComplete1abmp_Line_189
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
  DEFW PicWingsComplete1abmp_Line_0
  DEFW PicWingsComplete1abmp_Line_191
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
MultiPushDe31: pop HL
jp MultiPushDe31B 
MultiPushDe30: pop HL
jp MultiPushDe30B 
MultiPushDe28: pop HL
jp MultiPushDe28B 
MultiPushDe24: pop HL
jp MultiPushDe24B 
MultiPushDe20: pop HL
jp MultiPushDe20B 
MultiPushDe19: pop HL
jp MultiPushDe19B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDeLast17: ld HL,NextLine
jr MultiPushDe17B 
MultiPushDe17: pop HL
jr MultiPushDe17B 
MultiPushDeLast16: ld HL,NextLine
jr MultiPushDe16B 
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
MultiPushDeLast12: ld HL,NextLine
jr MultiPushDe12B 
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
defb &50,&40,&00,&50,&50,&50,&50,&00,&00,&88
defb &11,&11,&22,&00,&11,&22,&22,&00,&44,&00
defb &33,&22,&22,&22,&44,&99,&00,&33,&00,&33
defb &00,&22,&44,&99,&11,&11,&33,&00,&77,&11
defb &22,&44,&22,&22,&11,&66,&BB,&FF,&CC,&00
defb &00,&FF,&FF,&55,&AA,&11,&11,&00,&99,&22
defb &33,&88,&66,&00,&AA,&88,&00,&CC,&77,&55
defb &BB,&00,&33,&66,&BB,&88,&CC,&00,&55,&44
defb &11,&88,&00,&33,&11,&DD,&66,&CC,&00,&33
defb &99,&CC,&22,&00,&33,&11,&DD,&66,&88,&88
defb &77,&FF,&00,&33,&FF,&88,&44,&55,&AA,&EE
defb &33,&00,&11,&00,&22,&BB,&44,&00,&CC,&77
defb &55,&88,&00,&77,&88,&00,&00,&77,&88,&00
defb &66,&BB,&88,&CC,&00,&BB,&55,&00,&66,&BB
defb &22,&55,&55,&00,&66,&BB,&00,&88,&44,&00
defb &00,&88,&44,&33,&55,&88,&22,&AA,&99,&33
defb &55,&88,&99,&DD,&22,&DD,&44,&BB,&33,&33
defb &DD,&77,&AA,&00,&11,&77,&AA,&FF,&33,&33
defb &44,&AA,&DD,&22,&EE,&44,&50,&40,&11,&55
defb &22,&99,&44,&BB,&00,&11,&AA,&CC,&DD,&00
defb &22,&CC,&DD,&66,&00,&33,&44,&AA,&55,&22
defb &AA,&10,&11,&66,&AA,&99,&CC,&AA,&55,&00
defb &22,&88,&55,&00,&22,&88,&55,&00,&22,&99
defb &44,&EE,&55,&55,&AA,&00,&40,&66,&AA,&99
defb &AA,&AA,&55,&22,&AA,&88,&55,&00,&22,&88
defb &55,&55,&22,&99,&55,&66,&55,&55,&88,&10
defb &00,&66,&BB,&55,&AA,&AA,&55,&22,&AA,&CC
defb &DD,&00,&22,&CC,&DD,&55,&22,&99,&55,&66
defb &BB,&55,&88,&00,&40,&66,&BB,&55,&AA,&CC
defb &77,&33,&11,&77,&AA,&00,&11,&77,&AA,&33
defb &33,&88,&DD,&66,&BB,&55,&88,&10,&00,&66
defb &BB,&55,&AA,&DD,&66,&33,&00,&88,&44,&00
defb &00,&88,&44,&33,&11,&AA,&DD,&66,&BB,&55
defb &88,&00,&40,&55,&33,&55,&99,&DD,&66,&77
defb &40,&77,&98,&00,&00,&77,&98,&33,&99,&AA
defb &EE,&66,&BB,&22,&88,&10,&44,&11,&99,&AA
defb &66,&66,&99,&AA,&88,&00,&00,&55,&66,&55
defb &99,&99,&66,&66,&00,&88,&40,&44,&66,&55
defb &55,&99,&66,&66,&40,&EE,&50,&00,&00,&51
defb &DC,&51,&99,&AA,&66,&AA,&99,&88,&88,&10
defb &00,&11,&CC,&00,&88,&AA,&66,&AA,&99,&88
defb &88,&00,&00,&44,&66,&55,&55,&99,&44,&44
defb &00,&EE,&40,&00,&66,&55,&55,&22,&55,&54
defb &40,&CC,&50,&00,&00,&40,&CC,&40,&AA,&99
defb &22,&AA,&99,&88,&00,&10,&66,&00,&AA,&99
defb &22,&AA,&DD,&88,&66,&DD,&55,&22,&55,&44
defb &11,&88,&40,&00,&44,&99,&11,&22,&44,&10
defb &51,&98,&50,&00,&00,&50,&66,&40,&00,&99
defb &22,&22,&44,&88,&00,&10,&22,&00,&00,&99
defb &22,&22,&00,&88,&44,&11,&11,&22,&44,&00
defb &11,&00,&40,&00,&10,&51,&51,&22,&10,&50
defb &33,&50,&50,&00,&00,&50,&33,&50,&40,&11
defb &22,&22,&40,&00,&00,&10,&00,&22,&50,&00
defb &00,&10,&00,&50,&50,&00,&00,&50,&40,&50
defb &40,&00,&10,&51,&40,&50,&50,&40,&00,&00
defb &10,&50,&00,&10,&50,&40,&00,&10,&40,&00
defb &10,&50,&50,&00,&00,&50,&40,&00,&10,&40
defb &00,&10,&50,&50,&00,&10,&50,&40,&50,&50
defb &40,&10,&50,&50,&40,&00,&50,&00,&50,&50
defb &40,&00,&00,&88,&88,&88,&11,&22,&44,&00
defb &00,&99,&22,&00,&44,&44,&44,&00,&00,&44
defb &99,&00,&00,&AA,&88,&00,&00,&55,&44,&00
defb &22,&44,&88,&00,&00,&22,&AA,&00,&77,&00
defb &33,&00,&33,&00,&33,&88,&11,&55,&33,&22
defb &22,&22,&11,&CC,&CC,&00,&FF,&66,&BB,&FF
defb &EE,&00,&11,&FF,&FF,&55,&BB,&CC,&00,&CC
defb &EE,&11,&11,&11,&33,&00,&66,&11,&22,&44
defb &00,&11,&AA,&FF,&77,&55,&BB,&00,&33,&66
defb &BB,&BB,&DD,&66,&66,&00,&88,&88,&11,&DD
defb &66,&FF,&00,&33,&DD,&AA,&EE,&00,&44,&44
defb &11,&88,&22,&66,&33,&00,&DD,&CC,&CC,&00
defb &77,&00,&11,&88,&66,&00,&33,&88,&00,&CC
defb &EE,&CC,&33,&11,&99,&00,&AA,&00,&77,&AA
defb &88,&00,&00,&FF,&55,&88,&00,&77,&88,&00
defb &00,&77,&88,&00,&66,&BB,&CC,&00,&00,&55
defb &77,&88,&11,&77,&88,&00,&66,&AA,&33,&AA
defb &88,&00,&44,&77,&66,&BB,&00,&88,&44,&00
defb &00,&88,&44,&33,&55,&BB,&88,&88,&00,&55
defb &77,&11,&55,&88,&44,&AA,&33,&AA,&AA,&99
defb &44,&00,&33,&33,&DD,&77,&AA,&00,&11,&77
defb &AA,&FF,&33,&00,&00,&AA,&55,&55,&77,&11
defb &44,&88,&50,&40,&88,&AA,&33,&33,&BB,&99
defb &CC,&AA,&00,&11,&AA,&CC,&DD,&00,&22,&CC
defb &DD,&66,&00,&11,&44,&EE,&77,&77,&33,&11
defb &44,&54,&88,&AA,&33,&33,&22,&99,&44,&AA
defb &AA,&00,&22,&88,&55,&00,&22,&88,&55,&00
defb &11,&55,&44,&AA,&55,&33,&33,&11,&44,&44
defb &50,&40,&00,&AA,&BB,&33,&22,&99,&44,&AA
defb &AA,&22,&AA,&88,&55,&00,&22,&88,&55,&55
defb &11,&55,&44,&AA,&55,&33,&33,&55,&54,&10
defb &00,&AA,&BB,&33,&22,&99,&44,&AA,&AA,&AA
defb &AA,&CC,&DD,&00,&22,&CC,&DD,&55,&55,&55
defb &44,&AA,&55,&33,&33,&55,&44,&00,&40,&CC
defb &33,&33,&22,&99,&44,&AA,&AA,&BB,&99,&77
defb &AA,&00,&11,&77,&AA,&77,&55,&55,&44,&AA
defb &55,&33,&33,&00,&DC,&50,&00,&CC,&77,&33
defb &33,&11,&44,&CC,&AA,&BB,&00,&88,&44,&00
defb &00,&88,&44,&33,&55,&44,&CC,&AA,&33,&33
defb &33,&88,&CC,&00,&40,&DD,&66,&33,&33,&55
defb &55,&44,&CC,&BB,&40,&77,&98,&00,&00,&77
defb &98,&33,&44,&CC,&AA,&AA,&BB,&33,&11,&AA
defb &DC,&50,&00,&33,&22,&CC,&AA,&AA,&BB,&33
defb &11,&AA,&CC,&00,&00,&DD,&66,&33,&33,&55
defb &55,&44,&DD,&33,&00,&33,&DC,&22,&AA,&CC
defb &AA,&EE,&BB,&55,&11,&AA,&54,&50,&40,&99
defb &66,&22,&BB,&55,&DD,&44,&DD,&55,&40,&FF
defb &00,&00,&00,&11,&CC,&33,&AA,&CC,&EE,&66
defb &BB,&55,&11,&AA,&44,&00,&00,&99,&66,&22
defb &BB,&55,&99,&CC,&DD,&77,&00,&EE,&00,&40
defb &DC,&11,&AA,&CC,&66,&66,&BB,&55,&11,&AA
defb &54,&50,&40,&99,&66,&22,&BB,&55,&99,&88
defb &DD,&66,&40,&CC,&00,&00,&CC,&11,&AA,&DD
defb &66,&66,&99,&55,&88,&88,&44,&00,&00,&88
defb &44,&66,&AA,&55,&99,&AA,&DD,&66,&00,&CC
defb &00,&40,&EE,&51,&AA,&55,&66,&66,&99,&55
defb &88,&98,&54,&50,&40,&98,&44,&66,&AA,&55
defb &99,&AA,&99,&66,&51,&DC,&00,&00,&66,&11
defb &99,&55,&66,&66,&99,&55,&88,&88,&44,&66
defb &AA,&55,&99,&AA,&AA,&66,&11,&88,&00,&44
defb &AA,&55,&99,&22,&AA,&44,&11,&98,&50,&00
defb &00,&50,&66,&40,&99,&55,&22,&66,&99,&44
defb &88,&10,&33,&00,&88,&55,&22,&22,&99,&00
defb &88,&00,&00,&44,&22,&55,&11,&22,&88,&44
defb &33,&00,&40,&44,&22,&55,&51,&00,&88,&98
defb &33,&50,&50,&00,&00,&50,&33,&40,&54,&44
defb &22,&22,&99,&00,&88,&10,&11,&00,&44,&44
defb &22,&22,&99,&00,&22,&55,&11,&00,&88,&88
defb &22,&00,&40,&00,&22,&11,&51,&40,&88,&98
defb &22,&50,&50,&00,&00,&50,&51,&50,&54,&54
defb &22,&22,&11,&00,&00,&10,&11,&00,&00,&44
defb &00,&22,&11,&00,&40,&00,&00,&51,&50,&40
defb &98,&50,&00,&50,&50,&00,&00,&50,&40,&50
defb &50,&54,&50,&22,&40,&00,&00,&10,&50,&22
defb &50,&00,&00,&10,&00,&99,&22,&00,&11,&EE
defb &33,&88,&77,&11,&EE,&00,&11,&22,&44,&00
defb &00,&11,&66,&00,&22,&22,&22,&00,&00,&55
defb &44,&00,&00,&AA,&88,&00,&11,&11,&11,&00
defb &11,&88,&00,&DD,&AA,&FF,&FF,&FF,&88,&00
defb &66,&00,&11,&22,&44,&00,&00,&99,&22,&00
defb &11,&88,&00,&33,&FF,&FF,&DD,&66,&CC,&00
defb &EE,&00,&00,&AA,&88,&00,&00,&11,&88,&22
defb &EE,&DD,&66,&88,&00,&55,&44,&00,&11,&CC
defb &55,&AA,&DD,&DD,&00,&66,&33,&88,&33,&BB
defb &55,&EE,&EE,&00,&CC,&77,&00,&33,&88,&CC
defb &11,&DD,&EE,&BB,&00,&11,&CC,&00,&77,&33
defb &00,&22,&FF,&AA,&DD,&88,&11,&88,&00,&BB
defb &CC,&00,&00,&FF,&44,&00,&66,&00,&66,&DD
defb &77,&DD,&00,&33,&33,&88,&00,&EE,&44,&00
defb &00,&66,&AA,&EE,&CC,&11,&88,&55,&BB,&11
defb &44,&CC,&77,&00,&33,&88,&CC,&AA,&33,&66
defb &88,&66,&00,&DD,&DD,&55,&88,&00,&00,&88
defb &88,&00,&55,&00,&DD,&66,&BB,&00,&00,&77
defb &88,&00,&00,&77,&88,&00,&33,&55,&AA,&CC
defb &22,&88,&00,&77,&00,&55,&44,&66,&11,&CC
defb &EE,&11,&88,&AA,&88,&33,&EE,&AA,&55,&00
defb &BB,&99,&CC,&33,&00,&22,&00,&11,&00,&33
defb &00,&EE,&77,&44,&22,&99,&55,&CC,&00,&33
defb &33,&CC,&00,&88,&44,&00,&00,&88,&44,&00
defb &FF,&33,&22,&BB,&44,&11,&CC,&88,&00,&CC
defb &11,&77,&AA,&00,&11,&77,&AA,&00,&CC,&00
defb &44,&EE,&00,&BB,&55,&33,&BB,&88,&CC,&11
defb &88,&00,&00,&66,&00,&CC,&77,&77,&00,&BB
defb &11,&88,&00,&DD,&99,&55,&AA,&CC,&DD,&00
defb &22,&CC,&DD,&66,&AA,&66,&CC,&00,&66,&33
defb &44,&22,&AA,&AA,&CC,&40,&44,&50,&40,&88
defb &40,&DD,&55,&55,&44,&AA,&33,&99,&44,&DD
defb &99,&99,&AA,&88,&55,&00,&22,&88,&55,&66
defb &66,&66,&CC,&AA,&77,&11,&44,&BB,&AA,&AA
defb &AA,&00,&22,&00,&11,&00,&11,&55,&55,&77
defb &55,&AA,&AA,&99,&44,&DD,&88,&CC,&AA,&88
defb &55,&00,&22,&88,&55,&44,&CC,&66,&CC,&AA
defb &55,&55,&66,&AA,&AA,&AA,&AA,&50,&11,&50
defb &22,&50,&51,&55,&55,&55,&66,&77,&55,&AA
defb &BB,&99,&88,&BB,&11,&22,&22,&CC,&DD,&00
defb &22,&CC,&DD,&11,&22,&33,&44,&66,&77,&55
defb &66,&BB,&99,&AA,&AA,&00,&66,&AA,&55,&AA
defb &AA,&99,&AA,&AA,&11,&CC,&99,&77,&AA,&00
defb &11,&77,&AA,&44,&EE,&11,&55,&66,&55,&55
defb &66,&99,&55,&AA,&AA,&50,&66,&EE,&55,&AA
defb &BB,&99,&AA,&AA,&99,&55,&88,&88,&44,&00
defb &00,&88,&44,&66,&AA,&55,&55,&66,&77,&55
defb &66,&99,&DD,&AA,&66,&00,&66,&AA,&DD,&66
defb &AA,&BB,&AA,&AA,&99,&DD,&99,&77,&98,&00
defb &00,&77,&AA,&66,&EE,&55,&55,&77,&55,&55
defb &AA,&DD,&55,&AA,&66,&50,&66,&66,&BB,&55
defb &55,&55,&33,&88,&BB,&55,&DD,&99,&22,&00
defb &11,&22,&66,&EE,&BB,&44,&77,&22,&AA,&AA
defb &BB,&55,&99,&88,&66,&AA,&BB,&55,&55,&33
defb &AA,&AA,&BB,&DD,&99,&66,&50,&00,&00,&51
defb &AA,&66,&FF,&55,&55,&77,&22,&AA,&BB,&55
defb &55,&99,&22,&50,&EE,&22,&DD,&55,&55,&55
defb &33,&AA,&BB,&55,&DD,&99,&22,&00,&11,&22
defb &66,&EE,&BB,&55,&77,&22,&AA,&AA,&AA,&DD
defb &11,&CC,&AA,&AA,&BB,&55,&55,&33,&00,&CC
defb &BB,&99,&11,&54,&50,&00,&00,&40,&AA,&22
defb &77,&44,&CC,&33,&22,&AA,&BB,&55,&55,&55
defb &11,&50,&FF,&22,&55,&44,&DD,&33,&33,&AA
defb &BB,&55,&DD,&44,&99,&00,&22,&44,&AA,&EE
defb &BB,&55,&77,&33,&22,&CC,&AA,&99,&33,&CC
defb &22,&DD,&33,&99,&22,&98,&50,&00,&00,&40
defb &55,&22,&77,&22,&DD,&22,&77,&11,&33,&22
defb &DD,&33,&BB,&AA,&66,&BB,&88,&CC,&99,&00
defb &22,&44,&CC,&77,&55,&99,&77,&77,&22,&DD
defb &33,&22,&33,&88,&DC,&55,&55,&AA,&66,&55
defb &22,&DD,&33,&22,&22,&98,&50,&00,&00,&50
defb &55,&51,&33,&22,&DD,&22,&99,&99,&66,&AA
defb &88,&CC,&00,&50,&33,&11,&33,&22,&CC,&BB
defb &99,&99,&66,&BB,&88,&44,&88,&77,&55,&AA
defb &66,&77,&44,&DD,&33,&22,&33,&00,&50,&40
defb &98,&33,&55,&AA,&66,&55,&44,&99,&33,&22
defb &55,&50,&50,&00,&00,&50,&22,&99,&33,&22
defb &44,&AA,&99,&99,&66,&BB,&10,&54,&11,&99
defb &11,&22,&44,&BB,&99,&55,&66,&99,&00,&44
defb &88,&22,&55,&AA,&AA,&77,&44,&99,&22,&22
defb &66,&00,&50,&40,&98,&22,&11,&AA,&EE,&66
defb &44,&99,&22,&44,&44,&50,&50,&00,&00,&50
defb &40,&88,&99,&22,&44,&99,&99,&DD,&66,&11
defb &50,&54,&00,&88,&99,&22,&44,&99,&99,&55
defb &22,&11,&00,&22,&11,&22,&AA,&66,&44,&99
defb &22,&44,&44,&00,&50,&22,&51,&22,&CC,&66
defb &44,&99,&22,&44,&98,&50,&50,&00,&00,&50
defb &40,&44,&99,&22,&44,&99,&88,&DD,&22,&11
defb &00,&44,&11,&22,&44,&99,&88,&DD,&22,&11
defb &00,&22,&11,&22,&CC,&66,&44,&99,&22,&00
defb &88,&00,&50,&22,&51,&22,&DC,&66,&00,&88
defb &22,&40,&10,&50,&50,&00,&00,&50,&50,&10
defb &51,&00,&44,&11,&88,&DD,&22,&11,&11,&00
defb &44,&11,&88,&44,&22,&00,&11,&00,&88,&66
defb &00,&88,&22,&00,&40,&50,&54,&40,&98,&44
defb &22,&10,&51,&00,&98,&44,&40,&98,&00,&50
defb &50,&40,&10,&44,&22,&10,&00,&99,&22,&00
defb &00,&22,&11,&00,&88,&00,&00,&55,&44,&00
defb &00,&11,&11,&11,&00,&11,&22,&44,&00,&11
defb &FF,&00,&33,&CC,&33,&00,&44,&22,&11,&00
defb &22,&11,&00,&88,&33,&00,&33,&00,&22,&22
defb &22,&00,&00,&EE,&00,&33,&88,&55,&BB,&55
defb &BB,&FF,&FF,&FF,&EE,&00,&11,&FF,&FF,&FF
defb &FF,&66,&BB,&66,&88,&77,&00,&11,&CC,&00
defb &11,&11,&11,&00,&33,&00,&77,&00,&11,&DD
defb &BB,&66,&BB,&FF,&CC,&00,&77,&00,&11,&22
defb &44,&00,&00,&99,&22,&00,&33,&88,&00,&FF
defb &FF,&55,&BB,&66,&EE,&00,&33,&88,&66,&00
defb &00,&88,&88,&CC,&11,&BB,&55,&BB,&DD,&CC
defb &00,&33,&88,&00,&EE,&FF,&66,&BB,&66,&00
defb &CC,&44,&44,&00,&11,&88,&33,&11,&BB,&BB
defb &66,&BB,&CC,&22,&AA,&88,&22,&FF,&CC,&00
defb &00,&FF,&DD,&00,&55,&55,&00,&FF,&55,&BB
defb &77,&66,&33,&00,&AA,&00,&FF,&77,&00,&77
defb &BB,&00,&33,&88,&00,&BB,&22,&DD,&77,&77
defb &FF,&88,&77,&FF,&BB,&AA,&DD,&33,&44,&00
defb &77,&00,&33,&77,&88,&33,&BB,&CC,&11,&44
defb &66,&00,&00,&55,&BB,&77,&00,&FF,&00,&11
defb &EE,&88,&AA,&DD,&77,&88,&33,&CC,&FF,&00
defb &77,&AA,&DD,&44,&55,&EE,&00,&33,&CC,&33
defb &BB,&66,&88,&00,&11,&88,&CC,&00,&77,&55
defb &BB,&00,&00,&77,&88,&00,&00,&77,&88,&00
defb &33,&66,&BB,&88,&00,&EE,&55,&AA,&22,&66
defb &AA,&DD,&11,&EE,&00,&22,&EE,&22,&DD,&55
defb &99,&11,&66,&99,&00,&77,&33,&88,&00,&88
defb &44,&00,&00,&88,&44,&00,&77,&33,&88,&33
defb &EE,&00,&DD,&99,&66,&66,&99,&55,&22,&FF
defb &00,&11,&88,&00,&50,&40,&00,&66,&00,&33
defb &DD,&22,&AA,&55,&99,&AA,&66,&CC,&11,&FF
defb &11,&88,&11,&77,&AA,&00,&11,&77,&AA,&00
defb &66,&00,&00,&11,&CC,&EE,&DD,&99,&66,&66
defb &DD,&55,&BB,&77,&88,&00,&00,&77,&BB,&66
defb &AA,&DD,&99,&AA,&66,&DD,&CC,&EE,&11,&77
defb &00,&BB,&AA,&CC,&DD,&00,&22,&CC,&DD,&77
defb &44,&33,&AA,&22,&22,&AA,&DD,&99,&BB,&33
defb &55,&55,&99,&33,&CC,&50,&00,&00,&50,&40
defb &00,&00,&40,&FF,&22,&66,&AA,&BB,&33,&66
defb &66,&DD,&55,&11,&55,&BB,&55,&77,&44,&33
defb &AA,&88,&55,&00,&22,&88,&55,&77,&00,&BB
defb &AA,&BB,&66,&AA,&DD,&99,&BB,&33,&55,&55
defb &99,&88,&EE,&00,&11,&CC,&66,&66,&AA,&BB
defb &33,&66,&66,&DD,&AA,&AA,&55,&99,&BB,&33
defb &55,&22,&88,&88,&33,&10,&00,&00,&55,&44
defb &22,&88,&55,&00,&22,&88,&55,&00,&50,&40
defb &00,&00,&33,&00,&44,&55,&22,&BB,&33,&66
defb &66,&99,&44,&EE,&22,&CC,&DD,&00,&22,&CC
defb &DD,&11,&CC,&99,&AA,&99,&AA,&AA,&55,&99
defb &BB,&11,&55,&22,&88,&CC,&11,&88,&66,&00
defb &CC,&55,&22,&AA,&33,&66,&66,&99,&DD,&66
defb &99,&11,&11,&77,&AA,&00,&11,&77,&AA,&22
defb &22,&55,&AA,&DD,&AA,&AA,&55,&88,&DD,&11
defb &55,&22,&88,&44,&40,&54,&00,&00,&50,&40
defb &00,&00,&88,&40,&98,&55,&22,&AA,&22,&CC
defb &66,&99,&55,&66,&55,&BB,&55,&66,&DD,&66
defb &99,&66,&00,&88,&44,&00,&00,&88,&44,&11
defb &AA,&55,&AA,&DD,&AA,&BB,&66,&AA,&DD,&99
defb &55,&22,&88,&66,&00,&11,&88,&55,&22,&AA
defb &66,&DD,&AA,&DD,&66,&AA,&DD,&99,&55,&22
defb &98,&22,&22,&77,&98,&00,&00,&77,&99,&51
defb &50,&40,&00,&00,&50,&11,&10,&55,&22,&AA
defb &66,&DD,&55,&AA,&DD,&66,&33,&00,&BB,&55
defb &AA,&55,&AA,&DD,&66,&AA,&DD,&99,&55,&99
defb &88,&11,&00,&22,&00,&66,&66,&AA,&66,&DD
defb &55,&AA,&DD,&66,&99,&66,&BB,&44,&33,&00
defb &AA,&DD,&66,&AA,&66,&99,&55,&99,&98,&40
defb &50,&40,&00,&00,&50,&00,&50,&66,&66,&AA
defb &55,&99,&55,&AA,&DD,&66,&BB,&66,&BB,&54
defb &33,&DC,&50,&00,&00,&40,&FF,&40,&DD,&00
defb &DD,&55,&BB,&55,&AA,&DD,&22,&BB,&66,&99
defb &55,&99,&88,&00,&00,&66,&66,&AA,&55,&BB
defb &55,&22,&DD,&66,&BB,&66,&AA,&CC,&22,&CC
defb &55,&22,&DD,&55,&BB,&44,&AA,&DC,&22,&DC
defb &50,&00,&00,&40,&DD,&40,&DD,&44,&BB,&66
defb &AA,&DD,&22,&BB,&66,&99,&44,&88,&98,&50
defb &40,&44,&44,&AA,&55,&BB,&DD,&00,&DD,&44
defb &BB,&66,&AA,&DD,&22,&BB,&66,&99,&44,&88
defb &44,&00,&00,&88,&44,&AA,&55,&BB,&55,&22
defb &DD,&55,&BB,&44,&AA,&CC,&22,&CC,&99,&55
defb &BB,&55,&AA,&DC,&22,&98,&50,&00,&00,&40
defb &55,&40,&DD,&66,&BB,&66,&AA,&77,&22,&BB
defb &22,&99,&44,&98,&54,&50,&50,&40,&00,&00
defb &50,&50,&40,&98,&44,&AA,&55,&00,&DD,&66
defb &BB,&66,&AA,&77,&22,&BB,&22,&99,&44,&88
defb &44,&00,&99,&55,&BB,&55,&AA,&CC,&22,&88
defb &55,&11,&99,&55,&BB,&55,&AA,&DC,&22,&98
defb &50,&00,&00,&50,&55,&00,&DD,&66,&BB,&66
defb &AA,&66,&22,&AA,&33,&99,&44,&98,&54,&50
defb &40,&98,&44,&AA,&77,&11,&AA,&66,&22,&AA
defb &33,&99,&44,&88,&44,&00,&00,&88,&44,&AA
defb &77,&11,&55,&11,&99,&55,&BB,&55,&BB,&44
defb &55,&88,&22,&AA,&33,&99,&88,&54,&54,&50
defb &BB,&54,&55,&98,&50,&00,&00,&50,&66,&88
defb &BB,&66,&50,&40,&00,&00,&50,&50,&40,&88
defb &88,&66,&77,&51,&55,&11,&33,&22,&33,&00
defb &88,&44,&44,&00,&99,&55,&99,&44,&BB,&44
defb &33,&00,&88,&DD,&99,&CC,&99,&54,&66,&50
defb &50,&00,&00,&50,&11,&88,&AA,&44,&EE,&66
defb &CC,&44,&33,&22,&33,&40,&98,&54,&54,&50
defb &40,&88,&98,&54,&33,&51,&11,&88,&AA,&44
defb &EE,&66,&CC,&44,&33,&22,&33,&00,&88,&00
defb &44,&00,&00,&88,&00,&44,&33,&11,&33,&00
defb &88,&DD,&99,&CC,&99,&44,&66,&00,&22,&00
defb &88,&DD,&88,&CC,&99,&54,&66,&50,&50,&00
defb &00,&50,&51,&88,&AA,&44,&CC,&66,&DC,&44
defb &11,&22,&33,&40,&98,&50,&10,&50,&40,&10
defb &50,&54,&33,&51,&11,&88,&EE,&44,&CC,&66
defb &CC,&44,&11,&22,&33,&00,&88,&00,&00,&44
defb &33,&11,&22,&00,&88,&DD,&88,&CC,&99,&CC
defb &66,&00,&33,&40,&22,&00,&88,&44,&88,&CC
defb &55,&DC,&44,&50,&50,&00,&00,&50,&40,&88
defb &EE,&88,&DC,&44,&88,&44,&11,&00,&33,&40
defb &98,&50,&00,&88,&CC,&88,&CC,&44,&88,&88
defb &11,&00,&22,&00,&11,&00,&22,&00,&44,&44
defb &88,&CC,&44,&CC,&44,&00,&54,&44,&88,&54
defb &44,&DC,&54,&50,&50,&00,&00,&50,&40,&88
defb &CC,&88,&88,&44,&88,&88,&00,&10,&22,&50
defb &40,&50,&40,&00,&54,&22,&54,&44,&44,&98
defb &10,&50,&50,&00,&00,&50,&40,&00,&44,&88
defb &88,&99,&00,&88,&00,&10,&00,&50,&44,&99
defb &50,&51,&50,&00,&00,&10,&40,&00,&10,&22
defb &50,&22,&44,&98
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
save direct "T31-SC4.D03",&4000,LevelEnd-&4000	;address,size...}[,exec_address]