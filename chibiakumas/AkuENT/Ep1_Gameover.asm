org &4000

nolist
FirstByte:
jp PicGameOverpng
jp PicScoreChibikopng

PicGameOverpng:
ld hl,PicGameOverpng_rledata-1
ld de,PicGameOverpng_rledataEnd-1
ld b,0
ld ixh,80
ld IXL,79
di
exx 
push bc
exx
jp RLE_Draw
PicGameOverpng_rledata:

defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ec
defb &A1
defb &71
defb &F9
defb &B1
defb &F8
defb &72
defb &FF,&c
defb &F,&60
defb &A1
defb &10,&BF
defb &F7
defb &71
defb &F9
defb &B2
defb &FF,&c
defb &F,&60
defb &A1
defb &10,&7F
defb &F8
defb &B1
defb &F7
defb &72
defb &FF,&d
defb &F,&60
defb &A1
defb &F2
defb &B1
defb &F6
defb &71
defb &F8
defb &B2
defb &FF,&d
defb &F,&60
defb &A1
defb &F2
defb &71
defb &FE
defb &72
defb &FF,&e
defb &F,&60
defb &A1
defb &F3
defb &B1
defb &FD
defb &B2
defb &FF,&e
defb &F,&60
defb &A1
defb &F3
defb &71
defb &F4
defb &71
defb &32
defb &B1
defb &F4
defb &72
defb &FF,&f
defb &F,&60
defb &A1
defb &F7
defb &31
defb &B1
defb &F2
defb &71
defb &31
defb &F3
defb &B2
defb &FF,&f
defb &F,&60
defb &A1
defb &F6
defb &31
defb &F6
defb &31
defb &F2
defb &71
defb &FF,&10
defb &F,&60
defb &21
defb &20,&7F,&7F
defb &10,&3F
defb &F8
defb &10,&4F
defb &00,&10,&7F
defb &F,&60
defb &A1
defb &20,&DF,&DF

defb &71
defb &F9
defb &00,&11,&DF
defb &F,&60
defb &21
defb &10,&7F

defb &F1
defb &72
defb &F6
defb &71
defb &31
defb &F2
defb &31
defb &00,&10,&7F
defb &F,&60
defb &A1
defb &20,&DF,&DF

defb &B1
defb &F2
defb &71
defb &31
defb &F2
defb &32
defb &B1
defb &10,&BF
defb &00,&10,&DF
defb &F,&15
defb &38
defb &2
defb &34
defb &3
defb &21
defb &33
defb &11
defb &2
defb &81
defb &33
defb &7
defb &34
defb &F,&15
defb &A1
defb &B5
defb &F2
defb &32
defb &B1
defb &30,&BF,&8F,&7F
defb &BF,&11
defb &F,&15
defb &11
defb &6
defb &21
defb &2
defb &11
defb &2
defb &21
defb &11
defb &2
defb &31
defb &3
defb &11
defb &2
defb &21
defb &2
defb &21
defb &11
defb &5
defb &10,&7
defb &2
defb &10,&E
defb &F,&14
defb &21
defb &74
defb &B1
defb &F2
defb &B1
defb &10,&8F
defb &20,&BF,&BF

defb &F1
defb &7F,&12
defb &F,&15
defb &41
defb &6
defb &21
defb &2
defb &11
defb &3
defb &11
defb &2
defb &11
defb &3
defb &11
defb &2
defb &21
defb &3
defb &11
defb &4
defb &21
defb &11
defb &4
defb &21
defb &11
defb &F,&13
defb &A1
defb &B3
defb &31
defb &F3
defb &B1
defb &20,&BF,&7F

defb &31
defb &F2
defb &71
defb &BF,&11
defb &F,&15
defb &41
defb &6
defb &21
defb &2
defb &11
defb &3
defb &11
defb &2
defb &11
defb &3
defb &11
defb &2
defb &31
defb &3
defb &31
defb &4
defb &31
defb &6
defb &31
defb &F,&13
defb &21
defb &74
defb &F3
defb &71
defb &31
defb &F7
defb &31
defb &7F,&10
defb &F,&15
defb &C2
defb &30,&96,&16,&8
defb &2
defb &11
defb &3
defb &20,&3,&6
defb &3
defb &11
defb &2
defb &11
defb &3
defb &21
defb &3
defb &10,&6
defb &2
defb &10,&C3
defb &2
defb &10,&6
defb &F,&12
defb &A1
defb &B3
defb &31
defb &F7
defb &71
defb &B1
defb &F3
defb &B1
defb &F5
defb &BF,&b
defb &F,&15
defb &41
defb &2
defb &81
defb &20,&4,&8
defb &2
defb &10,&1
defb &20,&2,&2

defb &21
defb &2
defb &11
defb &10,&4
defb &2
defb &11
defb &3
defb &21
defb &3
defb &21
defb &2
defb &21
defb &10,&81

defb &11
defb &2
defb &11
defb &F,&12
defb &21
defb &73
defb &B1
defb &F2
defb &71
defb &F3
defb &10,&9F

defb &71
defb &F3
defb &31
defb &75
defb &F1
defb &7F,&a
defb &F,&15
defb &C1
defb &2
defb &81
defb &20,&4,&8
defb &2
defb &10,&1
defb &20,&2,&2

defb &21
defb &2
defb &11
defb &10,&4
defb &2
defb &30,&1,&2,&6
defb &2
defb &81
defb &2
defb &21
defb &10,&80

defb &31
defb &2
defb &11
defb &F,&12
defb &A1
defb &F3
defb &B1
defb &F2
defb &71
defb &F5
defb &71
defb &F3
defb &20,&2F,&2F

defb &B1
defb &33
defb &00,&c,&2F
defb &F,&15
defb &41
defb &4
defb &11
defb &10,&8
defb &2
defb &30,&1,&2,&6

defb &31
defb &2
defb &11
defb &30,&4,&8,&1

defb &21
defb &2
defb &11
defb &2
defb &30,&2C,&C,&80

defb &21
defb &2
defb &31
defb &F,&12
defb &A1
defb &20,&8F,&8F
defb &F2
defb &B1
defb &F5
defb &71
defb &F3
defb &00,&10,&8F
defb &F,&1a
defb &11
defb &10,&8
defb &2
defb &20,&1,&6

defb &1
defb &12
defb &1
defb &30,&6,&4,&8
defb &2
defb &20,&7,&4
defb &2
defb &82
defb &40,&96,&80,&6,&8
defb &F,&12
defb &21
defb &20,&2F,&2F
defb &10,&3F

defb &71
defb &F3
defb &10,&CF

defb &B1
defb &F3
defb &00,&10,&2F
defb &F,&16
defb &34
defb &11
defb &10,&8
defb &2
defb &20,&1,&6

defb &1
defb &12
defb &1
defb &30,&6,&4,&8
defb &2
defb &20,&41,&C
defb &5
defb &81
defb &30,&C0,&4,&8
defb &F,&12
defb &A1
defb &10,&8F
defb &32
defb &F2
defb &71
defb &F3
defb &10,&1F
defb &F3
defb &71
defb &00,&10,&8F
defb &F,&16
defb &11
defb &5
defb &21
defb &2
defb &20,&1,&6

defb &1
defb &12
defb &1
defb &30,&6,&4,&C
defb &2
defb &20,&49,&8
defb &9
defb &11
defb &10,&8
defb &F,&12
defb &21
defb &34
defb &20,&EF,&9F
defb &F7
defb &71
defb &3F,&11
defb &F,&16
defb &11
defb &5
defb &21
defb &2
defb &50,&1,&E,&C,&1,&7
defb &20,&4,&4
defb &30,&8,&49,&8
defb &2
defb &21
defb &34
defb &11
defb &20,&4,&8
defb &F,&12
defb &21
defb &34
defb &B1
defb &F2
defb &31
defb &F7
defb &71
defb &3F,&11
defb &F,&16
defb &11
defb &5
defb &21
defb &2
defb &10,&1
defb &22
defb &10,&8
defb &2
defb &12
defb &20,&4,&4
defb &40,&8,&48,&8,&1

defb &21
defb &4
defb &11
defb &20,&4,&8
defb &F,&12
defb &21
defb &20,&2D,&2D

defb &B1
defb &F2
defb &71
defb &31
defb &F6
defb &31
defb &00,&10,&2D
defb &F,&16
defb &C2
defb &31
defb &20,&34,&8
defb &2
defb &10,&1
defb &22
defb &10,&8
defb &2
defb &50,&14,&4,&6,&8,&80
defb &20,&1,&1

defb &21
defb &4
defb &11
defb &20,&4,&8
defb &F,&12
defb &81
defb &20,&87,&87

defb &31
defb &F3
defb &71
defb &32
defb &F4
defb &91
defb &00,&10,&87
defb &F,&17
defb &30,&10,&14,&8
defb &2
defb &10,&1
defb &22
defb &4
defb &20,&14,&4

defb &21
defb &2
defb &21
defb &32
defb &20,&1,&3

defb &21
defb &4
defb &41
defb &20,&4,&8
defb &F,&12
defb &21
defb &10,&2D

defb &91
defb &32
defb &F9
defb &10,&1F
defb &00,&10,&2D
defb &F,&17
defb &30,&10,&14,&8
defb &2
defb &10,&1
defb &22
defb &11
defb &2
defb &81
defb &20,&14,&4

defb &21
defb &7
defb &10,&2

defb &21
defb &2
defb &32
defb &41
defb &20,&6,&8
defb &F,&12
defb &81
defb &20,&87,&87
defb &10,&8F
defb &F8
defb &10,&97
defb &00,&10,&87
defb &F,&1a
defb &11
defb &10,&8
defb &2
defb &20,&1,&2

defb &11
defb &2
defb &21
defb &20,&14,&4

defb &31
defb &7
defb &10,&2

defb &21
defb &2
defb &31
defb &10,&40

defb &21
defb &2
defb &31
defb &F,&12
defb &21
defb &66
defb &B1
defb &F6
defb &71
defb &31
defb &6F,&12
defb &F,&1a
defb &11
defb &10,&8
defb &2
defb &20,&10,&2

defb &41
defb &2
defb &21
defb &10,&14

defb &1
defb &12
defb &7
defb &10,&6

defb &21
defb &2
defb &21
defb &2
defb &31
defb &2
defb &11
defb &F,&12
defb &81
defb &96
defb &32
defb &F4
defb &31
defb &9F,&14
defb &F,&1a
defb &11
defb &10,&8
defb &2
defb &20,&10,&2

defb &C1
defb &2
defb &31
defb &10,&14

defb &1
defb &12
defb &1
defb &21
defb &C3
defb &61
defb &2
defb &11
defb &21
defb &2
defb &21
defb &10,&9

defb &11
defb &2
defb &11
defb &F,&12
defb &21
defb &68
defb &34
defb &64
defb &71
defb &6F,&10
defb &F,&15
defb &35
defb &11
defb &10,&8
defb &2
defb &20,&10,&2

defb &81
defb &2
defb &11
defb &10,&14

defb &1
defb &12
defb &1
defb &40,&82,&B0,&16,&4

defb &21
defb &3
defb &32
defb &2
defb &10,&24
defb &F,&12
defb &81
defb &93
defb &31
defb &9C
defb &B1
defb &9F,&10
defb &F,&15
defb &11
defb &6
defb &21
defb &2
defb &20,&10,&2

defb &C1
defb &2
defb &11
defb &70,&34,&C,&1,&2,&10,&14,&C

defb &21
defb &7
defb &10,&61
defb &F,&12
defb &21
defb &63
defb &B1
defb &31
defb &6C
defb &71
defb &6F,&f
defb &F,&15
defb &11
defb &6
defb &21
defb &2
defb &30,&10,&20,&12

defb &81
defb &42
defb &11
defb &10,&48
defb &2
defb &10,&3

defb &41
defb &2
defb &31
defb &20,&80,&2

defb &31
defb &4
defb &21
defb &10,&61
defb &F,&12
defb &81
defb &92
defb &10,&4F
defb &95
defb &31
defb &D1
defb &96
defb &B1
defb &9F,&f
defb &F,&15
defb &41
defb &6
defb &21
defb &2
defb &30,&10,&20,&16

defb &81
defb &2
defb &41
defb &10,&48
defb &2
defb &11
defb &4
defb &21
defb &1
defb &82
defb &1
defb &32
defb &3
defb &C1
defb &10,&40
defb &F,&12
defb &81
defb &20,&D2,&A7
defb &20,&D2,&D2
defb &20,&DA,&C3
defb &20,&D2,&D2
defb &62
defb &10,&D3
defb &00,&c,&D2
defb &20,&F6,&D2
defb &F,&15
defb &C2
defb &10,&1E
defb &C3
defb &61
defb &2
defb &C1
defb &62
defb &81
defb &10,&94

defb &C1
defb &2
defb &C2
defb &61
defb &C2
defb &41
defb &4
defb &81
defb &C2
defb &50,&2C,&9,&78,&61,&C0
defb &F,&12
defb &21
defb &20,&78,&5B
defb &00,&3,&78
defb &10,&79
defb &00,&3,&78
defb &10,&2F
defb &00,&b,&78

defb &C1
defb &62
defb &F1
defb &10,&78
defb &F,&15
defb &42
defb &3
defb &C2
defb &3
defb &10,&30
defb &20,&10,&10

defb &41
defb &2
defb &C1
defb &20,&10,&60
defb &6
defb &10,&60

