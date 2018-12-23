nolist
jp PicFinalBattle2bmp
jp PicIntro_hauntingbmp
jp PicIntro_Prankbmp
jp PicIntro_Campingbmp
jp PicFinalBattle3bmp

PicFinalBattle2bmp:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C050-28

LD IX,PicFinalBattle2bmp_DrawOrder
JP JumpToNextLine


PicFinalBattle2bmp_Line_0:
LD DE,&0000
jp MultiPushDeLast12


PicFinalBattle2bmp_Line_1:
jp MultiPushDeLast12


PicFinalBattle2bmp_Line_1_Reuse:
LD DE,&0000
JP PicFinalBattle2bmp_Line_1
PicFinalBattle2bmp_Line_21:
call MultiPushDe7
LD HL,&0080
  Push HL
LD BC,&7000
  Push BC
 jp NextLinePushDe3


PicFinalBattle2bmp_Line_22:
call MultiPushDe7
LD HL,&0072
  Push HL
LD BC,&8830
  Push BC
 jp NextLinePushDe3


PicFinalBattle2bmp_Line_23:
call MultiPushDe7
LD HL,&C400
  Push HL
LD BC,&0040
  Push BC
 jp NextLinePushDe3


PicFinalBattle2bmp_Line_24:
call MultiPushDe7
LD HL,&4000
  Push HL
LD BC,&0080
  Push BC
 jp NextLinePushDe3


PicFinalBattle2bmp_Line_25:
call MultiPushDe7
LD HL,&2000
  Push HL
  PUSH DE
LD BC,&1000
  Push BC
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_26:
call MultiPushDe7
LD HL,&1100
  Push HL
  PUSH DE
LD BC,&1000
  Push BC
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_27:
call MultiPushDe7
call BitmapPush6
defw BitmapData+5
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_28:
call MultiPushDe7
call BitmapPush6
defw BitmapData+11
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_29:
call MultiPushDe6
LD HL,&0080
  Push HL
LD BC,&0040
  Push BC
  PUSH DE
  PUSH DE
LD HL,&1000
  Push HL
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_30:
call MultiPushDe6
call BitmapPush6
defw BitmapData+17
  PUSH DE
LD HL,&6400
  Push HL
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_31:
call MultiPushDe6
call BitmapPush10
defw BitmapData+27
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_32:
call MultiPushDe6
LD HL,&0088
  Push HL
LD BC,&0011
  Push BC
  PUSH DE
Ld L,&E0
  Push HL
Ld B,&10
  Push BC
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_33:
call MultiPushDe6
LD HL,&0080
  Push HL
LD BC,&0010
  Push BC
  PUSH DE
  PUSH DE
LD HL,&7310
  Push HL
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_34:
call MultiPushDe6
call BitmapPush6
defw BitmapData+33
  PUSH DE
LD HL,&0020
  Push HL
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_35:
call MultiPushDe6
LD HL,&0080
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
  PUSH DE
Ld L,&20
  Push HL
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_36:
call MultiPushDe6
call BitmapPush10
defw BitmapData+43
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_37:
call MultiPushDe6
call BitmapPush10
defw BitmapData+53
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_38:
call MultiPushDe6
call BitmapPush10
defw BitmapData+63
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_39:
call MultiPushDe6
call BitmapPush10
defw BitmapData+73
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_40:
call MultiPushDe6
call BitmapPush10
defw BitmapData+83
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_41:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+95


PicFinalBattle2bmp_Line_42:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+107


PicFinalBattle2bmp_Line_43:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+119


PicFinalBattle2bmp_Line_44:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+131


PicFinalBattle2bmp_Line_45:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+143


PicFinalBattle2bmp_Line_46:
call MultiPushDe7
call FinalBitmapPush10
defw BitmapData+153


PicFinalBattle2bmp_Line_47:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+165


PicFinalBattle2bmp_Line_48:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+177


PicFinalBattle2bmp_Line_49:
call MultiPushDe8
call BitmapPush6
defw BitmapData+183
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_50:
call MultiPushDe6
call FinalBitmapPush12
defw BitmapData+195


PicFinalBattle2bmp_Line_51:
call MultiPushDe8
call BitmapPush6
defw BitmapData+201
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_52:
LD HL,&CCFF
  Push HL
LD BC,&1100
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush12
defw BitmapData+213


PicFinalBattle2bmp_Line_53:
LD HL,&EEFF
  Push HL
LD BC,&3300
  Push BC
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+223


PicFinalBattle2bmp_Line_54:
LD HL,&FF88
  Push HL
LD BC,&7700
  Push BC
call MultiPushDe6
call FinalBitmapPush8
defw BitmapData+231


PicFinalBattle2bmp_Line_55:
LD HL,&FFCC
  Push HL
LD BC,&6600
  Push BC
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+241


PicFinalBattle2bmp_Line_56:
LD HL,&99FF
  Push HL
LD BC,&6600
  Push BC
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+251


PicFinalBattle2bmp_Line_57:
LD HL,&DDBB
  Push HL
LD BC,&4400
  Push BC
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+261


PicFinalBattle2bmp_Line_58:
LD HL,&FF66
  Push HL
LD BC,&7700
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush12
defw BitmapData+273


PicFinalBattle2bmp_Line_59:
LD HL,&AA99
  Push HL
LD BC,&7700
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush12
defw BitmapData+285


PicFinalBattle2bmp_Line_60:
LD HL,&66CC
  Push HL
LD BC,&3700
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush12
defw BitmapData+297


PicFinalBattle2bmp_Line_61:
LD HL,&EEEE
  Push HL
LD BC,&1B00
  Push BC
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+307


PicFinalBattle2bmp_Line_62:
LD HL,&8877
  Push HL
LD BC,&0501
  Push BC
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+317


PicFinalBattle2bmp_Line_63:
LD HL,&000A
  Push HL
LD BC,&0A02
  Push BC
  PUSH DE
  PUSH DE
Ld L,&08
  Push HL
Ld D,&01
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+327


PicFinalBattle2bmp_Line_64:
Ld H,E
Ld L,E

  Push HL
LD BC,&0505
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
  PUSH DE
Ld D,&01
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+337


PicFinalBattle2bmp_Line_65:
Ld H,E
Ld L,E

  Push HL
LD BC,&0A02
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+351


PicFinalBattle2bmp_Line_66:
  PUSH DE
LD HL,&0405
  Push HL
call MultiPushDe5
call FinalBitmapPush10
defw BitmapData+361


PicFinalBattle2bmp_Line_67:
  PUSH DE
LD HL,&000A
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+371
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_68:
  PUSH DE
LD HL,&0004
  Push HL
LD BC,&0100
  Push BC
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+385


PicFinalBattle2bmp_Line_69:
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0200
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+399
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_70:
  PUSH DE
LD HL,&0050
  Push HL
LD BC,&D871
  Push BC
  PUSH DE
call FinalBitmapPush16
defw BitmapData+415


PicFinalBattle2bmp_Line_71:
  PUSH DE
call FinalBitmapPush22
defw BitmapData+437


PicFinalBattle2bmp_Line_72:
  PUSH DE
call BitmapPush12
defw BitmapData+449
  PUSH DE
call BitmapPush6
defw BitmapData+455
 jp NextLinePushDe1


PicFinalBattle2bmp_Line_73:
call BitmapPush14
defw BitmapData+469
  PUSH DE
call FinalBitmapPush8
defw BitmapData+477


PicFinalBattle2bmp_Line_74:
call BitmapPush14
defw BitmapData+491
  PUSH DE
LD HL,&0003
  Push HL
LD BC,&0002
  Push BC
  PUSH DE
LD HL,&CC00
  jp NextLinePushHl 


PicFinalBattle2bmp_Line_75:
call BitmapPush14
defw BitmapData+505
  PUSH DE
LD HL,&000C
  Push HL
LD BC,&0F01
  Push BC
  PUSH DE
LD HL,&6600
  jp NextLinePushHl 


PicFinalBattle2bmp_Line_76:
call BitmapPush8
defw BitmapData+513
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&F070
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&AA00
  Push BC
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_77:
call BitmapPush14
defw BitmapData+527
  PUSH DE
  PUSH DE
LD HL,&5511
  Push HL
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_78:
call BitmapPush16
defw BitmapData+543
  PUSH DE
LD HL,&EE11
  Push HL
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_79:
call BitmapPush10
defw BitmapData+553
LD DE,&B4F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+559
LD DE,&0000
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_80:
call BitmapPush16
defw BitmapData+575
  PUSH DE
LD HL,&CC33
  Push HL
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_81:
call BitmapPush14
defw BitmapData+589
  PUSH DE
  PUSH DE
LD HL,&CC33
  Push HL
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_82:
call BitmapPush16
defw BitmapData+605
  PUSH DE
LD HL,&CC33
  Push HL
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_83:
call BitmapPush10
defw BitmapData+615
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+621
LD DE,&0000
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_84:
call BitmapPush16
defw BitmapData+637
  PUSH DE
LD HL,&CF17
  Push HL
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_85:
call BitmapPush20
defw BitmapData+657
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_86:
call BitmapPush14
defw BitmapData+671
  PUSH DE
LD HL,&008C
  Push HL
LD BC,&3F07
  Push BC
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_87:
call BitmapPush20
defw BitmapData+691
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_88:
call BitmapPush14
defw BitmapData+705
  PUSH DE
LD HL,&0008
  Push HL
LD BC,&0F03
  Push BC
 jp NextLinePushDe2


PicFinalBattle2bmp_Line_89:
call BitmapPush14
defw BitmapData+719
jp MultiPushDeLast5


PicFinalBattle2bmp_Line_90:
call BitmapPush14
defw BitmapData+733
jp MultiPushDeLast5


PicFinalBattle2bmp_Line_91:
call BitmapPush14
defw BitmapData+747
jp MultiPushDeLast5


PicFinalBattle2bmp_Line_92:
call BitmapPush14
defw BitmapData+761
jp MultiPushDeLast5


PicFinalBattle2bmp_Line_93:
call BitmapPush14
defw BitmapData+775
jp MultiPushDeLast5


PicFinalBattle2bmp_Line_94:
call BitmapPush14
defw BitmapData+789
jp MultiPushDeLast5


PicFinalBattle2bmp_Line_95:
call BitmapPush14
defw BitmapData+803
jp MultiPushDeLast5



PicFinalBattle2bmp_DrawOrder: 

  DEFW PicFinalBattle2bmp_Line_0
  DEFW PicFinalBattle2bmp_Line_1
