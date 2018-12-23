;read "BootStrap.asm"
ld hl,CompiledSprite_GetNxtLin
ld bc,CompiledSprite_GetNxtLinbc
;ld a,&c0
call Akuyou_ScreenBuffer_GetActiveScreen
cp &c0
jr Z,CompiledSprite_Buffer2
ld hl,CompiledSprite_GetNxtLinAlt
ld bc,CompiledSprite_GetNxtLinAlt
CompiledSprite_Buffer2:
ld (CompiledSprite_NextLineJump_Plus2-2),hl
ld (CompiledSprite_NextLineJumpbc_Plus2-2),bc
ld h,a
ld l,&50-28
ld (StackRestore_Plus2-2),sp
di
ld sp,hl
jp PicFinalBattle1bmp

PicFinalBattle1bmp:
LD IX,PicFinalBattle1bmp_DrawOrder
JP JumpToNextLine


PicFinalBattle1bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast12


PicFinalBattle1bmp_Line_1:
jp MultiPushDeLast12


PicFinalBattle1bmp_Line_1_Reuse:
LD DE,&0000
JP PicFinalBattle1bmp_Line_1
PicFinalBattle1bmp_Line_8:
call MultiPushDe5
LD HL,&4010
  Push HL
jp MultiPushDeLast6


PicFinalBattle1bmp_Line_9:
LD HL,&0088
  Push HL
LD BC,&FF00
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&A020
  Push HL
jp MultiPushDeLast6


PicFinalBattle1bmp_Line_10:
LD HL,&00EE
  Push HL
LD BC,&FF11
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5050
  Push HL
jp MultiPushDeLast6


PicFinalBattle1bmp_Line_11:
LD HL,&88FF
  Push HL
LD BC,&FF11
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&E0B0
  Push BC
jp MultiPushDeLast6


PicFinalBattle1bmp_Line_12:
LD HL,&CCFF
  Push HL
LD BC,&CC33
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_13:
LD HL,&EE77
  Push HL
LD BC,&8833
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+11
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_14:
LD HL,&EE77
  Push HL
LD BC,&8877
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+17
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_15:
LD HL,&77EE
  Push HL
LD BC,&CC77
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+23
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_16:
LD HL,&33CC
  Push HL
LD BC,&FF77
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_17:
LD HL,&3344
  Push HL
LD BC,&FF77
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+35
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_18:
LD HL,&6666
  Push HL
LD BC,&EEBB
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+41
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_19:
LD HL,&EE77
  Push HL
LD BC,&77DD
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+47
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_20:
LD HL,&CCFF
  Push HL
LD BC,&5544
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+53
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_21:
LD HL,&88FF
  Push HL
LD BC,&1155
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+59
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_22:
call BitmapPush6
defw BitmapData+65
  PUSH DE
call BitmapPush6
defw BitmapData+71
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_23:
call BitmapPush14
defw BitmapData+85
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_24:
call BitmapPush14
defw BitmapData+99
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_25:
  PUSH DE
call BitmapPush12
defw BitmapData+111
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_26:
  PUSH DE
call BitmapPush16
defw BitmapData+127
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_27:
  PUSH DE
call BitmapPush16
defw BitmapData+143
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_28:
  PUSH DE
call BitmapPush6
defw BitmapData+149
LD DE,&F050
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+155
LD DE,&0000
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_29:
  PUSH DE
call BitmapPush16
defw BitmapData+171
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_30:
  PUSH DE
call BitmapPush16
defw BitmapData+187
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_31:
  PUSH DE
call BitmapPush16
defw BitmapData+203
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_32:
  PUSH DE
call BitmapPush16
defw BitmapData+219
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_33:
  PUSH DE
call BitmapPush16
defw BitmapData+235
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_34:
  PUSH DE
call BitmapPush16
defw BitmapData+251
 jp NextLinePushDe3


PicFinalBattle1bmp_Line_35:
  PUSH DE
call BitmapPush14
defw BitmapData+265
 jp NextLinePushDe4


PicFinalBattle1bmp_Line_36:
  PUSH DE
  PUSH DE