defb &81
defb &2
defb &81
defb &42
defb &81
defb &2
defb &C1
defb &F,&12
defb &81
defb &20,&9E,&C3
defb &20,&D2,&D2
defb &20,&DA,&C3
defb &00,&3,&D2
defb &10,&5E
defb &00,&a,&D2
defb &F2
defb &30,&D3,&B6,&D2
defb &F,&15
defb &41
defb &5
defb &41
defb &3
defb &10,&10

defb &41
defb &3
defb &C1
defb &2
defb &C1
defb &2
defb &81
defb &8
defb &41
defb &10,&60
defb &3
defb &41
defb &3
defb &41
defb &F,&12
defb &21
defb &10,&5E
defb &00,&4,&78
defb &10,&79
defb &00,&3,&78
defb &20,&BC,&69
defb &00,&8,&78
defb &10,&F8
defb &F3
defb &61
defb &20,&7C,&7B
defb &F,&1a
defb &81
defb &C1
defb &9
defb &C1
defb &2
defb &41
defb &2
defb &10,&70
defb &D
defb &41
defb &F,&16
defb &81
defb &10,&A7
defb &C7
defb &E1
defb &91
defb &C8
defb &61
defb &71
defb &CF,&2
defb &E1
defb &F2
defb &D1
defb &10,&B7
defb &E2
defb &10,&E3
defb &F,&1b
defb &41
defb &C
defb &41
defb &2
defb &81
defb &F,&25
defb &81
defb &71
defb &C8
defb &61
defb &D1
defb &C9
defb &B1
defb &CF,&1
defb &E1
defb &71
defb &F4
defb &31
defb &20,&F1,&D3
defb &F,&28
defb &41
defb &F,&28
defb &81
defb &C9
defb &E1
defb &91
defb &CF,&b
defb &F1
defb &31
defb &F4
defb &61
defb &D1
defb &C3
defb &F,&28
defb &41
defb &F,&28
defb &81
defb &C9
defb &61
defb &D1
defb &CF,&a
defb &10,&FE

defb &B1
defb &F3
defb &10,&F9
defb &C4
defb &F,&27
defb &10,&E0
defb &F,&28
defb &81
defb &C9
defb &E1
defb &91
defb &CF,&a
defb &20,&7F,&7F
defb &10,&E7
defb &C6
defb &F,&27
defb &10,&E0
defb &F,&28
defb &81
defb &C4
defb &79
defb &CF,&8
defb &F1
defb &72
defb &31
defb &F1
defb &C7
defb &F,&28
defb &41
defb &F,&28
defb &81
defb &C2
defb &E1
defb &B3
defb &E3
defb &91
defb &10,&A7
defb &B7
defb &91
defb &CF,&1
defb &20,&7F,&CF

defb &D1
defb &C7
defb &F,&60
defb &81
defb &10,&78
defb &00,&4,&4F
defb &20,&4B,&C7

defb &71
defb &62
defb &7A
defb &C8
defb &F5
defb &C8
defb &F,&60
defb &81
defb &90,&1E,&1F,&97,&1F,&97,&3D,&9F,&8F,&AD

defb &91
defb &B2
defb &E2
defb &B5
defb &91
defb &C6
defb &F4
defb &61
defb &C8
defb &F,&60
defb &81
defb &35
defb &61
defb &33
defb &61
defb &20,&4B,&4B
defb &20,&2F,&2F
defb &40,&3E,&1F,&B5,&1F
defb &73
defb &C6
defb &E1
defb &20,&F3,&D2

defb &31
defb &C7
defb &F,&60
defb &81
defb &61
defb &34
defb &93
defb &31
defb &92
defb &34
defb &93
defb &33
defb &71
defb &20,&4F,&4F
defb &20,&8F,&4B
defb &C5
defb &E1
defb &C2
defb &94
defb &C6
defb &F,&60
defb &81
defb &C1
defb &3B
defb &10,&2D

defb &91
defb &33
defb &62
defb &31
defb &63
defb &32
defb &20,&2F,&D

defb &91
defb &C7
defb &31
defb &F3
defb &10,&97
defb &C4
defb &F,&60
defb &81
defb &C2
defb &41
defb &3
defb &10,&E0

defb &41
defb &3
defb &33
defb &62
defb &91
defb &10,&87
defb &38
defb &11
defb &22
defb &C5
defb &61
defb &F7
defb &31
defb &C3
defb &F,&60
defb &81
defb &10,&3C

defb &21
defb &2
defb &C1
defb &20,&F6,&70
defb &4
defb &34
defb &62
defb &10,&4B
defb &36
defb &20,&24,&87
defb &C3
defb &61
defb &F9
defb &91
defb &C2
defb &F,&18
defb &21
defb &37
defb &1
defb &21
defb &37
defb &11
defb &32
defb &11
defb &3
defb &21
defb &32
defb &11
defb &2
defb &34
defb &F,&17
defb &81
defb &61
defb &12
defb &1
defb &10,&F6
defb &2
defb &10,&F8

defb &41
defb &5
defb &21
defb &34
defb &92
defb &34
defb &11
defb &22
defb &10,&D
defb &C3
defb &B1
defb &10,&88
defb &20,&11,&11
defb &A2
defb &10,&5D
defb &C2
defb &F,&17
defb &10,&E
defb &6
defb &10,&2

defb &21
defb &7
defb &12
defb &10,&4
defb &3
defb &21
defb &2
defb &20,&1,&7
defb &2
defb &10,&E
defb &F,&16
defb &81
defb &20,&D,&C4

defb &41
defb &4
defb &81
defb &41
defb &9
defb &37
defb &1
defb &10,&24
defb &32
defb &10,&E1

defb &61
defb &F2
defb &A2
defb &51
defb &F2
defb &A2
defb &20,&DD,&E1
defb &F,&17
defb &31
defb &7
defb &10,&2

defb &81
defb &7
defb &12
defb &10,&C
defb &3
defb &31
defb &2
defb &10,&9

defb &11
defb &4
defb &21
defb &11
defb &F,&15
defb &81
defb &31
defb &12
defb &41
defb &6
defb &C1
defb &A
defb &21
defb &34
defb &10,&1

defb &91
defb &22
defb &31
defb &50,&E1,&EF,&99,&11,&33

defb &A1
defb &2
defb &F1
defb &10,&D3
defb &F,&17
defb &11
defb &7
defb &10,&2

defb &81
defb &7
defb &20,&85,&8
defb &3
defb &11
defb &2
defb &10,&D
defb &6
defb &31
defb &F,&15
defb &81
defb &10,&B

defb &81
defb &7
defb &81
defb &D
defb &10,&E
defb &3
defb &11
defb &32
defb &10,&E1
defb &F3
defb &A1
defb &52
defb &F2
defb &A2
defb &20,&DD,&D3
defb &F,&16
defb &21
defb &11
defb &2
defb &31
defb &C2
defb &20,&10,&2