defw looper
  DEFB 1,19
  DEFW PicFinalBattle2bmp_Line_1_Reuse
  DEFW PicFinalBattle2bmp_Line_21
  DEFW PicFinalBattle2bmp_Line_22
  DEFW PicFinalBattle2bmp_Line_23
  DEFW PicFinalBattle2bmp_Line_24
  DEFW PicFinalBattle2bmp_Line_25
  DEFW PicFinalBattle2bmp_Line_26
  DEFW PicFinalBattle2bmp_Line_27
  DEFW PicFinalBattle2bmp_Line_28
  DEFW PicFinalBattle2bmp_Line_29
  DEFW PicFinalBattle2bmp_Line_30
  DEFW PicFinalBattle2bmp_Line_31
  DEFW PicFinalBattle2bmp_Line_32
  DEFW PicFinalBattle2bmp_Line_33
  DEFW PicFinalBattle2bmp_Line_34
  DEFW PicFinalBattle2bmp_Line_35
  DEFW PicFinalBattle2bmp_Line_36
  DEFW PicFinalBattle2bmp_Line_37
  DEFW PicFinalBattle2bmp_Line_38
  DEFW PicFinalBattle2bmp_Line_39
  DEFW PicFinalBattle2bmp_Line_40
  DEFW PicFinalBattle2bmp_Line_41
  DEFW PicFinalBattle2bmp_Line_42
  DEFW PicFinalBattle2bmp_Line_43
  DEFW PicFinalBattle2bmp_Line_44
  DEFW PicFinalBattle2bmp_Line_45
  DEFW PicFinalBattle2bmp_Line_46
  DEFW PicFinalBattle2bmp_Line_47
  DEFW PicFinalBattle2bmp_Line_48
  DEFW PicFinalBattle2bmp_Line_49
  DEFW PicFinalBattle2bmp_Line_50
  DEFW PicFinalBattle2bmp_Line_51
  DEFW PicFinalBattle2bmp_Line_52
  DEFW PicFinalBattle2bmp_Line_53
  DEFW PicFinalBattle2bmp_Line_54
  DEFW PicFinalBattle2bmp_Line_55
  DEFW PicFinalBattle2bmp_Line_56
  DEFW PicFinalBattle2bmp_Line_57
  DEFW PicFinalBattle2bmp_Line_58
  DEFW PicFinalBattle2bmp_Line_59
  DEFW PicFinalBattle2bmp_Line_60
  DEFW PicFinalBattle2bmp_Line_61
  DEFW PicFinalBattle2bmp_Line_62
  DEFW PicFinalBattle2bmp_Line_63
  DEFW PicFinalBattle2bmp_Line_64
  DEFW PicFinalBattle2bmp_Line_65
  DEFW PicFinalBattle2bmp_Line_66
  DEFW PicFinalBattle2bmp_Line_67
  DEFW PicFinalBattle2bmp_Line_68
  DEFW PicFinalBattle2bmp_Line_69
  DEFW PicFinalBattle2bmp_Line_70
  DEFW PicFinalBattle2bmp_Line_71
  DEFW PicFinalBattle2bmp_Line_72
  DEFW PicFinalBattle2bmp_Line_73
  DEFW PicFinalBattle2bmp_Line_74
  DEFW PicFinalBattle2bmp_Line_75
  DEFW PicFinalBattle2bmp_Line_76
  DEFW PicFinalBattle2bmp_Line_77
  DEFW PicFinalBattle2bmp_Line_78
  DEFW PicFinalBattle2bmp_Line_79
  DEFW PicFinalBattle2bmp_Line_80
  DEFW PicFinalBattle2bmp_Line_81
  DEFW PicFinalBattle2bmp_Line_82
  DEFW PicFinalBattle2bmp_Line_83
  DEFW PicFinalBattle2bmp_Line_84
  DEFW PicFinalBattle2bmp_Line_85
  DEFW PicFinalBattle2bmp_Line_86
  DEFW PicFinalBattle2bmp_Line_87
  DEFW PicFinalBattle2bmp_Line_88
  DEFW PicFinalBattle2bmp_Line_89
  DEFW PicFinalBattle2bmp_Line_90
  DEFW PicFinalBattle2bmp_Line_91
  DEFW PicFinalBattle2bmp_Line_92
  DEFW PicFinalBattle2bmp_Line_93
  DEFW PicFinalBattle2bmp_Line_94
  DEFW PicFinalBattle2bmp_Line_95
  DEFW EndCode
PicIntro_hauntingbmp:
ld (StackRestore_PlusRawBmp2-2),sp
ld b,96
ld IXL,12
di
ld sp,BitmapData+804
ld hl,&C050-1-28

jp DrawRawBmp
PicIntro_Prankbmp:
ld (StackRestore_PlusRawBmp2-2),sp
ld b,96
ld IXL,12
di
ld sp,BitmapData+3108
ld hl,&C050-1-28

jp DrawRawBmp
PicIntro_Campingbmp:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C050-28

LD IX,PicIntro_Campingbmp_DrawOrder
JP JumpToNextLine


PicIntro_Campingbmp_Line_6:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&3010
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD HL,&1000
  Push HL
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_7:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5417
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5416
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_8:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5423
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+5431
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_9:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5437
  PUSH DE
  PUSH DE
LD HL,&0030
  Push HL
LD BC,&8096
  Push BC
Ld D,L


  PUSH DE
  PUSH DE

Ld L,E

  jp NextLinePushHl 


PicIntro_Campingbmp_Line_10:
call BitmapPush10
defw BitmapData+5447
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+5455
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_11:
  PUSH DE
call BitmapPush8
defw BitmapData+5463
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+5471
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_12:
  PUSH DE
call BitmapPush10
defw BitmapData+5481
  PUSH DE
call BitmapPush8
defw BitmapData+5480
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_13:
  PUSH DE
LD HL,&0048
  Push HL
LD DE,&0FE1
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+5497


PicIntro_Campingbmp_Line_14:
call FinalBitmapPush24
defw BitmapData+5521


PicIntro_Campingbmp_Line_15:
call BitmapPush10
defw BitmapData+5531
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&6000
  Push HL
Ld E,&80
  PUSH DE
  PUSH DE
LD BC,&0E00
  Push BC
Ld H,D


  jp NextLinePushHl 


PicIntro_Campingbmp_Line_16:
Ld H,D
Ld L,D

  Push HL
LD BC,&3020
  Push BC

Ld E,L

  PUSH DE
  PUSH DE
Ld L,&10
  Push HL
  PUSH DE
LD BC,&0030
  Push BC
LD HL,&2000
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1000
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_17:
LD HL,&0080
  Push HL
LD BC,&0020
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&2000
  Push BC
 jp NextLinePushDe4


PicIntro_Campingbmp_Line_18:
LD HL,&0040
  Push HL
LD BC,&0010
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&4000
  Push HL
LD BC,&1000
  Push BC
 jp NextLinePushDe4


PicIntro_Campingbmp_Line_19:
  PUSH DE
LD HL,&0010
  Push HL
call MultiPushDe5
LD BC,&1000
  Push BC
 jp NextLinePushDe4


PicIntro_Campingbmp_Line_20:
LD HL,&00C0
  Push HL
  PUSH DE
LD BC,&8010
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5537
 jp NextLinePushDe3


PicIntro_Campingbmp_Line_21:
call BitmapPush10
defw BitmapData+5547
  PUSH DE
call BitmapPush6
defw BitmapData+5546
  PUSH DE
LD HL,&2000
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_22:
call BitmapPush10
defw BitmapData+5557
  PUSH DE
call BitmapPush10
defw BitmapData+5556
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_23:
call BitmapPush10
defw BitmapData+5567
  PUSH DE
call BitmapPush10
defw BitmapData+5566
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_24:
call BitmapPush22
defw BitmapData+5589
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_25:
call BitmapPush22
defw BitmapData+5611
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_26:
call BitmapPush22
defw BitmapData+5633
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_27:
call BitmapPush6
defw BitmapData+5639
  PUSH DE
call BitmapPush8
defw BitmapData+5647
  PUSH DE
LD HL,&00F0
  Push HL
LD BC,&F010
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_28:
call BitmapPush16
defw BitmapData+5663
  PUSH DE
LD HL,&8010
  Push HL
Ld B,E
Ld C,L

  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_29:
call BitmapPush8
defw BitmapData+5671
  PUSH DE
call BitmapPush6
defw BitmapData+5677
  PUSH DE
LD HL,&F000
  Push HL
LD BC,&0010
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_30:
call BitmapPush6
defw BitmapData+5683
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5689
  PUSH DE
  PUSH DE
LD HL,&0010
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_31:
call BitmapPush6
defw BitmapData+5695
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
LD BC,&6000
  Push BC
LD HL,&C0D2
  Push HL
  PUSH DE
  PUSH DE
Ld B,&80
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_32:
call BitmapPush10
defw BitmapData+5705
  PUSH DE
call BitmapPush10
defw BitmapData+5704
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_33:
  PUSH DE
call BitmapPush20
defw BitmapData+5725
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_34:
  PUSH DE
call FinalBitmapPush22
defw BitmapData+5747


PicIntro_Campingbmp_Line_35:
  PUSH DE
call BitmapPush10
defw BitmapData+5757
  PUSH DE
call FinalBitmapPush10
defw BitmapData+5756


PicIntro_Campingbmp_Line_36:
call BitmapPush22
defw BitmapData+5779
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_37:
  PUSH DE
call BitmapPush14
defw BitmapData+5793
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&2CC3
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_38:
  PUSH DE
call BitmapPush14
defw BitmapData+5807
  PUSH DE
LD HL,&4000
  Push HL
LD BC,&3C43
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_39:
  PUSH DE
call BitmapPush14
defw BitmapData+5821
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&3C21
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_40:
  PUSH DE
call BitmapPush10
defw BitmapData+5831
  PUSH DE
LD HL,&9003
  Push HL
  PUSH DE
LD BC,&4000
  Push BC
LD HL,&B430
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_41:
  PUSH DE
call BitmapPush10
defw BitmapData+5841
  PUSH DE
LD HL,&2090
  Push HL
  PUSH DE
LD BC,&8080
  Push BC
LD HL,&E040
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_42:
  PUSH DE
LD HL,&0040
  Push HL
LD BC,&2000
  Push BC
  PUSH DE
LD HL,&4020
  Push HL
Ld B,H


  Push BC
  PUSH DE
  Push HL 
  PUSH DE
Ld H,E
Ld L,B

  Push HL
LD BC,&2040
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_43:
  PUSH DE
call BitmapPush10
defw BitmapData+5851
  PUSH DE
LD HL,&C080
  Push HL
  PUSH DE
Ld B,L
Ld C,E

  Push BC
LD HL,&1040
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_44:
  PUSH DE
call BitmapPush8
defw BitmapData+5859
  PUSH DE
  PUSH DE
LD HL,&4801
  Push HL
  PUSH DE
LD BC,&8080
  Push BC
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_45:
  PUSH DE
call BitmapPush10
defw BitmapData+5869
  PUSH DE
LD HL,&80A0
  Push HL
  PUSH DE
call FinalBitmapPush6
defw BitmapData+5875


PicIntro_Campingbmp_Line_46:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+5881


PicIntro_Campingbmp_Line_47:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&00A0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
LD BC,&A000
  Push BC
  Push HL 
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_48:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0020
  Push HL
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+5887


PicIntro_Campingbmp_Line_49:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+5893


PicIntro_Campingbmp_Line_50:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0040
  Push HL
call MultiPushDe5
LD BC,&4000
  Push BC
LD HL,&00E0
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_51:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
LD BC,&00C0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
LD BC,&C000
  Push BC
LD HL,&1070
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_52:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+5899


PicIntro_Campingbmp_Line_53:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
call FinalBitmapPush6
defw BitmapData+5905


PicIntro_Campingbmp_Line_54:
call MultiPushDe9
call FinalBitmapPush6
defw BitmapData+5911


PicIntro_Campingbmp_Line_55:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
  Push HL 
LD HL,&3C30
  Push HL
LD BC,&8000
 jp NextLinePushBC 


PicIntro_Campingbmp_Line_56:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
call MultiPushDe5
call FinalBitmapPush6
defw BitmapData+5767


PicIntro_Campingbmp_Line_57:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
  PUSH DE
LD BC,&1000
  Push BC
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
LD BC,&0010
  Push BC
  Push HL 
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_58:
call MultiPushDe9
LD HL,&0020
  Push HL
LD BC,&0080
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_59:
  PUSH DE
  PUSH DE
LD HL,&8000
  Push HL
Ld B,E
Ld C,H

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
  PUSH DE
Ld L,&C0
  Push HL
Ld C,&48
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_60:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
call MultiPushDe5
LD BC,&8000
  Push BC
  PUSH DE
LD HL,&9048
  Push HL
Ld B,&10
 jp NextLinePushBC 


PicIntro_Campingbmp_Line_61:
  PUSH DE
  PUSH DE
LD HL,&8080
  Push HL
Ld B,E
Ld C,L

  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
LD HL,&2058
  Push HL
LD BC,&3000
 jp NextLinePushBC 


PicIntro_Campingbmp_Line_62:
Ld D,E
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&9010
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+5919


PicIntro_Campingbmp_Line_63:
  PUSH DE
  PUSH DE
LD HL,&8080
  Push HL
LD BC,&4B90
  Push BC
  PUSH DE
call FinalBitmapPush14
defw BitmapData+5933


PicIntro_Campingbmp_Line_64:
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&F030
  Push BC
  PUSH DE
Ld L,&70
  Push HL
LD BC,&4000
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+5939
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_65:
call MultiPushDe5
LD HL,&0010
  Push HL
LD BC,&8000
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
Ld L,&A0
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_66:
call MultiPushDe5
LD HL,&F030
  Push HL
LD BC,&0010
  Push BC
jp MultiPushDeLast5


PicIntro_Campingbmp_Line_67:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5945
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_68:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5951
jp MultiPushDeLast5


PicIntro_Campingbmp_Line_69:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5957
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0080
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_70:
Call PushDE_F0F0x
call BitmapPush6
defw BitmapData+5963
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_71:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5969
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00C0
  Push HL
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_72:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5975
  PUSH DE
  PUSH DE
LD HL,&0700
  Push HL
LD BC,&0040
  Push BC
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_73:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5981
  PUSH DE
call BitmapPush6
defw BitmapData+5987
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_74:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+5993
  PUSH DE
call BitmapPush6
defw BitmapData+5999
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_75:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+6013
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_76:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+6029


PicIntro_Campingbmp_Line_77:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+6045


PicIntro_Campingbmp_Line_78:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+6061


PicIntro_Campingbmp_Line_79:
  PUSH DE
LD HL,&00AA
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+6077


PicIntro_Campingbmp_Line_80:
  PUSH DE
LD HL,&0055
  Push HL
LD BC,&1100
  Push BC
  PUSH DE
call FinalBitmapPush16
defw BitmapData+6093


PicIntro_Campingbmp_Line_81:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&2200
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+6107
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_82:
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+6121
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_83:
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&6600
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+6135
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_84:
  PUSH DE
call BitmapPush20
defw BitmapData+6155
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_85:
  PUSH DE
call BitmapPush20
defw BitmapData+6175
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_86:
  PUSH DE
call BitmapPush18
defw BitmapData+6193
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_87:
  PUSH DE
call BitmapPush10
defw BitmapData+6203
  PUSH DE
call BitmapPush6
defw BitmapData+6209
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_88:
  PUSH DE
call BitmapPush10
defw BitmapData+6219
  PUSH DE
call BitmapPush6
defw BitmapData+6225
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_89:
  PUSH DE
call BitmapPush10
defw BitmapData+6235
  PUSH DE
call BitmapPush8
defw BitmapData+6243
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_90:
  PUSH DE
call BitmapPush10
defw BitmapData+6253
  PUSH DE
call BitmapPush8
defw BitmapData+6261
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_91:
call MultiPushDe5
LD HL,&0C07
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+6269
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_92:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&3307
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+6277
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_93:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+6291
 jp NextLinePushDe1


PicIntro_Campingbmp_Line_94:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6303
 jp NextLinePushDe2


PicIntro_Campingbmp_Line_95:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&008E
  Push HL
LD BC,&3333
  Push BC
  PUSH DE
LD HL,&E011
  Push HL
  PUSH DE
LD BC,&00CC
  Push BC
 jp NextLinePushDe2



PicIntro_Campingbmp_DrawOrder: 

  DEFW PicFinalBattle2bmp_Line_0
  DEFW PicFinalBattle2bmp_Line_1_Reuse
  DEFW PicFinalBattle2bmp_Line_1_Reuse
  DEFW PicFinalBattle2bmp_Line_1_Reuse
  DEFW PicFinalBattle2bmp_Line_1_Reuse
  DEFW PicFinalBattle2bmp_Line_1_Reuse
  DEFW PicIntro_Campingbmp_Line_6
  DEFW PicIntro_Campingbmp_Line_7
  DEFW PicIntro_Campingbmp_Line_8
  DEFW PicIntro_Campingbmp_Line_9
  DEFW PicIntro_Campingbmp_Line_10
  DEFW PicIntro_Campingbmp_Line_11
  DEFW PicIntro_Campingbmp_Line_12
  DEFW PicIntro_Campingbmp_Line_13
  DEFW PicIntro_Campingbmp_Line_14
  DEFW PicIntro_Campingbmp_Line_15
  DEFW PicIntro_Campingbmp_Line_16
  DEFW PicIntro_Campingbmp_Line_17
  DEFW PicIntro_Campingbmp_Line_18
  DEFW PicIntro_Campingbmp_Line_19
  DEFW PicIntro_Campingbmp_Line_20
  DEFW PicIntro_Campingbmp_Line_21
  DEFW PicIntro_Campingbmp_Line_22
  DEFW PicIntro_Campingbmp_Line_23
  DEFW PicIntro_Campingbmp_Line_24
  DEFW PicIntro_Campingbmp_Line_25
  DEFW PicIntro_Campingbmp_Line_26
  DEFW PicIntro_Campingbmp_Line_27
  DEFW PicIntro_Campingbmp_Line_28
  DEFW PicIntro_Campingbmp_Line_29
  DEFW PicIntro_Campingbmp_Line_30
  DEFW PicIntro_Campingbmp_Line_31
  DEFW PicIntro_Campingbmp_Line_32
  DEFW PicIntro_Campingbmp_Line_33
  DEFW PicIntro_Campingbmp_Line_34
  DEFW PicIntro_Campingbmp_Line_35
  DEFW PicIntro_Campingbmp_Line_36
  DEFW PicIntro_Campingbmp_Line_37
  DEFW PicIntro_Campingbmp_Line_38
  DEFW PicIntro_Campingbmp_Line_39
  DEFW PicIntro_Campingbmp_Line_40
  DEFW PicIntro_Campingbmp_Line_41
  DEFW PicIntro_Campingbmp_Line_42
  DEFW PicIntro_Campingbmp_Line_43
  DEFW PicIntro_Campingbmp_Line_44
  DEFW PicIntro_Campingbmp_Line_45
  DEFW PicIntro_Campingbmp_Line_46
  DEFW PicIntro_Campingbmp_Line_47
  DEFW PicIntro_Campingbmp_Line_48
  DEFW PicIntro_Campingbmp_Line_49
  DEFW PicIntro_Campingbmp_Line_50
  DEFW PicIntro_Campingbmp_Line_51
  DEFW PicIntro_Campingbmp_Line_52
  DEFW PicIntro_Campingbmp_Line_53
  DEFW PicIntro_Campingbmp_Line_54
  DEFW PicIntro_Campingbmp_Line_55
  DEFW PicIntro_Campingbmp_Line_56
  DEFW PicIntro_Campingbmp_Line_57
  DEFW PicIntro_Campingbmp_Line_58
  DEFW PicIntro_Campingbmp_Line_59
  DEFW PicIntro_Campingbmp_Line_60
  DEFW PicIntro_Campingbmp_Line_61
  DEFW PicIntro_Campingbmp_Line_62
  DEFW PicIntro_Campingbmp_Line_63
  DEFW PicIntro_Campingbmp_Line_64
  DEFW PicIntro_Campingbmp_Line_65
  DEFW PicIntro_Campingbmp_Line_66
  DEFW PicIntro_Campingbmp_Line_67
  DEFW PicIntro_Campingbmp_Line_68
  DEFW PicIntro_Campingbmp_Line_69
  DEFW PicIntro_Campingbmp_Line_70
  DEFW PicIntro_Campingbmp_Line_71
  DEFW PicIntro_Campingbmp_Line_72
  DEFW PicIntro_Campingbmp_Line_73
  DEFW PicIntro_Campingbmp_Line_74
  DEFW PicIntro_Campingbmp_Line_75
  DEFW PicIntro_Campingbmp_Line_76
  DEFW PicIntro_Campingbmp_Line_77
  DEFW PicIntro_Campingbmp_Line_78
  DEFW PicIntro_Campingbmp_Line_79
  DEFW PicIntro_Campingbmp_Line_80
  DEFW PicIntro_Campingbmp_Line_81
  DEFW PicIntro_Campingbmp_Line_82
  DEFW PicIntro_Campingbmp_Line_83
  DEFW PicIntro_Campingbmp_Line_84
  DEFW PicIntro_Campingbmp_Line_85
  DEFW PicIntro_Campingbmp_Line_86
  DEFW PicIntro_Campingbmp_Line_87
  DEFW PicIntro_Campingbmp_Line_88
  DEFW PicIntro_Campingbmp_Line_89
  DEFW PicIntro_Campingbmp_Line_90
  DEFW PicIntro_Campingbmp_Line_91
  DEFW PicIntro_Campingbmp_Line_92
  DEFW PicIntro_Campingbmp_Line_93
  DEFW PicIntro_Campingbmp_Line_94
  DEFW PicIntro_Campingbmp_Line_95
  DEFW EndCode
PicFinalBattle3bmp:
ld (StackRestore_Plus2-2),sp
di
ld sp,&C050-28

LD IX,PicFinalBattle3bmp_DrawOrder
JP JumpToNextLine


PicFinalBattle3bmp_Line_1:
LD HL,&0004
  Push HL
  PUSH DE
LD BC,&0001
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+6309
  PUSH DE
LD HL,&0002
  Push HL
  PUSH DE
LD BC,&000E
  Push BC
LD HL,&0700
  jp NextLinePushHl 


PicFinalBattle3bmp_Line_2:
LD HL,&0004
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6319
  PUSH DE
LD BC,&0002
  Push BC
LD HL,&0100
  jp NextLinePushHl 


PicFinalBattle3bmp_Line_3:
call FinalBitmapPush24
defw BitmapData+6343


PicFinalBattle3bmp_Line_4:
call BitmapPush14
defw BitmapData+6357
  PUSH DE
call FinalBitmapPush8
defw BitmapData+6365


PicFinalBattle3bmp_Line_5:
call FinalBitmapPush24
defw BitmapData+6389


PicFinalBattle3bmp_Line_6:
  PUSH DE
LD HL,&0904
  Push HL
LD DE,&0209
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+6405


PicFinalBattle3bmp_Line_7:
call FinalBitmapPush24
defw BitmapData+6429


PicFinalBattle3bmp_Line_8:
call BitmapPush8
defw BitmapData+6437
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&1100
  Push HL
  PUSH DE
LD BC,&00C4
  Push BC
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_9:
  PUSH DE
LD HL,&0600
  Push HL
  PUSH DE
LD BC,&0200
  Push BC
  PUSH DE
LD HL,&0080
  Push HL
  PUSH DE
  PUSH DE
  Push HL 
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_10:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6447
  PUSH DE
LD HL,&1000
  Push HL
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_11:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6457
  PUSH DE
LD HL,&1000
  Push HL
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_12:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6467
  PUSH DE
LD HL,&2000
  Push HL
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_13:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6477
  PUSH DE
LD HL,&2200
  Push HL
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_14:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6487
  PUSH DE
LD HL,&2200
  Push HL
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_15:
call MultiPushDe5
LD HL,&0040
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&2000
  Push BC
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_16:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6499
  PUSH DE
LD HL,&1000
  Push HL
 jp NextLinePushDe2


PicFinalBattle3bmp_Line_17:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+6513
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_18:
  PUSH DE
  PUSH DE
LD HL,&CCDD
  Push HL
Ld B,L
Ld C,E

  Push BC
  PUSH DE
LD HL,&4000
  Push HL
LD BC,&0080
  Push BC
  PUSH DE
  Push BC
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_19:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+6527
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_20:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6533
  PUSH DE
call BitmapPush6
defw BitmapData+6539
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_21:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6545
  PUSH DE
LD HL,&0080
  Push HL
LD BC,&4000
  Push BC
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_22:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6557
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_23:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6569
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_24:
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+6577
  PUSH DE
LD HL,&0010
  Push HL
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_25:
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+6585
  PUSH DE
LD HL,&0020
  Push HL
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_26:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6591
  PUSH DE
LD HL,&00E8
  Push HL
LD BC,&1020
  Push BC
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_27:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CCBB
  Push HL
LD BC,&2000
  Push BC
  PUSH DE
LD HL,&C031
  Push HL
LD BC,&0022
  Push BC
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_28:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+6597
  PUSH DE
LD HL,&E022
  Push HL
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_29:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6607
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_30:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6617
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_31:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6627
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_32:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6637
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_33:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6647
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_34:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6657
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_35:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&00FF
  Push HL
LD BC,&D9FB
  Push BC
DEC DE

  PUSH DE
  PUSH DE
LD HL,&7F00
  Push HL
Call PushDE_0000x
jp NextLine


PicFinalBattle3bmp_Line_36:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6667
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_37:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6677
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_38:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6687
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_39:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6699
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_40:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6711
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_41:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6723
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_42:
  PUSH DE
  PUSH DE
  PUSH DE
Ld E,&08
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+6731
Ld E,&00
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_43:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6743
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_44:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6755
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_45:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6767
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_46:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0144
  Push HL
LD BC,&00D0
  Push BC
  PUSH DE
LD HL,&00C3
  Push HL
LD BC,&F079
  Push BC
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_47:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6777
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_48:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6787
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_49:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6797
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_50:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6807
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_51:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6817
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_52:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6829
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_53:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6841
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_54:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6853
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_55:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6865
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_56:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&8CAF
  Push HL
LD BC,&8806
  Push BC
  PUSH DE
call BitmapPush6
defw BitmapData+6871
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_57:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6883
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_58:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+6893
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_59:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+6907
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_60:
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+6921
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_61:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6933
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_62:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6945
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_63:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6957
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_64:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6969
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_65:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6981
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_66:
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+6993
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_67:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7003
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_68:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&0899
  Push HL
LD BC,&BB23
  Push BC
  PUSH DE
LD HL,&DD33
  Push HL
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_69:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+7009
  PUSH DE
LD HL,&0300
  Push HL
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_70:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7019
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_71:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7029
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_72:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7039
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_73:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7049
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_74:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7059
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_75:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7069
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_76:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7079
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_77:
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+7087
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_78:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+7079
jp MultiPushDeLast5


PicFinalBattle3bmp_Line_79:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7097
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_80:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7107
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_81:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7117
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_82:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7127
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_83:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7137
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_84:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7147
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_85:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7157
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_86:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7167
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_87:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC77
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+7173
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_88:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&CC66
  Push HL
  PUSH DE
