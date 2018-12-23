org &8000

nolist
FirstByte:
jp PicFR041childsbedroompng
jp PicFR083childsbedroomV2png
jp PicFR084childsbedroomV3png
jp PicFR085childsbedroomV4png

PicFR041childsbedroompng:
ld (StackRestore_Plus2-2),sp
di
ld hl,&C000+21+38

xor a
ld (ImageWidthD_Plus2-2),a
ld a,51
or a
PicFR041childsbedroompng_DrawGetNextLine:
jr z,PicFR041childsbedroompng_DrawGotLine
call RLE_NextScreenLineHL
dec a
		jr PicFR041childsbedroompng_DrawGetNextLine
PicFR041childsbedroompng_DrawGotLine:
ld sp,hl
LD IX,PicFR041childsbedroompng_DrawOrder
JP JumpToNextLine


PicFR041childsbedroompng_Line_0:
LD DE,&FFFF
jp MultiPushDeLast19


PicFR041childsbedroompng_Line_1:
call BitmapPush6
defw BitmapData+5
LD DE,&0505
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+11
LD DE,&0000
call MultiPushDe8
call FinalBitmapPush6
defw BitmapData+17


PicFR041childsbedroompng_Line_2:
call BitmapPush6
defw BitmapData+23
LD DE,&0A0A
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+29
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&D0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+37


PicFR041childsbedroompng_Line_3:
call BitmapPush16
defw BitmapData+53
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
  PUSH DE
  PUSH DE
LD BC,&0080
  Push BC
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_4:
call BitmapPush30
defw BitmapData+83
LD HL,&00C0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&1088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_5:
call BitmapPush30
defw BitmapData+113
LD HL,&00E0
  Push HL
  PUSH DE
  PUSH DE
LD BC,&7088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_6:
call BitmapPush30
defw BitmapData+143
call FinalBitmapPush8
defw BitmapData+151


PicFR041childsbedroompng_Line_7:
call BitmapPush10
defw BitmapData+161
LD DE,&0000
  PUSH DE
  PUSH DE
call FinalBitmapPush24
defw BitmapData+185


PicFR041childsbedroompng_Line_8:
LD HL,&1504
  Push HL
LD BC,&CCFF
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+193
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush16
defw BitmapData+209


PicFR041childsbedroompng_Line_9:
call BitmapPush12
defw BitmapData+221
  PUSH DE
call BitmapPush10
defw BitmapData+231
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+241


PicFR041childsbedroompng_Line_10:
LD HL,&1504
  Push HL
LD BC,&CCFF
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call FinalBitmapPush30
defw BitmapData+271


PicFR041childsbedroompng_Line_11:
call BitmapPush30
defw BitmapData+301
call FinalBitmapPush8
defw BitmapData+309


PicFR041childsbedroompng_Line_12:
LD HL,&1504
  Push HL
LD BC,&CCFF
  Push BC
  PUSH DE
  PUSH DE
call FinalBitmapPush30
defw BitmapData+339


PicFR041childsbedroompng_Line_13:
call BitmapPush30
defw BitmapData+369
call FinalBitmapPush8
defw BitmapData+377


PicFR041childsbedroompng_Line_14:
LD HL,&1100
  Push HL
LD BC,&88FF
  Push BC
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD HL,&00E0
  Push HL
  PUSH DE
call BitmapPush14
defw BitmapData+391
LD DE,&1080
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+399


PicFR041childsbedroompng_Line_15:
call BitmapPush28
defw BitmapData+427
  PUSH DE
call FinalBitmapPush8
defw BitmapData+435


PicFR041childsbedroompng_Line_16:
call BitmapPush30
defw BitmapData+465
call FinalBitmapPush8
defw BitmapData+473


PicFR041childsbedroompng_Line_17:
call BitmapPush30
defw BitmapData+503
call FinalBitmapPush8
defw BitmapData+511


PicFR041childsbedroompng_Line_18:
call BitmapPush30
defw BitmapData+541
call FinalBitmapPush8
defw BitmapData+549


PicFR041childsbedroompng_Line_19:
call BitmapPush30
defw BitmapData+579
call FinalBitmapPush8
defw BitmapData+587


PicFR041childsbedroompng_Line_20:
call BitmapPush30
defw BitmapData+617
call FinalBitmapPush8
defw BitmapData+625


PicFR041childsbedroompng_Line_21:
call BitmapPush30
defw BitmapData+655
call FinalBitmapPush8
defw BitmapData+663


PicFR041childsbedroompng_Line_22:
LD HL,&1100
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush30
defw BitmapData+693


PicFR041childsbedroompng_Line_23:
LD HL,&1504
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush30
defw BitmapData+723


PicFR041childsbedroompng_Line_24:
LD HL,&1100
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8010
  Push BC
  PUSH DE
call FinalBitmapPush26
defw BitmapData+749


PicFR041childsbedroompng_Line_25:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8010
  Push BC
  PUSH DE
call FinalBitmapPush26
defw BitmapData+775


PicFR041childsbedroompng_Line_26:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8030
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+787
  PUSH DE
call FinalBitmapPush12
defw BitmapData+799


PicFR041childsbedroompng_Line_27:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8030
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+813
  PUSH DE
call FinalBitmapPush10
defw BitmapData+823


PicFR041childsbedroompng_Line_28:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8070
  Push BC
  PUSH DE
call BitmapPush12
defw BitmapData+835
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+845


PicFR041childsbedroompng_Line_29:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&8050
  Push BC
  PUSH DE
call BitmapPush8
defw BitmapData+853
  PUSH DE
call FinalBitmapPush16
defw BitmapData+869


PicFR041childsbedroompng_Line_30:
LD HL,&1100
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+881
  PUSH DE
call BitmapPush8
defw BitmapData+889
  PUSH DE
call FinalBitmapPush6
defw BitmapData+895


PicFR041childsbedroompng_Line_31:
call BitmapPush6
defw BitmapData+901
  PUSH DE
call BitmapPush12
defw BitmapData+913
  PUSH DE
call FinalBitmapPush16
defw BitmapData+929


PicFR041childsbedroompng_Line_32:
call BitmapPush6
defw BitmapData+935
  PUSH DE
call BitmapPush12
defw BitmapData+947
  PUSH DE
call FinalBitmapPush16
defw BitmapData+963


PicFR041childsbedroompng_Line_33:
call BitmapPush6
defw BitmapData+935
  PUSH DE
call BitmapPush6
defw BitmapData+969
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+975
LD DE,&0000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+985


PicFR041childsbedroompng_Line_34:
call BitmapPush6
defw BitmapData+991
  PUSH DE
call BitmapPush6
defw BitmapData+997
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1003
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1011


PicFR041childsbedroompng_Line_35:
LD HL,&11E0
  Push HL
  PUSH DE
call BitmapPush10
defw BitmapData+1021
  PUSH DE
call BitmapPush6
defw BitmapData+1027
Call PushDE_0000x
LD BC,&080B
  Push BC
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_36:
call BitmapPush10
defw BitmapData+1037
  PUSH DE
call BitmapPush10
defw BitmapData+1047
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1057


PicFR041childsbedroompng_Line_37:
LD HL,&71F0
  Push HL
  PUSH DE
LD BC,&F0D0
  Push BC
  PUSH DE
call BitmapPush14
defw BitmapData+1071
Call PushDE_0000x
call FinalBitmapPush8
defw BitmapData+1079


PicFR041childsbedroompng_Line_38:
call BitmapPush6
defw BitmapData+1085
  PUSH DE
call BitmapPush14
defw BitmapData+1099
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1107


PicFR041childsbedroompng_Line_39:
call BitmapPush6
defw BitmapData+1085
  PUSH DE
call BitmapPush14
defw BitmapData+1121
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1129


PicFR041childsbedroompng_Line_40:
call BitmapPush6
defw BitmapData+1135
  PUSH DE
call BitmapPush14
defw BitmapData+1149
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1157


PicFR041childsbedroompng_Line_41:
call BitmapPush22
defw BitmapData+1179
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1189


PicFR041childsbedroompng_Line_42:
LD HL,&F1F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1205
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1215


PicFR041childsbedroompng_Line_43:
call BitmapPush6
defw BitmapData+1221
  PUSH DE
call BitmapPush14
defw BitmapData+1235
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1245


PicFR041childsbedroompng_Line_44:
call BitmapPush6
defw BitmapData+1251
  PUSH DE
call BitmapPush14
defw BitmapData+1265
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1275


PicFR041childsbedroompng_Line_45:
call BitmapPush6
defw BitmapData+1251
  PUSH DE
call BitmapPush6
defw BitmapData+1281
DEC DE

  PUSH DE
  PUSH DE
LD HL,&1F0F
  Push HL
LD BC,&0F01
  Push BC
INC DE

  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1291


PicFR041childsbedroompng_Line_46:
call BitmapPush6
defw BitmapData+1251
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1303
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EF45
  Push HL
LD DE,&0F0F
  PUSH DE
  PUSH DE
