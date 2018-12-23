jp Sprite0_Setup
jp Sprite0Color_Setup
jp Sprite1_Setup
jp Sprite1Color_Setup
jp Sprite2_Setup
jp Sprite2Color_Setup
jp Sprite3_Setup
jp Sprite3Color_Setup
jp Sprite4_Setup
jp Sprite4Color_Setup


Sprite0_Setup:
ld hl,Sprite0_Start-1
ld de,Sprite0_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0_Start:
db &2,&11,&2,&11,&2,&11,&2,&11,&2,&11,&9,&11,&2,&11,&2,&11
db &3,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2,&11,&3,&11,&2,&11
db &2,&11,&2,&11,&3,&11,&2,&11,&2,&11,&2,&11,&2,&11,&9,&11
db &2,&11,&2,&10,&1,&FB,&74,&51,&16,&51,&D4,&F5,&10,&20,&2,&21
db &2,&21,&2,&21,&F,&1,&81,&2,&81,&2,&21,&2,&21,&2,&21,&2
db &21,&2,&21,&2,&11,&2,&11,&4,&81,&2,&81,&2,&81,&2,&21,&2
db &21,&2,&21,&2,&21,&B,&11,&4,&81,&2,&81,&2,&21,&2,&21,&2
db &21,&2,&21,&2,&21,&5,&11,&4,&81,&2,&81,&2,&81,&2,&21,&2
db &21,&2,&21,&2,&21,&F,&1,&81,&2,&10,&8,&FA,&74,&51,&18,&51
db &D4,&F4,&21,&2,&21,&2,&21,&2,&21,&F,&3,&81,&2,&81,&21,&2
db &21,&2,&21,&2,&21,&2,&21,&3,&11,&3,&11,&2,&11,&10,&80,&2
db &81,&2,&81,&21,&2,&21,&2,&21,&2,&21,&F,&3,&81,&2,&81,&21
db &2,&21,&2,&21,&2,&21,&2,&21,&3,&11,&3,&11,&2,&11,&10,&80
db &2,&81,&2,&81,&21,&2,&21,&2,&21,&2,&21,&F,&3,&81,&2,&81
db &F9,&75,&1A,&D5,&F3,&2,&11,&2,&11,&2,&11,&2,&11,&F,&0,&11
db &2,&11,&3,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2,&11,&3,&11
db &2,&11,&2,&11,&2,&11,&3,&11,&2,&11,&2,&11,&2,&11,&F,&0
db &11,&2,&11,&3,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2,&11,&3
db &11,&2,&11,&2,&11,&2,&11,&3,&11,&2,&11,&2,&11,&2,&11,&F
db &0,&11,&2,&10,&1,&F8,&75,&51,&15,&3,&12,&51,&D5,&F2,&10,&10
db &2,&11,&2,&11,&2,&11,&F,&2,&11,&2,&11,&10,&10,&2,&11,&2
db &11,&2,&11,&2,&11,&2,&11,&8,&11,&2,&11,&2,&11,&10,&10,&2
db &11,&2,&11,&2,&11,&F,&2,&11,&2,&11,&10,&10,&2,&11,&2,&11
db &2,&11,&2,&11,&2,&11,&2,&81,&71,&4,&11,&2,&11,&2,&11,&10
db &10,&2,&11,&2,&11,&2,&11,&8,&71,&10,&38,&6,&11,&2,&11,&F6
db &76,&15,&1,&C1,&2,&41,&4,&D6,&11,&2,&11,&2,&11,&2,&11,&8
db &41,&2,&81,&7,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2
db &11,&2,&21,&3,&11,&3,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2
db &11,&8,&11,&3,&11,&6,&11,&2,&11,&2,&11,&2,&11,&2,&11,&2
db &11,&2,&11,&2,&10,&1,&E1,&F2,&31,&2,&11,&2,&11,&2,&11,&2
db &11,&2,&11,&2,&11,&8,&10,&81,&11,&2,&C1,&5,&11,&2,&F3,&78
db &15,&20,&80,&40,&4,&10,&1,&11,&D5,&10,&80,&2,&81,&2,&81,&9
db &81,&20,&20,&7C,&2,&61,&5,&21,&2,&81,&F,&0,&81,&30,&20,&C0
db &39,&81,&8,&81,&2,&81,&2,&81,&9,&81,&10,&10,&3,&E1,&12,&4
db &21,&F,&3,&81,&10,&10,&4,&10,&17,&7,&81,&2,&81,&2,&81,&9
db &81,&20,&10,&FC,&3,&21,&4,&10,&2,&79,&16,&21,&1,&82,&6,&A1
db &2,&11,&D3,&10,&10,&2,&11,&2,&11,&A,&10,&E8,&61,&A,&11,&10
db &10,&2,&11,&2,&11,&2,&11,&2,&11,&5,&31,&20,&38,&60,&20,&1
db &1,&11,&2,&11,&10,&10,&2,&11,&2,&11,&A,&10,&C8,&31,&C2,&1
db &21,&6,&11,&10,&10,&2,&11,&2,&11,&2,&11,&2,&11,&3,&41,&30
db &40,&3F,&F0,&20,&1,&1,&11,&2,&11,&10,&10,&2,&11,&C,&41,&40
db &40,&C5,&F,&6,&11,&5,&76,&31,&18,&21,&60,&40,&41,&85,&A,&F
db &9,&13,&91,&11,&2,&11,&D,&C1,&40,&42,&C7,&A,&F,&91,&5,&11
db &2,&11,&2,&11,&2,&11,&2,&11,&4,&C1,&40,&C4,&E2,&8A,&1F,&D1
db &2,&11,&2,&11,&2,&11,&D,&C1,&50,&94,&FD,&CE,&1F,&1C,&4,&11
db &2,&11,&5,&11,&2,&11,&4,&41,&12,&F2,&11,&F2,&81,&20,&1C,&10
db &2,&11,&C,&11,&3,&41,&10,&32,&F4,&20,&3,&17,&4,&51,&13,&4
db &14,&5,&41,&30,&5C,&3E,&F4,&91,&82,&15,&F,&2,&81,&50,&90,&78
db &F0,&18,&10,&F,&6,&81,&1,&12,&E1,&10,&38,&82,&10,&10,&F,&6
db &81,&50,&10,&9C,&8F,&2C,&10,&F,&6,&81,&50,&10,&D2,&5,&84,&10
db &8,&10,&FC,&11,&A,&81,&1,&12,&61,&30,&17,&A8,&10,&4,&14,&20
db &FE,&3,&12,&10,&10,&6,&50,&21,&61,&64,&A8,&20,&1,&13,&4,&10
db &8F,&71,&B,&11,&23,&30,&C6,&6A,&21,&5,&11,&2,&10,&CF,&61,&B
db &10,&81,&52,&30,&82,&59,&21,&3,&11,&4,&10,&F9,&61,&B,&50,&E1
db &45,&A,&35,&21,&5,&11,&2,&10,&BD,&41,&C,&F1,&30,&5D,&1,&1A
db &22,&3,&11,&4,&10,&6F,&71,&B,&10,&FB,&51,&82,&1,&20,&2,&24
db &4,&14,&10,&9A,&71,&B,&50,&F7,&82,&10,&4,&24,&8,&10,&C6,&71
db &7,&11,&3,&C1,&22,&C1,&30,&E1,&7,&24,&8,&E2,&B1,&7,&21,&3
db &30,&1F,&92,&10,&2,&10,&24,&8,&20,&78,&15,&A,&10,&8E,&12,&30
db &10,&87,&24,&4,&F4,&1,&A2,&21,&C1,&F7,&3,&61,&2,&30,&8,&7
db &E4,&F4,&6,&52,&A,&50,&38,&2,&12,&87,&24,&A,&10,&2A,&A,&20
db &86,&4,&12,&71,&2,&21,&A,&10,&54,&8,&20,&6,&7F,&91,&83,&20
db &8F,&10,&B,&A1,&8,&60,&8F,&7F,&1,&CE,&CF,&10,&B,&41,&11,&7
db &10,&DF,&F2,&40,&82,&9E,&CB,&10,&F,&1,&80,&A8,&4,&DF,&7,&82
db &9C,&4A,&10,&B,&51,&4,&80,&15,&73,&9F,&3,&4,&3C,&E0,&10,&A
db &81,&A2,&1,&40,&8A,&EA,&7C,&3F,&2,&30,&2,&3C,&50,&91,&B,&53
db &11,&53,&1,&20,&7F,&7F,&2,&41,&2,&11,&10,&20,&91,&A,&C1,&20
db &BF,&2A,&B1,&A2,&E1,&20,&7F,&7E,&2,&81,&2,&21,&10,&20,&91,&A
db &F1,&72,&2,&42,&D1,&F3,&10,&7C,&3,&31,&10,&20,&2,&D1,&A,&F1
db &20,&D,&28,&82,&E1,&F3,&10,&38,&3,&C1,&10,&1F,&2,&61,&9,&40
db &F8,&40,&4D,&1,&F3,&D1,&10,&43,&F,&3,&40,&6C,&E0,&FB,&1,&F2
db &20,&A7,&7F,&4,&10,&1F,&C,&40,&AC,&FC,&F3,&3,&F2,&10,&DB,&B2
db &11,&3,&10,&1E,&C,&40,&4A,&FE,&E7,&3,&F2,&20,&E5,&75,&21,&3
db &10,&1E,&C,&10,&3A,&F3,&C1,&10,&5,&F2,&20,&FA,&F5,&41,&3,&10
db &3C,&C,&10,&56,&F3,&81,&40,&3,&FE,&FD,&F5,&4,&10,&3C,&C,&40
db &26,&7F,&5C,&1,&D1,&F3,&10,&FA,&11,&3,&10,&3C,&C,&30,&4E,&3F
db &9C,&2,&E1,&F3,&10,&FD,&11,&3,&10,&1C,&C,&40,&16,&A3,&3F,&3E
db &C1,&F2,&31,&10,&E0,&11,&3,&10,&63,&C,&40,&4A,&A1,&3F,&BE,&E1
db &F2,&C1,&F2,&11,&2,&81,&10,&7F,&C,&10,&56,&D1,&F2,&31,&20,&7F
db &FD,&31,&F3,&3,&C1,&10,&7F,&C,&10,&4C,&C1,&F2,&71,&20,&7E,&FE
db &D1,&F2,&71,&11,&2,&C1,&10,&7F,&C,&10,&D4,&E1,&F2,&71,&30,&7F
db &FD,&FE,&A2,&3,&81,&10,&3F,&C,&60,&AC,&FC,&78,&7E,&7A,&7F,&52
db &F,&3,&60,&98,&38,&6E,&7D,&75,&B0,&A2,&F,&3,&20,&28,&30,&20
db &7E,&7E,&21,&72,&42,&51,&E
Sprite0_End:

Sprite0Color_Setup:
ld hl,Sprite0Color_Start-1
ld de,Sprite0Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite0Color_Start:
db &0,&38,&2,&0,&4,&3,&0,&C,&2,&0,&5,&3,&0,&B,&2,&10
db &7,&0,&4,&47,&10,&3,&0,&4,&2,&20,&7,&7,&0,&3,&2,&10
db &47,&20,&7,&7,&0,&3,&47,&10,&7,&0,&4,&2,&20,&7,&7,&20
db &2,&2,&40,&7,&47,&7,&47,&20,&45,&45,&20,&7,&7,&0,&4,&2
db &20,&7,&7,&0,&4,&2,&20,&45,&47,&20,&45,&45,&20,&47,&7,&20
db &2,&2,&10,&47,&71,&42,&1,&0,&5,&4,&20,&45,&47,&20,&45,&45
db &20,&47,&7,&20,&47,&47,&71,&42,&1,&10,&4,&20,&43,&43,&31,&42
db &1,&0,&3,&4,&0,&6,&47,&71,&42,&1,&20,&4,&43,&31,&42,&1
db &0,&4,&4,&20,&45,&45,&0,&3,&47,&71,&41
Sprite0Color_End:

Sprite1_Setup:
ld hl,Sprite1_Start-1
ld de,Sprite1_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite1_Start:
db &B,&81,&71,&8,&41,&4,&81,&F,&1,&61,&81,&6,&21,&10,&C0,&5
db &11,&2,&61,&5,&11,&6,&11,&10,&10,&5,&31,&2,&11,&4,&11,&2
db &21,&5,&11,&5,&81,&2,&21,&5,&11,&2,&11,&4,&11,&2,&31,&4
db &81,&6,&41,&2,&41,&4,&81,&2,&81,&11,&3,&81,&3,&11,&42,&2
db &C1,&2,&11,&3,&21,&2,&41,&4,&81,&2,&41,&4,&42,&2,&10,&41
db &61,&2,&31,&2,&51,&3,&21,&2,&41,&2,&30,&1,&18,&C0,&4,&42
db &2,&10,&63,&21,&2,&11,&2,&51,&3,&30,&12,&40,&1,&21,&2,&31
db &82,&11,&2,&83,&2,&23,&2,&11,&2,&71,&3,&30,&3E,&40,&1,&41
db &2,&61,&10,&8A,&11,&2,&C1,&10,&89,&2,&62,&21,&2,&31,&10,&80
db &B1,&2,&C1,&10,&C1,&2,&10,&3,&81,&2,&C1,&10,&8B,&B1,&2,&81
db &10,&40,&2,&42,&21,&2,&21,&30,&80,&29,&20,&20,&90,&90,&10,&2
db &41,&2,&81,&20,&8B,&16,&41,&82,&5,&61,&2,&21,&40,&80,&3A,&50
db &2E,&12,&10,&2,&81,&2,&C1,&10,&93,&22,&10,&C4,&92,&2,&10,&84
db &C1,&2,&41,&10,&40,&32,&30,&4C,&1,&32,&41,&2,&21,&60,&C0,&92
db &41,&2C,&D6,&20,&41,&82,&11,&10,&C0,&2,&32,&30,&4,&18,&14,&3
db &E1,&1,&42,&B1,&90,&41,&2C,&D7,&E0,&CD,&10,&80,&40,&61,&31,&2
db &42,&11,&41,&2,&E1,&B0,&51,&B4,&41,&3E,&FE,&C1,&DF,&18,&80,&20
db &4D,&12,&B0,&37,&18,&54,&C1,&52,&BC,&41,&3E,&C,&F3,&F2,&3,&41
db &30,&40,&9E,&61,&2,&20,&D,&2,&21,&42,&D1,&30,&78,&C1,&32,&2
db &40,&FE,&F0,&6,&62,&2,&20,&BE,&80,&F2,&20,&4,&1,&43,&71,&70
db &C0,&C1,&37,&4,&1,&82,&C,&31,&2,&41,&30,&BE,&C,&1C,&51,&4
db &41,&10,&1C,&4,&10,&3F,&C1,&3,&10,&6,&C2,&3,&21,&70,&DE,&AE
db &6D,&5,&81,&FE,&7,&81,&5,&10,&E,&22,&10,&7,&42,&5,&61,&40
db &AD,&2C,&81,&54,&5,&11,&41,&2,&21,&3,&61,&30,&E,&C6,&10,&22
db &30,&3C,&69,&9C,&12,&10,&1E,&5,&92,&2,&F1,&3,&61,&2,&50,&93
db &D0,&42,&D0,&B9,&F2,&20,&91,&3C,&4,&30,&8,&9,&98,&3,&F1,&2
db &80,&1B,&D9,&23,&E4,&75,&E1,&40,&3C,&2,&80,&8,&24,&CD,&D8,&9F
db &EF,&10,&FB,&91,&72,&41,&30,&80,&ED,&70,&81,&D2,&31,&2,&10,&8
db &A1,&E2,&1,&40,&FD,&60,&F0,&37,&E2,&40,&1A,&2F,&A0,&C5,&92,&B0
db &9E,&38,&90,&10,&EA,&7,&FA,&F9,&FE,&3B,&3A,&21,&2,&41,&50,&80
db &4,&7,&3D,&21,&3,&21,&20,&EC,&1B,&41,&4,&C1,&72,&10,&2,&61
db &2,&21,&10,&A0,&21,&82,&1,&20,&2,&42,&3,&11,&70,&F8,&3B,&A8
db &FC,&FD,&37,&2,&41,&2,&41,&2,&30,&6,&5,&12,&3,&11,&40,&9
db &7C,&3E,&10,&31,&4,&41,&10,&2,&81,&2,&81,&50,&80,&7E,&D2,&1
db &42,&2,&40,&8,&F6,&3A,&A0,&F2,&30,&DC,&8F,&2,&82,&40,&C0,&D0
db &DB,&E2,&2,&51,&4,&F1,&30,&C8,&70,&40,&6,&20,&6,&6,&40,&81
db &A9,&50,&47,&91,&2,&41,&3,&C1,&92,&20,&70,&86,&20,&FE,&FE,&50
db &7,&4,&3,&83,&C5,&42,&30,&42,&8,&85,&3,&81,&30,&3F,&76,&4
db &11,&5,&40,&7,&1,&2,&C1,&22,&10,&80,&A1,&3,&40,&84,&40,&F6
db &70,&2,&10,&FA,&B1,&F2,&31,&80,&87,&3,&2,&43,&20,&98,&18,&83
db &3,&C1,&30,&3E,&7F,&8,&41,&5,&70,&83,&6,&2,&4D,&20,&86,&4C
db &11,&4,&81,&40,&B9,&1F,&3,&E8,&D1,&F2,&71,&50,&B,&1D,&2,&41
db &10,&2,&20,&89,&83,&4,&10,&9C,&11,&4,&11,&4,&20,&B,&5,&21
db &2,&41,&10,&90,&2,&10,&89,&2,&40,&5,&1,&F8,&E7,&F8,&40,&A
db &FB,&24,&80,&1,&12,&31,&10,&89,&21,&5,&81,&4,&21,&6,&30,&4
db &F,&52,&3,&21,&20,&80,&80,&2,&11,&3,&30,&E8,&DB,&27,&6,&50
db &8E,&83,&CB,&46,&C0,&F2,&2,&10,&2,&21,&3,&81,&22,&42,&21,&6
db &10,&1C,&2,&20,&87,&46,&6,&30,&81,&10,&2,&81,&22,&42,&A1,&20
db &3F,&3F,&70,&7E,&1E,&C0,&83,&12,&E2,&60,&3,&81,&41,&3,&81,&22
db &42,&A1,&10,&20,&11,&22,&41,&51,&3,&10,&7,&A1,&32,&E1,&20,&E0
db &80,&2,&A1,&3,&40,&A8,&42,&A0,&20,&11,&22,&41,&3,&41,&50,&7
db &8B,&C1,&D0,&40,&21,&6,&21,&3,&A1,&10,&20,&11,&22,&41,&3,&21
db &40,&26,&A3,&20,&B1,&2,&82,&10,&30,&41,&2,&21,&3,&A1,&10,&20
db &11,&22,&41,&60,&40,&10,&40,&26,&F0,&71,&1,&22,&11,&41,&4,&21
db &3,&A1,&10,&20,&11,&22,&41,&10,&5B,&81,&2,&41,&30,&3C,&F8,&F1
db &11,&2,&21,&10,&20,&7,&A1,&10,&20,&11,&22,&41,&10,&5A,&41,&2
db &41,&1,&82,&F1,&50,&E0,&23,&10,&28,&21,&2,&30,&FC,&8A,&20,&11
db &22,&41,&10,&3A,&21,&2,&12,&82,&71,&20,&C0,&13,&8,&20,&C6,&95
db &20,&3F,&3F,&20,&7E,&36,&E1,&F4,&B1,&50,&38,&C0,&3,&C8,&93,&4
db &20,&9F,&2B,&6,&40,&14,&2,&8,&A4,&11,&2,&81,&30,&9,&A4,&47
db &51,&2,&81,&20,&7F,&56,&3,&11,&2,&40,&34,&2,&C,&74,&11,&5
db &10,&6A,&D1,&4,&81,&F2,&10,&2C,&2,&81,&2,&21,&31,&22,&1,&20
db &F,&3F,&11,&3,&41,&2,&71,&10,&41,&21,&2,&C1,&20,&FB,&5B,&2
db &81,&2,&11,&E1,&22,&1,&20,&36,&26,&11,&4,&81,&20,&A0,&3,&11
db &2,&C1,&20,&FA,&B3,&3,&11,&81,&3,&30,&2,&13,&23,&11,&3,&20
db &42,&B0,&2,&11,&2,&E1,&71,&F2,&71,&3,&21,&2,&42,&30,&2,&1C
db &2B,&11,&5,&20,&98,&7D,&2,&10,&A,&F3,&B1,&81,&2,&21,&2,&30
db &7C,&2,&9,&B1,&12,&3,&20,&21,&54,&F2,&2,&52,&20,&19,&4E,&A2
db &2,&41,&3,&21,&5,&11,&4,&11,&30,&6A,&9E,&1,&52,&C1,&F2,&91
db &A2,&10,&30,&C1,&3,&21,&5,&11,&2,&41,&2,&31,&72,&E1,&20,&1
db &7D,&A3,&21,&A2,&10,&70,&81,&3,&21,&5,&11,&2,&21,&50,&4,&31
db &FB,&1,&BF,&C1,&D2,&51,&E2,&1,&F3,&2,&30,&E2,&9F,&3F,&11,&3
db &50,&2,&A2,&DF,&3,&1F,&20,&D5,&D5,&30,&FE,&D0,&1B,&2,&22,&20
db &90,&20,&11,&2,&21,&2,&50,&9E,&EF,&7,&8E,&D4,&52,&30,&3C,&9C
db &1B,&2,&22,&20,&90,&24,&11,&3,&30,&2,&9A,&7E,&51,&2,&41,&10
db &5B,&D2,&30,&80,&26,&3F,&2,&22,&20,&90,&24,&11,&2,&41,&2,&10
db &F2,&A1,&E2,&1,&40,&97,&A7,&63,&7E,&81,&F2,&31,&2,&22,&20,&90
db &24,&31,&3,&60,&4,&92,&76,&D,&F,&BF,&F2,&10,&BE,&1,&F2,&31
db &2,&22,&90,&90,&24,&1,&98,&20,&D7,&EA,&1F,&87,&20,&7F,&7F,&20
db &7E,&C6,&F1,&3,&22,&20,&90,&3F,&91,&3,&50,&4,&D7,&FE,&7,&4F
db &F3,&B1,&40,&3E,&14,&F,&1,&22,&10,&10,&2,&11,&3,&90,&1,&52
db &FC,&9,&87,&3E,&5E,&7E,&18,&2,&10,&6,&22,&10,&10,&2,&12,&4
db &A0,&78,&2,&E,&47,&3D,&B8,&3E,&14,&58,&38,&22,&10,&10,&2,&11
db &2,&C1,&11,&3,&90,&AF,&37,&EF,&3A,&5B,&7E,&80,&72,&C0,&22,&10
db &E0,&F2,&10,&21,&2,&80,&3,&78,&D2,&14,&CF,&35,&AB,&BE,&2,&10
db &34,&21,&B,&20,&6,&78,&4,&40,&DF,&19,&A8,&7E,&3,&A1,&10,&97
db &4,&10,&16,&4,&20,&48,&70,&4,&40,&BE,&73,&D4,&BE,&4,&10,&9D
db &3,&81,&F1,&5,&20,&FC,&20,&4,&40,&3D,&C5,&EB,&7F,&4,&10,&CA
db &3,&E1,&10,&17,&5,&F1,&31,&5,&20,&FA,&AB,&E1,&F2,&31,&4,&42
db &3,&F2,&21,&5,&F1,&71,&13,&2,&41,&F2,&71,&D1,&F2,&11,&5,&21
db &2,&81,&F2,&51,&10,&80,&D1,&2,&E1,&10,&1,&F2,&2,&10,&E8,&F5
db &11,&8,&C1,&F2,&B1,&10,&80,&D1,&2,&E1,&30,&26,&F8,&3,&41,&F6
db &41,&6,&10,&29,&E1,&F2,&71,&20,&A1,&6D,&5,&41,&20,&2,&E8,&F5
db &7,&10,&6D,&F2,&30,&87,&E2,&6D,&3,&81,&11,&4,&D1,&F4,&71,&7
db &50,&6D,&F,&78,&C5,&67,&9,&A1,&F4,&10,&87,&5,&41,&40,&6D,&F3
db &E7,&82,&72,&4,&81,&4,&41,&F4,&71,&6,&C1,&10,&7F,&C1,&F2,&91
db &20,&4,&3F,&A,&E1,&F3,&10,&7,&21,&4,&81,&10,&3F,&20,&EB,&EB
db &20,&2,&3F,&5,&21,&4,&C1,&F4,&7,&10,&2F,&20,&D5,&D5,&20,&5
db &1C,&A,&C1,&F4,&1,&41,&5,&40,&12,&95,&D4,&43,&7,&41,&4,&C1
db &F4,&11,&8,&20,&C9,&C9,&10,&83,&C,&81,&F4,&1,&21,&4,&11,&10
db &1C,&20,&E3,&E3,&10,&40,&71,&6,&81,&4,&41,&F3,&10,&17,&6,&20
db &2C,&BF,&F2,&10,&A0,&F1,&B,&10,&E8,&F2,&10,&2B,&41,&3,&50,&8
db &1C,&7F,&FE,&40,&71,&7,&11,&4,&D1,&F2,&10,&15,&6,&10,&38,&F3
db &71,&10,&A0,&71,&B,&10,&A8,&F2,&20,&2A,&20,&2,&20,&4,&74,&E1
db &92,&71,&10,&D0,&31,&7,&21,&4,&51,&10,&7F,&52,&6,&81,&E2,&11
db &20,&70,&E8,&31,&7,&21,&4,&A4,&21,&10,&80,&2,&21,&2,&D1,&30
db &3C,&3E,&74,&11,&7,&41,&4,&55,&7,&A1,&81,&F2,&11,&10,&BF,&8
db &41,&4,&A5,&2,&21,&1
Sprite1_End:

Sprite1Color_Setup:
ld hl,Sprite1Color_Start-1
ld de,Sprite1Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite1Color_Start:
db &0,&4,&5,&10,&47,&20,&43,&43,&20,&7,&7,&0,&A,&5,&10,&4D
db &0,&3,&43,&10,&7,&20,&5,&5,&40,&4D,&5,&45,&4D,&20,&5,&5
db &10,&4D,&20,&5,&5,&10,&4D,&20,&47,&47,&10,&7,&42,&0,&4,&5
db &30,&45,&5,&45,&0,&4,&5,&30,&7,&45,&47,&51,&43,&0,&3,&5
db &10,&4D,&0,&4,&5,&20,&45,&45,&20,&5,&7,&20,&45,&45,&10,&7
db &42,&20,&5,&5,&10,&4D,&0,&5,&5,&50,&45,&5,&45,&4D,&45,&51
db &47,&0,&7,&5,&20,&4D,&5,&0,&5,&45,&0,&3,&42,&0,&3,&46
db &0,&8,&5,&44,&10,&42,&20,&7,&7,&0,&4,&47,&10,&45,&0,&6
db &5,&0,&3,&42,&20,&7,&7,&41,&72,&41,&71,&43,&10,&5,&20,&45
db &45,&10,&47,&20,&46,&46,&20,&47,&47,&0,&3,&42,&21,&43,&20,&7C
db &7C,&42,&0,&6,&47,&10,&46,&20,&47,&47,&20,&5,&5,&10,&2,&48
db &40,&5,&47,&5,&42,&20,&47,&47,&20,&42,&42,&20,&47,&47,&20,&5
db &5,&71,&47,&10,&5,&71,&41
Sprite1Color_End:

Sprite2_Setup:
ld hl,Sprite2_Start-1
ld de,Sprite2_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite2_Start:
db &6,&41,&B,&11,&F,&4,&41,&B,&91,&D2,&11,&DA,&6,&41,&B,&11
db &F,&4,&41,&B,&11,&72,&F1,&10,&7,&78,&6,&81,&7,&41,&3,&20
db &1,&C,&C1,&F,&0,&81,&7,&41,&3,&D2,&61,&2,&11,&C1,&D7,&7
db &11,&6,&41,&3,&10,&1,&21,&2,&21,&F,&0,&11,&6,&21,&3,&10
db &2A,&11,&2,&51,&1,&A7,&20,&20,&20,&10,&10,&0,&3,&40,&10,&E0
db &11,&2,&81,&2,&10,&1,&F2,&11,&8,&21,&10,&C0,&F1,&2,&41,&30
db &40,&80,&1F,&3,&81,&52,&30,&D1,&F1,&3,&56,&7,&81,&10,&40,&6
db &10,&42,&2,&11,&E2,&31,&C1,&8,&21,&5,&81,&10,&40,&6,&21,&A3
db &81,&F4,&31,&A6,&10,&10,&4,&21,&2,&31,&6,&12,&1,&82,&91,&10
db &C3,&72,&6,&10,&26,&4,&20,&2,&4C,&6,&30,&9,&D5,&EC,&F2,&10
db &74,&41,&55,&11,&4,&81,&2,&10,&82,&6,&11,&3,&C1,&F2,&1,&F2
db &6,&10,&43,&3,&81,&2,&10,&A2,&6,&11,&A3,&30,&C4,&7F,&DC,&81
db &A5,&10,&82,&3,&21,&2,&10,&1,&11,&4,&81,&6,&20,&9,&98,&11
db &5,&20,&C,&1,&C1,&3,&40,&41,&2,&18,&84,&1,&43,&30,&20,&96
db &86,&11,&6,&61,&30,&82,&43,&80,&2,&30,&4,&7,&45,&5,&E1,&20
db &E4,&B6,&11,&5,&20,&4,&42,&3,&44,&81,&20,&C0,&42,&14,&30,&A0
db &D5,&76,&11,&7,&81,&2,&41,&10,&20,&3,&11,&3,&21,&5,&D1,&51
db &73,&11,&5,&42,&10,&50,&3,&11,&43,&A1,&2,&10,&12,&44,&50,&30
db &8E,&73,&1,&FE,&11,&6,&41,&81,&E,&E1,&F2,&B2,&20,&1,&1,&10
db &FA,&23,&41,&2,&10,&4,&23,&81,&2,&10,&2,&24,&50,&E0,&FD,&9E
db &1,&A8,&41,&6,&41,&F,&0,&C1,&20,&7B,&4E,&20,&1,&1,&A2,&82
db &10,&40,&3,&85,&2,&21,&85,&50,&80,&1F,&A7,&80,&7C,&41,&6,&41
db &F,&1,&10,&9E,&12,&30,&FC,&95,&7C,&23,&41,&2,&25,&81,&2,&26
db &2,&10,&F1,&A1,&22,&1,&20,&B2,&94,&5,&41,&F,&1,&62,&40,&15
db &6,&54,&B4,&83,&41,&2,&86,&2,&21,&85,&2,&50,&96,&A,&72,&4
db &54,&5,&41,&D,&21,&50,&1,&37,&15,&AB,&54,&41,&4,&41,&7,&81
db &2,&21,&4,&11,&60,&2,&57,&3,&FA,&34,&54,&5,&41,&C,&10,&38
db &41,&2,&21,&40,&13,&52,&84,&34,&3,&41,&7,&81,&2,&21,&3,&70
db &A4,&89,&A7,&7,&3,&94,&85,&5,&41,&C,&50,&4A,&D3,&DB,&7,&8B
db &43,&91,&3,&41,&7,&81,&2,&21,&3,&70,&C1,&A7,&E3,&7,&52,&34
db &40,&5,&41,&8,&61,&2,&81,&A2,&60,&45,&F0,&3,&23,&D4,&35,&22
db &30,&40,&21,&53,&42,&F0,&14,&80,&2,&4E,&C0,&4E,&83,&FE,&4,&56
db &B4,&D7,&12,&20,&C1,&71,&24,&40,&2,&6C,&20,&8C,&40,&3F,&4A,&8A
db &3C,&B6,&1E,&A0,&E1,&F0,&3C,&40,&3,&34,&1,&92,&1,&20,&AC,&8F
db &D1,&C2,&F1,&B1,&FF,&4,&50,&AB,&F,&DA,&D3,&F,&FF,&7,&50,&6B
db &F9,&8E,&FD,&1,&FF,&7,&40,&17,&C8,&F4,&78,&2,&FF,&7,&50,&27
db &48,&7A,&1D,&20,&C1,&FF,&6,&40,&57,&1C,&7D,&8D,&F1,&B2,&FF,&6
db &50,&B7,&D8,&7E,&C1,&BF,&31,&FF,&6,&40,&7B,&41,&7F,&E3,&F1,&72
db &FF,&6,&20,&F9,&BA,&F2,&30,&14,&7C,&EF,&FF,&5,&20,&FD,&D4,&F2
db &30,&CB,&3,&EF,&F2,&2,&FF,&1,&20,&FD,&EA,&F5,&71,&10,&EF,&F2
db &F,&3,&10,&FC,&1,&F7,&1,&F3,&F,&3,&10,&FE,&C,&F2,&F,&1
db &10,&7E,&C,&F4,&11,&D,&10,&7F,&C,&F2,&10,&E0,&F3,&11,&A,&10
db &7F,&C,&F9,&31,&6,&20,&9C,&3F,&C,&FC,&4,&C1,&F2,&31,&11,&B
db &FF,&4,&91,&C,&FF,&4,&D,&FF,&4,&D,&F2,&81,&F5,&71,&3,&F4
db &F,&1,&F2,&71,&3,&31,&F,&A,&F2,&F,&F,&F2,&F,&F,&F2,&F
db &F,&F2,&F,&F,&F2,&C1,&F9,&F,&5,&FC,&F,&5,&FF,&11,&2,&FF
db &F,&2,&FF,&F,&2,&FF,&F,&F,&17,&FF,&9,&7,&41,&FB,&71,&FC
db &7,&51,&20,&BF,&D1,&F7,&71,&FC,&6,&30,&54,&1F,&D5,&F2,&50,&E8
db &A2,&58,&8D,&20,&A1,&22,&A1,&10,&E2,&F2,&6,&52,&20,&3F,&D5,&F2
db &91,&E2,&A2,&51,&D1,&A3,&10,&A2,&E1,&A2,&E1,&F2,&6,&52,&20,&1F
db &D5,&F2,&10,&AC,&61,&A2,&11,&30,&8C,&2E,&B6,&E1,&A2,&E1,&F2,&6
db &52,&20,&BF,&D1,&F2,&10,&8,&22,&A1,&F2,&A1,&40,&AE,&36,&A2,&E8
db &F2,&6,&52,&FB,&D2,&FB,&6,&52,&11,&A,&31,&E1,&A,&81,&6,&52
db &FF,&9,&6,&52,&F6,&91,&82,&A1,&40,&38,&49,&6C,&3D,&15,&91,&6
db &52,&F6,&B1,&A3,&30,&7D,&5B,&6D,&D1,&72,&53,&B2,&6,&52,&F6,&60
db &AD,&A9,&BD,&4D,&6D,&3D,&52,&20,&31,&DB,&6,&52,&F6,&91,&A2,&81
db &40,&3D,&49,&25,&3D,&11,&53,&10,&9B,&6,&52,&FF,&9,&6,&53,&41
db &21,&12,&71,&22,&12,&B1,&52,&31,&9,&81,&6,&53,&D1,&40,&56,&F7
db &6A,&57,&B1,&52,&31,&9,&81,&6,&52,&20,&57,&32,&51,&72,&21,&10
db &15,&B1,&52,&31,&4,&10,&2A,&3,&81,&6,&54,&60,&52,&71,&2A,&51
db &49,&3B,&3,&41,&52,&11,&2,&81,&6,&52,&FD,&31,&2,&81,&A3,&3
db &81,&6,&52,&F1,&5,&F1,&5,&10,&3F,&2,&41,&53,&11,&2,&81,&6
db &52,&FD,&31,&2,&A2,&10,&82,&A1,&2,&81,&6,&52,&F1,&5,&F1,&5
db &10,&3F,&2,&52,&2,&51,&2,&81,&4
Sprite2_End:

Sprite2Color_Setup:
ld hl,Sprite2Color_Start-1
ld de,Sprite2Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite2Color_Start:
db &20,&47,&47,&71,&4D,&10,&45,&20,&43,&43,&0,&3,&45,&51,&4F,&4
db &10,&45,&0,&3,&43,&20,&45,&45,&51,&49,&51,&47,&20,&45,&45,&0
db &3,&47,&10,&43,&20,&47,&47,&51,&45,&10,&45,&51,&47,&20,&45,&45
db &0,&5,&47,&71,&4F,&2,&0,&7,&47,&71,&4F,&0,&C1,&43,&20,&47
db &4C,&20,&47,&47,&10,&4C,&C1,&43,&0,&F,&4C,&10,&61,&0,&F,&4C
db &10,&41,&0,&F,&4C,&10,&61,&0,&2F,&47,&71,&41
Sprite2Color_End:

Sprite3_Setup:
ld hl,Sprite3_Start-1
ld de,Sprite3_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite3_Start:
db &F,&91,&81,&F,&10,&81,&9,&10,&13,&9,&31,&11,&9,&10,&5C,&7
db &A1,&20,&37,&10,&6,&20,&7A,&3,&11,&7,&10,&B1,&6,&30,&C3,&7D
db &10,&5,&31,&20,&DC,&3,&11,&7,&10,&CB,&6,&30,&83,&B9,&30,&5
db &31,&20,&98,&3,&31,&7,&10,&47,&5,&81,&30,&85,&BD,&F1,&4,&20
db &58,&58,&10,&3,&F1,&7,&10,&98,&5,&81,&30,&39,&69,&B1,&4,&30
db &98,&D3,&2,&B1,&7,&20,&BD,&81,&3,&81,&30,&7D,&ED,&B0,&11,&3
db &40,&18,&9F,&6,&1B,&6,&E2,&10,&81,&3,&C1,&30,&E4,&FA,&B7,&11
db &3,&40,&C4,&8E,&7E,&1B,&6,&20,&CE,&81,&11,&2,&E1,&30,&6B,&93
db &7,&11,&3,&E2,&30,&36,&41,&15,&6,&20,&BE,&81,&71,&2,&61,&2
db &10,&EA,&81,&5,&40,&6,&85,&80,&27,&6,&40,&29,&81,&5,&23,&3
db &41,&10,&10,&3,&31,&20,&2,&2A,&2,&10,&AF,&6,&40,&6B,&83,&8D
db &20,&8,&10,&8,&21,&5,&10,&AE,&6,&40,&47,&BF,&4F,&10,&8,&10
db &4,&11,&5,&10,&1C,&6,&20,&9B,&20,&A1,&2,&11,&A,&11,&5,&10
db &5C,&7,&41,&20,&40,&C2,&2,&10,&18,&6,&C1,&2,&81,&11,&3,&10
db &78,&9,&81,&30,&80,&3,&38,&11,&2,&21,&2,&30,&38,&80,&13,&2
db &21,&B,&50,&F2,&3,&FC,&1,&E8,&2,&40,&3E,&C0,&1F,&80,&E1,&2
db &11,&8,&C0,&FA,&C7,&FA,&1,&F8,&80,&7E,&AC,&1F,&80,&F,&29,&8
db &80,&B7,&C,&3,&1,&AE,&1,&CB,&B0,&C1,&2,&E1,&20,&9A,&56,&7
db &81,&10,&B2,&20,&C,&C,&70,&2,&9A,&81,&CB,&C0,&24,&A0,&92,&10
db &C6,&11,&3,&91,&3,&C0,&B1,&9,&64,&1,&F2,&81,&BF,&40,&17,&20
db &9F,&30,&11,&3,&F1,&2,&41,&20,&57,&9,&41,&3,&F2,&30,&C1,&BD
db &40,&3,&F2,&11,&30,&7A,&3,&1,&D1,&2,&C1,&71,&52,&1,&61,&2
db &81,&40,&1,&41,&7F,&60,&2,&20,&18,&30,&D2,&20,&3,&1,&61,&2
db &71,&20,&BD,&1,&61,&2,&F1,&2,&30,&81,&3A,&61,&2,&F1,&2,&31
db &92,&10,&3,&31,&2,&11,&30,&50,&7C,&40,&F1,&5,&30,&1,&87,&F4
db &4,&20,&58,&58,&20,&3,&F,&B1,&2,&91,&20,&6F,&C0,&D1,&4,&81
db &2,&20,&56,&FC,&4,&92,&20,&53,&3,&F1,&3,&81,&F2,&81,&40,&40
db &29,&80,&40,&2,&30,&29,&B4,&2,&82,&C1,&72,&D1,&20,&6,&1B,&2
db &50,&C,&8,&41,&38,&A0,&1,&72,&2,&11,&A0,&A4,&3,&A,&47,&8E
db &7E,&1B,&80,&7,&8,&81,&43,&B0,&70,&B0,&1E,&80,&74,&4,&7,&CF
db &36,&41,&10,&4,&81,&2,&F1,&30,&83,&70,&A8,&41,&3,&60,&3F,&8
db &87,&4E,&81,&80,&6,&B0,&84,&C0,&1,&F,&97,&6,&8,&1C,&F0,&70
db &6B,&4,&20,&1,&1,&30,&4,&2,&1,&81,&2,&81,&10,&A0,&C1,&2
db &11,&10,&80,&2,&20,&8,&D2,&6,&40,&1,&85,&3B,&82,&21,&2,&41
db &10,&B0,&51,&2,&21,&10,&28,&2,&20,&4,&5B,&11,&5,&20,&82,&83
db &F2,&C1,&82,&2,&81,&1,&32,&2,&C1,&10,&B8,&2,&20,&8,&2B,&6
db &40,&84,&43,&25,&90,&31,&2,&41,&10,&F0,&31,&3,&10,&39,&2,&20
db &C,&BF,&11,&5,&40,&78,&B8,&34,&20,&91,&2,&82,&E1,&41,&3,&10
db &92,&2,&30,&B8,&CE,&13,&2,&21,&3,&30,&4,&61,&40,&21,&3,&10
db &24,&41,&3,&10,&24,&2,&40,&7F,&C2,&1F,&80,&E1,&3,&30,&82,&21
db &C0,&81,&2,&81,&10,&10,&41,&3,&10,&8C,&2,&40,&6F,&ED,&1B,&80
db &F1,&3,&10,&84,&12,&10,&C0,&11,&2,&82,&5,&10,&1C,&2,&20,&CB
db &B0,&41,&2,&E1,&10,&1B,&2,&30,&82,&1D,&80,&A1,&2,&81,&10,&4
db &C1,&3,&70,&A8,&80,&EB,&C0,&26,&A0,&1B,&2,&42,&10,&27,&5,&41
db &9,&81,&B2,&40,&C0,&17,&20,&1F,&3,&21,&10,&21,&2,&81,&2,&A1
db &7,&81,&30,&80,&B5,&C0,&3,&F2,&11,&2,&20,&84,&20,&5,&21,&9
db &81,&50,&75,&E0,&1,&18,&10,&2,&42,&4,&81,&2,&81,&7,&81,&40
db &80,&1B,&E0,&3,&F1,&2,&11,&2,&20,&24,&60,&5,&41,&A,&20,&7
db &F4,&5,&11,&2,&21,&5,&81,&2,&C1,&7,&81,&2,&10,&E,&D2,&4
db &81,&3,&51,&8,&81,&A,&40,&8,&B6,&2,&8,&41,&3,&10,&1,&81
db &3,&81,&3,&11,&6,&81,&3,&11,&30,&A6,&3,&A,&72,&2,&20,&4
db &18,&F,&2,&81,&40,&7E,&4,&7,&EB,&2,&21,&2,&12,&1,&81,&2
db &81,&7,&81,&2,&50,&8,&3F,&8,&87,&4A,&2,&61,&2,&12,&4,&81
db &A,&60,&8,&1C,&F0,&70,&69,&1,&41,&2,&31,&10,&1,&81,&3,&11
db &6,&81,&3,&11,&10,&80,&2,&30,&8,&CA,&3,&81,&2,&71,&91,&F
db &1,&21,&10,&A8,&2,&20,&4,&5B,&A1,&4,&61,&10,&B,&81,&2,&81
db &7,&81,&2,&20,&C8,&C8,&2,&10,&8,&B3,&31,&41,&2,&A1,&20,&1B
db &80,&A,&81,&3,&30,&79,&1,&4,&B2,&10,&37,&41,&2,&A1,&10,&15
db &82,&10,&80,&7,&82,&1,&30,&8,&D2,&3,&82,&E1,&42,&71,&81,&2
db &C1,&30,&56,&80,&19,&4,&F1,&3,&30,&98,&1,&E4,&31,&2,&41,&20
db &42,&6C,&2,&20,&98,&54,&82,&10,&9F,&3,&C1,&12,&1,&82,&71,&10
db &9,&C2,&50,&1,&8,&D5,&EF,&84,&92,&30,&AD,&80,&3F,&3,&41,&10
db &20,&2,&10,&6A,&22,&10,&1C,&2,&83,&21,&40,&AF,&80,&B9,&AD,&6
db &20,&FC,&40,&2,&30,&4E,&3E,&A8,&2,&10,&48,&1,&C2,&B1,&10,&5
db &B2,&10,&E0,&11,&5,&20,&8D,&42,&2,&20,&EC,&2F,&4,&41,&3,&20
db &A8,&1,&62,&10,&EB,&11,&4,&81,&20,&F7,&87,&2,&E1,&12,&21,&10
db &80,&2,&A1,&3,&40,&9B,&5,&46,&7B,&5,&C1,&20,&3F,&8A,&2,&10
db &B3,&72,&4,&21,&3,&F2,&11,&2,&51,&10,&6E,&5,&41,&B1,&F2,&91
db &2,&30,&FD,&1B,&80,&2,&81,&3,&20,&8D,&80,&F8,&30,&A0,&1D,&1F
db &E1,&F5,&4,&41,&3,&10,&5F,&3,&41,&F2,&11,&5,&20,&95,&20,&7
db &C1,&2,&C1,&3,&22,&B,&A2,&22,&11,&4,&71,&2,&41,&2,&81,&F
db &1,&41,&20,&A5,&24,&2,&10,&C4,&D1,&2,&C1,&2,&10,&18,&F,&0
db &A1,&10,&AB,&41,&3,&10,&EC,&71,&2,&C1,&D,&A1,&5,&81,&72,&C1
db &2,&71,&30,&FC,&F3,&80,&2,&81,&A,&51,&11,&4,&41,&30,&D7,&A7
db &10,&C2,&40,&87,&A0,&1,&48,&9,&81,&21,&4,&A1,&90,&D6,&A7,&10
db &84,&8F,&A0,&3,&58,&26,&8,&11,&4,&41,&50,&BD,&43,&90,&20,&80
db &2,&21,&2,&62,&31,&7,&81,&61,&4,&E2,&F1,&20,&21,&50,&20,&94
db &94,&40,&C3,&1,&E8,&7F,&7,&81,&F2,&11,&2,&E1,&11,&2,&11,&40
db &D0,&FA,&5E,&83,&91,&2,&A1,&10,&59,&7,&41,&23,&2,&A1,&30,&1C
db &10,&14,&72,&10,&65,&11,&82,&1,&20,&68,&4D,&7,&E1,&10,&EA,&61
db &3,&90,&76,&8,&54,&93,&7B,&3,&98,&71,&E5,&7,&41,&10,&A3,&61
db &3,&50,&BD,&1D,&56,&EB,&79,&11,&82,&F1,&20,&29,&B7,&7,&61,&10
db &2A,&61,&3,&B1,&D2,&11,&70,&96,&FB,&7D,&1,&F8,&63,&9E,&7,&C1
db &F2,&71,&3,&30,&37,&C,&D6,&F3,&51,&11,&4,&C2,&E1,&7,&A3,&21
db &3,&50,&F,&2,&D6,&AF,&5D,&6,&10,&DF,&E,&50,&7F,&2,&D6,&85
db &6F,&6,&10,&7F,&D,&81,&F2,&2,&E2,&2,&10,&69,&F,&6,&81,&F2
db &20,&1,&6E,&2,&10,&6C,&31,&F,&7,&F1,&20,&1,&6E,&2,&10,&5F
db &31,&F,&6,&50,&CE,&1,&2F,&D1,&3E,&11,&F,&6,&10,&3E,&2,&20
db &AF,&A9,&21,&72,&F,&5,&81,&10,&F1,&2,&30,&4F,&96,&6D,&31,&F
db &5,&81,&10,&CF,&2,&30,&AF,&79,&1E,&F,&B,&E2,&F3,&71,&8
Sprite3_End:

Sprite3Color_Setup:
ld hl,Sprite3Color_Start-1
ld de,Sprite3Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite3Color_Start:
db &10,&42,&0,&3,&47,&0,&3,&42,&0,&3,&47,&0,&3,&42,&0,&3
db &47,&20,&72,&42,&20,&43,&43,&20,&42,&72,&0,&4,&42,&10,&72,&20
db &42,&42,&0,&3,&47,&20,&42,&43,&20,&42,&42,&30,&43,&42,&43,&0
db &5,&42,&10,&43,&20,&42,&42,&40,&47,&43,&42,&72,&20,&42,&42,&10
db &43,&20,&42,&42,&20,&72,&42,&20,&43,&43,&20,&42,&72,&0,&3,&42
db &30,&43,&42,&43,&0,&3,&42,&10,&43,&20,&42,&42,&30,&43,&42,&72
db &0,&5,&42,&80,&43,&42,&43,&42,&43,&42,&47,&43,&0,&5,&42,&10
db &43,&0,&7,&42,&20,&47,&47,&20,&42,&42,&10,&43,&0,&5,&42,&10
db &43,&20,&42,&42,&20,&43,&43,&10,&42,&20,&43,&43,&0,&3,&42,&10
db &43,&20,&42,&42,&20,&72,&72,&20,&42,&42,&10,&72,&20,&42,&42,&0
db &3,&43,&0,&8,&42,&20,&47,&47,&20,&7,&7,&30,&47,&43,&47,&71
db &47,&0,&4,&42,&0,&3,&47,&0,&3,&43,&31,&45,&10,&42,&20,&72
db &72,&0,&3,&42,&21,&72,&41,&20,&47,&47,&20,&42,&42,&21,&47,&0
db &3,&72,&10,&42,&20,&47,&47,&71,&41
Sprite3Color_End:

Sprite4_Setup:
ld hl,Sprite4_Start-1
ld de,Sprite4_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite4_Start:
db &F,&16,&41,&3,&11,&2,&10,&E4,&11,&2,&21,&3,&21,&3,&E1,&71
db &A,&41,&3,&42,&1,&41,&12,&2,&41,&3,&21,&3,&21,&11,&A,&41
db &30,&87,&53,&74,&41,&12,&61,&30,&EC,&E0,&24,&72,&10,&38,&11,&A
db &41,&60,&49,&92,&12,&E4,&41,&52,&2,&30,&A9,&14,&24,&11,&A,&41
db &10,&49,&21,&12,&71,&70,&4,&41,&52,&C0,&B8,&74,&24,&11,&B,&10
db &49,&21,&12,&91,&70,&4,&41,&52,&20,&A8,&94,&24,&11,&A,&41,&10
db &47,&21,&12,&F1,&70,&4,&41,&4C,&C0,&A5,&F4,&24,&11,&B,&91,&E
db &C1,&F,&1,&61,&9,&21,&5,&21,&F,&6,&41,&3,&10,&2,&51,&3
db &41,&A,&21,&2,&21,&6,&81,&A2,&2,&10,&2,&A1,&3,&10,&4,&21
db &2,&21,&2,&21,&2,&21,&2,&21,&7,&41,&3,&11,&2,&11,&2,&81
db &4,&21,&2,&21,&2,&21,&2,&21,&6,&81,&A2,&20,&2,&1,&A1,&3
db &10,&8,&21,&2,&21,&2,&21,&2,&21,&2,&21,&7,&10,&15,&2,&11
db &5,&81,&4,&21,&2,&10,&2,&F2,&E3,&A1,&A,&11,&5,&10,&8,&21
db &A2,&B3,&F2,&41,&8,&C1,&40,&1,&15,&80,&7F,&4,&41,&8,&11,&41
db &2,&41,&5,&B1,&10,&13,&A1,&2,&61,&10,&80,&B1,&3,&21,&5,&11
db &2,&11,&41,&8,&71,&32,&3,&11,&2,&21,&3,&21,&8,&11,&41,&2
db &41,&5,&E1,&40,&36,&A,&E,&78,&C1,&3,&11,&5,&11,&2,&11,&41
db &8,&C1,&20,&35,&5,&11,&2,&C1,&B1,&2,&81,&9,&11,&F1,&E3,&A1
db &23,&20,&B0,&3F,&21,&5,&10,&12,&4,&22,&A2,&B3,&F1,&8,&60,&78
db &3F,&4,&18,&7C,&20,&E,&41,&6,&E1,&10,&7F,&2,&E1,&2,&81,&10
db &20,&9,&11,&B,&81,&30,&7F,&94,&1,&21,&2,&41,&E,&41,&6,&F2
db &71,&20,&94,&F0,&31,&2,&81,&9,&11,&B,&E1,&10,&78,&81,&4,&81
db &10,&87,&C,&E4,&24,&3,&F1,&A1,&4,&F1,&10,&80,&4,&23,&A1,&B4
db &10,&20,&9,&F1,&20,&8,&1F,&2,&10,&BC,&A,&21,&2,&21,&2,&21
db &2,&21,&3,&F1,&40,&8,&FE,&31,&9F,&4,&21,&2,&21,&2,&21,&2
db &21,&9,&E1,&42,&2,&20,&CE,&E0,&A,&21,&2,&21,&2,&21,&2,&21
db &3,&E1,&40,&64,&B2,&79,&25,&4,&21,&2,&21,&2,&21,&2,&21,&9
db &E1,&30,&A1,&B4,&31,&51,&B,&10,&2,&E3,&A1,&21,&6,&E1,&40,&23
db &B4,&79,&15,&7,&A2,&B3,&21,&A,&C1,&10,&C7,&E2,&20,&FD,&16,&B
db &22,&2,&21,&7,&C1,&40,&C3,&1E,&FE,&19,&8,&21,&2,&22,&A,&81
db &10,&8F,&E1,&F2,&E1,&F1,&C,&22,&2,&21,&7,&81,&20,&7,&F7,&71
db &F2,&9,&21,&2,&22,&B,&10,&37,&E2,&F2,&71,&C,&21,&E2,&21,&9
db &20,&53,&8C,&F2,&20,&3,&FE,&7,&A1,&B2,&C,&C1,&82,&91,&10,&E0
db &13,&1,&31,&B,&21,&9,&40,&5,&31,&F0,&10,&E2,&31,&6,&21,&E
db &10,&2,&62,&30,&38,&6,&7D,&21,&B,&21,&8,&81,&50,&21,&DC,&F
db &8,&1,&21,&6,&21,&E,&30,&31,&92,&C1,&1,&12,&1,&21,&9,&E1
db &22,&9,&10,&12,&22,&30,&24,&20,&CF,&21,&6,&21,&10,&BA,&C,&20
db &4,&41,&31,&2,&41,&F2,&21,&F,&6,&C1,&2,&81,&30,&40,&C0,&FE
db &21,&F,&6,&10,&18,&2,&10,&41,&1,&12,&1,&11,&F,&7,&61,&20
db &80,&40,&C2,&10,&82,&F,&8,&C1,&30,&1,&81,&E6,&52,&A,&21,&B
db &40,&C4,&2,&81,&F3,&B,&21,&C,&50,&8E,&A3,&3,&61,&7A,&A,&21
db &C,&81,&20,&21,&81,&42,&10,&87,&9,&21,&B,&81,&2,&40,&41,&80
db &A,&7B,&A,&21,&A,&41,&2,&40,&C1,&80,&4,&FE,&9,&21,&B,&A1
db &10,&A0,&11,&2,&C1,&81,&D,&21,&A,&11,&20,&90,&1C,&2,&20,&15
db &28,&9,&21,&D,&91,&10,&30,&2,&20,&29,&6C,&F,&5,&30,&7E,&98
db &63,&2,&20,&1,&82,&F,&5,&F2,&82,&10,&41,&2,&20,&7E,&FC,&11
db &F,&3,&81,&12,&20,&84,&41,&2,&F2,&F,&6,&81,&B2,&40,&80,&C1
db &18,&A3,&C,&21,&9,&F2,&10,&20,&11,&82,&1,&10,&F7,&B,&21,&A
db &A2,&40,&90,&80,&C,&FE,&F,&A,&91,&30,&8C,&4,&54,&F,&7,&A2
db &30,&D8,&B2,&84,&21,&F,&8,&50,&7C,&C8,&67,&80,&56,&C,&F9,&31
db &3,&61,&10,&CE,&2,&10,&F4,&81,&FA,&71,&B,&51,&20,&23,&5E,&2
db &C1,&F,&9,&71,&F2,&30,&7E,&1C,&AC,&F,&8,&21,&40,&E,&7E,&F3
db &E4,&F,&8,&21,&30,&7,&F8,&84,&42,&F,&8,&22,&81,&30,&B3,&8A
db &47,&F,&8,&71,&1,&42,&21,&20,&15,&42,&F,&7,&30,&F8,&E0,&15
db &F1,&2,&E1,&F,&7,&50,&D8,&C0,&2B,&1F,&F0,&11,&F,&8,&40,&E8
db &B,&1F,&B2,&11,&F,&6,&40,&D8,&C0,&2B,&1F,&F,&9,&10,&F8,&82
db &30,&17,&1F,&B2,&11,&F,&7,&61,&40,&40,&17,&1F,&F0,&11,&F,&7
db &31,&82,&30,&36,&1F,&C2,&F,&8,&21,&2,&30,&95,&1A,&60,&F,&8
db &61,&82,&10,&32,&12,&10,&42,&F,&8,&21,&40,&8,&95,&7,&C2,&F
db &8,&61,&2,&30,&12,&3F,&40,&F,&8,&E1,&40,&8,&A9,&3E,&C2,&F
db &8,&F1,&11,&3,&20,&3F,&C0,&11,&F,&7,&B1,&11,&2,&81,&20,&7E
db &E2,&31,&F,&7,&41,&20,&C7,&18,&D1,&72,&61,&31,&F,&7,&41,&10
db &7C,&F1,&E2,&F1,&10,&82,&61,&F,&7,&41,&40,&C6,&18,&7C,&E,&21
db &F,&6,&10,&18,&4,&20,&7E,&A4,&41,&F,&6,&10,&AC,&21,&3,&30
db &3C,&D0,&1A,&F,&5,&10,&B6,&21,&5,&20,&D8,&36,&F,&5,&10,&D2
db &61,&5,&20,&98,&26,&A
Sprite4_End:

Sprite4Color_Setup:
ld hl,Sprite4Color_Start-1
ld de,Sprite4Color_End-1
ld b,0*8   ;Y-Start
ld ixh,16	;Width
ld IXL,8+16	;X-Righthandside
ret
Sprite4Color_Start:
db &10,&47,&71,&4F,&A,&20,&47,&47,&20,&41,&41,&11,&43,&10,&41,&20
db &7,&7,&20,&3,&3,&10,&7,&20,&3,&3,&0,&8,&41,&20,&47,&47
db &10,&7,&0,&5,&3,&0,&8,&41,&0,&3,&47,&0,&3,&3,&10,&47
db &0,&9,&41,&0,&6,&47,&20,&42,&47,&0,&6,&41,&0,&3,&47,&20
db &7,&45,&20,&47,&47,&10,&45,&20,&42,&42,&10,&47,&0,&4,&41,&0
db &4,&47,&10,&7,&0,&4,&45,&0,&4,&47,&0,&3,&41,&0,&3,&47
db &20,&7,&7,&0,&3,&45,&10,&47,&20,&42,&42,&0,&3,&47,&0,&6
db &41,&10,&7,&0,&3,&45,&10,&7,&0,&6,&41,&0,&5,&47,&10,&7
db &0,&3,&45,&20,&7,&7,&0,&A,&47,&10,&7,&0,&3,&45,&20,&7
db &7,&0,&9,&47,&0,&3,&7,&20,&45,&45,&20,&7,&7,&0,&4,&47
db &71,&41
Sprite4Color_End:

