
ifdef BuildCPC
	ld (Background_CompiledSprite_Minus1+1),de
Endif

call Akuyou_ScreenBuffer_GetActiveScreen



ld h,a
ld l,&50
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
jp PicLevel8Cpng

PicLevel8Cpng:
LD IX,PicLevel8Cpng_DrawOrder
JP JumpToNextLine


PicLevel8Cpng_Line_0:
call BitmapPush20
defw BitmapData+19
LD DE,&0000
call MultiPushDe20
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_1:
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe18
LD HL,&0200
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
jp NextLine


PicLevel8Cpng_Line_2:
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe20
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_1_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_1
PicLevel8Cpng_Line_2_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_2
PicLevel8Cpng_Line_5:
LD DE,&F0F0
call MultiPushDe10
call BitmapPush8
defw BitmapData+27
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+35
LD DE,&0F0F
call MultiPushDe10
jp NextLine


PicLevel8Cpng_Line_6:
call BitmapPush18
defw BitmapData+18
LD DE,&0000
call MultiPushDe22
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_7:
  PUSH DE
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe18
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_8:
  PUSH DE
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe22
LD HL,&0200
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_7_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_7
PicLevel8Cpng_Line_8_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_8
PicLevel8Cpng_Line_12:
call BitmapPush24
defw BitmapData+59
LD DE,&0000
call MultiPushDe16
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_13:
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
call MultiPushDe14
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
jp NextLine


PicLevel8Cpng_Line_14:
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe16
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_13_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_13
PicLevel8Cpng_Line_14_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_14
PicLevel8Cpng_Line_17:
LD DE,&F0F0
call MultiPushDe10
call BitmapPush8
defw BitmapData+67
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+75
LD DE,&0F0F
call MultiPushDe10
jp NextLine


PicLevel8Cpng_Line_23:
LD DE,&F0F0
call MultiPushDe9
call BitmapPush10
defw BitmapData+85
LD DE,&0000
call MultiPushDe12
call BitmapPush10
defw BitmapData+95
LD DE,&0F0F
call MultiPushDe9
jp NextLine


PicLevel8Cpng_Line_29:
LD DE,&F0F0
call MultiPushDe9
LD DE,&E0E0
  PUSH DE
  PUSH DE
LD DE,&2020
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe14
LD DE,&0404
  PUSH DE
  PUSH DE
LD DE,&0707
  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe9
jp NextLine


PicLevel8Cpng_Line_30:
call BitmapPush20
defw BitmapData+56
LD DE,&0000
call MultiPushDe20
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
jp NextLine


PicLevel8Cpng_Line_32:
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
call MultiPushDe20
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
jp NextLine


PicLevel8Cpng_Line_32_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_32
PicLevel8Cpng_Line_35:
LD DE,&F0F0
call MultiPushDe8
call BitmapPush6
defw BitmapData+101
LD DE,&2020
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe14
LD DE,&0404
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+107
LD DE,&0F0F
call MultiPushDe8
jp NextLine


PicLevel8Cpng_Line_36:
call BitmapPush20
defw BitmapData+55
LD DE,&0000
call MultiPushDe20
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_37:
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe14
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_38:
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe20
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_37_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_37
PicLevel8Cpng_Line_38_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_38
PicLevel8Cpng_Line_41:
LD DE,&F0F0
call MultiPushDe7
LD HL,&F0E0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&2020
  PUSH DE
  PUSH DE
LD BC,&2000
  Push BC
Ld D,C
Ld E,C

call MultiPushDe14
LD HL,&0004
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0707
  PUSH DE
  PUSH DE
LD BC,&070F
  Push BC
Ld D,C
Ld E,C

call MultiPushDe7
jp NextLine


PicLevel8Cpng_Line_42:
call BitmapPush18
defw BitmapData+54
LD DE,&0000
call MultiPushDe22
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_43:
  PUSH DE
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe16
LD HL,&0400
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_44:
  PUSH DE
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe22
LD HL,&0400
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_43_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_43
PicLevel8Cpng_Line_44_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_44
PicLevel8Cpng_Line_47:
LD DE,&F0F0
call MultiPushDe6
LD DE,&E0E0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&E020
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe16
LD DE,&0404
  PUSH DE
  PUSH DE