LD BC,&0E07
  Push BC
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_47:
call BitmapPush6
defw BitmapData+1309
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0F0F
  Push HL
LD BC,&0FF0
  Push BC
LD DE,&FFCC
  PUSH DE
  PUSH DE
Ld H,&1F
  Push HL
Ld C,&01
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1319


PicFR041childsbedroompng_Line_48:
call BitmapPush8
defw BitmapData+1327
  PUSH DE
call BitmapPush12
defw BitmapData+1339
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EFBF
  Push HL
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1345


PicFR041childsbedroompng_Line_49:
call BitmapPush8
defw BitmapData+1353
  PUSH DE
call BitmapPush12
defw BitmapData+1365
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&2F8B
  Push HL
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1371


PicFR041childsbedroompng_Line_50:
call BitmapPush8
defw BitmapData+1379
  PUSH DE
call BitmapPush12
defw BitmapData+1391
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&EF9B
  Push HL
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1397


PicFR041childsbedroompng_Line_51:
LD HL,&1100
  Push HL
LD BC,&4040
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush14
defw BitmapData+1411
  PUSH DE
  PUSH DE
LD HL,&2F89
  Push HL
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1417


PicFR041childsbedroompng_Line_52:
LD HL,&FFFF
  Push HL
LD BC,&7340
  Push BC
  PUSH DE
  PUSH DE
call BitmapPush16
defw BitmapData+1433
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1443


PicFR041childsbedroompng_Line_53:
call BitmapPush6
defw BitmapData+1449
  PUSH DE
call BitmapPush12
defw BitmapData+1461
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
call FinalBitmapPush10
defw BitmapData+1471


PicFR041childsbedroompng_Line_54:
call BitmapPush6
defw BitmapData+1477
  PUSH DE
call BitmapPush12
defw BitmapData+1489
LD DE,&F0F0
  PUSH DE
  PUSH DE
call FinalBitmapPush14
defw BitmapData+1503


PicFR041childsbedroompng_Line_55:
LD HL,&3380
  Push HL
  PUSH DE
call BitmapPush16
defw BitmapData+1519
  PUSH DE
call FinalBitmapPush16
defw BitmapData+1535


PicFR041childsbedroompng_Line_56:
call BitmapPush20
defw BitmapData+1555
  PUSH DE
call FinalBitmapPush16
defw BitmapData+1571


PicFR041childsbedroompng_Line_57:
LD HL,&99E0
  Push HL
  PUSH DE
call BitmapPush30
defw BitmapData+1601
LD BC,&9911
  Push BC
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_58:
LD HL,&1111
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1631
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_59:
LD HL,&1122
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1661
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_60:
LD HL,&1144
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1667
  PUSH DE
call BitmapPush16
defw BitmapData+1683
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1689


PicFR041childsbedroompng_Line_61:
LD HL,&1188
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush24
defw BitmapData+1713
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1719


PicFR041childsbedroompng_Line_62:
LD HL,&1100
  Push HL
DEC DE

  PUSH DE
  PUSH DE
call BitmapPush30
defw BitmapData+1749
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_63:
LD DE,&1100
  PUSH DE
  PUSH DE
call BitmapPush12
defw BitmapData+1761
  PUSH DE
call FinalBitmapPush20
defw BitmapData+1781


PicFR041childsbedroompng_Line_64:
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1787
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1793
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&C0F0
  Push HL
LD BC,&F0E0
  Push BC
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1799


PicFR041childsbedroompng_Line_65:
LD DE,&1100
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1805
LD DE,&F0F0
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+1815
  PUSH DE
LD HL,&90F0
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush6
defw BitmapData+1821


PicFR041childsbedroompng_Line_66:
call BitmapPush10
defw BitmapData+1831
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+1837
  PUSH DE
LD HL,&C0F0
  Push HL
  PUSH DE
Ld D,&70
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1845


PicFR041childsbedroompng_Line_67:
call BitmapPush30
defw BitmapData+1875
call FinalBitmapPush8
defw BitmapData+1883


PicFR041childsbedroompng_Line_68:
call BitmapPush30
defw BitmapData+1913
call FinalBitmapPush8
defw BitmapData+1921


PicFR041childsbedroompng_Line_69:
call BitmapPush16
defw BitmapData+1937
Ld D,E
  PUSH DE
  PUSH DE
call BitmapPush8
defw BitmapData+1945
  PUSH DE
call FinalBitmapPush8
defw BitmapData+1953


PicFR041childsbedroompng_Line_70:
call BitmapPush16
defw BitmapData+1969
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
LD BC,&6080
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+1981


PicFR041childsbedroompng_Line_71:
call BitmapPush16
defw BitmapData+1997
  PUSH DE
  PUSH DE
LD HL,&F000
  Push HL
LD BC,&F010
  Push BC
  PUSH DE
call FinalBitmapPush12
defw BitmapData+2009


PicFR041childsbedroompng_Line_72:
call BitmapPush10
defw BitmapData+2019
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2025
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2035


PicFR041childsbedroompng_Line_73:
call BitmapPush10
defw BitmapData+2045
  PUSH DE
  PUSH DE
LD HL,&90F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
Ld H,&C0
  Push HL
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2035


PicFR041childsbedroompng_Line_74:
call BitmapPush10
defw BitmapData+2055
  PUSH DE
  PUSH DE
LD HL,&B030
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2065


PicFR041childsbedroompng_Line_75:
call BitmapPush10
defw BitmapData+2075
  PUSH DE
  PUSH DE
LD HL,&F010
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2085


PicFR041childsbedroompng_Line_76:
call BitmapPush10
defw BitmapData+2095
  PUSH DE
  PUSH DE
LD HL,&F090
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&C0F0
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2105


PicFR041childsbedroompng_Line_77:
call BitmapPush10
defw BitmapData+2115
  PUSH DE
  PUSH DE
LD HL,&F090
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2125


PicFR041childsbedroompng_Line_78:
call BitmapPush10
defw BitmapData+2135
  PUSH DE
  PUSH DE
LD HL,&F090
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2145


PicFR041childsbedroompng_Line_79:
call BitmapPush10
defw BitmapData+2155
  PUSH DE
  PUSH DE
LD HL,&F090
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
Ld B,L
Ld C,E

  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2165


PicFR041childsbedroompng_Line_80:
call BitmapPush10
defw BitmapData+2175
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&90F0
  Push BC
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2183


PicFR041childsbedroompng_Line_81:
call BitmapPush10
defw BitmapData+2193
  PUSH DE
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&90F0
  Push HL
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2203


PicFR041childsbedroompng_Line_82:
call BitmapPush12
defw BitmapData+2215
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&C0F0
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&30C0
  Push HL
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2225


PicFR041childsbedroompng_Line_83:
call BitmapPush14
defw BitmapData+2239
  PUSH DE
LD HL,&C0F0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&F080
  Push BC
  PUSH DE
call FinalBitmapPush10
defw BitmapData+2249


PicFR041childsbedroompng_Line_84:
call BitmapPush14
defw BitmapData+2263
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&70E0
  Push HL
  PUSH DE
LD BC,&F090
  Push BC
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2271


PicFR041childsbedroompng_Line_85:
call BitmapPush14
defw BitmapData+2285
  PUSH DE
call BitmapPush6
defw BitmapData+2291
  PUSH DE
LD HL,&F030
  Push HL
  PUSH DE
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2299


PicFR041childsbedroompng_Line_86:
call BitmapPush14
defw BitmapData+2313
  PUSH DE
call BitmapPush6
defw BitmapData+2319
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
call FinalBitmapPush8
defw BitmapData+2327


PicFR041childsbedroompng_Line_87:
call BitmapPush14
defw BitmapData+2341
  PUSH DE
LD HL,&70E0
  Push HL
Ld E,&90
  PUSH DE
  PUSH DE
call BitmapPush10
defw BitmapData+2351
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_88:
call BitmapPush8
defw BitmapData+1969
  PUSH DE
LD HL,&00F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&70C0
  Push BC
  PUSH DE
LD HL,&F030
  Push HL
  PUSH DE
  PUSH DE
LD BC,&80F0
  Push BC
  PUSH DE
Ld L,&10
  Push HL
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_89:
call BitmapPush8
defw BitmapData+2359
  PUSH DE
LD HL,&00E0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F080
  Push BC
  PUSH DE
LD HL,&F030
  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
LD HL,&90F0
  Push HL
  PUSH DE
LD BC,&F030
  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_90:
call BitmapPush8
defw BitmapData+2367
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F010
  Push BC
  PUSH DE
LD HL,&F070
  Push HL
LD BC,&E0F0
  Push BC
  PUSH DE
LD HL,&30F0
  Push HL
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_91:
call BitmapPush8
defw BitmapData+2375
  PUSH DE
LD HL,&00C0
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F030
  Push BC
LD HL,&E0F0
  Push HL
  PUSH DE
LD BC,&C0F0
  Push BC
  PUSH DE
LD HL,&70E0
  Push HL
  PUSH DE
Ld B,E
Ld C,H

  Push BC
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_92:
call BitmapPush8
defw BitmapData+2383
  PUSH DE
LD HL,&0080
  Push HL
LD DE,&F0F0
  PUSH DE
  PUSH DE
LD BC,&F070
  Push BC
LD HL,&C0F0
  Push HL
  PUSH DE
LD BC,&90F0
  Push BC
  PUSH DE
LD HL,&70C0
  Push HL
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_93:
call BitmapPush8
defw BitmapData+1831
  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&80F0
  Push HL
  PUSH DE
LD BC,&10F0
  Push BC
  PUSH DE
LD HL,&F0C0
  Push HL
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_94:
Ld D,&11
  PUSH DE
  PUSH DE
Ld H,E
Ld L,E

  Push HL
LD BC,&0044
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
LD DE,&F0F0
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&10F0
  Push HL
  PUSH DE
LD BC,&30F0
  Push BC
  PUSH DE
LD HL,&F0D0
  Push HL
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_95:
Ld D,&11
  PUSH DE
  PUSH DE
Ld H,E
Ld L,E

  Push HL
LD BC,&0044
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&30E0
  Push BC
  PUSH DE
LD HL,&70E0
  Push HL
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD BC,&0088
 jp NextLinePushBC 


PicFR041childsbedroompng_Line_96:
Ld D,&11
  PUSH DE
  PUSH DE
Ld H,E
Ld L,E

  Push HL
LD BC,&0044
  Push BC
Ld D,L


  PUSH DE
  PUSH DE
LD HL,&E0F0
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
LD BC,&70C0
  Push BC
  PUSH DE
  Push BC
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD DE,&0000
  PUSH DE
  PUSH DE
LD HL,&0088
  jp NextLinePushHl 


PicFR041childsbedroompng_Line_97:
DEC DE

jp MultiPushDeLast19



PicFR041childsbedroompng_DrawOrder: 

  DEFW PicFR041childsbedroompng_Line_0
  DEFW PicFR041childsbedroompng_Line_1
  DEFW PicFR041childsbedroompng_Line_2
  DEFW PicFR041childsbedroompng_Line_3
  DEFW PicFR041childsbedroompng_Line_4
  DEFW PicFR041childsbedroompng_Line_5
  DEFW PicFR041childsbedroompng_Line_6
  DEFW PicFR041childsbedroompng_Line_7
  DEFW PicFR041childsbedroompng_Line_8
  DEFW PicFR041childsbedroompng_Line_9
  DEFW PicFR041childsbedroompng_Line_10
  DEFW PicFR041childsbedroompng_Line_11
  DEFW PicFR041childsbedroompng_Line_12
  DEFW PicFR041childsbedroompng_Line_13
  DEFW PicFR041childsbedroompng_Line_14
  DEFW PicFR041childsbedroompng_Line_15
  DEFW PicFR041childsbedroompng_Line_16
  DEFW PicFR041childsbedroompng_Line_17
  DEFW PicFR041childsbedroompng_Line_18
  DEFW PicFR041childsbedroompng_Line_19
  DEFW PicFR041childsbedroompng_Line_20
  DEFW PicFR041childsbedroompng_Line_21
  DEFW PicFR041childsbedroompng_Line_22
  DEFW PicFR041childsbedroompng_Line_23
  DEFW PicFR041childsbedroompng_Line_24
  DEFW PicFR041childsbedroompng_Line_25
  DEFW PicFR041childsbedroompng_Line_26
  DEFW PicFR041childsbedroompng_Line_27
  DEFW PicFR041childsbedroompng_Line_28
  DEFW PicFR041childsbedroompng_Line_29
  DEFW PicFR041childsbedroompng_Line_30
  DEFW PicFR041childsbedroompng_Line_31
  DEFW PicFR041childsbedroompng_Line_32
  DEFW PicFR041childsbedroompng_Line_33
  DEFW PicFR041childsbedroompng_Line_34
  DEFW PicFR041childsbedroompng_Line_35
  DEFW PicFR041childsbedroompng_Line_36
  DEFW PicFR041childsbedroompng_Line_37
  DEFW PicFR041childsbedroompng_Line_38
  DEFW PicFR041childsbedroompng_Line_39
  DEFW PicFR041childsbedroompng_Line_40
  DEFW PicFR041childsbedroompng_Line_41
  DEFW PicFR041childsbedroompng_Line_42
  DEFW PicFR041childsbedroompng_Line_43
  DEFW PicFR041childsbedroompng_Line_44
  DEFW PicFR041childsbedroompng_Line_45
  DEFW PicFR041childsbedroompng_Line_46
  DEFW PicFR041childsbedroompng_Line_47
  DEFW PicFR041childsbedroompng_Line_48
  DEFW PicFR041childsbedroompng_Line_49
  DEFW PicFR041childsbedroompng_Line_50
  DEFW PicFR041childsbedroompng_Line_51
  DEFW PicFR041childsbedroompng_Line_52
  DEFW PicFR041childsbedroompng_Line_53
  DEFW PicFR041childsbedroompng_Line_54
  DEFW PicFR041childsbedroompng_Line_55
  DEFW PicFR041childsbedroompng_Line_56
  DEFW PicFR041childsbedroompng_Line_57
  DEFW PicFR041childsbedroompng_Line_58
  DEFW PicFR041childsbedroompng_Line_59
  DEFW PicFR041childsbedroompng_Line_60
  DEFW PicFR041childsbedroompng_Line_61
  DEFW PicFR041childsbedroompng_Line_62
  DEFW PicFR041childsbedroompng_Line_63
  DEFW PicFR041childsbedroompng_Line_64
  DEFW PicFR041childsbedroompng_Line_65
  DEFW PicFR041childsbedroompng_Line_66
  DEFW PicFR041childsbedroompng_Line_67
  DEFW PicFR041childsbedroompng_Line_68
  DEFW PicFR041childsbedroompng_Line_69
  DEFW PicFR041childsbedroompng_Line_70
  DEFW PicFR041childsbedroompng_Line_71
  DEFW PicFR041childsbedroompng_Line_72
  DEFW PicFR041childsbedroompng_Line_73
  DEFW PicFR041childsbedroompng_Line_74
  DEFW PicFR041childsbedroompng_Line_75
  DEFW PicFR041childsbedroompng_Line_76
  DEFW PicFR041childsbedroompng_Line_77
  DEFW PicFR041childsbedroompng_Line_78
  DEFW PicFR041childsbedroompng_Line_79
  DEFW PicFR041childsbedroompng_Line_80
  DEFW PicFR041childsbedroompng_Line_81
  DEFW PicFR041childsbedroompng_Line_82
  DEFW PicFR041childsbedroompng_Line_83
  DEFW PicFR041childsbedroompng_Line_84
  DEFW PicFR041childsbedroompng_Line_85
  DEFW PicFR041childsbedroompng_Line_86
  DEFW PicFR041childsbedroompng_Line_87
  DEFW PicFR041childsbedroompng_Line_88
  DEFW PicFR041childsbedroompng_Line_89
  DEFW PicFR041childsbedroompng_Line_90
  DEFW PicFR041childsbedroompng_Line_91
  DEFW PicFR041childsbedroompng_Line_92
  DEFW PicFR041childsbedroompng_Line_93
  DEFW PicFR041childsbedroompng_Line_94
  DEFW PicFR041childsbedroompng_Line_95
  DEFW PicFR041childsbedroompng_Line_96
  DEFW PicFR041childsbedroompng_Line_97
  DEFW EndCode
PicFR083childsbedroomV2png:
ld (StackRestore_Plus2-2),sp
di
ld hl,&C000+21+38

xor a
ld (ImageWidthD_Plus2-2),a
ld a,51
or a
PicFR083childsbedroomV2png_DrawGetNextLine:
jr z,PicFR083childsbedroomV2png_DrawGotLine
call RLE_NextScreenLineHL
dec a
		jr PicFR083childsbedroomV2png_DrawGetNextLine
PicFR083childsbedroomV2png_DrawGotLine:
ld sp,hl
LD IX,PicFR083childsbedroomV2png_DrawOrder
JP JumpToNextLine


PicFR083childsbedroomV2png_Line_0:
ld hl,&FFDA
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_10:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2389
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_11:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2395
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_12:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2401
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_13:
ld hl,&FFE2
add hl,sp
ld sp,hl
call FinalBitmapPush8
defw BitmapData+2409


PicFR083childsbedroomV2png_Line_14:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2415
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_15:
ld hl,&FFE2
add hl,sp
ld sp,hl
call FinalBitmapPush8
defw BitmapData+2423


PicFR083childsbedroomV2png_Line_16:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2429
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_17:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2435
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_18:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2441
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_35:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&F090
  Push HL
LD BC,&70EC
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&090F
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_36:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&7000
  Push HL
LD BC,&3300
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_37:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2447
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_38:
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&87F0
  Push HL
LD BC,&C448
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&1C0F
  Push HL
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&660F
  Push BC
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_39:
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&8770
  Push HL
LD BC,&E648
  Push BC
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&6608
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_40:
ld hl,&FFE2
add hl,sp
ld sp,hl
LD HL,&0F06
  Push HL
LD BC,&BF27
  Push BC
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_41:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2453
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_42:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2459
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_43:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2465
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_44:
ld hl,&FFE2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2471
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_45:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&8E7F
  Push HL
LD BC,&0B0F
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_46:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&FFFF
  Push HL
ld hl,&FFF0
add hl,sp
ld sp,hl
LD BC,&080F
  Push BC
LD HL,&0F07
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_47:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&FF33
  Push HL
LD BC,&00FF
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&330E
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_48:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&00EE
  Push HL
ld hl,&FFF2
add hl,sp
ld sp,hl
LD BC,&000C
  Push BC
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_49:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&FCCC
  Push HL
LD BC,&FFFF
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0013
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_50:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&8FEE
  Push HL
LD BC,&FF7F
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0017
  Push HL
LD BC,&0E01
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_51:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0101
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_52:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_54:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0311
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_55:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0111
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_56:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&011F
  Push HL
LD BC,&8911
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_57:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&8911
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR083childsbedroomV2png_Line_58:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
jp NextLineDecSP4


PicFR083childsbedroomV2png_Line_60:
ld hl,&FFE0
add hl,sp
ld sp,hl
LD HL,&8C15
  Push HL
jp NextLineDecSP4



PicFR083childsbedroomV2png_DrawOrder: 

defw looper
  DEFB 1,10
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR083childsbedroomV2png_Line_10
  DEFW PicFR083childsbedroomV2png_Line_11
  DEFW PicFR083childsbedroomV2png_Line_12
  DEFW PicFR083childsbedroomV2png_Line_13
  DEFW PicFR083childsbedroomV2png_Line_14
  DEFW PicFR083childsbedroomV2png_Line_15
  DEFW PicFR083childsbedroomV2png_Line_16
  DEFW PicFR083childsbedroomV2png_Line_17
  DEFW PicFR083childsbedroomV2png_Line_18
defw looper
  DEFB 1,16
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR083childsbedroomV2png_Line_35
  DEFW PicFR083childsbedroomV2png_Line_36
  DEFW PicFR083childsbedroomV2png_Line_37
  DEFW PicFR083childsbedroomV2png_Line_38
  DEFW PicFR083childsbedroomV2png_Line_39
  DEFW PicFR083childsbedroomV2png_Line_40
  DEFW PicFR083childsbedroomV2png_Line_41
  DEFW PicFR083childsbedroomV2png_Line_42
  DEFW PicFR083childsbedroomV2png_Line_43
  DEFW PicFR083childsbedroomV2png_Line_44
  DEFW PicFR083childsbedroomV2png_Line_45
  DEFW PicFR083childsbedroomV2png_Line_46
  DEFW PicFR083childsbedroomV2png_Line_47
  DEFW PicFR083childsbedroomV2png_Line_48
  DEFW PicFR083childsbedroomV2png_Line_49
  DEFW PicFR083childsbedroomV2png_Line_50
  DEFW PicFR083childsbedroomV2png_Line_51
  DEFW PicFR083childsbedroomV2png_Line_52
  DEFW PicFR083childsbedroomV2png_Line_52
  DEFW PicFR083childsbedroomV2png_Line_54
  DEFW PicFR083childsbedroomV2png_Line_55
  DEFW PicFR083childsbedroomV2png_Line_56
  DEFW PicFR083childsbedroomV2png_Line_57
  DEFW PicFR083childsbedroomV2png_Line_58
  DEFW PicFR083childsbedroomV2png_Line_58
  DEFW PicFR083childsbedroomV2png_Line_60
defw looper
  DEFB 1,37
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW EndCode
PicFR084childsbedroomV3png:
ld (StackRestore_Plus2-2),sp
di
ld hl,&C000+21+38

xor a
ld (ImageWidthD_Plus2-2),a
ld a,51
or a
PicFR084childsbedroomV3png_DrawGetNextLine:
jr z,PicFR084childsbedroomV3png_DrawGotLine
call RLE_NextScreenLineHL
dec a
		jr PicFR084childsbedroomV3png_DrawGetNextLine
PicFR084childsbedroomV3png_DrawGotLine:
ld sp,hl
LD IX,PicFR084childsbedroomV3png_DrawOrder
JP JumpToNextLine


PicFR084childsbedroomV3png_Line_34:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&F0C0
  Push HL
LD BC,&70F0
  Push BC
ld hl,&FFEC
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_35:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&70E0
  Push HL
LD BC,&F0CC
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&090F
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_36:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&30F0
  Push HL
LD BC,&F303
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_37:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2477
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_38:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2485
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_39:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2493
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&6608
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_40:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2501
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&0F06
  Push HL
LD BC,&BF27
  Push BC
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_41:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2509
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2453
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_42:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2515
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2459
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_43:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2521
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2465
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_44:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&3FCF
  Push HL
LD BC,&FF1F
  Push BC
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2471
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_45:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&11CC
  Push HL
ld hl,&FFF2
add hl,sp
ld sp,hl
LD BC,&8E7F
  Push BC
LD HL,&0B0F
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_46:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&FF11
  Push HL
LD BC,&0088
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&080F
  Push HL
LD BC,&0F07
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_47:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&7700
  Push HL
LD BC,&C0F8
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&330E
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_48:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2527
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&000C
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_49:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2533
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0013
  Push HL
jp NextLineDecSP4


PicFR084childsbedroomV3png_Line_50:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2539
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0017
  Push HL
LD BC,&0E01
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_51:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2545
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0101
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_52:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&0FFF
  Push HL
LD BC,&FF7F
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_53:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&00FF
  Push HL
LD BC,&EE11
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_75:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&F050
  Push HL
ld hl,&FFF0
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_76:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&F0A0
  Push HL
LD BC,&E0F0
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_77:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&5050
  Push HL
ld hl,&FFF0
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_78:
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2551
ld hl,&FFF2
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_79:
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&7050
  Push HL
Ld B,L
Ld C,L

  Push BC
ld hl,&FFF0
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_80:
ld hl,&FFEE
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2557
ld hl,&FFF2
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_82:
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&F0A0
  Push HL
Ld B,L
Ld C,L

  Push BC
ld hl,&FFF0
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_83:
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&F050
  Push HL
LD BC,&50D0
  Push BC
ld hl,&FFF0
jp NextLineSPshift


PicFR084childsbedroomV3png_Line_84:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&30E0
  Push HL
ld hl,&FFF0
jp NextLineSPshift



PicFR084childsbedroomV3png_DrawOrder: 

defw looper
  DEFB 1,10
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR083childsbedroomV2png_Line_10
  DEFW PicFR083childsbedroomV2png_Line_11
  DEFW PicFR083childsbedroomV2png_Line_12
  DEFW PicFR083childsbedroomV2png_Line_13
  DEFW PicFR083childsbedroomV2png_Line_14
  DEFW PicFR083childsbedroomV2png_Line_15
  DEFW PicFR083childsbedroomV2png_Line_16
  DEFW PicFR083childsbedroomV2png_Line_17
  DEFW PicFR083childsbedroomV2png_Line_18
defw looper
  DEFB 1,15
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR084childsbedroomV3png_Line_34
  DEFW PicFR084childsbedroomV3png_Line_35
  DEFW PicFR084childsbedroomV3png_Line_36
  DEFW PicFR084childsbedroomV3png_Line_37
  DEFW PicFR084childsbedroomV3png_Line_38
  DEFW PicFR084childsbedroomV3png_Line_39
  DEFW PicFR084childsbedroomV3png_Line_40
  DEFW PicFR084childsbedroomV3png_Line_41
  DEFW PicFR084childsbedroomV3png_Line_42
  DEFW PicFR084childsbedroomV3png_Line_43
  DEFW PicFR084childsbedroomV3png_Line_44
  DEFW PicFR084childsbedroomV3png_Line_45
  DEFW PicFR084childsbedroomV3png_Line_46
  DEFW PicFR084childsbedroomV3png_Line_47
  DEFW PicFR084childsbedroomV3png_Line_48
  DEFW PicFR084childsbedroomV3png_Line_49
  DEFW PicFR084childsbedroomV3png_Line_50
  DEFW PicFR084childsbedroomV3png_Line_51
  DEFW PicFR084childsbedroomV3png_Line_52
  DEFW PicFR084childsbedroomV3png_Line_53
  DEFW PicFR083childsbedroomV2png_Line_54
  DEFW PicFR083childsbedroomV2png_Line_55
  DEFW PicFR083childsbedroomV2png_Line_56
  DEFW PicFR083childsbedroomV2png_Line_57
  DEFW PicFR083childsbedroomV2png_Line_58
  DEFW PicFR083childsbedroomV2png_Line_58
  DEFW PicFR083childsbedroomV2png_Line_60
defw looper
  DEFB 1,14
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR084childsbedroomV3png_Line_75
  DEFW PicFR084childsbedroomV3png_Line_76
  DEFW PicFR084childsbedroomV3png_Line_77
  DEFW PicFR084childsbedroomV3png_Line_78
  DEFW PicFR084childsbedroomV3png_Line_79
  DEFW PicFR084childsbedroomV3png_Line_80
  DEFW PicFR084childsbedroomV3png_Line_79
  DEFW PicFR084childsbedroomV3png_Line_82
  DEFW PicFR084childsbedroomV3png_Line_83
  DEFW PicFR084childsbedroomV3png_Line_84
defw looper
  DEFB 1,13
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW EndCode
PicFR085childsbedroomV4png:
ld (StackRestore_Plus2-2),sp
di
ld hl,&C000+21+38

xor a
ld (ImageWidthD_Plus2-2),a
ld a,51
or a
PicFR085childsbedroomV4png_DrawGetNextLine:
jr z,PicFR085childsbedroomV4png_DrawGotLine
call RLE_NextScreenLineHL
dec a
		jr PicFR085childsbedroomV4png_DrawGetNextLine
PicFR085childsbedroomV4png_DrawGotLine:
ld sp,hl
LD IX,PicFR085childsbedroomV4png_DrawOrder
JP JumpToNextLine


PicFR085childsbedroomV4png_Line_37:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2563
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_38:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2571
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&660F
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_39:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2577
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&6608
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_40:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2583
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0F06
  Push HL
LD BC,&BF27
  Push BC
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_41:
ld hl,&FFF4
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2591
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2453
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_42:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2597
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2459
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_43:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2603
ld hl,&FFF6
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2465
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_45:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&00CC
  Push HL
ld hl,&FFF2
add hl,sp
ld sp,hl
LD BC,&8E7F
  Push BC
LD HL,&0B0F
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_46:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&7700
  Push HL
LD BC,&0088
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&080F
  Push HL
LD BC,&0F07
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_47:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&3300
  Push HL
Ld B,L
Ld C,L

  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&330E
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_48:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2609
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&000C
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_49:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2615
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0013
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_50:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2533
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&0017
  Push HL
LD BC,&0E01
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_51:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2621
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0101
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_52:
ld hl,&FFF2
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2627
ld hl,&FFF4
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_53:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD DE,&0033
  PUSH DE
  PUSH DE
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0300
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_54:
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&07EE
  Push HL
LD BC,&FF1D
  Push BC
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&001F
  Push HL
LD BC,&0311
  Push BC
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_55:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&770E
  Push HL
ld hl,&FFF2
add hl,sp
ld sp,hl
LD BC,&001F
  Push BC
LD HL,&0111
  Push HL
ld hl,&FFFE
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_75:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&F050
  Push HL
LD BC,&50D0
  Push BC
ld hl,&FFF2
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_76:
ld hl,&FFEC
add hl,sp
ld sp,hl
LD HL,&F0A0
  Push HL
Ld B,L
Ld C,L

  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&30E0
  Push HL
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_77:
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&7050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
dec sp
dec sp
  PUSH DE
LD BC,&50D0
  Push BC
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_78:
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&B0E0
  Push HL
LD BC,&B0A0
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&80B0
  Push HL
  PUSH DE
  PUSH DE
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_79:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0081
  Push HL
ld hl,&FFFA
add hl,sp
ld sp,hl
LD BC,&50F0
  Push BC
Ld D,B
Ld E,B

  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&1050
  Push HL
  PUSH DE
  PUSH DE
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_80:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0607
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
LD BC,&F0B0
  Push BC
LD DE,&A0A0
  PUSH DE
  PUSH DE
  PUSH DE
  PUSH DE
LD HL,&80A0
  Push HL
  PUSH DE
  PUSH DE
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_81:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0E06
  Push HL
LD BC,&50F0
  Push BC
DEC SP
DEC SP
DEC SP
DEC SP
LD HL,&4050
  Push HL
Ld D,L
Ld E,L

  PUSH DE
  PUSH DE
  PUSH DE
LD BC,&1050
  Push BC
  PUSH DE
  Push BC
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_82:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0E0F
  Push HL
LD BC,&A0A0
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&F030
  Push HL
Ld B,&80
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&B0A0
  Push HL
LD BC,&2080
  Push BC
  PUSH DE
Ld H,&00
  Push HL
LD BC,&C0F8
  Push BC
ld hl,&FFFA
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_83:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0C0F
  Push HL
LD BC,&4150
  Push BC
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush16
defw BitmapData+2643
jp NextLineDecSP8


PicFR085childsbedroomV4png_Line_84:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2649
LD DE,&A0A0
  PUSH DE
  PUSH DE
  PUSH DE
call BitmapPush6
defw BitmapData+2655
  PUSH DE
  PUSH DE
LD HL,&A0F8
  Push HL
ld hl,&FFFA
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_85:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush12
defw BitmapData+2667
ld hl,&FFFE
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+2677
ld hl,&FFFA
jp NextLineSPshift


PicFR085childsbedroomV4png_Line_86:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush10
defw BitmapData+2687
ld hl,&FFFE
add hl,sp
ld sp,hl
LD HL,&E0C0
  Push HL
DEC SP
DEC SP
DEC SP
DEC SP
call BitmapPush8
defw BitmapData+2695
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_87:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&080F
  Push HL
LD BC,&0F50
  Push BC
Ld D,C
Ld E,C

  PUSH DE
  PUSH DE
LD HL,&5040
  Push HL
LD BC,&5010
  Push BC
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2701
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_88:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&000F
  Push HL
LD BC,&0FA1
  Push BC
LD DE,&A0A0
  PUSH DE
  PUSH DE
LD HL,&2080
  Push HL
LD BC,&A0E0
  Push BC
ld hl,&FFF6
add hl,sp
ld sp,hl
LD HL,&B00E
  Push HL
LD BC,&0F00
  Push BC
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_89:
ld hl,&FFF8
add hl,sp
ld sp,hl
LD HL,&0C0F
  Push HL
LD BC,&0F41
  Push BC
LD DE,&5050
  PUSH DE
  PUSH DE
LD HL,&5000
  Push HL
ld hl,&FFF4
add hl,sp
ld sp,hl
LD BC,&701C
  Push BC
LD HL,&0700
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_90:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush8
defw BitmapData+2709
ld hl,&FFF2
add hl,sp
ld sp,hl
LD HL,&F02C
  Push HL
LD BC,&0F01
  Push BC
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_91:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2715
ld hl,&FFF0
add hl,sp
ld sp,hl
LD HL,&F058
  Push HL
LD BC,&0F03
  Push BC
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_92:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2721
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0F03
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_93:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2727
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0F03
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_94:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2733
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0F00
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_95:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2739
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0F00
  Push HL
jp NextLineDecSP4


PicFR085childsbedroomV4png_Line_96:
ld hl,&FFF8
add hl,sp
ld sp,hl
call BitmapPush6
defw BitmapData+2745
ld hl,&FFEE
add hl,sp
ld sp,hl
LD HL,&0D00
  Push HL
jp NextLineDecSP4



PicFR085childsbedroomV4png_DrawOrder: 

defw looper
  DEFB 1,10
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR083childsbedroomV2png_Line_10
  DEFW PicFR083childsbedroomV2png_Line_11
  DEFW PicFR083childsbedroomV2png_Line_12
  DEFW PicFR083childsbedroomV2png_Line_13
  DEFW PicFR083childsbedroomV2png_Line_14
  DEFW PicFR083childsbedroomV2png_Line_15
  DEFW PicFR083childsbedroomV2png_Line_16
  DEFW PicFR083childsbedroomV2png_Line_17
  DEFW PicFR083childsbedroomV2png_Line_18
defw looper
  DEFB 1,15
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR084childsbedroomV3png_Line_34
  DEFW PicFR084childsbedroomV3png_Line_35
  DEFW PicFR084childsbedroomV3png_Line_36
  DEFW PicFR085childsbedroomV4png_Line_37
  DEFW PicFR085childsbedroomV4png_Line_38
  DEFW PicFR085childsbedroomV4png_Line_39
  DEFW PicFR085childsbedroomV4png_Line_40
  DEFW PicFR085childsbedroomV4png_Line_41
  DEFW PicFR085childsbedroomV4png_Line_42
  DEFW PicFR085childsbedroomV4png_Line_43
  DEFW PicFR084childsbedroomV3png_Line_44
  DEFW PicFR085childsbedroomV4png_Line_45
  DEFW PicFR085childsbedroomV4png_Line_46
  DEFW PicFR085childsbedroomV4png_Line_47
  DEFW PicFR085childsbedroomV4png_Line_48
  DEFW PicFR085childsbedroomV4png_Line_49
  DEFW PicFR085childsbedroomV4png_Line_50
  DEFW PicFR085childsbedroomV4png_Line_51
  DEFW PicFR085childsbedroomV4png_Line_52
  DEFW PicFR085childsbedroomV4png_Line_53
  DEFW PicFR085childsbedroomV4png_Line_54
  DEFW PicFR085childsbedroomV4png_Line_55
  DEFW PicFR083childsbedroomV2png_Line_56
  DEFW PicFR083childsbedroomV2png_Line_57
  DEFW PicFR083childsbedroomV2png_Line_58
  DEFW PicFR083childsbedroomV2png_Line_58
  DEFW PicFR083childsbedroomV2png_Line_60
defw looper
  DEFB 1,14
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW PicFR085childsbedroomV4png_Line_75
  DEFW PicFR085childsbedroomV4png_Line_76
  DEFW PicFR085childsbedroomV4png_Line_77
  DEFW PicFR085childsbedroomV4png_Line_78
  DEFW PicFR085childsbedroomV4png_Line_79
  DEFW PicFR085childsbedroomV4png_Line_80
  DEFW PicFR085childsbedroomV4png_Line_81
  DEFW PicFR085childsbedroomV4png_Line_82
  DEFW PicFR085childsbedroomV4png_Line_83
  DEFW PicFR085childsbedroomV4png_Line_84
  DEFW PicFR085childsbedroomV4png_Line_85
  DEFW PicFR085childsbedroomV4png_Line_86
  DEFW PicFR085childsbedroomV4png_Line_87
  DEFW PicFR085childsbedroomV4png_Line_88
  DEFW PicFR085childsbedroomV4png_Line_89
  DEFW PicFR085childsbedroomV4png_Line_90
  DEFW PicFR085childsbedroomV4png_Line_91
  DEFW PicFR085childsbedroomV4png_Line_92
  DEFW PicFR085childsbedroomV4png_Line_93
  DEFW PicFR085childsbedroomV4png_Line_94
  DEFW PicFR085childsbedroomV4png_Line_95
  DEFW PicFR085childsbedroomV4png_Line_96
  DEFW PicFR083childsbedroomV2png_Line_0
  DEFW EndCode







;Global Code
RLE_ImageWidth equ 0
RLE_NextScreenLineHL:
	push de
				ld b,RLE_ImageWidth :ImageWidthE_Plus1
		ld de,&800+RLE_ImageWidth :ImageWidthD_Plus2
		add hl,de
	pop de
	ret nc
	push de
		ld de,&c050
		add hl,de
	pop de
	ret


EndCode:
ld sp,&0000:StackRestore_Plus2
ei
ret

MultiPushDeLast19: ld HL,NextLine
jr MultiPushDe19B 
MultiPushDe19: pop HL
jr MultiPushDe19B 
MultiPushDe8: pop HL
jr MultiPushDe8B 
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

finalBitmapPush30: ld b,&0F
jr finalBitmapPush

finalBitmapPush26: ld b,&0D
jr finalBitmapPush

finalBitmapPush24: ld b,&0C
jr finalBitmapPush

finalBitmapPush20: ld b,&0A
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
ld hl,&0800+38
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