LD HL,&0701
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+273
 jp NextLinePushDe4


PicFinalBattle1bmp_Line_37:
  PUSH DE
  PUSH DE
LD HL,&1F02
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+281
 jp NextLinePushDe4


PicFinalBattle1bmp_Line_38:
  PUSH DE
  PUSH DE
LD HL,&2E01
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+289
 jp NextLinePushDe4


PicFinalBattle1bmp_Line_39:
  PUSH DE
  PUSH DE
LD HL,&4E02
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+295
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_40:
  PUSH DE
  PUSH DE
LD HL,&0C05
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+295
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_41:
  PUSH DE
  PUSH DE
LD HL,&4C03
  Push HL
  PUSH DE
LD BC,&80F0
  Push BC
  PUSH DE
LD HL,&F070
  Push HL
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_42:
  PUSH DE
  PUSH DE
LD HL,&8805
  Push HL
  PUSH DE
LD BC,&80F0
  Push BC
  PUSH DE
LD HL,&F070
  Push HL
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_43:
  PUSH DE
  PUSH DE
LD HL,&080B
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+301
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_44:
  PUSH DE
  PUSH DE
LD HL,&0007
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+307
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_45:
  PUSH DE
  PUSH DE
LD HL,&001F
  Push HL
  PUSH DE
LD BC,&C0F0
  Push BC
  PUSH DE
LD HL,&D1F0
  Push HL
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_46:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+313
  PUSH DE
LD HL,&A0F0
  Push HL
jp MultiPushDeLast5


PicFinalBattle1bmp_Line_47:
  PUSH DE
  PUSH DE
LD HL,&000C
  Push HL
  PUSH DE
LD BC,&C0B0
  Push BC
  PUSH DE
LD HL,&40F0
  Push HL
LD BC,&1000
  Push BC
 jp NextLinePushDe4


PicFinalBattle1bmp_Line_48:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+319
  PUSH DE
LD HL,&80F0
  Push HL
LD BC,&1000
  Push BC
  PUSH DE
LD HL,&C831
  Push HL
 jp NextLinePushDe2


PicFinalBattle1bmp_Line_49:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+325
  PUSH DE
LD HL,&40F0
  Push HL
LD BC,&3000
  Push BC
  PUSH DE
LD HL,&30C8
  Push HL
Ld B,&11
  Push BC
 jp NextLinePushDe1


PicFinalBattle1bmp_Line_50:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+331
  PUSH DE
call BitmapPush6
defw BitmapData+337
  PUSH DE
LD HL,&6400
  Push HL
 jp NextLinePushDe1


PicFinalBattle1bmp_Line_51:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+349
  PUSH DE
LD HL,&8011
  Push HL
 jp NextLinePushDe1


PicFinalBattle1bmp_Line_52:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0500
  Push HL
LD BC,&5050
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+355
  PUSH DE
LD HL,&0020
  Push HL
 jp NextLinePushDe1


PicFinalBattle1bmp_Line_53:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+367
  PUSH DE
LD HL,&E0FE
  Push HL
LD BC,&3000
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_54:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0440
  Push HL
LD BC,&5050
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+373
  PUSH DE
LD HL,&7200
  Push HL
LD BC,&E400
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_55:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+387
  PUSH DE
LD HL,&0010
  jp NextLinePushHl 


PicFinalBattle1bmp_Line_56:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0441
  Push HL
LD BC,&5050
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+395
  PUSH DE
LD HL,&0020
  jp NextLinePushHl 


PicFinalBattle1bmp_Line_57:
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+413


PicFinalBattle1bmp_Line_58:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0041
  Push HL
LD BC,&5050
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+425


PicFinalBattle1bmp_Line_59:
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+443


PicFinalBattle1bmp_Line_60:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0050
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+451
  PUSH DE
LD HL,&FC10
  jp NextLinePushHl 


PicFinalBattle1bmp_Line_61:
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush18
defw BitmapData+469


PicFinalBattle1bmp_Line_62:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4050
  Push HL
LD BC,&5010
  Push BC
  PUSH DE
LD HL,&00A0
  Push HL
