org &4000
nolist
jp PicCharacterDialogbmp
jp PicMassiveLollipopsalepng

PicCharacterDialogbmp:
ld hl,PicCharacterDialogbmp_rledata-1
ld de,PicCharacterDialogbmp_rledataEnd-1
ld b,0
ld ixh,38
ld IXL,57
di
exx 
push bc
exx
jp RLE_Draw
PicCharacterDialogbmp_rledata:

defb &FF,&3d
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &51
defb &F,&3b
defb &A1
defb &CF,&16
defb &41
defb &F,&16
defb &A1
defb &D1
defb &CF,&17
defb &F,&9
defb &81
defb &E1
defb &F2
defb &C9
defb &D1
defb &CF,&18
defb &41
defb &F,&7
defb &81
defb &C3
defb &F2
defb &D1
defb &C6
defb &FF,&1b
defb &F,&6
defb &81
defb &C5
defb &E1
defb &F2
defb &D1
defb &CF,&1e
defb &10,&FE

defb &51
defb &F,&3
defb &81
defb &C8
defb &E1
defb &F2
defb &C1
defb &D1
defb &CF,&a
defb &91
defb &CF,&0
defb &20,&32,&EE

defb &51
defb &F,&1
defb &81
defb &CB
defb &F1
defb &D1
defb &CF,&1
defb &91
defb &C3
defb &31
defb &C3
defb &31
defb &91
defb &CF,&0
defb &30,&FE,&11,&EE

defb &51
defb &E
defb &81
defb &CC
defb &D1
defb &CF,&0
defb &10,&96
defb &C2
defb &61
defb &32
defb &C2
defb &31
defb &CF,&1
defb &E1
defb &F3
defb &20,&11,&EE
defb &D
defb &81
defb &CB
defb &E1
defb &D1
defb &CA
defb &31
defb &C3
defb &61
defb &32
defb &10,&69
defb &33
defb &91
defb &32
defb &10,&78

defb &91
defb &CD
defb &E1
defb &F5
defb &10,&11

defb &F1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CA
defb &33
defb &91
defb &38
defb &21
defb &20,&8,&3C

defb &91
defb &CD
defb &E1
defb &F5
defb &10,&EF

defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CA
defb &61
defb &3B
defb &21
defb &10,&7
defb &32
defb &CE
defb &E1
defb &F4
defb &71
defb &10,&CF

defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CB
defb &20,&3,&7

defb &21
defb &42
defb &C1
defb &30,&1C,&9,&7
defb &32
defb &CE
defb &E1
defb &F4
defb &71
defb &10,&8F

defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CB
defb &61
defb &23
defb &84
defb &24
defb &20,&7,&87
defb &CE
defb &E1
defb &F2
defb &C2
defb &32
defb &B1
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CB
defb &20,&3,&7
defb &84
defb &10,&1C
defb &22
defb &10,&8

defb &31
defb &CF,&0
defb &10,&FE

defb &D1
defb &C2
defb &61
defb &32
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CA
defb &31
defb &11
defb &33
defb &81
defb &C3
defb &61
defb &35
defb &91
defb &CF,&0
defb &10,&FE

defb &D1
defb &C2
defb &E1
defb &10,&1F

defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &C9
defb &61
defb &35
defb &81
defb &C3
defb &30,&1E,&2,&E

defb &91
defb &CF,&0
defb &10,&FE

defb &D1
defb &C3
defb &F2
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CA
defb &31
defb &11
defb &33
defb &C4
defb &30,&1E,&E,&D
defb &CF,&1
defb &10,&BE

defb &D1
defb &C3
defb &F2
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &D1
defb &CA
defb &61
defb &20,&B,&9
defb &42
defb &40,&B0,&6,&E,&85
defb &CF,&1
defb &E1
defb &32
defb &C3
defb &F2
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &51
defb &A
defb &C1
defb &10,&D
defb &22
defb &A2
defb &82
defb &23
defb &31
defb &10,&85

defb &C1
defb &D
defb &40,&E0,&7E,&8F,&F8
defb &F2
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &51
defb &A
defb &C2
defb &21
defb &30,&9,&EE,&60

defb &31
defb &22
defb &1
defb &10,&86

defb &C1
defb &D
defb &30,&E0,&FE,&8F
defb &F4
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &51
defb &A
defb &C2
defb &61
defb &20,&B,&7F
defb &38
defb &C1
defb &3
defb &10,&66
defb &5
defb &F1
defb &2
defb &30,&E0,&FE,&8F
defb &F4
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &10,&11

defb &F1
defb &5
defb &10,&66

