
PicSimpleGameOverpng:


ld hl,&C190-1-28
call PicSimpleGameOverpngShow

ld hl,&C190-1-28+&800
jp PicSimpleGameOverpngShow

PicSimpleGameOverpngShow:

ld b,48
ld IXL,12
di
ld (StackRestore_PlusRawBmp2-2),sp
ld sp,BitmapData+0

jp DrawRawBmp
ret

BitmapData: 
defb &00,&00,&00,&00,&70,&F0,&03,&00,&03,&00
defb &00,&00,&00,&00,&00,&00,&06,&00,&03,&00
defb &00,&00,&00,&00,&00,&00,&C0,&00,&F0,&F0
defb &03,&18,&03,&08,&00,&00,&00,&00,&00,&00
defb &0E,&00,&03,&00,&00,&00,&00,&00,&00,&00
defb &E0,&00,&F0,&F0,&10,&F0,&01,&08,&00,&00
defb &00,&00,&00,&00,&0C,&00,&06,&01,&00,&00
defb &00,&00,&00,&00,&F0,&00,&F0,&F0,&70,&F0
defb &00,&00,&00,&00,&00,&00,&00,&00,&08,&00
defb &06,&01,&00,&00,&00,&00,&00,&00,&F0,&C0
defb &F0,&70,&50,&F0,&04,&10,&00,&00,&00,&00
defb &00,&00,&08,&00,&00,&01,&00,&00,&00,&00
defb &00,&00,&F0,&A0,&C0,&10,&50,&70,&05,&18
defb &00,&01,&00,&00,&00,&00,&00,&00,&00,&00
defb &00,&00,&00,&00,&00,&00,&F0,&40,&00,&10
defb &58,&50,&07,&0F,&00,&01,&00,&00,&00,&00
defb &00,&00,&00,&00,&30,&C0,&00,&00,&00,&00
defb &D0,&00,&00,&00,&1E,&40,&2F,&8F,&00,&05
defb &00,&00,&00,&00,&00,&00,&E0,&00,&F0,&F0
defb &00,&00,&00,&00,&00,&00,&00,&00,&0F,&08
defb &AF,&8F,&01,&07,&00,&00,&05,&04,&00,&01
defb &F0,&F0,&F0,&F0,&00,&30,&00,&00,&00,&00
defb &04,&00,&0F,&05,&AF,&8F,&05,&0F,&04,&00
defb &0F,&0D,&F0,&41,&F0,&F0,&F0,&F0,&00,&70
defb &C0,&00,&70,&F0,&04,&00,&05,&05,&AF,&0F
defb &05,&07,&0D,&05,&AF,&0F,&D0,&43,&F0,&F0
defb &F0,&F0,&00,&F0,&C0,&00,&70,&F0,&00,&00
defb &05,&00,&8F,&0D,&05,&2F,&0F,&0D,&2F,&AF
defb &50,&43,&70,&F0,&F0,&00,&30,&F0,&00,&00
defb &F0,&E0,&00,&30,&00,&84,&0F,&04,&0F,&0F
defb &8F,&05,&0F,&AF,&50,&07,&00,&10,&C0,&00
defb &10,&70,&C0,&00,&F0,&F0,&10,&F0,&A5,&84
defb &0D,&21,&0F,&0F,&8F,&0F,&0F,&AF,&10,&0F
defb &E0,&00,&40,&00,&00,&30,&C0,&00,&70,&B0
defb &70,&F0,&A5,&84,&2C,&05,&0F,&0F,&AF,&0F
defb &0F,&2F,&03,&0F,&E0,&00,&10,&F0,&10,&00
defb &00,&00,&00,&00,&70,&C0,&A5,&90,&E0,&A0
defb &0F,&0F,&0F,&0F,&0F,&0F,&00,&0B,&74,&F0
defb &F0,&C0,&10,&72,&00,&00,&00,&00,&50,&00
defb &A5,&94,&F0,&A0,&0F,&78,&0F,&0F,&0A,&0F
defb &F0,&02,&B0,&F1,&FA,&00,&10,&98,&0D,&00
defb &00,&07,&40,&01,&25,&A4,&F0,&A0,&3C,&90
defb &0A,&0A,&0A,&0A,&E4,&00,&00,&10,&00,&00
defb &30,&40,&C3,&00,&0F,&0F,&30,&E1,&25,&A4
defb &F0,&A0,&A0,&F0,&00,&0A,&33,&00,&E4,&66
defb &00,&10,&00,&00,&30,&00,&F0,&04,&00,&F0
defb &F0,&F0,&25,&30,&B0,&E0,&52,&28,&00,&00
defb &33,&30,&A0,&66,&70,&80,&00,&00,&30,&00
defb &E1,&0D,&00,&F0,&00,&00,&43,&3C,&20,&A0
defb &5A,&5A,&70,&10,&33,&FF,&77,&EE,&F0,&A0
defb &00,&00,&30,&00,&E1,&0D,&30,&F0,&00,&70
defb &86,&0F,&5A,&18,&5A,&5A,&F0,&92,&A0,&00
defb &80,&20,&C0,&A0,&00,&F0,&00,&00,&E1,&0D
defb &30,&F0,&10,&C0,&87,&00,&5A,&70,&C0,&5A
defb &70,&F0,&80,&00,&00,&20,&00,&00,&30,&C0
defb &00,&00,&E1,&0D,&00,&70,&E0,&00,&C0,&00
defb &58,&F0,&D0,&50,&50,&10,&B3,&FF,&77,&EE
defb &00,&00,&F0,&00,&00,&00,&0F,&10,&00,&61
defb &C0,&0D,&80,&10,&30,&F0,&50,&60,&10,&50
defb &B3,&00,&00,&66,&F1,&E0,&80,&00,&00,&30
defb &1E,&E0,&0C,&43,&C0,&07,&00,&70,&70,&00
defb &40,&44,&F2,&50,&33,&22,&00,&66,&44,&75
defb &00,&00,&00,&60,&D2,&A0,&10,&C3,&E0,&00
defb &F0,&F0,&70,&00,&40,&11,&B8,&98,&00,&00
defb &80,&00,&00,&70,&00,&00,&00,&C0,&0E,&A0
defb &E0,&70,&F0,&00,&F0,&D0,&60,&30,&50,&00
defb &10,&C8,&F0,&C0,&00,&30,&E0,&00,&00,&F0
defb &10,&80,&0A,&B0,&B0,&C3,&F0,&F0,&00,&70
defb &F0,&C0,&10,&40,&E0,&62,&00,&30,&00,&00
defb &00,&00,&F0,&C0,&10,&00,&0A,&78,&70,&82
defb &87,&87,&01,&10,&F0,&81,&00,&40,&30,&00
defb &F0,&E6,&30,&FC,&F7,&00,&91,&F8,&20,&30
defb &0B,&78,&E0,&82,&C3,&3C,&0F,&10,&70,&80
defb &00,&10,&80,&20,&0E,&30,&F6,&83,&18,&FC
defb &74,&07,&60,&00,&0F,&3C,&A0,&83,&C3,&F0
defb &05,&38,&30,&C0,&80,&10,&F0,&B0,&03,&08
defb &E8,&8C,&0E,&73,&D1,&88,&60,&11,&0F,&1C
defb &A0,&F0,&A1,&68,&00,&70,&50,&F0,&E0,&10
defb &74,&B0,&11,&0C,&91,&CC,&07,&11,&03,&00
defb &40,&30,&87,&0C,&B0,&F0,&87,&4A,&50,&B0
defb &40,&F0,&FE,&10,&74,&31,&03,&0C,&89,&0C
defb &0E,&11,&03,&00,&40,&D0,&E1,&40,&3C,&F0
defb &0E,&0A,&14,&F0,&50,&05,&FA,&00,&FE,&71
defb &0F,&19,&CC,&0F,&0E,&33,&01,&0F,&00,&11
defb &40,&00,&0F,&0F,&60,&0B,&F0,&C0,&40,&00
defb &FA,&00,&FE,&73,&0E,&33,&FF,&01,&08,&77
defb &88,&07,&00,&11,&11,&44,&89,&05,&F0,&91
defb &F2,&70,&40,&30,&FE,&00,&FE,&32,&33,&FF
defb &77,&EE,&11,&FF,&EE,&00,&55,&44,&11,&DD
defb &98,&40,&F2,&D9,&E8,&F0,&10,&F2,&98,&10
defb &FF,&73,&FF,&FF,&FF,&FF,&FF,&EE,&FF,&FF
defb &44,&00,&66,&00,&06,&00,&7A,&86,&10,&0F
defb &70,&FA,&10,&10,&FF,&EA,&FF,&FF,&FF,&FF
defb &FF,&CC,&77,&FF,&00,&11,&CC,&0A,&3B,&DD
defb &3B,&CD,&00,&87,&F2,&80,&50,&00,&FF,&CC
defb &FF,&FF,&77,&FF,&FF,&FF,&33,&FF,&55,&00
defb &CC,&0A,&04,&00,&0C,&22,&00,&61,&40,&01
defb &10,&40,&FF,&10,&33,&FF,&EE,&00,&FF,&FF
defb &15,&FF,&00,&01,&AB,&0F,&8B,&0C,&AA,&15
defb &04,&00,&02,&01,&40,&00,&CC,&10,&00,&77
defb &CC,&00,&FF,&FF,&00,&77,&01,&01,&AB,&0F
defb &88,&AA,&AA,&99,&00,&00,&02,&00,&10,&40
defb &00,&8A,&D0,&F7,&FF,&00,&FF,&FF,&01,&04
defb &01,&04,&8B,&0F,&22,&BB,&3B,&AB,&05,&00
defb &0A,&00,&8A,&0A,&00,&AA,&F1,&8A,&FF,&DC
defb &04,&FF,&55,&01,&00,&FF,&88,&0F,&AA,&EE
defb &2A,&EE,&00,&02,&08,&01,&EE,&8A,&77,&FF
defb &88,&02,&33,&FF,&05,&00,&DD,&00,&33,&FF
defb &00,&0A,&BB,&AA,&2A,&BB,&00,&08,&00,&00
defb &EE,&CC,&FF,&66,&00,&0A,&0A,&00,&02,&0A
defb &FF,&44,&EE,&77,&00,&02,&AA,&88,&00,&22
defb &00,&0A,&0A,&00,&EE,&CC,&EE,&EE,&0A,&08
defb &02,&0A,&02,&00,&FF,&45,&DD,&CC,&00,&00
defb &00,&00,&00,&00,&08,&00,&02,&0A,&EE,&88
defb &CC,&DD,&02,&0A,&00,&00,&00,&00,&00,&00
defb &00,&00

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
ld de,&0800*2+24
add hl,de
jp nc,JumpToNextLineRawBmp
ld de,&c050
add hl,de
JumpToNextLineRawBmp:
ld b,c
djnz RawBmpRepeatNextLine
ld sp,&0000:StackRestore_PlusRawBmp2
ei
list
ret