defb &04,&EE,&05,&05,&05,&15,&00,&10,&80,&00
defb &00,&30,&88,&00,&00,&70,&F0,&80,&0A,&77
defb &8A,&0A,&0A,&1B,&F0,&10,&80,&00,&00,&30
defb &88,&00,&30,&F0,&F0,&00,&00,&00,&10,&10
defb &80,&00,&00,&30,&85,&05,&05,&05,&05,&33
defb &CD,&05,&05,&15,&80,&C0,&C0,&90,&30,&30
defb &A0,&50,&60,&40,&40,&60,&A0,&80,&90,&30
defb &80,&00,&00,&10,&82,&0A,&0A,&0A,&0A,&3B
defb &EE,&0A,&0A,&1B,&90,&10,&20,&90,&40,&90
defb &20,&50,&40,&A0,&E0,&80,&A0,&90,&50,&30
defb &00,&00,&00,&10,&85,&05,&05,&05,&05,&15
defb &FF,&05,&05,&15,&90,&10,&20,&90,&40,&90
defb &20,&50,&60,&E0,&A0,&A0,&A0,&90,&D0,&30
defb &00,&00,&00,&10,&82,&0A,&0A,&0A,&0A,&19
defb &FF,&8A,&0A,&1B,&88,&F0,&F0,&B0,&F0,&E0
defb &70,&00,&C1,&01,&01,&01,&01,&11,&FF,&89
defb &01,&11,&88,&F0,&E0,&70,&F0,&F0,&90,&80
defb &90,&10,&20,&90,&40,&90,&00,&50,&40,&A0
defb &A0,&60,&40,&D0,&50,&30,&10,&30,&00,&00
defb &20,&00,&C0,&04,&98,&F0,&90,&F0,&F0,&F0
defb &F0,&80,&80,&C0,&C0,&60,&40,&90,&20,&50
defb &E0,&00,&41,&01,&01,&01,&01,&00,&FF,&CD
defb &01,&11,&00,&50,&10,&00,&00,&70,&C0,&40
defb &50,&30,&98,&F0,&B0,&FF,&F8,&F6,&FC,&80
defb &80,&00,&B8,&F0,&E2,&00,&77,&EE,&10,&80
defb &80,&00,&30,&F0,&C0,&00,&00,&50,&70,&C0
defb &00,&80,&20,&70,&D0,&30,&00,&10,&C0,&00
defb &60,&04,&80,&00,&40,&00,&30,&00,&00,&50
defb &40,&40,&10,&40,&50,&10,&10,&30,&00,&30
defb &80,&00,&61,&01,&01,&01,&01,&00,&FF,&CD
defb &01,&11,&B8,&F0,&C4,&FF,&33,&CC,&CC,&C0
defb &B8,&F0,&11,&EF,&19,&99,&8E,&40,&80,&00
defb &E0,&E0,&10,&00,&00,&50,&00,&00,&10,&20
defb &90,&00,&10,&30,&00,&70,&00,&00,&20,&04
defb &80,&00,&60,&60,&00,&80,&00,&50,&00,&F0
defb &D0,&00,&10,&00,&10,&30,&00,&E0,&00,&00
defb &61,&01,&01,&01,&01,&00,&FF,&CD,&01,&11
defb &B8,&E0,&11,&CF,&1D,&33,&0F,&C0,&80,&80
defb &40,&50,&00,&F0,&E0,&40,&50,&60,&10,&30
defb &B0,&C0,&B8,&F0,&FF,&CF,&13,&FF,&09,&C0
defb &00,&E0,&80,&80,&40,&50,&30,&F0,&F0,&30
defb &90,&F0,&10,&30,&C0,&00,&00,&00,&E0,&04
defb &04,&04,&04,&15,&FF,&88,&04,&15,&B8,&F1
defb &DF,&CF,&13,&7F,&09,&80,&80,&00,&F0,&C0
defb &80,&80,&C0,&50,&60,&80,&70,&A0,&B0,&F0
defb &D0,&10,&C0,&00,&00,&10,&C0,&00,&00,&00
defb &00,&11,&FF,&00,&00,&11,&B8,&F1,&EF,&CF
defb &13,&7F,&09,&80,&90,&60,&A0,&40,&80,&90
defb &60,&50,&50,&80,&30,&C0,&30,&90,&F0,&10
defb &C0,&00,&00,&30,&81,&01,&01,&01,&01,&33
defb &EE,&01,&01,&11,&B8,&F1,&FF,&6F,&3F,&BF
defb &9F,&80,&B0,&E0,&80,&40,&90,&A0,&20,&50
defb &50,&00,&00,&80,&00,&00,&D0,&10,&C0,&00
defb &00,&20,&E0,&00,&00,&00,&00,&33,&CC,&00
defb &00,&11,&98,&F1,&FF,&DF,&FF,&57,&7F,&80
defb &B0,&C0,&60,&10,&60,&40,&20,&50,&40,&00
defb &10,&80,&60,&00,&D0,&10,&C0,&00,&10,&00
defb &60,&04,&04,&04,&04,&77,&88,&04,&04,&15
defb &98,&F1,&FF,&FF,&FF,&BB,&FF,&00,&B0,&E0
defb &10,&E0,&40,&80,&10,&50,&40,&40,&10,&00
defb &20,&00,&50,&10,&C0,&00,&30,&00,&70,&00
defb &00,&00,&00,&EE,&00,&00,&00,&11,&98,&F1
defb &FF,&FF,&FF,&BB,&FE,&00,&80,&00,&00,&10
defb &00,&90,&F0,&50,&40,&40,&10,&00,&20,&00
defb &50,&10,&80,&00,&70,&00,&30,&01,&01,&01
defb &11,&89,&01,&01,&01,&11,&98,&F1,&FF,&FF
defb &FF,&77,&FE,&80,&88,&F0,&EE,&77,&FF,&FF
defb &FE,&80,&A0,&60,&60,&80,&20,&20,&00,&D0
defb &40,&40,&10,&00,&20,&40,&50,&10,&80,&10
defb &C0,&00,&30,&80,&88,&F0,&EE,&11,&FF,&FF
defb &FC,&80,&A0,&20,&20,&80,&20,&00,&E0,&50
defb &40,&40,&20,&00,&20,&40,&50,&10,&80,&30
defb &80,&00,&30,&84,&98,&F0,&EE,&00,&00,&77
defb &FC,&00,&A0,&40,&60,&A0,&00,&F0,&E0,&50
defb &20,&40,&30,&00,&20,&40,&50,&10,&80,&70
defb &98,&F0,&F7,&00,&00,&FF,&F8,&00,&A0,&60
defb &60,&F0,&20,&70,&E0,&50,&20,&40,&20,&00
defb &60,&00,&D0,&10,&80,&60,&E0,&50,&20,&00
defb &E0,&00,&70,&00,&90,&00,&90,&C0,&B8,&F0
defb &F3,&88,&11,&FF,&E0,&00,&80,&00,&00,&20
defb &00,&20,&C0,&50,&20,&30,&A0,&00,&01,&0F
defb &0F,&0F,&10,&00,&B8,&F0,&F1,&FF,&FF,&FE
defb &E0,&00,&80,&00,&00,&50,&30,&E0,&20,&01
defb &0F,&1E,&B4,&0F,&0F,&00,&B8,&F0,&F0,&FF
defb &FF,&FC,&C0,&00,&A0,&00,&20,&0F,&0F,&0F
defb &C3,&0F,&0F,&0E,&98,&F0,&F0,&F3,&FF,&F0
defb &80,&00,&A0,&10,&B0,&60,&60,&D0,&B0,&50
defb &03,&0F,&0F,&78,&F0,&87,&0F,&0F,&08,&00
defb &90,&80,&A0,&90,&30,&60,&60,&90,&20,&50
defb &88,&F0,&F0,&91,&EF,&3C,&00,&30,&F0,&F0
defb &80,&11,&07,&0F,&3C,&F0,&F0,&C3,&0F,&0F
defb &0E,&00,&10,&C0,&88,&70,&C0,&17,&CF,&0F
defb &08,&00,&B0,&D0,&30,&50,&40,&50,&10,&50
defb &00,&70,&F0,&F0,&C0,&11,&0F,&0F,&78,&F0
defb &F0,&F0,&0F,&0F,&0F,&0C,&00,&60,&88,&00
defb &01,&0F,&0F,&0C,&0E,&00,&80,&90,&B0,&50
defb &40,&D0,&B0,&50,&C3,&0F,&0F,&0E,&00,&E0
defb &00,&50,&00,&01,&0F,&0F,&88,&00,&03,&0F
defb &0F,&0F,&07,&00,&80,&00,&00,&F0,&F0,&F0
defb &E0,&11,&C3,&0F,&0F,&0E,&00,&C0,&F0,&D0
defb &F0,&E1,&0F,&1E,&88,&00,&07,&0F,&0F,&0F
defb &0B,&08,&E1,&0F,&0F,&0F,&00,&C0,&00,&00
defb &00,&F0,&00,&03,&0F,&1E,&FC,&F0,&00,&C0
defb &00,&00,&10,&F0,&F0,&F0,&F0,&11,&F0,&07
defb &0F,&3D,&00,&77,&88,&70,&F0,&0F,&88,&00
defb &0F,&0B,&0F,&0F,&0D,&08,&30,&F0,&00,&07
defb &0F,&0C,&F1,&33,&30,&88,&F0,&0F,&0F,&0F
defb &00,&F0,&88,&01,&0F,&0B,&0F,&0F,&0D,&0C
defb &30,&F0,&F0,&F0,&F0,&91,&00,&0F,&0F,&18
defb &30,&BF,&48,&E6,&70,&87,&0F,&0F,&00,&E0
defb &88,&01,&0F,&0B,&0F,&0F,&0E,&0C,&00,&0F
defb &0F,&1E,&30,&BF,&48,&E7,&F0,&87,&0F,&0F
defb &10,&E0,&88,&01,&0F,&0B,&0F,&0F,&0E,&0E
defb &70,&F0,&F0,&F0,&F0,&D1,&00,&0F,&0F,&1E
defb &F1,&BF,&78,&E7,&F8,&87,&0F,&0F,&10,&C0
defb &88,&01,&0F,&0B,&0F,&0F,&0E,&0F,&00,&0F
defb &0F,&1F,&F3,&7F,&7C,&DF,&FC,&87,&0F,&0F
defb &30,&F0,&F0,&F0,&70,&F0,&F0,&F0,&F0,&D1
defb &88,&00,&0F,&0B,&0F,&0F,&0E,&0F,&08,&00
defb &00,&0F,&0F,&0F,&EF,&DD,&BF,&BF,&FA,&87
defb &0F,&0F,&30,&80,&00,&00,&88,&00,&0F,&0D
defb &0F,&0F,&0F,&07,&0C,&44,&F0,&00,&40,&40
defb &10,&F1,&00,&0F,&0F,&1F,&1F,&BB,&CF,&7F
defb &FA,&87,&0F,&0F,&70,&00,&88,&00,&0F,&0D
defb &0F,&0F,&0F,&0B,&0E,&CC,&04,&00,&40,&40
defb &00,&11,&01,&0F,&0F,&1F,&FF,&BB,&FF,&FF
defb &FC,&87,&0F,&0F,&F0,&00,&88,&00,&0F,&0E
defb &0F,&0F,&0F,&0B,&1F,&04,&F8,&0F,&0F,&0F
defb &E0,&00,&88,&00,&0F,&0E,&0F,&0F,&0F,&0C
defb &2E,&4E,&01,&0F,&0F,&1F,&FF,&FF,&EE,&FF
defb &F8,&0F,&0F,&0F,&0E,&00,&40,&40,&00,&11
defb &88,&00,&07,&0F,&17,&FF,&FF,&FF,&8B,&2F
defb &00,&07,&0F,&0C,&40,&40,&00,&11,&01,&0F
defb &0F,&0F,&CC,&00,&11,&FE,&A5,&0F,&0F,&0F
defb &88,&00,&03,&0F,&17,&00,&00,&0E,&0E,&0E
defb &40,&40,&00,&11,&01,&0F,&0F,&0F,&EE,&00
defb &33,&FC,&0F,&0F,&0F,&0E,&88,&00,&03,&0F
defb &1B,&00,&00,&08,&00,&02,&40,&40,&00,&11
defb &01,&0F,&0F,&0F,&7F,&00,&77,&8F,&0F,&0F
defb &0F,&0E,&88,&00,&01,&0F,&1B,&00,&00,&70
defb &E0,&0F,&0F,&0F,&1F,&FF,&EF,&0F,&0F,&0F
defb &0F,&0C,&88,&00,&01,&0F,&1D,&00,&10,&F0
defb &F0,&C3,&0F,&0F,&0F,&FF,&88,&0F,&0F,&0F
defb &0F,&78,&80,&00,&88,&00,&00,&0F,&0D,&00
defb &00,&40,&89,&CE,&33,&FF,&F0,&E0,&00,&11
defb &C3,&08,&00,&FF,&BB,&00,&0F,&0F,&0F,&E0
defb &40,&00,&88,&00,&00,&0F,&CF,&0C,&00,&F0
defb &88,&0C,&44,&10,&00,&10,&00,&11,&F0,&07
defb &0E,&EE,&66,&07,&07,&0F,&1E,&E0,&E0,&00
defb &88,&00,&11,&17,&BF,&CE,&E0,&A0,&88,&44
defb &00,&00,&00,&10,&E0,&0F,&0E,&00,&88,&0F
defb &0B,&0F,&78,&D0,&E0,&00,&00,&00,&88,&30
defb &88,&00,&11,&37,&6F,&0E,&A0,&20,&88,&44
defb &00,&00,&00,&20,&00,&70,&C1,&0F,&3F,&FF
defb &03,&0F,&38,&F0,&F0,&D0,&F0,&00,&00,&11
defb &00,&40,&00,&00,&40,&55,&88,&00,&11,&BB
defb &7F,&EF,&A0,&F0,&88,&44,&00,&00,&00,&50
defb &F0,&00,&6F,&0E,&A0,&20,&88,&74,&00,&00
defb &10,&F0,&F0,&E0,&30,&00,&03,&0F,&0F,&0F
defb &0F,&07,&38,&F0,&F0,&B0,&F0,&00,&00,&22
defb &00,&F0,&11,&99,&7F,&CE,&E0,&40,&88,&74
defb &80,&00,&10,&F0,&F0,&F0,&C0,&70,&17,&0D
defb &0F,&0F,&0F,&07,&38,&F0,&F0,&70,&F0,&00
defb &00,&44,&11,&AA,&6F,&0C,&00,&B0,&88,&F8
defb &E0,&00,&00,&F0,&F0,&90,&F0,&E0,&77,&0B
defb &0F,&0F,&0E,&EF,&70,&F0,&F0,&70,&F0,&00
defb &00,&88,&60,&70,&F0,&00,&11,&00,&99,&F0
defb &F0,&00,&10,&F0,&F0,&80,&F0,&E0,&FF,&07
defb &0F,&08,&15,&FF,&88,&00,&11,&BB,&37,&8C
defb &BA,&F0,&F0,&80,&10,&F0,&F0,&80,&70,&E0
defb &FF,&00,&0F,&3B,&BB,&EE,&F0,&E0,&00,&F0
defb &F0,&00,&22,&00,&88,&00,&00,&11,&8B,&08
defb &00,&88,&FF,&CC,&00,&00,&FC,&F0,&F0,&C0
defb &10,&F0,&F0,&C0,&00,&60,&FF,&77,&07,&77
defb &FF,&DC,&C0,&10,&F0,&10,&F0,&00,&77,&FF
defb &FF,&30,&C0,&30,&F0,&E0,&30,&00,&44,&00
defb &00,&00,&88,&00,&00,&EE,&66,&73,&FF,&FF
defb &B8,&F0,&F0,&E0,&70,&F0,&F0,&F0,&00,&F0
defb &77,&CC,&90,&00,&44,&00,&00,&00,&B3,&FF
defb &70,&77,&EE,&F0,&88,&00,&00,&FF,&88,&70
defb &E0,&00,&44,&00,&00,&00,&F0,&C0,&70,&F0
defb &D1,&CC,&70,&11,&DC,&C0,&88,&00,&00,&FF
defb &FF,&30,&F0,&00,&55,&FF,&FF,&FF,&EE,&11
defb &00,&11,&D1,&FF,&70,&77,&B8,&C0,&88,&00
defb &00,&FF,&FF,&DC,&F0,&F0,&F0,&D0,&E0,&F0
defb &80,&70,&F0,&C0,&F0,&F0,&E0,&EE,&70,&80
defb &70,&C0,&70,&F0,&10,&F0,&F0,&00,&55,&00
defb &B1,&FF,&A2,&11,&00,&11,&88,&00,&00,&FF
defb &FF,&FF,&70,&F0,&F0,&50,&D0,&F0,&00,&F0
defb &F0,&00,&70,&F0,&F0,&00,&F0,&F0,&F0,&E0
defb &70,&F0,&00,&70,&F0,&00,&55,&00,&50,&F0
defb &A2,&11,&00,&11,&88,&00,&00,&EE,&FF,&FF
defb &B8,&F0,&F0,&E0,&70,&F0,&C0,&30,&F0,&00
defb &55,&00,&A0,&F0,&62,&11,&00,&11,&B0,&F0
defb &70,&F0,&E0,&20,&30,&F0,&88,&00,&00,&EE
defb &33,&FF,&B8,&F0,&F0,&E0,&70,&F0,&E0,&10
defb &F0,&00,&55,&00,&50,&80,&62,&11,&00,&11
defb &88,&00,&00,&EE,&00,&FF,&B8,&F0,&F0,&70
defb &70,&F0,&F0,&C0,&70,&F0,&F0,&B0,&F0,&00
defb &55,&00,&A0,&F0,&62,&11,&00,&11,&88,&00
defb &00,&EE,&00,&33,&B8,&F0,&F0,&70,&70,&F0
defb &F0,&00,&55,&00,&50,&F0,&E2,&11,&00,&11
defb &F0,&E0,&70,&F0,&90,&F0,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&F0,&60,&F0,&00,&55,&00
defb &A0,&80,&62,&11,&00,&11,&F0,&00,&55,&00
defb &50,&90,&E2,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&F0,&D0,&E0,&00,&55,&00
defb &A0,&80,&62,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&F0,&B0,&E0,&00,&55,&00
defb &50,&F0,&E2,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&E0,&70,&C0,&00,&55,&00
defb &A0,&80,&62,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&D0,&F0,&80,&00,&55,&00
defb &50,&F0,&E2,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&B0,&F0,&80,&00,&55,&00
defb &A0,&F0,&62,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&F0,&70,&F0,&00,&00,&55,&00
defb &50,&80,&62,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&B8,&E0,&00,&00,&55,&00,&A0,&F0
defb &E2,&11,&00,&11,&88,&00,&00,&EE,&00,&33
defb &B8,&E0,&F0,&10,&F0,&E0,&00,&00,&55,&00
defb &50,&80,&62,&11,&00,&11,&88,&00,&00,&EE
defb &00,&33,&F8,&D0,&F0,&00,&C0,&F0,&F0,&C0
defb &00,&00,&55,&00,&A0,&B0,&E2,&11,&00,&11
defb &88,&00,&00,&66,&00,&33,&F8,&D0,&F0,&90
defb &C0,&F0,&F0,&C0,&00,&00,&55,&00,&50,&F0
defb &E2,&11,&00,&11,&88,&00,&00,&00,&00,&33
defb &F8,&B0,&C0,&F0,&F0,&80,&00,&00,&55,&00
defb &A0,&80,&62,&11,&00,&11,&C0,&70,&C0,&00
defb &70,&10,&88,&00,&00,&00,&00,&33,&88,&70
defb &C0,&F0,&F0,&00,&00,&00,&55,&00,&50,&F0
defb &E2,&11,&00,&11,&C0,&F0,&80,&00,&F0,&30
defb &88,&00,&00,&00,&00,&33,&88,&F0,&D0,&F0
defb &F0,&00,&00,&00,&55,&00,&20,&F0,&62,&11
defb &00,&11,&10,&F0,&F0,&F0,&F0,&C0,&70,&F0
defb &F0,&F0,&55,&00,&20,&F0,&E2,&11,&00,&11
defb &55,&00,&10,&80,&62,&11,&00,&11,&55,&00
defb &00,&90,&62,&11,&00,&11,&55,&00,&00,&70
defb &A2,&11,&00,&11,&F3,&5F,&7F,&FF,&FE,&80
defb &D7,&FF,&FF,&DF,&BF,&C0,&BF,&FF,&DF,&FF
defb &FF,&C8,&B8,&F0,&FF,&FF,&FF,&7F,&EF,&C0
defb &7F,&FF,&DF,&FF,&FF,&C0,&B8,&E0,&33,&FF
defb &FF,&7F,&EF,&80,&99,&FF,&DD,&77,&CC,&00
defb &EE,&66,&33,&BB,&99,&80,&FF,&88,&FF,&44
defb &77,&80,&0F,&0E,&B1,&7F,&BC,&98,&0F,&0A
defb &AF,&BF,&06,&0F,&0F,&0C,&AF,&BF,&07,&07
defb &0F,&0E,&5F,&7F,&07,&0B,&0F,&0D,&FF,&EE
defb &07,&0B,&0F,&0E,&30,&7F,&8C,&90,&0F,&0C
defb &10,&BF,&08,&40,&F0,&87,&0F,&0E,&10,&BF
defb &08,&62,&70,&87,&0F,&0E,&10,&BF,&08,&73
defb &78,&87,&0F,&1E,&30,&BF,&48,&F3,&7C,&87
defb &0F,&1F,&F1,&5D,&7C,&E7,&0F,&0F,&EF,&BB
defb &BF,&DF,&0F,&3C,&F0,&F0,&E0,&33,&0F,&78
defb &F0,&F0,&F0,&F1,&0F,&F0,&88,&30,&F0,&F1
defb &0F,&E1,&CC,&00,&F7,&EF,&F0,&E0,&A0,&A0
defb &B0,&F0,&F0,&E0,&A0,&A0,&A0,&F0,&0F,&0F
defb &F0,&7F,&BC,&90,&0F,&1C,&90,&BF,&68,&40
defb &F0,&87,&00,&B7,&48,&20,&70,&87,&00,&B7
defb &48,&31,&78,&87,&0F,&1E,&00,&B7,&48,&31
defb &7C,&87,&0F,&1F,&90,&5D,&6C,&63,&0F,&0F
defb &E1,&BB,&BC,&D7,&0F,&1F,&10,&F0,&E0,&11
defb &0F,&3C,&F0,&F0,&F0,&D1,&0F,&F0,&F0,&00
defb &F0,&E3,&0F,&F0,&6E,&00,&70,&CF,&50,&10
defb &50,&50,&00,&50,&50,&70,&D0,&50,&50,&50
defb &50,&40,&50,&70,&80,&E0,&A0,&83,&0F,&00
defb &80,&A0,&A0,&F0,&E0,&30,&40,&00,&50,&10
defb &50,&50,&40,&50,&50,&07,&0E,&0E,&8F,&D0
defb &50,&70,&D0,&50,&10,&50,&50,&F0,&A0,&20
defb &A0,&A0,&80,&A0,&A0,&0F,&0F,&0C,&00,&37
defb &8F,&A0,&B0,&F0,&F0,&A0,&00,&0F,&1E,&50
defb &70,&F0,&F0,&E0,&A0,&A0,&83,&0F,&0F,&0F
defb &50,&50,&43,&0F,&0F,&0E,&E0,&A0,&87,&0F
defb &0E,&06,&F0,&50,&0F,&0F,&0E,&00,&F0,&A0
defb &0F,&0F,&0F,&00,&F0,&41,&0E,&03,&0F,&08
defb &F0,&E1,&0C,&00,&07,&08
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

LastByte:defb 0
save direct "T59-SC1.D04",FirstByte,LastByte-FirstByte