defb &1
defb &C2
defb &32
defb &A1
defb &F1
defb &36
defb &91
defb &10,&1E

defb &C1
defb &3
defb &10,&6F
defb &35
defb &B1
defb &40,&11,&E0,&FE,&9F
defb &F4
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &10,&19

defb &F1
defb &36
defb &F1
defb &1
defb &C2
defb &32
defb &B1
defb &D1
defb &C2
defb &34
defb &C2
defb &31
defb &91
defb &2
defb &A1
defb &F1
defb &37
defb &10,&11

defb &81
defb &C2
defb &E1
defb &F6
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &10,&DD

defb &71
defb &36
defb &B1
defb &1
defb &C2
defb &61
defb &10,&CF
defb &C3
defb &61
defb &32
defb &C3
defb &61
defb &91
defb &2
defb &A1
defb &40,&11,&B,&D,&C
defb &2
defb &81
defb &C2
defb &41
defb &1
defb &F5
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &30,&DD,&8,&D
defb &20,&6,&6

defb &1
defb &C2
defb &61
defb &10,&EF
defb &C4
defb &10,&87
defb &C5
defb &3
defb &10,&7

defb &31
defb &23
defb &10,&B
defb &2
defb &81
defb &C2
defb &41
defb &2
defb &F4
defb &A1
defb &C
defb &81
defb &CB
defb &E1
defb &20,&19,&B
defb &13
defb &31
defb &12
defb &1
defb &C3
defb &10,&F6
defb &CB
defb &3
defb &10,&7

defb &31
defb &23
defb &10,&B
defb &2
defb &81
defb &C2
defb &41
defb &3
defb &A1
defb &F2
defb &51
defb &C
defb &81
defb &CB
defb &E1
defb &20,&19,&B
defb &13
defb &31
defb &12
defb &1
defb &CF,&1
defb &3
defb &40,&3,&B,&8,&D
defb &2
defb &81
defb &C2
defb &41
defb &4
defb &10,&EE
defb &D
defb &81
defb &CB
defb &E1
defb &20,&19,&9
defb &12
defb &20,&C,&6

defb &1
defb &CF,&1
defb &3
defb &10,&7

defb &31
defb &24
defb &31
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &20,&19,&B
defb &14
defb &10,&7

defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &10,&7

defb &31
defb &24
defb &31
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &20,&19,&B
defb &14
defb &10,&7

defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &10,&1

defb &11
defb &23
defb &10,&9
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &20,&19,&8

defb &1
defb &12
defb &31
defb &10,&4

defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &38
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &10,&19
defb &37
defb &11
defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &31
defb &92
defb &62
defb &31
defb &10,&3C
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &50,&19,&4B,&B4,&87,&16

defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &40,&87,&F9,&96,&78
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &30,&19,&CB,&F4

defb &31
defb &C2
defb &11
defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &31
defb &92
defb &62
defb &91
defb &10,&78
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &30,&19,&4B,&B4

defb &31
defb &C2
defb &11
defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &35
defb &F1
defb &10,&3C
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &CB
defb &E1
defb &10,&19
defb &34
defb &20,&E7,&16

defb &1
defb &C2
defb &41
defb &A
defb &81
defb &C2
defb &3
defb &34
defb &F1
defb &33
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C8
defb &30,&1E,&E9,&19
defb &33
defb &B1
defb &71
defb &32
defb &11
defb &1
defb &C2
defb &41
defb &20,&4,&4
defb &6
defb &81
defb &C2
defb &3
defb &20,&B,&B
defb &20,&D,&9
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C3
defb &82
defb &C2
defb &81
defb &30,&E,&E9,&19
defb &20,&D,&D
defb &20,&E,&4

defb &1
defb &C2
defb &41
defb &10,&6
defb &33
defb &5
defb &81
defb &C2
defb &3
defb &31
defb &27
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C2
defb &10,&3

defb &81
defb &C2
defb &1
defb &30,&4A,&CB,&19
defb &18
defb &1
defb &C2
defb &41
defb &30,&9,&1,&6
defb &4
defb &81
defb &C2
defb &3
defb &31
defb &12
defb &31
defb &10,&D
defb &22
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &20,&78,&7

defb &21
defb &32
defb &11
defb &30,&A4,&CB,&19

defb &31
defb &22
defb &31
defb &21
defb &13
defb &1
defb &C2
defb &61
defb &10,&8
defb &3
defb &31
defb &11
defb &3
defb &81
defb &C2
defb &3
defb &32
defb &61
defb &35
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &61
defb &32
defb &C1
defb &35
defb &62
defb &B1
defb &20,&19,&87
defb &35
defb &11
defb &1
defb &C2
defb &11
defb &3
defb &31
defb &2
defb &21
defb &3
defb &81
defb &C2
defb &3
defb &32
defb &20,&16,&6
defb &32
defb &2
defb &81
defb &C2
defb &41
defb &F,&2
defb &A1
defb &30,&91,&3C,&78
defb &35
defb &92
defb &B1
defb &50,&19,&87,&3,&B,&7

defb &1
defb &C2
defb &31
defb &10,&4
defb &22
defb &2
defb &21
defb &3
defb &81
defb &C2
defb &3
defb &33
defb &24
defb &31
defb &2
defb &81
defb &C2
defb &41
defb &F,&2
defb &52
defb &81
defb &20,&96,&B4
defb &35
defb &91
defb &20,&F8,&19
defb &32
defb &14
defb &10,&7

defb &1
defb &C2
defb &61
defb &10,&2

defb &31
defb &3
defb &11
defb &3
defb &81
defb &C2
defb &2
defb &A1
defb &10,&1F

defb &61
defb &22
defb &11
defb &32
defb &10,&11

defb &81
defb &C2
defb &41
defb &F,&3
defb &20,&B3,&B4
defb &62
defb &60,&D9,&47,&B6,&F8,&DD,&87
defb &12
defb &20,&B,&8F

defb &1
defb &C2
defb &31
defb &21
defb &5
defb &21
defb &3
defb &81
defb &C2
defb &2
defb &A1
defb &71
defb &36
defb &B1
defb &10,&11

defb &81
defb &C2
defb &41
defb &F,&3
defb &10,&B3
defb &C4
defb &50,&F9,&C7,&3E,&F8,&DD
defb &37
defb &F1
defb &20,&C0,&16
defb &4
defb &33
defb &3
defb &81
defb &C2
defb &3
defb &F1
defb &6
defb &F1
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C4
defb &10,&EF
defb &B2
defb &30,&1F,&F8,&99

defb &51
defb &5
defb &20,&66,&C0

defb &61
defb &2
defb &11
defb &20,&C,&9F

defb &51
defb &3
defb &81
defb &C2
defb &A1
defb &6
defb &53
defb &2
defb &51
defb &D1
defb &C2
defb &41
defb &F,&4
defb &81
defb &C4
defb &40,&1F,&7F,&2F,&F8

defb &51
defb &A
defb &C1
defb &40,&12,&4E,&8F,&B

defb &51
defb &3
defb &81
defb &C2
defb &51
defb &A2
defb &2
defb &52
defb &10,&88
defb &3
defb &A1
defb &81
defb &C2
defb &41
defb &F,&0
defb &F1
defb &3
defb &81
defb &C2
defb &10,&90
defb &F2
defb &30,&76,&3F,&E9
defb &53
defb &1
defb &A2
defb &1
defb &52
defb &A2
defb &C2
defb &11
defb &10,&2B

defb &F1
defb &72
defb &21
defb &51
defb &3
defb &81
defb &C2
defb &A1
defb &2
defb &10,&99
defb &3
defb &52
defb &2
defb &51
defb &D1
defb &C2
defb &41
defb &E
defb &A2
defb &3
defb &81
defb &C2
defb &2
defb &E1
defb &F2
defb &1
defb &30,&3F,&F9,&99
defb &2
defb &51
defb &2
defb &A1
defb &3
defb &C2
defb &61
defb &30,&2B,&6E,&3F

defb &F1
defb &3
defb &81
defb &C2
defb &51
defb &A1
defb &4
defb &51
defb &A2
defb &3
defb &A1
defb &81
defb &C2
defb &41
defb &F,&0
defb &A1
defb &51
defb &2
defb &81
defb &C2
defb &2
defb &40,&DE,&99,&9F,&F9
defb &53
defb &2
defb &A1
defb &1
defb &52
defb &A1
defb &1
defb &C2
defb &61
defb &30,&AB,&CC,&8F

defb &F1
defb &3
defb &81
defb &C2
defb &A1
defb &2
defb &10,&99
defb &3
defb &52
defb &2
defb &51
defb &D1
defb &C2
defb &41
defb &F,&0
defb &A1
defb &51
defb &2
defb &81
defb &C2
defb &20,&81,&F8
defb &F2
defb &20,&F8,&FB

defb &D1
defb &CC
defb &41
defb &20,&CE,&B8
defb &F2
defb &20,&19,&7

defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &81
defb &10,&F8

defb &71
defb &C2
defb &61
defb &10,&B7

defb &C1
defb &F3
defb &D1
defb &CC
defb &41
defb &50,&8C,&71,&EE,&4C,&7

defb &81
defb &CF,&3
defb &41
defb &F,&2
defb &A1
defb &10,&91

defb &C1
defb &F2
defb &D1
defb &10,&7E
defb &32
defb &20,&FC,&F9

defb &D1
defb &CC
defb &41
defb &2
defb &40,&F3,&77,&CC,&7

defb &81
defb &CF,&3
defb &41
defb &F,&2
defb &52
defb &81
defb &10,&BC
defb &F3
defb &71
defb &32
defb &20,&F7,&FB

defb &D1
defb &CC
defb &41
defb &20,&8,&EF
defb &2
defb &F2
defb &10,&7

defb &81
defb &CF,&3
defb &41
defb &F,&3
defb &10,&B3
defb &C3
defb &F1
defb &D1
defb &33
defb &20,&F7,&F8

defb &D1
defb &CC
defb &41
defb &20,&8,&7

defb &31
defb &F3
defb &10,&3

defb &81
defb &CF,&3
defb &41
defb &F,&3
defb &10,&B3
defb &C5
defb &33
defb &91
defb &C2
defb &E1
defb &D1
defb &CC
defb &41
defb &30,&C,&9,&CF

defb &71
defb &32
defb &1
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &81
defb &C5
defb &61
defb &32
defb &91
defb &C2
defb &E1
defb &D1
defb &CC
defb &41
defb &10,&C

defb &21
defb &32
defb &11
defb &21
defb &32
defb &1
defb &81
defb &CF,&3
defb &41
defb &F,&5
defb &C5
defb &E1
defb &10,&1F

defb &91
defb &C2
defb &E1
defb &D1
defb &CC
defb &41
defb &20,&C,&E
defb &2
defb &10,&E
defb &2
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &81
defb &10,&EE
defb &C3
defb &E1
defb &10,&7F
defb &C3
defb &E1
defb &CD
defb &41
defb &20,&C,&1

defb &11
defb &5
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &42
defb &81
defb &F1
defb &C2
defb &31
defb &F2
defb &C3
defb &E1
defb &D1
defb &CC
defb &41
defb &1
defb &33
defb &11
defb &5
defb &81
defb &CF,&3
defb &61
defb &3F,&3
defb &20,&20,&60

defb &A1
defb &C2
defb &33
defb &91
defb &C2
defb &E1
defb &D1
defb &CC
defb &41
defb &1
defb &33
defb &11
defb &5
defb &81
defb &CF,&3
defb &61
defb &3F,&3
defb &30,&20,&C2,&F2

defb &61
defb &34
defb &CF,&1
defb &41
defb &20,&C0,&1E

defb &11
defb &5
defb &81
defb &CF,&3
defb &61
defb &3F,&3
defb &30,&41,&87,&B0

defb &61
defb &34
defb &C2
defb &E1
defb &71
defb &3D
defb &91
defb &C2
defb &61
defb &91
defb &3F,&1d
defb &81
defb &20,&1E,&40

defb &C1
defb &34
defb &C2
defb &E1
defb &71
defb &3D
defb &91
defb &C4
defb &3F,&1d
defb &11
defb &30,&34,&40,&F8

defb &71
defb &32
defb &C2
defb &E1
defb &3E
defb &C5
defb &3F,&1e
defb &40,&40,&60,&88,&F9

defb &D1
defb &C2
defb &E1
defb &FE
defb &C2
defb &D1
defb &C2
defb &F9
defb &71
defb &3F,&15
defb &81
defb &30,&38,&8F,&D9

defb &D1
defb &C2
defb &E1
defb &FE
defb &C2
defb &D1
defb &C2
defb &E1
defb &FF,&1e
defb &51
defb &30,&4C,&8F,&99

defb &D1
defb &C3
defb &FE
defb &C2
defb &E1
defb &C2
defb &E1
defb &FF,&22
defb &A1
defb &20,&AB,&3
defb &C2
defb &FE
defb &10,&D1

defb &E1
defb &C2
defb &E1
defb &FF,&21
defb &10,&1F

defb &B1
defb &32
defb &F1
defb &10,&88
defb &FE
defb &10,&DD
defb &A2
defb &51
defb &FF,&22
defb &10,&1F

defb &F1
defb &32
defb &FF,&2
defb &10,&DD
defb &A2
defb &51
defb &FF,&22
defb &20,&9F,&3F
defb &FF,&3
defb &10,&DD
defb &A2
defb &10,&33
defb &FF,&37
defb &10,&DD
defb &52
defb &F2
defb &A1
defb &FF,&36
defb &20,&99,&33
defb &F2
defb &A1
defb &FF,&37
defb &2
defb &A1
defb &2
defb &FF,&ff,&f2
PicCharacterDialogbmp_rledataEnd: defb 0
PicMassiveLollipopsalepng:
ld hl,PicMassiveLollipopsalepng_rledata-1
ld de,PicMassiveLollipopsalepng_rledataEnd-1
ld b,53
ld ixh,38
ld IXL,57
di
exx 
push bc
exx
jp RLE_Draw
PicMassiveLollipopsalepng_rledata:

defb &10,&19
defb &33
defb &B1
defb &71
defb &32
defb &11
defb &1
defb &C2
defb &61
defb &10,&8
defb &8
defb &81
defb &C2
defb &3
defb &20,&B,&B
defb &20,&D,&9
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C3
defb &82
defb &C2
defb &81
defb &30,&E,&E9,&19
defb &20,&D,&D
defb &30,&E,&4,&C0
defb &33
defb &21
defb &11
defb &7
defb &81
defb &C2
defb &3
defb &31
defb &27
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C2
defb &10,&3

defb &81
defb &C2
defb &1
defb &30,&4A,&CB,&19
defb &18
defb &30,&48,&1,&6

defb &21
defb &7
defb &81
defb &C2
defb &3
defb &31
defb &12
defb &31
defb &10,&D
defb &22
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &20,&78,&7

defb &21
defb &32
defb &11
defb &30,&A4,&CB,&19

defb &31
defb &22
defb &31
defb &21
defb &13
defb &10,&E
defb &3
defb &11
defb &10,&4
defb &6
defb &81
defb &C2
defb &3
defb &32
defb &61
defb &35
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &61
defb &32
defb &C1
defb &35
defb &62
defb &B1
defb &20,&19,&87
defb &35
defb &12
defb &2
defb &31
defb &3
defb &21
defb &6
defb &81
defb &C2
defb &3
defb &32
defb &20,&16,&6
defb &32
defb &2
defb &81
defb &C2
defb &41
defb &E
defb &10,&66
defb &3
defb &81
defb &20,&3C,&78
defb &35
defb &92
defb &B1
defb &40,&19,&87,&3,&B

defb &31
defb &12
defb &2
defb &12
defb &21
defb &10,&C
defb &6
defb &81
defb &C2
defb &3
defb &33
defb &24
defb &31
defb &2
defb &81
defb &C2
defb &41
defb &E
defb &52
defb &3
defb &81
defb &20,&96,&B4
defb &35
defb &91
defb &20,&F8,&19
defb &32
defb &14
defb &10,&7

defb &21
defb &3
defb &10,&3
defb &12
defb &6
defb &81
defb &C2
defb &2
defb &A1
defb &10,&1F

defb &61
defb &22
defb &11
defb &32
defb &10,&11

defb &81
defb &C2
defb &41
defb &F,&0
defb &F1
defb &3
defb &81
defb &10,&B4
defb &62
defb &60,&6F,&8F,&97,&F8,&DD,&87
defb &12
defb &20,&B,&8F

defb &11
defb &5
defb &10,&D
defb &6
defb &81
defb &C2
defb &2
defb &A1
defb &71
defb &36
defb &B1
defb &10,&11

defb &81
defb &C2
defb &41
defb &F,&0
defb &F1
defb &3
defb &81
defb &C4
defb &50,&F9,&C7,&3E,&F8,&DD
defb &37
defb &F1
defb &33
defb &4
defb &21
defb &11
defb &5
defb &81
defb &C2
defb &3
defb &F1
defb &6
defb &F1
defb &2
defb &81
defb &C2
defb &41
defb &F,&4
defb &81
defb &C4
defb &50,&C9,&27,&1E,&F8,&99

defb &51
defb &5
defb &40,&66,&6E,&2F,&8
defb &2
defb &11
defb &5
defb &81
defb &C2
defb &A1
defb &6
defb &53
defb &2
defb &51
defb &D1
defb &C2
defb &41
defb &F,&4
defb &81
defb &C4
defb &40,&1F,&7F,&2F,&F8

defb &51
defb &9
defb &40,&26,&4F,&8F,&1

defb &11
defb &5
defb &81
defb &C2
defb &51
defb &A2
defb &2
defb &52
defb &10,&88
defb &3
defb &A1
defb &81
defb &C2
defb &41
defb &F,&2
defb &F1
defb &10,&80
defb &C4
defb &F2
defb &E1
defb &F2
defb &31
defb &10,&E9
defb &53
defb &1
defb &A2
defb &1
defb &52
defb &A2
defb &11
defb &B2
defb &20,&37,&1B
defb &6
defb &81
defb &C2
defb &A1
defb &2
defb &10,&99
defb &3
defb &52
defb &2
defb &51
defb &D1
defb &C2
defb &41
defb &F,&1
defb &A2
defb &10,&80
defb &C2
defb &10,&90