call BitmapPush6
defw BitmapData+7179
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_89:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7189
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_90:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+7201
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_91:
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+7211
 jp NextLinePushDe4


PicFinalBattle3bmp_Line_92:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&6600
  Push HL
  PUSH DE
call BitmapPush8
defw BitmapData+7219
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_93:
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&BBAA
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+7225
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_94:
  PUSH DE
  PUSH DE
LD HL,&0088
  Push HL
LD BC,&DDAA
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&66BB
  Push HL
Ld C,&00
  Push BC
 jp NextLinePushDe3


PicFinalBattle3bmp_Line_95:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+7231
  PUSH DE
  PUSH DE
LD HL,&66AA
  Push HL
LD BC,&9900
  Push BC
 jp NextLinePushDe3



PicFinalBattle3bmp_DrawOrder: 

  DEFW PicFinalBattle2bmp_Line_0
  DEFW PicFinalBattle3bmp_Line_1
  DEFW PicFinalBattle3bmp_Line_2
  DEFW PicFinalBattle3bmp_Line_3
  DEFW PicFinalBattle3bmp_Line_4
  DEFW PicFinalBattle3bmp_Line_5
  DEFW PicFinalBattle3bmp_Line_6
  DEFW PicFinalBattle3bmp_Line_7
  DEFW PicFinalBattle3bmp_Line_8
  DEFW PicFinalBattle3bmp_Line_9
  DEFW PicFinalBattle3bmp_Line_10
  DEFW PicFinalBattle3bmp_Line_11
  DEFW PicFinalBattle3bmp_Line_12
  DEFW PicFinalBattle3bmp_Line_13
  DEFW PicFinalBattle3bmp_Line_14
  DEFW PicFinalBattle3bmp_Line_15
  DEFW PicFinalBattle3bmp_Line_16
  DEFW PicFinalBattle3bmp_Line_17
  DEFW PicFinalBattle3bmp_Line_18
  DEFW PicFinalBattle3bmp_Line_19
  DEFW PicFinalBattle3bmp_Line_20
  DEFW PicFinalBattle3bmp_Line_21
  DEFW PicFinalBattle3bmp_Line_22
  DEFW PicFinalBattle3bmp_Line_23
  DEFW PicFinalBattle3bmp_Line_24
  DEFW PicFinalBattle3bmp_Line_25
  DEFW PicFinalBattle3bmp_Line_26
  DEFW PicFinalBattle3bmp_Line_27
  DEFW PicFinalBattle3bmp_Line_28
  DEFW PicFinalBattle3bmp_Line_29
  DEFW PicFinalBattle3bmp_Line_30
  DEFW PicFinalBattle3bmp_Line_31
  DEFW PicFinalBattle3bmp_Line_32
  DEFW PicFinalBattle3bmp_Line_33
  DEFW PicFinalBattle3bmp_Line_34
  DEFW PicFinalBattle3bmp_Line_35
  DEFW PicFinalBattle3bmp_Line_36
  DEFW PicFinalBattle3bmp_Line_37
  DEFW PicFinalBattle3bmp_Line_38
  DEFW PicFinalBattle3bmp_Line_39
  DEFW PicFinalBattle3bmp_Line_40
  DEFW PicFinalBattle3bmp_Line_41
  DEFW PicFinalBattle3bmp_Line_42
  DEFW PicFinalBattle3bmp_Line_43
  DEFW PicFinalBattle3bmp_Line_44
  DEFW PicFinalBattle3bmp_Line_45
  DEFW PicFinalBattle3bmp_Line_46
  DEFW PicFinalBattle3bmp_Line_47
  DEFW PicFinalBattle3bmp_Line_48
  DEFW PicFinalBattle3bmp_Line_49
  DEFW PicFinalBattle3bmp_Line_50
  DEFW PicFinalBattle3bmp_Line_51
  DEFW PicFinalBattle3bmp_Line_52
  DEFW PicFinalBattle3bmp_Line_53
  DEFW PicFinalBattle3bmp_Line_54
  DEFW PicFinalBattle3bmp_Line_55
  DEFW PicFinalBattle3bmp_Line_56
  DEFW PicFinalBattle3bmp_Line_57
  DEFW PicFinalBattle3bmp_Line_58
  DEFW PicFinalBattle3bmp_Line_59
  DEFW PicFinalBattle3bmp_Line_60
  DEFW PicFinalBattle3bmp_Line_61
  DEFW PicFinalBattle3bmp_Line_62
  DEFW PicFinalBattle3bmp_Line_63
  DEFW PicFinalBattle3bmp_Line_64
  DEFW PicFinalBattle3bmp_Line_65
  DEFW PicFinalBattle3bmp_Line_66
  DEFW PicFinalBattle3bmp_Line_67
  DEFW PicFinalBattle3bmp_Line_68
  DEFW PicFinalBattle3bmp_Line_69
  DEFW PicFinalBattle3bmp_Line_70
  DEFW PicFinalBattle3bmp_Line_71
  DEFW PicFinalBattle3bmp_Line_72
  DEFW PicFinalBattle3bmp_Line_73
  DEFW PicFinalBattle3bmp_Line_74
  DEFW PicFinalBattle3bmp_Line_75
  DEFW PicFinalBattle3bmp_Line_76
  DEFW PicFinalBattle3bmp_Line_77
  DEFW PicFinalBattle3bmp_Line_78
  DEFW PicFinalBattle3bmp_Line_79
  DEFW PicFinalBattle3bmp_Line_80
  DEFW PicFinalBattle3bmp_Line_81
  DEFW PicFinalBattle3bmp_Line_82
  DEFW PicFinalBattle3bmp_Line_83
  DEFW PicFinalBattle3bmp_Line_84
  DEFW PicFinalBattle3bmp_Line_85
  DEFW PicFinalBattle3bmp_Line_86
  DEFW PicFinalBattle3bmp_Line_87
  DEFW PicFinalBattle3bmp_Line_88
  DEFW PicFinalBattle3bmp_Line_89
  DEFW PicFinalBattle3bmp_Line_90
  DEFW PicFinalBattle3bmp_Line_91
  DEFW PicFinalBattle3bmp_Line_92
  DEFW PicFinalBattle3bmp_Line_93
  DEFW PicFinalBattle3bmp_Line_94
  DEFW PicFinalBattle3bmp_Line_95
  DEFW EndCode







;Global Code
EndCode:
ld sp,&0000:StackRestore_Plus2
ei
ret

MultiPushDeLast12: ld HL,NextLine
jr MultiPushDe12B 
MultiPushDe12: pop HL
jr MultiPushDe12B 
MultiPushDe9: pop HL
jr MultiPushDe9B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
MultiPushDe7: pop HL
jr MultiPushDe7B 
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

finalBitmapPush24: ld b,&0C
jr finalBitmapPush

finalBitmapPush22: ld b,&0B
jr finalBitmapPush

finalBitmapPush16: ld b,&08
jr finalBitmapPush

finalBitmapPush14: ld b,&07
jr finalBitmapPush

finalBitmapPush12: ld b,&06
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
ld hl,&0800+24
add hl,sp
ld sp,hl
jp nc,JumpToNextLine
ld hl,&c050
add hl,sp
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