defb &81
defb &C2
defb &31
defb &10,&78
defb &2
defb &20,&81,&8
defb &3
defb &11
defb &20,&8,&7
defb &2
defb &C2
defb &2
defb &21
defb &F,&15
defb &81
defb &10,&7

defb &91
defb &7
defb &81
defb &C2
defb &E1
defb &10,&F3
defb &C
defb &22
defb &20,&D,&69
defb &F2
defb &1
defb &A2
defb &52
defb &1
defb &A2
defb &51
defb &F2
defb &91
defb &F,&16
defb &21
defb &2
defb &40,&6,&40,&1,&2

defb &81
defb &3
defb &10,&28
defb &2
defb &20,&81,&8

defb &11
defb &2
defb &11
defb &1
defb &22
defb &2
defb &81
defb &30,&D0,&10,&6
defb &F,&14
defb &81
defb &20,&D,&14
defb &4
defb &10,&EC
defb &C2
defb &4
defb &10,&70
defb &B
defb &11
defb &32
defb &10,&E9
defb &FC
defb &10,&D7
defb &F,&16
defb &21
defb &2
defb &40,&3,&60,&1,&2

defb &81
defb &3
defb &10,&28
defb &2
defb &10,&81
defb &20,&1,&1
defb &10,&6

defb &1
defb &22
defb &2
defb &31
defb &10,&40

defb &31
defb &2
defb &11
defb &F,&14
defb &81
defb &10,&7

defb &41
defb &4
defb &81
defb &C1
defb &2
defb &81
defb &C2
defb &3
defb &81
defb &A
defb &11
defb &22
defb &31
defb &10,&AD
defb &F2
defb &2
defb &30,&11,&22,&EE

defb &51
defb &F2
defb &31
defb &F,&16
defb &21
defb &2
defb &11
defb &3
defb &20,&1,&2

defb &81
defb &4
defb &21
defb &2
defb &10,&81
defb &20,&1,&1

defb &21
defb &2
defb &32
defb &2
defb &41
defb &10,&40

defb &21
defb &2
defb &31
defb &F,&14
defb &81
defb &32
defb &61
defb &3
defb &10,&E0
defb &5
defb &A1
defb &C1
defb &3
defb &C1
defb &A
defb &11
defb &32
defb &10,&AD
defb &F3
defb &51
defb &F2
defb &10,&66
defb &F2
defb &10,&DD
defb &72
defb &F,&16
defb &21
defb &2
defb &31
defb &3
defb &30,&1,&2,&70
defb &3
defb &21
defb &2
defb &30,&81,&1,&3

defb &21
defb &2
defb &12
defb &1
defb &40,&60,&E0,&6,&8
defb &F,&14
defb &81
defb &10,&83

defb &11
defb &3
defb &20,&10,&E4

defb &41
defb &3
defb &81
defb &3
defb &20,&60,&44
defb &6
defb &22
defb &20,&D,&AD
defb &F2
defb &2
defb &20,&33,&66
defb &F2
defb &51
defb &F2
defb &31
defb &F,&16
defb &21
defb &2
defb &10,&6
defb &2
defb &30,&1,&2,&28
defb &34
defb &2
defb &30,&1,&3,&2

defb &31
defb &2
defb &41
defb &50,&1,&42,&40,&4,&8
defb &F,&14
defb &81
defb &30,&87,&4,&88
defb &9
defb &51
defb &3
defb &81
defb &10,&88

defb &51
defb &6
defb &11
defb &32
defb &91
defb &F3
defb &A1
defb &F3
defb &10,&66
defb &F2
defb &10,&DD
defb &72
defb &F,&16
defb &81
defb &11
defb &2
defb &33
defb &10,&1

defb &21
defb &2
defb &21
defb &6
defb &30,&1,&20,&2

defb &11
defb &2
defb &41
defb &20,&1,&42
defb &3
defb &11
defb &10,&8
defb &F,&14
defb &81
defb &10,&85

defb &11
defb &2
defb &41
defb &6
defb &20,&E4,&80

defb &41
defb &3
defb &10,&10

defb &F1
defb &5
defb &11
defb &22
defb &31
defb &91
defb &F3
defb &2
defb &20,&11,&22

defb &A1
defb &2
defb &F2
defb &31
defb &F,&17
defb &41
defb &7
defb &21
defb &2
defb &81
defb &6
defb &20,&1,&20

defb &21
defb &12
defb &1
defb &20,&42,&1

defb &21
defb &4
defb &11
defb &10,&8
defb &F,&14
defb &81
defb &30,&87,&8A,&40
defb &2
defb &C2
defb &3
defb &81
defb &10,&10

defb &C1
defb &3
defb &20,&10,&77
defb &5
defb &11
defb &32
defb &91
defb &FD
defb &72
defb &F,&17
defb &C1
defb &7
defb &21
defb &2
defb &81
defb &6
defb &20,&1,&24

defb &1
defb &12
defb &1
defb &20,&2,&1

defb &21
defb &4
defb &11
defb &10,&8
defb &F,&14
defb &81
defb &20,&83,&1

defb &81
defb &4
defb &81
defb &10,&F2
defb &4
defb &81
defb &42
defb &1
defb &20,&20,&EE
defb &4
defb &22
defb &10,&D

defb &91
defb &F2
defb &2
defb &A1
defb &10,&DD

defb &51
defb &F2
defb &51
defb &F3
defb &31
defb &F,&16
defb &82
defb &31
defb &6
defb &21
defb &2
defb &81
defb &C2
defb &10,&1E
defb &2
defb &60,&1,&24,&C,&1,&2,&1

defb &21
defb &4
defb &11
defb &10,&8
defb &F,&14
defb &81
defb &20,&87,&4

defb &81
defb &D
defb &10,&31

defb &81
defb &2
defb &52
defb &4
defb &11
defb &32
defb &91
defb &F2
defb &A1
defb &F2
defb &3
defb &A1
defb &F2
defb &10,&EE
defb &72
defb &F,&16
defb &81
defb &10,&4
defb &2
defb &20,&E1,&1

defb &21
defb &4
defb &C1
defb &10,&8
defb &2
defb &30,&1,&24,&C
defb &2
defb &20,&2,&1

defb &21
defb &4
defb &11
defb &10,&8
defb &F,&14
defb &81
defb &20,&85,&1
defb &82
defb &C1
defb &B
defb &20,&60,&60
defb &10,&CC

defb &A1
defb &3
defb &11
defb &22
defb &31
defb &91
defb &F2
defb &51
defb &F2
defb &20,&17,&CF

defb &51
defb &3
defb &10,&3F
defb &F,&18
defb &11
defb &30,&8,&41,&1