defb &E1
defb &F2
defb &51
defb &30,&2E,&F8,&99
defb &2
defb &51
defb &2
defb &A1
defb &2
defb &40,&3F,&BF,&15,&17
defb &2
defb &C2
defb &2
defb &81
defb &C2
defb &51
defb &A1
defb &4
defb &51
defb &A2
defb &3
defb &A1
defb &81
defb &C2
defb &41
defb &F,&2
defb &A1
defb &10,&91
defb &C2
defb &2
defb &61
defb &F2
defb &81
defb &20,&86,&F8
defb &53
defb &2
defb &A1
defb &1
defb &52
defb &A1
defb &50,&7F,&CF,&44,&17,&80
defb &C2
defb &10,&10

defb &81
defb &C2
defb &A1
defb &2
defb &10,&99
defb &3
defb &52
defb &2
defb &51
defb &D1
defb &C2
defb &41
defb &F,&2
defb &A1
defb &10,&91
defb &C2
defb &2
defb &20,&F8,&51
defb &C3
defb &E1
defb &D1
defb &C9
defb &E1
defb &F2
defb &51
defb &10,&FC

defb &11
defb &2
defb &C4
defb &1
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &81
defb &C2
defb &30,&81,&78,&B7
defb &C2
defb &10,&FD

defb &D1
defb &CA
defb &F1
defb &20,&91,&7E
defb &2
defb &81
defb &C4
defb &41
defb &81
defb &CF,&3
defb &41
defb &F,&0
defb &A1
defb &51
defb &2
defb &81
defb &10,&F8

defb &71
defb &C2
defb &71
defb &32
defb &C1
defb &F2
defb &E1
defb &D1
defb &CA
defb &E1
defb &20,&F3,&33
defb &32
defb &91
defb &C4
defb &41
defb &81
defb &CF,&3
defb &41
defb &F,&0
defb &52
defb &2
defb &81
defb &30,&FC,&F1,&7F
defb &32
defb &F4
defb &D1
defb &C8
defb &E1
defb &D1
defb &C2
defb &35
defb &91
defb &C4
defb &41
defb &81
defb &CF,&3
defb &41
defb &F,&1
defb &F1
defb &2
defb &81
defb &10,&BC
defb &F3
defb &71
defb &32
defb &20,&F7,&FB

defb &D1
defb &C7
defb &10,&9E

defb &F1
defb &35
defb &2
defb &81
defb &C4
defb &41
defb &81
defb &CF,&3
defb &41
defb &F,&1
defb &F1
defb &2
defb &81
defb &10,&F8
defb &F2
defb &D1
defb &33
defb &20,&E1,&FE

defb &D1
defb &C7
defb &40,&9E,&7F,&3,&E0
defb &3
defb &C4
defb &1
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &81
defb &C5
defb &61
defb &32
defb &91
defb &C2
defb &E1
defb &D1
defb &C9
defb &F2
defb &20,&1F,&D
defb &3
defb &81
defb &C2
defb &10,&10

defb &81
defb &CF,&3
defb &41
defb &F,&5
defb &C5
defb &E1
defb &10,&1F

defb &91
defb &C2
defb &E1
defb &D1
defb &CA
defb &F1
defb &20,&1F,&D
defb &4
defb &C2
defb &2
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &81
defb &10,&EE
defb &C3
defb &E1
defb &10,&7F
defb &C3
defb &E1
defb &CC
defb &20,&12,&E
defb &8
defb &81
defb &CF,&3
defb &41
defb &F,&4
defb &42
defb &81
defb &F1
defb &C2
defb &31
defb &F2
defb &C3
defb &E1
defb &D1
defb &CB
defb &41
defb &33
defb &8
defb &81
defb &CF,&3
defb &61
defb &3F,&3
defb &20,&20,&60

defb &A1
defb &C2
defb &33
defb &91
defb &C2
defb &E1
defb &D1
defb &CB
defb &61
defb &33
defb &8
defb &81
defb &CF,&3
defb &61
defb &3F,&3
defb &30,&20,&C2,&F2

defb &61
defb &34
defb &CF,&0
defb &20,&1E,&E1
defb &8
defb &81
defb &CF,&3
defb &61
defb &3F,&3
defb &30,&41,&87,&B0

defb &61
defb &34
defb &C2
defb &E1
defb &71
defb &3B
defb &10,&96
defb &C2
defb &61
defb &3F,&1f
defb &81
defb &20,&1E,&40

defb &C1
defb &34
defb &C2
defb &E1
defb &71
defb &3B
defb &C4
defb &61
defb &3F,&1f
defb &11
defb &30,&34,&40,&F8

defb &71
defb &32
defb &C2
defb &E1
defb &3C
defb &C5
defb &3F,&20
defb &40,&40,&60,&88,&F9

defb &D1
defb &C2
defb &E1
defb &FC
defb &C2
defb &E1
defb &C2
defb &FB
defb &71
defb &3F,&15
defb &81
defb &30,&38,&8F,&D9

defb &D1
defb &C2
defb &E1
defb &FB
defb &D1
defb &C2
defb &E1
defb &C2
defb &FF,&21
defb &51
defb &30,&4C,&8F,&99

defb &D1
defb &C3
defb &FB
defb &D1
defb &C2
defb &D1
defb &C2
defb &FF,&25
defb &A1
defb &20,&AB,&3
defb &C2
defb &FB
defb &D1
defb &C2
defb &10,&F1

defb &A1
defb &FF,&24
defb &10,&1F

defb &B1
defb &32
defb &F1
defb &10,&88
defb &FC
defb &A1
defb &52
defb &F1
defb &A1
defb &FF,&24
defb &10,&1F

defb &F1
defb &32
defb &FF,&0
defb &A1
defb &52
defb &F1
defb &A1
defb &FF,&24
defb &20,&9F,&3F
defb &FF,&0
defb &1
defb &F1
defb &52
defb &F1
defb &A1
defb &FF,&36
defb &51
defb &F2
defb &A2
defb &F1
defb &A1
defb &FF,&36
defb &51
defb &F2
defb &1
defb &10,&77

defb &A1
defb &FF,&37
defb &2
defb &51
defb &2
defb &FF,&2d
PicMassiveLollipopsalepng_rledataEnd: defb 0

;File Format:

;NNNNCCCC	NNNN - nibble CCCC- Count , if Count=15 read in next byte too
;CCCC0000	CCCC- Count of literal screen bytes, if Count=15 read in next byte too
;00000000	Repeating Byte

RLE_ImageWidth equ 38
RLE_Draw:
  		ld a,ixh
		ld (ImageWidthA_Plus1-1),a
		ld (ImageWidthB_Plus2-2),a
		ld (ImageWidthC_Plus1-1),a
		ld (ImageWidthD_Plus2-2),a
		ld (ImageWidthE_Plus1-1),a
		cpl
		inc a
		ld (NegativeImageWidth_Plus2-2),a
		ld a,d
		ld (RLE_LastByteH_Plus1-1),a
		ld a,e
		ld (RLE_LastByteL_Plus1-1),a
	push hl
		ld a,IXL
		ld h,&C0
		LD L,a
		ld a,b
				ld de,&FFFF :NegativeImageWidth_Plus2
		or a
RLE_DrawGetNextLine:
		jr z,RLE_DrawGotLine
		call RLE_NextScreenLineHL
		add hl,de
		dec a
		jr RLE_DrawGetNextLine
RLE_DrawGotLine:
		ld (RLE_ScrPos_Plus2-2),hl
	;	xor a
				ld iyl,RLE_ImageWidth :ImageWidthA_Plus1
		ld a,255
		ld e,a
		;ld (Nibble_Plus1-1),a
	pop hl


RLE_MoreBytesLoop:

	inc hl
	ld a,(hl)
	ld b,a
	or a
	jp z,RLE_OneByteData		;One Byte repeated many times
	and %00001111
	jp z,RLE_PlainBitmapData	;Bitmap
	ld ixh,0
	ld ixl,a

	;we're doing Nibble data, Expand the data into two pixels of Mode 1 and duplicate

	ld a,b
	and %00110000
	rrca
	rrca
	ld c,a
	ld a,b
	and %11000000
	or c
	ld c,a
	rrca	;Remove these for Left->right
	rrca
	or c
	ld c,a

	ld a,ixl
	cp 15
	jp nz,RLE_NoMoreNibbleBytes
	push de
RLE_MoreNibbleBytes:			;More than 15 - so read in next byte too
		inc hl
		ld a,(hl)
		ld d,0
		ld e,a
		add ix,de
		cp 255
		jp z,RLE_MoreNibbleBytes
	pop de

RLE_NoMoreNibbleBytes:


	ld a,e
	or a
	jp z,RLE_MoreBytesPart2Flip


	ld a,ixl
	cp 4
	call nc,RLE_ByteNibbles



	xor a
	ld d,a ;byte for screen
	push hl
	ld hl,&C050 :RLE_ScrPos_Plus2
	ld b,iyl