Ld B,L
Ld C,L

  Push BC
  PUSH DE
Ld H,C
Ld L,E

  Push HL
LD BC,&C030
  Push BC
 jp NextLinePushDe1


PicFinalBattle1bmp_Line_63:
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+485
  PUSH DE
LD HL,&1000
  jp NextLinePushHl 


PicFinalBattle1bmp_Line_64:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+491
  PUSH DE
call FinalBitmapPush12
defw BitmapData+503


PicFinalBattle1bmp_Line_65:
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+523


PicFinalBattle1bmp_Line_66:
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+543


PicFinalBattle1bmp_Line_67:
  PUSH DE
  PUSH DE
call FinalBitmapPush20
defw BitmapData+563


PicFinalBattle1bmp_Line_68:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+569
  PUSH DE
LD HL,&33CC
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+575


PicFinalBattle1bmp_Line_69:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&DD11
  Push BC
  PUSH DE
LD HL,&2200
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+581


PicFinalBattle1bmp_Line_70:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&3300
  Push BC
  PUSH DE
LD HL,&CCFF
  Push HL
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+587


PicFinalBattle1bmp_Line_71:
call MultiPushDe9
call FinalBitmapPush6
defw BitmapData+593


PicFinalBattle1bmp_Line_72:
call MultiPushDe9
call FinalBitmapPush6
defw BitmapData+599


PicFinalBattle1bmp_Line_73:
call MultiPushDe10
LD HL,&EF11
  Push HL
LD BC,&7732
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_74:
call MultiPushDe10
LD HL,&88FF
  Push HL
LD BC,&3376
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_75:
call MultiPushDe10
LD HL,&00CC
  Push HL
LD BC,&1376
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_76:
call MultiPushDe10
LD HL,&0004
  Push HL
LD BC,&0576
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_77:
call MultiPushDe10
LD HL,&0002
  Push HL
LD BC,&08F6
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_78:
call MultiPushDe10
LD HL,&000D
  Push HL
LD BC,&0177
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_79:
call MultiPushDe10
LD HL,&0001
  Push HL
LD BC,&0255
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_80:
call MultiPushDe10
LD HL,&4405
  Push HL
LD BC,&04DD
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_81:
call MultiPushDe10
LD HL,&2202
  Push HL
LD BC,&8C99
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_82:
call MultiPushDe10
LD HL,&8813
  Push HL
LD BC,&8CB8
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_83:
call MultiPushDe10
LD HL,&AA37
  Push HL
LD BC,&8DE8
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_84:
call MultiPushDe10
LD HL,&22BB
  Push HL
LD BC,&BBAA
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_85:
call MultiPushDe10
LD HL,&6675
  Push HL
LD BC,&BBAA
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_86:
call MultiPushDe10
LD HL,&4466
  Push HL
LD BC,&BBAA
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_87:
call MultiPushDe10
LD HL,&00AA
  Push HL
LD BC,&BBAA
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_88:
call MultiPushDe10
LD HL,&04DD
  Push HL
LD BC,&BBAA
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_89:
call MultiPushDe10
LD HL,&04EE
  Push HL
LD BC,&BB44
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_90:
call MultiPushDe10
LD HL,&02CC
  Push HL
LD BC,&9966
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_91:
call MultiPushDe10
LD HL,&0206
  Push HL
LD BC,&4422
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_92:
call MultiPushDe10
LD HL,&0208
  Push HL
LD BC,&4533
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_93:
call MultiPushDe10
LD HL,&0100
  Push HL
LD BC,&4411
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_94:
call MultiPushDe10
LD HL,&0100
  Push HL
LD BC,&CC00
 jp NextLinePushBC 


PicFinalBattle1bmp_Line_95:
call MultiPushDe10
LD HL,&0E0C
  Push HL
LD BC,&4600
 jp NextLinePushBC 