LD BC,&0407
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0F0F
call MultiPushDe6
jp NextLine


PicLevel8Cpng_Line_48:
call BitmapPush18
defw BitmapData+125
LD DE,&0000
call MultiPushDe22
LD HL,&0008
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_49:
LD HL,&0010
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe28
LD HL,&0008
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_50:
LD HL,&0010
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe22
LD HL,&0008
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_51:
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
Ld B,E
Ld C,H

  Push BC
call MultiPushDe32
LD HL,&0800
  Push HL

Ld C,H

  Push BC
 jp NextLinePushDe2


PicLevel8Cpng_Line_50_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_50
PicLevel8Cpng_Line_53:
LD HL,&A0E0
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
LD BC,&E020
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe16
LD BC,&0004
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0407
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
LD BC,&0705
  Push BC
jp NextLine


PicLevel8Cpng_Line_54:
call BitmapPush16
defw BitmapData+141
LD DE,&0000
call MultiPushDe24
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_55:
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe18
LD HL,&0400
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
jp NextLine


PicLevel8Cpng_Line_56:
  PUSH DE
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
call MultiPushDe24
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_55_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_55
PicLevel8Cpng_Line_58:
  PUSH DE
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe26
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_59:
LD HL,&A0A0
  Push HL
LD BC,&A0E0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD DE,&2020
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
Ld D,L
Ld E,L

call MultiPushDe18
LD BC,&0004
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0707
call MultiPushDe5
LD HL,&0705
  Push HL
Ld B,L
Ld C,L

  Push BC
jp NextLine


PicLevel8Cpng_Line_60:
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
call MultiPushDe28
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
 jp NextLinePushDe2


PicLevel8Cpng_Line_61:
  PUSH DE
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe18
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_62:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
call MultiPushDe28
LD HL,&0400
  Push HL

Ld C,H

  Push BC
 jp NextLinePushDe4


PicLevel8Cpng_Line_64:
call MultiPushDe40
jp NextLine


PicLevel8Cpng_Line_65:
LD DE,&2020
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&A020
  Push HL
call MultiPushDe6
LD DE,&0000
call MultiPushDe20
LD DE,&0404
call MultiPushDe6
LD BC,&0405
  Push BC
 jp NextLinePushDe3


PicLevel8Cpng_Line_66:
LD DE,&0000
call MultiPushDe40
jp NextLine


PicLevel8Cpng_Line_64_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_64
PicLevel8Cpng_Line_71:
LD DE,&2020
call MultiPushDe9
LD DE,&0000
call MultiPushDe22
LD DE,&0404
call MultiPushDe9
jp NextLine


PicLevel8Cpng_Line_73:
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe24
LD HL,&0400
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
jp NextLine


PicLevel8Cpng_Line_73_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_73
PicLevel8Cpng_Line_77:
LD DE,&2020
call MultiPushDe7
LD DE,&0000
call MultiPushDe26
LD DE,&0404
call MultiPushDe7
jp NextLine


PicLevel8Cpng_Line_79:
  PUSH DE
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe28
LD HL,&0400
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_81:
  PUSH DE
  PUSH DE
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
call MultiPushDe30
LD HL,&0004
  Push HL
  PUSH DE
Ld B,L


  Push BC
 jp NextLinePushDe2


PicLevel8Cpng_Line_118:
  PUSH DE
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
call MultiPushDe30
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L


  Push BC
 jp NextLinePushDe2


PicLevel8Cpng_Line_120:
  PUSH DE
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe28
LD HL,&4000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_122:
LD DE,&0202
call MultiPushDe7
LD DE,&0000
call MultiPushDe26
LD DE,&4040
call MultiPushDe7
jp NextLine


PicLevel8Cpng_Line_124:
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe24
LD HL,&4000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
jp NextLine


PicLevel8Cpng_Line_124_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_124
PicLevel8Cpng_Line_128:
LD DE,&0202
call MultiPushDe9
LD DE,&0000
call MultiPushDe22
LD DE,&4040
call MultiPushDe9
jp NextLine