RLE_MoreBytes:
	ld a,c
	and %00110011
	or d
	ld d,a
	dec ix
	ld a,ixl
	or ixh
	jr z,RLE_LastByteFlip


RLE_MoreBytesPart2:
	ld a,c
	and %11001100
	or d
	ld d,a

	dec ix

		ld (hl),d
		dec hl
		dec b
		call z,RLE_NextScreenLineHL

	xor a
	ld d,a ;byte for screen

	ld a,ixl
	or ixh
	jr nz,RLE_MoreBytes

RLE_LastByte:
	ld iyl,b
	ld (RLE_ScrPos_Plus2-2),hl
	pop hl
;	ld iyl,b
	ld a,&00:RLE_LastByteH_Plus1
	cp h
	jp nz,RLE_MoreBytesLoop

	ld a,&00:RLE_LastByteL_Plus1
	cp l
	jp nz,RLE_MoreBytesLoop


;	ei
	exx 			;keep the firmware working!
	pop bc
	exx

	ret
RLE_LastByteFlip:
	ld a,e
	cpl
	ld e,a
	jp RLE_LastByte
RLE_MoreBytesPart2Flip:
	push hl
	ld b,iyl
	ld hl,(RLE_ScrPos_Plus2-2)
	ld a,e
	cpl
	ld e,a
	jp RLE_MoreBytesPart2

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

RLE_NextScreenLine:
	push hl
		ld iyl,RLE_ImageWidth :ImageWidthC_Plus1
		ld hl,&800+RLE_ImageWidth :ImageWidthB_Plus2
		add hl,de
		ex hl,de
	pop hl
	ret nc
	push hl
		ld hl,&c050
		add hl,de
		ex hl,de
	pop hl
	ret

RLE_PlainBitmapData:
	push de
		ld a,(hl)
		rrca
		rrca
		rrca
		rrca
		ld b,0
		ld c,a

		cp 15
		jp nz,RLE_PlainBitmapDataNoExtras
	;More than 14 bytes, load an extra byte into the count
RLE_PlainBitmapDataHasExtras:
		inc hl
		ld a,(hl)
		or a
		jr z,RLE_PlainBitmapDataNoExtras	; no more bytes
		push hl
			ld h,0
			ld l,a
			add hl,bc
			ld b,h
			ld c,l
		pop hl

		cp 255
		jr z,RLE_PlainBitmapDataHasExtras
RLE_PlainBitmapDataNoExtras:

	
		ld de,(RLE_ScrPos_Plus2-2)
		RLE_PlainBitmapData_More:
		inc hl
		ld a,(hl)
		ld (de),a
		dec de



		dec iyl
		call z,RLE_NextScreenLine
		dec bc
		ld a,b
		or c
		jp nz,RLE_PlainBitmapData_More

		ld (RLE_ScrPos_Plus2-2),de
;ret
	pop de
	jp RLE_MoreBytesLoop

RLE_OneByteData:
	push de
		xor a 
		ld b,a
		ld c,a
RLE_OneByteDataExtras:
		inc hl
		ld a,(hl)
		push hl
			ld h,0
			ld l,a
			add hl,bc
			ld b,h
			ld c,l
		pop hl

		cp 255
		jp z,RLE_OneByteDataExtras

		inc hl
		ld a,(hl)
		ld (RLE_ThisOneByte_Plus1-1),a


		ld de,(RLE_ScrPos_Plus2-2)
RLE_OneByteData_More:
		ld a,00:RLE_ThisOneByte_Plus1
		ld (de),a
		dec de
		dec iyl
		call z,RLE_NextScreenLine




		dec bc
		ld a,b
		or c
		jp nz,RLE_OneByteData_More

		ld (RLE_ScrPos_Plus2-2),de
		;ret

	pop de
	jp RLE_MoreBytesLoop
RLE_ByteNibbles:
	di
	ld a,c
	exx
	ld b,iyl
	ld c,a
	ld d,ixh
	ld e,ixl
		ld hl,(RLE_ScrPos_Plus2-2)
RLE_ByteNibblesMore3:
		ld a,3
RLE_ByteNibblesMore:
		ld (hl),c
		dec hl 
		dec b;iyl
		call z,RLE_NextScreenLineHL

		dec de
		dec de
		cp e
		jp c,RLE_ByteNibblesMore

		ld a,d
		or a
		jp nz,RLE_ByteNibblesMore3

	ld (RLE_ScrPos_Plus2-2),hl
	ld iyl,b
	ld ixh,d
	ld ixl,e
	exx


;	ei		; If you re-enable this, you must not be using the amsoft firmware!
	ret