defb &21
defb &4
defb &81
defb &10,&8
defb &2
defb &30,&1,&2C,&8
defb &2
defb &30,&3,&1,&6
defb &2
defb &20,&6,&8
defb &F,&14
defb &81
defb &30,&87,&2,&90
defb &2
defb &20,&77,&80
defb &42
defb &10,&EE

defb &51
defb &2
defb &51
defb &20,&40,&88
defb &52
defb &3
defb &11
defb &32
defb &91
defb &F3
defb &10,&EE
defb &3
defb &A1
defb &54
defb &72
defb &F,&17
defb &40,&6,&8,&40,&1

defb &21
defb &4
defb &81
defb &10,&8
defb &2
defb &30,&1,&28,&8
defb &2
defb &10,&1

defb &91
defb &2
defb &11
defb &2
defb &21
defb &2
defb &31
defb &F,&14
defb &81
defb &20,&8B,&1

defb &41
defb &2
defb &F1
defb &5
defb &81
defb &10,&30

defb &A1
defb &2
defb &C1
defb &30,&40,&22,&BB
defb &2
defb &22
defb &10,&D

defb &91
defb &F2
defb &2
defb &A1
defb &10,&77
defb &F2
defb &54
defb &10,&3F
defb &F,&17
defb &21
defb &2
defb &31
defb &2
defb &10,&1

defb &21
defb &6
defb &21
defb &2
defb &10,&1
defb &82
defb &4
defb &10,&1

defb &81
defb &2
defb &31
defb &2
defb &31
defb &2
defb &11
defb &F,&14
defb &81
defb &30,&8F,&4,&10

defb &A1
defb &C6
defb &4
defb &51
defb &20,&80,&C0
defb &2
defb &A1
defb &52
defb &2
defb &11
defb &32
defb &91
defb &F3
defb &10,&EE

defb &51
defb &2
defb &F1
defb &54
defb &72
defb &F,&17
defb &31
defb &2
defb &11
defb &2
defb &10,&1

defb &21
defb &6
defb &21
defb &2
defb &20,&10,&B0

defb &41
defb &2
defb &21
defb &10,&1

defb &81
defb &2
defb &21
defb &10,&9

defb &11
defb &2
defb &11
defb &F,&14
defb &81
defb &30,&8D,&1,&10

defb &D1
defb &35
defb &10,&E1
defb &33
defb &A1
defb &3
defb &81
defb &20,&99,&88
defb &2
defb &11
defb &23
defb &10,&AC
defb &F2
defb &A1
defb &F2
defb &51
defb &F2
defb &54
defb &10,&3F
defb &F,&17
defb &11
defb &2
defb &11
defb &2
defb &20,&1,&2

defb &21
defb &35
defb &2
defb &20,&10,&20

defb &41
defb &2
defb &21
defb &2
defb &10,&60
defb &2
defb &32
defb &2
defb &10,&60
defb &F,&14
defb &81
defb &30,&8F,&2,&D8

defb &21
defb &C3
defb &34
defb &C2
defb &10,&16

defb &51
defb &2
defb &81
defb &F1
defb &2
defb &53
defb &1
defb &13
defb &10,&6D
defb &F2
defb &A1
defb &F2
defb &A2
defb &F1
defb &4
defb &10,&4E
defb &F,&16
defb &21
defb &20,&1,&6
defb &2
defb &20,&1,&2

defb &21
defb &7
defb &41
defb &3
defb &11
defb &2
defb &81
defb &2
defb &10,&68
defb &6
defb &C1
defb &F,&15
defb &81
defb &30,&83,&1,&10
defb &C4
defb &61
defb &72
defb &D1
defb &C3
defb &61
defb &30,&48,&90,&66
defb &A4
defb &24
defb &81
defb &B2
defb &F1
defb &30,&99,&CC,&99
defb &F5
defb &31
defb &F,&16
defb &21
defb &2
defb &21
defb &3
defb &20,&1,&20

defb &21
defb &7
defb &41
defb &3
defb &91
defb &2
defb &81
defb &2
defb &10,&28

defb &11
defb &4
defb &81
defb &C1
defb &F,&15
defb &81
defb &20,&87,&4

defb &41
defb &C2
defb &81
defb &10,&70

defb &E1
defb &B2
defb &41
defb &C2
defb &60,&68,&58,&A1,&CC,&80,&70
defb &C3
defb &81
defb &10,&B0
defb &FC
defb &72
defb &F,&16
defb &81
defb &2
defb &31
defb &3
defb &20,&10,&20

defb &81
defb &7
defb &41
defb &3
defb &81
defb &2
defb &C1
defb &2
defb &20,&20,&61
defb &2
defb &10,&E

defb &81
defb &F,&15
defb &81
defb &b0,&85,&1,&28,&C1,&E0,&EC,&B1,&D0,&5C,&D8,&A1
defb &A2
defb &20,&C0,&D0
defb &83
defb &C1
defb &10,&60

defb &B1
defb &FC
defb &31
defb &F,&16
defb &81
defb &C2
defb &11
defb &3
defb &20,&78,&30

defb &81
defb &C2
defb &61
defb &91
defb &C2
defb &31
defb &41
defb &3
defb &20,&68,&61
defb &2
defb &10,&60

defb &1
defb &C3
defb &10,&12

defb &81
defb &F,&15
defb &81
defb &30,&87,&2,&28
defb &20,&C0,&C0
defb &90,&CC,&91,&90,&18,&5C,&31,&18,&80,&D0
defb &83
defb &C1
defb &10,&E0
defb &FC
defb &72
defb &F,&17
defb &C1
defb &5
defb &10,&10

defb &81
defb &2
defb &41
defb &3
defb &C1
defb &10,&10

defb &41
defb &3
defb &81
defb &2
defb &41
defb &2
defb &81
defb &3
defb &10,&90
defb &2
defb &C1
defb &F,&15
defb &81
defb &30,&87,&89,&28
defb &20,&C0,&C0
defb &90,&CC,&91,&90,&18,&6C,&31,&10,&C1,&D0
defb &85
defb &41
defb &B1
defb &FC
defb &31
defb &F,&17
defb &81
defb &7
defb &81
defb &2
defb &41
defb &3
defb &81
defb &2
defb &41
defb &3
defb &C1
defb &2
defb &41
defb &6
defb &41
defb &3
defb &81
defb &F,&15
defb &81
defb &30,&B,&4,&28

defb &11
defb &82
defb &C1
defb &90,&CC,&91,&D0,&18,&6C,&31,&14,&82,&40
defb &82
defb &42
defb &10,&B0
defb &F3
defb &C1
defb &20,&F2,&F2

defb &E1
defb &C2
defb &F1
defb &72
defb &F,&17
defb &81
defb &7
defb &20,&70,&E0
defb &3
defb &81
defb &2
defb &41
defb &3
defb &20,&60,&E0
defb &F,&20
defb &81
defb &31
defb &12
defb &2
defb &21
defb &20,&11,&70

defb &A1
defb &F2
defb &1
defb &C2
defb &20,&4C,&FE

defb &D1
defb &42
defb &11
defb &1
defb &C8
defb &E1
defb &B1
defb &F3
defb &E5
defb &F1
defb &D1
defb &F2
defb &31
defb &F,&17
defb &10,&70
defb &6
defb &81
defb &2
defb &41
defb &3
defb &81
defb &10,&80

defb &41
defb &6
defb &41
defb &F,&20
defb &81
defb &50,&D,&2,&19,&77,&88
defb &F4
defb &2
defb &60,&E6,&EE,&20,&14,&20,&90

defb &41
defb &84
defb &21
defb &F3
defb &D1
defb &E5
defb &C1
defb &10,&FD
defb &72
defb &F,&17
defb &81
defb &E
defb &81
defb &10,&80

defb &41
defb &F,&27
defb &81
defb &31
defb &12
defb &1
defb &10,&3B

defb &B1
defb &FA
defb &D1
defb &40,&7F,&30,&14,&60

defb &C1
defb &85
defb &10,&D8

defb &B1
defb &F3
defb &E6
defb &D1
defb &F2
defb &31
defb &F,&26
defb &81
defb &F,&2a
defb &81
defb &30,&B,&4,&22

defb &31
defb &F4
defb &A1
defb &F5
defb &B1
defb &10,&13
defb &82
defb &30,&4,&20,&90

defb &41
defb &83
defb &10,&58
defb &F3
defb &C1
defb &E3
defb &C1
defb &E1
defb &C2
defb &F1
defb &72
defb &F,&26
defb &81
defb &F,&2a
defb &81
defb &31
defb &12
defb &1
defb &10,&66
defb &B2
defb &F3
defb &A1
defb &F4
defb &72
defb &20,&9,&83
defb &2
defb &81
defb &42
defb &C1
defb &84
defb &10,&D8
defb &FD
defb &31
defb &F,&26
defb &C1
defb &41
defb &F,&29
defb &81
defb &10,&D

defb &21
defb &2
defb &51
defb &10,&5E
defb &F3
defb &51
defb &F4
defb &B2
defb &10,&1

defb &21
defb &3
defb &10,&20

defb &41
defb &83
defb &30,&D0,&28,&F3
defb &20,&F2,&F2
defb &10,&F6

defb &C1
defb &D3
defb &10,&7C
defb &F,&26
defb &C1
defb &41
defb &F,&29
defb &81
defb &31
defb &12
defb &3
defb &81
defb &B2
defb &F6
defb &72
defb &31
defb &20,&6,&6
defb &10,&20

defb &81
defb &C8
defb &E1
defb &10,&F7

defb &F1
defb &E4
defb &F1
defb &E1
defb &D4
defb &31
defb &F,&26
defb &81
defb &F,&2a
defb &81
defb &20,&B,&4
defb &3
defb &61
defb &71
defb &F5
defb &B2
defb &a0,&7,&8,&C1,&20,&D0,&90,&D0,&C0,&5C,&F7

defb &F1
defb &E4
defb &F1
defb &E1
defb &D2
defb &F1
defb &10,&7C
defb &F,&60
defb &81
defb &31
defb &12
defb &3
defb &30,&82,&8F,&77

defb &1
defb &72
defb &32
defb &2
defb &31
defb &30,&60,&20,&E0
defb &84
defb &41
defb &C2
defb &B1
defb &10,&F7

defb &F1
defb &E4
defb &F1
defb &E1
defb &D4
defb &31
defb &F,&60
defb &81
defb &10,&D

defb &21
defb &3
defb &20,&1,&3C
defb &73
defb &A1
defb &32
defb &5
defb &21
defb &10,&20
defb &C2
defb &41
defb &83
defb &10,&C0

defb &41
defb &F2
defb &D1
defb &10,&F3
defb &E3
defb &F1
defb &30,&F6,&F4,&7C
defb &F,&60
defb &81
defb &31
defb &12
defb &4
defb &21
defb &10,&61
defb &35
defb &2
defb &11
defb &10,&67
defb &4
defb &10,&E0
defb &82
defb &20,&D0,&D0
defb &10,&AC
defb &FD
defb &31
defb &F,&60
defb &81
defb &20,&B,&4
defb &2
defb &30,&E0,&B7,&18
defb &32
defb &3
defb &11
defb &30,&F1,&12,&1
defb &C9
defb &F2
defb &C1
defb &00,&4,&F1

defb &D1
defb &C2
defb &71
defb &F,&60
defb &81
defb &31
defb &12
defb &3
defb &F2
defb &20,&74,&81

defb &41
defb &2
defb &41
defb &2
defb &D1
defb &F2
defb &12
defb &81
defb &10,&30
defb &20,&B0,&B0

defb &41
defb &82
defb &B1
defb &D2
defb &00,&3,&F7
defb &10,&FB
defb &D3
defb &31
defb &F,&60
defb &81
defb &10,&D

defb &21
defb &2
defb &A1
defb &F3
defb &41
defb &11
defb &2
defb &81
defb &20,&C,&4

defb &E1
defb &F2
defb &51
defb &2
defb &46
defb &20,&B0,&FC
defb &D2
defb &10,&F3
defb &20,&F1,&F1
defb &10,&FB
defb &D3
defb &71
defb &F,&60
defb &81
defb &31
defb &12
defb &2
defb &F1
defb &B3
defb &51
defb &20,&9,&4B

defb &31
defb &3
defb &73
defb &F1
defb &10,&80
defb &47
defb &82
defb &F1
defb &92
defb &B1
defb &92
defb &B1
defb &91
defb &B2
defb &E1
defb &20,&AD,&2D
defb &F,&60
defb &81
defb &30,&1A,&4,&CC
defb &B3
defb &51
defb &3
defb &41
defb &4
defb &73
defb &F1
defb &2
defb &10,&30
defb &00,&3,&B0
defb &20,&FC,&D3
defb &00,&4,&F1
defb &20,&7D,&7D
defb &F,&60
defb &81
defb &C1
defb &12
defb &1
defb &2F,&4
defb &82
defb &C3
defb &20,&E0,&E0
defb &10,&6C
defb &3E
defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&a5
PicGameOverpng_rledataEnd: defb 0
PicScoreChibikopng:
ld hl,PicScoreChibikopng_rledata-1
ld de,PicScoreChibikopng_rledataEnd-1
ld b,0
ld ixh,80
ld IXL,79
di
exx 
push bc
exx
jp RLE_Draw
PicScoreChibikopng_rledata:

defb &F,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff
defb &ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff
defb &ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&ff,&c8
defb &8F,&d
defb &F,&74
defb &EF,&d
defb &C2
defb &F,&72
defb &81
defb &D2
defb &CF,&d
defb &41
defb &F,&71
defb &10,&EA
defb &CF,&e
defb &41
defb &F,&71
defb &20,&E4,&70
defb &6
defb &81
defb &C2
defb &F2
defb &51
defb &20,&FC,&70
defb &5
defb &81
defb &10,&10

defb &81
defb &C2
defb &81
defb &F,&71
defb &E1
defb &C2
defb &6
defb &81
defb &10,&F7

defb &41
defb &5
defb &10,&EC

defb &C1
defb &5
defb &C1
defb &2
defb &C2
defb &41
defb &F,&71
defb &10,&E0

defb &41
defb &6
defb &41
defb &B
defb &C1
defb &81
defb &3
defb &42
defb &20,&80,&B0
defb &F,&71
defb &10,&F2
defb &4
defb &10,&60

defb &C1
defb &D
defb &C1
defb &3
defb &10,&60
defb &2
defb &10,&70
defb &F,&71
defb &10,&E0
defb &5
defb &C1
defb &4
defb &10,&60
defb &9
defb &41
defb &2
defb &10,&60
defb &2
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &4
defb &C1
defb &4
defb &E1
defb &41
defb &3
defb &10,&F4
defb &5
defb &82
defb &1
defb &C1
defb &3
defb &10,&70
defb &F,&71
defb &10,&E0
defb &3
defb &C1
defb &B
defb &81
defb &10,&72
defb &4
defb &10,&B0

defb &C1
defb &3
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &3
defb &51
defb &F,&4
defb &C1
defb &81
defb &3
defb &10,&70
defb &F,&71
defb &10,&E0
defb &2
defb &E1
defb &9
defb &20,&32,&72
defb &8
defb &81
defb &3
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &2
defb &81
defb &5
defb &D1
defb &4
defb &E1
defb &10,&80

defb &41
defb &7
defb &A1
defb &3
defb &10,&70
defb &F,&71
defb &10,&E0
defb &2
defb &51
defb &3
defb &10,&E2
defb &8
defb &A1
defb &8
defb &51
defb &20,&10,&B0
defb &F,&71
defb &20,&F2,&88
defb &4
defb &41
defb &A
defb &41
defb &7
defb &E1
defb &20,&10,&70
defb &F,&71
defb &20,&E0,&C8
defb &3
defb &81
defb &F,&5
defb &20,&10,&B0
defb &F,&71
defb &20,&F2,&44
defb &2
defb &20,&62,&80

defb &C1
defb &4
defb &41
defb &2
defb &10,&E0
defb &8
defb &20,&10,&70
defb &F,&71
defb &20,&E0,&40
defb &2
defb &30,&30,&E0,&10

defb &C1
defb &F2
defb &4
defb &C2
defb &41
defb &6
defb &20,&20,&B0
defb &F,&71
defb &20,&F2,&40
defb &3
defb &81
defb &10,&70
defb &A
defb &C3
defb &5
defb &20,&22,&70
defb &F,&71
defb &10,&E0

defb &81
defb &4
defb &C1
defb &41
defb &C
defb &81
defb &10,&70

defb &81
defb &3
defb &20,&22,&B0
defb &F,&71
defb &10,&F2

defb &A1
defb &3
defb &10,&70
defb &E
defb &20,&E0,&40
defb &2
defb &20,&22,&70
defb &F,&71
defb &30,&E0,&60,&80

defb &C1
defb &2
defb &C1
defb &41
defb &5
defb &41
defb &6
defb &C1
defb &10,&98
defb &3
defb &41
defb &10,&B0
defb &F,&71
defb &10,&F2

defb &81
defb &2
defb &C1
defb &30,&80,&3C,&E1

defb &41
defb &2
defb &C1
defb &91
defb &2
defb &C2
defb &41
defb &20,&80,&30

defb &41
defb &2
defb &41
defb &10,&70
defb &F,&71
defb &20,&E0,&40
defb &2
defb &30,&68,&CF,&1F

defb &91
defb &C2
defb &61
defb &71
defb &C2
defb &32
defb &C1
defb &20,&10,&70
defb &3
defb &41
defb &10,&B0
defb &F,&71
defb &40,&F2,&40,&80,&BC
defb &F2
defb &71
defb &37
defb &20,&EF,&DF

defb &C1
defb &2
defb &81
defb &3
defb &41
defb &10,&70
defb &F,&71
defb &30,&E0,&44,&80
defb &33
defb &91
defb &C3
defb &F1
defb &10,&CF
defb &C3
defb &61
defb &33
defb &41
defb &5
defb &51
defb &10,&B0
defb &F,&71
defb &20,&F2,&40
defb &2
defb &C7
defb &E1
defb &10,&F7
defb &C6
defb &10,&1E
defb &5
defb &51
defb &10,&70
defb &F,&71
defb &20,&E0,&88

defb &41
defb &C6
defb &11
defb &30,&88,&77,&8
defb &C6
defb &41
defb &4
defb &51
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &2
defb &81
defb &C2
defb &1
defb &20,&4A,&4A
defb &2
defb &F1
defb &2
defb &91
defb &20,&85,&81
defb &C3
defb &4
defb &51
defb &10,&70
defb &F,&71
defb &10,&E0
defb &3
defb &31
defb &2
defb &60,&25,&84,&1,&33,&4A,&8

defb &61
defb &2
defb &C1
defb &2
defb &81
defb &2
defb &41
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &3
defb &31
defb &70,&1,&52,&59,&10,&33,&A4,&80

defb &91
defb &2
defb &A1
defb &10,&90

defb &41
defb &2
defb &41
defb &10,&70
defb &F,&71
defb &10,&E0
defb &3
defb &21
defb &60,&11,&65,&C4,&11,&33,&EA
defb &A2
defb &61
defb &2
defb &B1
defb &10,&40

defb &11
defb &2
defb &41
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &3
defb &21
defb &70,&11,&72,&C8,&10,&33,&E4,&80

defb &D1
defb &2
defb &F1
defb &10,&90

defb &71
defb &2
defb &81
defb &10,&70
defb &F,&71
defb &10,&E0
defb &3
defb &21
defb &10,&13
defb &D2
defb &80,&E4,&1,&33,&CA,&88,&32,&CE,&40

defb &B1
defb &2
defb &81
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &3
defb &21
defb &10,&37

defb &21
defb &63
defb &30,&18,&33,&A4

defb &11
defb &92
defb &1
defb &50,&EE,&90,&27,&80,&70
defb &F,&71
defb &10,&E0
defb &3
defb &21
defb &10,&6F

defb &1
defb &93
defb &20,&8,&37

defb &1
defb &64
defb &1
defb &50,&EF,&C8,&67,&80,&B0
defb &F,&71
defb &10,&F2
defb &4
defb &50,&CF,&1B,&52,&8C,&7F

defb &1
defb &93
defb &10,&9
defb &F2
defb &40,&98,&67,&80,&70
defb &F,&71
defb &10,&E0
defb &4
defb &B2
defb &20,&37,&8

defb &B1
defb &F3
defb &10,&9
defb &62
defb &21
defb &F3
defb &10,&ED

defb &71
defb &2
defb &81
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &4
defb &21
defb &F7
defb &A1
defb &F8
defb &71
defb &10,&FD

defb &31
defb &2
defb &81
defb &10,&70
defb &F,&71
defb &10,&E0
defb &4
defb &10,&8E
defb &F5
defb &51
defb &F9
defb &B1
defb &10,&2D

defb &11
defb &2
defb &81
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &5
defb &31
defb &F5
defb &51
defb &F8
defb &72
defb &10,&2D
defb &2
defb &82
defb &10,&70
defb &F,&71
defb &10,&E0
defb &5
defb &B2
defb &F5
defb &A1
defb &F7
defb &B2
defb &40,&21,&10,&20,&B0
defb &F,&71
defb &10,&F2
defb &5
defb &21
defb &71
defb &FB
defb &D1
defb &73
defb &10,&1

defb &51
defb &3
defb &10,&70
defb &F,&71
defb &10,&E0
defb &6
defb &B2
defb &FA
defb &C1
defb &B2
defb &31
defb &10,&21

defb &41
defb &3
defb &10,&B0
defb &F,&71
defb &10,&F2

defb &31
defb &5
defb &10,&E
defb &F3
defb &51
defb &30,&88,&77,&C4

defb &C1
defb &72
defb &31
defb &10,&30

defb &C1
defb &3
defb &10,&70
defb &F,&71
defb &10,&E0

defb &71
defb &5
defb &10,&18

defb &B1
defb &F3
defb &4
defb &10,&E0

defb &E1
defb &32
defb &11
defb &2
defb &A1
defb &3
defb &10,&B0
defb &F,&71
defb &20,&F2,&37
defb &4
defb &20,&20,&4F
defb &F2
defb &51
defb &3
defb &10,&78

defb &71
defb &32
defb &3
defb &81
defb &2
defb &31
defb &10,&70
defb &F,&71
defb &20,&E0,&7F
defb &4
defb &20,&20,&1C
defb &B2
defb &10,&77
defb &2
defb &10,&BC
defb &32
defb &81
defb &5
defb &20,&8E,&B0
defb &F,&71
defb &20,&F2,&7F
defb &B2
defb &2
defb &20,&10,&10
defb &10,&4F
defb &F4
defb &71
defb &32
defb &1
defb &81
defb &3
defb &30,&1,&CF,&70
defb &F,&71
defb &10,&E0
defb &F2
defb &31
defb &72
defb &1
defb &30,&20,&6,&C
defb &B4
defb &32
defb &5
defb &A1
defb &30,&2F,&EF,&B0
defb &F,&71
defb &10,&F2
defb &F2
defb &50,&1F,&BF,&C,&9,&1

defb &31
defb &72
defb &32
defb &41
defb &81
defb &3
defb &31
defb &73
defb &F2
defb &10,&70
defb &F,&71
defb &10,&E0

defb &A1
defb &F3
defb &32
defb &20,&17,&2

defb &21
defb &2
defb &91
defb &A3
defb &81
defb &20,&21,&CE

defb &71
defb &32
defb &B1
defb &F2
defb &10,&B0
defb &F,&71
defb &10,&F2

defb &1
defb &F6
defb &4
defb &32
defb &61
defb &1
defb &52
defb &31
defb &10,&16

defb &B1
defb &F6
defb &51
defb &10,&70
defb &F,&71
defb &10,&E0
defb &2
defb &10,&6E
defb &F2
defb &20,&53,&4
defb &3
defb &91
defb &12
defb &20,&83,&3

defb &21
defb &F6
defb &1
defb &10,&B0
defb &F,&71
defb &10,&F2
defb &3
defb &81
defb &C3
defb &41
defb &10,&4
defb &2
defb &50,&42,&2,&E,&10,&68

defb &B1
defb &F3
defb &2
defb &10,&70
defb &F,&71
defb &10,&E0
defb &4
defb &C3
defb &41
defb &10,&C
defb &2
defb &10,&24
defb &3
defb &81
defb &12
defb &81
defb &C4
defb &1
defb &20,&10,&B0
defb &F,&71
defb &10,&F2

defb &41
defb &4
defb &F3
defb &10,&19
defb &2
defb &10,&42
defb &20,&8,&8
defb &20,&12,&E6
defb &C2
defb &11
defb &2
defb &81
defb &10,&70
defb &F,&71
defb &81
defb &C2
defb &4
defb &F3
defb &51
defb &3
defb &10,&24
defb &3
defb &81
defb &10,&1

defb &B1
defb &F2
defb &11
defb &21
defb &2
defb &C2
defb &81
defb &F,&71
defb &C3
defb &41
defb &3
defb &A1
defb &F2
defb &51
defb &3
defb &40,&42,&8,&48,&8
defb &F3
defb &11
defb &20,&2,&E0
defb &42
defb &F,&71
defb &81
defb &CF,&e
defb &81
defb &F,&72
defb &81
defb &CF,&d
defb &43
defb &F,&72
defb &C2
defb &8F,&d
defb &F,&74
defb &4F,&d
defb &2
PicScoreChibikopng_rledataEnd: defb 0


RLE_ImageWidth equ 38
RLE_Draw:
  		ld a,ixh
		ld (ImageWidthA_Plus1-1),a
		ld (ImageWidthC_Plus1-1),a
		ld (ImageWidthE_Plus1-1),a
		push de
		push hl
			ld hl,&0050
			ld d,h
			ld e,a
			add hl,de
			ld (ImageWidthB_Plus2-2),hl
			ld (ImageWidthD_Plus2-2),hl		
		pop hl
		pop de	



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
	jp z,RLE_OneByteData
	and %00001111
	jp z,RLE_PlainBitmapData
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
RLE_MoreNibbleBytes:
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
		ld de,&0050+RLE_ImageWidth :ImageWidthD_Plus2
		add hl,de
	pop de
;	ret nc
;	push de
;		ld de,&c050
;		add hl,de
;	pop de
	ret

RLE_NextScreenLine:
	push hl
		ld iyl,RLE_ImageWidth :ImageWidthC_Plus1
		ld hl,&0050+RLE_ImageWidth :ImageWidthB_Plus2
		add hl,de
		ex hl,de
	pop hl
;	ret nc
;	push hl
;		ld hl,&c050
;		add hl,de
;		ex hl,de
;	pop hl
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

ret




LastByte:defb 0





save "..\..\BldENT\T34-SC2.D01",FirstByte,LastByte-FirstByte