PicLevel8Cpng_Line_134:
LD DE,&0202
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0A02
  Push HL
call MultiPushDe6
LD DE,&0000
call MultiPushDe20
LD DE,&4040
call MultiPushDe6
LD BC,&4050
  Push BC
 jp NextLinePushDe3


PicLevel8Cpng_Line_136:
  PUSH DE
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe22
LD HL,&4000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_137:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
call MultiPushDe28
LD HL,&4000
  Push HL

Ld C,H

  Push BC
 jp NextLinePushDe4


PicLevel8Cpng_Line_138:
  PUSH DE
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe18
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_139:
  PUSH DE
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
call MultiPushDe28
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
 jp NextLinePushDe2


PicLevel8Cpng_Line_140:
LD HL,&0A0A
  Push HL
LD BC,&0A0E
  Push BC
Ld D,C
Ld E,C

call MultiPushDe5
LD DE,&0202
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0200
  Push HL
Ld D,L
Ld E,L

call MultiPushDe18
LD BC,&0040
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&7070
call MultiPushDe5
LD HL,&7050
  Push HL
Ld B,L
Ld C,L

  Push BC
jp NextLine


PicLevel8Cpng_Line_141:
call BitmapPush14
defw BitmapData+155
LD DE,&0000
call MultiPushDe26
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_142:
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe18
LD HL,&4000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
jp NextLine


PicLevel8Cpng_Line_143:
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
call MultiPushDe24
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_142_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_142
PicLevel8Cpng_Line_143_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_143
PicLevel8Cpng_Line_146:
LD HL,&0A0E
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
LD BC,&0E02
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&0200
  Push HL
Ld D,L
Ld E,L

call MultiPushDe16
LD BC,&0040
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&4070
  Push HL
Ld D,L
Ld E,L

call MultiPushDe7
LD BC,&7050
  Push BC
jp NextLine


PicLevel8Cpng_Line_147:
call BitmapPush18
defw BitmapData+173
LD DE,&0000
call MultiPushDe22
LD HL,&0080
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_148:
  PUSH DE
  PUSH DE
LD HL,&0100
  Push HL
Ld B,E
Ld C,H

  Push BC
call MultiPushDe32
LD HL,&8000
  Push HL

Ld C,H

  Push BC
 jp NextLinePushDe2


PicLevel8Cpng_Line_149:
LD HL,&0001
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe22
LD HL,&0080
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_150:
LD HL,&0001
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe28
LD HL,&0080
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_149_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_149
PicLevel8Cpng_Line_152:
LD DE,&0F0F
call MultiPushDe6
LD DE,&0E0E
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0E02
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe16
LD DE,&4040
  PUSH DE
  PUSH DE
LD BC,&4070
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe6
jp NextLine


PicLevel8Cpng_Line_153:
call BitmapPush18
defw BitmapData+191
LD DE,&0000
call MultiPushDe22
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_154:
  PUSH DE
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe16
LD HL,&4000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_136_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_136
PicLevel8Cpng_Line_154_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_154
PicLevel8Cpng_Line_158:
LD DE,&0F0F
call MultiPushDe7
LD HL,&0F0E
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&0202
  PUSH DE
  PUSH DE
LD BC,&0200
  Push BC
Ld D,C
Ld E,C

call MultiPushDe14
LD HL,&0040
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD DE,&7070
  PUSH DE
  PUSH DE
LD BC,&70F0
  Push BC
Ld D,C
Ld E,C

call MultiPushDe7
jp NextLine


PicLevel8Cpng_Line_159:
call BitmapPush20
defw BitmapData+211
LD DE,&0000
call MultiPushDe20
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_160:
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe14
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_161:
LD HL,&0200
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe20
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_160_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_160
PicLevel8Cpng_Line_161_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_161
PicLevel8Cpng_Line_164:
LD DE,&0F0F
call MultiPushDe8
call BitmapPush6
defw BitmapData+217
LD DE,&0202
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe14
LD DE,&4040
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+223
LD DE,&F0F0
call MultiPushDe8
jp NextLine


PicLevel8Cpng_Line_165:
call BitmapPush20
defw BitmapData+243
LD DE,&0000
call MultiPushDe20
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
jp NextLine


PicLevel8Cpng_Line_166:
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
call MultiPushDe14
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
jp NextLine


PicLevel8Cpng_Line_167:
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
call MultiPushDe20
LD HL,&4000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
jp NextLine


PicLevel8Cpng_Line_166_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_166
PicLevel8Cpng_Line_167_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_167
PicLevel8Cpng_Line_170:
LD DE,&0F0F
call MultiPushDe9
LD DE,&0E0E
  PUSH DE
  PUSH DE
LD DE,&0202
  PUSH DE
  PUSH DE
LD DE,&0000
call MultiPushDe14
LD DE,&4040
  PUSH DE
  PUSH DE
LD DE,&7070
  PUSH DE
  PUSH DE
LD DE,&F0F0
call MultiPushDe9
jp NextLine


PicLevel8Cpng_Line_171:
call BitmapPush18
defw BitmapData+261
LD DE,&0000
call MultiPushDe22
LD HL,&2000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_172:
  PUSH DE
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe18
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_173:
  PUSH DE
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe22
LD HL,&2000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
jp NextLine


PicLevel8Cpng_Line_172_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_172
PicLevel8Cpng_Line_173_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_173
PicLevel8Cpng_Line_176:
LD DE,&0F0F
call MultiPushDe9
call BitmapPush10
defw BitmapData+271
LD DE,&0000
call MultiPushDe12
call BitmapPush10
defw BitmapData+281
LD DE,&F0F0
call MultiPushDe9
jp NextLine


PicLevel8Cpng_Line_177:
call BitmapPush20
defw BitmapData+301
LD DE,&0000
call MultiPushDe20
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_178:
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
call MultiPushDe18
LD HL,&2000
  Push HL

Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
jp NextLine


PicLevel8Cpng_Line_179:
LD HL,&0400
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
  Push BC
  PUSH DE
  Push HL 
call MultiPushDe20
LD HL,&0020
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
jp NextLine


PicLevel8Cpng_Line_178_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_178
PicLevel8Cpng_Line_179_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_179
PicLevel8Cpng_Line_182:
LD DE,&0F0F
call MultiPushDe10
call BitmapPush8
defw BitmapData+309
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+317
LD DE,&F0F0
call MultiPushDe10
jp NextLine


PicLevel8Cpng_Line_183:
call BitmapPush24
defw BitmapData+341
LD DE,&0000
call MultiPushDe16
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_185:
LD HL,&0002
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
call MultiPushDe16
LD HL,&0040
  Push HL
  PUSH DE
Ld B,L


  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
  Push HL 
  PUSH DE
  Push BC
jp NextLine


PicLevel8Cpng_Line_185_Reuse:
LD DE,&0000
JP PicLevel8Cpng_Line_185
PicLevel8Cpng_Line_188:
LD DE,&0F0F
call MultiPushDe10
call BitmapPush8
defw BitmapData+349
LD DE,&0000
call MultiPushDe12
call BitmapPush8
defw BitmapData+357
LD DE,&F0F0
call MultiPushDe10
jp NextLine



PicLevel8Cpng_DrawOrder: 

  DEFW PicLevel8Cpng_Line_0
  DEFW PicLevel8Cpng_Line_1
  DEFW PicLevel8Cpng_Line_2
  DEFW PicLevel8Cpng_Line_1_Reuse
  DEFW PicLevel8Cpng_Line_2_Reuse
  DEFW PicLevel8Cpng_Line_5
  DEFW PicLevel8Cpng_Line_6
  DEFW PicLevel8Cpng_Line_7
  DEFW PicLevel8Cpng_Line_8
  DEFW PicLevel8Cpng_Line_7_Reuse
  DEFW PicLevel8Cpng_Line_8_Reuse
  DEFW PicLevel8Cpng_Line_5
  DEFW PicLevel8Cpng_Line_12
  DEFW PicLevel8Cpng_Line_13
  DEFW PicLevel8Cpng_Line_14
  DEFW PicLevel8Cpng_Line_13_Reuse
  DEFW PicLevel8Cpng_Line_14_Reuse
  DEFW PicLevel8Cpng_Line_17
  DEFW PicLevel8Cpng_Line_0
  DEFW PicLevel8Cpng_Line_1_Reuse
  DEFW PicLevel8Cpng_Line_2_Reuse
  DEFW PicLevel8Cpng_Line_1_Reuse
  DEFW PicLevel8Cpng_Line_2_Reuse
  DEFW PicLevel8Cpng_Line_23
  DEFW PicLevel8Cpng_Line_6
  DEFW PicLevel8Cpng_Line_7_Reuse
  DEFW PicLevel8Cpng_Line_8_Reuse
  DEFW PicLevel8Cpng_Line_7_Reuse
  DEFW PicLevel8Cpng_Line_8_Reuse
  DEFW PicLevel8Cpng_Line_29
  DEFW PicLevel8Cpng_Line_30
  DEFW PicLevel8Cpng_Line_13_Reuse
  DEFW PicLevel8Cpng_Line_32
  DEFW PicLevel8Cpng_Line_13_Reuse
  DEFW PicLevel8Cpng_Line_32_Reuse
  DEFW PicLevel8Cpng_Line_35
  DEFW PicLevel8Cpng_Line_36
  DEFW PicLevel8Cpng_Line_37
  DEFW PicLevel8Cpng_Line_38
  DEFW PicLevel8Cpng_Line_37_Reuse
  DEFW PicLevel8Cpng_Line_38_Reuse
  DEFW PicLevel8Cpng_Line_41
  DEFW PicLevel8Cpng_Line_42
  DEFW PicLevel8Cpng_Line_43
  DEFW PicLevel8Cpng_Line_44
  DEFW PicLevel8Cpng_Line_43_Reuse
  DEFW PicLevel8Cpng_Line_44_Reuse
  DEFW PicLevel8Cpng_Line_47
  DEFW PicLevel8Cpng_Line_48
  DEFW PicLevel8Cpng_Line_49
  DEFW PicLevel8Cpng_Line_50
  DEFW PicLevel8Cpng_Line_51
  DEFW PicLevel8Cpng_Line_50_Reuse
  DEFW PicLevel8Cpng_Line_53
  DEFW PicLevel8Cpng_Line_54
  DEFW PicLevel8Cpng_Line_55
  DEFW PicLevel8Cpng_Line_56
  DEFW PicLevel8Cpng_Line_55_Reuse
  DEFW PicLevel8Cpng_Line_58
  DEFW PicLevel8Cpng_Line_59
  DEFW PicLevel8Cpng_Line_60
  DEFW PicLevel8Cpng_Line_61
  DEFW PicLevel8Cpng_Line_62
  DEFW PicLevel8Cpng_Line_44_Reuse
  DEFW PicLevel8Cpng_Line_64
  DEFW PicLevel8Cpng_Line_65
  DEFW PicLevel8Cpng_Line_66
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_71
  DEFW PicLevel8Cpng_Line_66
  DEFW PicLevel8Cpng_Line_73
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_73_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_77
  DEFW PicLevel8Cpng_Line_66
  DEFW PicLevel8Cpng_Line_79
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_81
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_118
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_120
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_122
  DEFW PicLevel8Cpng_Line_66
  DEFW PicLevel8Cpng_Line_124
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_124_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_128
  DEFW PicLevel8Cpng_Line_66
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_64_Reuse
  DEFW PicLevel8Cpng_Line_134
  DEFW PicLevel8Cpng_Line_66
  DEFW PicLevel8Cpng_Line_136
  DEFW PicLevel8Cpng_Line_137
  DEFW PicLevel8Cpng_Line_138
  DEFW PicLevel8Cpng_Line_139
  DEFW PicLevel8Cpng_Line_140
  DEFW PicLevel8Cpng_Line_141
  DEFW PicLevel8Cpng_Line_142
  DEFW PicLevel8Cpng_Line_143
  DEFW PicLevel8Cpng_Line_142_Reuse
  DEFW PicLevel8Cpng_Line_143_Reuse
  DEFW PicLevel8Cpng_Line_146
  DEFW PicLevel8Cpng_Line_147
  DEFW PicLevel8Cpng_Line_148
  DEFW PicLevel8Cpng_Line_149
  DEFW PicLevel8Cpng_Line_150
  DEFW PicLevel8Cpng_Line_149_Reuse
  DEFW PicLevel8Cpng_Line_152
  DEFW PicLevel8Cpng_Line_153
  DEFW PicLevel8Cpng_Line_154
  DEFW PicLevel8Cpng_Line_136_Reuse
  DEFW PicLevel8Cpng_Line_154_Reuse
  DEFW PicLevel8Cpng_Line_136_Reuse
  DEFW PicLevel8Cpng_Line_158
  DEFW PicLevel8Cpng_Line_159
  DEFW PicLevel8Cpng_Line_160
  DEFW PicLevel8Cpng_Line_161
  DEFW PicLevel8Cpng_Line_160_Reuse
  DEFW PicLevel8Cpng_Line_161_Reuse
  DEFW PicLevel8Cpng_Line_164
  DEFW PicLevel8Cpng_Line_165
  DEFW PicLevel8Cpng_Line_166
  DEFW PicLevel8Cpng_Line_167
  DEFW PicLevel8Cpng_Line_166_Reuse
  DEFW PicLevel8Cpng_Line_167_Reuse
  DEFW PicLevel8Cpng_Line_170
  DEFW PicLevel8Cpng_Line_171
  DEFW PicLevel8Cpng_Line_172
  DEFW PicLevel8Cpng_Line_173
  DEFW PicLevel8Cpng_Line_172_Reuse
  DEFW PicLevel8Cpng_Line_173_Reuse
  DEFW PicLevel8Cpng_Line_176
  DEFW PicLevel8Cpng_Line_177
  DEFW PicLevel8Cpng_Line_178
  DEFW PicLevel8Cpng_Line_179
  DEFW PicLevel8Cpng_Line_178_Reuse
  DEFW PicLevel8Cpng_Line_179_Reuse
  DEFW PicLevel8Cpng_Line_182
  DEFW PicLevel8Cpng_Line_183
  DEFW PicLevel8Cpng_Line_166_Reuse
  DEFW PicLevel8Cpng_Line_185
  DEFW PicLevel8Cpng_Line_166_Reuse
  DEFW PicLevel8Cpng_Line_185_Reuse
  DEFW PicLevel8Cpng_Line_188
  DEFW PicLevel8Cpng_Line_171
  DEFW PicLevel8Cpng_Line_172_Reuse
  DEFW PicLevel8Cpng_Line_173_Reuse
  DEFW PicLevel8Cpng_Line_172_Reuse
  DEFW PicLevel8Cpng_Line_173_Reuse
  DEFW PicLevel8Cpng_Line_188
  DEFW PicLevel8Cpng_Line_177
  DEFW PicLevel8Cpng_Line_178_Reuse
  DEFW PicLevel8Cpng_Line_179_Reuse
  DEFW PicLevel8Cpng_Line_178_Reuse
  DEFW PicLevel8Cpng_Line_179_Reuse
  DEFW EndCode







;Global Code
EndCode:
ld sp,(StackRestore_Plus2-2)
ei
ret

MultiPushDe40: pop HL
jr MultiPushDe40B 
MultiPushDe32: pop HL
jr MultiPushDe32B 
MultiPushDe30: pop HL
jr MultiPushDe30B 
MultiPushDe28: pop HL
jr MultiPushDe28B 
MultiPushDe26: pop HL
jr MultiPushDe26B 
MultiPushDe24: pop HL
jr MultiPushDe24B 
MultiPushDe22: pop HL
jr MultiPushDe22B 
MultiPushDe20: pop HL
jr MultiPushDe20B 
MultiPushDe18: pop HL
jr MultiPushDe18B 
MultiPushDe16: pop HL
jr MultiPushDe16B 
MultiPushDe14: pop HL
jr MultiPushDe14B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
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
ld e,(iy)
inc iy
ld d,(iy)
inc iy
ld hl,&FFFF
add hl,sp
ex de,hl

ld b,&00
lddr
ex de,hl
ld sp,hl
inc sp

ld de,&0000 :BitmapPushDeRestore_Plus2

jp (iy)

BitmapPush24: ld c,&18
jr BitmapPush
BitmapPush20: ld c,&14
jr BitmapPush
BitmapPush18: ld c,&12
jr BitmapPush
BitmapPush16: ld c,&10
jr BitmapPush
BitmapPush14: ld c,&0E
jr BitmapPush
BitmapPush10: ld c,&0A
jr BitmapPush
BitmapPush8: ld c,&08
jr BitmapPush
BitmapPush6: ld c,&06
jr BitmapPush
NextLinePushDe4: push de
NextLinePushDe3: push de
NextLinePushDe2: push de
NextLinePushDe1: push de

NextLine: 

ifdef BuildCPC
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
endif
ifdef BuildENT
	ld hl,&00A0
	add hl,sp
	ei
	ld sp,&0000:StackRestore_Plus2
	di
	ld sp,hl

endif

JumpToNextLine: 
LD L,(IX)
INC IX
LD H,(IX)
INC IX
JP (HL)

CompiledSprite_GetNxtLinbc: defw &0000 :CompiledSprite_NextLineJumpBC_Plus2


BitmapData: 

defb &00,&40,&00,&00,&40,&00,&00,&40,&00,&00
defb &40,&00,&00,&40,&00,&00,&40,&00,&00,&40
defb &00,&20,&20,&20,&A0,&E0,&E0,&E0,&07,&07
defb &07,&05,&04,&04,&04,&00,&00,&20,&00,&00
defb &20,&00,&00,&20,&00,&00,&20,&00,&00,&20
defb &00,&00,&20,&00,&00,&20,&00,&00,&20,&00
defb &00,&20,&20,&20,&20,&E0,&E0,&E0,&07,&07
defb &07,&04,&04,&04,&04,&00,&00,&20,&20,&20
defb &20,&A0,&E0,&E0,&E0,&F0,&0F,&07,&07,&07
defb &05,&04,&04,&04,&04,&00,&20,&E0,&E0,&E0
defb &E0,&F0,&0F,&07,&07,&07,&07,&04,&00,&10
defb &00,&00,&10,&00,&00,&10,&00,&00,&10,&00
defb &00,&10,&00,&00,&10,&00,&20,&00,&00,&20
defb &00,&00,&20,&00,&00,&20,&00,&00,&20,&00
defb &00,&00,&00,&02,&00,&00,&02,&00,&00,&02
defb &00,&00,&02,&00,&00,&00,&00,&01,&00,&00
defb &01,&00,&00,&01,&00,&00,&01,&00,&00,&01
defb &00,&00,&01,&00,&02,&00,&00,&02,&00,&00
defb &02,&00,&00,&02,&00,&00,&02,&00,&00,&02
defb &00,&00,&00,&02,&00,&00,&02,&00,&00,&02
defb &00,&00,&02,&00,&00,&02,&00,&00,&02,&00
defb &00,&02,&02,&0E,&0E,&0E,&0E,&0F,&F0,&70
defb &70,&70,&70,&40,&02,&00,&00,&02,&00,&00
defb &02,&00,&00,&02,&00,&00,&02,&00,&00,&02
defb &00,&00,&02,&00,&04,&00,&00,&04,&00,&00
defb &04,&00,&00,&04,&00,&00,&04,&00,&00,&04
defb &00,&00,&00,&02,&02,&02,&02,&0A,&0E,&0E
defb &0E,&0F,&F0,&70,&70,&70,&50,&40,&40,&40
defb &40,&00,&00,&04,&00,&00,&04,&00,&00,&04
defb &00,&00,&04,&00,&00,&04,&00,&00,&04,&00
defb &00,&04,&00,&02,&02,&02,&02,&0E,&0E,&0E
defb &70,&70,&70,&40,&40,&40,&40,&00,&00,&02
defb &00,&00,&02,&00,&00,&02,&00,&00,&02,&00
defb &00,&02,&00,&00,&02,&00,&00,&02,&00,&00
defb &02,&00,&00,&02,&02,&02,&0A,&0E,&0E,&0E
defb &70,&70,&70,&50,&40,&40,&40,&00
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