PicFinalBattle1bmp_DrawOrder: 

  DEFW PicFinalBattle1bmp_Line_0
  DEFW PicFinalBattle1bmp_Line_1
  DEFW PicFinalBattle1bmp_Line_1_Reuse
  DEFW PicFinalBattle1bmp_Line_1_Reuse
  DEFW PicFinalBattle1bmp_Line_1_Reuse
  DEFW PicFinalBattle1bmp_Line_1_Reuse
  DEFW PicFinalBattle1bmp_Line_1_Reuse
  DEFW PicFinalBattle1bmp_Line_1_Reuse
  DEFW PicFinalBattle1bmp_Line_8
  DEFW PicFinalBattle1bmp_Line_9
  DEFW PicFinalBattle1bmp_Line_10
  DEFW PicFinalBattle1bmp_Line_11
  DEFW PicFinalBattle1bmp_Line_12
  DEFW PicFinalBattle1bmp_Line_13
  DEFW PicFinalBattle1bmp_Line_14
  DEFW PicFinalBattle1bmp_Line_15
  DEFW PicFinalBattle1bmp_Line_16
  DEFW PicFinalBattle1bmp_Line_17
  DEFW PicFinalBattle1bmp_Line_18
  DEFW PicFinalBattle1bmp_Line_19
  DEFW PicFinalBattle1bmp_Line_20
  DEFW PicFinalBattle1bmp_Line_21
  DEFW PicFinalBattle1bmp_Line_22
  DEFW PicFinalBattle1bmp_Line_23
  DEFW PicFinalBattle1bmp_Line_24
  DEFW PicFinalBattle1bmp_Line_25
  DEFW PicFinalBattle1bmp_Line_26
  DEFW PicFinalBattle1bmp_Line_27
  DEFW PicFinalBattle1bmp_Line_28
  DEFW PicFinalBattle1bmp_Line_29
  DEFW PicFinalBattle1bmp_Line_30
  DEFW PicFinalBattle1bmp_Line_31
  DEFW PicFinalBattle1bmp_Line_32
  DEFW PicFinalBattle1bmp_Line_33
  DEFW PicFinalBattle1bmp_Line_34
  DEFW PicFinalBattle1bmp_Line_35
  DEFW PicFinalBattle1bmp_Line_36
  DEFW PicFinalBattle1bmp_Line_37
  DEFW PicFinalBattle1bmp_Line_38
  DEFW PicFinalBattle1bmp_Line_39
  DEFW PicFinalBattle1bmp_Line_40
  DEFW PicFinalBattle1bmp_Line_41
  DEFW PicFinalBattle1bmp_Line_42
  DEFW PicFinalBattle1bmp_Line_43
  DEFW PicFinalBattle1bmp_Line_44
  DEFW PicFinalBattle1bmp_Line_45
  DEFW PicFinalBattle1bmp_Line_46
  DEFW PicFinalBattle1bmp_Line_47
  DEFW PicFinalBattle1bmp_Line_48
  DEFW PicFinalBattle1bmp_Line_49
  DEFW PicFinalBattle1bmp_Line_50
  DEFW PicFinalBattle1bmp_Line_51
  DEFW PicFinalBattle1bmp_Line_52
  DEFW PicFinalBattle1bmp_Line_53
  DEFW PicFinalBattle1bmp_Line_54
  DEFW PicFinalBattle1bmp_Line_55
  DEFW PicFinalBattle1bmp_Line_56
  DEFW PicFinalBattle1bmp_Line_57
  DEFW PicFinalBattle1bmp_Line_58
  DEFW PicFinalBattle1bmp_Line_59
  DEFW PicFinalBattle1bmp_Line_60
  DEFW PicFinalBattle1bmp_Line_61
  DEFW PicFinalBattle1bmp_Line_62
  DEFW PicFinalBattle1bmp_Line_63
  DEFW PicFinalBattle1bmp_Line_64
  DEFW PicFinalBattle1bmp_Line_65
  DEFW PicFinalBattle1bmp_Line_66
  DEFW PicFinalBattle1bmp_Line_67
  DEFW PicFinalBattle1bmp_Line_68
  DEFW PicFinalBattle1bmp_Line_69
  DEFW PicFinalBattle1bmp_Line_70
  DEFW PicFinalBattle1bmp_Line_71
  DEFW PicFinalBattle1bmp_Line_72
  DEFW PicFinalBattle1bmp_Line_73
  DEFW PicFinalBattle1bmp_Line_74
  DEFW PicFinalBattle1bmp_Line_75
  DEFW PicFinalBattle1bmp_Line_76
  DEFW PicFinalBattle1bmp_Line_77
  DEFW PicFinalBattle1bmp_Line_78
  DEFW PicFinalBattle1bmp_Line_79
  DEFW PicFinalBattle1bmp_Line_80
  DEFW PicFinalBattle1bmp_Line_81
  DEFW PicFinalBattle1bmp_Line_82
  DEFW PicFinalBattle1bmp_Line_83
  DEFW PicFinalBattle1bmp_Line_84
  DEFW PicFinalBattle1bmp_Line_85
  DEFW PicFinalBattle1bmp_Line_86
  DEFW PicFinalBattle1bmp_Line_87
  DEFW PicFinalBattle1bmp_Line_88
  DEFW PicFinalBattle1bmp_Line_89
  DEFW PicFinalBattle1bmp_Line_90
  DEFW PicFinalBattle1bmp_Line_91
  DEFW PicFinalBattle1bmp_Line_92
  DEFW PicFinalBattle1bmp_Line_93
  DEFW PicFinalBattle1bmp_Line_94
  DEFW PicFinalBattle1bmp_Line_95
  DEFW EndCode