defb &31,&F0,&F7,&E0,&00,&10,&CC,&00,&00,&10
defb &88,&10,&70,&C8,&20,&00,&80,&00,&00,&80
defb &32,&90,&C8,&00,&20,&00,&88,&00,&F1,&C0
defb &10,&00,&80,&00,&40,&00,&F0,&00,&00,&70
defb &E0,&80,&88,&00,&40,&10,&0F,&80,&30,&87
defb &3C,&80,&88,&00,&40,&21,&0F,&78,&C3,&3C
defb &C0,&80,&80,&00,&40,&30,&F0,&0F,&3C,&F0
defb &40,&80,&C4,&00,&50,&60,&00,&F0,&C8,&51
defb &14,&00,&C4,&00,&00,&88,&50,&E1,&00,&A0
defb &88,&54,&04,&10,&44,&00,&00,&88,&40,&FD
defb &00,&AA,&CC,&70,&8C,&20,&CC,&00,&00,&CC
defb &51,&7C,&88,&A0,&EE,&73,&8C,&40,&CC,&00
defb &11,&CC,&51,&7C,&CC,&F1,&BF,&FF,&19,&40
defb &CC,&00,&00,&88,&C8,&FF,&FF,&FF,&DF,&FF
defb &11,&11,&44,&00,&11,&66,&88,&B3,&FF,&FF
defb &FF,&EF,&33,&00,&00,&88,&CC,&B1,&FF,&C4
defb &33,&CE,&55,&CC,&44,&00,&11,&00,&99,&80
defb &FF,&E0,&77,&88,&99,&00,&88,&00,&88,&88
defb &B3,&F8,&EE,&00,&11,&00,&22,&C4,&80,&FF
defb &89,&0C,&11,&00,&88,&00,&A8,&40,&00,&41
defb &49,&02,&11,&00,&20,&88,&01,&43,&24,&01
defb &11,&00,&88,&00,&22,&00,&A8,&80,&06,&40
defb &24,&01,&22,&11,&00,&11,&60,&A2,&0C,&24
defb &20,&13,&22,&00,&50,&81,&08,&20,&41,&26
defb &88,&11,&00,&11,&30,&41,&00,&28,&40,&15
defb &EE,&00,&22,&00,&10,&82,&00,&10,&41,&3F
defb &FF,&00,&00,&44,&00,&02,&00,&08,&80,&15
defb &FF,&FB,&88,&00,&22,&00,&00,&04,&01,&00
defb &80,&02,&FF,&F7,&CC,&00,&00,&44,&00,&07
defb &0E,&10,&C0,&02,&32,&C7,&EE,&00,&22,&00
defb &88,&22,&89,&00,&81,&02,&10,&FF,&00,&44
defb &00,&55,&45,&00,&01,&01,&08,&EE,&22,&00
defb &88,&77,&CC,&08,&00,&00,&06,&00,&00,&44
defb &00,&77,&89,&02,&00,&02,&03,&08,&22,&00
defb &88,&77,&89,&01,&00,&04,&5D,&EE,&00,&03
defb &00,&02,&11,&00,&00,&BB,&FE,&88,&08,&09
defb &BB,&FF,&CC,&11,&FC,&EE,&00,&01,&77,&FF
defb &88,&00,&11,&00,&CC,&88,&FD,&EE,&08,&02
defb &BB,&FF,&CC,&01,&0E,&00,&55,&00,&31,&CC
defb &08,&13,&00,&77,&EE,&17,&CF,&F0,&A0,&80
defb &11,&00,&EE,&00,&33,&CC,&00,&04,&00,&33
defb &FF,&9F,&CF,&C3,&F0,&50,&00,&99,&55,&00
defb &33,&8C,&00,&02,&00,&11,&FF,&1F,&1E,&F0
defb &1E,&A0,&80,&A0,&BB,&64,&A0,&80,&EF,&0F
defb &3C,&F0,&E1,&D0,&50,&51,&AA,&DD,&50,&50
defb &22,&00,&01,&00,&00,&04,&07,&0F,&78,&F0
defb &F0,&A0,&A0,&B1,&55,&BB,&B0,&F0,&C0,&00
defb &00,&99,&22,&00,&02,&00,&00,&08,&03,&0F
defb &F0,&F0,&F0,&D0,&50,&73,&FF,&76,&70,&F0
defb &F0,&00,&43,&3C,&F0,&F0,&F0,&E0,&A0,&B3
defb &FF,&CC,&F0,&F0,&F0,&00,&50,&55,&FF,&D8
defb &70,&F0,&F0,&88,&70,&F0,&D2,&F0,&F0,&F0
defb &A0,&A2,&FF,&B0,&E0,&10,&E0,&CC,&00,&01
defb &78,&F0,&E1,&78,&F0,&F0,&50,&55,&76,&30
defb &F3,&88,&E0,&CC,&F0,&F0,&A0,&22,&A8,&70
defb &FF,&CC,&E0,&AA,&11,&EE,&00,&00,&00,&02
defb &00,&04,&F0,&B4,&F0,&D2,&F0,&F0,&40,&51
defb &40,&D1,&99,&EE,&71,&AA,&F0,&B4,&F0,&F0
defb &F0,&E0,&80,&F0,&88,&B3,&EE,&FF,&71,&66
defb &00,&10,&F0,&D2,&F0,&F0,&F0,&D0,&50,&F0
defb &50,&C4,&77,&99,&60,&44,&F0,&E0,&90,&F0
defb &90,&44,&33,&EE,&E8,&AA,&33,&CC,&00,&00
defb &00,&10,&00,&10,&E0,&00,&30,&F0,&F0,&D0
defb &30,&F0,&30,&67,&2A,&33,&D8,&44,&07,&0F
defb &08,&00,&00,&10,&F0,&F0,&C0,&F0,&F0,&E0
defb &B0,&F0,&A0,&FF,&2A,&11,&40,&A0,&F0,&F0
defb &F0,&30,&F0,&D0,&70,&F0,&20,&FF,&FF,&1D
defb &D0,&60,&07,&3F,&0C,&00,&00,&10,&70,&F0
defb &F0,&D0,&F0,&E0,&70,&E0,&51,&FF,&FD,&9D
defb &C0,&C0,&A0,&A0,&F0,&E0,&F0,&D0,&70,&F0
defb &73,&FF,&FB,&EE,&D0,&40,&50,&50,&70,&F0
defb &70,&A0,&70,&E0,&73,&80,&FF,&98,&A0,&C0
defb &A0,&A0,&B0,&00,&70,&50,&70,&D0,&62,&E0
defb &33,&10,&90,&80,&50,&50,&40,&55,&70,&A0
defb &70,&E0,&D1,&EE,&33,&30,&20,&80,&00,&A0
defb &A0,&AA,&88,&50,&70,&C0,&80,&FF,&22,&30
defb &50,&00,&00,&50,&40,&55,&FF,&A0,&F0,&E0
defb &80,&33,&CC,&E0,&B0,&00,&00,&20,&A0,&BB
defb &FF,&DC,&F0,&C0,&E0,&00,&30,&D0,&40,&00
defb &00,&10,&40,&77,&FF,&EE,&F0,&E0,&30,&F0
defb &F0,&20,&C0,&00,&00,&00,&00,&00,&00,&00
defb &80,&00,&00,&71,&00,&00,&00,&00,&00,&00
defb &40,&00,&00,&00,&00,&00,&00,&80,&00,&00
defb &00,&00,&00,&00,&60,&00,&00,&80,&00,&00
defb &00,&00,&20,&00,&C0,&00,&00,&00,&00,&00
defb &10,&00,&00,&00,&00,&00,&00,&00,&10,&00
defb &11,&00,&00,&00,&00,&00,&30,&00,&00,&00
defb &00,&10,&00,&00,&10,&00,&00,&00,&00,&00
defb &00,&00,&00,&80,&22,&00,&00,&00,&00,&00
defb &10,&00,&00,&00,&00,&10,&00,&00,&10,&00
defb &00,&00,&00,&00,&00,&00,&00,&44,&40,&00
defb &00,&00,&00,&00,&00,&80,&80,&00,&00,&10
defb &00,&00,&00,&80,&00,&00,&00,&11,&00,&00
defb &00,&20,&40,&00,&00,&00,&00,&00,&00,&80
defb &40,&00,&00,&00,&00,&00,&40,&40,&00,&00
defb &00,&51,&00,&00,&00,&22,&44,&00,&00,&00
defb &00,&10,&10,&80,&C0,&00,&00,&00,&00,&00
defb &40,&40,&00,&00,&00,&51,&00,&00,&11,&20
defb &40,&00,&00,&11,&00,&20,&12,&00,&80,&80
defb &00,&01,&80,&00,&80,&80,&00,&00,&00,&73
defb &00,&00,&30,&E8,&40,&00,&00,&11,&00,&40
defb &46,&00,&80,&82,&00,&01,&C0,&00,&80,&90
defb &88,&00,&00,&B7,&C4,&00,&C0,&10,&00,&00
defb &00,&33,&00,&80,&8C,&00,&80,&83,&00,&83
defb &80,&00,&40,&00,&88,&00,&22,&95,&22,&00
defb &98,&00,&99,&00,&00,&22,&00,&40,&88,&00
defb &08,&83,&10,&53,&80,&04,&00,&08,&88,&00
defb &32,&A4,&50,&00,&20,&EC,&11,&10,&00,&22
defb &00,&80,&0C,&00,&09,&12,&20,&31,&C0,&04
defb &09,&18,&44,&00,&32,&3C,&40,&C4,&00,&10
defb &33,&22,&00,&44,&02,&00,&84,&00,&09,&20
defb &40,&10,&20,&0C,&0D,&AC,&00,&00,&30,&3C
defb &00,&40,&10,&80,&11,&40,&00,&00,&0E,&00
defb &40,&00,&0B,&40,&40,&10,&20,&0C,&8D,&9E
defb &44,&00,&65,&1E,&00,&31,&40,&00,&11,&40
defb &00,&44,&4E,&00,&41,&10,&1B,&40,&40,&10
defb &21,&0E,&F0,&A4,&22,&00,&43,&D2,&10,&10
defb &30,&70,&11,&80,&05,&04,&C4,&01,&41,&20
defb &0B,&48,&40,&10,&21,&8E,&00,&C0,&44,&00
defb &97,&E3,&68,&10,&07,&0F,&00,&D0,&00,&02
defb &40,&02,&0D,&40,&70,&80,&48,&10,&21,&CE
defb &00,&00,&00,&00,&BC,&E5,&90,&D0,&F1,&FE
defb &00,&43,&00,&01,&40,&04,&07,&40,&C0,&00
defb &C0,&10,&21,&9E,&00,&00,&44,&00,&BD,&E9
defb &10,&7C,&10,&C4,&00,&43,&00,&00,&40,&00
defb &01,&48,&00,&00,&00,&00,&30,&F0,&00,&00
defb &22,&00,&DF,&E3,&B2,&7E,&64,&DD,&00,&43
defb &08,&01,&78,&C2,&00,&07,&00,&80,&00,&00
defb &00,&00,&00,&00,&00,&00,&67,&0E,&F6,&DC
defb &E8,&D4,&08,&01,&05,&04,&00,&00,&00,&00
defb &10,&00,&00,&40,&02,&00,&00,&00,&22,&00
defb &73,&CC,&FE,&98,&FE,&FF,&11,&01,&11,&EE
defb &00,&00,&00,&00,&90,&00,&00,&90,&0F,&00
defb &00,&00,&44,&00,&FD,&00,&77,&98,&FF,&FF
defb &19,&01,&33,&CC,&00,&00,&00,&00,&00,&80
defb &00,&18,&6F,&08,&00,&00,&22,&00,&EE,&44
defb &F7,&15,&FF,&11,&44,&00,&33,&CC,&00,&00
defb &00,&80,&02,&40,&CC,&1C,&2F,&7F,&FF,&FF
defb &44,&00,&88,&00,&F6,&3F,&7F,&98,&FD,&88
defb &33,&CD,&00,&00,&00,&80,&C2,&28,&00,&86
defb &8F,&DC,&00,&00,&22,&00,&A2,&00,&EC,&37
defb &1B,&B8,&F9,&FF,&33,&88,&99,&00,&10,&00
defb &4A,&28,&11,&43,&FF,&AA,&F0,&90,&44,&00
defb &80,&00,&C0,&26,&00,&F7,&33,&EF,&02,&01
defb &00,&00,&20,&00,&0E,&48,&01,&0B,&00,&40
defb &00,&00,&22,&00,&A2,&00,&80,&02,&00,&80
defb &00,&46,&04,&02,&00,&00,&10,&00,&1E,&08
defb &03,&4F,&A0,&88,&F0,&C0,&44,&00,&00,&00
defb &00,&06,&00,&50,&11,&22,&00,&00,&11,&00
defb &00,&91,&8F,&48,&03,&1F,&10,&00,&00,&30
defb &88,&00,&88,&00,&27,&AC,&0D,&20,&00,&01
defb &04,&02,&00,&00,&00,&80,&0F,&60,&03,&5F
defb &A2,&00,&F0,&F0,&CC,&00,&DD,&00,&1C,&B0
defb &8E,&20,&00,&00,&00,&15,&00,&00,&3C,&00
defb &2E,&08,&07,&FF,&40,&00,&00,&00,&88,&10
defb &AA,&99,&55,&00,&04,&70,&00,&99,&04,&00
defb &00,&00,&48,&00,&6F,&09,&07,&FF,&88,&66
defb &F0,&E0,&88,&30,&CC,&55,&04,&44,&44,&20
defb &00,&88,&08,&15,&00,&00,&80,&00,&FF,&0F
defb &07,&FF,&00,&44,&00,&10,&00,&20,&CC,&11
defb &22,&22,&08,&00,&00,&AA,&00,&00,&88,&44
defb &04,&00,&0F,&06,&17,&EF,&00,&00,&F0,&A2
defb &00,&20,&44,&33,&02,&00,&89,&08,&11,&88
defb &08,&13,&00,&00,&0C,&00,&03,&8E,&07,&6F
defb &00,&88,&00,&40,&00,&20,&44,&D1,&02,&00
defb &08,&26,&44,&CC,&00,&11,&00,&00,&08,&00
defb &8B,&09,&01,&1F,&00,&33,&E0,&88,&00,&20
defb &44,&11,&11,&00,&00,&00,&88,&89,&08,&13
defb &00,&00,&00,&00,&89,&4C,&00,&11,&00,&00
defb &10,&00,&00,&20,&44,&00,&89,&00,&00,&00
defb &88,&99,&00,&00,&00,&45,&00,&11,&FF,&88
defb &EE,&77,&FF,&FF,&FF,&FF,&22,&40,&80,&00
defb &01,&00,&23,&01,&88,&89,&00,&02,&00,&00
defb &00,&00,&00,&80,&00,&00,&22,&00,&00,&00
defb &55,&02,&00,&00,&02,&00,&08,&00,&88,&00
defb &00,&00,&00,&01,&00,&00,&EE,&88,&DD,&BB
defb &22,&77,&00,&00,&C8,&8B,&40,&06,&0C,&00
defb &0F,&4F,&00,&00,&00,&02,&00,&02,&00,&00
defb &20,&80,&40,&20,&20,&40,&00,&00,&80,&57
defb &40,&17,&CC,&00,&F7,&11,&00,&00,&08,&01
defb &11,&00,&00,&22,&22,&88,&44,&22,&AA,&44
defb &33,&FF,&80,&13,&01,&46,&EE,&20,&66,&00
defb &00,&00,&08,&00,&00,&04,&00,&00,&20,&80
defb &40,&20,&A0,&40,&20,&00,&00,&17,&03,&4E
defb &EE,&30,&EE,&00,&08,&00,&00,&00,&00,&0A
defb &00,&00,&AA,&88,&44,&22,&AA,&00,&22,&00
defb &00,&37,&B3,&4F,&EE,&10,&EF,&00,&04,&00
defb &00,&02,&00,&00,&00,&00,&22,&00,&00,&00
defb &A0,&00,&20,&00,&20,&06,&93,&CF,&CE,&00
defb &CF,&01,&00,&00,&08,&08,&23,&00,&00,&44
defb &22,&00,&00,&00,&AA,&00,&22,&00,&40,&00
defb &13,&8E,&1F,&88,&8F,&01,&02,&00,&01,&02
defb &00,&04,&00,&00,&22,&00,&00,&00,&A0,&00
defb &20,&00,&40,&00,&47,&0C,&1F,&88,&1E,&10
defb &00,&01,&02,&00,&02,&00,&00,&00,&00,&00
defb &06,&00,&AA,&01,&22,&00,&40,&00,&88,&00
defb &87,&88,&2C,&00,&02,&33,&01,&00,&02,&80
defb &22,&11,&00,&00,&0F,&0C,&80,&0A,&20,&00
defb &10,&00,&80,&10,&43,&08,&8C,&00,&01,&33
defb &00,&00,&00,&80,&00,&00,&00,&00,&0C,&06
defb &89,&05,&00,&00,&FE,&F7,&B3,&F9,&21,&08
defb &48,&00,&00,&03,&C0,&08,&09,&B0,&00,&00
defb &00,&00,&09,&0F,&02,&0B,&11,&00,&00,&80
defb &82,&40,&00,&11,&80,&00,&00,&09,&A0,&04
defb &14,&78,&00,&45,&08,&44,&07,&0F,&05,&06
defb &55,&CC,&00,&0C,&43,&40,&00,&10,&00,&00
defb &00,&00,&60,&0A,&10,&58,&00,&00,&08,&00
defb &0F,&0F,&02,&0C,&55,&CC,&00,&3F,&03,&3F
defb &00,&11,&00,&00,&00,&04,&61,&00,&14,&18
defb &00,&02,&08,&00,&0F,&0B,&05,&0B,&DD,&CC
defb &03,&8E,&13,&8E,&00,&10,&00,&00,&08,&00
defb &A0,&00,&12,&F8,&00,&10,&0C,&BB,&0F,&0A
defb &0B,&03,&BB,&88,&01,&CF,&13,&CF,&00,&11
defb &00,&00,&04,&02,&A1,&00,&33,&C8,&AA,&12
defb &06,&BB,&0F,&07,&07,&0F,&FF,&66,&01,&6E
defb &02,&8F,&00,&10,&00,&00,&00,&00,&90,&08
defb &75,&D8,&66,&34,&07,&BB,&0F,&0F,&0B,&0F
defb &FF,&66,&00,&FF,&11,&DF,&00,&11,&00,&00
defb &02,&01,&50,&40,&FF,&D6,&66,&68,&0F,&FF
defb &01,&09,&04,&0E,&77,&EF,&00,&00,&00,&00
defb &00,&10,&00,&00,&01,&00,&60,&A0,&98,&C6
defb &EE,&51,&0F,&FF,&0F,&0C,&09,&0F,&33,&CC
defb &00,&00,&00,&00,&00,&11,&04,&00,&00,&00
defb &70,&30,&EE,&56,&CD,&11,&07,&77,&AA,&AA
defb &22,&AA,&31,&C1,&00,&00,&00,&00,&00,&10
defb &02,&00,&00,&04,&30,&10,&FF,&BA,&CC,&11
defb &0B,&77,&CD,&0C,&45,&1D,&70,&C2,&99,&FF
defb &33,&FF,&00,&11,&00,&00,&00,&02,&82,&20
defb &DD,&FE,&89,&33,&07,&33,&CD,&15,&CD,&15
defb &30,&C1,&90,&10,&20,&00,&00,&10,&02,&00
defb &00,&00,&90,&E0,&EE,&FE,&8A,&77,&0B,&31
defb &CD,&04,&45,&15,&70,&C3,&99,&11,&22,&44
defb &00,&11,&00,&00,&00,&02,&90,&A0,&77,&EE
defb &80,&55,&07,&30,&67,&3B,&EF,&3F,&B0,&C1
defb &90,&10,&20,&40,&00,&10,&04,&00,&00,&00
defb &69,&20,&EE,&AA,&C2,&EE,&8B,&70,&BB,&FF
defb &77,&FF,&70,&C3,&99,&11,&22,&44,&00,&33
defb &00,&00,&00,&04,&18,&22,&77,&66,&82,&DD
defb &06,&F0,&BB,&FF,&FF,&FF,&B0,&C1,&90,&10
defb &20,&40,&00,&10,&18,&80,&02,&00,&58,&71
defb &EE,&AA,&D1,&FF,&8A,&70,&77,&FF,&77,&FF
defb &70,&C3,&99,&11,&33,&FF,&00,&99,&00,&00
defb &00,&04,&D0,&70,&FF,&EE,&84,&7F,&06,&F0
defb &FF,&FF,&BB,&FF,&30,&C1,&10,&10,&00,&00
defb &00,&10,&00,&00,&00,&01,&41,&20,&FF,&CC
defb &84,&1F,&0A,&70,&33,&EE,&55,&EE,&70,&C3
defb &11,&11,&00,&00,&11,&11,&00,&00,&00,&00
defb &61,&08,&7F,&0E,&80,&0F,&06,&70,&33,&DD
defb &BB,&C8,&30,&C1,&10,&10,&00,&00,&00,&10
defb &C0,&00,&00,&10,&24,&08,&2F,&0E,&E7,&07
defb &0E,&F0,&33,&AA,&55,&F8,&70,&C3,&EE,&00
defb &FF,&FF,&22,&11,&00,&00,&00,&30,&37,&88
defb &0F,&0E,&F7,&03,&0C,&F0,&33,&45,&2A,&F8
defb &B0,&C1,&00,&55,&00,&00,&00,&00,&00,&00
defb &00,&60,&77,&08,&0D,&0A,&EE,&02,&1C,&F0
defb &66,&8B,&19,&74,&70,&C2,&00,&DD,&10,&60
defb &00,&00,&00,&00,&40,&80,&57,&00,&05,&02
defb &AE,&02,&38,&E0,&DD,&07,&04,&FF,&B0,&E1
defb &80,&77,&00,&F0,&00,&00,&00,&00,&F0,&C0
defb &22,&00,&00,&60,&00,&00,&30,&D0,&88,&0F
defb &08,&77,&70,&E0,&E0,&77,&10,&71,&00,&00
defb &00,&00,&F0,&00,&00,&30,&00,&00,&00,&00
defb &30,&A0,&A0,&06,&00,&80,&30,&F0,&F8,&33
defb &20,&F0,&00,&00,&00,&00,&F0,&00,&11,&70
defb &10,&10,&00,&00,&70,&40,&50,&50,&50,&50
defb &10,&F0,&F4,&81,&50,&F0,&88,&00,&00,&DD
defb &E0,&00,&00,&10,&F0,&F0,&00,&00,&E0,&80
defb &E0,&B0,&F0,&F0,&10,&F0,&F4,&C2,&B0,&F0
defb &88,&00,&00,&DD,&E0,&00,&22,&60,&F0,&80
defb &00,&30,&F0,&40,&F0,&F0,&F0,&F0,&00,&F0
defb &F4,&E1,&70,&F0,&AA,&10,&66,&DD,&00,&00
defb &00,&00,&C0,&00,&00,&20,&E0,&80,&F0,&F0
defb &F0,&F0,&00,&F0,&F8,&F4,&F0,&F0,&EE,&20
defb &66,&DD,&00,&00,&88,&00,&C0,&11,&00,&70
defb &D0,&00,&F0,&F0,&F0,&F0,&00,&70,&C0,&FC
defb &F7,&98,&CC,&50,&66,&77,&00,&00,&00,&00
defb &00,&00,&00,&00,&A0,&00,&F0,&F0,&F0,&F0
defb &00,&70,&FF,&33,&EE,&77,&88,&30,&77,&FF
defb &00,&00,&00,&00,&00,&88,&00,&00,&40,&00
defb &F0,&F0,&F0,&F0,&00,&70,&FF,&CC,&99,&FF
defb &00,&50,&33,&FF,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&F0,&E0,&F0,&F0,&00,&70
defb &EE,&3B,&EE,&3B,&88,&30,&33,&FF,&00,&00
defb &00,&00,&22,&00,&00,&00,&00,&00,&F0,&C0
defb &F0,&F0,&00,&F0,&CD,&15,&CD,&15,&08,&51
defb &11,&FF,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&F0,&C0,&F0,&F0,&00,&F0,&89,&15
defb &CD,&04,&04,&33,&00,&CF,&00,&00,&00,&00
defb &44,&00,&00,&00,&00,&00,&F0,&C0,&F0,&F0
defb &10,&F0,&CC,&09,&8C,&19,&08,&33,&00,&0F
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &F0,&80,&F0,&F0,&00,&F0,&EE,&03,&8E,&33
defb &04,&33,&00,&07,&00,&00,&00,&00,&88,&00
defb &00,&00,&00,&00,&F0,&40,&F0,&F0,&10,&70
defb &BB,&8F,&8F,&FF,&0A,&11,&00,&0F,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&E0,&80
defb &F0,&F0,&20,&B0,&77,&CF,&8F,&EE,&04,&11
defb &00,&07,&00,&00,&00,&00,&00,&00,&00,&11
defb &00,&00,&D0,&00,&F0,&F0,&10,&50,&FF,&DE
defb &9F,&FF,&0A,&00,&00,&07,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&A0,&80,&F0,&F0
defb &20,&A0,&99,&FE,&FF,&99,&0D,&00,&00,&03
defb &00,&00,&00,&00,&00,&00,&00,&22,&00,&00
defb &50,&00,&70,&F0,&50,&50,&11,&CE,&77,&00
defb &0E,&08,&00,&02,&00,&00,&00,&00,&00,&00
defb &00,&22,&00,&00,&A0,&00,&A0,&A0,&20,&A0
defb &33,&8D,&77,&E0,&07,&04,&00,&01,&00,&00
defb &00,&00,&00,&00,&00,&44,&00,&00,&50,&00
defb &50,&50,&50,&50,&FF,&0B,&3F,&FC,&0B,&0F
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&44
defb &00,&00,&A0,&00,&A0,&A0,&A0,&A0,&00,&00
defb &00,&40,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&10,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&40,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&10,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&40
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&10,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&40,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&10,&F0,&00,&00,&70
defb &00,&00,&00,&00,&00,&00,&00,&80,&00,&00
defb &00,&00,&00,&00,&00,&40,&00,&00,&00,&10
defb &00,&C0,&00,&C0,&00,&00,&00,&00,&00,&00
defb &00,&80,&00,&00,&00,&00,&00,&00,&00,&40
defb &00,&00,&00,&10,&00,&60,&10,&00,&00,&00
defb &00,&00,&00,&00,&10,&00,&00,&00,&00,&00
defb &00,&00,&00,&60,&00,&00,&00,&10,&00,&20
defb &20,&00,&00,&00,&00,&00,&00,&00,&10,&00
defb &00,&00,&00,&00,&00,&00,&00,&60,&00,&00
defb &00,&10,&00,&10,&50,&00,&00,&00,&00,&00
defb &00,&00,&40,&00,&40,&00,&40,&00,&E0,&00
defb &00,&10,&80,&00,&00,&00,&00,&10,&F0,&F0
defb &00,&10,&00,&00,&00,&00,&40,&00,&40,&00
defb &C0,&00,&10,&F0,&00,&00,&80,&00,&00,&00
defb &D0,&10,&F0,&10,&00,&30,&00,&00,&00,&00
defb &80,&00,&40,&00,&00,&00,&00,&00,&00,&00
defb &60,&20,&00,&00,&E0,&10,&30,&E0,&00,&C0
defb &00,&00,&00,&00,&80,&00,&40,&00,&00,&00
defb &00,&00,&00,&00,&60,&20,&80,&00,&F0,&80
defb &F0,&F0,&30,&F0,&00,&00,&00,&00,&00,&20
defb &70,&E0,&00,&00,&00,&00,&00,&00,&10,&90
defb &80,&00,&90,&80,&C0,&30,&70,&70,&00,&00
defb &00,&00,&00,&20,&70,&E0,&00,&00,&00,&00
defb &00,&00,&10,&90,&80,&00,&E0,&C0,&F0,&F0
defb &70,&40,&00,&00,&80,&00,&00,&00,&80,&20
defb &00,&00,&00,&00,&00,&00,&00,&10,&00,&00
defb &F0,&C0,&00,&F0,&F0,&F0,&00,&00,&80,&00
defb &00,&00,&80,&20,&00,&00,&00,&00,&00,&00
defb &00,&10,&00,&00,&C3,&C0,&78,&F0,&D0,&C3
defb &00,&00,&30,&00,&00,&00,&00,&10,&00,&30
defb &00,&00,&80,&00,&00,&00,&00,&00,&3C,&40
defb &87,&96,&90,&B4,&00,&10,&30,&00,&00,&00
defb &00,&10,&00,&30,&10,&C0,&80,&40,&00,&00
defb &00,&00,&E3,&80,&F9,&FF,&B0,&6F,&00,&10
defb &40,&30,&C0,&00,&00,&00,&80,&40,&00,&70
defb &40,&70,&00,&00,&00,&00,&2F,&00,&9E,&F4
defb &F3,&E7,&00,&10,&40,&30,&C0,&00,&00,&00
defb &80,&40,&C0,&00,&40,&20,&00,&00,&00,&00
defb &2B,&00,&9D,&5F,&F7,&E7,&00,&10,&40,&00
defb &30,&00,&00,&00,&B0,&00,&00,&00,&30,&20
defb &00,&00,&00,&00,&1F,&00,&5F,&5F,&E7,&F7
defb &00,&10,&40,&00,&30,&00,&00,&00,&B0,&00
defb &00,&00,&30,&20,&00,&00,&00,&00,&3F,&00
defb &8F,&EF,&E7,&F3,&00,&10,&40,&00,&00,&C0
defb &00,&00,&80,&00,&00,&00,&00,&20,&00,&00
defb &00,&00,&EE,&00,&FF,&FF,&F3,&FB,&00,&10
defb &40,&00,&00,&C0,&00,&00,&80,&00,&00,&00
defb &00,&20,&00,&00,&00,&00,&EE,&00,&FF,&DF
defb &B1,&EE,&00,&10,&40,&00,&00,&00,&00,&00
defb &80,&00,&00,&00,&00,&20,&00,&00,&00,&00
defb &CC,&00,&77,&BF,&D0,&EE,&00,&10,&40,&00
defb &00,&00,&00,&00,&80,&00,&00,&00,&00,&20
defb &00,&00,&00,&00,&88,&00,&91,&FF,&A0,&F7
defb &00,&00,&40,&00,&00,&00,&00,&00,&80,&00
defb &00,&00,&00,&20,&00,&00,&00,&00,&00,&00
defb &D9,&FE,&D0,&53,&00,&00,&40,&00,&00,&00
defb &00,&00,&80,&00,&00,&00,&00,&20,&00,&00
defb &00,&00,&00,&00,&FF,&1C,&E0,&87,&00,&00
defb &40,&00,&00,&00,&00,&00,&80,&00,&00,&00
defb &00,&20,&00,&00,&00,&00,&00,&00,&6F,&06
defb &D0,&07,&FF,&CC,&40,&00,&00,&00,&00,&00
defb &80,&00,&00,&00,&00,&20,&00,&00,&CC,&00
defb &00,&00,&0F,&06,&E0,&0F,&00,&22,&40,&00
defb &00,&00,&00,&00,&80,&00,&00,&00,&00,&20
defb &00,&00,&22,&00,&00,&11,&03,&07,&F0,&1F
defb &00,&67,&40,&00,&00,&00,&00,&00,&80,&00
defb &00,&00,&00,&20,&00,&00,&11,&00,&00,&22
defb &0D,&07,&60,&37,&77,&22,&40,&00,&00,&00
defb &00,&00,&80,&00,&00,&00,&00,&20,&00,&00
defb &33,&88,&00,&44,&0A,&77,&58,&37,&AA,&AA
defb &40,&00,&00,&00,&00,&00,&80,&00,&00,&00
defb &00,&20,&00,&00,&AA,&44,&88,&91,&8E,&7F
defb &04,&77,&FF,&AB,&40,&00,&00,&00,&00,&00
defb &80,&00,&00,&00,&00,&20,&00,&00,&44,&AA
defb &FE,&33,&CD,&3B,&04,&77,&55,&23,&40,&00
defb &00,&00,&00,&00,&80,&00,&00,&00,&00,&20
defb &00,&00,&CC,&11,&EC,&77,&EF,&33,&04,&77
defb &00,&22,&40,&00,&00,&00,&00,&00,&80,&00
defb &00,&00,&00,&20,&88,&00,&AA,&AA,&C8,&55
defb &FF,&00,&04,&33,&88,&AB,&40,&00,&00,&00
defb &00,&00,&80,&00,&00,&00,&00,&20,&CC,&00
defb &44,&EE,&80,&33,&FF,&FF,&04,&07,&55,&22
defb &40,&00,&00,&00,&00,&00,&80,&00,&00,&00
defb &00,&60,&22,&00,&88,&CC,&C8,&00,&37,&FF
defb &04,&0E,&22,&22,&60,&80,&00,&30,&00,&00
defb &80,&00,&00,&20,&40,&E0,&99,&00,&00,&99
defb &EC,&CC,&0B,&FF,&0C,&0F,&55,&66,&D0,&80
defb &00,&10,&00,&00,&40,&00,&00,&20,&60,&C0
defb &AA,&88,&00,&FF,&FD,&AA,&0D,&3B,&04,&0F
defb &88,&AB,&F0,&00,&00,&00,&00,&00,&40,&00
defb &00,&30,&30,&40,&66,&88,&FF,&99,&FC,&EE
defb &0F,&1D,&04,&0F,&FF,&CC,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&11,&F0
defb &CC,&88,&F0,&C4,&0F,&1E,&F0,&87,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&22,&70,&44,&88,&96,&E2,&0F,&0F
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&74,&70,&11,&CC
defb &96,&F1,&EF,&0F,&87,&F3,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F8,&70,&DD,&88,&96,&F0,&FF,&0F,&0F,&FF
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&B0,&C4,&11,&3C,&F0
defb &FF,&9E,&1F,&FF,&F0,&E1,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&90
defb &F3,&AA,&F0,&F0,&F0,&2D,&1F,&FF,&F0,&E1
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F2,&D0,&F1,&64,&F0,&F0,&F0,&F0
defb &5E,&F0,&F0,&E1,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F1,&D0,&F0,&E8
defb &F0,&F0,&F0,&F0,&DE,&F0,&F0,&E1,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &F1,&C0,&F0,&0E,&F0,&F0,&F0,&F0,&3C,&F0
defb &F0,&F0,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&07,&0F,&F0,&E8,&0F,&0E,&0F,&0F
defb &0F,&0F,&03,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&07,&0F,&70,&E8
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &07,&0F,&70,&F4,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&1E,&F0,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&03,&0F,&70,&F2,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&1E,&F0
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&90,&C3
defb &31,&F1,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&F0,&F0,&F0,&F0,&F0,&F0,&0F,&0F
defb &0F,&0F,&F0,&C3,&30,&F8,&0F,&1E,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&90,&F7
defb &0F,&1E,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &FC,&F0,&0C,&F0,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F8,&F0,&F3,&FF,&0E,&F0,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&3C
defb &0F,&0F,&0F,&0F,&F0,&F0,&F0,&F0,&00,&00
defb &0E,&00,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&3C,&0F,&0F,&0F,&0F,&0F,&0F
defb &00,&01,&0F,&0E,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&F0,&F0,&F0,&F0,&F0,&F0,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&F0,&F0,&F0,&F0
defb &F0,&F0,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F,&0F
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0
defb &F0,&F0,&F0,&F0,&F0,&F0,&F0,&F0,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&00,&00,&00,&00
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&77,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&BB,&FF
defb &DD,&11,&FF,&FF,&FF,&FF,&FF,&FF,&77,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&11,&FF,&DD,&55,&FF,&FF,&EE,&88
defb &AA,&22,&55,&88,&88,&DD,&22,&00,&22,&AA
defb &AA,&22,&EE,&22,&FF,&FF,&33,&FF,&DD,&55
defb &FF,&FF,&EE,&99,&AA,&EE,&55,&AA,&AA,&DD
defb &AA,&AA,&AA,&22,&AA,&EE,&EE,&AA,&FF,&FF
defb &11,&FF,&DD,&55,&FF,&FF,&AA,&CC,&AA,&66
defb &11,&AA,&88,&CC,&22,&EE,&BB,&66,&AA,&EE
defb &EE,&AA,&FF,&FF,&BB,&FF,&DD,&11,&FF,&FF
defb &00,&88,&22,&22,&FF,&AA,&AA,&FF,&AA,&EE
defb &33,&66,&AA,&22,&EE,&88,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&DD,&FF
defb &FF,&DD,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&00,&11,&00,&00,&00,&00,&00,&00
defb &00,&00,&33,&00,&00,&EE,&00,&00,&00,&00
defb &00,&00,&00,&00,&88,&00,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&88,&99,&AA,&88
defb &33,&88,&44,&99,&66,&CC,&33,&DD,&11,&11
defb &11,&11,&99,&11,&FF,&FF,&FF,&FF,&FF,&FF
defb &AA,&BB,&AA,&AA,&77,&DD,&55,&BB,&66,&DD
defb &77,&DD,&55,&77,&55,&55,&BB,&BB,&FF,&FF
defb &FF,&FF,&FF,&FF,&AA,&DD,&AA,&99,&BB,&DD
defb &44,&DD,&66,&DD,&33,&DD,&55,&55,&33,&11
defb &DD,&BB,&FF,&FF,&FF,&FF,&FF,&FF,&AA,&99
defb &88,&AA,&33,&DD,&44,&99,&22,&55,&33,&DD
defb &55,&11,&55,&55,&99,&BB,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF
defb &44,&55,&11,&22,&77,&11,&22,&22,&11,&11
defb &55,&BB,&33,&55,&00,&00,&00,&00,&00,&00
defb &00,&00,&88,&00,&DD,&55,&55,&66,&FF,&77
defb &66,&AA,&55,&77,&55,&BB,&33,&55,&00,&00
defb &00,&00,&00,&00,&00,&00,&88,&00,&55,&77
defb &33,&22,&77,&55,&22,&77,&11,&55,&55,&BB
defb &33,&55,&00,&00,&00,&00,&00,&00,&00,&00
defb &88,&00,&55,&55,&55,&22,&77,&11,&22,&AA
defb &55,&11,&44,&99,&33,&BB,&00,&00,&00,&00
defb &00,&00,&00,&00,&88,&00,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&FF,&FF,&33,&FF
defb &00,&00,&00,&00,&00,&00,&00,&00,&88,&00
defb &00,&FF,&00,&00,&00,&00,&00,&FF,&00,&00
defb &00,&00,&33,&FF,&00,&00,&00,&00,&00,&00
defb &00,&00,&88,&00,&FF,&FF,&FF,&FF,&FF,&FF
defb &FF,&FF,&FF,&FF,&FF,&FF,&33,&FF,&00,&00
defb &00,&00,&00,&00,&00,&00,&88,&00,&00,&FF
defb &00,&00,&00,&00,&00,&FF,&00,&00,&00,&00
defb &33,&FF,&00,&00,&00,&00,&00,&00,&00,&00
defb &88,&00,&10,&00,&30,&70,&A0,&00,&10,&00
defb &30,&D2,&C0,&30,&00,&10,&00,&30,&D2,&C0
defb &30,&00,&30,&00,&30,&96,&80,&30,&F0,&00
defb &30,&1E,&80,&52,&80,&00,&00,&00,&00,&F0
defb &00,&30,&1E,&80,&52,&80,&B4,&00,&21,&1E
defb &30,&96,&80,&00,&00,&B4,&00,&21,&1E,&30
defb &96,&80,&00,&10,&B4,&00,&61,&1E,&70,&1E
defb &80,&00,&00,&00,&10,&B4,&70,&E1,&0F,&E1
defb &0F,&48,&00,&00,&00,&10,&B4,&70,&00,&00
defb &10,&0E,&40,&10,&30,&61,&83,&E0,&00,&00
defb &00,&10,&0E,&40,&10,&30,&61,&83,&E0,&00
defb &00,&00,&0E,&80,&00,&80,&00,&00,&60,&00
defb &00,&00,&00,&10,&80,&00,&00,&C0,&20,&00
defb &00,&10,&30,&80,&00,&30,&80,&00,&E0,&80
defb &00,&10,&F0,&C0,&00,&30,&F0,&00,&F0,&80
defb &00,&10,&B4,&28,&C0,&61,&F0,&00,&10,&A5
defb &E0,&00,&01,&0F,&38,&00,&C3,&B4,&00,&10
defb &A5,&E0,&00,&01,&0F,&38,&00,&C3,&B4,&00
defb &10,&87,&A4,&00,&20,&0F,&C0,&00,&C3,&B4
defb &80,&10,&87,&A4,&00,&20,&0F,&C0,&00,&C3
defb &B4,&80,&10,&E1,&2C,&00,&10,&69,&40,&00
defb &87,&B4,&80,&10,&E1,&2C,&00,&10,&69,&40
defb &00,&87,&B4,&80,&00,&40,&00,&87,&1E,&80
defb &40,&00,&87,&1E,&80,&10,&F0,&F0,&60,&00
defb &43,&1E,&80,&10,&00,&10,&80,&00,&00,&60
defb &00,&43,&1E,&80,&F0,&00,&00,&60,&00,&10
defb &B0,&80,&60,&00,&10,&B0,&80,&10,&00,&F0
defb &40,&00,&70,&00,&F0,&40,&00,&70,&00,&10
defb &00,&D2,&C0,&00,&60,&00,&40,&00,&80,&00
defb &20,&96,&48,&00,&80,&00,&70,&70,&00,&A0
defb &00,&30,&87,&48,&10,&00,&00,&70,&70,&00
defb &A0,&00,&30,&87,&48,&10,&00,&70,&E1,&B4
defb &00,&52,&00,&40,&43,&48,&80,&00,&10,&E1
defb &B4,&00,&52,&00,&40,&43,&48,&80,&00,&43
defb &A4,&80,&52,&00,&80,&30,&F0,&00,&61,&96
defb &70,&00,&F0,&00,&10,&C0,&00,&80,&00,&61
defb &96,&70,&00,&F0,&00,&10,&C0,&00,&80,&00
defb &80,&00,&10,&00,&00,&C3,&2C,&00,&80,&00
defb &00,&80,&00,&10,&21,&80,&20,&00,&00,&43
defb &3C,&00,&40,&00,&00,&21,&80,&20,&83,&80
defb &C0,&00,&00,&21,&3C,&00,&80,&00,&00,&83
defb &80,&C0,&00,&30,&B4,&00,&40,&00,&00,&03
defb &90,&00,&00,&40,&E0,&80,&80,&00,&00,&90
defb &20,&00,&00,&40,&10,&00,&80,&00,&00,&80
defb &C0,&00,&00,&80,&80,&00,&00,&01,&48,&00
defb &00,&C0,&00,&40,&80,&00,&00,&A0,&80,&00
defb &20,&00,&C0,&00,&40,&80,&10,&F0,&80,&00
defb &00,&40,&00,&10,&C0,&00,&00,&20,&00,&30
defb &C0,&00,&00,&80,&00,&20,&52,&60,&00,&80
defb &00,&20,&43,&A4,&10,&00,&00,&40,&43,&A4
defb &80,&00,&00,&21,&68,&40,&00,&10,&90,&80
defb &00,&10,&C0,&80,&00,&90,&4B,&80,&80,&00
defb &00,&30,&C0,&00,&10,&00,&00,&30,&F0,&80
defb &10,&00,&A0,&30,&40,&00,&20,&10,&F0,&D0
defb &E0,&00,&20,&20,&80,&F0,&F0,&00,&20,&70
defb &F0,&E0,&D0,&00,&00,&70,&C0,&70,&60,&80
defb &00,&B0,&21,&F0,&E0,&80,&00,&60,&87,&F8
defb &E0,&80,&C0,&00,&00,&0D,&0C,&04,&00,&D0
defb &2F,&F8,&F4,&80,&C0,&00,&00,&07,&0E,&0C
defb &84,&00,&FF,&8B,&0F,&1D,&FF,&00,&00,&81
defb &27,&F8,&BE,&80,&00,&10,&A4,&00,&88,&07
defb &0E,&0C,&11,&00,&00,&33,&1F,&FD,&BE,&80
defb &00,&30,&2C,&00,&88,&0F,&28,&14,&D1,&00
defb &22,&99,&FF,&75,&DC,&80,&00,&21,&0E,&00
defb &D8,&B0,&20,&00,&D1,&00,&22,&99,&FF,&75
defb &B8,&C0,&00,&10,&48,&30,&D8,&F0,&C0,&F0
defb &D1,&00,&11,&00,&EE,&FF,&50,&00,&00,&10
defb &80,&30,&F8,&F0,&D2,&D2,&D1,&00,&00,&88
defb &17,&FF,&B0,&80,&80,&10,&9E,&E1,&F0,&87
defb &91,&C0,&00,&44,&00,&77,&70,&80,&00,&30
defb &8F,&4B,&78,&C3,&D1,&C0,&00,&44,&00,&07
defb &A0,&80,&80,&10,&CB,&69,&1E,&4B,&F1,&E0
defb &00,&22,&01,&0D,&48,&00,&00,&10,&CB,&2D
defb &0F,&4B,&F1,&E0,&00,&77,&F7,&0F,&04,&00
defb &00,&10,&F0,&F0,&80,&00,&00,&10,&E9,&0F
defb &0F,&0F,&3D,&68,&00,&77,&F7,&8E,&0C,&00
defb &00,&20,&20,&20,&40,&00,&E9,&2D,&5F,&0F
defb &3D,&2C,&00,&33,&00,&0D,&0C,&00,&00,&60
defb &E0,&A0,&E0,&00,&88,&03,&0C,&00,&00,&60
defb &A0,&30,&40,&00,&F8,&0F,&7F,&AF,&3D,&2C
defb &89,&0F,&0E,&00,&00,&60,&20,&A0,&60,&00
defb &F8,&6F,&FF,&FF,&1F,&2C,&03,&0F,&0E,&00
defb &00,&70,&F0,&F0,&C0,&00,&00,&30,&F8,&3F
defb &FF,&FF,&9F,&2C,&07,&0F,&0E,&00,&00,&20
defb &A0,&A0,&A0,&00,&00,&30,&E9,&0F,&FF,&FF
defb &9F,&2C,&00,&10,&CB,&1F,&2F,&EF,&DF,&3C
defb &00,&70,&8F,&D3,&5A,&6F,&5F,&F0,&00,&30
defb &9E,&E1,&78,&96,&B5,&F0,&80,&00,&00,&FF
defb &88,&00,&F8,&F0,&F0,&F0,&F1,&F0,&80,&00
defb &33,&CC,&06,&00,&02,&00,&00,&01,&0E,&04
defb &02,&00,&F3,&FE,&A4,&00,&00,&01,&01,&04
defb &00,&01,&03,&08,&07,&07,&02,&34,&0E,&00
defb &1F,&0C,&06,&01,&01,&04,&07,&04,&05,&03
defb &08,&07,&04,&00,&05,&C2,&04,&01,&0E,&04
defb &01,&02,&09,&02,&04,&09,&04,&00,&00,&01
defb &02,&04,&01,&04,&0A,&6D,&00,&01,&02,&04
defb &07,&04,&0B,&08,&0C,&00,&05,&42,&04,&01
defb &00,&04,&07,&02,&09,&02,&04,&09,&04,&00
defb &00,&01,&02,&04,&09,&04,&1A,&08,&02,&00
defb &05,&02,&04,&01,&00,&04,&00,&01,&02,&04
defb &0F,&04,&0A,&05,&0C,&00,&04,&1D,&04,&01
defb &00,&04,&0F,&01,&01,&02,&04,&07,&04,&00
defb &00,&01,&00,&00,&00,&09,&00,&00,&00,&11
defb &4C,&00,&80,&00,&00,&13,&08,&00,&00,&27
defb &AF,&00,&A2,&88,&26,&AF,&AE,&00,&00,&44
defb &19,&44,&42,&4C,&44,&19,&02,&00,&00,&27
defb &AF,&27,&C8,&27,&AE,&AF,&AE,&00,&00,&02
defb &0A,&4E,&42,&4C,&46,&55,&44,&00,&00,&02
defb &1A,&F6,&E0,&00,&00,&55,&44,&00,&77,&00
defb &80,&00,&00,&23,&E8,&00,&10,&80,&00,&27
defb &8C,&CC,&EE,&CC,&40,&00,&00,&32,&10,&E8
defb &00,&32,&80,&22,&8C,&DD,&BB,&88,&40,&13
defb &4C,&DD,&77,&00,&20,&00,&00,&20,&F4,&00
defb &20,&01,&88,&FF,&EE,&EE,&00,&88,&11,&F4
defb &00,&62,&10,&11,&08,&FF,&DD,&EE,&00,&80
defb &20,&00,&00,&30,&88,&81,&10,&FF,&FF,&88
defb &80,&00,&60,&51,&10,&F7,&EE,&00,&F2,&C8
defb &20,&41,&11,&F3,&FF,&CC,&00,&20,&3B,&E8
defb &33,&88,&00,&70,&C0,&20,&3B,&CC,&20,&70
defb &C3,&0F,&78,&F0,&A4,&A0,&77,&CC,&30,&18
defb &F0,&3C,&F0,&C0,&79,&D0,&77,&88,&00,&18
defb &50,&EC,&60,&C4,&79,&D8,&77,&88,&30,&19
defb &44,&CC,&62,&D9,&E1,&D8,&FF,&88,&10,&18
defb &51,&EE,&64,&F3,&E1,&D8,&FF,&00,&00,&5C
defb &F7,&FF,&70,&F7,&EB,&D8,&FF,&00,&00,&77
defb &FF,&BB,&FF,&FF,&FB,&D3,&EE,&00,&00,&37
defb &FF,&DD,&FF,&FF,&EE,&B7,&EE,&00,&00,&3B
defb &FF,&FF,&FF,&BB,&FC,&3F,&CC,&00,&30,&F0
defb &80,&9D,&FF,&FF,&EE,&77,&E9,&33,&CC,&00
defb &C0,&00,&60,&44,&FF,&88,&22,&FF,&42,&13
defb &CC,&00,&7E,&B0,&CE,&04,&77,&CC,&F1,&EE
defb &04,&01,&88,&00,&19,&FF,&02,&45,&1B,&FE
defb &F3,&CD,&08,&00,&02,&02,&00,&3F,&FF,&8F
defb &00,&08,&06,&00,&08,&00,&42,&44,&13,&20
defb &7F,&40,&88,&8C,&04,&00,&78,&30,&C2,&08
defb &00,&18,&00,&80,&08,&44,&08,&00,&79,&F0
defb &C3,&00,&01,&00,&20,&00,&00,&12,&74,&F8
defb &D5,&8C,&11,&00,&40,&00,&00,&34,&32,&F0
defb &BB,&CF,&01,&00,&20,&00,&01,&18,&11,&F1
defb &77,&EF,&8A,&00,&40,&00,&36,&30,&00,&AA
defb &73,&CC,&2E,&00,&40,&00,&38,&71,&11,&EF
defb &F9,&88,&04,&00,&E0,&08,&2C,&A1,&88,&00
defb &23,&1F,&FD,&11,&02,&00,&40,&88,&24,&00
defb &08,&00,&13,&EF,&EC,&23,&8A,&00,&01,&00
defb &44,&00,&26,&00,&23,&1F,&88,&13,&22,&00
defb &23,&00,&04,&00,&57,&00,&11,&EF,&00,&27
defb &03,&00,&00,&AA,&00,&5F,&04,&00,&00,&67
defb &02,&04,&4E,&4C,&11,&BB,&01,&AB,&04,&00
defb &00,&0C,&22,&44,&22,&00,&88,&00,&04,&00
defb &01,&88,&2E,&26,&33,&FF,&CC,&00,&37,&CF
defb &7F,&FF,&88,&00,&01,&00,&06,&02,&77,&FF
defb &EE,&00,&FF,&FF,&CC,&00,&01,&00,&46,&11
defb &44,&44,&66,&00,&88,&88,&CC,&06,&03,&00
defb &46,&00,&66,&EE,&EE,&00,&DD,&DD,&CC,&22
defb &22,&00,&04,&88,&77,&FF,&CC,&00,&FF,&FF
defb &88,&03,&02,&00,&02,&44,&EE,&AA,&88,&00
defb &00,&11,&DD,&55,&00,&11,&02,&03,&22,&44
defb &44,&00,&88,&00,&0A,&01,&02,&2E,&0B,&66
defb &66,&AA,&88,&00,&DD,&45,&0A,&00,&01,&5D
defb &17,&22,&11,&FF,&01,&77,&88,&08,&DD,&44
defb &22,&8B,&00,&07,&01,&FF,&AB,&DF,&DD,&CC
defb &33,&89,&03,&AE,&0D,&7F,&00,&33,&88,&88
defb &11,&11,&02,&55,&47,&EE,&88,&11,&CC,&88
defb &11,&01,&0E,&22,&8A,&DD,&5F,&00,&88,&88
defb &11,&00,&08,&55,&44,&AB,&01,&00,&11,&CC
defb &33,&88,&00,&33,&CC,&45,&07,&08,&33,&EE
defb &77,&CC,&00,&77,&CC,&8A,&0F,&00,&33,&66
defb &66,&CC,&88,&77,&CC,&46,&0F,&2A,&66,&CC
defb &00,&77,&CC,&05,&0E,&00,&33,&EE,&77,&CC
defb &00,&77,&CC,&8D,&0D,&00,&11,&88,&33,&00
defb &88,&77,&CC,&0D,&0A,&22,&00,&CC,&11,&88
defb &00,&66,&8A,&05,&04,&00,&00,&88,&11,&00
defb &00,&55,&04,&0C,&0A,&00,&11,&88,&33,&00
defb &00,&23,&0E,&05,&04,&00,&00,&88,&11,&00
defb &00,&0F,&0C,&04,&08,&00,&11,&88,&33,&00
defb &88,&0F,&0A,&8A,&44,&22,&33,&88,&77,&00
defb &00,&0F,&0C,&00,&FF,&88,&89,&0F,&0A,&00
defb &DD,&99,&CD,&4F,&04,&66,&33,&11,&DD,&00
defb &00,&11,&AA,&00,&AB,&8F,&3B,&BB,&DD,&FF
defb &11,&00,&88,&33,&89,&4F,&00,&66,&33,&11
defb &99,&00,&00,&11,&22,&99,&01,&8E,&08,&00
defb &00,&66,&BB,&44,&00,&0D,&00,&11,&BB,&44
defb &88,&00
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

DrawRawBmp:
RawBmpRepeatNextLine:
ld c,b
ld b,IXL
RawBmpRepeat:
pop de
ld (hl),d
dec hl
ld (hl),e
dec hl
djnz RawBmpRepeat
ld de,&0800+24
add hl,de
jp nc,JumpToNextLineRawBmp
ld de,&c050
add hl,de
JumpToNextLineRawBmp:
ld b,c
djnz RawBmpRepeatNextLine
ld sp,&0000:StackRestore_PlusRawBmp2
list
ei
ret



;save direct "T53-SC1.D02",&4000,&3000	;address,size...}[,exec_address]


