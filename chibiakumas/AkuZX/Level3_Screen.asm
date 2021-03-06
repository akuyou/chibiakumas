org &C000
FileBegin:




jp Sprite0_Setup
jp Sprite0Color_Setup


Sprite0_Setup:
ld hl,Sprite0_Start-1
ld de,Sprite0_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0_Start:
db &B,&21,&C2,&50,&84,&69,&35,&61,&3B,&91,&83,&20,&C4,&8A,&B,&71
db &C2,&60,&8A,&49,&35,&61,&93,&AB,&81,&A3,&10,&8C,&6,&81,&4,&51
db &C1,&A2,&81,&60,&6D,&B2,&51,&93,&72,&70,&41,&A2,&81,&6,&C1,&F
db &10,&E1,&3,&B0,&9C,&D4,&71,&25,&C0,&A4,&CB,&C4,&E,&73,&C4,&6
db &F1,&3,&40,&C8,&9D,&20,&35,&1,&A2,&21,&91,&A2,&C1,&30,&4,&AB
db &AE,&5,&81,&F1,&3,&70,&48,&95,&20,&37,&A8,&24,&C9,&A2,&30,&4
db &8B,&EA,&5,&81,&10,&1F,&3,&11,&F,&A,&C1,&10,&1F,&3,&D1,&61
db &32,&E1,&40,&A4,&8E,&9,&27,&62,&30,&12,&B6,&CA,&5,&E1,&10,&1F
db &3,&C1,&20,&B6,&42,&E2,&20,&84,&D,&21,&53,&30,&27,&B6,&CA,&5
db &E1,&10,&1F,&3,&91,&61,&32,&41,&A2,&20,&84,&D,&22,&53,&11,&20
db &35,&A9,&5,&E1,&10,&1F,&F,&E,&E1,&10,&3F,&3,&C1,&F2,&10,&C7
db &F2,&71,&8,&11,&9,&E1,&10,&3F,&F,&3,&10,&82,&9,&E1,&10,&3F
db &F,&E,&E1,&10,&7F,&F,&2,&81,&2,&21,&8,&E1,&10,&7F,&5,&11
db &10,&40,&2,&20,&2,&4,&41,&2,&41,&82,&10,&3F,&7,&C1,&10,&7F
db &F,&2,&21,&20,&70,&40,&7,&C1,&F2,&5,&11,&2,&30,&1,&4,&3
db &41,&2,&21,&20,&18,&C0,&7,&C1,&F2,&11,&F,&1,&11,&41,&3,&11
db &6,&C1,&F2,&11,&4,&31,&5,&51,&2,&21,&2,&11,&20,&FA,&18,&41
db &6,&C1,&F2,&31,&F,&2,&21,&2,&21,&61,&6,&C1,&F2,&71,&4,&61
db &7,&C1,&4,&10,&DF,&F1,&42,&6,&81,&F3,&11,&F,&1,&20,&E2,&71
db &81,&6,&81,&F3,&71,&4,&31,&5,&20,&28,&40,&2,&20,&8A,&42,&91
db &6,&81,&F3,&71,&F,&1,&20,&92,&C4,&91,&6,&81,&F4,&11,&4,&52
db &11,&10,&40,&11,&2,&31,&2,&C2,&10,&E3,&A1,&6,&C1,&F5,&11,&10
db &38,&C,&20,&E4,&F1,&61,&6,&E1,&F6,&10,&3C,&42,&2,&20,&18,&42
db &21,&3,&10,&B8,&F2,&51,&6,&F8,&31,&B,&C1,&30,&F0,&F8,&2C,&4
db &81,&F8,&11,&30,&4,&A8,&2,&12,&3,&E1,&30,&E3,&73,&5D,&4,&81
db &F8,&11,&B,&61,&30,&84,&F,&C6,&4,&C1,&F8,&3,&20,&21,&40,&81
db &4,&31,&30,&B4,&A0,&8B,&4,&E1,&F7,&71,&C,&71,&30,&4B,&EB,&89
db &4,&E1,&F2,&71,&C1,&F3,&31,&3,&41,&3,&11,&4,&C1,&30,&75,&56
db &40,&4,&F3,&31,&10,&C0,&F2,&D,&81,&30,&75,&D3,&40,&3,&81,&F3
db &31,&9,&11,&10,&40,&5,&81,&30,&FB,&B0,&90,&3,&81,&F3,&11,&F
db &2,&81,&30,&4B,&20,&89,&3,&C1,&F3,&11,&9,&11,&10,&20,&6,&30
db &C9,&2D,&83,&3,&E1,&F3,&11,&F,&3,&20,&F8,&A3,&31,&4,&E1,&F3
db &11,&9,&11,&10,&20,&6,&10,&4,&32,&71,&4,&F4,&11,&F,&3,&20
db &C,&1E,&51,&3,&81,&F4,&31,&9,&11,&10,&20,&7,&71,&D1,&5,&81
db &F4,&31,&F,&3,&10,&E4,&31,&5,&81,&F4,&31,&9,&11,&10,&20,&5
db &C1,&10,&E,&21,&5,&81,&F4,&31,&F,&2,&C1,&10,&6D,&6,&C1,&F4
db &31,&9,&11,&10,&20,&5,&C1,&B1,&7,&C1,&F4,&71,&F,&2,&81,&10
db &C7,&11,&5,&C1,&F4,&71,&9,&11,&10,&20,&6,&10,&E7,&11,&5,&E1
db &F5,&11,&F,&3,&E1,&6,&E1,&F5,&11,&8,&11,&10,&20,&E,&E1,&F5
db &11,&F,&A,&E1,&F4,&E1,&31,&8,&11,&10,&20,&E,&E1,&F3,&10,&E7
db &31,&F,&A,&10,&E6,&F2,&10,&EB,&71,&A,&21,&B,&11,&2,&10,&D7
db &F2,&10,&ED,&71,&F,&6,&91,&3,&20,&37,&3E,&E2,&71,&6,&21,&2
db &21,&7,&82,&2,&91,&42,&1,&30,&F7,&C1,&EF,&F1,&6,&21,&2,&10
db &83,&41,&2,&41,&2,&20,&48,&40,&B1,&62,&1,&10,&EF,&F3,&E1,&10
db &1F,&5,&E1,&2,&90,&81,&84,&C0,&82,&6A,&40,&26,&13,&EF,&F3,&E1
db &10,&1F,&4,&B0,&6C,&C0,&8D,&95,&80,&2,&3F,&E0,&37,&F,&DF,&F3
db &E1,&10,&3F,&4,&10,&38,&2,&90,&7,&9E,&82,&3,&3C,&C0,&17,&C0
db &BF,&F3,&E1,&10,&7F,&5,&21,&2,&30,&3,&C8,&C3,&11,&7,&F3,&71
db &F2,&71,&FD,&20,&3,&1,&11,&FB,&10,&FE,&71,&FF,&B,&11,&2,&20
db &FE,&F7,&2,&C1,&FF,&7,&11,&2,&20,&F9,&F7,&2,&10,&F8,&E1,&FF
db &5,&11,&2,&20,&E7,&FB,&3,&F1,&1,&FF,&5,&31,&2,&20,&1F,&FC
db &3,&E1,&10,&C0,&FF,&4,&31,&2,&F4,&3,&E1,&2,&81,&FF,&3,&71
db &2,&F4,&3,&E1,&7,&E1,&FE,&10,&1,&F4,&3,&F1,&F,&0,&F7,&10
db &1,&F4,&3,&71,&F,&0,&81,&F4,&10,&F9,&31,&7,&10,&7E,&E1,&FF
db &4,&11,&F2,&6,&81,&10,&7F,&E1,&FF,&4,&20,&E1,&3F,&5,&C1,&10
db &7F,&C1,&FF,&4,&10,&81,&F2,&11,&3,&81,&F2,&11,&E1,&FF,&4,&10
db &81,&F2,&71,&3,&F3,&1,&E1,&FF,&4,&10,&3,&E1,&F2,&11,&1,&F3
db &10,&7,&FF,&5,&10,&7,&C1,&F7,&10,&3,&FF,&6,&1,&81,&F6,&71
db &10,&80,&FF,&6,&31,&10,&C0,&F5,&2,&E1,&FF,&7,&10,&80,&F4,&10
db &7,&81,&FF,&8,&10,&7,&F4,&10,&1,&FF,&A,&11,&FF,&10,&71,&FF
db &6D,&F,&50,&11,&20,&80,&AC,&F1,&5,&21,&F,&5,&31,&30,&A6,&AC
db &48,&61,&2,&41,&21,&4,&21,&9,&C1,&2,&30,&A,&92,&32,&A2,&11
db &A2,&11,&10,&47,&B1,&3,&10,&14,&5,&11,&10,&20,&91,&F2,&D1,&40
db &A,&56,&B0,&A4,&B2,&50,&58,&ED,&E5,&BF,&1E,&3,&C1,&20,&5B,&8F
db &D1,&F2,&91,&30,&E6,&54,&FB,&D1,&32,&F1,&20,&4D,&EC,&1,&F2,&B1
db &10,&EF,&F4,&20,&B9,&DF,&E1,&F2,&31,&10,&F7,&D1,&B1
Sprite0_End:

Sprite0Color_Setup:
ld hl,Sprite0Color_Start-1
ld de,Sprite0Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0Color_Start:
db &0,&5,&47,&0,&B,&45,&0,&5,&47,&0,&B,&45,&0,&5,&47,&71
db &42,&1,&0,&5,&4,&0,&4,&3,&0,&6,&47,&71,&42,&1,&0,&4
db &4,&10,&7,&20,&47,&47,&10,&3,&0,&6,&47,&71,&42,&1,&0,&3
db &4,&20,&47,&7,&20,&45,&45,&10,&7,&0,&7,&47,&71,&42,&1,&20
db &4,&4,&10,&47,&0,&3,&45,&10,&7,&0,&7,&47,&71,&42,&1,&10
db &4,&0,&3,&47,&10,&45,&51,&45,&0,&3,&47,&71,&4F,&8,&10,&79
db &91,&72,&41,&10,&47,&20,&79,&79,&0,&A,&4C,&0,&7,&79,&0,&9
db &41,&20,&79,&79,&10,&41,&0,&3,&79,&0,&A,&41,&0,&F,&4C,&C1
db &41
Sprite0Color_End:






FileEnd:

save  "..\ResZX\Level3_Screen.bin",FileBegin,FileEnd-FileBegin