;Global Code
EndCode:
ld sp,(StackRestore_Plus2-2)
ei
ret

MultiPushDeLast12: ld HL,NextLine
jr MultiPushDe12B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDe10: pop HL
jr MultiPushDe10B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDeLast6: ld HL,NextLine
jr MultiPushDe6B 
MultiPushDe6: pop HL
jr MultiPushDe6B 
MultiPushDeLast5: ld HL,NextLine
jr MultiPushDe5B 
MultiPushDe5: pop HL
jr MultiPushDe5B 
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

BitmapPush16: ld b,&08
jr BitmapPush
BitmapPush14: ld b,&07
jr BitmapPush
BitmapPush12: ld b,&06
jr BitmapPush
BitmapPush8: ld b,&04
jr BitmapPush
BitmapPush6: ld b,&03
jr BitmapPush

finalBitmapPush20: ld b,&0A
jr finalBitmapPush

finalBitmapPush18: ld b,&09
jr finalBitmapPush

finalBitmapPush12: ld b,&06
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
ld hl,&0800+24
add hl,sp
ei
ld sp,&0000:StackRestore_Plus2
di
ld sp,hl
jp CompiledSprite_GetNxtLin :CompiledSprite_NextLineJump_Plus2
CompiledSprite_GetNxtLin:
jp nc,JumpToNextLine
ld hl,&c050
add hl,sp
ld sp,hl
jp JumpToNextLine
CompiledSprite_GetNxtLinAlt:
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

defb &00,&10,&70,&F0,&40,&00,&00,&20,&F0,&FE
defb &A0,&00,&00,&50,&F1,&FF,&C0,&00,&00,&A0
defb &E2,&44,&E8,&00,&10,&50,&F3,&FF,&FC,&00
defb &00,&B0,&C0,&EE,&20,&80,&10,&70,&C2,&44
defb &38,&00,&00,&B0,&83,&23,&3A,&80,&10,&70
defb &F7,&FF,&DC,&00,&00,&B0,&F7,&FE,&DC,&80
defb &11,&00,&33,&CC,&77,&00,&00,&50,&F7,&FD
defb &DC,&00,&00,&30,&B3,&99,&FC,&80,&00,&70
defb &F7,&CC,&3B,&DD,&44,&00,&00,&50,&B3,&00
defb &F8,&00,&70,&F1,&77,&CD,&04,&EE,&88,&00
defb &00,&20,&91,&C0,&E8,&90,&F0,&E0,&FF,&CC
defb &0F,&15,&00,&30,&C0,&00,&00,&50,&51,&F1
defb &D0,&50,&F0,&D1,&FF,&89,&0F,&8C,&00,&F9
defb &E8,&00,&00,&E0,&A0,&76,&A0,&F0,&F0,&E2
defb &FF,&CE,&1F,&08,&F0,&D1,&FF,&CD,&0F,&00
defb &11,&F8,&E4,&00,&10,&70,&11,&70,&E0,&F0
defb &E0,&B0,&F0,&70,&F0,&F0,&F0,&A2,&FF,&8B
defb &1F,&00,&11,&70,&F1,&F0,&F0,&70,&E0,&70
defb &F0,&F0,&F0,&D5,&77,&8D,&2F,&00,&11,&30
defb &D1,&F8,&F0,&B0,&E0,&30,&F0,&F0,&D0,&20
defb &22,&0B,&0E,&00,&11,&AA,&33,&F8,&F0,&F0
defb &C0,&30,&F0,&F0,&A0,&A0,&00,&07,&2E,&00
defb &00,&55,&77,&F0,&50,&F0,&C0,&10,&F0,&50
defb &50,&40,&00,&0B,&4C,&00,&00,&33,&EE,&E0
defb &A0,&F0,&C0,&10,&E0,&A0,&A0,&00,&00,&07
defb &88,&00,&DC,&D0,&10,&F0,&C0,&10,&D0,&10
defb &40,&00,&00,&1F,&08,&00,&32,&A0,&90,&F0
defb &C0,&00,&F0,&00,&10,&40,&10,&F0,&C0,&00
defb &F0,&00,&20,&80,&10,&F0,&80,&00,&F0,&00
defb &30,&F0,&80,&00,&F0,&00,&F0,&E0,&55,&55
defb &F0,&80,&F0,&E0,&88,&00,&F0,&80,&70,&C0
defb &00,&01,&26,&00,&70,&C0,&00,&01,&0C,&00
defb &B0,&E0,&00,&02,&08,&00,&70,&60,&00,&01
defb &08,&00,&CC,&00,&00,&30,&B0,&80,&20,&00
defb &00,&70,&50,&00,&11,&00,&30,&B0,&00,&03
defb &10,&00,&00,&20,&A0,&80,&10,&88,&00,&50
defb &50,&00,&11,&00,&20,&A0,&80,&0A,&00,&C0
defb &00,&20,&A0,&80,&80,&00,&00,&40,&00,&50
defb &50,&00,&22,&88,&20,&A0,&A0,&08,&62,&00
defb &00,&62,&00,&A0,&A0,&00,&40,&00,&70,&80
defb &31,&00,&00,&62,&10,&50,&50,&00,&22,&88
defb &20,&A0,&82,&08,&80,&00,&00,&E4,&00,&80
defb &00,&40,&00,&A0,&A0,&00,&00,&30,&80,&10
defb &88,&40,&00,&40,&10,&50,&50,&00,&22,&88
defb &20,&A0,&A0,&80,&00,&40,&00,&80,&20,&A0
defb &A0,&00,&30,&00,&00,&F0,&10,&C0,&00,&80
defb &50,&50,&50,&00,&22,&88,&00,&A0,&A0,&A0
defb &00,&20,&00,&10,&50,&50,&50,&00,&22,&88
defb &00,&20,&A0,&A0,&80,&00,&00,&10,&50,&50
defb &40,&00,&E0,&10,&80,&30,&E0,&20,&00,&20
defb &A0,&A0,&A0,&00,&00,&10,&78,&C3,&1E,&20
defb &00,&50,&50,&50,&50,&88,&44,&44,&22,&00
defb &20,&A0,&A0,&00,&10,&10,&58,&F8,&D2,&E0
defb &00,&A0,&A0,&80,&11,&44,&CC,&33,&00,&EE
defb &10,&50,&50,&00,&71,&B1,&DC,&64,&66,&C0
defb &00,&50,&40,&00,&77,&00,&88,&11,&88,&33
defb &00,&20,&A0,&00,&66,&11,&00,&10,&50,&00
defb &D7,&B1,&FE,&E0,&66,&00,&D7,&F3,&FF,&C0
defb &EF,&00,&F7,&F3,&FF,&FF,&EE,&00,&33,&FB
defb &FF,&FF,&CE,&00,&00,&FB,&FF,&FF,&8C,&00
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

