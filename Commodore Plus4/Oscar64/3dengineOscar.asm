; Compiled with 1.32.271.0
--------------------------------------------------------------------
startup: ; startup
1001 : 0b __ __ INV
1002 : 08 __ __ PHP
1003 : 0a __ __ ASL
1004 : 00 __ __ BRK
1005 : 9e __ __ INV
1006 : 34 __ __ INV
1007 : 31 30 __ AND ($30),y 
1009 : 39 00 00 AND $0000,y 
100c : 00 __ __ BRK
100d : a9 80 __ LDA #$80
100f : 8d fe ff STA $fffe 
1012 : a9 10 __ LDA #$10
1014 : 8d ff ff STA $ffff 
1017 : 8d 3f ff STA $ff3f 
101a : ba __ __ TSX
101b : 8e 0f 6e STX $6e0f ; (spentry + 0)
101e : a2 6e __ LDX #$6e
1020 : a0 8c __ LDY #$8c
1022 : a9 00 __ LDA #$00
1024 : 85 19 __ STA IP + 0 
1026 : 86 1a __ STX IP + 1 
1028 : e0 83 __ CPX #$83
102a : f0 0b __ BEQ $1037 ; (startup + 54)
102c : 91 19 __ STA (IP + 0),y 
102e : c8 __ __ INY
102f : d0 fb __ BNE $102c ; (startup + 43)
1031 : e8 __ __ INX
1032 : d0 f2 __ BNE $1026 ; (startup + 37)
1034 : 91 19 __ STA (IP + 0),y 
1036 : c8 __ __ INY
1037 : c0 e0 __ CPY #$e0
1039 : d0 f9 __ BNE $1034 ; (startup + 51)
103b : a9 00 __ LDA #$00
103d : a2 f7 __ LDX #$f7
103f : d0 03 __ BNE $1044 ; (startup + 67)
1041 : 95 00 __ STA $00,x 
1043 : e8 __ __ INX
1044 : e0 f7 __ CPX #$f7
1046 : d0 f9 __ BNE $1041 ; (startup + 64)
1048 : a9 47 __ LDA #$47
104a : 85 23 __ STA SP + 0 
104c : a9 fc __ LDA #$fc
104e : 85 24 __ STA SP + 1 
1050 : 20 00 40 JSR $4000 ; (main.s1 + 0)
1053 : a9 4c __ LDA #$4c
1055 : 85 54 __ STA $54 
1057 : a9 00 __ LDA #$00
1059 : 85 13 __ STA P6 
105b : a9 19 __ LDA #$19
105d : 85 16 __ STA P9 
105f : 8d 3e ff STA $ff3e 
1062 : 60 __ __ RTS
--------------------------------------------------------------------
p4irq: ; p4irq
1080 : 48 __ __ PHA
1081 : 8a __ __ TXA
1082 : 48 __ __ PHA
1083 : 8d 3e ff STA $ff3e 
1086 : a9 10 __ LDA #$10
1088 : 48 __ __ PHA
1089 : a9 99 __ LDA #$99
108b : 48 __ __ PHA
108c : ba __ __ TSX
108d : bd 05 01 LDA $0105,x 
1090 : 48 __ __ PHA
1091 : 48 __ __ PHA
1092 : 8a __ __ TXA
1093 : 48 __ __ PHA
1094 : 98 __ __ TYA
1095 : 48 __ __ PHA
1096 : 4c 00 ce JMP $ce00 
--------------------------------------------------------------------
p4irqx: ; p4irqx
1099 : 8d 3f ff STA $ff3f 
109c : 68 __ __ PLA
109d : aa __ __ TAX
109e : 68 __ __ PLA
109f : 40 __ __ RTI
10a0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
10a1 : a5 0d __ LDA P0 
10a3 : 05 0e __ ORA P1 
10a5 : f0 08 __ BEQ $10af ; (krnio_setnam.s4 + 14)
10a7 : a0 ff __ LDY #$ff
10a9 : c8 __ __ INY
10aa : b1 0d __ LDA (P0),y 
10ac : d0 fb __ BNE $10a9 ; (krnio_setnam.s4 + 8)
10ae : 98 __ __ TYA
10af : a6 0d __ LDX P0 
10b1 : a4 0e __ LDY P1 
10b3 : 8d 3e ff STA $ff3e 
10b6 : 20 bd ff JSR $ffbd 
10b9 : 8d 3f ff STA $ff3f 
.s3:
10bc : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
10bd : a9 00 __ LDA #$00
10bf : a6 0d __ LDX P0 ; (fnum + 0)
10c1 : 9d 94 6e STA $6e94,x ; (krnio_pstatus[0] + 0)
10c4 : a9 00 __ LDA #$00
10c6 : 85 1b __ STA ACCU + 0 
10c8 : 85 1c __ STA ACCU + 1 
10ca : 8d 3e ff STA $ff3e 
10cd : a5 0d __ LDA P0 ; (fnum + 0)
10cf : a6 0e __ LDX P1 
10d1 : a4 0f __ LDY P2 
10d3 : 20 ba ff JSR $ffba 
10d6 : 20 c0 ff JSR $ffc0 
10d9 : 90 08 __ BCC $10e3 ; (krnio_open.s4 + 38)
10db : a5 0d __ LDA P0 ; (fnum + 0)
10dd : 20 c3 ff JSR $ffc3 
10e0 : 4c ea 10 JMP $10ea ; (krnio_open.s4 + 45)
10e3 : a9 01 __ LDA #$01
10e5 : 85 1b __ STA ACCU + 0 
10e7 : 8d 3f ff STA $ff3f 
10ea : a5 1b __ LDA ACCU + 0 
10ec : f0 02 __ BEQ $10f0 ; (krnio_open.s3 + 0)
.s5:
10ee : a9 01 __ LDA #$01
.s3:
10f0 : 60 __ __ RTS
--------------------------------------------------------------------
bsout: ; bsout
10f1 : 8d 3e ff STA $ff3e 
10f4 : 20 d2 ff JSR $ffd2 
10f7 : 8d 3f ff STA $ff3f 
10fa : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
10fb : 85 0d __ STA P0 
10fd : 8d 3e ff STA $ff3e 
1100 : a6 0d __ LDX P0 
1102 : 20 c6 ff JSR $ffc6 
1105 : 8d 3f ff STA $ff3f 
1108 : a9 00 __ LDA #$00
110a : 2a __ __ ROL
110b : 49 01 __ EOR #$01
110d : 85 1b __ STA ACCU + 0 
110f : a5 1b __ LDA ACCU + 0 
1111 : f0 02 __ BEQ $1115 ; (krnio_chkin.s3 + 0)
.s5:
1113 : a9 01 __ LDA #$01
.s3:
1115 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
1116 : 8d 3e ff STA $ff3e 
1119 : 20 cf ff JSR $ffcf 
111c : 85 1b __ STA ACCU + 0 
111e : 8d 3f ff STA $ff3f 
.s3:
1121 : a5 1b __ LDA ACCU + 0 
1123 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
1124 : 8d 3e ff STA $ff3e 
1127 : 20 b7 ff JSR $ffb7 
112a : 8d 3f ff STA $ff3f 
112d : 85 1b __ STA ACCU + 0 
112f : a9 00 __ LDA #$00
1131 : 85 1c __ STA ACCU + 1 
.s3:
1133 : a5 1b __ LDA ACCU + 0 
1135 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
1136 : 8d 3e ff STA $ff3e 
1139 : 20 cc ff JSR $ffcc 
113c : 8d 3f ff STA $ff3f 
.s3:
113f : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
1140 : 85 0d __ STA P0 
1142 : 8d 3e ff STA $ff3e 
1145 : a5 0d __ LDA P0 
1147 : 20 c3 ff JSR $ffc3 
114a : 8d 3f ff STA $ff3f 
.s3:
114d : 60 __ __ RTS
--------------------------------------------------------------------
bsget: ; bsget
114e : 8d 3e ff STA $ff3e 
1151 : 20 cf ff JSR $ffcf 
1154 : 8d 3f ff STA $ff3f 
1157 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 635, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
4000 : a2 0c __ LDX #$0c
4002 : b5 53 __ LDA T1 + 0,x 
4004 : 9d 49 fc STA $fc49,x ; (main@stack + 0)
4007 : ca __ __ DEX
4008 : 10 f8 __ BPL $4002 ; (main.s1 + 2)
.s4:
400a : 8d 3f ff STA $ff3f 
400d : 78 __ __ SEI
400e : 20 1e 43 JSR $431e ; (init_hires.s4 + 0)
4011 : 20 75 43 JSR $4375 ; (ultra_fast_clear.s4 + 0)
4014 : 20 a9 43 JSR $43a9 ; (load_vertex_data.s1 + 0)
4017 : ad a8 6e LDA $6ea8 ; (h + 0)
401a : 85 15 __ STA P8 
401c : ad a9 6e LDA $6ea9 ; (h + 1)
401f : 85 16 __ STA P9 
4021 : 20 6e 55 JSR $556e ; (load_plane_data.s1 + 0)
4024 : a9 1e __ LDA #$1e
4026 : 85 0d __ STA P0 
4028 : 85 0f __ STA P2 
402a : 85 11 __ STA P4 
402c : a9 00 __ LDA #$00
402e : 85 0e __ STA P1 
4030 : 85 10 __ STA P3 
4032 : 85 12 __ STA P5 
4034 : 85 14 __ STA P7 
4036 : 85 16 __ STA P9 
4038 : 85 18 __ STA P11 
403a : a9 a0 __ LDA #$a0
403c : 85 5b __ STA T5 + 0 
403e : 85 13 __ STA P6 
4040 : a9 64 __ LDA #$64
4042 : 85 5d __ STA T6 + 0 
4044 : 85 15 __ STA P8 
4046 : a9 09 __ LDA #$09
4048 : 85 59 __ STA T4 + 0 
404a : 85 17 __ STA P10 
404c : a9 90 __ LDA #$90
404e : 8d f8 fc STA $fcf8 ; (sstack + 0)
4051 : a9 01 __ LDA #$01
4053 : 8d f9 fc STA $fcf9 ; (sstack + 1)
4056 : 20 a7 57 JSR $57a7 ; (SetViewPage1.s4 + 0)
4059 : a9 00 __ LDA #$00
405b : 8d 10 6e STA $6e10 ; (bitmap + 0)
405e : a9 c0 __ LDA #$c0
4060 : 8d 11 6e STA $6e11 ; (bitmap + 1)
4063 : ad a4 6e LDA $6ea4 ; (c + 0)
4066 : 8d fa fc STA $fcfa ; (sstack + 2)
4069 : ad a5 6e LDA $6ea5 ; (c + 1)
406c : 8d fb fc STA $fcfb ; (sstack + 3)
406f : 20 b2 57 JSR $57b2 ; (render_full_rotation.s1 + 0)
4072 : 20 75 43 JSR $4375 ; (ultra_fast_clear.s4 + 0)
4075 : a9 90 __ LDA #$90
4077 : 8d f8 fc STA $fcf8 ; (sstack + 0)
407a : a9 01 __ LDA #$01
407c : 8d f9 fc STA $fcf9 ; (sstack + 1)
407f : 20 f8 5b JSR $5bf8 ; (sort_and_render_faces.s1 + 0)
4082 : 20 53 65 JSR $6553 ; (switchVisiblePage.s4 + 0)
4085 : 20 1f 66 JSR $661f ; (switchDrawPage.s4 + 0)
4088 : a9 1e __ LDA #$1e
408a : 85 53 __ STA T1 + 0 
408c : 85 55 __ STA T2 + 0 
408e : 85 57 __ STA T3 + 0 
4090 : a9 00 __ LDA #$00
4092 : 85 54 __ STA T1 + 1 
4094 : 85 56 __ STA T2 + 1 
4096 : 85 58 __ STA T3 + 1 
4098 : 85 5a __ STA T4 + 1 
409a : 85 5c __ STA T5 + 1 
409c : 85 5e __ STA T6 + 1 
409e : 85 5f __ STA T7 + 0 
.l5:
40a0 : 20 3a 66 JSR $663a ; (wait_for_key.s4 + 0)
40a3 : c9 44 __ CMP #$44
40a5 : d0 0b __ BNE $40b2 ; (main.s6 + 0)
.s52:
40a7 : a5 55 __ LDA T2 + 0 
40a9 : 69 04 __ ADC #$04
40ab : 85 1b __ STA ACCU + 0 
40ad : a9 00 __ LDA #$00
40af : 4c 63 42 JMP $4263 ; (main.s37 + 0)
.s6:
40b2 : b0 03 __ BCS $40b7 ; (main.s7 + 0)
40b4 : 4c 13 42 JMP $4213 ; (main.s30 + 0)
.s7:
40b7 : c9 57 __ CMP #$57
40b9 : d0 1a __ BNE $40d5 ; (main.s8 + 0)
.s29:
40bb : a5 53 __ LDA T1 + 0 
40bd : 69 04 __ ADC #$04
40bf : 85 1b __ STA ACCU + 0 
40c1 : a9 00 __ LDA #$00
.s22:
40c3 : 65 54 __ ADC T1 + 1 
40c5 : 85 1c __ STA ACCU + 1 
40c7 : 20 50 6a JSR $6a50 ; (mods16@proxy + 0)
40ca : a5 05 __ LDA WORK + 2 
40cc : 85 53 __ STA T1 + 0 
40ce : a5 06 __ LDA WORK + 3 
40d0 : 85 54 __ STA T1 + 1 
40d2 : 4c f7 40 JMP $40f7 ; (main.s15 + 0)
.s8:
40d5 : b0 03 __ BCS $40da ; (main.s9 + 0)
40d7 : 4c b7 41 JMP $41b7 ; (main.s18 + 0)
.s9:
40da : c9 91 __ CMP #$91
40dc : d0 03 __ BNE $40e1 ; (main.s10 + 0)
40de : 4c 8a 41 JMP $418a ; (main.s17 + 0)
.s10:
40e1 : b0 76 __ BCS $4159 ; (main.s11 + 0)
.s13:
40e3 : c9 58 __ CMP #$58
40e5 : d0 b9 __ BNE $40a0 ; (main.l5 + 0)
.s14:
40e7 : a9 01 __ LDA #$01
40e9 : ed 84 6e SBC $6e84 ; (wireframeOn + 0)
40ec : 8d 84 6e STA $6e84 ; (wireframeOn + 0)
40ef : a9 00 __ LDA #$00
40f1 : ed 85 6e SBC $6e85 ; (wireframeOn + 1)
40f4 : 8d 85 6e STA $6e85 ; (wireframeOn + 1)
.s15:
40f7 : ad a4 6e LDA $6ea4 ; (c + 0)
40fa : 8d fa fc STA $fcfa ; (sstack + 2)
40fd : ad a5 6e LDA $6ea5 ; (c + 1)
4100 : 8d fb fc STA $fcfb ; (sstack + 3)
.s16:
4103 : a5 53 __ LDA T1 + 0 
4105 : 85 0d __ STA P0 
4107 : a5 54 __ LDA T1 + 1 
4109 : 85 0e __ STA P1 
410b : a5 55 __ LDA T2 + 0 
410d : 85 0f __ STA P2 
410f : a5 56 __ LDA T2 + 1 
4111 : 85 10 __ STA P3 
4113 : a5 57 __ LDA T3 + 0 
4115 : 85 11 __ STA P4 
4117 : a5 58 __ LDA T3 + 1 
4119 : 85 12 __ STA P5 
411b : a5 5b __ LDA T5 + 0 
411d : 85 13 __ STA P6 
411f : a5 5c __ LDA T5 + 1 
4121 : 85 14 __ STA P7 
4123 : a5 5d __ LDA T6 + 0 
4125 : 85 15 __ STA P8 
4127 : a5 5e __ LDA T6 + 1 
4129 : 85 16 __ STA P9 
412b : a5 59 __ LDA T4 + 0 
412d : 85 17 __ STA P10 
412f : a5 5a __ LDA T4 + 1 
4131 : 85 18 __ STA P11 
4133 : a9 90 __ LDA #$90
4135 : 8d f8 fc STA $fcf8 ; (sstack + 0)
4138 : a9 01 __ LDA #$01
413a : 8d f9 fc STA $fcf9 ; (sstack + 1)
413d : 20 b2 57 JSR $57b2 ; (render_full_rotation.s1 + 0)
4140 : 20 75 43 JSR $4375 ; (ultra_fast_clear.s4 + 0)
4143 : a9 90 __ LDA #$90
4145 : 8d f8 fc STA $fcf8 ; (sstack + 0)
4148 : a9 01 __ LDA #$01
414a : 8d f9 fc STA $fcf9 ; (sstack + 1)
414d : 20 f8 5b JSR $5bf8 ; (sort_and_render_faces.s1 + 0)
4150 : 20 53 65 JSR $6553 ; (switchVisiblePage.s4 + 0)
4153 : 20 1f 66 JSR $661f ; (switchDrawPage.s4 + 0)
4156 : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s11:
4159 : c9 9d __ CMP #$9d
415b : d0 f9 __ BNE $4156 ; (main.s16 + 83)
.s12:
415d : a9 00 __ LDA #$00
415f : 8d fc fc STA $fcfc ; (sstack + 4)
4162 : 8d fd fc STA $fcfd ; (sstack + 5)
4165 : a9 fb __ LDA #$fb
4167 : 8d fa fc STA $fcfa ; (sstack + 2)
416a : a9 ff __ LDA #$ff
416c : 8d fb fc STA $fcfb ; (sstack + 3)
416f : a9 90 __ LDA #$90
4171 : 8d fe fc STA $fcfe ; (sstack + 6)
4174 : a9 01 __ LDA #$01
4176 : 8d ff fc STA $fcff ; (sstack + 7)
4179 : 20 6d 65 JSR $656d ; (DoTranslate.s4 + 0)
417c : 38 __ __ SEC
417d : a5 5b __ LDA T5 + 0 
417f : e9 05 __ SBC #$05
4181 : 85 5b __ STA T5 + 0 
4183 : b0 d1 __ BCS $4156 ; (main.s16 + 83)
.s58:
4185 : c6 5c __ DEC T5 + 1 
4187 : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s17:
418a : a9 00 __ LDA #$00
418c : 8d fa fc STA $fcfa ; (sstack + 2)
418f : 8d fb fc STA $fcfb ; (sstack + 3)
4192 : a9 fb __ LDA #$fb
4194 : 8d fc fc STA $fcfc ; (sstack + 4)
4197 : a9 ff __ LDA #$ff
4199 : 8d fd fc STA $fcfd ; (sstack + 5)
419c : a9 90 __ LDA #$90
419e : 8d fe fc STA $fcfe ; (sstack + 6)
41a1 : a9 01 __ LDA #$01
41a3 : 8d ff fc STA $fcff ; (sstack + 7)
41a6 : 20 6d 65 JSR $656d ; (DoTranslate.s4 + 0)
41a9 : 38 __ __ SEC
41aa : a5 5d __ LDA T6 + 0 
41ac : e9 05 __ SBC #$05
41ae : 85 5d __ STA T6 + 0 
41b0 : b0 d5 __ BCS $4187 ; (main.s58 + 2)
.s57:
41b2 : c6 5e __ DEC T6 + 1 
41b4 : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s18:
41b7 : c9 51 __ CMP #$51
41b9 : d0 1a __ BNE $41d5 ; (main.s19 + 0)
.s28:
41bb : a5 57 __ LDA T3 + 0 
41bd : 69 62 __ ADC #$62
41bf : 85 1b __ STA ACCU + 0 
41c1 : a9 01 __ LDA #$01
.s27:
41c3 : 65 58 __ ADC T3 + 1 
41c5 : 85 1c __ STA ACCU + 1 
41c7 : 20 50 6a JSR $6a50 ; (mods16@proxy + 0)
41ca : a5 05 __ LDA WORK + 2 
41cc : 85 57 __ STA T3 + 0 
41ce : a5 06 __ LDA WORK + 3 
41d0 : 85 58 __ STA T3 + 1 
41d2 : 4c f7 40 JMP $40f7 ; (main.s15 + 0)
.s19:
41d5 : 90 0f __ BCC $41e6 ; (main.s23 + 0)
.s20:
41d7 : c9 53 __ CMP #$53
41d9 : d0 d9 __ BNE $41b4 ; (main.s57 + 2)
.s21:
41db : a5 53 __ LDA T1 + 0 
41dd : 69 62 __ ADC #$62
41df : 85 1b __ STA ACCU + 0 
41e1 : a9 01 __ LDA #$01
41e3 : 4c c3 40 JMP $40c3 ; (main.s22 + 0)
.s23:
41e6 : c9 45 __ CMP #$45
41e8 : d0 0a __ BNE $41f4 ; (main.s24 + 0)
.s26:
41ea : a5 57 __ LDA T3 + 0 
41ec : 69 04 __ ADC #$04
41ee : 85 1b __ STA ACCU + 0 
41f0 : a9 00 __ LDA #$00
41f2 : f0 cf __ BEQ $41c3 ; (main.s27 + 0)
.s24:
41f4 : c9 50 __ CMP #$50
41f6 : d0 bc __ BNE $41b4 ; (main.s57 + 2)
.s25:
41f8 : a9 00 __ LDA #$00
41fa : 8d 84 6e STA $6e84 ; (wireframeOn + 0)
41fd : 8d 85 6e STA $6e85 ; (wireframeOn + 1)
4200 : a9 01 __ LDA #$01
4202 : ed 86 6e SBC $6e86 ; (PaintersOn + 0)
4205 : 8d 86 6e STA $6e86 ; (PaintersOn + 0)
4208 : a9 00 __ LDA #$00
420a : ed 87 6e SBC $6e87 ; (PaintersOn + 1)
420d : 8d 87 6e STA $6e87 ; (PaintersOn + 1)
4210 : 4c f7 40 JMP $40f7 ; (main.s15 + 0)
.s30:
4213 : c9 2d __ CMP #$2d
4215 : d0 2c __ BNE $4243 ; (main.s31 + 0)
.s48:
4217 : ad a4 6e LDA $6ea4 ; (c + 0)
421a : 8d fa fc STA $fcfa ; (sstack + 2)
421d : ad a5 6e LDA $6ea5 ; (c + 1)
4220 : 8d fb fc STA $fcfb ; (sstack + 3)
4223 : a5 5a __ LDA T4 + 1 
4225 : 10 03 __ BPL $422a ; (main.s51 + 0)
4227 : 4c 03 41 JMP $4103 ; (main.s16 + 0)
.s51:
422a : d0 12 __ BNE $423e ; (main.s59 + 0)
.s50:
422c : a5 59 __ LDA T4 + 0 
422e : c9 02 __ CMP #$02
4230 : 90 f5 __ BCC $4227 ; (main.s48 + 16)
.s49:
4232 : 38 __ __ SEC
4233 : e9 01 __ SBC #$01
4235 : 85 59 __ STA T4 + 0 
4237 : b0 ee __ BCS $4227 ; (main.s48 + 16)
.s53:
4239 : c6 5a __ DEC T4 + 1 
423b : 4c 03 41 JMP $4103 ; (main.s16 + 0)
.s59:
423e : a5 59 __ LDA T4 + 0 
4240 : 4c 32 42 JMP $4232 ; (main.s49 + 0)
.s31:
4243 : 90 54 __ BCC $4299 ; (main.s39 + 0)
.s32:
4245 : c9 42 __ CMP #$42
4247 : d0 0c __ BNE $4255 ; (main.s33 + 0)
.s38:
4249 : a9 01 __ LDA #$01
424b : e5 5f __ SBC T7 + 0 
424d : 85 5f __ STA T7 + 0 
424f : 8d 19 ff STA $ff19 
4252 : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s33:
4255 : b0 1e __ BCS $4275 ; (main.s34 + 0)
.s35:
4257 : c9 41 __ CMP #$41
4259 : d0 f7 __ BNE $4252 ; (main.s38 + 9)
.s36:
425b : a5 55 __ LDA T2 + 0 
425d : 69 62 __ ADC #$62
425f : 85 1b __ STA ACCU + 0 
4261 : a9 01 __ LDA #$01
.s37:
4263 : 65 56 __ ADC T2 + 1 
4265 : 85 1c __ STA ACCU + 1 
4267 : 20 50 6a JSR $6a50 ; (mods16@proxy + 0)
426a : a5 05 __ LDA WORK + 2 
426c : 85 55 __ STA T2 + 0 
426e : a5 06 __ LDA WORK + 3 
4270 : 85 56 __ STA T2 + 1 
4272 : 4c f7 40 JMP $40f7 ; (main.s15 + 0)
.s34:
4275 : a9 01 __ LDA #$01
4277 : ed 88 6e SBC $6e88 ; (backcolor + 0)
427a : 8d 88 6e STA $6e88 ; (backcolor + 0)
427d : a9 00 __ LDA #$00
427f : ed 89 6e SBC $6e89 ; (backcolor + 1)
4282 : 8d 89 6e STA $6e89 ; (backcolor + 1)
4285 : 38 __ __ SEC
4286 : a9 01 __ LDA #$01
4288 : ed 8a 6e SBC $6e8a ; (linecolor + 0)
428b : 8d 8a 6e STA $6e8a ; (linecolor + 0)
428e : a9 00 __ LDA #$00
4290 : ed 8b 6e SBC $6e8b ; (linecolor + 1)
4293 : 8d 8b 6e STA $6e8b ; (linecolor + 1)
4296 : 4c f7 40 JMP $40f7 ; (main.s15 + 0)
.s39:
4299 : c9 20 __ CMP #$20
429b : f0 70 __ BEQ $430d ; (main.s47 + 0)
.s40:
429d : 90 0d __ BCC $42ac ; (main.s43 + 0)
.s41:
429f : c9 2b __ CMP #$2b
42a1 : d0 af __ BNE $4252 ; (main.s38 + 9)
.s42:
42a3 : e6 59 __ INC T4 + 0 
42a5 : d0 ef __ BNE $4296 ; (main.s34 + 33)
.s56:
42a7 : e6 5a __ INC T4 + 1 
42a9 : 4c f7 40 JMP $40f7 ; (main.s15 + 0)
.s43:
42ac : c9 11 __ CMP #$11
42ae : f0 32 __ BEQ $42e2 ; (main.s46 + 0)
.s44:
42b0 : c9 1d __ CMP #$1d
42b2 : d0 9e __ BNE $4252 ; (main.s38 + 9)
.s45:
42b4 : a9 00 __ LDA #$00
42b6 : 8d fb fc STA $fcfb ; (sstack + 3)
42b9 : 8d fc fc STA $fcfc ; (sstack + 4)
42bc : 8d fd fc STA $fcfd ; (sstack + 5)
42bf : a9 05 __ LDA #$05
42c1 : 8d fa fc STA $fcfa ; (sstack + 2)
42c4 : a9 90 __ LDA #$90
42c6 : 8d fe fc STA $fcfe ; (sstack + 6)
42c9 : a9 01 __ LDA #$01
42cb : 8d ff fc STA $fcff ; (sstack + 7)
42ce : 20 6d 65 JSR $656d ; (DoTranslate.s4 + 0)
42d1 : 18 __ __ CLC
42d2 : a5 5b __ LDA T5 + 0 
42d4 : 69 05 __ ADC #$05
42d6 : 85 5b __ STA T5 + 0 
42d8 : b0 03 __ BCS $42dd ; (main.s55 + 0)
42da : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s55:
42dd : e6 5c __ INC T5 + 1 
42df : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s46:
42e2 : a9 00 __ LDA #$00
42e4 : 8d fa fc STA $fcfa ; (sstack + 2)
42e7 : 8d fb fc STA $fcfb ; (sstack + 3)
42ea : 8d fd fc STA $fcfd ; (sstack + 5)
42ed : a9 05 __ LDA #$05
42ef : 8d fc fc STA $fcfc ; (sstack + 4)
42f2 : a9 90 __ LDA #$90
42f4 : 8d fe fc STA $fcfe ; (sstack + 6)
42f7 : a9 01 __ LDA #$01
42f9 : 8d ff fc STA $fcff ; (sstack + 7)
42fc : 20 6d 65 JSR $656d ; (DoTranslate.s4 + 0)
42ff : 18 __ __ CLC
4300 : a5 5d __ LDA T6 + 0 
4302 : 69 05 __ ADC #$05
4304 : 85 5d __ STA T6 + 0 
4306 : 90 d7 __ BCC $42df ; (main.s55 + 2)
.s54:
4308 : e6 5e __ INC T6 + 1 
430a : 4c a0 40 JMP $40a0 ; (main.l5 + 0)
.s47:
430d : a9 00 __ LDA #$00
430f : 85 1b __ STA ACCU + 0 
4311 : 85 1c __ STA ACCU + 1 
.s3:
4313 : a2 0c __ LDX #$0c
4315 : bd 49 fc LDA $fc49,x ; (main@stack + 0)
4318 : 95 53 __ STA T1 + 0,x 
431a : ca __ __ DEX
431b : 10 f8 __ BPL $4315 ; (main.s3 + 2)
431d : 60 __ __ RTS
--------------------------------------------------------------------
init_hires: ; init_hires()->void
; 133, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
431e : 78 __ __ SEI
431f : 8d 3f ff STA $ff3f 
4322 : a9 3b __ LDA #$3b
4324 : 8d 06 ff STA $ff06 
4327 : ad 06 ff LDA $ff06 
432a : 09 20 __ ORA #$20
432c : 8d 06 ff STA $ff06 
432f : ad 12 ff LDA $ff12 
4332 : 29 03 __ AND #$03
4334 : 09 08 __ ORA #$08
4336 : 8d 12 ff STA $ff12 
4339 : ad 12 ff LDA $ff12 
433c : 29 c3 __ AND #$c3
433e : 09 08 __ ORA #$08
4340 : 8d 12 ff STA $ff12 
4343 : a9 18 __ LDA #$18
4345 : 8d 14 ff STA $ff14 
4348 : 58 __ __ CLI
4349 : a9 00 __ LDA #$00
434b : 8d 19 ff STA $ff19 
434e : a9 04 __ LDA #$04
4350 : a2 fa __ LDX #$fa
.l6:
4352 : ca __ __ DEX
4353 : 9d 00 18 STA $1800,x 
4356 : 9d fa 18 STA $18fa,x 
4359 : 9d f4 19 STA $19f4,x 
435c : 9d ee 1a STA $1aee,x 
435f : d0 f1 __ BNE $4352 ; (init_hires.l6 + 0)
.s5:
4361 : a9 f0 __ LDA #$f0
4363 : a2 fa __ LDX #$fa
.l7:
4365 : ca __ __ DEX
4366 : 9d 00 1c STA $1c00,x 
4369 : 9d fa 1c STA $1cfa,x 
436c : 9d f4 1d STA $1df4,x 
436f : 9d ee 1e STA $1eee,x 
4372 : d0 f1 __ BNE $4365 ; (init_hires.l7 + 0)
.s3:
4374 : 60 __ __ RTS
--------------------------------------------------------------------
ultra_fast_clear: ; ultra_fast_clear()->void
; 580, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
4375 : a9 00 __ LDA #$00
4377 : 85 0f __ STA P2 
4379 : 85 10 __ STA P3 
437b : ad 10 6e LDA $6e10 ; (bitmap + 0)
437e : 85 0d __ STA P0 
4380 : a9 40 __ LDA #$40
4382 : 85 11 __ STA P4 
4384 : a9 1f __ LDA #$1f
4386 : 85 12 __ STA P5 
4388 : ad 11 6e LDA $6e11 ; (bitmap + 1)
438b : 85 0e __ STA P1 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "D:/Arbeit/dev/oscar64/include/string.h"
.s4:
438d : a5 0f __ LDA P2 
438f : a6 12 __ LDX P5 
4391 : f0 0c __ BEQ $439f ; (memset.s4 + 18)
4393 : a0 00 __ LDY #$00
4395 : 91 0d __ STA (P0),y 
4397 : c8 __ __ INY
4398 : d0 fb __ BNE $4395 ; (memset.s4 + 8)
439a : e6 0e __ INC P1 
439c : ca __ __ DEX
439d : d0 f6 __ BNE $4395 ; (memset.s4 + 8)
439f : a4 11 __ LDY P4 
43a1 : f0 05 __ BEQ $43a8 ; (memset.s3 + 0)
43a3 : 88 __ __ DEY
43a4 : 91 0d __ STA (P0),y 
43a6 : d0 fb __ BNE $43a3 ; (memset.s4 + 22)
.s3:
43a8 : 60 __ __ RTS
--------------------------------------------------------------------
load_vertex_data: ; load_vertex_data()->void
; 256, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
43a9 : a2 05 __ LDX #$05
43ab : b5 53 __ LDA T1 + 0,x 
43ad : 9d 57 fc STA $fc57,x ; (load_vertex_data@stack + 0)
43b0 : ca __ __ DEX
43b1 : 10 f8 __ BPL $43ab ; (load_vertex_data.s1 + 2)
.s4:
43b3 : a9 a8 __ LDA #$a8
43b5 : 85 10 __ STA P3 
43b7 : a9 47 __ LDA #$47
43b9 : 85 11 __ STA P4 
43bb : 20 0d 46 JSR $460d ; (fopen@proxy + 0)
43be : a5 1c __ LDA ACCU + 1 
43c0 : 85 56 __ STA T2 + 1 
43c2 : a6 1b __ LDX ACCU + 0 
43c4 : 86 55 __ STX T2 + 0 
43c6 : d0 06 __ BNE $43ce ; (load_vertex_data.s5 + 0)
.s20:
43c8 : a8 __ __ TAY
43c9 : d0 03 __ BNE $43ce ; (load_vertex_data.s5 + 0)
43cb : 4c fd 45 JMP $45fd ; (load_vertex_data.s18 + 0)
.s5:
43ce : 86 10 __ STX P3 
43d0 : 85 11 __ STA P4 
43d2 : 20 ad 52 JSR $52ad ; (fgets@proxy + 0)
43d5 : a5 1b __ LDA ACCU + 0 
43d7 : 05 1c __ ORA ACCU + 1 
43d9 : d0 03 __ BNE $43de ; (load_vertex_data.s17 + 0)
43db : 4c 89 44 JMP $4489 ; (load_vertex_data.s6 + 0)
.s17:
43de : a9 61 __ LDA #$61
43e0 : 85 0d __ STA P0 
43e2 : a9 6e __ LDA #$6e
43e4 : 85 10 __ STA P3 
43e6 : a9 fc __ LDA #$fc
43e8 : 85 0e __ STA P1 
43ea : a9 a4 __ LDA #$a4
43ec : 85 0f __ STA P2 
43ee : 20 2b 53 JSR $532b ; (parse_next_int.s4 + 0)
43f1 : a9 a6 __ LDA #$a6
43f3 : 85 0f __ STA P2 
43f5 : a9 6e __ LDA #$6e
43f7 : 85 10 __ STA P3 
43f9 : 20 23 53 JSR $5323 ; (parse_next_int@proxy + 0)
43fc : a9 a8 __ LDA #$a8
43fe : 85 0f __ STA P2 
4400 : a9 6e __ LDA #$6e
4402 : 85 10 __ STA P3 
4404 : 20 23 53 JSR $5323 ; (parse_next_int@proxy + 0)
4407 : a9 aa __ LDA #$aa
4409 : 85 0f __ STA P2 
440b : a9 6e __ LDA #$6e
440d : 85 10 __ STA P3 
440f : 20 23 53 JSR $5323 ; (parse_next_int@proxy + 0)
4412 : ad a4 6e LDA $6ea4 ; (c + 0)
4415 : 0a __ __ ASL
4416 : 85 43 __ STA T0 + 0 
4418 : 85 1b __ STA ACCU + 0 
441a : ad a5 6e LDA $6ea5 ; (c + 1)
441d : 2a __ __ ROL
441e : 85 44 __ STA T0 + 1 
4420 : 85 1c __ STA ACCU + 1 
4422 : 20 fa 6c JSR $6cfa ; (crt_malloc + 0)
4425 : a5 1b __ LDA ACCU + 0 
4427 : 8d ac 6e STA $6eac ; (x_pct + 0)
442a : a5 1c __ LDA ACCU + 1 
442c : 8d ad 6e STA $6ead ; (x_pct + 1)
442f : 20 f2 6c JSR $6cf2 ; (crt_malloc@proxy + 0)
4432 : a5 1b __ LDA ACCU + 0 
4434 : 8d ae 6e STA $6eae ; (y_pct + 0)
4437 : a5 1c __ LDA ACCU + 1 
4439 : 8d af 6e STA $6eaf ; (y_pct + 1)
443c : 20 f2 6c JSR $6cf2 ; (crt_malloc@proxy + 0)
443f : a5 1b __ LDA ACCU + 0 
4441 : 8d b0 6e STA $6eb0 ; (z_pct + 0)
4444 : a5 1c __ LDA ACCU + 1 
4446 : 8d b1 6e STA $6eb1 ; (z_pct + 1)
4449 : 20 f2 6c JSR $6cf2 ; (crt_malloc@proxy + 0)
444c : a5 1b __ LDA ACCU + 0 
444e : 8d b2 6e STA $6eb2 ; (z_rotated + 0)
4451 : a5 1c __ LDA ACCU + 1 
4453 : 8d b3 6e STA $6eb3 ; (z_rotated + 1)
4456 : 20 f2 6c JSR $6cf2 ; (crt_malloc@proxy + 0)
4459 : a5 1b __ LDA ACCU + 0 
445b : 8d b4 6e STA $6eb4 ; (vx_pct + 0)
445e : a5 1c __ LDA ACCU + 1 
4460 : 8d b5 6e STA $6eb5 ; (vx_pct + 1)
4463 : 20 f2 6c JSR $6cf2 ; (crt_malloc@proxy + 0)
4466 : a5 1b __ LDA ACCU + 0 
4468 : 8d b6 6e STA $6eb6 ; (vy_pct + 0)
446b : a5 1c __ LDA ACCU + 1 
446d : 8d b7 6e STA $6eb7 ; (vy_pct + 1)
4470 : ad aa 6e LDA $6eaa ; (u + 0)
4473 : 0a __ __ ASL
4474 : 85 1b __ STA ACCU + 0 
4476 : ad ab 6e LDA $6eab ; (u + 1)
4479 : 2a __ __ ROL
447a : 85 1c __ STA ACCU + 1 
447c : 20 fa 6c JSR $6cfa ; (crt_malloc + 0)
447f : a5 1b __ LDA ACCU + 0 
4481 : 8d b8 6e STA $6eb8 ; (u_array + 0)
4484 : a5 1c __ LDA ACCU + 1 
4486 : 8d b9 6e STA $6eb9 ; (u_array + 1)
.s6:
4489 : a9 01 __ LDA #$01
448b : 8d ba 6e STA $6eba ; (a + 0)
448e : a9 00 __ LDA #$00
4490 : 8d bb 6e STA $6ebb ; (a + 1)
4493 : ad a5 6e LDA $6ea5 ; (c + 1)
4496 : 10 03 __ BPL $449b ; (load_vertex_data.s16 + 0)
4498 : 4c e1 45 JMP $45e1 ; (load_vertex_data.s7 + 0)
.s16:
449b : d0 05 __ BNE $44a2 ; (load_vertex_data.l8 + 0)
.s15:
449d : ad a4 6e LDA $6ea4 ; (c + 0)
44a0 : f0 f6 __ BEQ $4498 ; (load_vertex_data.s6 + 15)
.l8:
44a2 : a5 55 __ LDA T2 + 0 
44a4 : 85 10 __ STA P3 
44a6 : a5 56 __ LDA T2 + 1 
44a8 : 85 11 __ STA P4 
44aa : 20 ad 52 JSR $52ad ; (fgets@proxy + 0)
44ad : ad ba 6e LDA $6eba ; (a + 0)
44b0 : 85 57 __ STA T4 + 0 
44b2 : ad bb 6e LDA $6ebb ; (a + 1)
44b5 : 85 58 __ STA T4 + 1 
44b7 : a5 1b __ LDA ACCU + 0 
44b9 : 05 1c __ ORA ACCU + 1 
44bb : d0 03 __ BNE $44c0 ; (load_vertex_data.s14 + 0)
44bd : 4c b7 45 JMP $45b7 ; (load_vertex_data.s9 + 0)
.s14:
44c0 : a5 57 __ LDA T4 + 0 
44c2 : 0a __ __ ASL
44c3 : a8 __ __ TAY
44c4 : a9 61 __ LDA #$61
44c6 : 85 0d __ STA P0 
44c8 : a9 fc __ LDA #$fc
44ca : 85 0e __ STA P1 
44cc : a5 58 __ LDA T4 + 1 
44ce : 2a __ __ ROL
44cf : aa __ __ TAX
44d0 : 98 __ __ TYA
44d1 : 38 __ __ SEC
44d2 : e9 02 __ SBC #$02
44d4 : 85 53 __ STA T1 + 0 
44d6 : 8a __ __ TXA
44d7 : e9 00 __ SBC #$00
44d9 : 85 54 __ STA T1 + 1 
44db : ad ac 6e LDA $6eac ; (x_pct + 0)
44de : 18 __ __ CLC
44df : 65 53 __ ADC T1 + 0 
44e1 : 85 0f __ STA P2 
44e3 : ad ad 6e LDA $6ead ; (x_pct + 1)
44e6 : 65 54 __ ADC T1 + 1 
44e8 : 85 10 __ STA P3 
44ea : 20 2b 53 JSR $532b ; (parse_next_int.s4 + 0)
44ed : a5 1b __ LDA ACCU + 0 
44ef : 85 0d __ STA P0 
44f1 : a5 1c __ LDA ACCU + 1 
44f3 : 85 0e __ STA P1 
44f5 : ad ae 6e LDA $6eae ; (y_pct + 0)
44f8 : 18 __ __ CLC
44f9 : 65 53 __ ADC T1 + 0 
44fb : 85 0f __ STA P2 
44fd : ad af 6e LDA $6eaf ; (y_pct + 1)
4500 : 65 54 __ ADC T1 + 1 
4502 : 85 10 __ STA P3 
4504 : 20 2b 53 JSR $532b ; (parse_next_int.s4 + 0)
4507 : a5 1b __ LDA ACCU + 0 
4509 : 85 0d __ STA P0 
450b : a5 1c __ LDA ACCU + 1 
450d : 85 0e __ STA P1 
450f : ad b0 6e LDA $6eb0 ; (z_pct + 0)
4512 : 18 __ __ CLC
4513 : 65 53 __ ADC T1 + 0 
4515 : 85 0f __ STA P2 
4517 : ad b1 6e LDA $6eb1 ; (z_pct + 1)
451a : 65 54 __ ADC T1 + 1 
451c : 85 10 __ STA P3 
451e : 20 2b 53 JSR $532b ; (parse_next_int.s4 + 0)
4521 : a9 00 __ LDA #$00
4523 : 85 0f __ STA P2 
4525 : 85 10 __ STA P3 
4527 : 85 14 __ STA P7 
4529 : ad a4 6e LDA $6ea4 ; (c + 0)
452c : 85 03 __ STA WORK + 0 
452e : a9 01 __ LDA #$01
4530 : 85 13 __ STA P6 
4532 : ad a5 6e LDA $6ea5 ; (c + 1)
4535 : 85 04 __ STA WORK + 1 
4537 : 29 80 __ AND #$80
4539 : 10 02 __ BPL $453d ; (load_vertex_data.s14 + 125)
453b : a9 ff __ LDA #$ff
453d : 85 06 __ STA WORK + 3 
453f : 85 05 __ STA WORK + 2 
4541 : a9 00 __ LDA #$00
4543 : 85 1b __ STA ACCU + 0 
4545 : 85 1d __ STA ACCU + 2 
4547 : 85 1e __ STA ACCU + 3 
4549 : 20 aa 6b JSR $6baa ; (divs32@proxy + 0)
454c : a5 1b __ LDA ACCU + 0 
454e : 85 03 __ STA WORK + 0 
4550 : a5 1c __ LDA ACCU + 1 
4552 : 85 04 __ STA WORK + 1 
4554 : a5 1d __ LDA ACCU + 2 
4556 : 85 05 __ STA WORK + 2 
4558 : a5 1e __ LDA ACCU + 3 
455a : 85 06 __ STA WORK + 3 
455c : a5 58 __ LDA T4 + 1 
455e : 85 1c __ STA ACCU + 1 
4560 : 29 80 __ AND #$80
4562 : 10 02 __ BPL $4566 ; (load_vertex_data.s14 + 166)
4564 : a9 ff __ LDA #$ff
4566 : 85 1e __ STA ACCU + 3 
4568 : 85 1d __ STA ACCU + 2 
456a : a5 57 __ LDA T4 + 0 
456c : 85 1b __ STA ACCU + 0 
456e : 20 42 6b JSR $6b42 ; (mul32 + 0)
4571 : a5 07 __ LDA WORK + 4 
4573 : 85 43 __ STA T0 + 0 
4575 : a5 08 __ LDA WORK + 5 
4577 : 85 44 __ STA T0 + 1 
4579 : a5 09 __ LDA WORK + 6 
457b : 85 45 __ STA T0 + 2 
457d : a5 0a __ LDA WORK + 7 
457f : 4a __ __ LSR
4580 : 66 45 __ ROR T0 + 2 
4582 : 66 44 __ ROR T0 + 1 
4584 : 66 43 __ ROR T0 + 0 
4586 : 4a __ __ LSR
4587 : 66 45 __ ROR T0 + 2 
4589 : 66 44 __ ROR T0 + 1 
458b : 66 43 __ ROR T0 + 0 
458d : 4a __ __ LSR
458e : 66 45 __ ROR T0 + 2 
4590 : 66 44 __ ROR T0 + 1 
4592 : 66 43 __ ROR T0 + 0 
4594 : 4a __ __ LSR
4595 : 66 45 __ ROR T0 + 2 
4597 : 66 44 __ ROR T0 + 1 
4599 : 66 43 __ ROR T0 + 0 
459b : 4a __ __ LSR
459c : 66 45 __ ROR T0 + 2 
459e : 66 44 __ ROR T0 + 1 
45a0 : 66 43 __ ROR T0 + 0 
45a2 : 4a __ __ LSR
45a3 : 66 45 __ ROR T0 + 2 
45a5 : 66 44 __ ROR T0 + 1 
45a7 : a5 43 __ LDA T0 + 0 
45a9 : 6a __ __ ROR
45aa : 85 0d __ STA P0 
45ac : 85 11 __ STA P4 
45ae : a5 44 __ LDA T0 + 1 
45b0 : 85 0e __ STA P1 
45b2 : 85 12 __ STA P5 
45b4 : 20 f7 53 JSR $53f7 ; (drawline.s4 + 0)
.s9:
45b7 : 18 __ __ CLC
45b8 : a5 57 __ LDA T4 + 0 
45ba : 69 01 __ ADC #$01
45bc : 8d ba 6e STA $6eba ; (a + 0)
45bf : a5 58 __ LDA T4 + 1 
45c1 : 69 00 __ ADC #$00
45c3 : 8d bb 6e STA $6ebb ; (a + 1)
45c6 : ad a5 6e LDA $6ea5 ; (c + 1)
45c9 : cd bb 6e CMP $6ebb ; (a + 1)
45cc : d0 09 __ BNE $45d7 ; (load_vertex_data.s13 + 0)
.s10:
45ce : ad a4 6e LDA $6ea4 ; (c + 0)
45d1 : cd ba 6e CMP $6eba ; (a + 0)
45d4 : 4c dc 45 JMP $45dc ; (load_vertex_data.s11 + 0)
.s13:
45d7 : 4d bb 6e EOR $6ebb ; (a + 1)
45da : 30 1c __ BMI $45f8 ; (load_vertex_data.s12 + 0)
.s11:
45dc : 90 03 __ BCC $45e1 ; (load_vertex_data.s7 + 0)
45de : 4c a2 44 JMP $44a2 ; (load_vertex_data.l8 + 0)
.s7:
45e1 : a0 00 __ LDY #$00
45e3 : b1 55 __ LDA (T2 + 0),y 
45e5 : 20 40 11 JSR $1140 ; (krnio_close.s4 + 0)
45e8 : a9 00 __ LDA #$00
45ea : a8 __ __ TAY
45eb : 91 55 __ STA (T2 + 0),y 
.s3:
45ed : a2 05 __ LDX #$05
45ef : bd 57 fc LDA $fc57,x ; (load_vertex_data@stack + 0)
45f2 : 95 53 __ STA T1 + 0,x 
45f4 : ca __ __ DEX
45f5 : 10 f8 __ BPL $45ef ; (load_vertex_data.s3 + 2)
45f7 : 60 __ __ RTS
.s12:
45f8 : b0 e7 __ BCS $45e1 ; (load_vertex_data.s7 + 0)
45fa : 4c a2 44 JMP $44a2 ; (load_vertex_data.l8 + 0)
.s18:
45fd : a9 96 __ LDA #$96
45ff : 8d f8 fc STA $fcf8 ; (sstack + 0)
4602 : a9 52 __ LDA #$52
4604 : 8d f9 fc STA $fcf9 ; (sstack + 1)
4607 : 20 b5 47 JSR $47b5 ; (printf.s1 + 0)
.l19:
460a : 4c 0a 46 JMP $460a ; (load_vertex_data.l19 + 0)
--------------------------------------------------------------------
fopen@proxy: ; fopen@proxy
460d : a9 b3 __ LDA #$b3
460f : 85 12 __ STA P5 
4611 : a9 47 __ LDA #$47
4613 : 85 13 __ STA P6 
--------------------------------------------------------------------
fopen: ; fopen(const u8*,const u8*)->struct FILE*
;  40, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
4615 : a9 00 __ LDA #$00
4617 : aa __ __ TAX
.l5:
4618 : a8 __ __ TAY
4619 : 18 __ __ CLC
461a : 69 8c __ ADC #$8c
461c : 85 49 __ STA T6 + 0 
461e : a9 6e __ LDA #$6e
4620 : 69 00 __ ADC #$00
4622 : 85 4a __ STA T6 + 1 
4624 : bd 8c 6e LDA $6e8c,x ; (files[0].fnum + 0)
4627 : f0 0d __ BEQ $4636 ; (fopen.s6 + 0)
.s36:
4629 : e8 __ __ INX
462a : 8a __ __ TXA
462b : e0 08 __ CPX #$08
462d : 90 e9 __ BCC $4618 ; (fopen.l5 + 0)
.s19:
462f : a9 00 __ LDA #$00
4631 : 85 1b __ STA ACCU + 0 
.s3:
4633 : 85 1c __ STA ACCU + 1 
4635 : 60 __ __ RTS
.s6:
4636 : 84 48 __ STY T5 + 0 
4638 : 85 1c __ STA ACCU + 1 
463a : 85 43 __ STA T1 + 0 
463c : a9 08 __ LDA #$08
463e : 85 4c __ STA T10 + 0 
4640 : a0 00 __ LDY #$00
4642 : f0 15 __ BEQ $4659 ; (fopen.l7 + 0)
.s35:
4644 : a5 43 __ LDA T1 + 0 
4646 : 0a __ __ ASL
4647 : 0a __ __ ASL
4648 : 18 __ __ CLC
4649 : 65 43 __ ADC T1 + 0 
464b : 0a __ __ ASL
464c : 85 43 __ STA T1 + 0 
464e : b1 10 __ LDA (P3),y ; (fname + 0)
4650 : 38 __ __ SEC
4651 : e9 30 __ SBC #$30
4653 : 18 __ __ CLC
4654 : 65 43 __ ADC T1 + 0 
4656 : 85 43 __ STA T1 + 0 
4658 : c8 __ __ INY
.l7:
4659 : b1 10 __ LDA (P3),y ; (fname + 0)
465b : c9 30 __ CMP #$30
465d : 90 0c __ BCC $466b ; (fopen.s8 + 0)
.s27:
465f : a9 39 __ LDA #$39
4661 : d1 10 __ CMP (P3),y ; (fname + 0)
4663 : b0 df __ BCS $4644 ; (fopen.s35 + 0)
.s28:
4665 : b1 10 __ LDA (P3),y ; (fname + 0)
4667 : c9 3a __ CMP #$3a
4669 : f0 06 __ BEQ $4671 ; (fopen.s29 + 0)
.s8:
466b : a9 00 __ LDA #$00
466d : 85 4b __ STA T7 + 0 
466f : f0 3d __ BEQ $46ae ; (fopen.s9 + 0)
.s29:
4671 : c8 __ __ INY
4672 : 84 4b __ STY T7 + 0 
4674 : a5 43 __ LDA T1 + 0 
4676 : 85 1c __ STA ACCU + 1 
4678 : a9 00 __ LDA #$00
467a : f0 13 __ BEQ $468f ; (fopen.l30 + 0)
.s34:
467c : a5 46 __ LDA T3 + 0 
467e : 0a __ __ ASL
467f : 0a __ __ ASL
4680 : 18 __ __ CLC
4681 : 65 46 __ ADC T3 + 0 
4683 : 0a __ __ ASL
4684 : 85 46 __ STA T3 + 0 
4686 : b1 10 __ LDA (P3),y ; (fname + 0)
4688 : 38 __ __ SEC
4689 : e9 30 __ SBC #$30
468b : 18 __ __ CLC
468c : 65 46 __ ADC T3 + 0 
468e : c8 __ __ INY
.l30:
468f : 85 46 __ STA T3 + 0 
4691 : b1 10 __ LDA (P3),y ; (fname + 0)
4693 : c9 30 __ CMP #$30
4695 : 90 17 __ BCC $46ae ; (fopen.s9 + 0)
.s31:
4697 : a9 39 __ LDA #$39
4699 : d1 10 __ CMP (P3),y ; (fname + 0)
469b : b0 df __ BCS $467c ; (fopen.s34 + 0)
.s32:
469d : b1 10 __ LDA (P3),y ; (fname + 0)
469f : c9 3a __ CMP #$3a
46a1 : d0 0b __ BNE $46ae ; (fopen.s9 + 0)
.s33:
46a3 : a5 43 __ LDA T1 + 0 
46a5 : 85 4c __ STA T10 + 0 
46a7 : a5 46 __ LDA T3 + 0 
46a9 : 85 1c __ STA ACCU + 1 
46ab : c8 __ __ INY
46ac : 84 4b __ STY T7 + 0 
.s9:
46ae : a9 da __ LDA #$da
46b0 : 85 43 __ STA T1 + 0 
46b2 : a9 fc __ LDA #$fc
46b4 : 85 44 __ STA T1 + 1 
46b6 : a5 1c __ LDA ACCU + 1 
46b8 : c9 0a __ CMP #$0a
46ba : b0 14 __ BCS $46d0 ; (fopen.s26 + 0)
.s10:
46bc : a9 da __ LDA #$da
46be : 85 46 __ STA T3 + 0 
46c0 : a9 fc __ LDA #$fc
46c2 : 85 47 __ STA T3 + 1 
46c4 : a9 d9 __ LDA #$d9
46c6 : 85 43 __ STA T1 + 0 
46c8 : a9 fc __ LDA #$fc
46ca : 85 44 __ STA T1 + 1 
46cc : a2 03 __ LDX #$03
46ce : 90 25 __ BCC $46f5 ; (fopen.s11 + 0)
.s26:
46d0 : 85 1b __ STA ACCU + 0 
46d2 : a9 00 __ LDA #$00
46d4 : 85 1c __ STA ACCU + 1 
46d6 : 85 04 __ STA WORK + 1 
46d8 : a9 0a __ LDA #$0a
46da : 85 03 __ STA WORK + 0 
46dc : 20 cb 69 JSR $69cb ; (divmod + 0)
46df : a5 05 __ LDA WORK + 2 
46e1 : 85 1c __ STA ACCU + 1 
46e3 : 18 __ __ CLC
46e4 : a5 1b __ LDA ACCU + 0 
46e6 : 69 30 __ ADC #$30
46e8 : 8d d9 fc STA $fcd9 ; (cbmname[0] + 1)
46eb : a9 db __ LDA #$db
46ed : 85 46 __ STA T3 + 0 
46ef : a9 fc __ LDA #$fc
46f1 : 85 47 __ STA T3 + 1 
46f3 : a2 04 __ LDX #$04
.s11:
46f5 : a9 3a __ LDA #$3a
46f7 : a0 00 __ LDY #$00
46f9 : 91 46 __ STA (T3 + 0),y 
46fb : 18 __ __ CLC
46fc : a5 1c __ LDA ACCU + 1 
46fe : 69 30 __ ADC #$30
4700 : 91 43 __ STA (T1 + 0),y 
4702 : a9 01 __ LDA #$01
4704 : 85 46 __ STA T3 + 0 
4706 : a4 4b __ LDY T7 + 0 
4708 : b1 10 __ LDA (P3),y ; (fname + 0)
470a : f0 09 __ BEQ $4715 ; (fopen.s12 + 0)
.l25:
470c : 9d d8 fc STA $fcd8,x ; (cbmname[0] + 0)
470f : c8 __ __ INY
4710 : e8 __ __ INX
4711 : b1 10 __ LDA (P3),y ; (fname + 0)
4713 : d0 f7 __ BNE $470c ; (fopen.l25 + 0)
.s12:
4715 : a9 2c __ LDA #$2c
4717 : 9d d8 fc STA $fcd8,x ; (cbmname[0] + 0)
471a : 9d da fc STA $fcda,x ; (cbmname[0] + 2)
471d : a9 53 __ LDA #$53
471f : 9d d9 fc STA $fcd9,x ; (cbmname[0] + 1)
4722 : a0 00 __ LDY #$00
4724 : b1 12 __ LDA (P5),y ; (mode + 0)
4726 : c9 77 __ CMP #$77
4728 : f0 04 __ BEQ $472e ; (fopen.s24 + 0)
.s13:
472a : c9 57 __ CMP #$57
472c : d0 13 __ BNE $4741 ; (fopen.s14 + 0)
.s24:
472e : a9 57 __ LDA #$57
4730 : 9d db fc STA $fcdb,x ; (cbmname[0] + 3)
4733 : a9 40 __ LDA #$40
4735 : 8d d8 fc STA $fcd8 ; (cbmname[0] + 0)
4738 : 8a __ __ TXA
4739 : 69 03 __ ADC #$03
473b : 85 45 __ STA T2 + 0 
473d : c6 46 __ DEC T3 + 0 
473f : f0 2a __ BEQ $476b ; (fopen.s18 + 0)
.s14:
4741 : c9 72 __ CMP #$72
4743 : f0 04 __ BEQ $4749 ; (fopen.s23 + 0)
.s15:
4745 : c9 52 __ CMP #$52
4747 : d0 0e __ BNE $4757 ; (fopen.s16 + 0)
.s23:
4749 : a9 52 __ LDA #$52
.s22:
474b : 9d db fc STA $fcdb,x ; (cbmname[0] + 3)
474e : 8a __ __ TXA
474f : 18 __ __ CLC
4750 : 69 04 __ ADC #$04
4752 : 85 45 __ STA T2 + 0 
4754 : 4c 6b 47 JMP $476b ; (fopen.s18 + 0)
.s16:
4757 : c9 61 __ CMP #$61
4759 : f0 0c __ BEQ $4767 ; (fopen.s21 + 0)
.s17:
475b : 8a __ __ TXA
475c : 18 __ __ CLC
475d : 69 03 __ ADC #$03
475f : 85 45 __ STA T2 + 0 
4761 : b1 12 __ LDA (P5),y ; (mode + 0)
4763 : c9 41 __ CMP #$41
4765 : d0 04 __ BNE $476b ; (fopen.s18 + 0)
.s21:
4767 : a9 41 __ LDA #$41
4769 : d0 e0 __ BNE $474b ; (fopen.s22 + 0)
.s18:
476b : 98 __ __ TYA
476c : a6 45 __ LDX T2 + 0 
476e : 9d d8 fc STA $fcd8,x ; (cbmname[0] + 0)
4771 : 18 __ __ CLC
4772 : a9 d8 __ LDA #$d8
4774 : 65 46 __ ADC T3 + 0 
4776 : 85 0d __ STA P0 
4778 : a9 fc __ LDA #$fc
477a : 69 00 __ ADC #$00
477c : 85 0e __ STA P1 
477e : 20 a1 10 JSR $10a1 ; (krnio_setnam.s4 + 0)
4781 : a5 4c __ LDA T10 + 0 
4783 : 85 0e __ STA P1 
4785 : 18 __ __ CLC
4786 : a5 48 __ LDA T5 + 0 
4788 : 69 02 __ ADC #$02
478a : 85 48 __ STA T5 + 0 
478c : 85 0d __ STA P0 
478e : 85 0f __ STA P2 
4790 : 20 bd 10 JSR $10bd ; (krnio_open.s4 + 0)
4793 : aa __ __ TAX
4794 : d0 03 __ BNE $4799 ; (fopen.s20 + 0)
4796 : 4c 2f 46 JMP $462f ; (fopen.s19 + 0)
.s20:
4799 : a5 48 __ LDA T5 + 0 
479b : a0 00 __ LDY #$00
479d : 91 49 __ STA (T6 + 0),y 
479f : a5 49 __ LDA T6 + 0 
47a1 : 85 1b __ STA ACCU + 0 
47a3 : a5 4a __ LDA T6 + 1 
47a5 : 4c 33 46 JMP $4633 ; (fopen.s3 + 0)
--------------------------------------------------------------------
47a8 : __ __ __ BYT 56 45 52 54 45 58 2c 53 2c 52 00                : VERTEX,S,R.
--------------------------------------------------------------------
47b3 : __ __ __ BYT 72 00                                           : r.
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s1:
47b5 : a2 08 __ LDX #$08
47b7 : b5 53 __ LDA T1 + 0,x 
47b9 : 9d a1 fc STA $fca1,x ; (printf@stack + 0)
47bc : ca __ __ DEX
47bd : 10 f8 __ BPL $47b7 ; (printf.s1 + 2)
.s4:
47bf : ad f8 fc LDA $fcf8 ; (sstack + 0)
47c2 : 85 58 __ STA T5 + 0 
47c4 : a9 fa __ LDA #$fa
47c6 : 85 56 __ STA T3 + 0 
47c8 : a9 fc __ LDA #$fc
47ca : 85 57 __ STA T3 + 1 
47cc : a9 00 __ LDA #$00
47ce : 85 5b __ STA T7 + 0 
47d0 : ad f9 fc LDA $fcf9 ; (sstack + 1)
47d3 : 85 59 __ STA T5 + 1 
.l5:
47d5 : a0 00 __ LDY #$00
47d7 : b1 58 __ LDA (T5 + 0),y 
47d9 : d0 16 __ BNE $47f1 ; (printf.s8 + 0)
.s6:
47db : a6 5b __ LDX T7 + 0 
47dd : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
47e0 : 8a __ __ TXA
47e1 : f0 03 __ BEQ $47e6 ; (printf.s3 + 0)
.s7:
47e3 : 20 1a 4b JSR $4b1a ; (puts@proxy + 0)
.s3:
47e6 : a2 08 __ LDX #$08
47e8 : bd a1 fc LDA $fca1,x ; (printf@stack + 0)
47eb : 95 53 __ STA T1 + 0,x 
47ed : ca __ __ DEX
47ee : 10 f8 __ BPL $47e8 ; (printf.s3 + 2)
47f0 : 60 __ __ RTS
.s8:
47f1 : c9 25 __ CMP #$25
47f3 : f0 28 __ BEQ $481d ; (printf.s12 + 0)
.s9:
47f5 : a6 5b __ LDX T7 + 0 
47f7 : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
47fa : e6 58 __ INC T5 + 0 
47fc : d0 02 __ BNE $4800 ; (printf.s110 + 0)
.s109:
47fe : e6 59 __ INC T5 + 1 
.s110:
4800 : e8 __ __ INX
4801 : 86 5b __ STX T7 + 0 
4803 : e0 28 __ CPX #$28
4805 : 90 ce __ BCC $47d5 ; (printf.l5 + 0)
.s10:
4807 : a9 b6 __ LDA #$b6
4809 : 85 0d __ STA P0 
480b : a9 fc __ LDA #$fc
480d : 85 0e __ STA P1 
480f : 98 __ __ TYA
4810 : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
.s11:
4813 : 20 22 4b JSR $4b22 ; (puts.l4 + 0)
4816 : a9 00 __ LDA #$00
.s92:
4818 : 85 5b __ STA T7 + 0 
481a : 4c d5 47 JMP $47d5 ; (printf.l5 + 0)
.s12:
481d : a5 5b __ LDA T7 + 0 
481f : f0 0c __ BEQ $482d ; (printf.s13 + 0)
.s84:
4821 : aa __ __ TAX
4822 : 98 __ __ TYA
4823 : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
4826 : 20 1a 4b JSR $4b1a ; (puts@proxy + 0)
4829 : a9 00 __ LDA #$00
482b : 85 5b __ STA T7 + 0 
.s13:
482d : 8d b3 fc STA $fcb3 ; (si.sign + 0)
4830 : 8d b4 fc STA $fcb4 ; (si.left + 0)
4833 : 8d b5 fc STA $fcb5 ; (si.prefix + 0)
4836 : a0 01 __ LDY #$01
4838 : b1 58 __ LDA (T5 + 0),y 
483a : a2 20 __ LDX #$20
483c : 8e ae fc STX $fcae ; (si.fill + 0)
483f : a2 00 __ LDX #$00
4841 : 8e af fc STX $fcaf ; (si.width + 0)
4844 : ca __ __ DEX
4845 : 8e b0 fc STX $fcb0 ; (si.precision + 0)
4848 : a2 0a __ LDX #$0a
484a : 8e b2 fc STX $fcb2 ; (si.base + 0)
484d : aa __ __ TAX
484e : a9 02 __ LDA #$02
4850 : d0 07 __ BNE $4859 ; (printf.l14 + 0)
.s80:
4852 : a0 00 __ LDY #$00
4854 : b1 58 __ LDA (T5 + 0),y 
4856 : aa __ __ TAX
4857 : a9 01 __ LDA #$01
.l14:
4859 : 18 __ __ CLC
485a : 65 58 __ ADC T5 + 0 
485c : 85 58 __ STA T5 + 0 
485e : 90 02 __ BCC $4862 ; (printf.s96 + 0)
.s95:
4860 : e6 59 __ INC T5 + 1 
.s96:
4862 : 8a __ __ TXA
4863 : e0 2b __ CPX #$2b
4865 : d0 07 __ BNE $486e ; (printf.s15 + 0)
.s83:
4867 : a9 01 __ LDA #$01
4869 : 8d b3 fc STA $fcb3 ; (si.sign + 0)
486c : d0 e4 __ BNE $4852 ; (printf.s80 + 0)
.s15:
486e : c9 30 __ CMP #$30
4870 : d0 06 __ BNE $4878 ; (printf.s16 + 0)
.s82:
4872 : 8d ae fc STA $fcae ; (si.fill + 0)
4875 : 4c 52 48 JMP $4852 ; (printf.s80 + 0)
.s16:
4878 : c9 23 __ CMP #$23
487a : d0 07 __ BNE $4883 ; (printf.s17 + 0)
.s81:
487c : a9 01 __ LDA #$01
487e : 8d b5 fc STA $fcb5 ; (si.prefix + 0)
4881 : d0 cf __ BNE $4852 ; (printf.s80 + 0)
.s17:
4883 : c9 2d __ CMP #$2d
4885 : d0 07 __ BNE $488e ; (printf.s18 + 0)
.s79:
4887 : a9 01 __ LDA #$01
4889 : 8d b4 fc STA $fcb4 ; (si.left + 0)
488c : d0 c4 __ BNE $4852 ; (printf.s80 + 0)
.s18:
488e : 85 55 __ STA T2 + 0 
4890 : c9 30 __ CMP #$30
4892 : 90 33 __ BCC $48c7 ; (printf.s19 + 0)
.s74:
4894 : c9 3a __ CMP #$3a
4896 : b0 60 __ BCS $48f8 ; (printf.s20 + 0)
.s75:
4898 : a0 00 __ LDY #$00
489a : 84 43 __ STY T0 + 0 
489c : c9 3a __ CMP #$3a
489e : b0 22 __ BCS $48c2 ; (printf.s77 + 0)
.l78:
48a0 : a5 43 __ LDA T0 + 0 
48a2 : 0a __ __ ASL
48a3 : 0a __ __ ASL
48a4 : 18 __ __ CLC
48a5 : 65 43 __ ADC T0 + 0 
48a7 : 0a __ __ ASL
48a8 : 18 __ __ CLC
48a9 : 65 55 __ ADC T2 + 0 
48ab : 38 __ __ SEC
48ac : e9 30 __ SBC #$30
48ae : 85 43 __ STA T0 + 0 
48b0 : b1 58 __ LDA (T5 + 0),y 
48b2 : 85 55 __ STA T2 + 0 
48b4 : e6 58 __ INC T5 + 0 
48b6 : d0 02 __ BNE $48ba ; (printf.s108 + 0)
.s107:
48b8 : e6 59 __ INC T5 + 1 
.s108:
48ba : c9 30 __ CMP #$30
48bc : 90 04 __ BCC $48c2 ; (printf.s77 + 0)
.s76:
48be : c9 3a __ CMP #$3a
48c0 : 90 de __ BCC $48a0 ; (printf.l78 + 0)
.s77:
48c2 : a6 43 __ LDX T0 + 0 
48c4 : 8e af fc STX $fcaf ; (si.width + 0)
.s19:
48c7 : c9 2e __ CMP #$2e
48c9 : d0 2d __ BNE $48f8 ; (printf.s20 + 0)
.s69:
48cb : a9 00 __ LDA #$00
48cd : f0 0e __ BEQ $48dd ; (printf.l70 + 0)
.s73:
48cf : a5 43 __ LDA T0 + 0 
48d1 : 0a __ __ ASL
48d2 : 0a __ __ ASL
48d3 : 18 __ __ CLC
48d4 : 65 43 __ ADC T0 + 0 
48d6 : 0a __ __ ASL
48d7 : 18 __ __ CLC
48d8 : 65 55 __ ADC T2 + 0 
48da : 38 __ __ SEC
48db : e9 30 __ SBC #$30
.l70:
48dd : 85 43 __ STA T0 + 0 
48df : a0 00 __ LDY #$00
48e1 : b1 58 __ LDA (T5 + 0),y 
48e3 : 85 55 __ STA T2 + 0 
48e5 : e6 58 __ INC T5 + 0 
48e7 : d0 02 __ BNE $48eb ; (printf.s98 + 0)
.s97:
48e9 : e6 59 __ INC T5 + 1 
.s98:
48eb : c9 30 __ CMP #$30
48ed : 90 04 __ BCC $48f3 ; (printf.s71 + 0)
.s72:
48ef : c9 3a __ CMP #$3a
48f1 : 90 dc __ BCC $48cf ; (printf.s73 + 0)
.s71:
48f3 : a6 43 __ LDX T0 + 0 
48f5 : 8e b0 fc STX $fcb0 ; (si.precision + 0)
.s20:
48f8 : c9 64 __ CMP #$64
48fa : f0 0c __ BEQ $4908 ; (printf.s68 + 0)
.s21:
48fc : c9 44 __ CMP #$44
48fe : f0 08 __ BEQ $4908 ; (printf.s68 + 0)
.s22:
4900 : c9 69 __ CMP #$69
4902 : f0 04 __ BEQ $4908 ; (printf.s68 + 0)
.s23:
4904 : c9 49 __ CMP #$49
4906 : d0 11 __ BNE $4919 ; (printf.s24 + 0)
.s68:
4908 : a0 00 __ LDY #$00
490a : b1 56 __ LDA (T3 + 0),y 
490c : 85 11 __ STA P4 
490e : c8 __ __ INY
490f : b1 56 __ LDA (T3 + 0),y 
4911 : 85 12 __ STA P5 
4913 : 98 __ __ TYA
.s90:
4914 : 85 13 __ STA P6 
4916 : 4c 00 4b JMP $4b00 ; (printf.s66 + 0)
.s24:
4919 : c9 75 __ CMP #$75
491b : f0 04 __ BEQ $4921 ; (printf.s67 + 0)
.s25:
491d : c9 55 __ CMP #$55
491f : d0 0f __ BNE $4930 ; (printf.s26 + 0)
.s67:
4921 : a0 00 __ LDY #$00
4923 : b1 56 __ LDA (T3 + 0),y 
4925 : 85 11 __ STA P4 
4927 : c8 __ __ INY
4928 : b1 56 __ LDA (T3 + 0),y 
492a : 85 12 __ STA P5 
492c : a9 00 __ LDA #$00
492e : f0 e4 __ BEQ $4914 ; (printf.s90 + 0)
.s26:
4930 : c9 78 __ CMP #$78
4932 : f0 04 __ BEQ $4938 ; (printf.s65 + 0)
.s27:
4934 : c9 58 __ CMP #$58
4936 : d0 1e __ BNE $4956 ; (printf.s28 + 0)
.s65:
4938 : a0 00 __ LDY #$00
493a : 84 13 __ STY P6 
493c : a9 10 __ LDA #$10
493e : 8d b2 fc STA $fcb2 ; (si.base + 0)
4941 : b1 56 __ LDA (T3 + 0),y 
4943 : 85 11 __ STA P4 
4945 : c8 __ __ INY
4946 : b1 56 __ LDA (T3 + 0),y 
4948 : 85 12 __ STA P5 
494a : a5 55 __ LDA T2 + 0 
494c : 29 e0 __ AND #$e0
494e : 09 01 __ ORA #$01
4950 : 8d b1 fc STA $fcb1 ; (si.cha + 0)
4953 : 4c 00 4b JMP $4b00 ; (printf.s66 + 0)
.s28:
4956 : c9 6c __ CMP #$6c
4958 : d0 03 __ BNE $495d ; (printf.s29 + 0)
495a : 4c 85 4a JMP $4a85 ; (printf.s53 + 0)
.s29:
495d : c9 4c __ CMP #$4c
495f : f0 f9 __ BEQ $495a ; (printf.s28 + 4)
.s30:
4961 : c9 66 __ CMP #$66
4963 : f0 14 __ BEQ $4979 ; (printf.s52 + 0)
.s31:
4965 : c9 67 __ CMP #$67
4967 : f0 10 __ BEQ $4979 ; (printf.s52 + 0)
.s32:
4969 : c9 65 __ CMP #$65
496b : f0 0c __ BEQ $4979 ; (printf.s52 + 0)
.s33:
496d : c9 46 __ CMP #$46
496f : f0 08 __ BEQ $4979 ; (printf.s52 + 0)
.s34:
4971 : c9 47 __ CMP #$47
4973 : f0 04 __ BEQ $4979 ; (printf.s52 + 0)
.s35:
4975 : c9 45 __ CMP #$45
4977 : d0 44 __ BNE $49bd ; (printf.s36 + 0)
.s52:
4979 : a9 b6 __ LDA #$b6
497b : 85 0f __ STA P2 
497d : a9 fc __ LDA #$fc
497f : 85 10 __ STA P3 
4981 : a0 00 __ LDY #$00
4983 : b1 56 __ LDA (T3 + 0),y 
4985 : 85 11 __ STA P4 
4987 : c8 __ __ INY
4988 : b1 56 __ LDA (T3 + 0),y 
498a : 85 12 __ STA P5 
498c : c8 __ __ INY
498d : b1 56 __ LDA (T3 + 0),y 
498f : 85 13 __ STA P6 
4991 : c8 __ __ INY
4992 : b1 56 __ LDA (T3 + 0),y 
4994 : 85 14 __ STA P7 
4996 : a5 55 __ LDA T2 + 0 
4998 : 29 e0 __ AND #$e0
499a : 09 01 __ ORA #$01
499c : 8d b1 fc STA $fcb1 ; (si.cha + 0)
499f : a9 ae __ LDA #$ae
49a1 : 85 0d __ STA P0 
49a3 : a9 fc __ LDA #$fc
49a5 : 85 0e __ STA P1 
49a7 : a5 55 __ LDA T2 + 0 
49a9 : ed b1 fc SBC $fcb1 ; (si.cha + 0)
49ac : 18 __ __ CLC
49ad : 69 61 __ ADC #$61
49af : 85 15 __ STA P8 
49b1 : 20 bd 4d JSR $4dbd ; (nformf.s1 + 0)
49b4 : a5 1b __ LDA ACCU + 0 ; (fmt + 2)
49b6 : 85 5b __ STA T7 + 0 
49b8 : a9 04 __ LDA #$04
49ba : 4c 79 4a JMP $4a79 ; (printf.s89 + 0)
.s36:
49bd : c9 73 __ CMP #$73
49bf : f0 2d __ BEQ $49ee ; (printf.s44 + 0)
.s37:
49c1 : c9 53 __ CMP #$53
49c3 : f0 29 __ BEQ $49ee ; (printf.s44 + 0)
.s38:
49c5 : c9 63 __ CMP #$63
49c7 : f0 12 __ BEQ $49db ; (printf.s43 + 0)
.s39:
49c9 : c9 43 __ CMP #$43
49cb : f0 0e __ BEQ $49db ; (printf.s43 + 0)
.s40:
49cd : aa __ __ TAX
49ce : d0 03 __ BNE $49d3 ; (printf.s41 + 0)
49d0 : 4c d5 47 JMP $47d5 ; (printf.l5 + 0)
.s41:
49d3 : 8d b6 fc STA $fcb6 ; (buff[0] + 0)
.s42:
49d6 : a9 01 __ LDA #$01
49d8 : 4c 18 48 JMP $4818 ; (printf.s92 + 0)
.s43:
49db : a0 00 __ LDY #$00
49dd : b1 56 __ LDA (T3 + 0),y 
49df : 8d b6 fc STA $fcb6 ; (buff[0] + 0)
49e2 : a5 56 __ LDA T3 + 0 
49e4 : 69 01 __ ADC #$01
49e6 : 85 56 __ STA T3 + 0 
49e8 : 90 ec __ BCC $49d6 ; (printf.s42 + 0)
.s106:
49ea : e6 57 __ INC T3 + 1 
49ec : b0 e8 __ BCS $49d6 ; (printf.s42 + 0)
.s44:
49ee : a0 00 __ LDY #$00
49f0 : 84 5a __ STY T6 + 0 
49f2 : b1 56 __ LDA (T3 + 0),y 
49f4 : 85 53 __ STA T1 + 0 
49f6 : c8 __ __ INY
49f7 : b1 56 __ LDA (T3 + 0),y 
49f9 : 85 54 __ STA T1 + 1 
49fb : a5 56 __ LDA T3 + 0 
49fd : 69 01 __ ADC #$01
49ff : 85 56 __ STA T3 + 0 
4a01 : 90 02 __ BCC $4a05 ; (printf.s105 + 0)
.s104:
4a03 : e6 57 __ INC T3 + 1 
.s105:
4a05 : ad af fc LDA $fcaf ; (si.width + 0)
4a08 : f0 0d __ BEQ $4a17 ; (printf.s45 + 0)
.s93:
4a0a : a0 00 __ LDY #$00
4a0c : b1 53 __ LDA (T1 + 0),y 
4a0e : f0 05 __ BEQ $4a15 ; (printf.s94 + 0)
.l51:
4a10 : c8 __ __ INY
4a11 : b1 53 __ LDA (T1 + 0),y 
4a13 : d0 fb __ BNE $4a10 ; (printf.l51 + 0)
.s94:
4a15 : 84 5a __ STY T6 + 0 
.s45:
4a17 : ad b4 fc LDA $fcb4 ; (si.left + 0)
4a1a : 85 55 __ STA T2 + 0 
4a1c : d0 07 __ BNE $4a25 ; (printf.s47 + 0)
.s46:
4a1e : a4 5a __ LDY T6 + 0 
4a20 : cc af fc CPY $fcaf ; (si.width + 0)
4a23 : 90 2a __ BCC $4a4f ; (printf.s50 + 0)
.s47:
4a25 : a5 53 __ LDA T1 + 0 
4a27 : 85 0d __ STA P0 
4a29 : a5 54 __ LDA T1 + 1 
4a2b : 85 0e __ STA P1 
4a2d : 20 22 4b JSR $4b22 ; (puts.l4 + 0)
4a30 : a5 55 __ LDA T2 + 0 
4a32 : f0 9c __ BEQ $49d0 ; (printf.s40 + 3)
.s48:
4a34 : a4 5a __ LDY T6 + 0 
4a36 : cc af fc CPY $fcaf ; (si.width + 0)
4a39 : b0 95 __ BCS $49d0 ; (printf.s40 + 3)
.s49:
4a3b : ad ae fc LDA $fcae ; (si.fill + 0)
4a3e : a2 00 __ LDX #$00
.l87:
4a40 : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
4a43 : e8 __ __ INX
4a44 : c8 __ __ INY
4a45 : cc af fc CPY $fcaf ; (si.width + 0)
4a48 : 90 f6 __ BCC $4a40 ; (printf.l87 + 0)
.s85:
4a4a : 86 5b __ STX T7 + 0 
4a4c : 4c d5 47 JMP $47d5 ; (printf.l5 + 0)
.s50:
4a4f : ad ae fc LDA $fcae ; (si.fill + 0)
4a52 : a2 00 __ LDX #$00
.l88:
4a54 : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
4a57 : e8 __ __ INX
4a58 : c8 __ __ INY
4a59 : cc af fc CPY $fcaf ; (si.width + 0)
4a5c : 90 f6 __ BCC $4a54 ; (printf.l88 + 0)
.s86:
4a5e : a9 b6 __ LDA #$b6
4a60 : 85 0d __ STA P0 
4a62 : a9 fc __ LDA #$fc
4a64 : 85 0e __ STA P1 
4a66 : a9 00 __ LDA #$00
4a68 : 9d b6 fc STA $fcb6,x ; (buff[0] + 0)
4a6b : 20 22 4b JSR $4b22 ; (puts.l4 + 0)
4a6e : a5 53 __ LDA T1 + 0 
4a70 : 85 0d __ STA P0 
4a72 : a5 54 __ LDA T1 + 1 
4a74 : 85 0e __ STA P1 
4a76 : 4c 13 48 JMP $4813 ; (printf.s11 + 0)
.s89:
4a79 : 18 __ __ CLC
4a7a : 65 56 __ ADC T3 + 0 
4a7c : 85 56 __ STA T3 + 0 
4a7e : 90 cc __ BCC $4a4c ; (printf.s85 + 2)
.s99:
4a80 : e6 57 __ INC T3 + 1 
4a82 : 4c d5 47 JMP $47d5 ; (printf.l5 + 0)
.s53:
4a85 : a0 00 __ LDY #$00
4a87 : b1 56 __ LDA (T3 + 0),y 
4a89 : 85 11 __ STA P4 
4a8b : c8 __ __ INY
4a8c : b1 56 __ LDA (T3 + 0),y 
4a8e : 85 12 __ STA P5 
4a90 : c8 __ __ INY
4a91 : b1 56 __ LDA (T3 + 0),y 
4a93 : 85 13 __ STA P6 
4a95 : c8 __ __ INY
4a96 : b1 56 __ LDA (T3 + 0),y 
4a98 : 85 14 __ STA P7 
4a9a : a5 56 __ LDA T3 + 0 
4a9c : 69 03 __ ADC #$03
4a9e : 85 56 __ STA T3 + 0 
4aa0 : 90 02 __ BCC $4aa4 ; (printf.s101 + 0)
.s100:
4aa2 : e6 57 __ INC T3 + 1 
.s101:
4aa4 : a0 00 __ LDY #$00
4aa6 : b1 58 __ LDA (T5 + 0),y 
4aa8 : aa __ __ TAX
4aa9 : e6 58 __ INC T5 + 0 
4aab : d0 02 __ BNE $4aaf ; (printf.s103 + 0)
.s102:
4aad : e6 59 __ INC T5 + 1 
.s103:
4aaf : e0 64 __ CPX #$64
4ab1 : f0 0c __ BEQ $4abf ; (printf.s64 + 0)
.s54:
4ab3 : e0 44 __ CPX #$44
4ab5 : f0 08 __ BEQ $4abf ; (printf.s64 + 0)
.s55:
4ab7 : e0 69 __ CPX #$69
4ab9 : f0 04 __ BEQ $4abf ; (printf.s64 + 0)
.s56:
4abb : e0 49 __ CPX #$49
4abd : d0 1c __ BNE $4adb ; (printf.s57 + 0)
.s64:
4abf : a9 01 __ LDA #$01
.s91:
4ac1 : 85 15 __ STA P8 
.s62:
4ac3 : a9 b6 __ LDA #$b6
4ac5 : 85 0f __ STA P2 
4ac7 : a9 fc __ LDA #$fc
4ac9 : 85 0e __ STA P1 
4acb : a9 fc __ LDA #$fc
4acd : 85 10 __ STA P3 
4acf : a9 ae __ LDA #$ae
4ad1 : 85 0d __ STA P0 
4ad3 : 20 73 4c JSR $4c73 ; (nforml.s4 + 0)
4ad6 : a5 1b __ LDA ACCU + 0 ; (fmt + 2)
4ad8 : 4c 18 48 JMP $4818 ; (printf.s92 + 0)
.s57:
4adb : e0 75 __ CPX #$75
4add : f0 04 __ BEQ $4ae3 ; (printf.s63 + 0)
.s58:
4adf : e0 55 __ CPX #$55
4ae1 : d0 03 __ BNE $4ae6 ; (printf.s59 + 0)
.s63:
4ae3 : 98 __ __ TYA
4ae4 : f0 db __ BEQ $4ac1 ; (printf.s91 + 0)
.s59:
4ae6 : e0 78 __ CPX #$78
4ae8 : f0 04 __ BEQ $4aee ; (printf.s61 + 0)
.s60:
4aea : e0 58 __ CPX #$58
4aec : d0 94 __ BNE $4a82 ; (printf.s99 + 2)
.s61:
4aee : 84 15 __ STY P8 
4af0 : a9 10 __ LDA #$10
4af2 : 8d b2 fc STA $fcb2 ; (si.base + 0)
4af5 : 8a __ __ TXA
4af6 : 29 e0 __ AND #$e0
4af8 : 09 01 __ ORA #$01
4afa : 8d b1 fc STA $fcb1 ; (si.cha + 0)
4afd : 4c c3 4a JMP $4ac3 ; (printf.s62 + 0)
.s66:
4b00 : a9 b6 __ LDA #$b6
4b02 : 85 0f __ STA P2 
4b04 : a9 fc __ LDA #$fc
4b06 : 85 0e __ STA P1 
4b08 : a9 fc __ LDA #$fc
4b0a : 85 10 __ STA P3 
4b0c : a9 ae __ LDA #$ae
4b0e : 85 0d __ STA P0 
4b10 : 20 58 4b JSR $4b58 ; (nformi.s4 + 0)
4b13 : 85 5b __ STA T7 + 0 
4b15 : a9 02 __ LDA #$02
4b17 : 4c 79 4a JMP $4a79 ; (printf.s89 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
4b1a : a9 b6 __ LDA #$b6
4b1c : 85 0d __ STA P0 
4b1e : a9 fc __ LDA #$fc
4b20 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "D:/Arbeit/dev/oscar64/include/stdio.h"
.l4:
4b22 : a0 00 __ LDY #$00
4b24 : b1 0d __ LDA (P0),y ; (str + 0)
4b26 : d0 01 __ BNE $4b29 ; (puts.s5 + 0)
.s3:
4b28 : 60 __ __ RTS
.s5:
4b29 : e6 0d __ INC P0 ; (str + 0)
4b2b : d0 02 __ BNE $4b2f ; (puts.s12 + 0)
.s11:
4b2d : e6 0e __ INC P1 ; (str + 1)
.s12:
4b2f : c9 0a __ CMP #$0a
4b31 : d0 08 __ BNE $4b3b ; (puts.s6 + 0)
.s9:
4b33 : a9 0d __ LDA #$0d
.s10:
4b35 : 20 f1 10 JSR $10f1 ; (bsout + 0)
4b38 : 4c 22 4b JMP $4b22 ; (puts.l4 + 0)
.s6:
4b3b : c9 09 __ CMP #$09
4b3d : d0 f6 __ BNE $4b35 ; (puts.s10 + 0)
.s7:
4b3f : a5 ca __ LDA $ca 
4b41 : 29 03 __ AND #$03
4b43 : 85 43 __ STA T0 + 0 
4b45 : a9 20 __ LDA #$20
4b47 : 85 44 __ STA T1 + 0 
.l8:
4b49 : a5 44 __ LDA T1 + 0 
4b4b : 20 f1 10 JSR $10f1 ; (bsout + 0)
4b4e : e6 43 __ INC T0 + 0 
4b50 : a5 43 __ LDA T0 + 0 
4b52 : c9 04 __ CMP #$04
4b54 : 90 f3 __ BCC $4b49 ; (puts.l8 + 0)
4b56 : b0 ca __ BCS $4b22 ; (puts.l4 + 0)
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s4:
4b58 : a9 00 __ LDA #$00
4b5a : 85 43 __ STA T5 + 0 
4b5c : a0 04 __ LDY #$04
4b5e : b1 0d __ LDA (P0),y ; (si + 0)
4b60 : 85 44 __ STA T6 + 0 
4b62 : a5 13 __ LDA P6 ; (s + 0)
4b64 : f0 13 __ BEQ $4b79 ; (nformi.s5 + 0)
.s33:
4b66 : 24 12 __ BIT P5 ; (v + 1)
4b68 : 10 0f __ BPL $4b79 ; (nformi.s5 + 0)
.s34:
4b6a : 38 __ __ SEC
4b6b : a9 00 __ LDA #$00
4b6d : e5 11 __ SBC P4 ; (v + 0)
4b6f : 85 11 __ STA P4 ; (v + 0)
4b71 : a9 00 __ LDA #$00
4b73 : e5 12 __ SBC P5 ; (v + 1)
4b75 : 85 12 __ STA P5 ; (v + 1)
4b77 : e6 43 __ INC T5 + 0 
.s5:
4b79 : a9 10 __ LDA #$10
4b7b : 85 45 __ STA T7 + 0 
4b7d : a5 11 __ LDA P4 ; (v + 0)
4b7f : 05 12 __ ORA P5 ; (v + 1)
4b81 : f0 33 __ BEQ $4bb6 ; (nformi.s6 + 0)
.s28:
4b83 : a5 11 __ LDA P4 ; (v + 0)
4b85 : 85 1b __ STA ACCU + 0 
4b87 : a5 12 __ LDA P5 ; (v + 1)
4b89 : 85 1c __ STA ACCU + 1 
.l29:
4b8b : a5 44 __ LDA T6 + 0 
4b8d : 85 03 __ STA WORK + 0 
4b8f : a9 00 __ LDA #$00
4b91 : 85 04 __ STA WORK + 1 
4b93 : 20 cb 69 JSR $69cb ; (divmod + 0)
4b96 : a5 05 __ LDA WORK + 2 
4b98 : c9 0a __ CMP #$0a
4b9a : b0 04 __ BCS $4ba0 ; (nformi.s32 + 0)
.s30:
4b9c : a9 30 __ LDA #$30
4b9e : 90 06 __ BCC $4ba6 ; (nformi.s31 + 0)
.s32:
4ba0 : a0 03 __ LDY #$03
4ba2 : b1 0d __ LDA (P0),y ; (si + 0)
4ba4 : e9 0a __ SBC #$0a
.s31:
4ba6 : 18 __ __ CLC
4ba7 : 65 05 __ ADC WORK + 2 
4ba9 : a6 45 __ LDX T7 + 0 
4bab : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4bae : c6 45 __ DEC T7 + 0 
4bb0 : a5 1b __ LDA ACCU + 0 
4bb2 : 05 1c __ ORA ACCU + 1 
4bb4 : d0 d5 __ BNE $4b8b ; (nformi.l29 + 0)
.s6:
4bb6 : a0 02 __ LDY #$02
4bb8 : b1 0d __ LDA (P0),y ; (si + 0)
4bba : c9 ff __ CMP #$ff
4bbc : d0 04 __ BNE $4bc2 ; (nformi.s27 + 0)
.s7:
4bbe : a9 0f __ LDA #$0f
4bc0 : d0 05 __ BNE $4bc7 ; (nformi.s39 + 0)
.s27:
4bc2 : 38 __ __ SEC
4bc3 : a9 10 __ LDA #$10
4bc5 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
4bc7 : a8 __ __ TAY
4bc8 : c4 45 __ CPY T7 + 0 
4bca : b0 0d __ BCS $4bd9 ; (nformi.s8 + 0)
.s26:
4bcc : a9 30 __ LDA #$30
.l40:
4bce : a6 45 __ LDX T7 + 0 
4bd0 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4bd3 : c6 45 __ DEC T7 + 0 
4bd5 : c4 45 __ CPY T7 + 0 
4bd7 : 90 f5 __ BCC $4bce ; (nformi.l40 + 0)
.s8:
4bd9 : a0 07 __ LDY #$07
4bdb : b1 0d __ LDA (P0),y ; (si + 0)
4bdd : f0 1c __ BEQ $4bfb ; (nformi.s9 + 0)
.s24:
4bdf : a5 44 __ LDA T6 + 0 
4be1 : c9 10 __ CMP #$10
4be3 : d0 16 __ BNE $4bfb ; (nformi.s9 + 0)
.s25:
4be5 : a0 03 __ LDY #$03
4be7 : b1 0d __ LDA (P0),y ; (si + 0)
4be9 : a8 __ __ TAY
4bea : a9 30 __ LDA #$30
4bec : a6 45 __ LDX T7 + 0 
4bee : 9d e6 fc STA $fce6,x ; (buff[0] + 48)
4bf1 : 98 __ __ TYA
4bf2 : 69 16 __ ADC #$16
4bf4 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4bf7 : ca __ __ DEX
4bf8 : ca __ __ DEX
4bf9 : 86 45 __ STX T7 + 0 
.s9:
4bfb : a9 00 __ LDA #$00
4bfd : 85 1b __ STA ACCU + 0 
4bff : a5 43 __ LDA T5 + 0 
4c01 : f0 0c __ BEQ $4c0f ; (nformi.s10 + 0)
.s23:
4c03 : a9 2d __ LDA #$2d
.s22:
4c05 : a6 45 __ LDX T7 + 0 
4c07 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4c0a : c6 45 __ DEC T7 + 0 
4c0c : 4c 19 4c JMP $4c19 ; (nformi.s11 + 0)
.s10:
4c0f : a0 05 __ LDY #$05
4c11 : b1 0d __ LDA (P0),y ; (si + 0)
4c13 : f0 04 __ BEQ $4c19 ; (nformi.s11 + 0)
.s21:
4c15 : a9 2b __ LDA #$2b
4c17 : d0 ec __ BNE $4c05 ; (nformi.s22 + 0)
.s11:
4c19 : a6 45 __ LDX T7 + 0 
4c1b : a0 06 __ LDY #$06
4c1d : b1 0d __ LDA (P0),y ; (si + 0)
4c1f : d0 2b __ BNE $4c4c ; (nformi.s17 + 0)
.l12:
4c21 : 8a __ __ TXA
4c22 : 18 __ __ CLC
4c23 : a0 01 __ LDY #$01
4c25 : 71 0d __ ADC (P0),y ; (si + 0)
4c27 : b0 04 __ BCS $4c2d ; (nformi.s15 + 0)
.s16:
4c29 : c9 11 __ CMP #$11
4c2b : 90 0a __ BCC $4c37 ; (nformi.s13 + 0)
.s15:
4c2d : a0 00 __ LDY #$00
4c2f : b1 0d __ LDA (P0),y ; (si + 0)
4c31 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4c34 : ca __ __ DEX
4c35 : b0 ea __ BCS $4c21 ; (nformi.l12 + 0)
.s13:
4c37 : e0 10 __ CPX #$10
4c39 : b0 0e __ BCS $4c49 ; (nformi.s41 + 0)
.s14:
4c3b : 88 __ __ DEY
.l37:
4c3c : bd e8 fc LDA $fce8,x ; (buffer[0] + 0)
4c3f : 91 0f __ STA (P2),y ; (str + 0)
4c41 : c8 __ __ INY
4c42 : e8 __ __ INX
4c43 : e0 10 __ CPX #$10
4c45 : 90 f5 __ BCC $4c3c ; (nformi.l37 + 0)
.s38:
4c47 : 84 1b __ STY ACCU + 0 
.s41:
4c49 : a5 1b __ LDA ACCU + 0 
.s3:
4c4b : 60 __ __ RTS
.s17:
4c4c : e0 10 __ CPX #$10
4c4e : b0 1a __ BCS $4c6a ; (nformi.l18 + 0)
.s20:
4c50 : a0 00 __ LDY #$00
.l35:
4c52 : bd e8 fc LDA $fce8,x ; (buffer[0] + 0)
4c55 : 91 0f __ STA (P2),y ; (str + 0)
4c57 : c8 __ __ INY
4c58 : e8 __ __ INX
4c59 : e0 10 __ CPX #$10
4c5b : 90 f5 __ BCC $4c52 ; (nformi.l35 + 0)
.s36:
4c5d : 84 1b __ STY ACCU + 0 
4c5f : b0 09 __ BCS $4c6a ; (nformi.l18 + 0)
.s19:
4c61 : 88 __ __ DEY
4c62 : b1 0d __ LDA (P0),y ; (si + 0)
4c64 : a4 1b __ LDY ACCU + 0 
4c66 : 91 0f __ STA (P2),y ; (str + 0)
4c68 : e6 1b __ INC ACCU + 0 
.l18:
4c6a : a5 1b __ LDA ACCU + 0 
4c6c : a0 01 __ LDY #$01
4c6e : d1 0d __ CMP (P0),y ; (si + 0)
4c70 : 90 ef __ BCC $4c61 ; (nformi.s19 + 0)
4c72 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s4:
4c73 : a9 00 __ LDA #$00
4c75 : 85 43 __ STA T4 + 0 
4c77 : a5 15 __ LDA P8 ; (s + 0)
4c79 : f0 1f __ BEQ $4c9a ; (nforml.s5 + 0)
.s35:
4c7b : 24 14 __ BIT P7 ; (v + 3)
4c7d : 10 1b __ BPL $4c9a ; (nforml.s5 + 0)
.s36:
4c7f : 38 __ __ SEC
4c80 : a9 00 __ LDA #$00
4c82 : e5 11 __ SBC P4 ; (v + 0)
4c84 : 85 11 __ STA P4 ; (v + 0)
4c86 : a9 00 __ LDA #$00
4c88 : e5 12 __ SBC P5 ; (v + 1)
4c8a : 85 12 __ STA P5 ; (v + 1)
4c8c : a9 00 __ LDA #$00
4c8e : e5 13 __ SBC P6 ; (v + 2)
4c90 : 85 13 __ STA P6 ; (v + 2)
4c92 : a9 00 __ LDA #$00
4c94 : e5 14 __ SBC P7 ; (v + 3)
4c96 : 85 14 __ STA P7 ; (v + 3)
4c98 : e6 43 __ INC T4 + 0 
.s5:
4c9a : a9 10 __ LDA #$10
4c9c : 85 44 __ STA T5 + 0 
4c9e : a5 14 __ LDA P7 ; (v + 3)
4ca0 : f0 03 __ BEQ $4ca5 ; (nforml.s31 + 0)
4ca2 : 4c 6d 4d JMP $4d6d ; (nforml.l28 + 0)
.s31:
4ca5 : a5 13 __ LDA P6 ; (v + 2)
4ca7 : d0 f9 __ BNE $4ca2 ; (nforml.s5 + 8)
.s32:
4ca9 : a5 12 __ LDA P5 ; (v + 1)
4cab : d0 f5 __ BNE $4ca2 ; (nforml.s5 + 8)
.s33:
4cad : c5 11 __ CMP P4 ; (v + 0)
4caf : 90 f1 __ BCC $4ca2 ; (nforml.s5 + 8)
.s6:
4cb1 : a0 02 __ LDY #$02
4cb3 : b1 0d __ LDA (P0),y ; (si + 0)
4cb5 : c9 ff __ CMP #$ff
4cb7 : d0 04 __ BNE $4cbd ; (nforml.s27 + 0)
.s7:
4cb9 : a9 0f __ LDA #$0f
4cbb : d0 05 __ BNE $4cc2 ; (nforml.s41 + 0)
.s27:
4cbd : 38 __ __ SEC
4cbe : a9 10 __ LDA #$10
4cc0 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
4cc2 : a8 __ __ TAY
4cc3 : c4 44 __ CPY T5 + 0 
4cc5 : b0 0d __ BCS $4cd4 ; (nforml.s8 + 0)
.s26:
4cc7 : a9 30 __ LDA #$30
.l42:
4cc9 : a6 44 __ LDX T5 + 0 
4ccb : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4cce : c6 44 __ DEC T5 + 0 
4cd0 : c4 44 __ CPY T5 + 0 
4cd2 : 90 f5 __ BCC $4cc9 ; (nforml.l42 + 0)
.s8:
4cd4 : a0 07 __ LDY #$07
4cd6 : b1 0d __ LDA (P0),y ; (si + 0)
4cd8 : f0 1d __ BEQ $4cf7 ; (nforml.s9 + 0)
.s24:
4cda : a0 04 __ LDY #$04
4cdc : b1 0d __ LDA (P0),y ; (si + 0)
4cde : c9 10 __ CMP #$10
4ce0 : d0 15 __ BNE $4cf7 ; (nforml.s9 + 0)
.s25:
4ce2 : 88 __ __ DEY
4ce3 : b1 0d __ LDA (P0),y ; (si + 0)
4ce5 : a8 __ __ TAY
4ce6 : a9 30 __ LDA #$30
4ce8 : a6 44 __ LDX T5 + 0 
4cea : 9d e6 fc STA $fce6,x ; (buff[0] + 48)
4ced : 98 __ __ TYA
4cee : 69 16 __ ADC #$16
4cf0 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4cf3 : ca __ __ DEX
4cf4 : ca __ __ DEX
4cf5 : 86 44 __ STX T5 + 0 
.s9:
4cf7 : a9 00 __ LDA #$00
4cf9 : 85 1b __ STA ACCU + 0 
4cfb : a5 43 __ LDA T4 + 0 
4cfd : f0 0c __ BEQ $4d0b ; (nforml.s10 + 0)
.s23:
4cff : a9 2d __ LDA #$2d
.s22:
4d01 : a6 44 __ LDX T5 + 0 
4d03 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4d06 : c6 44 __ DEC T5 + 0 
4d08 : 4c 15 4d JMP $4d15 ; (nforml.s11 + 0)
.s10:
4d0b : a0 05 __ LDY #$05
4d0d : b1 0d __ LDA (P0),y ; (si + 0)
4d0f : f0 04 __ BEQ $4d15 ; (nforml.s11 + 0)
.s21:
4d11 : a9 2b __ LDA #$2b
4d13 : d0 ec __ BNE $4d01 ; (nforml.s22 + 0)
.s11:
4d15 : a0 06 __ LDY #$06
4d17 : a6 44 __ LDX T5 + 0 
4d19 : b1 0d __ LDA (P0),y ; (si + 0)
4d1b : d0 29 __ BNE $4d46 ; (nforml.s17 + 0)
.l12:
4d1d : 8a __ __ TXA
4d1e : 18 __ __ CLC
4d1f : a0 01 __ LDY #$01
4d21 : 71 0d __ ADC (P0),y ; (si + 0)
4d23 : b0 04 __ BCS $4d29 ; (nforml.s15 + 0)
.s16:
4d25 : c9 11 __ CMP #$11
4d27 : 90 0a __ BCC $4d33 ; (nforml.s13 + 0)
.s15:
4d29 : a0 00 __ LDY #$00
4d2b : b1 0d __ LDA (P0),y ; (si + 0)
4d2d : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4d30 : ca __ __ DEX
4d31 : b0 ea __ BCS $4d1d ; (nforml.l12 + 0)
.s13:
4d33 : e0 10 __ CPX #$10
4d35 : b0 0e __ BCS $4d45 ; (nforml.s3 + 0)
.s14:
4d37 : 88 __ __ DEY
.l39:
4d38 : bd e8 fc LDA $fce8,x ; (buffer[0] + 0)
4d3b : 91 0f __ STA (P2),y ; (str + 0)
4d3d : c8 __ __ INY
4d3e : e8 __ __ INX
4d3f : e0 10 __ CPX #$10
4d41 : 90 f5 __ BCC $4d38 ; (nforml.l39 + 0)
.s40:
4d43 : 84 1b __ STY ACCU + 0 
.s3:
4d45 : 60 __ __ RTS
.s17:
4d46 : e0 10 __ CPX #$10
4d48 : b0 1a __ BCS $4d64 ; (nforml.l18 + 0)
.s20:
4d4a : a0 00 __ LDY #$00
.l37:
4d4c : bd e8 fc LDA $fce8,x ; (buffer[0] + 0)
4d4f : 91 0f __ STA (P2),y ; (str + 0)
4d51 : c8 __ __ INY
4d52 : e8 __ __ INX
4d53 : e0 10 __ CPX #$10
4d55 : 90 f5 __ BCC $4d4c ; (nforml.l37 + 0)
.s38:
4d57 : 84 1b __ STY ACCU + 0 
4d59 : b0 09 __ BCS $4d64 ; (nforml.l18 + 0)
.s19:
4d5b : 88 __ __ DEY
4d5c : b1 0d __ LDA (P0),y ; (si + 0)
4d5e : a4 1b __ LDY ACCU + 0 
4d60 : 91 0f __ STA (P2),y ; (str + 0)
4d62 : e6 1b __ INC ACCU + 0 
.l18:
4d64 : a5 1b __ LDA ACCU + 0 
4d66 : a0 01 __ LDY #$01
4d68 : d1 0d __ CMP (P0),y ; (si + 0)
4d6a : 90 ef __ BCC $4d5b ; (nforml.s19 + 0)
4d6c : 60 __ __ RTS
.l28:
4d6d : a0 04 __ LDY #$04
4d6f : b1 0d __ LDA (P0),y ; (si + 0)
4d71 : 85 03 __ STA WORK + 0 
4d73 : a5 11 __ LDA P4 ; (v + 0)
4d75 : 85 1b __ STA ACCU + 0 
4d77 : a5 12 __ LDA P5 ; (v + 1)
4d79 : 85 1c __ STA ACCU + 1 
4d7b : a5 13 __ LDA P6 ; (v + 2)
4d7d : 85 1d __ STA ACCU + 2 
4d7f : a5 14 __ LDA P7 ; (v + 3)
4d81 : 85 1e __ STA ACCU + 3 
4d83 : a9 00 __ LDA #$00
4d85 : 85 04 __ STA WORK + 1 
4d87 : 85 05 __ STA WORK + 2 
4d89 : 85 06 __ STA WORK + 3 
4d8b : 20 1b 6c JSR $6c1b ; (divmod32 + 0)
4d8e : a5 07 __ LDA WORK + 4 
4d90 : c9 0a __ CMP #$0a
4d92 : b0 04 __ BCS $4d98 ; (nforml.s34 + 0)
.s29:
4d94 : a9 30 __ LDA #$30
4d96 : 90 06 __ BCC $4d9e ; (nforml.s30 + 0)
.s34:
4d98 : a0 03 __ LDY #$03
4d9a : b1 0d __ LDA (P0),y ; (si + 0)
4d9c : e9 0a __ SBC #$0a
.s30:
4d9e : 18 __ __ CLC
4d9f : 65 07 __ ADC WORK + 4 
4da1 : a6 44 __ LDX T5 + 0 
4da3 : 9d e7 fc STA $fce7,x ; (buff[0] + 49)
4da6 : c6 44 __ DEC T5 + 0 
4da8 : a5 1b __ LDA ACCU + 0 
4daa : 85 11 __ STA P4 ; (v + 0)
4dac : a5 1c __ LDA ACCU + 1 
4dae : 85 12 __ STA P5 ; (v + 1)
4db0 : a5 1d __ LDA ACCU + 2 
4db2 : 85 13 __ STA P6 ; (v + 2)
4db4 : a5 1e __ LDA ACCU + 3 
4db6 : 85 14 __ STA P7 ; (v + 3)
4db8 : d0 b3 __ BNE $4d6d ; (nforml.l28 + 0)
4dba : 4c a5 4c JMP $4ca5 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s1:
4dbd : a5 53 __ LDA T10 + 0 
4dbf : 8d ef fc STA $fcef ; (nformf@stack + 0)
4dc2 : a5 54 __ LDA T11 + 0 
4dc4 : 8d f0 fc STA $fcf0 ; (nformf@stack + 1)
.s4:
4dc7 : a5 11 __ LDA P4 ; (f + 0)
4dc9 : 85 43 __ STA T0 + 0 
4dcb : a5 12 __ LDA P5 ; (f + 1)
4dcd : 85 44 __ STA T0 + 1 
4dcf : a5 14 __ LDA P7 ; (f + 3)
4dd1 : 29 7f __ AND #$7f
4dd3 : 05 13 __ ORA P6 ; (f + 2)
4dd5 : 05 12 __ ORA P5 ; (f + 1)
4dd7 : a6 13 __ LDX P6 ; (f + 2)
4dd9 : 86 45 __ STX T0 + 2 
4ddb : 05 11 __ ORA P4 ; (f + 0)
4ddd : f0 14 __ BEQ $4df3 ; (nformf.s5 + 0)
.s105:
4ddf : 24 14 __ BIT P7 ; (f + 3)
4de1 : 10 10 __ BPL $4df3 ; (nformf.s5 + 0)
.s104:
4de3 : a9 2d __ LDA #$2d
4de5 : a0 00 __ LDY #$00
4de7 : 91 0f __ STA (P2),y ; (str + 0)
4de9 : a5 14 __ LDA P7 ; (f + 3)
4deb : 49 80 __ EOR #$80
4ded : 85 14 __ STA P7 ; (f + 3)
.s103:
4def : a9 01 __ LDA #$01
4df1 : d0 0e __ BNE $4e01 ; (nformf.s6 + 0)
.s5:
4df3 : a0 05 __ LDY #$05
4df5 : b1 0d __ LDA (P0),y ; (si + 0)
4df7 : f0 08 __ BEQ $4e01 ; (nformf.s6 + 0)
.s102:
4df9 : a9 2b __ LDA #$2b
4dfb : a0 00 __ LDY #$00
4dfd : 91 0f __ STA (P2),y ; (str + 0)
4dff : a9 01 __ LDA #$01
.s6:
4e01 : 85 52 __ STA T9 + 0 
4e03 : 8a __ __ TXA
4e04 : 0a __ __ ASL
4e05 : a5 14 __ LDA P7 ; (f + 3)
4e07 : 2a __ __ ROL
4e08 : c9 ff __ CMP #$ff
4e0a : d0 29 __ BNE $4e35 ; (nformf.s7 + 0)
.s101:
4e0c : a0 03 __ LDY #$03
4e0e : b1 0d __ LDA (P0),y ; (si + 0)
4e10 : 69 07 __ ADC #$07
4e12 : a4 52 __ LDY T9 + 0 
4e14 : 91 0f __ STA (P2),y ; (str + 0)
4e16 : 18 __ __ CLC
4e17 : a0 03 __ LDY #$03
4e19 : b1 0d __ LDA (P0),y ; (si + 0)
4e1b : 69 0d __ ADC #$0d
4e1d : a4 52 __ LDY T9 + 0 
4e1f : c8 __ __ INY
4e20 : 91 0f __ STA (P2),y ; (str + 0)
4e22 : 18 __ __ CLC
4e23 : a0 03 __ LDY #$03
4e25 : b1 0d __ LDA (P0),y ; (si + 0)
4e27 : 69 05 __ ADC #$05
4e29 : a4 52 __ LDY T9 + 0 
4e2b : c8 __ __ INY
4e2c : c8 __ __ INY
4e2d : 91 0f __ STA (P2),y ; (str + 0)
4e2f : c8 __ __ INY
4e30 : 84 52 __ STY T9 + 0 
4e32 : 4c 83 51 JMP $5183 ; (nformf.s27 + 0)
.s7:
4e35 : a0 02 __ LDY #$02
4e37 : b1 0d __ LDA (P0),y ; (si + 0)
4e39 : a6 14 __ LDX P7 ; (f + 3)
4e3b : 86 46 __ STX T0 + 3 
4e3d : c9 ff __ CMP #$ff
4e3f : d0 02 __ BNE $4e43 ; (nformf.s100 + 0)
.s8:
4e41 : a9 06 __ LDA #$06
.s100:
4e43 : 85 4b __ STA T4 + 0 
4e45 : 85 50 __ STA T7 + 0 
4e47 : a9 00 __ LDA #$00
4e49 : 85 4d __ STA T5 + 0 
4e4b : 85 4e __ STA T5 + 1 
4e4d : 8a __ __ TXA
4e4e : 29 7f __ AND #$7f
4e50 : 05 13 __ ORA P6 ; (f + 2)
4e52 : 05 12 __ ORA P5 ; (f + 1)
4e54 : 05 11 __ ORA P4 ; (f + 0)
4e56 : d0 03 __ BNE $4e5b ; (nformf.s67 + 0)
4e58 : 4c 87 4f JMP $4f87 ; (nformf.s9 + 0)
.s67:
4e5b : 8a __ __ TXA
4e5c : 10 03 __ BPL $4e61 ; (nformf.s95 + 0)
4e5e : 4c e1 4e JMP $4ee1 ; (nformf.l80 + 0)
.s95:
4e61 : c9 44 __ CMP #$44
4e63 : d0 0e __ BNE $4e73 ; (nformf.l99 + 0)
.s96:
4e65 : a5 13 __ LDA P6 ; (f + 2)
4e67 : c9 7a __ CMP #$7a
4e69 : d0 08 __ BNE $4e73 ; (nformf.l99 + 0)
.s97:
4e6b : a5 12 __ LDA P5 ; (f + 1)
4e6d : d0 04 __ BNE $4e73 ; (nformf.l99 + 0)
.s98:
4e6f : a5 11 __ LDA P4 ; (f + 0)
4e71 : f0 02 __ BEQ $4e75 ; (nformf.l90 + 0)
.l99:
4e73 : 90 54 __ BCC $4ec9 ; (nformf.s68 + 0)
.l90:
4e75 : 18 __ __ CLC
4e76 : a5 4d __ LDA T5 + 0 
4e78 : 69 03 __ ADC #$03
4e7a : 85 4d __ STA T5 + 0 
4e7c : 90 02 __ BCC $4e80 ; (nformf.s119 + 0)
.s118:
4e7e : e6 4e __ INC T5 + 1 
.s119:
4e80 : a5 43 __ LDA T0 + 0 
4e82 : 85 1b __ STA ACCU + 0 
4e84 : a5 44 __ LDA T0 + 1 
4e86 : 85 1c __ STA ACCU + 1 
4e88 : a5 45 __ LDA T0 + 2 
4e8a : 85 1d __ STA ACCU + 2 
4e8c : a5 46 __ LDA T0 + 3 
4e8e : 85 1e __ STA ACCU + 3 
4e90 : a9 00 __ LDA #$00
4e92 : 85 03 __ STA WORK + 0 
4e94 : 85 04 __ STA WORK + 1 
4e96 : a9 7a __ LDA #$7a
4e98 : 85 05 __ STA WORK + 2 
4e9a : a9 44 __ LDA #$44
4e9c : 85 06 __ STA WORK + 3 
4e9e : 20 a0 66 JSR $66a0 ; (freg + 20)
4ea1 : 20 86 68 JSR $6886 ; (crt_fdiv + 0)
4ea4 : a5 1b __ LDA ACCU + 0 
4ea6 : 85 43 __ STA T0 + 0 
4ea8 : a5 1c __ LDA ACCU + 1 
4eaa : 85 44 __ STA T0 + 1 
4eac : a6 1d __ LDX ACCU + 2 
4eae : 86 45 __ STX T0 + 2 
4eb0 : a5 1e __ LDA ACCU + 3 
4eb2 : 85 46 __ STA T0 + 3 
4eb4 : 30 13 __ BMI $4ec9 ; (nformf.s68 + 0)
.s91:
4eb6 : c9 44 __ CMP #$44
4eb8 : d0 b9 __ BNE $4e73 ; (nformf.l99 + 0)
.s92:
4eba : e0 7a __ CPX #$7a
4ebc : d0 b5 __ BNE $4e73 ; (nformf.l99 + 0)
.s93:
4ebe : a5 1c __ LDA ACCU + 1 
4ec0 : 38 __ __ SEC
4ec1 : d0 b0 __ BNE $4e73 ; (nformf.l99 + 0)
.s94:
4ec3 : a5 1b __ LDA ACCU + 0 
4ec5 : f0 ae __ BEQ $4e75 ; (nformf.l90 + 0)
4ec7 : d0 aa __ BNE $4e73 ; (nformf.l99 + 0)
.s68:
4ec9 : a5 46 __ LDA T0 + 3 
4ecb : 30 14 __ BMI $4ee1 ; (nformf.l80 + 0)
.s86:
4ecd : c9 3f __ CMP #$3f
4ecf : d0 0e __ BNE $4edf ; (nformf.s85 + 0)
.s87:
4ed1 : a5 45 __ LDA T0 + 2 
4ed3 : c9 80 __ CMP #$80
4ed5 : d0 08 __ BNE $4edf ; (nformf.s85 + 0)
.s88:
4ed7 : a5 44 __ LDA T0 + 1 
4ed9 : d0 04 __ BNE $4edf ; (nformf.s85 + 0)
.s89:
4edb : a5 43 __ LDA T0 + 0 
4edd : f0 49 __ BEQ $4f28 ; (nformf.s69 + 0)
.s85:
4edf : b0 47 __ BCS $4f28 ; (nformf.s69 + 0)
.l80:
4ee1 : 38 __ __ SEC
4ee2 : a5 4d __ LDA T5 + 0 
4ee4 : e9 03 __ SBC #$03
4ee6 : 85 4d __ STA T5 + 0 
4ee8 : b0 02 __ BCS $4eec ; (nformf.s114 + 0)
.s113:
4eea : c6 4e __ DEC T5 + 1 
.s114:
4eec : a9 00 __ LDA #$00
4eee : 85 1b __ STA ACCU + 0 
4ef0 : 85 1c __ STA ACCU + 1 
4ef2 : a9 7a __ LDA #$7a
4ef4 : 85 1d __ STA ACCU + 2 
4ef6 : a9 44 __ LDA #$44
4ef8 : 85 1e __ STA ACCU + 3 
4efa : a2 43 __ LDX #$43
4efc : 20 90 66 JSR $6690 ; (freg + 4)
4eff : 20 be 67 JSR $67be ; (crt_fmul + 0)
4f02 : a5 1b __ LDA ACCU + 0 
4f04 : 85 43 __ STA T0 + 0 
4f06 : a5 1c __ LDA ACCU + 1 
4f08 : 85 44 __ STA T0 + 1 
4f0a : a6 1d __ LDX ACCU + 2 
4f0c : 86 45 __ STX T0 + 2 
4f0e : a5 1e __ LDA ACCU + 3 
4f10 : 85 46 __ STA T0 + 3 
4f12 : 30 cd __ BMI $4ee1 ; (nformf.l80 + 0)
.s81:
4f14 : c9 3f __ CMP #$3f
4f16 : 90 c9 __ BCC $4ee1 ; (nformf.l80 + 0)
.s120:
4f18 : d0 0e __ BNE $4f28 ; (nformf.s69 + 0)
.s82:
4f1a : e0 80 __ CPX #$80
4f1c : 90 c3 __ BCC $4ee1 ; (nformf.l80 + 0)
.s121:
4f1e : d0 08 __ BNE $4f28 ; (nformf.s69 + 0)
.s83:
4f20 : a5 1c __ LDA ACCU + 1 
4f22 : d0 bb __ BNE $4edf ; (nformf.s85 + 0)
.s84:
4f24 : a5 1b __ LDA ACCU + 0 
4f26 : d0 b7 __ BNE $4edf ; (nformf.s85 + 0)
.s69:
4f28 : a5 46 __ LDA T0 + 3 
4f2a : 30 5b __ BMI $4f87 ; (nformf.s9 + 0)
.s75:
4f2c : c9 41 __ CMP #$41
4f2e : d0 0e __ BNE $4f3e ; (nformf.l79 + 0)
.s76:
4f30 : a5 45 __ LDA T0 + 2 
4f32 : c9 20 __ CMP #$20
4f34 : d0 08 __ BNE $4f3e ; (nformf.l79 + 0)
.s77:
4f36 : a5 44 __ LDA T0 + 1 
4f38 : d0 04 __ BNE $4f3e ; (nformf.l79 + 0)
.s78:
4f3a : a5 43 __ LDA T0 + 0 
4f3c : f0 02 __ BEQ $4f40 ; (nformf.l70 + 0)
.l79:
4f3e : 90 47 __ BCC $4f87 ; (nformf.s9 + 0)
.l70:
4f40 : e6 4d __ INC T5 + 0 
4f42 : d0 02 __ BNE $4f46 ; (nformf.s117 + 0)
.s116:
4f44 : e6 4e __ INC T5 + 1 
.s117:
4f46 : a5 43 __ LDA T0 + 0 
4f48 : 85 1b __ STA ACCU + 0 
4f4a : a5 44 __ LDA T0 + 1 
4f4c : 85 1c __ STA ACCU + 1 
4f4e : a5 45 __ LDA T0 + 2 
4f50 : 85 1d __ STA ACCU + 2 
4f52 : a5 46 __ LDA T0 + 3 
4f54 : 85 1e __ STA ACCU + 3 
4f56 : a9 00 __ LDA #$00
4f58 : 85 03 __ STA WORK + 0 
4f5a : 85 04 __ STA WORK + 1 
4f5c : 20 f1 6d JSR $6df1 ; (freg@proxy + 0)
4f5f : 20 86 68 JSR $6886 ; (crt_fdiv + 0)
4f62 : a5 1b __ LDA ACCU + 0 
4f64 : 85 43 __ STA T0 + 0 
4f66 : a5 1c __ LDA ACCU + 1 
4f68 : 85 44 __ STA T0 + 1 
4f6a : a6 1d __ LDX ACCU + 2 
4f6c : 86 45 __ STX T0 + 2 
4f6e : a5 1e __ LDA ACCU + 3 
4f70 : 85 46 __ STA T0 + 3 
4f72 : 30 13 __ BMI $4f87 ; (nformf.s9 + 0)
.s71:
4f74 : c9 41 __ CMP #$41
4f76 : d0 c6 __ BNE $4f3e ; (nformf.l79 + 0)
.s72:
4f78 : e0 20 __ CPX #$20
4f7a : d0 c2 __ BNE $4f3e ; (nformf.l79 + 0)
.s73:
4f7c : a5 1c __ LDA ACCU + 1 
4f7e : 38 __ __ SEC
4f7f : d0 bd __ BNE $4f3e ; (nformf.l79 + 0)
.s74:
4f81 : a5 1b __ LDA ACCU + 0 
4f83 : f0 bb __ BEQ $4f40 ; (nformf.l70 + 0)
4f85 : d0 b7 __ BNE $4f3e ; (nformf.l79 + 0)
.s9:
4f87 : a5 15 __ LDA P8 ; (type + 0)
4f89 : c9 65 __ CMP #$65
4f8b : d0 04 __ BNE $4f91 ; (nformf.s11 + 0)
.s10:
4f8d : a9 01 __ LDA #$01
4f8f : d0 02 __ BNE $4f93 ; (nformf.s12 + 0)
.s11:
4f91 : a9 00 __ LDA #$00
.s12:
4f93 : 85 53 __ STA T10 + 0 
4f95 : a6 4b __ LDX T4 + 0 
4f97 : e8 __ __ INX
4f98 : 86 4f __ STX T6 + 0 
4f9a : a5 15 __ LDA P8 ; (type + 0)
4f9c : c9 67 __ CMP #$67
4f9e : d0 13 __ BNE $4fb3 ; (nformf.s13 + 0)
.s63:
4fa0 : a5 4e __ LDA T5 + 1 
4fa2 : 30 08 __ BMI $4fac ; (nformf.s64 + 0)
.s66:
4fa4 : d0 06 __ BNE $4fac ; (nformf.s64 + 0)
.s65:
4fa6 : a5 4d __ LDA T5 + 0 
4fa8 : c9 04 __ CMP #$04
4faa : 90 07 __ BCC $4fb3 ; (nformf.s13 + 0)
.s64:
4fac : a9 01 __ LDA #$01
4fae : 85 53 __ STA T10 + 0 
4fb0 : 4c 14 52 JMP $5214 ; (nformf.s53 + 0)
.s13:
4fb3 : a5 53 __ LDA T10 + 0 
4fb5 : d0 f9 __ BNE $4fb0 ; (nformf.s64 + 4)
.s14:
4fb7 : 24 4e __ BIT T5 + 1 
4fb9 : 10 3b __ BPL $4ff6 ; (nformf.s15 + 0)
.s52:
4fbb : a5 43 __ LDA T0 + 0 
4fbd : 85 1b __ STA ACCU + 0 
4fbf : a5 44 __ LDA T0 + 1 
4fc1 : 85 1c __ STA ACCU + 1 
4fc3 : a5 45 __ LDA T0 + 2 
4fc5 : 85 1d __ STA ACCU + 2 
4fc7 : a5 46 __ LDA T0 + 3 
4fc9 : 85 1e __ STA ACCU + 3 
.l106:
4fcb : a9 00 __ LDA #$00
4fcd : 85 03 __ STA WORK + 0 
4fcf : 85 04 __ STA WORK + 1 
4fd1 : 20 f1 6d JSR $6df1 ; (freg@proxy + 0)
4fd4 : 20 86 68 JSR $6886 ; (crt_fdiv + 0)
4fd7 : 18 __ __ CLC
4fd8 : a5 4d __ LDA T5 + 0 
4fda : 69 01 __ ADC #$01
4fdc : 85 4d __ STA T5 + 0 
4fde : a5 4e __ LDA T5 + 1 
4fe0 : 69 00 __ ADC #$00
4fe2 : 85 4e __ STA T5 + 1 
4fe4 : 30 e5 __ BMI $4fcb ; (nformf.l106 + 0)
.s107:
4fe6 : a5 1e __ LDA ACCU + 3 
4fe8 : 85 46 __ STA T0 + 3 
4fea : a5 1d __ LDA ACCU + 2 
4fec : 85 45 __ STA T0 + 2 
4fee : a5 1c __ LDA ACCU + 1 
4ff0 : 85 44 __ STA T0 + 1 
4ff2 : a5 1b __ LDA ACCU + 0 
4ff4 : 85 43 __ STA T0 + 0 
.s15:
4ff6 : 18 __ __ CLC
4ff7 : a5 4b __ LDA T4 + 0 
4ff9 : 65 4d __ ADC T5 + 0 
4ffb : 18 __ __ CLC
4ffc : 69 01 __ ADC #$01
4ffe : 85 4f __ STA T6 + 0 
5000 : c9 07 __ CMP #$07
5002 : 90 14 __ BCC $5018 ; (nformf.s51 + 0)
.s16:
5004 : ad 2a 6e LDA $6e2a ; (fround5[0] + 24)
5007 : 85 47 __ STA T1 + 0 
5009 : ad 2b 6e LDA $6e2b ; (fround5[0] + 25)
500c : 85 48 __ STA T1 + 1 
500e : ad 2c 6e LDA $6e2c ; (fround5[0] + 26)
5011 : 85 49 __ STA T1 + 2 
5013 : ad 2d 6e LDA $6e2d ; (fround5[0] + 27)
5016 : b0 15 __ BCS $502d ; (nformf.s17 + 0)
.s51:
5018 : 0a __ __ ASL
5019 : 0a __ __ ASL
501a : aa __ __ TAX
501b : bd 0e 6e LDA $6e0e,x ; (freg@proxy + 18)
501e : 85 47 __ STA T1 + 0 
5020 : bd 0f 6e LDA $6e0f,x ; (spentry + 0)
5023 : 85 48 __ STA T1 + 1 
5025 : bd 10 6e LDA $6e10,x ; (bitmap + 0)
5028 : 85 49 __ STA T1 + 2 
502a : bd 11 6e LDA $6e11,x ; (bitmap + 1)
.s17:
502d : 85 4a __ STA T1 + 3 
502f : a2 47 __ LDX #$47
5031 : 20 fc 6d JSR $6dfc ; (freg@proxy + 0)
5034 : 20 d7 66 JSR $66d7 ; (faddsub + 6)
5037 : a5 1c __ LDA ACCU + 1 
5039 : 85 12 __ STA P5 ; (f + 1)
503b : a5 1d __ LDA ACCU + 2 
503d : 85 13 __ STA P6 ; (f + 2)
503f : a6 1b __ LDX ACCU + 0 
5041 : a5 1e __ LDA ACCU + 3 
5043 : 85 14 __ STA P7 ; (f + 3)
5045 : 30 32 __ BMI $5079 ; (nformf.s18 + 0)
.s46:
5047 : c9 41 __ CMP #$41
5049 : d0 0d __ BNE $5058 ; (nformf.s50 + 0)
.s47:
504b : a5 13 __ LDA P6 ; (f + 2)
504d : c9 20 __ CMP #$20
504f : d0 07 __ BNE $5058 ; (nformf.s50 + 0)
.s48:
5051 : a5 12 __ LDA P5 ; (f + 1)
5053 : d0 03 __ BNE $5058 ; (nformf.s50 + 0)
.s49:
5055 : 8a __ __ TXA
5056 : f0 02 __ BEQ $505a ; (nformf.s45 + 0)
.s50:
5058 : 90 1f __ BCC $5079 ; (nformf.s18 + 0)
.s45:
505a : a9 00 __ LDA #$00
505c : 85 03 __ STA WORK + 0 
505e : 85 04 __ STA WORK + 1 
5060 : 20 f1 6d JSR $6df1 ; (freg@proxy + 0)
5063 : 20 86 68 JSR $6886 ; (crt_fdiv + 0)
5066 : a5 1c __ LDA ACCU + 1 
5068 : 85 12 __ STA P5 ; (f + 1)
506a : a5 1d __ LDA ACCU + 2 
506c : 85 13 __ STA P6 ; (f + 2)
506e : a5 1e __ LDA ACCU + 3 
5070 : 85 14 __ STA P7 ; (f + 3)
5072 : a6 4b __ LDX T4 + 0 
5074 : ca __ __ DEX
5075 : 86 50 __ STX T7 + 0 
5077 : a6 1b __ LDX ACCU + 0 
.s18:
5079 : 38 __ __ SEC
507a : a5 4f __ LDA T6 + 0 
507c : e5 50 __ SBC T7 + 0 
507e : 85 4b __ STA T4 + 0 
5080 : a9 00 __ LDA #$00
5082 : e9 00 __ SBC #$00
5084 : 85 4c __ STA T4 + 1 
5086 : a9 14 __ LDA #$14
5088 : c5 4f __ CMP T6 + 0 
508a : b0 02 __ BCS $508e ; (nformf.s19 + 0)
.s44:
508c : 85 4f __ STA T6 + 0 
.s19:
508e : a5 4b __ LDA T4 + 0 
5090 : d0 08 __ BNE $509a ; (nformf.s21 + 0)
.s20:
5092 : a9 30 __ LDA #$30
5094 : a4 52 __ LDY T9 + 0 
5096 : 91 0f __ STA (P2),y ; (str + 0)
5098 : e6 52 __ INC T9 + 0 
.s21:
509a : a9 00 __ LDA #$00
509c : 85 54 __ STA T11 + 0 
509e : c5 4b __ CMP T4 + 0 
50a0 : f0 67 __ BEQ $5109 ; (nformf.l43 + 0)
.s23:
50a2 : c9 07 __ CMP #$07
50a4 : 90 04 __ BCC $50aa ; (nformf.s24 + 0)
.l42:
50a6 : a9 30 __ LDA #$30
50a8 : b0 4d __ BCS $50f7 ; (nformf.l25 + 0)
.s24:
50aa : 86 1b __ STX ACCU + 0 
50ac : 86 43 __ STX T0 + 0 
50ae : a5 12 __ LDA P5 ; (f + 1)
50b0 : 85 1c __ STA ACCU + 1 
50b2 : 85 44 __ STA T0 + 1 
50b4 : a5 13 __ LDA P6 ; (f + 2)
50b6 : 85 1d __ STA ACCU + 2 
50b8 : 85 45 __ STA T0 + 2 
50ba : a5 14 __ LDA P7 ; (f + 3)
50bc : 85 1e __ STA ACCU + 3 
50be : 85 46 __ STA T0 + 3 
50c0 : 20 af 6a JSR $6aaf ; (f32_to_i16 + 0)
50c3 : a5 1b __ LDA ACCU + 0 
50c5 : 85 51 __ STA T8 + 0 
50c7 : 20 fb 6a JSR $6afb ; (sint16_to_float + 0)
50ca : a2 43 __ LDX #$43
50cc : 20 90 66 JSR $6690 ; (freg + 4)
50cf : a5 1e __ LDA ACCU + 3 
50d1 : 49 80 __ EOR #$80
50d3 : 85 1e __ STA ACCU + 3 
50d5 : 20 d7 66 JSR $66d7 ; (faddsub + 6)
50d8 : a9 00 __ LDA #$00
50da : 85 03 __ STA WORK + 0 
50dc : 85 04 __ STA WORK + 1 
50de : 20 f1 6d JSR $6df1 ; (freg@proxy + 0)
50e1 : 20 be 67 JSR $67be ; (crt_fmul + 0)
50e4 : a5 1c __ LDA ACCU + 1 
50e6 : 85 12 __ STA P5 ; (f + 1)
50e8 : a5 1d __ LDA ACCU + 2 
50ea : 85 13 __ STA P6 ; (f + 2)
50ec : a5 1e __ LDA ACCU + 3 
50ee : 85 14 __ STA P7 ; (f + 3)
50f0 : 18 __ __ CLC
50f1 : a5 51 __ LDA T8 + 0 
50f3 : 69 30 __ ADC #$30
50f5 : a6 1b __ LDX ACCU + 0 
.l25:
50f7 : a4 52 __ LDY T9 + 0 
50f9 : 91 0f __ STA (P2),y ; (str + 0)
50fb : e6 52 __ INC T9 + 0 
50fd : e6 54 __ INC T11 + 0 
50ff : a5 54 __ LDA T11 + 0 
5101 : c5 4f __ CMP T6 + 0 
5103 : b0 14 __ BCS $5119 ; (nformf.s26 + 0)
.s22:
5105 : c5 4b __ CMP T4 + 0 
5107 : d0 99 __ BNE $50a2 ; (nformf.s23 + 0)
.l43:
5109 : a9 2e __ LDA #$2e
510b : a4 52 __ LDY T9 + 0 
510d : 91 0f __ STA (P2),y ; (str + 0)
510f : e6 52 __ INC T9 + 0 
5111 : a5 54 __ LDA T11 + 0 
5113 : c9 07 __ CMP #$07
5115 : 90 93 __ BCC $50aa ; (nformf.s24 + 0)
5117 : b0 8d __ BCS $50a6 ; (nformf.l42 + 0)
.s26:
5119 : a5 53 __ LDA T10 + 0 
511b : f0 66 __ BEQ $5183 ; (nformf.s27 + 0)
.s38:
511d : a0 03 __ LDY #$03
511f : b1 0d __ LDA (P0),y ; (si + 0)
5121 : 69 03 __ ADC #$03
5123 : a4 52 __ LDY T9 + 0 
5125 : 91 0f __ STA (P2),y ; (str + 0)
5127 : c8 __ __ INY
5128 : 84 52 __ STY T9 + 0 
512a : 24 4e __ BIT T5 + 1 
512c : 30 06 __ BMI $5134 ; (nformf.s41 + 0)
.s39:
512e : a9 2b __ LDA #$2b
5130 : 91 0f __ STA (P2),y ; (str + 0)
5132 : d0 11 __ BNE $5145 ; (nformf.s40 + 0)
.s41:
5134 : a9 2d __ LDA #$2d
5136 : 91 0f __ STA (P2),y ; (str + 0)
5138 : 38 __ __ SEC
5139 : a9 00 __ LDA #$00
513b : e5 4d __ SBC T5 + 0 
513d : 85 4d __ STA T5 + 0 
513f : a9 00 __ LDA #$00
5141 : e5 4e __ SBC T5 + 1 
5143 : 85 4e __ STA T5 + 1 
.s40:
5145 : e6 52 __ INC T9 + 0 
5147 : a5 4d __ LDA T5 + 0 
5149 : 85 1b __ STA ACCU + 0 
514b : a5 4e __ LDA T5 + 1 
514d : 85 1c __ STA ACCU + 1 
514f : a9 0a __ LDA #$0a
5151 : 85 03 __ STA WORK + 0 
5153 : a9 00 __ LDA #$00
5155 : 85 04 __ STA WORK + 1 
5157 : 20 90 69 JSR $6990 ; (divs16 + 0)
515a : 18 __ __ CLC
515b : a5 1b __ LDA ACCU + 0 
515d : 69 30 __ ADC #$30
515f : a4 52 __ LDY T9 + 0 
5161 : 91 0f __ STA (P2),y ; (str + 0)
5163 : e6 52 __ INC T9 + 0 
5165 : a5 4d __ LDA T5 + 0 
5167 : 85 1b __ STA ACCU + 0 
5169 : a5 4e __ LDA T5 + 1 
516b : 85 1c __ STA ACCU + 1 
516d : a9 0a __ LDA #$0a
516f : 85 03 __ STA WORK + 0 
5171 : a9 00 __ LDA #$00
5173 : 85 04 __ STA WORK + 1 
5175 : 20 58 6a JSR $6a58 ; (mods16 + 0)
5178 : 18 __ __ CLC
5179 : a5 05 __ LDA WORK + 2 
517b : 69 30 __ ADC #$30
517d : a4 52 __ LDY T9 + 0 
517f : 91 0f __ STA (P2),y ; (str + 0)
5181 : e6 52 __ INC T9 + 0 
.s27:
5183 : a5 52 __ LDA T9 + 0 
5185 : a0 01 __ LDY #$01
5187 : d1 0d __ CMP (P0),y ; (si + 0)
5189 : b0 6d __ BCS $51f8 ; (nformf.s3 + 0)
.s28:
518b : a0 06 __ LDY #$06
518d : b1 0d __ LDA (P0),y ; (si + 0)
518f : f0 04 __ BEQ $5195 ; (nformf.s29 + 0)
.s108:
5191 : a6 52 __ LDX T9 + 0 
5193 : 90 70 __ BCC $5205 ; (nformf.l36 + 0)
.s29:
5195 : a5 52 __ LDA T9 + 0 
5197 : f0 40 __ BEQ $51d9 ; (nformf.s30 + 0)
.s35:
5199 : e9 00 __ SBC #$00
519b : a8 __ __ TAY
519c : a9 00 __ LDA #$00
519e : e9 00 __ SBC #$00
51a0 : aa __ __ TAX
51a1 : 98 __ __ TYA
51a2 : 18 __ __ CLC
51a3 : 65 0f __ ADC P2 ; (str + 0)
51a5 : 85 43 __ STA T0 + 0 
51a7 : 8a __ __ TXA
51a8 : 65 10 __ ADC P3 ; (str + 1)
51aa : 85 44 __ STA T0 + 1 
51ac : a9 01 __ LDA #$01
51ae : 85 4b __ STA T4 + 0 
51b0 : a6 52 __ LDX T9 + 0 
51b2 : 38 __ __ SEC
.l109:
51b3 : a0 01 __ LDY #$01
51b5 : b1 0d __ LDA (P0),y ; (si + 0)
51b7 : e5 4b __ SBC T4 + 0 
51b9 : 85 47 __ STA T1 + 0 
51bb : a9 00 __ LDA #$00
51bd : e5 4c __ SBC T4 + 1 
51bf : 18 __ __ CLC
51c0 : 65 10 __ ADC P3 ; (str + 1)
51c2 : 85 48 __ STA T1 + 1 
51c4 : 88 __ __ DEY
51c5 : b1 43 __ LDA (T0 + 0),y 
51c7 : a4 0f __ LDY P2 ; (str + 0)
51c9 : 91 47 __ STA (T1 + 0),y 
51cb : a5 43 __ LDA T0 + 0 
51cd : d0 02 __ BNE $51d1 ; (nformf.s112 + 0)
.s111:
51cf : c6 44 __ DEC T0 + 1 
.s112:
51d1 : c6 43 __ DEC T0 + 0 
51d3 : e6 4b __ INC T4 + 0 
51d5 : e4 4b __ CPX T4 + 0 
51d7 : b0 da __ BCS $51b3 ; (nformf.l109 + 0)
.s30:
51d9 : a9 00 __ LDA #$00
51db : 85 4b __ STA T4 + 0 
51dd : 90 08 __ BCC $51e7 ; (nformf.l31 + 0)
.s33:
51df : a9 20 __ LDA #$20
51e1 : a4 4b __ LDY T4 + 0 
51e3 : 91 0f __ STA (P2),y ; (str + 0)
51e5 : e6 4b __ INC T4 + 0 
.l31:
51e7 : a0 01 __ LDY #$01
51e9 : b1 0d __ LDA (P0),y ; (si + 0)
51eb : 38 __ __ SEC
51ec : e5 52 __ SBC T9 + 0 
51ee : 90 ef __ BCC $51df ; (nformf.s33 + 0)
.s34:
51f0 : c5 4b __ CMP T4 + 0 
51f2 : 90 02 __ BCC $51f6 ; (nformf.s32 + 0)
.s110:
51f4 : d0 e9 __ BNE $51df ; (nformf.s33 + 0)
.s32:
51f6 : b1 0d __ LDA (P0),y ; (si + 0)
.s3:
51f8 : 85 1b __ STA ACCU + 0 
51fa : ad ef fc LDA $fcef ; (nformf@stack + 0)
51fd : 85 53 __ STA T10 + 0 
51ff : ad f0 fc LDA $fcf0 ; (nformf@stack + 1)
5202 : 85 54 __ STA T11 + 0 
5204 : 60 __ __ RTS
.l36:
5205 : 8a __ __ TXA
5206 : a0 01 __ LDY #$01
5208 : d1 0d __ CMP (P0),y ; (si + 0)
520a : b0 ea __ BCS $51f6 ; (nformf.s32 + 0)
.s37:
520c : a8 __ __ TAY
520d : a9 20 __ LDA #$20
520f : 91 0f __ STA (P2),y ; (str + 0)
5211 : e8 __ __ INX
5212 : 90 f1 __ BCC $5205 ; (nformf.l36 + 0)
.s53:
5214 : a5 4f __ LDA T6 + 0 
5216 : c9 07 __ CMP #$07
5218 : 90 14 __ BCC $522e ; (nformf.s62 + 0)
.s54:
521a : ad 2a 6e LDA $6e2a ; (fround5[0] + 24)
521d : 85 47 __ STA T1 + 0 
521f : ad 2b 6e LDA $6e2b ; (fround5[0] + 25)
5222 : 85 48 __ STA T1 + 1 
5224 : ad 2c 6e LDA $6e2c ; (fround5[0] + 26)
5227 : 85 49 __ STA T1 + 2 
5229 : ad 2d 6e LDA $6e2d ; (fround5[0] + 27)
522c : b0 15 __ BCS $5243 ; (nformf.s55 + 0)
.s62:
522e : 0a __ __ ASL
522f : 0a __ __ ASL
5230 : aa __ __ TAX
5231 : bd 0e 6e LDA $6e0e,x ; (freg@proxy + 18)
5234 : 85 47 __ STA T1 + 0 
5236 : bd 0f 6e LDA $6e0f,x ; (spentry + 0)
5239 : 85 48 __ STA T1 + 1 
523b : bd 10 6e LDA $6e10,x ; (bitmap + 0)
523e : 85 49 __ STA T1 + 2 
5240 : bd 11 6e LDA $6e11,x ; (bitmap + 1)
.s55:
5243 : 85 4a __ STA T1 + 3 
5245 : a2 47 __ LDX #$47
5247 : 20 fc 6d JSR $6dfc ; (freg@proxy + 0)
524a : 20 d7 66 JSR $66d7 ; (faddsub + 6)
524d : a5 1c __ LDA ACCU + 1 
524f : 85 12 __ STA P5 ; (f + 1)
5251 : a5 1d __ LDA ACCU + 2 
5253 : 85 13 __ STA P6 ; (f + 2)
5255 : a6 1b __ LDX ACCU + 0 
5257 : a5 1e __ LDA ACCU + 3 
5259 : 85 14 __ STA P7 ; (f + 3)
525b : 10 03 __ BPL $5260 ; (nformf.s57 + 0)
525d : 4c 79 50 JMP $5079 ; (nformf.s18 + 0)
.s57:
5260 : c9 41 __ CMP #$41
5262 : d0 0d __ BNE $5271 ; (nformf.s61 + 0)
.s58:
5264 : a5 13 __ LDA P6 ; (f + 2)
5266 : c9 20 __ CMP #$20
5268 : d0 07 __ BNE $5271 ; (nformf.s61 + 0)
.s59:
526a : a5 12 __ LDA P5 ; (f + 1)
526c : d0 03 __ BNE $5271 ; (nformf.s61 + 0)
.s60:
526e : 8a __ __ TXA
526f : f0 02 __ BEQ $5273 ; (nformf.s56 + 0)
.s61:
5271 : 90 ea __ BCC $525d ; (nformf.s55 + 26)
.s56:
5273 : a9 00 __ LDA #$00
5275 : 85 03 __ STA WORK + 0 
5277 : 85 04 __ STA WORK + 1 
5279 : 20 f1 6d JSR $6df1 ; (freg@proxy + 0)
527c : 20 86 68 JSR $6886 ; (crt_fdiv + 0)
527f : a5 1c __ LDA ACCU + 1 
5281 : 85 12 __ STA P5 ; (f + 1)
5283 : a5 1d __ LDA ACCU + 2 
5285 : 85 13 __ STA P6 ; (f + 2)
5287 : a5 1e __ LDA ACCU + 3 
5289 : 85 14 __ STA P7 ; (f + 3)
528b : a6 1b __ LDX ACCU + 0 
528d : e6 4d __ INC T5 + 0 
528f : d0 cc __ BNE $525d ; (nformf.s55 + 26)
.s115:
5291 : e6 4e __ INC T5 + 1 
5293 : 4c 79 50 JMP $5079 ; (nformf.s18 + 0)
--------------------------------------------------------------------
5296 : __ __ __ BYT 45 52 52 4f 52 3a 20 46 49 4c 45 20 4e 4f 54 20 : ERROR: FILE NOT 
52a6 : __ __ __ BYT 46 4f 55 4e 44 0a 00                            : FOUND..
--------------------------------------------------------------------
fgets@proxy: ; fgets@proxy
52ad : a9 61 __ LDA #$61
52af : 85 0e __ STA P1 
52b1 : a9 fc __ LDA #$fc
52b3 : 85 0f __ STA P2 
--------------------------------------------------------------------
fgets: ; fgets(u8*,i16,struct FILE*)->u8*
;  46, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
52b5 : a0 00 __ LDY #$00
52b7 : b1 10 __ LDA (P3),y ; (stream + 0)
52b9 : 85 44 __ STA T2 + 0 
52bb : a8 __ __ TAY
52bc : b9 94 6e LDA $6e94,y ; (krnio_pstatus[0] + 0)
52bf : c9 40 __ CMP #$40
52c1 : f0 51 __ BEQ $5314 ; (fgets.s6 + 0)
.s5:
52c3 : 98 __ __ TYA
52c4 : 20 fb 10 JSR $10fb ; (krnio_chkin.s4 + 0)
52c7 : aa __ __ TAX
52c8 : f0 4a __ BEQ $5314 ; (fgets.s6 + 0)
.s7:
52ca : a5 0e __ LDA P1 ; (s + 0)
52cc : 85 45 __ STA T3 + 0 
52ce : a5 0f __ LDA P2 ; (s + 1)
52d0 : 85 46 __ STA T3 + 1 
52d2 : a2 00 __ LDX #$00
52d4 : 86 43 __ STX T1 + 0 
.l8:
52d6 : 18 __ __ CLC
52d7 : a5 43 __ LDA T1 + 0 
52d9 : 69 01 __ ADC #$01
52db : c9 40 __ CMP #$40
52dd : b0 22 __ BCS $5301 ; (fgets.s9 + 0)
.s11:
52df : 20 16 11 JSR $1116 ; (krnio_chrin.s4 + 0)
52e2 : 85 47 __ STA T7 + 0 
52e4 : 20 24 11 JSR $1124 ; (krnio_status.s4 + 0)
52e7 : aa __ __ TAX
52e8 : f0 04 __ BEQ $52ee ; (fgets.s12 + 0)
.s15:
52ea : e0 40 __ CPX #$40
52ec : d0 13 __ BNE $5301 ; (fgets.s9 + 0)
.s12:
52ee : a5 47 __ LDA T7 + 0 
52f0 : a4 43 __ LDY T1 + 0 
52f2 : 91 45 __ STA (T3 + 0),y 
52f4 : e6 43 __ INC T1 + 0 
52f6 : c9 0d __ CMP #$0d
52f8 : f0 07 __ BEQ $5301 ; (fgets.s9 + 0)
.s13:
52fa : c9 0a __ CMP #$0a
52fc : f0 03 __ BEQ $5301 ; (fgets.s9 + 0)
.s14:
52fe : 8a __ __ TXA
52ff : f0 d5 __ BEQ $52d6 ; (fgets.l8 + 0)
.s9:
5301 : 8a __ __ TXA
5302 : a6 44 __ LDX T2 + 0 
5304 : 9d 94 6e STA $6e94,x ; (krnio_pstatus[0] + 0)
5307 : a9 00 __ LDA #$00
5309 : a4 43 __ LDY T1 + 0 
530b : 91 45 __ STA (T3 + 0),y 
530d : 20 36 11 JSR $1136 ; (krnio_clrchn.s4 + 0)
5310 : a5 43 __ LDA T1 + 0 
5312 : d0 06 __ BNE $531a ; (fgets.s10 + 0)
.s6:
5314 : a9 00 __ LDA #$00
5316 : 85 1b __ STA ACCU + 0 
5318 : f0 06 __ BEQ $5320 ; (fgets.s3 + 0)
.s10:
531a : a5 45 __ LDA T3 + 0 
531c : 85 1b __ STA ACCU + 0 
531e : a5 46 __ LDA T3 + 1 
.s3:
5320 : 85 1c __ STA ACCU + 1 
5322 : 60 __ __ RTS
--------------------------------------------------------------------
parse_next_int@proxy: ; parse_next_int@proxy
5323 : a5 1b __ LDA ACCU + 0 
5325 : 85 0d __ STA P0 
5327 : a5 1c __ LDA ACCU + 1 
5329 : 85 0e __ STA P1 
--------------------------------------------------------------------
parse_next_int: ; parse_next_int(const u8*,i16*)->const u8*
; 235, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
532b : a9 00 __ LDA #$00
532d : 85 43 __ STA T0 + 0 
532f : 85 44 __ STA T0 + 1 
5331 : a9 01 __ LDA #$01
5333 : 85 47 __ STA T3 + 0 
5335 : a0 00 __ LDY #$00
5337 : b1 0d __ LDA (P0),y ; (str + 0)
5339 : f0 26 __ BEQ $5361 ; (parse_next_int.s5 + 0)
.l11:
533b : a5 0d __ LDA P0 ; (str + 0)
533d : 85 45 __ STA T1 + 0 
533f : a5 0e __ LDA P1 ; (str + 1)
5341 : 85 46 __ STA T1 + 1 
5343 : a0 00 __ LDY #$00
5345 : b1 0d __ LDA (P0),y ; (str + 0)
5347 : c9 30 __ CMP #$30
5349 : b0 03 __ BCS $534e ; (parse_next_int.s12 + 0)
534b : 4c ed 53 JMP $53ed ; (parse_next_int.s14 + 0)
.s12:
534e : a9 39 __ LDA #$39
5350 : d1 0d __ CMP (P0),y ; (str + 0)
5352 : b0 0d __ BCS $5361 ; (parse_next_int.s5 + 0)
.s13:
5354 : e6 0d __ INC P0 ; (str + 0)
5356 : d0 02 __ BNE $535a ; (parse_next_int.s20 + 0)
.s19:
5358 : e6 0e __ INC P1 ; (str + 1)
.s20:
535a : a0 01 __ LDY #$01
535c : b1 45 __ LDA (T1 + 0),y 
535e : d0 db __ BNE $533b ; (parse_next_int.l11 + 0)
.s21:
5360 : a8 __ __ TAY
.s5:
5361 : b1 0d __ LDA (P0),y ; (str + 0)
5363 : c9 2d __ CMP #$2d
5365 : d0 0a __ BNE $5371 ; (parse_next_int.s6 + 0)
.s10:
5367 : e6 0d __ INC P0 ; (str + 0)
5369 : d0 02 __ BNE $536d ; (parse_next_int.s16 + 0)
.s15:
536b : e6 0e __ INC P1 ; (str + 1)
.s16:
536d : a9 ff __ LDA #$ff
536f : 85 47 __ STA T3 + 0 
.s6:
5371 : b1 0d __ LDA (P0),y ; (str + 0)
5373 : c9 30 __ CMP #$30
5375 : 90 4b __ BCC $53c2 ; (parse_next_int.s7 + 0)
.l8:
5377 : a5 0d __ LDA P0 ; (str + 0)
5379 : 85 45 __ STA T1 + 0 
537b : a5 0e __ LDA P1 ; (str + 1)
537d : 85 46 __ STA T1 + 1 
537f : a0 00 __ LDY #$00
5381 : b1 0d __ LDA (P0),y ; (str + 0)
5383 : c9 3a __ CMP #$3a
5385 : b0 3b __ BCS $53c2 ; (parse_next_int.s7 + 0)
.s9:
5387 : e9 2f __ SBC #$2f
5389 : aa __ __ TAX
538a : 98 __ __ TYA
538b : e9 00 __ SBC #$00
538d : 85 1c __ STA ACCU + 1 
538f : e6 0d __ INC P0 ; (str + 0)
5391 : d0 02 __ BNE $5395 ; (parse_next_int.s18 + 0)
.s17:
5393 : e6 0e __ INC P1 ; (str + 1)
.s18:
5395 : a5 43 __ LDA T0 + 0 
5397 : 0a __ __ ASL
5398 : 85 1b __ STA ACCU + 0 
539a : a5 44 __ LDA T0 + 1 
539c : 2a __ __ ROL
539d : 06 1b __ ASL ACCU + 0 
539f : 2a __ __ ROL
53a0 : a8 __ __ TAY
53a1 : 18 __ __ CLC
53a2 : a5 1b __ LDA ACCU + 0 
53a4 : 65 43 __ ADC T0 + 0 
53a6 : 85 43 __ STA T0 + 0 
53a8 : 98 __ __ TYA
53a9 : 65 44 __ ADC T0 + 1 
53ab : 06 43 __ ASL T0 + 0 
53ad : 2a __ __ ROL
53ae : a8 __ __ TAY
53af : 8a __ __ TXA
53b0 : 18 __ __ CLC
53b1 : 65 43 __ ADC T0 + 0 
53b3 : 85 43 __ STA T0 + 0 
53b5 : 98 __ __ TYA
53b6 : 65 1c __ ADC ACCU + 1 
53b8 : 85 44 __ STA T0 + 1 
53ba : a0 01 __ LDY #$01
53bc : b1 45 __ LDA (T1 + 0),y 
53be : c9 30 __ CMP #$30
53c0 : b0 b5 __ BCS $5377 ; (parse_next_int.l8 + 0)
.s7:
53c2 : a5 47 __ LDA T3 + 0 
53c4 : 85 1b __ STA ACCU + 0 
53c6 : 29 80 __ AND #$80
53c8 : 10 02 __ BPL $53cc ; (parse_next_int.s7 + 10)
53ca : a9 ff __ LDA #$ff
53cc : 85 1c __ STA ACCU + 1 
53ce : a5 43 __ LDA T0 + 0 
53d0 : 85 03 __ STA WORK + 0 
53d2 : a5 44 __ LDA T0 + 1 
53d4 : 85 04 __ STA WORK + 1 
53d6 : 20 3c 69 JSR $693c ; (mul16 + 0)
53d9 : a5 05 __ LDA WORK + 2 
53db : a0 00 __ LDY #$00
53dd : 91 0f __ STA (P2),y ; (value + 0)
53df : a5 06 __ LDA WORK + 3 
53e1 : c8 __ __ INY
53e2 : 91 0f __ STA (P2),y ; (value + 0)
53e4 : a5 0d __ LDA P0 ; (str + 0)
53e6 : 85 1b __ STA ACCU + 0 
53e8 : a5 0e __ LDA P1 ; (str + 1)
53ea : 85 1c __ STA ACCU + 1 
.s3:
53ec : 60 __ __ RTS
.s14:
53ed : c9 2d __ CMP #$2d
53ef : d0 03 __ BNE $53f4 ; (parse_next_int.s14 + 7)
53f1 : 4c 61 53 JMP $5361 ; (parse_next_int.s5 + 0)
53f4 : 4c 54 53 JMP $5354 ; (parse_next_int.s13 + 0)
--------------------------------------------------------------------
drawline: ; drawline(i16,i16,i16,i16)->void
; 190, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
53f7 : a5 0e __ LDA P1 ; (x0 + 1)
53f9 : c5 12 __ CMP P5 ; (x1 + 1)
53fb : d0 08 __ BNE $5405 ; (drawline.s45 + 0)
.s42:
53fd : a5 0d __ LDA P0 ; (x0 + 0)
53ff : c5 11 __ CMP P4 ; (x1 + 0)
.s43:
5401 : 90 08 __ BCC $540b ; (drawline.s41 + 0)
5403 : b0 0e __ BCS $5413 ; (drawline.s5 + 0)
.s45:
5405 : 45 12 __ EOR P5 ; (x1 + 1)
5407 : 10 f8 __ BPL $5401 ; (drawline.s43 + 0)
.s44:
5409 : 90 08 __ BCC $5413 ; (drawline.s5 + 0)
.s41:
540b : a9 01 __ LDA #$01
540d : 85 43 __ STA T2 + 0 
540f : a9 00 __ LDA #$00
5411 : f0 04 __ BEQ $5417 ; (drawline.s6 + 0)
.s5:
5413 : a9 ff __ LDA #$ff
5415 : 85 43 __ STA T2 + 0 
.s6:
5417 : 85 44 __ STA T2 + 1 
5419 : a5 10 __ LDA P3 ; (y0 + 1)
541b : c5 14 __ CMP P7 ; (y1 + 1)
541d : d0 08 __ BNE $5427 ; (drawline.s40 + 0)
.s37:
541f : a5 0f __ LDA P2 ; (y0 + 0)
5421 : c5 13 __ CMP P6 ; (y1 + 0)
.s38:
5423 : 90 08 __ BCC $542d ; (drawline.s36 + 0)
5425 : b0 0e __ BCS $5435 ; (drawline.s7 + 0)
.s40:
5427 : 45 14 __ EOR P7 ; (y1 + 1)
5429 : 10 f8 __ BPL $5423 ; (drawline.s38 + 0)
.s39:
542b : 90 08 __ BCC $5435 ; (drawline.s7 + 0)
.s36:
542d : a9 01 __ LDA #$01
542f : 85 47 __ STA T5 + 0 
5431 : a9 00 __ LDA #$00
5433 : f0 04 __ BEQ $5439 ; (drawline.s8 + 0)
.s7:
5435 : a9 ff __ LDA #$ff
5437 : 85 47 __ STA T5 + 0 
.s8:
5439 : 85 48 __ STA T5 + 1 
543b : 38 __ __ SEC
543c : a5 11 __ LDA P4 ; (x1 + 0)
543e : e5 0d __ SBC P0 ; (x0 + 0)
5440 : 85 1b __ STA ACCU + 0 
5442 : a5 12 __ LDA P5 ; (x1 + 1)
5444 : e5 0e __ SBC P1 ; (x0 + 1)
5446 : 85 1c __ STA ACCU + 1 
5448 : 10 0d __ BPL $5457 ; (drawline.s9 + 0)
.s35:
544a : 38 __ __ SEC
544b : a9 00 __ LDA #$00
544d : e5 1b __ SBC ACCU + 0 
544f : 85 1b __ STA ACCU + 0 
5451 : a9 00 __ LDA #$00
5453 : e5 1c __ SBC ACCU + 1 
5455 : 85 1c __ STA ACCU + 1 
.s9:
5457 : 38 __ __ SEC
5458 : a5 13 __ LDA P6 ; (y1 + 0)
545a : e5 0f __ SBC P2 ; (y0 + 0)
545c : 85 45 __ STA T4 + 0 
545e : a5 14 __ LDA P7 ; (y1 + 1)
5460 : e5 10 __ SBC P3 ; (y0 + 1)
5462 : 85 46 __ STA T4 + 1 
5464 : 10 0d __ BPL $5473 ; (drawline.s10 + 0)
.s34:
5466 : 38 __ __ SEC
5467 : a9 00 __ LDA #$00
5469 : e5 45 __ SBC T4 + 0 
546b : 85 45 __ STA T4 + 0 
546d : a9 00 __ LDA #$00
546f : e5 46 __ SBC T4 + 1 
5471 : 85 46 __ STA T4 + 1 
.s10:
5473 : 38 __ __ SEC
5474 : a9 00 __ LDA #$00
5476 : e5 45 __ SBC T4 + 0 
5478 : 85 45 __ STA T4 + 0 
547a : a9 00 __ LDA #$00
547c : e5 46 __ SBC T4 + 1 
547e : 85 46 __ STA T4 + 1 
5480 : 18 __ __ CLC
5481 : a5 45 __ LDA T4 + 0 
5483 : 65 1b __ ADC ACCU + 0 
5485 : 85 49 __ STA T6 + 0 
5487 : a5 46 __ LDA T4 + 1 
.l46:
5489 : 65 1c __ ADC ACCU + 1 
548b : 85 4a __ STA T6 + 1 
.l11:
548d : a5 0e __ LDA P1 ; (x0 + 1)
548f : c9 01 __ CMP #$01
5491 : d0 04 __ BNE $5497 ; (drawline.s33 + 0)
.s32:
5493 : a5 0d __ LDA P0 ; (x0 + 0)
5495 : c9 40 __ CMP #$40
.s33:
5497 : b0 58 __ BCS $54f1 ; (drawline.s12 + 0)
.s26:
5499 : a5 10 __ LDA P3 ; (y0 + 1)
549b : d0 54 __ BNE $54f1 ; (drawline.s12 + 0)
.s31:
549d : a5 0f __ LDA P2 ; (y0 + 0)
549f : c9 c8 __ CMP #$c8
54a1 : b0 4e __ BCS $54f1 ; (drawline.s12 + 0)
.s27:
54a3 : a5 0d __ LDA P0 ; (x0 + 0)
54a5 : 29 07 __ AND #$07
54a7 : aa __ __ TAX
54a8 : a5 0f __ LDA P2 ; (y0 + 0)
54aa : 4a __ __ LSR
54ab : 4a __ __ LSR
54ac : 4a __ __ LSR
54ad : 85 4e __ STA T10 + 1 
54af : 18 __ __ CLC
54b0 : 6d 11 6e ADC $6e11 ; (bitmap + 1)
54b3 : a8 __ __ TAY
54b4 : a9 00 __ LDA #$00
54b6 : 46 4e __ LSR T10 + 1 
54b8 : 6a __ __ ROR
54b9 : 66 4e __ ROR T10 + 1 
54bb : 6a __ __ ROR
54bc : 6d 10 6e ADC $6e10 ; (bitmap + 0)
54bf : 85 4d __ STA T10 + 0 
54c1 : 98 __ __ TYA
54c2 : 65 4e __ ADC T10 + 1 
54c4 : a8 __ __ TAY
54c5 : a5 0d __ LDA P0 ; (x0 + 0)
54c7 : 29 f8 __ AND #$f8
54c9 : 18 __ __ CLC
54ca : 65 4d __ ADC T10 + 0 
54cc : 85 4d __ STA T10 + 0 
54ce : 98 __ __ TYA
54cf : 65 0e __ ADC P1 ; (x0 + 1)
54d1 : 85 4e __ STA T10 + 1 
54d3 : a5 0f __ LDA P2 ; (y0 + 0)
54d5 : 29 07 __ AND #$07
54d7 : a8 __ __ TAY
54d8 : ad 36 6e LDA $6e36 ; (drawing_mode + 0)
54db : 0d 37 6e ORA $6e37 ; (drawing_mode + 1)
54de : f0 0a __ BEQ $54ea ; (drawline.s30 + 0)
.s28:
54e0 : bd 2e 6e LDA $6e2e,x ; (bit_tab[0] + 0)
54e3 : 49 ff __ EOR #$ff
54e5 : 31 4d __ AND (T10 + 0),y 
54e7 : 4c ef 54 JMP $54ef ; (drawline.s29 + 0)
.s30:
54ea : bd 2e 6e LDA $6e2e,x ; (bit_tab[0] + 0)
54ed : 11 4d __ ORA (T10 + 0),y 
.s29:
54ef : 91 4d __ STA (T10 + 0),y 
.s12:
54f1 : a5 0e __ LDA P1 ; (x0 + 1)
54f3 : c5 12 __ CMP P5 ; (x1 + 1)
54f5 : d0 12 __ BNE $5509 ; (drawline.s13 + 0)
.s25:
54f7 : a5 0d __ LDA P0 ; (x0 + 0)
54f9 : c5 11 __ CMP P4 ; (x1 + 0)
54fb : d0 0c __ BNE $5509 ; (drawline.s13 + 0)
.s23:
54fd : a5 10 __ LDA P3 ; (y0 + 1)
54ff : c5 14 __ CMP P7 ; (y1 + 1)
5501 : d0 06 __ BNE $5509 ; (drawline.s13 + 0)
.s24:
5503 : a5 0f __ LDA P2 ; (y0 + 0)
5505 : c5 13 __ CMP P6 ; (y1 + 0)
5507 : f0 64 __ BEQ $556d ; (drawline.s3 + 0)
.s13:
5509 : a5 49 __ LDA T6 + 0 
550b : 0a __ __ ASL
550c : 85 4b __ STA T8 + 0 
550e : a5 4a __ LDA T6 + 1 
5510 : 2a __ __ ROL
5511 : 85 4c __ STA T8 + 1 
5513 : c5 46 __ CMP T4 + 1 
5515 : d0 08 __ BNE $551f ; (drawline.s22 + 0)
.s19:
5517 : a5 4b __ LDA T8 + 0 
5519 : c5 45 __ CMP T4 + 0 
.s20:
551b : b0 08 __ BCS $5525 ; (drawline.s18 + 0)
551d : 90 20 __ BCC $553f ; (drawline.s14 + 0)
.s22:
551f : 45 46 __ EOR T4 + 1 
5521 : 10 f8 __ BPL $551b ; (drawline.s20 + 0)
.s21:
5523 : b0 1a __ BCS $553f ; (drawline.s14 + 0)
.s18:
5525 : 18 __ __ CLC
5526 : a5 0d __ LDA P0 ; (x0 + 0)
5528 : 65 43 __ ADC T2 + 0 
552a : 85 0d __ STA P0 ; (x0 + 0)
552c : a5 0e __ LDA P1 ; (x0 + 1)
552e : 65 44 __ ADC T2 + 1 
5530 : 85 0e __ STA P1 ; (x0 + 1)
5532 : 18 __ __ CLC
5533 : a5 49 __ LDA T6 + 0 
5535 : 65 45 __ ADC T4 + 0 
5537 : 85 49 __ STA T6 + 0 
5539 : a5 4a __ LDA T6 + 1 
553b : 65 46 __ ADC T4 + 1 
553d : 85 4a __ STA T6 + 1 
.s14:
553f : 24 4c __ BIT T8 + 1 
5541 : 30 11 __ BMI $5554 ; (drawline.s15 + 0)
.s17:
5543 : a5 1c __ LDA ACCU + 1 
5545 : c5 4c __ CMP T8 + 1 
5547 : b0 03 __ BCS $554c ; (drawline.s47 + 0)
5549 : 4c 8d 54 JMP $548d ; (drawline.l11 + 0)
.s47:
554c : d0 06 __ BNE $5554 ; (drawline.s15 + 0)
.s16:
554e : a5 1b __ LDA ACCU + 0 
5550 : c5 4b __ CMP T8 + 0 
5552 : 90 f5 __ BCC $5549 ; (drawline.s17 + 6)
.s15:
5554 : 18 __ __ CLC
5555 : a5 0f __ LDA P2 ; (y0 + 0)
5557 : 65 47 __ ADC T5 + 0 
5559 : 85 0f __ STA P2 ; (y0 + 0)
555b : a5 10 __ LDA P3 ; (y0 + 1)
555d : 65 48 __ ADC T5 + 1 
555f : 85 10 __ STA P3 ; (y0 + 1)
5561 : 18 __ __ CLC
5562 : a5 49 __ LDA T6 + 0 
5564 : 65 1b __ ADC ACCU + 0 
5566 : 85 49 __ STA T6 + 0 
5568 : a5 4a __ LDA T6 + 1 
556a : 4c 89 54 JMP $5489 ; (drawline.l46 + 0)
.s3:
556d : 60 __ __ RTS
--------------------------------------------------------------------
load_plane_data: ; load_plane_data(i16)->void
; 301, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
556e : a2 04 __ LDX #$04
5570 : b5 53 __ LDA T4 + 0,x 
5572 : 9d ce fc STA $fcce,x ; (load_plane_data@stack + 0)
5575 : ca __ __ DEX
5576 : 10 f8 __ BPL $5570 ; (load_plane_data.s1 + 2)
.s4:
5578 : a9 33 __ LDA #$33
557a : 85 10 __ STA P3 
557c : a9 57 __ LDA #$57
557e : 85 11 __ STA P4 
5580 : 20 0d 46 JSR $460d ; (fopen@proxy + 0)
5583 : a5 1c __ LDA ACCU + 1 
5585 : 85 52 __ STA T2 + 1 
5587 : a5 1b __ LDA ACCU + 0 
5589 : 85 51 __ STA T2 + 0 
558b : d0 07 __ BNE $5594 ; (load_plane_data.s5 + 0)
.s28:
558d : a5 1c __ LDA ACCU + 1 
558f : d0 03 __ BNE $5594 ; (load_plane_data.s5 + 0)
5591 : 4c 22 57 JMP $5722 ; (load_plane_data.s3 + 0)
.s5:
5594 : a5 15 __ LDA P8 ; (capacity + 0)
5596 : 0a __ __ ASL
5597 : 85 1b __ STA ACCU + 0 
5599 : a5 16 __ LDA P9 ; (capacity + 1)
559b : 2a __ __ ROL
559c : 85 1c __ STA ACCU + 1 
559e : 20 fa 6c JSR $6cfa ; (crt_malloc + 0)
55a1 : a5 1b __ LDA ACCU + 0 
55a3 : 85 53 __ STA T4 + 0 
55a5 : 8d 38 6e STA $6e38 ; (plane_data + 0)
55a8 : a5 1c __ LDA ACCU + 1 
55aa : 85 54 __ STA T4 + 1 
55ac : 8d 39 6e STA $6e39 ; (plane_data + 1)
55af : a9 00 __ LDA #$00
55b1 : 85 55 __ STA T5 + 0 
55b3 : 85 56 __ STA T5 + 1 
.l6:
55b5 : a9 00 __ LDA #$00
55b7 : 85 4f __ STA T1 + 0 
55b9 : 85 50 __ STA T1 + 1 
55bb : a6 52 __ LDX T2 + 1 
55bd : 86 0f __ STX P2 
.l29:
55bf : 85 57 __ STA T6 + 0 
.l7:
55c1 : a5 51 __ LDA T2 + 0 
55c3 : 85 0e __ STA P1 
55c5 : 20 3e 57 JSR $573e ; (fgetc.s4 + 0)
55c8 : a5 1c __ LDA ACCU + 1 
55ca : a4 1b __ LDY ACCU + 0 
55cc : c9 ff __ CMP #$ff
55ce : d0 07 __ BNE $55d7 ; (load_plane_data.s15 + 0)
.s27:
55d0 : c0 ff __ CPY #$ff
55d2 : d0 03 __ BNE $55d7 ; (load_plane_data.s15 + 0)
55d4 : 4c db 56 JMP $56db ; (load_plane_data.s8 + 0)
.s15:
55d7 : aa __ __ TAX
55d8 : 30 12 __ BMI $55ec ; (load_plane_data.s16 + 0)
.s26:
55da : d0 04 __ BNE $55e0 ; (load_plane_data.s22 + 0)
.s25:
55dc : c0 30 __ CPY #$30
55de : 90 0c __ BCC $55ec ; (load_plane_data.s16 + 0)
.s22:
55e0 : aa __ __ TAX
55e1 : d0 09 __ BNE $55ec ; (load_plane_data.s16 + 0)
.s24:
55e3 : a9 39 __ LDA #$39
55e5 : c5 1b __ CMP ACCU + 0 
55e7 : 90 03 __ BCC $55ec ; (load_plane_data.s16 + 0)
55e9 : 4c ae 56 JMP $56ae ; (load_plane_data.s23 + 0)
.s16:
55ec : a5 57 __ LDA T6 + 0 
55ee : f0 d1 __ BEQ $55c1 ; (load_plane_data.l7 + 0)
.s17:
55f0 : 24 16 __ BIT P9 ; (capacity + 1)
55f2 : 30 c1 __ BMI $55b5 ; (load_plane_data.l6 + 0)
.s21:
55f4 : a5 56 __ LDA T5 + 1 
55f6 : c5 16 __ CMP P9 ; (capacity + 1)
55f8 : d0 04 __ BNE $55fe ; (load_plane_data.s20 + 0)
.s19:
55fa : a5 55 __ LDA T5 + 0 
55fc : c5 15 __ CMP P8 ; (capacity + 0)
.s20:
55fe : b0 b5 __ BCS $55b5 ; (load_plane_data.l6 + 0)
.s18:
5600 : a9 02 __ LDA #$02
5602 : 85 0f __ STA P2 
5604 : 85 13 __ STA P6 
5606 : a9 00 __ LDA #$00
5608 : 85 10 __ STA P3 
560a : 85 14 __ STA P7 
560c : a5 55 __ LDA T5 + 0 
560e : 0a __ __ ASL
560f : 85 43 __ STA T0 + 0 
5611 : a5 56 __ LDA T5 + 1 
5613 : 2a __ __ ROL
5614 : 18 __ __ CLC
5615 : 65 54 __ ADC T4 + 1 
5617 : 85 44 __ STA T0 + 1 
5619 : a5 4f __ LDA T1 + 0 
561b : a4 53 __ LDY T4 + 0 
561d : 91 43 __ STA (T0 + 0),y 
561f : a5 50 __ LDA T1 + 1 
5621 : c8 __ __ INY
5622 : 91 43 __ STA (T0 + 0),y 
5624 : a5 16 __ LDA P9 ; (capacity + 1)
5626 : 85 04 __ STA WORK + 1 
5628 : a9 00 __ LDA #$00
562a : 85 06 __ STA WORK + 3 
562c : 85 05 __ STA WORK + 2 
562e : 85 1b __ STA ACCU + 0 
5630 : 85 1d __ STA ACCU + 2 
5632 : 85 1e __ STA ACCU + 3 
5634 : a5 15 __ LDA P8 ; (capacity + 0)
5636 : 85 03 __ STA WORK + 0 
5638 : 20 aa 6b JSR $6baa ; (divs32@proxy + 0)
563b : a5 1b __ LDA ACCU + 0 
563d : 85 03 __ STA WORK + 0 
563f : a5 1c __ LDA ACCU + 1 
5641 : 85 04 __ STA WORK + 1 
5643 : a5 1d __ LDA ACCU + 2 
5645 : 85 05 __ STA WORK + 2 
5647 : a5 1e __ LDA ACCU + 3 
5649 : 85 06 __ STA WORK + 3 
564b : 18 __ __ CLC
564c : a5 55 __ LDA T5 + 0 
564e : 69 01 __ ADC #$01
5650 : 85 55 __ STA T5 + 0 
5652 : 85 1b __ STA ACCU + 0 
5654 : a5 56 __ LDA T5 + 1 
5656 : 69 00 __ ADC #$00
5658 : 85 56 __ STA T5 + 1 
565a : 85 1c __ STA ACCU + 1 
565c : a9 00 __ LDA #$00
565e : 85 1d __ STA ACCU + 2 
5660 : 85 1e __ STA ACCU + 3 
5662 : 20 42 6b JSR $6b42 ; (mul32 + 0)
5665 : a5 07 __ LDA WORK + 4 
5667 : 85 43 __ STA T0 + 0 
5669 : a5 08 __ LDA WORK + 5 
566b : 85 44 __ STA T0 + 1 
566d : a5 09 __ LDA WORK + 6 
566f : 85 45 __ STA T0 + 2 
5671 : a5 0a __ LDA WORK + 7 
5673 : 4a __ __ LSR
5674 : 66 45 __ ROR T0 + 2 
5676 : 66 44 __ ROR T0 + 1 
5678 : 66 43 __ ROR T0 + 0 
567a : 4a __ __ LSR
567b : 66 45 __ ROR T0 + 2 
567d : 66 44 __ ROR T0 + 1 
567f : 66 43 __ ROR T0 + 0 
5681 : 4a __ __ LSR
5682 : 66 45 __ ROR T0 + 2 
5684 : 66 44 __ ROR T0 + 1 
5686 : 66 43 __ ROR T0 + 0 
5688 : 4a __ __ LSR
5689 : 66 45 __ ROR T0 + 2 
568b : 66 44 __ ROR T0 + 1 
568d : 66 43 __ ROR T0 + 0 
568f : 4a __ __ LSR
5690 : 66 45 __ ROR T0 + 2 
5692 : 66 44 __ ROR T0 + 1 
5694 : 66 43 __ ROR T0 + 0 
5696 : 4a __ __ LSR
5697 : 66 45 __ ROR T0 + 2 
5699 : 66 44 __ ROR T0 + 1 
569b : a5 43 __ LDA T0 + 0 
569d : 6a __ __ ROR
569e : 85 0d __ STA P0 
56a0 : 85 11 __ STA P4 
56a2 : a5 44 __ LDA T0 + 1 
56a4 : 85 0e __ STA P1 
56a6 : 85 12 __ STA P5 
56a8 : 20 f7 53 JSR $53f7 ; (drawline.s4 + 0)
56ab : 4c b5 55 JMP $55b5 ; (load_plane_data.l6 + 0)
.s23:
56ae : a5 4f __ LDA T1 + 0 
56b0 : 0a __ __ ASL
56b1 : 85 1b __ STA ACCU + 0 
56b3 : a5 50 __ LDA T1 + 1 
56b5 : 2a __ __ ROL
56b6 : 06 1b __ ASL ACCU + 0 
56b8 : 2a __ __ ROL
56b9 : aa __ __ TAX
56ba : 18 __ __ CLC
56bb : a5 1b __ LDA ACCU + 0 
56bd : 65 4f __ ADC T1 + 0 
56bf : 85 4f __ STA T1 + 0 
56c1 : 8a __ __ TXA
56c2 : 65 50 __ ADC T1 + 1 
56c4 : 06 4f __ ASL T1 + 0 
56c6 : 2a __ __ ROL
56c7 : aa __ __ TAX
56c8 : 98 __ __ TYA
56c9 : 38 __ __ SEC
56ca : e9 30 __ SBC #$30
56cc : 18 __ __ CLC
56cd : 65 4f __ ADC T1 + 0 
56cf : 85 4f __ STA T1 + 0 
56d1 : 90 01 __ BCC $56d4 ; (load_plane_data.s31 + 0)
.s30:
56d3 : e8 __ __ INX
.s31:
56d4 : 86 50 __ STX T1 + 1 
56d6 : a9 01 __ LDA #$01
56d8 : 4c bf 55 JMP $55bf ; (load_plane_data.l29 + 0)
.s8:
56db : c8 __ __ INY
56dc : b1 51 __ LDA (T2 + 0),y 
56de : aa __ __ TAX
56df : a5 57 __ LDA T6 + 0 
56e1 : f0 2c __ BEQ $570f ; (load_plane_data.s9 + 0)
.s10:
56e3 : 24 16 __ BIT P9 ; (capacity + 1)
56e5 : 30 28 __ BMI $570f ; (load_plane_data.s9 + 0)
.s14:
56e7 : a5 56 __ LDA T5 + 1 
56e9 : c5 16 __ CMP P9 ; (capacity + 1)
56eb : d0 40 __ BNE $572d ; (load_plane_data.s13 + 0)
.s12:
56ed : a5 55 __ LDA T5 + 0 
56ef : c5 15 __ CMP P8 ; (capacity + 0)
56f1 : b0 1c __ BCS $570f ; (load_plane_data.s9 + 0)
.s11:
56f3 : 0a __ __ ASL
56f4 : 85 43 __ STA T0 + 0 
56f6 : a5 56 __ LDA T5 + 1 
56f8 : 2a __ __ ROL
56f9 : 18 __ __ CLC
56fa : 65 54 __ ADC T4 + 1 
56fc : 85 44 __ STA T0 + 1 
56fe : a5 4f __ LDA T1 + 0 
5700 : a4 53 __ LDY T4 + 0 
5702 : 91 43 __ STA (T0 + 0),y 
5704 : a5 50 __ LDA T1 + 1 
5706 : c8 __ __ INY
5707 : 91 43 __ STA (T0 + 0),y 
5709 : e6 55 __ INC T5 + 0 
570b : d0 02 __ BNE $570f ; (load_plane_data.s9 + 0)
.s32:
570d : e6 56 __ INC T5 + 1 
.s9:
570f : a5 55 __ LDA T5 + 0 
5711 : 8d 3a 6e STA $6e3a ; (plane_data_count + 0)
5714 : a5 56 __ LDA T5 + 1 
5716 : 8d 3b 6e STA $6e3b ; (plane_data_count + 1)
5719 : 8a __ __ TXA
571a : 20 40 11 JSR $1140 ; (krnio_close.s4 + 0)
571d : a9 00 __ LDA #$00
571f : a8 __ __ TAY
5720 : 91 51 __ STA (T2 + 0),y 
.s3:
5722 : a2 04 __ LDX #$04
5724 : bd ce fc LDA $fcce,x ; (load_plane_data@stack + 0)
5727 : 95 53 __ STA T4 + 0,x 
5729 : ca __ __ DEX
572a : 10 f8 __ BPL $5724 ; (load_plane_data.s3 + 2)
572c : 60 __ __ RTS
.s13:
572d : b0 e0 __ BCS $570f ; (load_plane_data.s9 + 0)
.s33:
572f : a5 55 __ LDA T5 + 0 
5731 : 90 c0 __ BCC $56f3 ; (load_plane_data.s11 + 0)
--------------------------------------------------------------------
5733 : __ __ __ BYT 50 4c 41 4e 45 53 2c 53 2c 52 00                : PLANES,S,R.
--------------------------------------------------------------------
fgetc: ; fgetc(struct FILE*)->i16
;  44, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
573e : a0 00 __ LDY #$00
5740 : b1 0e __ LDA (P1),y ; (stream + 0)
5742 : 10 10 __ BPL $5754 ; (fgetc.s8 + 0)
.s5:
5744 : 20 4e 11 JSR $114e ; (bsget + 0)
5747 : c9 0d __ CMP #$0d
5749 : d0 02 __ BNE $574d ; (fgetc.s6 + 0)
.s7:
574b : a9 0a __ LDA #$0a
.s6:
574d : 85 1b __ STA ACCU + 0 
574f : a9 00 __ LDA #$00
.s3:
5751 : 85 1c __ STA ACCU + 1 
5753 : 60 __ __ RTS
.s8:
5754 : 85 43 __ STA T0 + 0 
5756 : a8 __ __ TAY
5757 : b9 94 6e LDA $6e94,y ; (krnio_pstatus[0] + 0)
575a : c9 40 __ CMP #$40
575c : f0 43 __ BEQ $57a1 ; (fgetc.s16 + 0)
.s9:
575e : 98 __ __ TYA
575f : 20 fb 10 JSR $10fb ; (krnio_chkin.s4 + 0)
5762 : aa __ __ TAX
5763 : d0 12 __ BNE $5777 ; (fgetc.s12 + 0)
.s10:
5765 : a9 ff __ LDA #$ff
5767 : 85 43 __ STA T0 + 0 
5769 : 85 44 __ STA T0 + 1 
.s11:
576b : 20 36 11 JSR $1136 ; (krnio_clrchn.s4 + 0)
576e : a5 43 __ LDA T0 + 0 
5770 : 85 1b __ STA ACCU + 0 
5772 : a5 44 __ LDA T0 + 1 
5774 : 4c 51 57 JMP $5751 ; (fgetc.s3 + 0)
.s12:
5777 : 20 16 11 JSR $1116 ; (krnio_chrin.s4 + 0)
577a : 85 45 __ STA T2 + 0 
577c : 20 24 11 JSR $1124 ; (krnio_status.s4 + 0)
577f : a6 43 __ LDX T0 + 0 
5781 : 9d 94 6e STA $6e94,x ; (krnio_pstatus[0] + 0)
5784 : a6 45 __ LDX T2 + 0 
5786 : 86 43 __ STX T0 + 0 
5788 : a2 00 __ LDX #$00
578a : 86 44 __ STX T0 + 1 
578c : aa __ __ TAX
578d : f0 dc __ BEQ $576b ; (fgetc.s11 + 0)
.s13:
578f : c9 40 __ CMP #$40
5791 : d0 0b __ BNE $579e ; (fgetc.s14 + 0)
.s15:
5793 : 20 36 11 JSR $1136 ; (krnio_clrchn.s4 + 0)
5796 : a5 45 __ LDA T2 + 0 
5798 : 85 1b __ STA ACCU + 0 
579a : a9 01 __ LDA #$01
579c : d0 b3 __ BNE $5751 ; (fgetc.s3 + 0)
.s14:
579e : 20 36 11 JSR $1136 ; (krnio_clrchn.s4 + 0)
.s16:
57a1 : a9 ff __ LDA #$ff
57a3 : 85 1b __ STA ACCU + 0 
57a5 : d0 aa __ BNE $5751 ; (fgetc.s3 + 0)
--------------------------------------------------------------------
SetViewPage1: ; SetViewPage1()->void
;  65, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
57a7 : ad 12 ff LDA $ff12 
57aa : 29 c3 __ AND #$c3
57ac : 09 08 __ ORA #$08
57ae : 8d 12 ff STA $ff12 
.s3:
57b1 : 60 __ __ RTS
--------------------------------------------------------------------
render_full_rotation: ; render_full_rotation(i16,i16,i16,i16,i16,i16,i16,i16)->void
; 346, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
57b2 : a2 1b __ LDX #$1b
57b4 : b5 53 __ LDA T7 + 0,x 
57b6 : 9d d0 fc STA $fcd0,x ; (render_full_rotation@stack + 0)
57b9 : ca __ __ DEX
57ba : 10 f8 __ BPL $57b4 ; (render_full_rotation.s1 + 2)
.s4:
57bc : ad fa fc LDA $fcfa ; (sstack + 2)
57bf : 85 4b __ STA T3 + 0 
57c1 : ad fb fc LDA $fcfb ; (sstack + 3)
57c4 : 30 06 __ BMI $57cc ; (render_full_rotation.s3 + 0)
.s7:
57c6 : 85 4c __ STA T3 + 1 
57c8 : 05 4b __ ORA T3 + 0 
57ca : d0 0b __ BNE $57d7 ; (render_full_rotation.s5 + 0)
.s3:
57cc : a2 1b __ LDX #$1b
57ce : bd d0 fc LDA $fcd0,x ; (render_full_rotation@stack + 0)
57d1 : 95 53 __ STA T7 + 0,x 
57d3 : ca __ __ DEX
57d4 : 10 f8 __ BPL $57ce ; (render_full_rotation.s3 + 2)
57d6 : 60 __ __ RTS
.s5:
57d7 : a5 0d __ LDA P0 ; (degX + 0)
57d9 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
57db : a5 0e __ LDA P1 ; (degX + 1)
57dd : 85 1c __ STA ACCU + 1 ; (num_points + 1)
57df : 20 50 6a JSR $6a50 ; (mods16@proxy + 0)
57e2 : 20 de 6d JSR $6dde ; (divs16@proxy + 0)
57e5 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
57e7 : 85 43 __ STA T0 + 0 
57e9 : 18 __ __ CLC
57ea : 69 12 __ ADC #$12
57ec : 85 1b __ STA ACCU + 0 ; (num_points + 0)
57ee : a9 00 __ LDA #$00
57f0 : 85 04 __ STA WORK + 1 
57f2 : 2a __ __ ROL
57f3 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
57f5 : 20 c7 69 JSR $69c7 ; (divmod@proxy + 0)
57f8 : a6 05 __ LDX WORK + 2 
57fa : bd 3c 6e LDA $6e3c,x ; (sin_tab[0] + 0)
57fd : 85 4d __ STA T4 + 0 
57ff : 29 80 __ AND #$80
5801 : 10 02 __ BPL $5805 ; (render_full_rotation.s5 + 46)
5803 : a9 ff __ LDA #$ff
5805 : 85 4e __ STA T4 + 1 
5807 : a5 43 __ LDA T0 + 0 
5809 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
580b : a9 00 __ LDA #$00
580d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
580f : 85 04 __ STA WORK + 1 
5811 : 20 c7 69 JSR $69c7 ; (divmod@proxy + 0)
5814 : a6 05 __ LDX WORK + 2 
5816 : bd 3c 6e LDA $6e3c,x ; (sin_tab[0] + 0)
5819 : 85 4f __ STA T5 + 0 
581b : 29 80 __ AND #$80
581d : 10 02 __ BPL $5821 ; (render_full_rotation.s5 + 74)
581f : a9 ff __ LDA #$ff
5821 : 85 50 __ STA T5 + 1 
5823 : a5 0f __ LDA P2 ; (degY + 0)
5825 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5827 : a5 10 __ LDA P3 ; (degY + 1)
5829 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
582b : 20 50 6a JSR $6a50 ; (mods16@proxy + 0)
582e : 20 de 6d JSR $6dde ; (divs16@proxy + 0)
5831 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
5833 : 85 43 __ STA T0 + 0 
5835 : 18 __ __ CLC
5836 : 69 12 __ ADC #$12
5838 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
583a : a9 00 __ LDA #$00
583c : 85 04 __ STA WORK + 1 
583e : 2a __ __ ROL
583f : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5841 : 20 c7 69 JSR $69c7 ; (divmod@proxy + 0)
5844 : a6 05 __ LDX WORK + 2 
5846 : bd 3c 6e LDA $6e3c,x ; (sin_tab[0] + 0)
5849 : 85 51 __ STA T6 + 0 
584b : 29 80 __ AND #$80
584d : 10 02 __ BPL $5851 ; (render_full_rotation.s5 + 122)
584f : a9 ff __ LDA #$ff
5851 : 85 52 __ STA T6 + 1 
5853 : a5 43 __ LDA T0 + 0 
5855 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5857 : a9 00 __ LDA #$00
5859 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
585b : 85 04 __ STA WORK + 1 
585d : 20 c7 69 JSR $69c7 ; (divmod@proxy + 0)
5860 : a6 05 __ LDX WORK + 2 
5862 : bd 3c 6e LDA $6e3c,x ; (sin_tab[0] + 0)
5865 : 85 53 __ STA T7 + 0 
5867 : 29 80 __ AND #$80
5869 : 10 02 __ BPL $586d ; (render_full_rotation.s5 + 150)
586b : a9 ff __ LDA #$ff
586d : 85 54 __ STA T7 + 1 
586f : 38 __ __ SEC
5870 : a9 00 __ LDA #$00
5872 : fd 3c 6e SBC $6e3c,x ; (sin_tab[0] + 0)
5875 : 85 55 __ STA T8 + 0 
5877 : a9 00 __ LDA #$00
5879 : e5 54 __ SBC T7 + 1 
587b : 85 56 __ STA T8 + 1 
587d : a5 11 __ LDA P4 ; (degZ + 0)
587f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5881 : a5 12 __ LDA P5 ; (degZ + 1)
5883 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5885 : 20 50 6a JSR $6a50 ; (mods16@proxy + 0)
5888 : 20 de 6d JSR $6dde ; (divs16@proxy + 0)
588b : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
588d : 85 43 __ STA T0 + 0 
588f : a9 00 __ LDA #$00
5891 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5893 : 85 04 __ STA WORK + 1 
5895 : 20 c7 69 JSR $69c7 ; (divmod@proxy + 0)
5898 : a6 05 __ LDX WORK + 2 
589a : bd 3c 6e LDA $6e3c,x ; (sin_tab[0] + 0)
589d : 85 57 __ STA T9 + 0 
589f : 29 80 __ AND #$80
58a1 : 10 02 __ BPL $58a5 ; (render_full_rotation.s5 + 206)
58a3 : a9 ff __ LDA #$ff
58a5 : 85 58 __ STA T9 + 1 
58a7 : 18 __ __ CLC
58a8 : a5 43 __ LDA T0 + 0 
58aa : 69 12 __ ADC #$12
58ac : 85 1b __ STA ACCU + 0 ; (num_points + 0)
58ae : a9 00 __ LDA #$00
58b0 : 85 04 __ STA WORK + 1 
58b2 : 2a __ __ ROL
58b3 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
58b5 : 20 c7 69 JSR $69c7 ; (divmod@proxy + 0)
58b8 : a6 05 __ LDX WORK + 2 
58ba : bd 3c 6e LDA $6e3c,x ; (sin_tab[0] + 0)
58bd : 85 59 __ STA T10 + 0 
58bf : 29 80 __ AND #$80
58c1 : 10 02 __ BPL $58c5 ; (render_full_rotation.s5 + 238)
58c3 : a9 ff __ LDA #$ff
58c5 : 85 5a __ STA T10 + 1 
58c7 : ad f8 fc LDA $fcf8 ; (sstack + 0)
58ca : 85 5b __ STA T11 + 0 
58cc : ad f9 fc LDA $fcf9 ; (sstack + 1)
58cf : 85 5c __ STA T11 + 1 
58d1 : 29 80 __ AND #$80
58d3 : 10 02 __ BPL $58d7 ; (render_full_rotation.s5 + 256)
58d5 : a9 ff __ LDA #$ff
58d7 : 85 45 __ STA T0 + 2 
58d9 : ad ac 6e LDA $6eac ; (x_pct + 0)
58dc : 85 5d __ STA T12 + 0 
58de : ad ad 6e LDA $6ead ; (x_pct + 1)
58e1 : 85 5e __ STA T12 + 1 
58e3 : ad ae 6e LDA $6eae ; (y_pct + 0)
58e6 : 85 5f __ STA T13 + 0 
58e8 : ad af 6e LDA $6eaf ; (y_pct + 1)
58eb : 85 60 __ STA T13 + 1 
58ed : ad b0 6e LDA $6eb0 ; (z_pct + 0)
58f0 : 85 61 __ STA T14 + 0 
58f2 : ad b1 6e LDA $6eb1 ; (z_pct + 1)
58f5 : 85 62 __ STA T14 + 1 
58f7 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
58fa : 85 63 __ STA T15 + 0 
58fc : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
58ff : 85 64 __ STA T15 + 1 
5901 : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
5904 : 85 65 __ STA T16 + 0 
5906 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
5909 : 85 66 __ STA T16 + 1 
590b : ad b2 6e LDA $6eb2 ; (z_rotated + 0)
590e : 85 67 __ STA T17 + 0 
5910 : ad b3 6e LDA $6eb3 ; (z_rotated + 1)
5913 : 85 68 __ STA T17 + 1 
.l6:
5915 : a0 00 __ LDY #$00
5917 : b1 61 __ LDA (T14 + 0),y 
5919 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
591b : c8 __ __ INY
591c : b1 61 __ LDA (T14 + 0),y 
591e : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5920 : 20 34 69 JSR $6934 ; (mul16@proxy + 0)
5923 : 20 7e 69 JSR $697e ; (divs16@proxy + 0)
5926 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
5928 : 85 46 __ STA T1 + 0 
592a : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
592c : 85 47 __ STA T1 + 1 
592e : a5 4d __ LDA T4 + 0 
5930 : 85 03 __ STA WORK + 0 
5932 : a5 4e __ LDA T4 + 1 
5934 : 85 04 __ STA WORK + 1 
5936 : 20 3c 69 JSR $693c ; (mul16 + 0)
5939 : a5 05 __ LDA WORK + 2 
593b : 85 69 __ STA T21 + 0 
593d : a5 06 __ LDA WORK + 3 
593f : 85 6a __ STA T21 + 1 
5941 : a0 00 __ LDY #$00
5943 : b1 5f __ LDA (T13 + 0),y 
5945 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5947 : c8 __ __ INY
5948 : b1 5f __ LDA (T13 + 0),y 
594a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
594c : 20 34 69 JSR $6934 ; (mul16@proxy + 0)
594f : 20 7e 69 JSR $697e ; (divs16@proxy + 0)
5952 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
5954 : 85 6b __ STA T22 + 0 
5956 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
5958 : 85 6c __ STA T22 + 1 
595a : 20 d3 6d JSR $6dd3 ; (mul16@proxy + 0)
595d : 18 __ __ CLC
595e : a5 05 __ LDA WORK + 2 
5960 : 65 69 __ ADC T21 + 0 
5962 : 85 69 __ STA T21 + 0 
5964 : a5 06 __ LDA WORK + 3 
5966 : 65 6a __ ADC T21 + 1 
5968 : 06 69 __ ASL T21 + 0 
596a : 2a __ __ ROL
596b : 85 6a __ STA T21 + 1 
596d : a9 00 __ LDA #$00
596f : 69 ff __ ADC #$ff
5971 : 49 ff __ EOR #$ff
5973 : 06 69 __ ASL T21 + 0 
5975 : 26 6a __ ROL T21 + 1 
5977 : 2a __ __ ROL
5978 : a6 6a __ LDX T21 + 1 
597a : 86 69 __ STX T21 + 0 
597c : 86 1b __ STX ACCU + 0 ; (num_points + 0)
597e : 85 6a __ STA T21 + 1 
5980 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5982 : a5 51 __ LDA T6 + 0 
5984 : 85 03 __ STA WORK + 0 
5986 : a5 52 __ LDA T6 + 1 
5988 : 85 04 __ STA WORK + 1 
598a : 20 3c 69 JSR $693c ; (mul16 + 0)
598d : a5 05 __ LDA WORK + 2 
598f : 85 6d __ STA T23 + 0 
5991 : a5 06 __ LDA WORK + 3 
5993 : 85 6e __ STA T23 + 1 
5995 : a0 00 __ LDY #$00
5997 : b1 5d __ LDA (T12 + 0),y 
5999 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
599b : c8 __ __ INY
599c : b1 5d __ LDA (T12 + 0),y 
599e : 85 1c __ STA ACCU + 1 ; (num_points + 1)
59a0 : 20 34 69 JSR $6934 ; (mul16@proxy + 0)
59a3 : 20 7e 69 JSR $697e ; (divs16@proxy + 0)
59a6 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
59a8 : 85 48 __ STA T2 + 0 
59aa : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
59ac : 85 49 __ STA T2 + 1 
59ae : a5 55 __ LDA T8 + 0 
59b0 : 85 03 __ STA WORK + 0 
59b2 : a5 56 __ LDA T8 + 1 
59b4 : 85 04 __ STA WORK + 1 
59b6 : 20 3c 69 JSR $693c ; (mul16 + 0)
59b9 : 18 __ __ CLC
59ba : a5 05 __ LDA WORK + 2 
59bc : 65 6d __ ADC T23 + 0 
59be : 85 6d __ STA T23 + 0 
59c0 : a5 06 __ LDA WORK + 3 
59c2 : 65 6e __ ADC T23 + 1 
59c4 : 06 6d __ ASL T23 + 0 
59c6 : 2a __ __ ROL
59c7 : 85 6e __ STA T23 + 1 
59c9 : a9 00 __ LDA #$00
59cb : 69 ff __ ADC #$ff
59cd : 49 ff __ EOR #$ff
59cf : 06 6d __ ASL T23 + 0 
59d1 : 26 6e __ ROL T23 + 1 
59d3 : 2a __ __ ROL
59d4 : a6 6e __ LDX T23 + 1 
59d6 : 86 6d __ STX T23 + 0 
59d8 : 85 6e __ STA T23 + 1 
59da : a0 01 __ LDY #$01
59dc : 91 67 __ STA (T17 + 0),y 
59de : 8a __ __ TXA
59df : 88 __ __ DEY
59e0 : 91 67 __ STA (T17 + 0),y 
59e2 : a5 4d __ LDA T4 + 0 
59e4 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
59e6 : a5 4e __ LDA T4 + 1 
59e8 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
59ea : a5 6b __ LDA T22 + 0 
59ec : 85 03 __ STA WORK + 0 
59ee : a5 6c __ LDA T22 + 1 
59f0 : 85 04 __ STA WORK + 1 
59f2 : 20 3c 69 JSR $693c ; (mul16 + 0)
59f5 : a5 05 __ LDA WORK + 2 
59f7 : 85 6b __ STA T22 + 0 
59f9 : a5 06 __ LDA WORK + 3 
59fb : 85 6c __ STA T22 + 1 
59fd : a5 46 __ LDA T1 + 0 
59ff : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5a01 : a5 47 __ LDA T1 + 1 
5a03 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5a05 : 20 d3 6d JSR $6dd3 ; (mul16@proxy + 0)
5a08 : 38 __ __ SEC
5a09 : a5 6b __ LDA T22 + 0 
5a0b : e5 05 __ SBC WORK + 2 
5a0d : aa __ __ TAX
5a0e : a5 6c __ LDA T22 + 1 
5a10 : 86 6c __ STX T22 + 1 
5a12 : e5 06 __ SBC WORK + 3 
5a14 : 06 6c __ ASL T22 + 1 
5a16 : 2a __ __ ROL
5a17 : 85 6b __ STA T22 + 0 
5a19 : a9 00 __ LDA #$00
5a1b : 69 ff __ ADC #$ff
5a1d : 49 ff __ EOR #$ff
5a1f : 06 6c __ ASL T22 + 1 
5a21 : 26 6b __ ROL T22 + 0 
5a23 : 2a __ __ ROL
5a24 : 85 6c __ STA T22 + 1 
5a26 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5a28 : a5 6b __ LDA T22 + 0 
5a2a : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5a2c : a5 57 __ LDA T9 + 0 
5a2e : 85 03 __ STA WORK + 0 
5a30 : a5 58 __ LDA T9 + 1 
5a32 : 85 04 __ STA WORK + 1 
5a34 : 20 3c 69 JSR $693c ; (mul16 + 0)
5a37 : a5 05 __ LDA WORK + 2 
5a39 : 85 46 __ STA T1 + 0 
5a3b : a5 06 __ LDA WORK + 3 
5a3d : 85 47 __ STA T1 + 1 
5a3f : a5 51 __ LDA T6 + 0 
5a41 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5a43 : a5 52 __ LDA T6 + 1 
5a45 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5a47 : a5 48 __ LDA T2 + 0 
5a49 : 85 03 __ STA WORK + 0 
5a4b : a5 49 __ LDA T2 + 1 
5a4d : 85 04 __ STA WORK + 1 
5a4f : 20 3c 69 JSR $693c ; (mul16 + 0)
5a52 : a5 05 __ LDA WORK + 2 
5a54 : 85 48 __ STA T2 + 0 
5a56 : a5 06 __ LDA WORK + 3 
5a58 : 85 49 __ STA T2 + 1 
5a5a : a5 69 __ LDA T21 + 0 
5a5c : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5a5e : a5 6a __ LDA T21 + 1 
5a60 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5a62 : a5 53 __ LDA T7 + 0 
5a64 : 85 03 __ STA WORK + 0 
5a66 : a5 54 __ LDA T7 + 1 
5a68 : 85 04 __ STA WORK + 1 
5a6a : 20 3c 69 JSR $693c ; (mul16 + 0)
5a6d : 18 __ __ CLC
5a6e : a5 05 __ LDA WORK + 2 
5a70 : 65 48 __ ADC T2 + 0 
5a72 : 85 6a __ STA T21 + 1 
5a74 : a5 06 __ LDA WORK + 3 
5a76 : 65 49 __ ADC T2 + 1 
5a78 : 06 6a __ ASL T21 + 1 
5a7a : 2a __ __ ROL
5a7b : 85 69 __ STA T21 + 0 
5a7d : a9 00 __ LDA #$00
5a7f : 69 ff __ ADC #$ff
5a81 : 49 ff __ EOR #$ff
5a83 : 06 6a __ ASL T21 + 1 
5a85 : 26 69 __ ROL T21 + 0 
5a87 : 2a __ __ ROL
5a88 : 85 6a __ STA T21 + 1 
5a8a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5a8c : a5 69 __ LDA T21 + 0 
5a8e : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5a90 : 20 c8 6d JSR $6dc8 ; (mul16@proxy + 0)
5a93 : 38 __ __ SEC
5a94 : a5 05 __ LDA WORK + 2 
5a96 : e5 46 __ SBC T1 + 0 
5a98 : 85 46 __ STA T1 + 0 
5a9a : a5 06 __ LDA WORK + 3 
5a9c : e5 47 __ SBC T1 + 1 
5a9e : 06 46 __ ASL T1 + 0 
5aa0 : 2a __ __ ROL
5aa1 : 85 47 __ STA T1 + 1 
5aa3 : a9 00 __ LDA #$00
5aa5 : 69 ff __ ADC #$ff
5aa7 : 49 ff __ EOR #$ff
5aa9 : 06 46 __ ASL T1 + 0 
5aab : 26 47 __ ROL T1 + 1 
5aad : 2a __ __ ROL
5aae : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5ab0 : a6 47 __ LDX T1 + 1 
5ab2 : 86 1b __ STX ACCU + 0 ; (num_points + 0)
5ab4 : 29 80 __ AND #$80
5ab6 : 10 02 __ BPL $5aba ; (render_full_rotation.l6 + 421)
5ab8 : a9 ff __ LDA #$ff
5aba : 85 1d __ STA ACCU + 2 
5abc : 85 1e __ STA ACCU + 3 
5abe : a5 5b __ LDA T11 + 0 
5ac0 : 85 03 __ STA WORK + 0 
5ac2 : a5 5c __ LDA T11 + 1 
5ac4 : 85 04 __ STA WORK + 1 
5ac6 : a5 45 __ LDA T0 + 2 
5ac8 : 85 05 __ STA WORK + 2 
5aca : 85 06 __ STA WORK + 3 
5acc : 20 42 6b JSR $6b42 ; (mul32 + 0)
5acf : 18 __ __ CLC
5ad0 : a5 5b __ LDA T11 + 0 
5ad2 : 65 6d __ ADC T23 + 0 
5ad4 : 85 48 __ STA T2 + 0 
5ad6 : 85 03 __ STA WORK + 0 
5ad8 : a5 5c __ LDA T11 + 1 
5ada : 65 6e __ ADC T23 + 1 
5adc : 85 49 __ STA T2 + 1 
5ade : 85 04 __ STA WORK + 1 
5ae0 : 29 80 __ AND #$80
5ae2 : 10 02 __ BPL $5ae6 ; (render_full_rotation.l6 + 465)
5ae4 : a9 ff __ LDA #$ff
5ae6 : 85 4a __ STA T2 + 2 
5ae8 : 85 06 __ STA WORK + 3 
5aea : 85 05 __ STA WORK + 2 
5aec : a5 07 __ LDA WORK + 4 
5aee : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5af0 : a5 08 __ LDA WORK + 5 
5af2 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5af4 : a5 09 __ LDA WORK + 6 
5af6 : 85 1d __ STA ACCU + 2 
5af8 : a5 0a __ LDA WORK + 7 
5afa : 85 1e __ STA ACCU + 3 
5afc : 20 ae 6b JSR $6bae ; (divs32 + 0)
5aff : 18 __ __ CLC
5b00 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
5b02 : 65 13 __ ADC P6 ; (dx + 0)
5b04 : a0 00 __ LDY #$00
5b06 : 91 63 __ STA (T15 + 0),y 
5b08 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
5b0a : 65 14 __ ADC P7 ; (dx + 1)
5b0c : c8 __ __ INY
5b0d : 91 63 __ STA (T15 + 0),y 
5b0f : a5 57 __ LDA T9 + 0 
5b11 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5b13 : a5 58 __ LDA T9 + 1 
5b15 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5b17 : a5 69 __ LDA T21 + 0 
5b19 : 85 03 __ STA WORK + 0 
5b1b : a5 6a __ LDA T21 + 1 
5b1d : 85 04 __ STA WORK + 1 
5b1f : 20 3c 69 JSR $693c ; (mul16 + 0)
5b22 : a5 05 __ LDA WORK + 2 
5b24 : 85 46 __ STA T1 + 0 
5b26 : a5 06 __ LDA WORK + 3 
5b28 : 85 47 __ STA T1 + 1 
5b2a : a5 6b __ LDA T22 + 0 
5b2c : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5b2e : a5 6c __ LDA T22 + 1 
5b30 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5b32 : 20 c8 6d JSR $6dc8 ; (mul16@proxy + 0)
5b35 : 18 __ __ CLC
5b36 : a5 05 __ LDA WORK + 2 
5b38 : 65 46 __ ADC T1 + 0 
5b3a : 85 46 __ STA T1 + 0 
5b3c : a5 06 __ LDA WORK + 3 
5b3e : 65 47 __ ADC T1 + 1 
5b40 : 06 46 __ ASL T1 + 0 
5b42 : 2a __ __ ROL
5b43 : 85 47 __ STA T1 + 1 
5b45 : a9 00 __ LDA #$00
5b47 : 69 ff __ ADC #$ff
5b49 : 49 ff __ EOR #$ff
5b4b : 06 46 __ ASL T1 + 0 
5b4d : 26 47 __ ROL T1 + 1 
5b4f : 2a __ __ ROL
5b50 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5b52 : a6 47 __ LDX T1 + 1 
5b54 : 86 1b __ STX ACCU + 0 ; (num_points + 0)
5b56 : 29 80 __ AND #$80
5b58 : 10 02 __ BPL $5b5c ; (render_full_rotation.l6 + 583)
5b5a : a9 ff __ LDA #$ff
5b5c : 85 1d __ STA ACCU + 2 
5b5e : 85 1e __ STA ACCU + 3 
5b60 : a5 5b __ LDA T11 + 0 
5b62 : 85 03 __ STA WORK + 0 
5b64 : a5 5c __ LDA T11 + 1 
5b66 : 85 04 __ STA WORK + 1 
5b68 : a5 45 __ LDA T0 + 2 
5b6a : 85 05 __ STA WORK + 2 
5b6c : 85 06 __ STA WORK + 3 
5b6e : 20 42 6b JSR $6b42 ; (mul32 + 0)
5b71 : a5 07 __ LDA WORK + 4 
5b73 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
5b75 : a5 08 __ LDA WORK + 5 
5b77 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
5b79 : a5 09 __ LDA WORK + 6 
5b7b : 85 1d __ STA ACCU + 2 
5b7d : a5 0a __ LDA WORK + 7 
5b7f : 85 1e __ STA ACCU + 3 
5b81 : a5 48 __ LDA T2 + 0 
5b83 : 85 03 __ STA WORK + 0 
5b85 : a5 49 __ LDA T2 + 1 
5b87 : 85 04 __ STA WORK + 1 
5b89 : a5 4a __ LDA T2 + 2 
5b8b : 85 05 __ STA WORK + 2 
5b8d : 85 06 __ STA WORK + 3 
5b8f : 20 ae 6b JSR $6bae ; (divs32 + 0)
5b92 : 18 __ __ CLC
5b93 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
5b95 : 65 15 __ ADC P8 ; (dy + 0)
5b97 : a0 00 __ LDY #$00
5b99 : 91 65 __ STA (T16 + 0),y 
5b9b : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
5b9d : 65 16 __ ADC P9 ; (dy + 1)
5b9f : c8 __ __ INY
5ba0 : 91 65 __ STA (T16 + 0),y 
5ba2 : 18 __ __ CLC
5ba3 : a5 5d __ LDA T12 + 0 
5ba5 : 69 02 __ ADC #$02
5ba7 : 85 5d __ STA T12 + 0 
5ba9 : 90 03 __ BCC $5bae ; (render_full_rotation.s12 + 0)
.s11:
5bab : e6 5e __ INC T12 + 1 
5bad : 18 __ __ CLC
.s12:
5bae : a5 5f __ LDA T13 + 0 
5bb0 : 69 02 __ ADC #$02
5bb2 : 85 5f __ STA T13 + 0 
5bb4 : 90 03 __ BCC $5bb9 ; (render_full_rotation.s14 + 0)
.s13:
5bb6 : e6 60 __ INC T13 + 1 
5bb8 : 18 __ __ CLC
.s14:
5bb9 : a5 61 __ LDA T14 + 0 
5bbb : 69 02 __ ADC #$02
5bbd : 85 61 __ STA T14 + 0 
5bbf : 90 03 __ BCC $5bc4 ; (render_full_rotation.s16 + 0)
.s15:
5bc1 : e6 62 __ INC T14 + 1 
5bc3 : 18 __ __ CLC
.s16:
5bc4 : a5 67 __ LDA T17 + 0 
5bc6 : 69 02 __ ADC #$02
5bc8 : 85 67 __ STA T17 + 0 
5bca : 90 03 __ BCC $5bcf ; (render_full_rotation.s18 + 0)
.s17:
5bcc : e6 68 __ INC T17 + 1 
5bce : 18 __ __ CLC
.s18:
5bcf : a5 63 __ LDA T15 + 0 
5bd1 : 69 02 __ ADC #$02
5bd3 : 85 63 __ STA T15 + 0 
5bd5 : 90 03 __ BCC $5bda ; (render_full_rotation.s20 + 0)
.s19:
5bd7 : e6 64 __ INC T15 + 1 
5bd9 : 18 __ __ CLC
.s20:
5bda : a5 65 __ LDA T16 + 0 
5bdc : 69 02 __ ADC #$02
5bde : 85 65 __ STA T16 + 0 
5be0 : 90 02 __ BCC $5be4 ; (render_full_rotation.s22 + 0)
.s21:
5be2 : e6 66 __ INC T16 + 1 
.s22:
5be4 : a5 4b __ LDA T3 + 0 
5be6 : d0 02 __ BNE $5bea ; (render_full_rotation.s9 + 0)
.s8:
5be8 : c6 4c __ DEC T3 + 1 
.s9:
5bea : c6 4b __ DEC T3 + 0 
5bec : f0 03 __ BEQ $5bf1 ; (render_full_rotation.s10 + 0)
5bee : 4c 15 59 JMP $5915 ; (render_full_rotation.l6 + 0)
.s10:
5bf1 : a5 4c __ LDA T3 + 1 
5bf3 : d0 f9 __ BNE $5bee ; (render_full_rotation.s9 + 4)
5bf5 : 4c cc 57 JMP $57cc ; (render_full_rotation.s3 + 0)
--------------------------------------------------------------------
sort_and_render_faces: ; sort_and_render_faces(i16)->void
; 509, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
5bf8 : a2 0d __ LDX #$0d
5bfa : b5 53 __ LDA T4 + 0,x 
5bfc : 9d df fc STA $fcdf,x ; (sort_and_render_faces@stack + 0)
5bff : ca __ __ DEX
5c00 : 10 f8 __ BPL $5bfa ; (sort_and_render_faces.s1 + 2)
.s4:
5c02 : ad 85 6e LDA $6e85 ; (wireframeOn + 1)
5c05 : d0 09 __ BNE $5c10 ; (sort_and_render_faces.s5 + 0)
.s50:
5c07 : ae 84 6e LDX $6e84 ; (wireframeOn + 0)
5c0a : ca __ __ DEX
5c0b : d0 03 __ BNE $5c10 ; (sort_and_render_faces.s5 + 0)
5c0d : 4c 81 5f JMP $5f81 ; (sort_and_render_faces.s49 + 0)
.s5:
5c10 : a9 ff __ LDA #$ff
5c12 : a2 80 __ LDX #$80
.l7:
5c14 : ca __ __ DEX
5c15 : 9d bc 6e STA $6ebc,x ; (bucket_head[0] + 0)
5c18 : 9d 3c 6f STA $6f3c,x ; (bucket_head[0] + 128)
5c1b : 9d bc 6f STA $6fbc,x ; (bucket_head[0] + 256)
5c1e : 9d 3c 70 STA $703c,x ; (bucket_head[0] + 384)
5c21 : d0 f1 __ BNE $5c14 ; (sort_and_render_faces.l7 + 0)
.s6:
5c23 : ad 3a 6e LDA $6e3a ; (plane_data_count + 0)
5c26 : 85 4f __ STA T3 + 0 
5c28 : ad 3b 6e LDA $6e3b ; (plane_data_count + 1)
5c2b : 10 03 __ BPL $5c30 ; (sort_and_render_faces.s48 + 0)
5c2d : 4c e2 5c JMP $5ce2 ; (sort_and_render_faces.s8 + 0)
.s48:
5c30 : 85 50 __ STA T3 + 1 
5c32 : 05 4f __ ORA T3 + 0 
5c34 : f0 f7 __ BEQ $5c2d ; (sort_and_render_faces.s6 + 10)
.s18:
5c36 : a9 00 __ LDA #$00
5c38 : 85 53 __ STA T4 + 0 
5c3a : 85 54 __ STA T4 + 1 
5c3c : 85 55 __ STA T5 + 0 
5c3e : 85 56 __ STA T5 + 1 
.l19:
5c40 : a5 54 __ LDA T4 + 1 
5c42 : c9 04 __ CMP #$04
5c44 : d0 04 __ BNE $5c4a ; (sort_and_render_faces.s20 + 0)
.s47:
5c46 : a5 53 __ LDA T4 + 0 
5c48 : f0 e3 __ BEQ $5c2d ; (sort_and_render_faces.s6 + 10)
.s20:
5c4a : a5 55 __ LDA T5 + 0 
5c4c : 85 51 __ STA T8 + 0 
5c4e : 0a __ __ ASL
5c4f : 85 43 __ STA T0 + 0 
5c51 : a5 56 __ LDA T5 + 1 
5c53 : 85 52 __ STA T8 + 1 
5c55 : 2a __ __ ROL
5c56 : 85 44 __ STA T0 + 1 
5c58 : ad 38 6e LDA $6e38 ; (plane_data + 0)
5c5b : 85 57 __ STA T6 + 0 
5c5d : 18 __ __ CLC
5c5e : 65 43 __ ADC T0 + 0 
5c60 : 85 59 __ STA T7 + 0 
5c62 : ad 39 6e LDA $6e39 ; (plane_data + 1)
5c65 : 85 58 __ STA T6 + 1 
5c67 : 65 44 __ ADC T0 + 1 
5c69 : 85 5a __ STA T7 + 1 
5c6b : a9 00 __ LDA #$00
5c6d : 85 5b __ STA T9 + 0 
5c6f : 85 5c __ STA T9 + 1 
5c71 : 85 43 __ STA T0 + 0 
5c73 : 85 44 __ STA T0 + 1 
5c75 : 85 45 __ STA T0 + 2 
5c77 : 85 46 __ STA T0 + 3 
5c79 : a9 01 __ LDA #$01
5c7b : 85 5d __ STA T10 + 0 
5c7d : a9 80 __ LDA #$80
5c7f : 85 5e __ STA T10 + 1 
.l21:
5c81 : a5 55 __ LDA T5 + 0 
5c83 : 0a __ __ ASL
5c84 : a8 __ __ TAY
5c85 : a5 56 __ LDA T5 + 1 
5c87 : 2a __ __ ROL
5c88 : aa __ __ TAX
5c89 : 98 __ __ TYA
5c8a : 18 __ __ CLC
5c8b : 65 57 __ ADC T6 + 0 
5c8d : 85 47 __ STA T1 + 0 
5c8f : 8a __ __ TXA
5c90 : 65 58 __ ADC T6 + 1 
5c92 : 85 48 __ STA T1 + 1 
5c94 : a0 00 __ LDY #$00
5c96 : b1 47 __ LDA (T1 + 0),y 
5c98 : 85 4b __ STA T2 + 0 
5c9a : c8 __ __ INY
5c9b : b1 47 __ LDA (T1 + 0),y 
5c9d : 85 4c __ STA T2 + 1 
5c9f : 05 4b __ ORA T2 + 0 
5ca1 : f0 03 __ BEQ $5ca6 ; (sort_and_render_faces.s22 + 0)
5ca3 : 4c 71 5e JMP $5e71 ; (sort_and_render_faces.s38 + 0)
.s22:
5ca6 : a5 5c __ LDA T9 + 1 
5ca8 : 30 1d __ BMI $5cc7 ; (sort_and_render_faces.s23 + 0)
.s37:
5caa : d0 06 __ BNE $5cb2 ; (sort_and_render_faces.s26 + 0)
.s36:
5cac : a5 5b __ LDA T9 + 0 
5cae : c9 03 __ CMP #$03
5cb0 : 90 15 __ BCC $5cc7 ; (sort_and_render_faces.s23 + 0)
.s26:
5cb2 : a5 46 __ LDA T0 + 3 
5cb4 : 30 11 __ BMI $5cc7 ; (sort_and_render_faces.s23 + 0)
.s32:
5cb6 : f0 03 __ BEQ $5cbb ; (sort_and_render_faces.s33 + 0)
5cb8 : 4c dd 5d JMP $5ddd ; (sort_and_render_faces.s27 + 0)
.s33:
5cbb : a5 45 __ LDA T0 + 2 
5cbd : d0 f9 __ BNE $5cb8 ; (sort_and_render_faces.s32 + 2)
.s34:
5cbf : a5 44 __ LDA T0 + 1 
5cc1 : d0 f5 __ BNE $5cb8 ; (sort_and_render_faces.s32 + 2)
.s35:
5cc3 : a5 43 __ LDA T0 + 0 
5cc5 : d0 f1 __ BNE $5cb8 ; (sort_and_render_faces.s32 + 2)
.s23:
5cc7 : 24 50 __ BIT T3 + 1 
5cc9 : 30 17 __ BMI $5ce2 ; (sort_and_render_faces.s8 + 0)
.s25:
5ccb : e6 55 __ INC T5 + 0 
5ccd : d0 02 __ BNE $5cd1 ; (sort_and_render_faces.s65 + 0)
.s64:
5ccf : e6 56 __ INC T5 + 1 
.s65:
5cd1 : a5 56 __ LDA T5 + 1 
5cd3 : c5 50 __ CMP T3 + 1 
5cd5 : b0 03 __ BCS $5cda ; (sort_and_render_faces.s67 + 0)
5cd7 : 4c 40 5c JMP $5c40 ; (sort_and_render_faces.l19 + 0)
.s67:
5cda : d0 06 __ BNE $5ce2 ; (sort_and_render_faces.s8 + 0)
.s24:
5cdc : a5 55 __ LDA T5 + 0 
5cde : c5 4f __ CMP T3 + 0 
5ce0 : 90 f5 __ BCC $5cd7 ; (sort_and_render_faces.s65 + 6)
.s8:
5ce2 : a9 ff __ LDA #$ff
5ce4 : 85 53 __ STA T4 + 0 
5ce6 : a9 00 __ LDA #$00
.l9:
5ce8 : 85 54 __ STA T4 + 1 
5cea : a5 53 __ LDA T4 + 0 
5cec : 0a __ __ ASL
5ced : a2 00 __ LDX #$00
5cef : 90 02 __ BCC $5cf3 ; (sort_and_render_faces.s61 + 0)
.s60:
5cf1 : e8 __ __ INX
5cf2 : 18 __ __ CLC
.s61:
5cf3 : 69 bc __ ADC #$bc
5cf5 : 85 43 __ STA T0 + 0 
5cf7 : 8a __ __ TXA
5cf8 : 69 6e __ ADC #$6e
5cfa : 85 44 __ STA T0 + 1 
5cfc : a0 00 __ LDY #$00
5cfe : b1 43 __ LDA (T0 + 0),y 
5d00 : aa __ __ TAX
5d01 : c8 __ __ INY
5d02 : b1 43 __ LDA (T0 + 0),y 
5d04 : a8 __ __ TAY
5d05 : c0 ff __ CPY #$ff
5d07 : d0 1c __ BNE $5d25 ; (sort_and_render_faces.s11 + 0)
.s17:
5d09 : e0 ff __ CPX #$ff
5d0b : d0 18 __ BNE $5d25 ; (sort_and_render_faces.s11 + 0)
.s10:
5d0d : 18 __ __ CLC
5d0e : a5 53 __ LDA T4 + 0 
5d10 : 69 ff __ ADC #$ff
5d12 : 85 53 __ STA T4 + 0 
5d14 : a5 54 __ LDA T4 + 1 
5d16 : 69 ff __ ADC #$ff
5d18 : 10 ce __ BPL $5ce8 ; (sort_and_render_faces.l9 + 0)
.s3:
5d1a : a2 0d __ LDX #$0d
5d1c : bd df fc LDA $fcdf,x ; (sort_and_render_faces@stack + 0)
5d1f : 95 53 __ STA T4 + 0,x 
5d21 : ca __ __ DEX
5d22 : 10 f8 __ BPL $5d1c ; (sort_and_render_faces.s3 + 2)
5d24 : 60 __ __ RTS
.s11:
5d25 : ad 38 6e LDA $6e38 ; (plane_data + 0)
5d28 : 85 55 __ STA T5 + 0 
5d2a : ad 39 6e LDA $6e39 ; (plane_data + 1)
5d2d : 85 56 __ STA T5 + 1 
5d2f : ad b8 6e LDA $6eb8 ; (u_array + 0)
5d32 : 85 57 __ STA T6 + 0 
5d34 : ad b9 6e LDA $6eb9 ; (u_array + 1)
5d37 : 85 58 __ STA T6 + 1 
.l12:
5d39 : a9 00 __ LDA #$00
5d3b : 85 47 __ STA T1 + 0 
5d3d : 85 48 __ STA T1 + 1 
5d3f : 8a __ __ TXA
5d40 : 0a __ __ ASL
5d41 : 85 59 __ STA T7 + 0 
5d43 : 98 __ __ TYA
5d44 : 2a __ __ ROL
5d45 : 85 5a __ STA T7 + 1 
5d47 : 18 __ __ CLC
5d48 : 69 70 __ ADC #$70
5d4a : 85 44 __ STA T0 + 1 
5d4c : a9 bc __ LDA #$bc
5d4e : 85 43 __ STA T0 + 0 
5d50 : a4 59 __ LDY T7 + 0 
5d52 : b1 43 __ LDA (T0 + 0),y 
5d54 : aa __ __ TAX
5d55 : c8 __ __ INY
5d56 : b1 43 __ LDA (T0 + 0),y 
5d58 : 86 43 __ STX T0 + 0 
5d5a : 85 44 __ STA T0 + 1 
5d5c : 8a __ __ TXA
5d5d : 4c 62 5d JMP $5d62 ; (sort_and_render_faces.l13 + 0)
.s63:
5d60 : a5 43 __ LDA T0 + 0 
.l13:
5d62 : 18 __ __ CLC
5d63 : 65 47 __ ADC T1 + 0 
5d65 : 85 4b __ STA T2 + 0 
5d67 : a5 44 __ LDA T0 + 1 
5d69 : 65 48 __ ADC T1 + 1 
5d6b : 06 4b __ ASL T2 + 0 
5d6d : 2a __ __ ROL
5d6e : 18 __ __ CLC
5d6f : 65 56 __ ADC T5 + 1 
5d71 : 85 4c __ STA T2 + 1 
5d73 : a4 55 __ LDY T5 + 0 
5d75 : b1 4b __ LDA (T2 + 0),y 
5d77 : 85 1b __ STA ACCU + 0 
5d79 : c8 __ __ INY
5d7a : b1 4b __ LDA (T2 + 0),y 
5d7c : aa __ __ TAX
5d7d : 05 1b __ ORA ACCU + 0 
5d7f : f0 25 __ BEQ $5da6 ; (sort_and_render_faces.s14 + 0)
.s16:
5d81 : a5 47 __ LDA T1 + 0 
5d83 : 0a __ __ ASL
5d84 : 85 4f __ STA T3 + 0 
5d86 : a5 48 __ LDA T1 + 1 
5d88 : 2a __ __ ROL
5d89 : 18 __ __ CLC
5d8a : 65 58 __ ADC T6 + 1 
5d8c : 85 50 __ STA T3 + 1 
5d8e : 38 __ __ SEC
5d8f : a5 1b __ LDA ACCU + 0 
5d91 : e9 01 __ SBC #$01
5d93 : a4 57 __ LDY T6 + 0 
5d95 : 91 4f __ STA (T3 + 0),y 
5d97 : 8a __ __ TXA
5d98 : e9 00 __ SBC #$00
5d9a : c8 __ __ INY
5d9b : 91 4f __ STA (T3 + 0),y 
5d9d : e6 47 __ INC T1 + 0 
5d9f : d0 bf __ BNE $5d60 ; (sort_and_render_faces.s63 + 0)
.s62:
5da1 : e6 48 __ INC T1 + 1 
5da3 : 4c 60 5d JMP $5d60 ; (sort_and_render_faces.s63 + 0)
.s14:
5da6 : 86 1c __ STX ACCU + 1 
5da8 : a5 57 __ LDA T6 + 0 
5daa : 85 15 __ STA P8 
5dac : a5 58 __ LDA T6 + 1 
5dae : 85 16 __ STA P9 
5db0 : a5 47 __ LDA T1 + 0 
5db2 : 85 17 __ STA P10 
5db4 : a5 48 __ LDA T1 + 1 
5db6 : 85 18 __ STA P11 
5db8 : 20 ba 60 JSR $60ba ; (draw_plane.s1 + 0)
5dbb : a9 bc __ LDA #$bc
5dbd : 85 43 __ STA T0 + 0 
5dbf : 18 __ __ CLC
5dc0 : a9 78 __ LDA #$78
5dc2 : 65 5a __ ADC T7 + 1 
5dc4 : 85 44 __ STA T0 + 1 
5dc6 : a4 59 __ LDY T7 + 0 
5dc8 : b1 43 __ LDA (T0 + 0),y 
5dca : aa __ __ TAX
5dcb : c8 __ __ INY
5dcc : b1 43 __ LDA (T0 + 0),y 
5dce : a8 __ __ TAY
5dcf : c0 ff __ CPY #$ff
5dd1 : f0 03 __ BEQ $5dd6 ; (sort_and_render_faces.s15 + 0)
5dd3 : 4c 39 5d JMP $5d39 ; (sort_and_render_faces.l12 + 0)
.s15:
5dd6 : e0 ff __ CPX #$ff
5dd8 : d0 f9 __ BNE $5dd3 ; (sort_and_render_faces.s14 + 45)
5dda : 4c 0d 5d JMP $5d0d ; (sort_and_render_faces.s10 + 0)
.s27:
5ddd : a5 53 __ LDA T4 + 0 
5ddf : 0a __ __ ASL
5de0 : 85 43 __ STA T0 + 0 
5de2 : a8 __ __ TAY
5de3 : a5 54 __ LDA T4 + 1 
5de5 : 2a __ __ ROL
5de6 : 85 44 __ STA T0 + 1 
5de8 : 18 __ __ CLC
5de9 : 69 70 __ ADC #$70
5deb : 85 48 __ STA T1 + 1 
5ded : a9 bc __ LDA #$bc
5def : 85 47 __ STA T1 + 0 
5df1 : a5 51 __ LDA T8 + 0 
5df3 : 91 47 __ STA (T1 + 0),y 
5df5 : a5 52 __ LDA T8 + 1 
5df7 : c8 __ __ INY
5df8 : 91 47 __ STA (T1 + 0),y 
5dfa : ad f8 fc LDA $fcf8 ; (sstack + 0)
5dfd : 65 5d __ ADC T10 + 0 
5dff : 85 47 __ STA T1 + 0 
5e01 : ad f9 fc LDA $fcf9 ; (sstack + 1)
5e04 : 65 5e __ ADC T10 + 1 
5e06 : 18 __ __ CLC
5e07 : 69 01 __ ADC #$01
5e09 : 4a __ __ LSR
5e0a : 66 47 __ ROR T1 + 0 
5e0c : 4a __ __ LSR
5e0d : 66 47 __ ROR T1 + 0 
5e0f : 49 20 __ EOR #$20
5e11 : 38 __ __ SEC
5e12 : e9 20 __ SBC #$20
5e14 : 10 08 __ BPL $5e1e ; (sort_and_render_faces.s28 + 0)
.s31:
5e16 : a9 00 __ LDA #$00
5e18 : 85 47 __ STA T1 + 0 
.s51:
5e1a : 85 48 __ STA T1 + 1 
5e1c : f0 0c __ BEQ $5e2a ; (sort_and_render_faces.s29 + 0)
.s28:
5e1e : 85 48 __ STA T1 + 1 
5e20 : f0 08 __ BEQ $5e2a ; (sort_and_render_faces.s29 + 0)
.s30:
5e22 : a9 ff __ LDA #$ff
5e24 : 85 47 __ STA T1 + 0 
5e26 : a9 00 __ LDA #$00
5e28 : 85 48 __ STA T1 + 1 
.s29:
5e2a : 06 47 __ ASL T1 + 0 
5e2c : 26 48 __ ROL T1 + 1 
5e2e : 18 __ __ CLC
5e2f : a9 bc __ LDA #$bc
5e31 : 65 47 __ ADC T1 + 0 
5e33 : 85 47 __ STA T1 + 0 
5e35 : a9 6e __ LDA #$6e
5e37 : 65 48 __ ADC T1 + 1 
5e39 : 85 48 __ STA T1 + 1 
5e3b : a0 00 __ LDY #$00
5e3d : b1 47 __ LDA (T1 + 0),y 
5e3f : aa __ __ TAX
5e40 : c8 __ __ INY
5e41 : b1 47 __ LDA (T1 + 0),y 
5e43 : 85 4c __ STA T2 + 1 
5e45 : a5 53 __ LDA T4 + 0 
5e47 : 88 __ __ DEY
5e48 : 91 47 __ STA (T1 + 0),y 
5e4a : a5 54 __ LDA T4 + 1 
5e4c : c8 __ __ INY
5e4d : 91 47 __ STA (T1 + 0),y 
5e4f : 18 __ __ CLC
5e50 : a9 bc __ LDA #$bc
5e52 : 65 43 __ ADC T0 + 0 
5e54 : 85 43 __ STA T0 + 0 
5e56 : a9 78 __ LDA #$78
5e58 : 65 44 __ ADC T0 + 1 
5e5a : 85 44 __ STA T0 + 1 
5e5c : 8a __ __ TXA
5e5d : 88 __ __ DEY
5e5e : 91 43 __ STA (T0 + 0),y 
5e60 : a5 4c __ LDA T2 + 1 
5e62 : c8 __ __ INY
5e63 : 91 43 __ STA (T0 + 0),y 
5e65 : e6 53 __ INC T4 + 0 
5e67 : f0 03 __ BEQ $5e6c ; (sort_and_render_faces.s66 + 0)
5e69 : 4c c7 5c JMP $5cc7 ; (sort_and_render_faces.s23 + 0)
.s66:
5e6c : e6 54 __ INC T4 + 1 
5e6e : 4c c7 5c JMP $5cc7 ; (sort_and_render_faces.s23 + 0)
.s38:
5e71 : c8 __ __ INY
5e72 : b1 47 __ LDA (T1 + 0),y 
5e74 : aa __ __ TAX
5e75 : c8 __ __ INY
5e76 : b1 47 __ LDA (T1 + 0),y 
5e78 : 86 47 __ STX T1 + 0 
5e7a : 85 48 __ STA T1 + 1 
5e7c : 05 47 __ ORA T1 + 0 
5e7e : d0 0b __ BNE $5e8b ; (sort_and_render_faces.s39 + 0)
.s46:
5e80 : a8 __ __ TAY
5e81 : b1 59 __ LDA (T7 + 0),y 
5e83 : 85 47 __ STA T1 + 0 
5e85 : a0 01 __ LDY #$01
5e87 : b1 59 __ LDA (T7 + 0),y 
5e89 : 85 48 __ STA T1 + 1 
.s39:
5e8b : 38 __ __ SEC
5e8c : a5 47 __ LDA T1 + 0 
5e8e : e9 01 __ SBC #$01
5e90 : 85 47 __ STA T1 + 0 
5e92 : b0 02 __ BCS $5e96 ; (sort_and_render_faces.s53 + 0)
.s52:
5e94 : c6 48 __ DEC T1 + 1 
.s53:
5e96 : 06 4b __ ASL T2 + 0 
5e98 : 26 4c __ ROL T2 + 1 
5e9a : 38 __ __ SEC
5e9b : a5 4b __ LDA T2 + 0 
5e9d : e9 02 __ SBC #$02
5e9f : 85 4b __ STA T2 + 0 
5ea1 : b0 02 __ BCS $5ea5 ; (sort_and_render_faces.s55 + 0)
.s54:
5ea3 : c6 4c __ DEC T2 + 1 
.s55:
5ea5 : 18 __ __ CLC
5ea6 : 6d b2 6e ADC $6eb2 ; (z_rotated + 0)
5ea9 : 85 5f __ STA T11 + 0 
5eab : ad b3 6e LDA $6eb3 ; (z_rotated + 1)
5eae : 65 4c __ ADC T2 + 1 
5eb0 : 85 60 __ STA T11 + 1 
5eb2 : a0 00 __ LDY #$00
5eb4 : b1 5f __ LDA (T11 + 0),y 
5eb6 : 85 1b __ STA ACCU + 0 
5eb8 : a5 5e __ LDA T10 + 1 
5eba : c8 __ __ INY
5ebb : d1 5f __ CMP (T11 + 0),y 
5ebd : d0 08 __ BNE $5ec7 ; (sort_and_render_faces.s45 + 0)
.s42:
5ebf : a5 5d __ LDA T10 + 0 
5ec1 : c5 1b __ CMP ACCU + 0 
.s43:
5ec3 : 90 08 __ BCC $5ecd ; (sort_and_render_faces.s41 + 0)
5ec5 : b0 0e __ BCS $5ed5 ; (sort_and_render_faces.s40 + 0)
.s45:
5ec7 : 51 5f __ EOR (T11 + 0),y 
5ec9 : 10 f8 __ BPL $5ec3 ; (sort_and_render_faces.s43 + 0)
.s44:
5ecb : 90 08 __ BCC $5ed5 ; (sort_and_render_faces.s40 + 0)
.s41:
5ecd : a5 1b __ LDA ACCU + 0 
5ecf : 85 5d __ STA T10 + 0 
5ed1 : b1 5f __ LDA (T11 + 0),y 
5ed3 : 85 5e __ STA T10 + 1 
.s40:
5ed5 : e6 55 __ INC T5 + 0 
5ed7 : d0 02 __ BNE $5edb ; (sort_and_render_faces.s57 + 0)
.s56:
5ed9 : e6 56 __ INC T5 + 1 
.s57:
5edb : e6 5b __ INC T9 + 0 
5edd : d0 02 __ BNE $5ee1 ; (sort_and_render_faces.s59 + 0)
.s58:
5edf : e6 5c __ INC T9 + 1 
.s59:
5ee1 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
5ee4 : 18 __ __ CLC
5ee5 : 65 4b __ ADC T2 + 0 
5ee7 : 85 1b __ STA ACCU + 0 
5ee9 : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
5eec : 65 4c __ ADC T2 + 1 
5eee : 85 1c __ STA ACCU + 1 
5ef0 : a0 00 __ LDY #$00
5ef2 : b1 1b __ LDA (ACCU + 0),y 
5ef4 : 85 1d __ STA ACCU + 2 
5ef6 : c8 __ __ INY
5ef7 : b1 1b __ LDA (ACCU + 0),y 
5ef9 : aa __ __ TAX
5efa : a5 47 __ LDA T1 + 0 
5efc : 0a __ __ ASL
5efd : 85 1b __ STA ACCU + 0 
5eff : a5 48 __ LDA T1 + 1 
5f01 : 2a __ __ ROL
5f02 : 85 1c __ STA ACCU + 1 
5f04 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
5f07 : 18 __ __ CLC
5f08 : 65 1b __ ADC ACCU + 0 
5f0a : 85 5f __ STA T11 + 0 
5f0c : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
5f0f : 65 1c __ ADC ACCU + 1 
5f11 : 85 60 __ STA T11 + 1 
5f13 : 88 __ __ DEY
5f14 : b1 5f __ LDA (T11 + 0),y 
5f16 : 18 __ __ CLC
5f17 : 65 1d __ ADC ACCU + 2 
5f19 : 85 03 __ STA WORK + 0 
5f1b : 8a __ __ TXA
5f1c : c8 __ __ INY
5f1d : 71 5f __ ADC (T11 + 0),y 
5f1f : 85 04 __ STA WORK + 1 
5f21 : 29 80 __ AND #$80
5f23 : 10 02 __ BPL $5f27 ; (sort_and_render_faces.s59 + 70)
5f25 : a9 ff __ LDA #$ff
5f27 : 85 06 __ STA WORK + 3 
5f29 : 85 05 __ STA WORK + 2 
5f2b : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
5f2e : 18 __ __ CLC
5f2f : 65 4b __ ADC T2 + 0 
5f31 : 85 4b __ STA T2 + 0 
5f33 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
5f36 : 65 4c __ ADC T2 + 1 
5f38 : 85 4c __ STA T2 + 1 
5f3a : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
5f3d : 18 __ __ CLC
5f3e : 65 1b __ ADC ACCU + 0 
5f40 : 85 5f __ STA T11 + 0 
5f42 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
5f45 : 65 1c __ ADC ACCU + 1 
5f47 : 85 60 __ STA T11 + 1 
5f49 : 88 __ __ DEY
5f4a : b1 4b __ LDA (T2 + 0),y 
5f4c : 38 __ __ SEC
5f4d : f1 5f __ SBC (T11 + 0),y 
5f4f : 85 1b __ STA ACCU + 0 
5f51 : c8 __ __ INY
5f52 : b1 4b __ LDA (T2 + 0),y 
5f54 : f1 5f __ SBC (T11 + 0),y 
5f56 : 85 1c __ STA ACCU + 1 
5f58 : 29 80 __ AND #$80
5f5a : 10 02 __ BPL $5f5e ; (sort_and_render_faces.s59 + 125)
5f5c : a9 ff __ LDA #$ff
5f5e : 85 1d __ STA ACCU + 2 
5f60 : 85 1e __ STA ACCU + 3 
5f62 : 20 42 6b JSR $6b42 ; (mul32 + 0)
5f65 : 18 __ __ CLC
5f66 : a5 07 __ LDA WORK + 4 
5f68 : 65 43 __ ADC T0 + 0 
5f6a : 85 43 __ STA T0 + 0 
5f6c : a5 08 __ LDA WORK + 5 
5f6e : 65 44 __ ADC T0 + 1 
5f70 : 85 44 __ STA T0 + 1 
5f72 : a5 09 __ LDA WORK + 6 
5f74 : 65 45 __ ADC T0 + 2 
5f76 : 85 45 __ STA T0 + 2 
5f78 : a5 0a __ LDA WORK + 7 
5f7a : 65 46 __ ADC T0 + 3 
5f7c : 85 46 __ STA T0 + 3 
5f7e : 4c 81 5c JMP $5c81 ; (sort_and_render_faces.l21 + 0)
.s49:
5f81 : 20 87 5f JSR $5f87 ; (render_wireframe.s1 + 0)
5f84 : 4c 1a 5d JMP $5d1a ; (sort_and_render_faces.s3 + 0)
--------------------------------------------------------------------
render_wireframe: ; render_wireframe()->void
; 472, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
5f87 : a2 03 __ LDX #$03
5f89 : b5 53 __ LDA T6 + 0,x 
5f8b : 9d f4 fc STA $fcf4,x ; (render_wireframe@stack + 0)
5f8e : ca __ __ DEX
5f8f : 10 f8 __ BPL $5f89 ; (render_wireframe.s1 + 2)
.s4:
5f91 : ad 3a 6e LDA $6e3a ; (plane_data_count + 0)
5f94 : 85 4f __ STA T4 + 0 
5f96 : ad 3b 6e LDA $6e3b ; (plane_data_count + 1)
5f99 : 30 6d __ BMI $6008 ; (render_wireframe.s3 + 0)
.s15:
5f9b : 85 50 __ STA T4 + 1 
5f9d : 05 4f __ ORA T4 + 0 
5f9f : f0 67 __ BEQ $6008 ; (render_wireframe.s3 + 0)
.s5:
5fa1 : a9 00 __ LDA #$00
5fa3 : 85 51 __ STA T5 + 0 
5fa5 : 85 52 __ STA T5 + 1 
5fa7 : ad 38 6e LDA $6e38 ; (plane_data + 0)
5faa : 85 53 __ STA T6 + 0 
5fac : ad 39 6e LDA $6e39 ; (plane_data + 1)
5faf : 85 54 __ STA T6 + 1 
.l6:
5fb1 : a5 51 __ LDA T5 + 0 
5fb3 : 0a __ __ ASL
5fb4 : 85 43 __ STA T0 + 0 
5fb6 : a5 52 __ LDA T5 + 1 
5fb8 : 2a __ __ ROL
5fb9 : 18 __ __ CLC
5fba : 65 54 __ ADC T6 + 1 
5fbc : 85 44 __ STA T0 + 1 
5fbe : a4 53 __ LDY T6 + 0 
5fc0 : b1 43 __ LDA (T0 + 0),y 
5fc2 : 38 __ __ SEC
5fc3 : e9 01 __ SBC #$01
5fc5 : 85 55 __ STA T7 + 0 
5fc7 : c8 __ __ INY
5fc8 : b1 43 __ LDA (T0 + 0),y 
5fca : e9 00 __ SBC #$00
5fcc : 85 56 __ STA T7 + 1 
.l7:
5fce : a5 51 __ LDA T5 + 0 
5fd0 : 0a __ __ ASL
5fd1 : a8 __ __ TAY
5fd2 : a5 52 __ LDA T5 + 1 
5fd4 : 2a __ __ ROL
5fd5 : aa __ __ TAX
5fd6 : 98 __ __ TYA
5fd7 : 18 __ __ CLC
5fd8 : 65 53 __ ADC T6 + 0 
5fda : 85 43 __ STA T0 + 0 
5fdc : 8a __ __ TXA
5fdd : 65 54 __ ADC T6 + 1 
5fdf : 85 44 __ STA T0 + 1 
5fe1 : a0 00 __ LDY #$00
5fe3 : b1 43 __ LDA (T0 + 0),y 
5fe5 : 85 45 __ STA T1 + 0 
5fe7 : c8 __ __ INY
5fe8 : b1 43 __ LDA (T0 + 0),y 
5fea : 85 46 __ STA T1 + 1 
5fec : 05 45 __ ORA T1 + 0 
5fee : d0 23 __ BNE $6013 ; (render_wireframe.s11 + 0)
.s8:
5ff0 : 24 50 __ BIT T4 + 1 
5ff2 : 30 14 __ BMI $6008 ; (render_wireframe.s3 + 0)
.s10:
5ff4 : e6 51 __ INC T5 + 0 
5ff6 : d0 02 __ BNE $5ffa ; (render_wireframe.s20 + 0)
.s19:
5ff8 : e6 52 __ INC T5 + 1 
.s20:
5ffa : a5 52 __ LDA T5 + 1 
5ffc : c5 50 __ CMP T4 + 1 
5ffe : 90 b1 __ BCC $5fb1 ; (render_wireframe.l6 + 0)
.s21:
6000 : d0 06 __ BNE $6008 ; (render_wireframe.s3 + 0)
.s9:
6002 : a5 51 __ LDA T5 + 0 
6004 : c5 4f __ CMP T4 + 0 
6006 : 90 a9 __ BCC $5fb1 ; (render_wireframe.l6 + 0)
.s3:
6008 : a2 03 __ LDX #$03
600a : bd f4 fc LDA $fcf4,x ; (render_wireframe@stack + 0)
600d : 95 53 __ STA T6 + 0,x 
600f : ca __ __ DEX
6010 : 10 f8 __ BPL $600a ; (render_wireframe.s3 + 2)
6012 : 60 __ __ RTS
.s11:
6013 : 06 45 __ ASL T1 + 0 
6015 : 26 46 __ ROL T1 + 1 
6017 : 38 __ __ SEC
6018 : a5 45 __ LDA T1 + 0 
601a : e9 02 __ SBC #$02
601c : 85 45 __ STA T1 + 0 
601e : b0 02 __ BCS $6022 ; (render_wireframe.s17 + 0)
.s16:
6020 : c6 46 __ DEC T1 + 1 
.s17:
6022 : 18 __ __ CLC
6023 : 6d b4 6e ADC $6eb4 ; (vx_pct + 0)
6026 : 85 49 __ STA T3 + 0 
6028 : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
602b : 65 46 __ ADC T1 + 1 
602d : 85 4a __ STA T3 + 1 
602f : a0 00 __ LDY #$00
6031 : b1 49 __ LDA (T3 + 0),y 
6033 : 85 0d __ STA P0 
6035 : c8 __ __ INY
6036 : b1 49 __ LDA (T3 + 0),y 
6038 : 85 0e __ STA P1 
603a : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
603d : 18 __ __ CLC
603e : 65 45 __ ADC T1 + 0 
6040 : 85 45 __ STA T1 + 0 
6042 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
6045 : 65 46 __ ADC T1 + 1 
6047 : 85 46 __ STA T1 + 1 
6049 : 88 __ __ DEY
604a : b1 45 __ LDA (T1 + 0),y 
604c : 85 0f __ STA P2 
604e : c8 __ __ INY
604f : b1 45 __ LDA (T1 + 0),y 
6051 : 85 10 __ STA P3 
6053 : c8 __ __ INY
6054 : b1 43 __ LDA (T0 + 0),y 
6056 : 85 1b __ STA ACCU + 0 
6058 : c8 __ __ INY
6059 : b1 43 __ LDA (T0 + 0),y 
605b : aa __ __ TAX
605c : 05 1b __ ORA ACCU + 0 
605e : f0 0d __ BEQ $606d ; (render_wireframe.s14 + 0)
.s12:
6060 : 38 __ __ SEC
6061 : a5 1b __ LDA ACCU + 0 
6063 : e9 01 __ SBC #$01
6065 : 85 43 __ STA T0 + 0 
6067 : 8a __ __ TXA
6068 : e9 00 __ SBC #$00
606a : 4c 73 60 JMP $6073 ; (render_wireframe.s13 + 0)
.s14:
606d : a5 55 __ LDA T7 + 0 
606f : 85 43 __ STA T0 + 0 
6071 : a5 56 __ LDA T7 + 1 
.s13:
6073 : 06 43 __ ASL T0 + 0 
6075 : 2a __ __ ROL
6076 : 85 44 __ STA T0 + 1 
6078 : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
607b : 18 __ __ CLC
607c : 65 43 __ ADC T0 + 0 
607e : 85 49 __ STA T3 + 0 
6080 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
6083 : 65 44 __ ADC T0 + 1 
6085 : 85 4a __ STA T3 + 1 
6087 : a0 00 __ LDY #$00
6089 : b1 49 __ LDA (T3 + 0),y 
608b : 85 13 __ STA P6 
608d : c8 __ __ INY
608e : b1 49 __ LDA (T3 + 0),y 
6090 : 85 14 __ STA P7 
6092 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
6095 : 18 __ __ CLC
6096 : 65 43 __ ADC T0 + 0 
6098 : 85 47 __ STA T2 + 0 
609a : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
609d : 65 44 __ ADC T0 + 1 
609f : 85 48 __ STA T2 + 1 
60a1 : 88 __ __ DEY
60a2 : b1 47 __ LDA (T2 + 0),y 
60a4 : 85 11 __ STA P4 
60a6 : c8 __ __ INY
60a7 : b1 47 __ LDA (T2 + 0),y 
60a9 : 85 12 __ STA P5 
60ab : 20 f7 53 JSR $53f7 ; (drawline.s4 + 0)
60ae : e6 51 __ INC T5 + 0 
60b0 : f0 03 __ BEQ $60b5 ; (render_wireframe.s18 + 0)
60b2 : 4c ce 5f JMP $5fce ; (render_wireframe.l7 + 0)
.s18:
60b5 : e6 52 __ INC T5 + 1 
60b7 : 4c ce 5f JMP $5fce ; (render_wireframe.l7 + 0)
--------------------------------------------------------------------
draw_plane: ; draw_plane(i16*,i16)->void
; 450, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s1:
60ba : a2 03 __ LDX #$03
60bc : b5 53 __ LDA T5 + 0,x 
60be : 9d f1 fc STA $fcf1,x ; (draw_plane@stack + 0)
60c1 : ca __ __ DEX
60c2 : 10 f8 __ BPL $60bc ; (draw_plane.s1 + 2)
.s4:
60c4 : ad 87 6e LDA $6e87 ; (PaintersOn + 1)
60c7 : d0 09 __ BNE $60d2 ; (draw_plane.s5 + 0)
.s54:
60c9 : ae 86 6e LDX $6e86 ; (PaintersOn + 0)
60cc : ca __ __ DEX
60cd : d0 03 __ BNE $60d2 ; (draw_plane.s5 + 0)
60cf : 4c bb 61 JMP $61bb ; (draw_plane.s10 + 0)
.s5:
60d2 : a5 18 __ LDA P11 ; (n + 1)
60d4 : 30 04 __ BMI $60da ; (draw_plane.s3 + 0)
.s9:
60d6 : 05 17 __ ORA P10 ; (n + 0)
60d8 : d0 0b __ BNE $60e5 ; (draw_plane.s6 + 0)
.s3:
60da : a2 03 __ LDX #$03
60dc : bd f1 fc LDA $fcf1,x ; (draw_plane@stack + 0)
60df : 95 53 __ STA T5 + 0,x 
60e1 : ca __ __ DEX
60e2 : 10 f8 __ BPL $60dc ; (draw_plane.s3 + 2)
60e4 : 60 __ __ RTS
.s6:
60e5 : a9 00 __ LDA #$00
60e7 : 85 51 __ STA T4 + 0 
60e9 : 85 52 __ STA T4 + 1 
.l7:
60eb : a5 51 __ LDA T4 + 0 
60ed : 0a __ __ ASL
60ee : 85 43 __ STA T0 + 0 
60f0 : a5 52 __ LDA T4 + 1 
60f2 : 2a __ __ ROL
60f3 : 18 __ __ CLC
60f4 : 65 16 __ ADC P9 ; (indices + 1)
60f6 : 85 44 __ STA T0 + 1 
60f8 : a4 15 __ LDY P8 ; (indices + 0)
60fa : b1 43 __ LDA (T0 + 0),y 
60fc : 0a __ __ ASL
60fd : 85 1b __ STA ACCU + 0 
60ff : c8 __ __ INY
6100 : b1 43 __ LDA (T0 + 0),y 
6102 : 2a __ __ ROL
6103 : 85 1c __ STA ACCU + 1 
6105 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
6108 : 18 __ __ CLC
6109 : 65 1b __ ADC ACCU + 0 
610b : 85 47 __ STA T2 + 0 
610d : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
6110 : 65 1c __ ADC ACCU + 1 
6112 : 85 48 __ STA T2 + 1 
6114 : a0 00 __ LDY #$00
6116 : b1 47 __ LDA (T2 + 0),y 
6118 : 85 0d __ STA P0 
611a : c8 __ __ INY
611b : b1 47 __ LDA (T2 + 0),y 
611d : 85 0e __ STA P1 
611f : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
6122 : 18 __ __ CLC
6123 : 65 1b __ ADC ACCU + 0 
6125 : 85 43 __ STA T0 + 0 
6127 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
612a : 65 1c __ ADC ACCU + 1 
612c : 85 44 __ STA T0 + 1 
612e : 88 __ __ DEY
612f : b1 43 __ LDA (T0 + 0),y 
6131 : 85 0f __ STA P2 
6133 : c8 __ __ INY
6134 : b1 43 __ LDA (T0 + 0),y 
6136 : 85 10 __ STA P3 
6138 : 18 __ __ CLC
6139 : a5 51 __ LDA T4 + 0 
613b : 69 01 __ ADC #$01
613d : 85 51 __ STA T4 + 0 
613f : 85 1b __ STA ACCU + 0 
6141 : a5 52 __ LDA T4 + 1 
6143 : 69 00 __ ADC #$00
6145 : 85 52 __ STA T4 + 1 
6147 : 85 1c __ STA ACCU + 1 
6149 : a5 17 __ LDA P10 ; (n + 0)
614b : 85 03 __ STA WORK + 0 
614d : a5 18 __ LDA P11 ; (n + 1)
614f : 85 04 __ STA WORK + 1 
6151 : 20 cb 69 JSR $69cb ; (divmod + 0)
6154 : a5 05 __ LDA WORK + 2 
6156 : 0a __ __ ASL
6157 : 85 43 __ STA T0 + 0 
6159 : a5 06 __ LDA WORK + 3 
615b : 2a __ __ ROL
615c : 18 __ __ CLC
615d : 65 16 __ ADC P9 ; (indices + 1)
615f : 85 44 __ STA T0 + 1 
6161 : a4 15 __ LDY P8 ; (indices + 0)
6163 : b1 43 __ LDA (T0 + 0),y 
6165 : 0a __ __ ASL
6166 : 85 1b __ STA ACCU + 0 
6168 : c8 __ __ INY
6169 : b1 43 __ LDA (T0 + 0),y 
616b : 2a __ __ ROL
616c : 85 1c __ STA ACCU + 1 
616e : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
6171 : 18 __ __ CLC
6172 : 65 1b __ ADC ACCU + 0 
6174 : 85 47 __ STA T2 + 0 
6176 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
6179 : 65 1c __ ADC ACCU + 1 
617b : 85 48 __ STA T2 + 1 
617d : a0 00 __ LDY #$00
617f : b1 47 __ LDA (T2 + 0),y 
6181 : 85 13 __ STA P6 
6183 : c8 __ __ INY
6184 : b1 47 __ LDA (T2 + 0),y 
6186 : 85 14 __ STA P7 
6188 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
618b : 18 __ __ CLC
618c : 65 1b __ ADC ACCU + 0 
618e : 85 45 __ STA T1 + 0 
6190 : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
6193 : 65 1c __ ADC ACCU + 1 
6195 : 85 46 __ STA T1 + 1 
6197 : 88 __ __ DEY
6198 : b1 45 __ LDA (T1 + 0),y 
619a : 85 11 __ STA P4 
619c : c8 __ __ INY
619d : b1 45 __ LDA (T1 + 0),y 
619f : 85 12 __ STA P5 
61a1 : 20 f7 53 JSR $53f7 ; (drawline.s4 + 0)
61a4 : a5 52 __ LDA T4 + 1 
61a6 : c5 18 __ CMP P11 ; (n + 1)
61a8 : b0 03 __ BCS $61ad ; (draw_plane.s66 + 0)
61aa : 4c eb 60 JMP $60eb ; (draw_plane.l7 + 0)
.s66:
61ad : f0 03 __ BEQ $61b2 ; (draw_plane.s8 + 0)
61af : 4c da 60 JMP $60da ; (draw_plane.s3 + 0)
.s8:
61b2 : a5 51 __ LDA T4 + 0 
61b4 : c5 17 __ CMP P10 ; (n + 0)
61b6 : 90 f2 __ BCC $61aa ; (draw_plane.l7 + 191)
61b8 : 4c da 60 JMP $60da ; (draw_plane.s3 + 0)
.s10:
61bb : 85 51 __ STA T4 + 0 
61bd : 85 52 __ STA T4 + 1 
61bf : 85 54 __ STA T5 + 1 
61c1 : a9 c8 __ LDA #$c8
61c3 : 85 53 __ STA T5 + 0 
61c5 : a5 18 __ LDA P11 ; (n + 1)
61c7 : 10 06 __ BPL $61cf ; (draw_plane.s12 + 0)
.s11:
61c9 : 8a __ __ TXA
.s64:
61ca : 85 55 __ STA T7 + 0 
61cc : 4c 59 62 JMP $6259 ; (draw_plane.s13 + 0)
.s12:
61cf : 05 17 __ ORA P10 ; (n + 0)
61d1 : f0 f7 __ BEQ $61ca ; (draw_plane.s64 + 0)
.s55:
61d3 : 86 44 __ STX T0 + 1 
61d5 : a9 01 __ LDA #$01
61d7 : 85 55 __ STA T7 + 0 
61d9 : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
61dc : 85 47 __ STA T2 + 0 
61de : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
61e1 : 85 48 __ STA T2 + 1 
.l40:
61e3 : 8a __ __ TXA
61e4 : 0a __ __ ASL
61e5 : 85 4f __ STA T3 + 0 
61e7 : a5 44 __ LDA T0 + 1 
61e9 : 2a __ __ ROL
61ea : 18 __ __ CLC
61eb : 65 16 __ ADC P9 ; (indices + 1)
61ed : 85 50 __ STA T3 + 1 
61ef : a4 15 __ LDY P8 ; (indices + 0)
61f1 : b1 4f __ LDA (T3 + 0),y 
61f3 : 0a __ __ ASL
61f4 : 85 1b __ STA ACCU + 0 
61f6 : c8 __ __ INY
61f7 : b1 4f __ LDA (T3 + 0),y 
61f9 : 2a __ __ ROL
61fa : a8 __ __ TAY
61fb : 18 __ __ CLC
61fc : a5 47 __ LDA T2 + 0 
61fe : 65 1b __ ADC ACCU + 0 
6200 : 85 4f __ STA T3 + 0 
6202 : 98 __ __ TYA
6203 : 65 48 __ ADC T2 + 1 
6205 : 85 50 __ STA T3 + 1 
6207 : a0 00 __ LDY #$00
6209 : b1 4f __ LDA (T3 + 0),y 
620b : 85 1b __ STA ACCU + 0 
620d : c8 __ __ INY
620e : b1 4f __ LDA (T3 + 0),y 
6210 : 85 1c __ STA ACCU + 1 
6212 : c5 54 __ CMP T5 + 1 
6214 : d0 08 __ BNE $621e ; (draw_plane.s53 + 0)
.s50:
6216 : a5 1b __ LDA ACCU + 0 
6218 : c5 53 __ CMP T5 + 0 
.s51:
621a : 90 08 __ BCC $6224 ; (draw_plane.s49 + 0)
621c : b0 0e __ BCS $622c ; (draw_plane.s41 + 0)
.s53:
621e : 45 54 __ EOR T5 + 1 
6220 : 10 f8 __ BPL $621a ; (draw_plane.s51 + 0)
.s52:
6222 : 90 08 __ BCC $622c ; (draw_plane.s41 + 0)
.s49:
6224 : a5 1b __ LDA ACCU + 0 
6226 : 85 53 __ STA T5 + 0 
6228 : a5 1c __ LDA ACCU + 1 
622a : 85 54 __ STA T5 + 1 
.s41:
622c : a5 52 __ LDA T4 + 1 
622e : c5 1c __ CMP ACCU + 1 
6230 : d0 08 __ BNE $623a ; (draw_plane.s48 + 0)
.s45:
6232 : a5 51 __ LDA T4 + 0 
6234 : c5 1b __ CMP ACCU + 0 
.s46:
6236 : 90 08 __ BCC $6240 ; (draw_plane.s44 + 0)
6238 : b0 0e __ BCS $6248 ; (draw_plane.s42 + 0)
.s48:
623a : 45 1c __ EOR ACCU + 1 
623c : 10 f8 __ BPL $6236 ; (draw_plane.s46 + 0)
.s47:
623e : 90 08 __ BCC $6248 ; (draw_plane.s42 + 0)
.s44:
6240 : a5 1b __ LDA ACCU + 0 
6242 : 85 51 __ STA T4 + 0 
6244 : a5 1c __ LDA ACCU + 1 
6246 : 85 52 __ STA T4 + 1 
.s42:
6248 : e8 __ __ INX
6249 : d0 02 __ BNE $624d ; (draw_plane.s57 + 0)
.s56:
624b : e6 44 __ INC T0 + 1 
.s57:
624d : a5 44 __ LDA T0 + 1 
624f : c5 18 __ CMP P11 ; (n + 1)
6251 : 90 90 __ BCC $61e3 ; (draw_plane.l40 + 0)
.s65:
6253 : d0 04 __ BNE $6259 ; (draw_plane.s13 + 0)
.s43:
6255 : e4 17 __ CPX P10 ; (n + 0)
6257 : 90 8a __ BCC $61e3 ; (draw_plane.l40 + 0)
.s13:
6259 : a5 52 __ LDA T4 + 1 
625b : c5 54 __ CMP T5 + 1 
625d : d0 09 __ BNE $6268 ; (draw_plane.s18 + 0)
.s15:
625f : a5 51 __ LDA T4 + 0 
6261 : c5 53 __ CMP T5 + 0 
.s16:
6263 : a9 00 __ LDA #$00
6265 : 2a __ __ ROL
6266 : 90 09 __ BCC $6271 ; (draw_plane.s14 + 0)
.s18:
6268 : 45 54 __ EOR T5 + 1 
626a : 10 f7 __ BPL $6263 ; (draw_plane.s16 + 0)
.s17:
626c : a9 00 __ LDA #$00
626e : 2a __ __ ROL
626f : 49 01 __ EOR #$01
.s14:
6271 : 85 56 __ STA T8 + 0 
6273 : f0 66 __ BEQ $62db ; (draw_plane.s19 + 0)
.s35:
6275 : a5 53 __ LDA T5 + 0 
6277 : 85 47 __ STA T2 + 0 
6279 : 0a __ __ ASL
627a : 85 43 __ STA T0 + 0 
627c : a9 00 __ LDA #$00
627e : 2a __ __ ROL
627f : 85 44 __ STA T0 + 1 
6281 : a9 bc __ LDA #$bc
6283 : 65 43 __ ADC T0 + 0 
6285 : 85 45 __ STA T1 + 0 
6287 : a9 80 __ LDA #$80
6289 : 65 44 __ ADC T0 + 1 
628b : 85 46 __ STA T1 + 1 
628d : 18 __ __ CLC
628e : a9 4c __ LDA #$4c
6290 : 65 43 __ ADC T0 + 0 
6292 : 85 43 __ STA T0 + 0 
6294 : a9 82 __ LDA #$82
6296 : 65 44 __ ADC T0 + 1 
6298 : 85 44 __ STA T0 + 1 
629a : a5 54 __ LDA T5 + 1 
629c : 85 48 __ STA T2 + 1 
629e : a6 51 __ LDX T4 + 0 
.l36:
62a0 : a9 40 __ LDA #$40
62a2 : a0 00 __ LDY #$00
62a4 : 91 45 __ STA (T1 + 0),y 
62a6 : a9 01 __ LDA #$01
62a8 : a8 __ __ TAY
62a9 : 91 45 __ STA (T1 + 0),y 
62ab : a9 ff __ LDA #$ff
62ad : 88 __ __ DEY
62ae : 91 43 __ STA (T0 + 0),y 
62b0 : c8 __ __ INY
62b1 : 91 43 __ STA (T0 + 0),y 
62b3 : 18 __ __ CLC
62b4 : a5 43 __ LDA T0 + 0 
62b6 : 69 02 __ ADC #$02
62b8 : 85 43 __ STA T0 + 0 
62ba : 90 03 __ BCC $62bf ; (draw_plane.s59 + 0)
.s58:
62bc : e6 44 __ INC T0 + 1 
62be : 18 __ __ CLC
.s59:
62bf : a5 45 __ LDA T1 + 0 
62c1 : 69 02 __ ADC #$02
62c3 : 85 45 __ STA T1 + 0 
62c5 : 90 02 __ BCC $62c9 ; (draw_plane.s61 + 0)
.s60:
62c7 : e6 46 __ INC T1 + 1 
.s61:
62c9 : e6 47 __ INC T2 + 0 
62cb : d0 02 __ BNE $62cf ; (draw_plane.s63 + 0)
.s62:
62cd : e6 48 __ INC T2 + 1 
.s63:
62cf : a5 52 __ LDA T4 + 1 
62d1 : 30 08 __ BMI $62db ; (draw_plane.s19 + 0)
.s39:
62d3 : c5 48 __ CMP T2 + 1 
62d5 : d0 02 __ BNE $62d9 ; (draw_plane.s38 + 0)
.s37:
62d7 : e4 47 __ CPX T2 + 0 
.s38:
62d9 : b0 c5 __ BCS $62a0 ; (draw_plane.l36 + 0)
.s19:
62db : a5 55 __ LDA T7 + 0 
62dd : f0 0d __ BEQ $62ec ; (draw_plane.s20 + 0)
.s31:
62df : a9 00 __ LDA #$00
62e1 : 85 4f __ STA T3 + 0 
62e3 : 85 50 __ STA T3 + 1 
62e5 : a5 15 __ LDA P8 ; (indices + 0)
62e7 : 85 55 __ STA T7 + 0 
62e9 : 4c 6c 63 JMP $636c ; (draw_plane.l32 + 0)
.s20:
62ec : a9 01 __ LDA #$01
62ee : 8d 36 6e STA $6e36 ; (drawing_mode + 0)
62f1 : a9 00 __ LDA #$00
62f3 : 8d 37 6e STA $6e37 ; (drawing_mode + 1)
62f6 : a5 56 __ LDA T8 + 0 
62f8 : f0 67 __ BEQ $6361 ; (draw_plane.s21 + 0)
.l22:
62fa : a5 53 __ LDA T5 + 0 
62fc : 0a __ __ ASL
62fd : 85 43 __ STA T0 + 0 
62ff : a8 __ __ TAY
6300 : a9 00 __ LDA #$00
6302 : 2a __ __ ROL
6303 : 85 44 __ STA T0 + 1 
6305 : 69 80 __ ADC #$80
6307 : 85 46 __ STA T1 + 1 
6309 : a9 bc __ LDA #$bc
630b : 85 45 __ STA T1 + 0 
630d : b1 45 __ LDA (T1 + 0),y 
630f : aa __ __ TAX
6310 : c8 __ __ INY
6311 : b1 45 __ LDA (T1 + 0),y 
6313 : 85 0e __ STA P1 
6315 : a9 4c __ LDA #$4c
6317 : 65 43 __ ADC T0 + 0 
6319 : 85 43 __ STA T0 + 0 
631b : a9 82 __ LDA #$82
631d : 65 44 __ ADC T0 + 1 
631f : 85 44 __ STA T0 + 1 
6321 : a0 00 __ LDY #$00
6323 : b1 43 __ LDA (T0 + 0),y 
6325 : 85 11 __ STA P4 
6327 : c8 __ __ INY
6328 : b1 43 __ LDA (T0 + 0),y 
632a : c5 0e __ CMP P1 
632c : d0 0a __ BNE $6338 ; (draw_plane.s30 + 0)
.s27:
632e : 86 45 __ STX T1 + 0 
6330 : a5 11 __ LDA P4 
6332 : c5 45 __ CMP T1 + 0 
.s28:
6334 : b0 08 __ BCS $633e ; (draw_plane.s26 + 0)
6336 : 90 1b __ BCC $6353 ; (draw_plane.s23 + 0)
.s30:
6338 : 45 0e __ EOR P1 
633a : 10 f8 __ BPL $6334 ; (draw_plane.s28 + 0)
.s29:
633c : b0 15 __ BCS $6353 ; (draw_plane.s23 + 0)
.s26:
633e : 86 0d __ STX P0 
6340 : a5 53 __ LDA T5 + 0 
6342 : 85 0f __ STA P2 
6344 : 85 13 __ STA P6 
6346 : a9 00 __ LDA #$00
6348 : 85 10 __ STA P3 
634a : 85 14 __ STA P7 
634c : b1 43 __ LDA (T0 + 0),y 
634e : 85 12 __ STA P5 
6350 : 20 f7 53 JSR $53f7 ; (drawline.s4 + 0)
.s23:
6353 : e6 53 __ INC T5 + 0 
6355 : a5 52 __ LDA T4 + 1 
6357 : 30 08 __ BMI $6361 ; (draw_plane.s21 + 0)
.s25:
6359 : d0 9f __ BNE $62fa ; (draw_plane.l22 + 0)
.s24:
635b : a5 51 __ LDA T4 + 0 
635d : c5 53 __ CMP T5 + 0 
635f : b0 99 __ BCS $62fa ; (draw_plane.l22 + 0)
.s21:
6361 : a9 00 __ LDA #$00
6363 : 8d 36 6e STA $6e36 ; (drawing_mode + 0)
6366 : 8d 37 6e STA $6e37 ; (drawing_mode + 1)
6369 : 4c d2 60 JMP $60d2 ; (draw_plane.s5 + 0)
.l32:
636c : a5 4f __ LDA T3 + 0 
636e : 0a __ __ ASL
636f : 85 43 __ STA T0 + 0 
6371 : a5 50 __ LDA T3 + 1 
6373 : 2a __ __ ROL
6374 : 18 __ __ CLC
6375 : 65 16 __ ADC P9 ; (indices + 1)
6377 : 85 44 __ STA T0 + 1 
6379 : a4 55 __ LDY T7 + 0 
637b : b1 43 __ LDA (T0 + 0),y 
637d : 0a __ __ ASL
637e : 85 1b __ STA ACCU + 0 
6380 : c8 __ __ INY
6381 : b1 43 __ LDA (T0 + 0),y 
6383 : 2a __ __ ROL
6384 : 85 1c __ STA ACCU + 1 
6386 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
6389 : 18 __ __ CLC
638a : 65 1b __ ADC ACCU + 0 
638c : 85 47 __ STA T2 + 0 
638e : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
6391 : 65 1c __ ADC ACCU + 1 
6393 : 85 48 __ STA T2 + 1 
6395 : a0 00 __ LDY #$00
6397 : b1 47 __ LDA (T2 + 0),y 
6399 : 85 0d __ STA P0 
639b : c8 __ __ INY
639c : b1 47 __ LDA (T2 + 0),y 
639e : 85 0e __ STA P1 
63a0 : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
63a3 : 18 __ __ CLC
63a4 : 65 1b __ ADC ACCU + 0 
63a6 : 85 43 __ STA T0 + 0 
63a8 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
63ab : 65 1c __ ADC ACCU + 1 
63ad : 85 44 __ STA T0 + 1 
63af : 88 __ __ DEY
63b0 : b1 43 __ LDA (T0 + 0),y 
63b2 : 85 0f __ STA P2 
63b4 : c8 __ __ INY
63b5 : b1 43 __ LDA (T0 + 0),y 
63b7 : 85 10 __ STA P3 
63b9 : 18 __ __ CLC
63ba : a5 4f __ LDA T3 + 0 
63bc : 69 01 __ ADC #$01
63be : 85 4f __ STA T3 + 0 
63c0 : 85 1b __ STA ACCU + 0 
63c2 : a5 50 __ LDA T3 + 1 
63c4 : 69 00 __ ADC #$00
63c6 : 85 50 __ STA T3 + 1 
63c8 : 85 1c __ STA ACCU + 1 
63ca : a5 17 __ LDA P10 ; (n + 0)
63cc : 85 03 __ STA WORK + 0 
63ce : a5 18 __ LDA P11 ; (n + 1)
63d0 : 85 04 __ STA WORK + 1 
63d2 : 20 58 6a JSR $6a58 ; (mods16 + 0)
63d5 : a5 05 __ LDA WORK + 2 
63d7 : 0a __ __ ASL
63d8 : 85 43 __ STA T0 + 0 
63da : a5 06 __ LDA WORK + 3 
63dc : 2a __ __ ROL
63dd : 18 __ __ CLC
63de : 65 16 __ ADC P9 ; (indices + 1)
63e0 : 85 44 __ STA T0 + 1 
63e2 : a4 55 __ LDY T7 + 0 
63e4 : b1 43 __ LDA (T0 + 0),y 
63e6 : 0a __ __ ASL
63e7 : 85 1b __ STA ACCU + 0 
63e9 : c8 __ __ INY
63ea : b1 43 __ LDA (T0 + 0),y 
63ec : 2a __ __ ROL
63ed : 85 1c __ STA ACCU + 1 
63ef : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
63f2 : 18 __ __ CLC
63f3 : 65 1b __ ADC ACCU + 0 
63f5 : 85 47 __ STA T2 + 0 
63f7 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
63fa : 65 1c __ ADC ACCU + 1 
63fc : 85 48 __ STA T2 + 1 
63fe : a0 00 __ LDY #$00
6400 : b1 47 __ LDA (T2 + 0),y 
6402 : 85 13 __ STA P6 
6404 : c8 __ __ INY
6405 : b1 47 __ LDA (T2 + 0),y 
6407 : 85 14 __ STA P7 
6409 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
640c : 18 __ __ CLC
640d : 65 1b __ ADC ACCU + 0 
640f : 85 45 __ STA T1 + 0 
6411 : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
6414 : 65 1c __ ADC ACCU + 1 
6416 : 85 46 __ STA T1 + 1 
6418 : 88 __ __ DEY
6419 : b1 45 __ LDA (T1 + 0),y 
641b : 85 11 __ STA P4 
641d : c8 __ __ INY
641e : b1 45 __ LDA (T1 + 0),y 
6420 : 85 12 __ STA P5 
6422 : 20 40 64 JSR $6440 ; (scan_edge.s4 + 0)
6425 : 24 18 __ BIT P11 ; (n + 1)
6427 : 10 03 __ BPL $642c ; (draw_plane.s34 + 0)
6429 : 4c ec 62 JMP $62ec ; (draw_plane.s20 + 0)
.s34:
642c : a5 50 __ LDA T3 + 1 
642e : c5 18 __ CMP P11 ; (n + 1)
6430 : b0 03 __ BCS $6435 ; (draw_plane.s67 + 0)
6432 : 4c 6c 63 JMP $636c ; (draw_plane.l32 + 0)
.s67:
6435 : d0 f2 __ BNE $6429 ; (draw_plane.l32 + 189)
.s33:
6437 : a5 4f __ LDA T3 + 0 
6439 : c5 17 __ CMP P10 ; (n + 0)
643b : 90 f5 __ BCC $6432 ; (draw_plane.s34 + 6)
643d : 4c ec 62 JMP $62ec ; (draw_plane.s20 + 0)
--------------------------------------------------------------------
scan_edge: ; scan_edge(i16,i16,i16,i16)->void
; 433, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
6440 : a4 10 __ LDY P3 ; (y1 + 1)
6442 : a6 0f __ LDX P2 ; (y1 + 0)
6444 : c4 14 __ CPY P7 ; (y2 + 1)
6446 : d0 05 __ BNE $644d ; (scan_edge.s5 + 0)
.s32:
6448 : e4 13 __ CPX P6 ; (y2 + 0)
644a : d0 01 __ BNE $644d ; (scan_edge.s5 + 0)
644c : 60 __ __ RTS
.s5:
644d : a5 14 __ LDA P7 ; (y2 + 1)
644f : c5 10 __ CMP P3 ; (y1 + 1)
6451 : d0 08 __ BNE $645b ; (scan_edge.s31 + 0)
.s28:
6453 : a5 13 __ LDA P6 ; (y2 + 0)
6455 : c5 0f __ CMP P2 ; (y1 + 0)
.s29:
6457 : 90 08 __ BCC $6461 ; (scan_edge.s27 + 0)
6459 : b0 22 __ BCS $647d ; (scan_edge.s6 + 0)
.s31:
645b : 45 10 __ EOR P3 ; (y1 + 1)
645d : 10 f8 __ BPL $6457 ; (scan_edge.s29 + 0)
.s30:
645f : 90 1c __ BCC $647d ; (scan_edge.s6 + 0)
.s27:
6461 : a5 13 __ LDA P6 ; (y2 + 0)
6463 : 86 13 __ STX P6 ; (y2 + 0)
6465 : 85 0f __ STA P2 ; (y1 + 0)
6467 : a5 14 __ LDA P7 ; (y2 + 1)
6469 : 84 14 __ STY P7 ; (y2 + 1)
646b : 85 10 __ STA P3 ; (y1 + 1)
646d : a5 0d __ LDA P0 ; (x1 + 0)
646f : a6 11 __ LDX P4 ; (x2 + 0)
6471 : 86 0d __ STX P0 ; (x1 + 0)
6473 : 85 11 __ STA P4 ; (x2 + 0)
6475 : a5 0e __ LDA P1 ; (x1 + 1)
6477 : a6 12 __ LDX P5 ; (x2 + 1)
6479 : 86 0e __ STX P1 ; (x1 + 1)
647b : 85 12 __ STA P5 ; (x2 + 1)
.s6:
647d : a5 11 __ LDA P4 ; (x2 + 0)
647f : 38 __ __ SEC
6480 : e5 0d __ SBC P0 ; (x1 + 0)
6482 : 85 1c __ STA ACCU + 1 
6484 : a5 12 __ LDA P5 ; (x2 + 1)
6486 : e5 0e __ SBC P1 ; (x1 + 1)
6488 : 85 1d __ STA ACCU + 2 
648a : 29 80 __ AND #$80
648c : 10 02 __ BPL $6490 ; (scan_edge.s6 + 19)
648e : a9 ff __ LDA #$ff
6490 : 85 1e __ STA ACCU + 3 
6492 : 38 __ __ SEC
6493 : a5 13 __ LDA P6 ; (y2 + 0)
6495 : e5 0f __ SBC P2 ; (y1 + 0)
6497 : 85 03 __ STA WORK + 0 
6499 : a5 14 __ LDA P7 ; (y2 + 1)
649b : e5 10 __ SBC P3 ; (y1 + 1)
649d : 85 04 __ STA WORK + 1 
649f : 0a __ __ ASL
64a0 : a9 00 __ LDA #$00
64a2 : 85 1b __ STA ACCU + 0 
64a4 : 69 ff __ ADC #$ff
64a6 : 49 ff __ EOR #$ff
64a8 : 85 06 __ STA WORK + 3 
64aa : 85 05 __ STA WORK + 2 
64ac : 20 ae 6b JSR $6bae ; (divs32 + 0)
64af : a2 00 __ LDX #$00
64b1 : f0 11 __ BEQ $64c4 ; (scan_edge.l7 + 0)
.s34:
64b3 : 8a __ __ TXA
64b4 : 18 __ __ CLC
64b5 : 65 1b __ ADC ACCU + 0 
64b7 : aa __ __ TAX
64b8 : a5 0d __ LDA P0 ; (x1 + 0)
64ba : 65 1c __ ADC ACCU + 1 
64bc : 85 0d __ STA P0 ; (x1 + 0)
64be : a5 0e __ LDA P1 ; (x1 + 1)
64c0 : 65 1d __ ADC ACCU + 2 
64c2 : 85 0e __ STA P1 ; (x1 + 1)
.l7:
64c4 : a5 14 __ LDA P7 ; (y2 + 1)
64c6 : c5 10 __ CMP P3 ; (y1 + 1)
64c8 : d0 07 __ BNE $64d1 ; (scan_edge.s26 + 0)
.s23:
64ca : a5 13 __ LDA P6 ; (y2 + 0)
64cc : c5 0f __ CMP P2 ; (y1 + 0)
.s24:
64ce : b0 07 __ BCS $64d7 ; (scan_edge.s8 + 0)
64d0 : 60 __ __ RTS
.s26:
64d1 : 45 10 __ EOR P3 ; (y1 + 1)
64d3 : 10 f9 __ BPL $64ce ; (scan_edge.s24 + 0)
.s25:
64d5 : b0 7b __ BCS $6552 ; (scan_edge.s3 + 0)
.s8:
64d7 : a5 10 __ LDA P3 ; (y1 + 1)
64d9 : d0 6b __ BNE $6546 ; (scan_edge.s9 + 0)
.s22:
64db : a5 0f __ LDA P2 ; (y1 + 0)
64dd : c9 c8 __ CMP #$c8
64df : b0 65 __ BCS $6546 ; (scan_edge.s9 + 0)
.s10:
64e1 : 0a __ __ ASL
64e2 : 85 43 __ STA T5 + 0 
64e4 : a8 __ __ TAY
64e5 : a9 00 __ LDA #$00
64e7 : 2a __ __ ROL
64e8 : 85 44 __ STA T5 + 1 
64ea : a9 bc __ LDA #$bc
64ec : 85 45 __ STA T6 + 0 
64ee : a9 80 __ LDA #$80
64f0 : 65 44 __ ADC T5 + 1 
64f2 : 85 46 __ STA T6 + 1 
64f4 : b1 45 __ LDA (T6 + 0),y 
64f6 : 85 1e __ STA ACCU + 3 
64f8 : a5 0e __ LDA P1 ; (x1 + 1)
64fa : c8 __ __ INY
64fb : d1 45 __ CMP (T6 + 0),y 
64fd : d0 08 __ BNE $6507 ; (scan_edge.s21 + 0)
.s18:
64ff : a5 0d __ LDA P0 ; (x1 + 0)
6501 : c5 1e __ CMP ACCU + 3 
.s19:
6503 : 90 08 __ BCC $650d ; (scan_edge.s17 + 0)
6505 : b0 10 __ BCS $6517 ; (scan_edge.s11 + 0)
.s21:
6507 : 51 45 __ EOR (T6 + 0),y 
6509 : 10 f8 __ BPL $6503 ; (scan_edge.s19 + 0)
.s20:
650b : 90 0a __ BCC $6517 ; (scan_edge.s11 + 0)
.s17:
650d : a5 0d __ LDA P0 ; (x1 + 0)
650f : 88 __ __ DEY
6510 : 91 45 __ STA (T6 + 0),y 
6512 : a5 0e __ LDA P1 ; (x1 + 1)
6514 : c8 __ __ INY
6515 : 91 45 __ STA (T6 + 0),y 
.s11:
6517 : 18 __ __ CLC
6518 : a9 4c __ LDA #$4c
651a : 65 43 __ ADC T5 + 0 
651c : 85 43 __ STA T5 + 0 
651e : a9 82 __ LDA #$82
6520 : 65 44 __ ADC T5 + 1 
6522 : 85 44 __ STA T5 + 1 
6524 : a0 01 __ LDY #$01
6526 : b1 43 __ LDA (T5 + 0),y 
6528 : c5 0e __ CMP P1 ; (x1 + 1)
652a : d0 09 __ BNE $6535 ; (scan_edge.s16 + 0)
.s13:
652c : 88 __ __ DEY
652d : b1 43 __ LDA (T5 + 0),y 
652f : c5 0d __ CMP P0 ; (x1 + 0)
.s14:
6531 : 90 08 __ BCC $653b ; (scan_edge.s12 + 0)
6533 : b0 11 __ BCS $6546 ; (scan_edge.s9 + 0)
.s16:
6535 : 45 0e __ EOR P1 ; (x1 + 1)
6537 : 10 f8 __ BPL $6531 ; (scan_edge.s14 + 0)
.s15:
6539 : 90 0b __ BCC $6546 ; (scan_edge.s9 + 0)
.s12:
653b : a5 0d __ LDA P0 ; (x1 + 0)
653d : a0 00 __ LDY #$00
653f : 91 43 __ STA (T5 + 0),y 
6541 : a5 0e __ LDA P1 ; (x1 + 1)
6543 : c8 __ __ INY
6544 : 91 43 __ STA (T5 + 0),y 
.s9:
6546 : e6 0f __ INC P2 ; (y1 + 0)
6548 : f0 03 __ BEQ $654d ; (scan_edge.s33 + 0)
654a : 4c b3 64 JMP $64b3 ; (scan_edge.s34 + 0)
.s33:
654d : e6 10 __ INC P3 ; (y1 + 1)
654f : 4c b3 64 JMP $64b3 ; (scan_edge.s34 + 0)
.s3:
6552 : 60 __ __ RTS
--------------------------------------------------------------------
switchVisiblePage: ; switchVisiblePage()->void
;  99, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
6553 : ad 11 6e LDA $6e11 ; (bitmap + 1)
6556 : c9 c0 __ CMP #$c0
6558 : d0 05 __ BNE $655f ; (switchVisiblePage.s5 + 0)
.s7:
655a : ad 10 6e LDA $6e10 ; (bitmap + 0)
655d : f0 03 __ BEQ $6562 ; (SetViewPage2.s4 + 0)
.s5:
655f : 4c a7 57 JMP $57a7 ; (SetViewPage1.s4 + 0)
--------------------------------------------------------------------
SetViewPage2: ; SetViewPage2()->void
;  74, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
6562 : ad 12 ff LDA $ff12 
6565 : 29 c3 __ AND #$c3
6567 : 09 30 __ ORA #$30
6569 : 8d 12 ff STA $ff12 
.s3:
656c : 60 __ __ RTS
--------------------------------------------------------------------
DoTranslate: ; DoTranslate(i16,i16,i16,i16)->void
; 598, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
656d : ad fc fc LDA $fcfc ; (sstack + 4)
6570 : 85 43 __ STA T0 + 0 
6572 : ad fd fc LDA $fcfd ; (sstack + 5)
6575 : 85 44 __ STA T0 + 1 
6577 : ad a4 6e LDA $6ea4 ; (c + 0)
657a : 85 45 __ STA T1 + 0 
657c : ad a5 6e LDA $6ea5 ; (c + 1)
657f : 85 46 __ STA T1 + 1 
6581 : ad b6 6e LDA $6eb6 ; (vy_pct + 0)
6584 : 85 47 __ STA T2 + 0 
6586 : ad b7 6e LDA $6eb7 ; (vy_pct + 1)
6589 : 85 48 __ STA T2 + 1 
658b : ad fb fc LDA $fcfb ; (sstack + 3)
658e : 85 4a __ STA T3 + 1 
6590 : ad fa fc LDA $fcfa ; (sstack + 2)
6593 : f0 40 __ BEQ $65d5 ; (DoTranslate.s5 + 0)
.s10:
6595 : a5 46 __ LDA T1 + 1 
6597 : 30 3c __ BMI $65d5 ; (DoTranslate.s5 + 0)
.s13:
6599 : 05 45 __ ORA T1 + 0 
659b : f0 38 __ BEQ $65d5 ; (DoTranslate.s5 + 0)
.s11:
659d : a5 45 __ LDA T1 + 0 
659f : 85 4b __ STA T4 + 0 
65a1 : ad b4 6e LDA $6eb4 ; (vx_pct + 0)
65a4 : 85 4d __ STA T5 + 0 
65a6 : ad b5 6e LDA $6eb5 ; (vx_pct + 1)
65a9 : 85 4e __ STA T5 + 1 
65ab : a6 46 __ LDX T1 + 1 
.l12:
65ad : 18 __ __ CLC
65ae : a0 00 __ LDY #$00
65b0 : b1 4d __ LDA (T5 + 0),y 
65b2 : 6d fa fc ADC $fcfa ; (sstack + 2)
65b5 : 91 4d __ STA (T5 + 0),y 
65b7 : c8 __ __ INY
65b8 : b1 4d __ LDA (T5 + 0),y 
65ba : 65 4a __ ADC T3 + 1 
65bc : 91 4d __ STA (T5 + 0),y 
65be : 18 __ __ CLC
65bf : a5 4d __ LDA T5 + 0 
65c1 : 69 02 __ ADC #$02
65c3 : 85 4d __ STA T5 + 0 
65c5 : 90 02 __ BCC $65c9 ; (DoTranslate.s19 + 0)
.s18:
65c7 : e6 4e __ INC T5 + 1 
.s19:
65c9 : a5 4b __ LDA T4 + 0 
65cb : d0 01 __ BNE $65ce ; (DoTranslate.s16 + 0)
.s15:
65cd : ca __ __ DEX
.s16:
65ce : c6 4b __ DEC T4 + 0 
65d0 : d0 db __ BNE $65ad ; (DoTranslate.l12 + 0)
.s17:
65d2 : 8a __ __ TXA
65d3 : d0 d8 __ BNE $65ad ; (DoTranslate.l12 + 0)
.s5:
65d5 : a5 43 __ LDA T0 + 0 
65d7 : f0 31 __ BEQ $660a ; (DoTranslate.s6 + 0)
.s7:
65d9 : a5 46 __ LDA T1 + 1 
65db : 30 2d __ BMI $660a ; (DoTranslate.s6 + 0)
.s9:
65dd : 05 45 __ ORA T1 + 0 
65df : f0 29 __ BEQ $660a ; (DoTranslate.s6 + 0)
.s14:
65e1 : a6 46 __ LDX T1 + 1 
.l8:
65e3 : 18 __ __ CLC
65e4 : a0 00 __ LDY #$00
65e6 : b1 47 __ LDA (T2 + 0),y 
65e8 : 65 43 __ ADC T0 + 0 
65ea : 91 47 __ STA (T2 + 0),y 
65ec : c8 __ __ INY
65ed : b1 47 __ LDA (T2 + 0),y 
65ef : 65 44 __ ADC T0 + 1 
65f1 : 91 47 __ STA (T2 + 0),y 
65f3 : 18 __ __ CLC
65f4 : a5 47 __ LDA T2 + 0 
65f6 : 69 02 __ ADC #$02
65f8 : 85 47 __ STA T2 + 0 
65fa : 90 02 __ BCC $65fe ; (DoTranslate.s24 + 0)
.s23:
65fc : e6 48 __ INC T2 + 1 
.s24:
65fe : a5 45 __ LDA T1 + 0 
6600 : d0 01 __ BNE $6603 ; (DoTranslate.s21 + 0)
.s20:
6602 : ca __ __ DEX
.s21:
6603 : c6 45 __ DEC T1 + 0 
6605 : d0 dc __ BNE $65e3 ; (DoTranslate.l8 + 0)
.s22:
6607 : 8a __ __ TXA
6608 : d0 d9 __ BNE $65e3 ; (DoTranslate.l8 + 0)
.s6:
660a : 20 75 43 JSR $4375 ; (ultra_fast_clear.s4 + 0)
660d : ad fe fc LDA $fcfe ; (sstack + 6)
6610 : 8d f8 fc STA $fcf8 ; (sstack + 0)
6613 : ad ff fc LDA $fcff ; (sstack + 7)
6616 : 8d f9 fc STA $fcf9 ; (sstack + 1)
6619 : 20 f8 5b JSR $5bf8 ; (sort_and_render_faces.s1 + 0)
661c : 20 53 65 JSR $6553 ; (switchVisiblePage.s4 + 0)
--------------------------------------------------------------------
switchDrawPage: ; switchDrawPage()->void
;  91, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
661f : ad 11 6e LDA $6e11 ; (bitmap + 1)
6622 : c9 c0 __ CMP #$c0
6624 : d0 09 __ BNE $662f ; (switchDrawPage.s5 + 0)
.s7:
6626 : ad 10 6e LDA $6e10 ; (bitmap + 0)
6629 : d0 04 __ BNE $662f ; (switchDrawPage.s5 + 0)
.s6:
662b : a9 20 __ LDA #$20
662d : d0 07 __ BNE $6636 ; (switchDrawPage.s3 + 0)
.s5:
662f : a9 00 __ LDA #$00
6631 : 8d 10 6e STA $6e10 ; (bitmap + 0)
6634 : a9 c0 __ LDA #$c0
.s3:
6636 : 8d 11 6e STA $6e11 ; (bitmap + 1)
6639 : 60 __ __ RTS
--------------------------------------------------------------------
wait_for_key: ; wait_for_key()->u8
; 617, "D:/Arbeit/3D/repogit/3DEngine/Commodore Plus4/Oscar64/3dengineOscar.c"
.s4:
663a : a9 00 __ LDA #$00
663c : 85 02 __ STA $02 
663e : a5 02 __ LDA $02 
6640 : d0 11 __ BNE $6653 ; (wait_for_key.s3 + 0)
.l5:
6642 : 78 __ __ SEI
6643 : 8d 3e ff STA $ff3e 
6646 : 20 e4 ff JSR $ffe4 
6649 : 85 02 __ STA $02 
664b : 8d 3f ff STA $ff3f 
664e : 58 __ __ CLI
664f : a5 02 __ LDA $02 
6651 : f0 ef __ BEQ $6642 ; (wait_for_key.l5 + 0)
.s3:
6653 : a5 02 __ LDA $02 
6655 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
6656 : a0 00 __ LDY #$00
6658 : 84 07 __ STY WORK + 4 
665a : 84 08 __ STY WORK + 5 
665c : 84 09 __ STY WORK + 6 
665e : 4a __ __ LSR
665f : b0 0d __ BCS $666e ; (mul32by8 + 24)
6661 : f0 26 __ BEQ $6689 ; (mul32by8 + 51)
6663 : 06 1b __ ASL ACCU + 0 
6665 : 26 1c __ ROL ACCU + 1 
6667 : 26 1d __ ROL ACCU + 2 
6669 : 26 1e __ ROL ACCU + 3 
666b : 4a __ __ LSR
666c : 90 f5 __ BCC $6663 ; (mul32by8 + 13)
666e : aa __ __ TAX
666f : 18 __ __ CLC
6670 : a5 07 __ LDA WORK + 4 
6672 : 65 1b __ ADC ACCU + 0 
6674 : 85 07 __ STA WORK + 4 
6676 : a5 08 __ LDA WORK + 5 
6678 : 65 1c __ ADC ACCU + 1 
667a : 85 08 __ STA WORK + 5 
667c : a5 09 __ LDA WORK + 6 
667e : 65 1d __ ADC ACCU + 2 
6680 : 85 09 __ STA WORK + 6 
6682 : 98 __ __ TYA
6683 : 65 1e __ ADC ACCU + 3 
6685 : a8 __ __ TAY
6686 : 8a __ __ TXA
6687 : d0 da __ BNE $6663 ; (mul32by8 + 13)
6689 : 84 0a __ STY WORK + 7 
668b : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
668c : b1 19 __ LDA (IP + 0),y 
668e : c8 __ __ INY
668f : aa __ __ TAX
6690 : b5 00 __ LDA $00,x 
6692 : 85 03 __ STA WORK + 0 
6694 : b5 01 __ LDA $01,x 
6696 : 85 04 __ STA WORK + 1 
6698 : b5 02 __ LDA $02,x 
669a : 85 05 __ STA WORK + 2 
669c : b5 03 __ LDA WORK + 0,x 
669e : 85 06 __ STA WORK + 3 
66a0 : a5 05 __ LDA WORK + 2 
66a2 : 0a __ __ ASL
66a3 : a5 06 __ LDA WORK + 3 
66a5 : 2a __ __ ROL
66a6 : 85 08 __ STA WORK + 5 
66a8 : f0 06 __ BEQ $66b0 ; (freg + 36)
66aa : a5 05 __ LDA WORK + 2 
66ac : 09 80 __ ORA #$80
66ae : 85 05 __ STA WORK + 2 
66b0 : a5 1d __ LDA ACCU + 2 
66b2 : 0a __ __ ASL
66b3 : a5 1e __ LDA ACCU + 3 
66b5 : 2a __ __ ROL
66b6 : 85 07 __ STA WORK + 4 
66b8 : f0 06 __ BEQ $66c0 ; (freg + 52)
66ba : a5 1d __ LDA ACCU + 2 
66bc : 09 80 __ ORA #$80
66be : 85 1d __ STA ACCU + 2 
66c0 : 60 __ __ RTS
66c1 : 06 1e __ ASL ACCU + 3 
66c3 : a5 07 __ LDA WORK + 4 
66c5 : 6a __ __ ROR
66c6 : 85 1e __ STA ACCU + 3 
66c8 : b0 06 __ BCS $66d0 ; (freg + 68)
66ca : a5 1d __ LDA ACCU + 2 
66cc : 29 7f __ AND #$7f
66ce : 85 1d __ STA ACCU + 2 
66d0 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
66d1 : a5 06 __ LDA WORK + 3 
66d3 : 49 80 __ EOR #$80
66d5 : 85 06 __ STA WORK + 3 
66d7 : a9 ff __ LDA #$ff
66d9 : c5 07 __ CMP WORK + 4 
66db : f0 04 __ BEQ $66e1 ; (faddsub + 16)
66dd : c5 08 __ CMP WORK + 5 
66df : d0 11 __ BNE $66f2 ; (faddsub + 33)
66e1 : a5 1e __ LDA ACCU + 3 
66e3 : 09 7f __ ORA #$7f
66e5 : 85 1e __ STA ACCU + 3 
66e7 : a9 80 __ LDA #$80
66e9 : 85 1d __ STA ACCU + 2 
66eb : a9 00 __ LDA #$00
66ed : 85 1b __ STA ACCU + 0 
66ef : 85 1c __ STA ACCU + 1 
66f1 : 60 __ __ RTS
66f2 : 38 __ __ SEC
66f3 : a5 07 __ LDA WORK + 4 
66f5 : e5 08 __ SBC WORK + 5 
66f7 : f0 38 __ BEQ $6731 ; (faddsub + 96)
66f9 : aa __ __ TAX
66fa : b0 25 __ BCS $6721 ; (faddsub + 80)
66fc : e0 e9 __ CPX #$e9
66fe : b0 0e __ BCS $670e ; (faddsub + 61)
6700 : a5 08 __ LDA WORK + 5 
6702 : 85 07 __ STA WORK + 4 
6704 : a9 00 __ LDA #$00
6706 : 85 1b __ STA ACCU + 0 
6708 : 85 1c __ STA ACCU + 1 
670a : 85 1d __ STA ACCU + 2 
670c : f0 23 __ BEQ $6731 ; (faddsub + 96)
670e : a5 1d __ LDA ACCU + 2 
6710 : 4a __ __ LSR
6711 : 66 1c __ ROR ACCU + 1 
6713 : 66 1b __ ROR ACCU + 0 
6715 : e8 __ __ INX
6716 : d0 f8 __ BNE $6710 ; (faddsub + 63)
6718 : 85 1d __ STA ACCU + 2 
671a : a5 08 __ LDA WORK + 5 
671c : 85 07 __ STA WORK + 4 
671e : 4c 31 67 JMP $6731 ; (faddsub + 96)
6721 : e0 18 __ CPX #$18
6723 : b0 33 __ BCS $6758 ; (faddsub + 135)
6725 : a5 05 __ LDA WORK + 2 
6727 : 4a __ __ LSR
6728 : 66 04 __ ROR WORK + 1 
672a : 66 03 __ ROR WORK + 0 
672c : ca __ __ DEX
672d : d0 f8 __ BNE $6727 ; (faddsub + 86)
672f : 85 05 __ STA WORK + 2 
6731 : a5 1e __ LDA ACCU + 3 
6733 : 29 80 __ AND #$80
6735 : 85 1e __ STA ACCU + 3 
6737 : 45 06 __ EOR WORK + 3 
6739 : 30 31 __ BMI $676c ; (faddsub + 155)
673b : 18 __ __ CLC
673c : a5 1b __ LDA ACCU + 0 
673e : 65 03 __ ADC WORK + 0 
6740 : 85 1b __ STA ACCU + 0 
6742 : a5 1c __ LDA ACCU + 1 
6744 : 65 04 __ ADC WORK + 1 
6746 : 85 1c __ STA ACCU + 1 
6748 : a5 1d __ LDA ACCU + 2 
674a : 65 05 __ ADC WORK + 2 
674c : 85 1d __ STA ACCU + 2 
674e : 90 08 __ BCC $6758 ; (faddsub + 135)
6750 : 66 1d __ ROR ACCU + 2 
6752 : 66 1c __ ROR ACCU + 1 
6754 : 66 1b __ ROR ACCU + 0 
6756 : e6 07 __ INC WORK + 4 
6758 : a5 07 __ LDA WORK + 4 
675a : c9 ff __ CMP #$ff
675c : f0 83 __ BEQ $66e1 ; (faddsub + 16)
675e : 4a __ __ LSR
675f : 05 1e __ ORA ACCU + 3 
6761 : 85 1e __ STA ACCU + 3 
6763 : b0 06 __ BCS $676b ; (faddsub + 154)
6765 : a5 1d __ LDA ACCU + 2 
6767 : 29 7f __ AND #$7f
6769 : 85 1d __ STA ACCU + 2 
676b : 60 __ __ RTS
676c : 38 __ __ SEC
676d : a5 1b __ LDA ACCU + 0 
676f : e5 03 __ SBC WORK + 0 
6771 : 85 1b __ STA ACCU + 0 
6773 : a5 1c __ LDA ACCU + 1 
6775 : e5 04 __ SBC WORK + 1 
6777 : 85 1c __ STA ACCU + 1 
6779 : a5 1d __ LDA ACCU + 2 
677b : e5 05 __ SBC WORK + 2 
677d : 85 1d __ STA ACCU + 2 
677f : b0 19 __ BCS $679a ; (faddsub + 201)
6781 : 38 __ __ SEC
6782 : a9 00 __ LDA #$00
6784 : e5 1b __ SBC ACCU + 0 
6786 : 85 1b __ STA ACCU + 0 
6788 : a9 00 __ LDA #$00
678a : e5 1c __ SBC ACCU + 1 
678c : 85 1c __ STA ACCU + 1 
678e : a9 00 __ LDA #$00
6790 : e5 1d __ SBC ACCU + 2 
6792 : 85 1d __ STA ACCU + 2 
6794 : a5 1e __ LDA ACCU + 3 
6796 : 49 80 __ EOR #$80
6798 : 85 1e __ STA ACCU + 3 
679a : a5 1d __ LDA ACCU + 2 
679c : 30 ba __ BMI $6758 ; (faddsub + 135)
679e : 05 1c __ ORA ACCU + 1 
67a0 : 05 1b __ ORA ACCU + 0 
67a2 : f0 0f __ BEQ $67b3 ; (faddsub + 226)
67a4 : c6 07 __ DEC WORK + 4 
67a6 : f0 0b __ BEQ $67b3 ; (faddsub + 226)
67a8 : 06 1b __ ASL ACCU + 0 
67aa : 26 1c __ ROL ACCU + 1 
67ac : 26 1d __ ROL ACCU + 2 
67ae : 10 f4 __ BPL $67a4 ; (faddsub + 211)
67b0 : 4c 58 67 JMP $6758 ; (faddsub + 135)
67b3 : a9 00 __ LDA #$00
67b5 : 85 1b __ STA ACCU + 0 
67b7 : 85 1c __ STA ACCU + 1 
67b9 : 85 1d __ STA ACCU + 2 
67bb : 85 1e __ STA ACCU + 3 
67bd : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
67be : a5 1b __ LDA ACCU + 0 
67c0 : 05 1c __ ORA ACCU + 1 
67c2 : 05 1d __ ORA ACCU + 2 
67c4 : f0 0e __ BEQ $67d4 ; (crt_fmul + 22)
67c6 : a5 03 __ LDA WORK + 0 
67c8 : 05 04 __ ORA WORK + 1 
67ca : 05 05 __ ORA WORK + 2 
67cc : d0 09 __ BNE $67d7 ; (crt_fmul + 25)
67ce : 85 1b __ STA ACCU + 0 
67d0 : 85 1c __ STA ACCU + 1 
67d2 : 85 1d __ STA ACCU + 2 
67d4 : 85 1e __ STA ACCU + 3 
67d6 : 60 __ __ RTS
67d7 : a5 1e __ LDA ACCU + 3 
67d9 : 45 06 __ EOR WORK + 3 
67db : 29 80 __ AND #$80
67dd : 85 1e __ STA ACCU + 3 
67df : a9 ff __ LDA #$ff
67e1 : c5 07 __ CMP WORK + 4 
67e3 : f0 42 __ BEQ $6827 ; (crt_fmul + 105)
67e5 : c5 08 __ CMP WORK + 5 
67e7 : f0 3e __ BEQ $6827 ; (crt_fmul + 105)
67e9 : a9 00 __ LDA #$00
67eb : 85 09 __ STA WORK + 6 
67ed : 85 0a __ STA WORK + 7 
67ef : 85 0b __ STA WORK + 8 
67f1 : a4 1b __ LDY ACCU + 0 
67f3 : a5 03 __ LDA WORK + 0 
67f5 : d0 06 __ BNE $67fd ; (crt_fmul + 63)
67f7 : a5 04 __ LDA WORK + 1 
67f9 : f0 0a __ BEQ $6805 ; (crt_fmul + 71)
67fb : d0 05 __ BNE $6802 ; (crt_fmul + 68)
67fd : 20 58 68 JSR $6858 ; (crt_fmul8 + 0)
6800 : a5 04 __ LDA WORK + 1 
6802 : 20 58 68 JSR $6858 ; (crt_fmul8 + 0)
6805 : a5 05 __ LDA WORK + 2 
6807 : 20 58 68 JSR $6858 ; (crt_fmul8 + 0)
680a : 38 __ __ SEC
680b : a5 0b __ LDA WORK + 8 
680d : 30 06 __ BMI $6815 ; (crt_fmul + 87)
680f : 06 09 __ ASL WORK + 6 
6811 : 26 0a __ ROL WORK + 7 
6813 : 2a __ __ ROL
6814 : 18 __ __ CLC
6815 : 29 7f __ AND #$7f
6817 : 85 0b __ STA WORK + 8 
6819 : a5 07 __ LDA WORK + 4 
681b : 65 08 __ ADC WORK + 5 
681d : 90 19 __ BCC $6838 ; (crt_fmul + 122)
681f : e9 7f __ SBC #$7f
6821 : b0 04 __ BCS $6827 ; (crt_fmul + 105)
6823 : c9 ff __ CMP #$ff
6825 : d0 15 __ BNE $683c ; (crt_fmul + 126)
6827 : a5 1e __ LDA ACCU + 3 
6829 : 09 7f __ ORA #$7f
682b : 85 1e __ STA ACCU + 3 
682d : a9 80 __ LDA #$80
682f : 85 1d __ STA ACCU + 2 
6831 : a9 00 __ LDA #$00
6833 : 85 1b __ STA ACCU + 0 
6835 : 85 1c __ STA ACCU + 1 
6837 : 60 __ __ RTS
6838 : e9 7e __ SBC #$7e
683a : 90 15 __ BCC $6851 ; (crt_fmul + 147)
683c : 4a __ __ LSR
683d : 05 1e __ ORA ACCU + 3 
683f : 85 1e __ STA ACCU + 3 
6841 : a9 00 __ LDA #$00
6843 : 6a __ __ ROR
6844 : 05 0b __ ORA WORK + 8 
6846 : 85 1d __ STA ACCU + 2 
6848 : a5 0a __ LDA WORK + 7 
684a : 85 1c __ STA ACCU + 1 
684c : a5 09 __ LDA WORK + 6 
684e : 85 1b __ STA ACCU + 0 
6850 : 60 __ __ RTS
6851 : a9 00 __ LDA #$00
6853 : 85 1e __ STA ACCU + 3 
6855 : f0 d8 __ BEQ $682f ; (crt_fmul + 113)
6857 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
6858 : 38 __ __ SEC
6859 : 6a __ __ ROR
685a : 90 1e __ BCC $687a ; (crt_fmul8 + 34)
685c : aa __ __ TAX
685d : 18 __ __ CLC
685e : 98 __ __ TYA
685f : 65 09 __ ADC WORK + 6 
6861 : 85 09 __ STA WORK + 6 
6863 : a5 0a __ LDA WORK + 7 
6865 : 65 1c __ ADC ACCU + 1 
6867 : 85 0a __ STA WORK + 7 
6869 : a5 0b __ LDA WORK + 8 
686b : 65 1d __ ADC ACCU + 2 
686d : 6a __ __ ROR
686e : 85 0b __ STA WORK + 8 
6870 : 8a __ __ TXA
6871 : 66 0a __ ROR WORK + 7 
6873 : 66 09 __ ROR WORK + 6 
6875 : 4a __ __ LSR
6876 : f0 0d __ BEQ $6885 ; (crt_fmul8 + 45)
6878 : b0 e2 __ BCS $685c ; (crt_fmul8 + 4)
687a : 66 0b __ ROR WORK + 8 
687c : 66 0a __ ROR WORK + 7 
687e : 66 09 __ ROR WORK + 6 
6880 : 4a __ __ LSR
6881 : 90 f7 __ BCC $687a ; (crt_fmul8 + 34)
6883 : d0 d7 __ BNE $685c ; (crt_fmul8 + 4)
6885 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
6886 : a5 1b __ LDA ACCU + 0 
6888 : 05 1c __ ORA ACCU + 1 
688a : 05 1d __ ORA ACCU + 2 
688c : d0 03 __ BNE $6891 ; (crt_fdiv + 11)
688e : 85 1e __ STA ACCU + 3 
6890 : 60 __ __ RTS
6891 : a5 1e __ LDA ACCU + 3 
6893 : 45 06 __ EOR WORK + 3 
6895 : 29 80 __ AND #$80
6897 : 85 1e __ STA ACCU + 3 
6899 : a5 08 __ LDA WORK + 5 
689b : f0 62 __ BEQ $68ff ; (crt_fdiv + 121)
689d : a5 07 __ LDA WORK + 4 
689f : c9 ff __ CMP #$ff
68a1 : f0 5c __ BEQ $68ff ; (crt_fdiv + 121)
68a3 : a9 00 __ LDA #$00
68a5 : 85 09 __ STA WORK + 6 
68a7 : 85 0a __ STA WORK + 7 
68a9 : 85 0b __ STA WORK + 8 
68ab : a2 18 __ LDX #$18
68ad : a5 1b __ LDA ACCU + 0 
68af : c5 03 __ CMP WORK + 0 
68b1 : a5 1c __ LDA ACCU + 1 
68b3 : e5 04 __ SBC WORK + 1 
68b5 : a5 1d __ LDA ACCU + 2 
68b7 : e5 05 __ SBC WORK + 2 
68b9 : 90 13 __ BCC $68ce ; (crt_fdiv + 72)
68bb : a5 1b __ LDA ACCU + 0 
68bd : e5 03 __ SBC WORK + 0 
68bf : 85 1b __ STA ACCU + 0 
68c1 : a5 1c __ LDA ACCU + 1 
68c3 : e5 04 __ SBC WORK + 1 
68c5 : 85 1c __ STA ACCU + 1 
68c7 : a5 1d __ LDA ACCU + 2 
68c9 : e5 05 __ SBC WORK + 2 
68cb : 85 1d __ STA ACCU + 2 
68cd : 38 __ __ SEC
68ce : 26 09 __ ROL WORK + 6 
68d0 : 26 0a __ ROL WORK + 7 
68d2 : 26 0b __ ROL WORK + 8 
68d4 : ca __ __ DEX
68d5 : f0 0a __ BEQ $68e1 ; (crt_fdiv + 91)
68d7 : 06 1b __ ASL ACCU + 0 
68d9 : 26 1c __ ROL ACCU + 1 
68db : 26 1d __ ROL ACCU + 2 
68dd : b0 dc __ BCS $68bb ; (crt_fdiv + 53)
68df : 90 cc __ BCC $68ad ; (crt_fdiv + 39)
68e1 : 38 __ __ SEC
68e2 : a5 0b __ LDA WORK + 8 
68e4 : 30 06 __ BMI $68ec ; (crt_fdiv + 102)
68e6 : 06 09 __ ASL WORK + 6 
68e8 : 26 0a __ ROL WORK + 7 
68ea : 2a __ __ ROL
68eb : 18 __ __ CLC
68ec : 29 7f __ AND #$7f
68ee : 85 0b __ STA WORK + 8 
68f0 : a5 07 __ LDA WORK + 4 
68f2 : e5 08 __ SBC WORK + 5 
68f4 : 90 1a __ BCC $6910 ; (crt_fdiv + 138)
68f6 : 18 __ __ CLC
68f7 : 69 7f __ ADC #$7f
68f9 : b0 04 __ BCS $68ff ; (crt_fdiv + 121)
68fb : c9 ff __ CMP #$ff
68fd : d0 15 __ BNE $6914 ; (crt_fdiv + 142)
68ff : a5 1e __ LDA ACCU + 3 
6901 : 09 7f __ ORA #$7f
6903 : 85 1e __ STA ACCU + 3 
6905 : a9 80 __ LDA #$80
6907 : 85 1d __ STA ACCU + 2 
6909 : a9 00 __ LDA #$00
690b : 85 1c __ STA ACCU + 1 
690d : 85 1b __ STA ACCU + 0 
690f : 60 __ __ RTS
6910 : 69 7f __ ADC #$7f
6912 : 90 15 __ BCC $6929 ; (crt_fdiv + 163)
6914 : 4a __ __ LSR
6915 : 05 1e __ ORA ACCU + 3 
6917 : 85 1e __ STA ACCU + 3 
6919 : a9 00 __ LDA #$00
691b : 6a __ __ ROR
691c : 05 0b __ ORA WORK + 8 
691e : 85 1d __ STA ACCU + 2 
6920 : a5 0a __ LDA WORK + 7 
6922 : 85 1c __ STA ACCU + 1 
6924 : a5 09 __ LDA WORK + 6 
6926 : 85 1b __ STA ACCU + 0 
6928 : 60 __ __ RTS
6929 : a9 00 __ LDA #$00
692b : 85 1e __ STA ACCU + 3 
692d : 85 1d __ STA ACCU + 2 
692f : 85 1c __ STA ACCU + 1 
6931 : 85 1b __ STA ACCU + 0 
6933 : 60 __ __ RTS
--------------------------------------------------------------------
mul16@proxy: ; mul16@proxy
6934 : a5 17 __ LDA P10 
6936 : 85 03 __ STA WORK + 0 
6938 : a5 18 __ LDA P11 
693a : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
mul16: ; mul16
693c : a0 00 __ LDY #$00
693e : 84 06 __ STY WORK + 3 
6940 : a5 03 __ LDA WORK + 0 
6942 : a6 04 __ LDX WORK + 1 
6944 : f0 1c __ BEQ $6962 ; (mul16 + 38)
6946 : 38 __ __ SEC
6947 : 6a __ __ ROR
6948 : 90 0d __ BCC $6957 ; (mul16 + 27)
694a : aa __ __ TAX
694b : 18 __ __ CLC
694c : 98 __ __ TYA
694d : 65 1b __ ADC ACCU + 0 
694f : a8 __ __ TAY
6950 : a5 06 __ LDA WORK + 3 
6952 : 65 1c __ ADC ACCU + 1 
6954 : 85 06 __ STA WORK + 3 
6956 : 8a __ __ TXA
6957 : 06 1b __ ASL ACCU + 0 
6959 : 26 1c __ ROL ACCU + 1 
695b : 4a __ __ LSR
695c : 90 f9 __ BCC $6957 ; (mul16 + 27)
695e : d0 ea __ BNE $694a ; (mul16 + 14)
6960 : a5 04 __ LDA WORK + 1 
6962 : 4a __ __ LSR
6963 : 90 0d __ BCC $6972 ; (mul16 + 54)
6965 : aa __ __ TAX
6966 : 18 __ __ CLC
6967 : 98 __ __ TYA
6968 : 65 1b __ ADC ACCU + 0 
696a : a8 __ __ TAY
696b : a5 06 __ LDA WORK + 3 
696d : 65 1c __ ADC ACCU + 1 
696f : 85 06 __ STA WORK + 3 
6971 : 8a __ __ TXA
6972 : 06 1b __ ASL ACCU + 0 
6974 : 26 1c __ ROL ACCU + 1 
6976 : 4a __ __ LSR
6977 : b0 ec __ BCS $6965 ; (mul16 + 41)
6979 : d0 f7 __ BNE $6972 ; (mul16 + 54)
697b : 84 05 __ STY WORK + 2 
697d : 60 __ __ RTS
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
697e : ad a6 6e LDA $6ea6 ; (d + 0)
6981 : 85 03 __ STA WORK + 0 
6983 : ad a7 6e LDA $6ea7 ; (d + 1)
6986 : 85 04 __ STA WORK + 1 
6988 : a5 05 __ LDA WORK + 2 
698a : 85 1b __ STA ACCU + 0 
698c : a5 06 __ LDA WORK + 3 
698e : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
divs16: ; divs16
6990 : 24 1c __ BIT ACCU + 1 
6992 : 10 0d __ BPL $69a1 ; (divs16 + 17)
6994 : 20 ab 69 JSR $69ab ; (negaccu + 0)
6997 : 24 04 __ BIT WORK + 1 
6999 : 10 0d __ BPL $69a8 ; (divs16 + 24)
699b : 20 b9 69 JSR $69b9 ; (negtmp + 0)
699e : 4c cb 69 JMP $69cb ; (divmod + 0)
69a1 : 24 04 __ BIT WORK + 1 
69a3 : 10 f9 __ BPL $699e ; (divs16 + 14)
69a5 : 20 b9 69 JSR $69b9 ; (negtmp + 0)
69a8 : 20 cb 69 JSR $69cb ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
69ab : 38 __ __ SEC
69ac : a9 00 __ LDA #$00
69ae : e5 1b __ SBC ACCU + 0 
69b0 : 85 1b __ STA ACCU + 0 
69b2 : a9 00 __ LDA #$00
69b4 : e5 1c __ SBC ACCU + 1 
69b6 : 85 1c __ STA ACCU + 1 
69b8 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
69b9 : 38 __ __ SEC
69ba : a9 00 __ LDA #$00
69bc : e5 03 __ SBC WORK + 0 
69be : 85 03 __ STA WORK + 0 
69c0 : a9 00 __ LDA #$00
69c2 : e5 04 __ SBC WORK + 1 
69c4 : 85 04 __ STA WORK + 1 
69c6 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
69c7 : a9 48 __ LDA #$48
69c9 : 85 03 __ STA WORK + 0 
--------------------------------------------------------------------
divmod: ; divmod
69cb : a5 1c __ LDA ACCU + 1 
69cd : d0 31 __ BNE $6a00 ; (divmod + 53)
69cf : a5 04 __ LDA WORK + 1 
69d1 : d0 1e __ BNE $69f1 ; (divmod + 38)
69d3 : 85 06 __ STA WORK + 3 
69d5 : a2 04 __ LDX #$04
69d7 : 06 1b __ ASL ACCU + 0 
69d9 : 2a __ __ ROL
69da : c5 03 __ CMP WORK + 0 
69dc : 90 02 __ BCC $69e0 ; (divmod + 21)
69de : e5 03 __ SBC WORK + 0 
69e0 : 26 1b __ ROL ACCU + 0 
69e2 : 2a __ __ ROL
69e3 : c5 03 __ CMP WORK + 0 
69e5 : 90 02 __ BCC $69e9 ; (divmod + 30)
69e7 : e5 03 __ SBC WORK + 0 
69e9 : 26 1b __ ROL ACCU + 0 
69eb : ca __ __ DEX
69ec : d0 eb __ BNE $69d9 ; (divmod + 14)
69ee : 85 05 __ STA WORK + 2 
69f0 : 60 __ __ RTS
69f1 : a5 1b __ LDA ACCU + 0 
69f3 : 85 05 __ STA WORK + 2 
69f5 : a5 1c __ LDA ACCU + 1 
69f7 : 85 06 __ STA WORK + 3 
69f9 : a9 00 __ LDA #$00
69fb : 85 1b __ STA ACCU + 0 
69fd : 85 1c __ STA ACCU + 1 
69ff : 60 __ __ RTS
6a00 : a5 04 __ LDA WORK + 1 
6a02 : d0 1f __ BNE $6a23 ; (divmod + 88)
6a04 : a5 03 __ LDA WORK + 0 
6a06 : 30 1b __ BMI $6a23 ; (divmod + 88)
6a08 : a9 00 __ LDA #$00
6a0a : 85 06 __ STA WORK + 3 
6a0c : a2 10 __ LDX #$10
6a0e : 06 1b __ ASL ACCU + 0 
6a10 : 26 1c __ ROL ACCU + 1 
6a12 : 2a __ __ ROL
6a13 : c5 03 __ CMP WORK + 0 
6a15 : 90 02 __ BCC $6a19 ; (divmod + 78)
6a17 : e5 03 __ SBC WORK + 0 
6a19 : 26 1b __ ROL ACCU + 0 
6a1b : 26 1c __ ROL ACCU + 1 
6a1d : ca __ __ DEX
6a1e : d0 f2 __ BNE $6a12 ; (divmod + 71)
6a20 : 85 05 __ STA WORK + 2 
6a22 : 60 __ __ RTS
6a23 : a9 00 __ LDA #$00
6a25 : 85 05 __ STA WORK + 2 
6a27 : 85 06 __ STA WORK + 3 
6a29 : 84 02 __ STY $02 
6a2b : a0 10 __ LDY #$10
6a2d : 18 __ __ CLC
6a2e : 26 1b __ ROL ACCU + 0 
6a30 : 26 1c __ ROL ACCU + 1 
6a32 : 26 05 __ ROL WORK + 2 
6a34 : 26 06 __ ROL WORK + 3 
6a36 : 38 __ __ SEC
6a37 : a5 05 __ LDA WORK + 2 
6a39 : e5 03 __ SBC WORK + 0 
6a3b : aa __ __ TAX
6a3c : a5 06 __ LDA WORK + 3 
6a3e : e5 04 __ SBC WORK + 1 
6a40 : 90 04 __ BCC $6a46 ; (divmod + 123)
6a42 : 86 05 __ STX WORK + 2 
6a44 : 85 06 __ STA WORK + 3 
6a46 : 88 __ __ DEY
6a47 : d0 e5 __ BNE $6a2e ; (divmod + 99)
6a49 : 26 1b __ ROL ACCU + 0 
6a4b : 26 1c __ ROL ACCU + 1 
6a4d : a4 02 __ LDY $02 
6a4f : 60 __ __ RTS
--------------------------------------------------------------------
mods16@proxy: ; mods16@proxy
6a50 : a9 68 __ LDA #$68
6a52 : 85 03 __ STA WORK + 0 
6a54 : a9 01 __ LDA #$01
6a56 : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
mods16: ; mods16
6a58 : 24 1c __ BIT ACCU + 1 
6a5a : 10 10 __ BPL $6a6c ; (mods16 + 20)
6a5c : 20 ab 69 JSR $69ab ; (negaccu + 0)
6a5f : 24 04 __ BIT WORK + 1 
6a61 : 10 03 __ BPL $6a66 ; (mods16 + 14)
6a63 : 20 b9 69 JSR $69b9 ; (negtmp + 0)
6a66 : 20 cb 69 JSR $69cb ; (divmod + 0)
6a69 : 4c a1 6a JMP $6aa1 ; (negtmpb + 0)
6a6c : 24 04 __ BIT WORK + 1 
6a6e : 10 03 __ BPL $6a73 ; (mods16 + 27)
6a70 : 20 b9 69 JSR $69b9 ; (negtmp + 0)
6a73 : 4c cb 69 JMP $69cb ; (divmod + 0)
6a76 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
6aa1 : 38 __ __ SEC
6aa2 : a9 00 __ LDA #$00
6aa4 : e5 05 __ SBC WORK + 2 
6aa6 : 85 05 __ STA WORK + 2 
6aa8 : a9 00 __ LDA #$00
6aaa : e5 06 __ SBC WORK + 3 
6aac : 85 06 __ STA WORK + 3 
6aae : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
6aaf : 20 b0 66 JSR $66b0 ; (freg + 36)
6ab2 : a5 07 __ LDA WORK + 4 
6ab4 : c9 7f __ CMP #$7f
6ab6 : b0 07 __ BCS $6abf ; (f32_to_i16 + 16)
6ab8 : a9 00 __ LDA #$00
6aba : 85 1b __ STA ACCU + 0 
6abc : 85 1c __ STA ACCU + 1 
6abe : 60 __ __ RTS
6abf : e9 8e __ SBC #$8e
6ac1 : 90 16 __ BCC $6ad9 ; (f32_to_i16 + 42)
6ac3 : 24 1e __ BIT ACCU + 3 
6ac5 : 30 09 __ BMI $6ad0 ; (f32_to_i16 + 33)
6ac7 : a9 ff __ LDA #$ff
6ac9 : 85 1b __ STA ACCU + 0 
6acb : a9 7f __ LDA #$7f
6acd : 85 1c __ STA ACCU + 1 
6acf : 60 __ __ RTS
6ad0 : a9 00 __ LDA #$00
6ad2 : 85 1b __ STA ACCU + 0 
6ad4 : a9 80 __ LDA #$80
6ad6 : 85 1c __ STA ACCU + 1 
6ad8 : 60 __ __ RTS
6ad9 : aa __ __ TAX
6ada : a5 1c __ LDA ACCU + 1 
6adc : 46 1d __ LSR ACCU + 2 
6ade : 6a __ __ ROR
6adf : e8 __ __ INX
6ae0 : d0 fa __ BNE $6adc ; (f32_to_i16 + 45)
6ae2 : 24 1e __ BIT ACCU + 3 
6ae4 : 10 0e __ BPL $6af4 ; (f32_to_i16 + 69)
6ae6 : 38 __ __ SEC
6ae7 : 49 ff __ EOR #$ff
6ae9 : 69 00 __ ADC #$00
6aeb : 85 1b __ STA ACCU + 0 
6aed : a9 00 __ LDA #$00
6aef : e5 1d __ SBC ACCU + 2 
6af1 : 85 1c __ STA ACCU + 1 
6af3 : 60 __ __ RTS
6af4 : 85 1b __ STA ACCU + 0 
6af6 : a5 1d __ LDA ACCU + 2 
6af8 : 85 1c __ STA ACCU + 1 
6afa : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
6afb : 24 1c __ BIT ACCU + 1 
6afd : 30 03 __ BMI $6b02 ; (sint16_to_float + 7)
6aff : 4c 19 6b JMP $6b19 ; (uint16_to_float + 0)
6b02 : 38 __ __ SEC
6b03 : a9 00 __ LDA #$00
6b05 : e5 1b __ SBC ACCU + 0 
6b07 : 85 1b __ STA ACCU + 0 
6b09 : a9 00 __ LDA #$00
6b0b : e5 1c __ SBC ACCU + 1 
6b0d : 85 1c __ STA ACCU + 1 
6b0f : 20 19 6b JSR $6b19 ; (uint16_to_float + 0)
6b12 : a5 1e __ LDA ACCU + 3 
6b14 : 09 80 __ ORA #$80
6b16 : 85 1e __ STA ACCU + 3 
6b18 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
6b19 : a5 1b __ LDA ACCU + 0 
6b1b : 05 1c __ ORA ACCU + 1 
6b1d : d0 05 __ BNE $6b24 ; (uint16_to_float + 11)
6b1f : 85 1d __ STA ACCU + 2 
6b21 : 85 1e __ STA ACCU + 3 
6b23 : 60 __ __ RTS
6b24 : a2 8e __ LDX #$8e
6b26 : a5 1c __ LDA ACCU + 1 
6b28 : 30 06 __ BMI $6b30 ; (uint16_to_float + 23)
6b2a : ca __ __ DEX
6b2b : 06 1b __ ASL ACCU + 0 
6b2d : 2a __ __ ROL
6b2e : 10 fa __ BPL $6b2a ; (uint16_to_float + 17)
6b30 : 0a __ __ ASL
6b31 : 85 1d __ STA ACCU + 2 
6b33 : a5 1b __ LDA ACCU + 0 
6b35 : 85 1c __ STA ACCU + 1 
6b37 : 8a __ __ TXA
6b38 : 4a __ __ LSR
6b39 : 85 1e __ STA ACCU + 3 
6b3b : a9 00 __ LDA #$00
6b3d : 85 1b __ STA ACCU + 0 
6b3f : 66 1d __ ROR ACCU + 2 
6b41 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
6b42 : a5 04 __ LDA WORK + 1 
6b44 : 05 05 __ ORA WORK + 2 
6b46 : 05 06 __ ORA WORK + 3 
6b48 : d0 05 __ BNE $6b4f ; (mul32 + 13)
6b4a : a5 03 __ LDA WORK + 0 
6b4c : 4c 56 66 JMP $6656 ; (mul32by8 + 0)
6b4f : a0 00 __ LDY #$00
6b51 : 84 07 __ STY WORK + 4 
6b53 : 84 08 __ STY WORK + 5 
6b55 : 98 __ __ TYA
6b56 : 38 __ __ SEC
6b57 : 66 03 __ ROR WORK + 0 
6b59 : 90 15 __ BCC $6b70 ; (mul32 + 46)
6b5b : aa __ __ TAX
6b5c : 18 __ __ CLC
6b5d : a5 07 __ LDA WORK + 4 
6b5f : 65 1b __ ADC ACCU + 0 
6b61 : 85 07 __ STA WORK + 4 
6b63 : a5 08 __ LDA WORK + 5 
6b65 : 65 1c __ ADC ACCU + 1 
6b67 : 85 08 __ STA WORK + 5 
6b69 : 98 __ __ TYA
6b6a : 65 1d __ ADC ACCU + 2 
6b6c : a8 __ __ TAY
6b6d : 8a __ __ TXA
6b6e : 65 1e __ ADC ACCU + 3 
6b70 : 46 04 __ LSR WORK + 1 
6b72 : 90 0f __ BCC $6b83 ; (mul32 + 65)
6b74 : aa __ __ TAX
6b75 : 18 __ __ CLC
6b76 : a5 08 __ LDA WORK + 5 
6b78 : 65 1b __ ADC ACCU + 0 
6b7a : 85 08 __ STA WORK + 5 
6b7c : 98 __ __ TYA
6b7d : 65 1c __ ADC ACCU + 1 
6b7f : a8 __ __ TAY
6b80 : 8a __ __ TXA
6b81 : 65 1d __ ADC ACCU + 2 
6b83 : 46 05 __ LSR WORK + 2 
6b85 : 90 09 __ BCC $6b90 ; (mul32 + 78)
6b87 : aa __ __ TAX
6b88 : 18 __ __ CLC
6b89 : 98 __ __ TYA
6b8a : 65 1b __ ADC ACCU + 0 
6b8c : a8 __ __ TAY
6b8d : 8a __ __ TXA
6b8e : 65 1c __ ADC ACCU + 1 
6b90 : 46 06 __ LSR WORK + 3 
6b92 : 90 03 __ BCC $6b97 ; (mul32 + 85)
6b94 : 18 __ __ CLC
6b95 : 65 1b __ ADC ACCU + 0 
6b97 : 06 1b __ ASL ACCU + 0 
6b99 : 26 1c __ ROL ACCU + 1 
6b9b : 26 1d __ ROL ACCU + 2 
6b9d : 26 1e __ ROL ACCU + 3 
6b9f : 46 03 __ LSR WORK + 0 
6ba1 : 90 cd __ BCC $6b70 ; (mul32 + 46)
6ba3 : d0 b6 __ BNE $6b5b ; (mul32 + 25)
6ba5 : 84 09 __ STY WORK + 6 
6ba7 : 85 0a __ STA WORK + 7 
6ba9 : 60 __ __ RTS
--------------------------------------------------------------------
divs32@proxy: ; divs32@proxy
6baa : a9 50 __ LDA #$50
6bac : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
divs32: ; divs32
6bae : 24 1e __ BIT ACCU + 3 
6bb0 : 10 0d __ BPL $6bbf ; (divs32 + 17)
6bb2 : 20 c9 6b JSR $6bc9 ; (negaccu32 + 0)
6bb5 : 24 06 __ BIT WORK + 3 
6bb7 : 10 0d __ BPL $6bc6 ; (divs32 + 24)
6bb9 : 20 e3 6b JSR $6be3 ; (negtmp32 + 0)
6bbc : 4c 1b 6c JMP $6c1b ; (divmod32 + 0)
6bbf : 24 06 __ BIT WORK + 3 
6bc1 : 10 f9 __ BPL $6bbc ; (divs32 + 14)
6bc3 : 20 e3 6b JSR $6be3 ; (negtmp32 + 0)
6bc6 : 20 1b 6c JSR $6c1b ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
6bc9 : 38 __ __ SEC
6bca : a9 00 __ LDA #$00
6bcc : e5 1b __ SBC ACCU + 0 
6bce : 85 1b __ STA ACCU + 0 
6bd0 : a9 00 __ LDA #$00
6bd2 : e5 1c __ SBC ACCU + 1 
6bd4 : 85 1c __ STA ACCU + 1 
6bd6 : a9 00 __ LDA #$00
6bd8 : e5 1d __ SBC ACCU + 2 
6bda : 85 1d __ STA ACCU + 2 
6bdc : a9 00 __ LDA #$00
6bde : e5 1e __ SBC ACCU + 3 
6be0 : 85 1e __ STA ACCU + 3 
6be2 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
6be3 : 38 __ __ SEC
6be4 : a9 00 __ LDA #$00
6be6 : e5 03 __ SBC WORK + 0 
6be8 : 85 03 __ STA WORK + 0 
6bea : a9 00 __ LDA #$00
6bec : e5 04 __ SBC WORK + 1 
6bee : 85 04 __ STA WORK + 1 
6bf0 : a9 00 __ LDA #$00
6bf2 : e5 05 __ SBC WORK + 2 
6bf4 : 85 05 __ STA WORK + 2 
6bf6 : a9 00 __ LDA #$00
6bf8 : e5 06 __ SBC WORK + 3 
6bfa : 85 06 __ STA WORK + 3 
6bfc : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
6c1b : 84 02 __ STY $02 
6c1d : a0 20 __ LDY #$20
6c1f : a9 00 __ LDA #$00
6c21 : 85 07 __ STA WORK + 4 
6c23 : 85 08 __ STA WORK + 5 
6c25 : 85 09 __ STA WORK + 6 
6c27 : 85 0a __ STA WORK + 7 
6c29 : a5 05 __ LDA WORK + 2 
6c2b : 05 06 __ ORA WORK + 3 
6c2d : d0 78 __ BNE $6ca7 ; (divmod32 + 140)
6c2f : a5 04 __ LDA WORK + 1 
6c31 : d0 27 __ BNE $6c5a ; (divmod32 + 63)
6c33 : 18 __ __ CLC
6c34 : 26 1b __ ROL ACCU + 0 
6c36 : 26 1c __ ROL ACCU + 1 
6c38 : 26 1d __ ROL ACCU + 2 
6c3a : 26 1e __ ROL ACCU + 3 
6c3c : 2a __ __ ROL
6c3d : 90 05 __ BCC $6c44 ; (divmod32 + 41)
6c3f : e5 03 __ SBC WORK + 0 
6c41 : 38 __ __ SEC
6c42 : b0 06 __ BCS $6c4a ; (divmod32 + 47)
6c44 : c5 03 __ CMP WORK + 0 
6c46 : 90 02 __ BCC $6c4a ; (divmod32 + 47)
6c48 : e5 03 __ SBC WORK + 0 
6c4a : 88 __ __ DEY
6c4b : d0 e7 __ BNE $6c34 ; (divmod32 + 25)
6c4d : 85 07 __ STA WORK + 4 
6c4f : 26 1b __ ROL ACCU + 0 
6c51 : 26 1c __ ROL ACCU + 1 
6c53 : 26 1d __ ROL ACCU + 2 
6c55 : 26 1e __ ROL ACCU + 3 
6c57 : a4 02 __ LDY $02 
6c59 : 60 __ __ RTS
6c5a : a5 1e __ LDA ACCU + 3 
6c5c : d0 10 __ BNE $6c6e ; (divmod32 + 83)
6c5e : a6 1d __ LDX ACCU + 2 
6c60 : 86 1e __ STX ACCU + 3 
6c62 : a6 1c __ LDX ACCU + 1 
6c64 : 86 1d __ STX ACCU + 2 
6c66 : a6 1b __ LDX ACCU + 0 
6c68 : 86 1c __ STX ACCU + 1 
6c6a : 85 1b __ STA ACCU + 0 
6c6c : a0 18 __ LDY #$18
6c6e : 18 __ __ CLC
6c6f : 26 1b __ ROL ACCU + 0 
6c71 : 26 1c __ ROL ACCU + 1 
6c73 : 26 1d __ ROL ACCU + 2 
6c75 : 26 1e __ ROL ACCU + 3 
6c77 : 26 07 __ ROL WORK + 4 
6c79 : 26 08 __ ROL WORK + 5 
6c7b : 90 0c __ BCC $6c89 ; (divmod32 + 110)
6c7d : a5 07 __ LDA WORK + 4 
6c7f : e5 03 __ SBC WORK + 0 
6c81 : aa __ __ TAX
6c82 : a5 08 __ LDA WORK + 5 
6c84 : e5 04 __ SBC WORK + 1 
6c86 : 38 __ __ SEC
6c87 : b0 0c __ BCS $6c95 ; (divmod32 + 122)
6c89 : 38 __ __ SEC
6c8a : a5 07 __ LDA WORK + 4 
6c8c : e5 03 __ SBC WORK + 0 
6c8e : aa __ __ TAX
6c8f : a5 08 __ LDA WORK + 5 
6c91 : e5 04 __ SBC WORK + 1 
6c93 : 90 04 __ BCC $6c99 ; (divmod32 + 126)
6c95 : 86 07 __ STX WORK + 4 
6c97 : 85 08 __ STA WORK + 5 
6c99 : 88 __ __ DEY
6c9a : d0 d3 __ BNE $6c6f ; (divmod32 + 84)
6c9c : 26 1b __ ROL ACCU + 0 
6c9e : 26 1c __ ROL ACCU + 1 
6ca0 : 26 1d __ ROL ACCU + 2 
6ca2 : 26 1e __ ROL ACCU + 3 
6ca4 : a4 02 __ LDY $02 
6ca6 : 60 __ __ RTS
6ca7 : a0 10 __ LDY #$10
6ca9 : a5 1e __ LDA ACCU + 3 
6cab : 85 08 __ STA WORK + 5 
6cad : a5 1d __ LDA ACCU + 2 
6caf : 85 07 __ STA WORK + 4 
6cb1 : a9 00 __ LDA #$00
6cb3 : 85 1d __ STA ACCU + 2 
6cb5 : 85 1e __ STA ACCU + 3 
6cb7 : 18 __ __ CLC
6cb8 : 26 1b __ ROL ACCU + 0 
6cba : 26 1c __ ROL ACCU + 1 
6cbc : 26 07 __ ROL WORK + 4 
6cbe : 26 08 __ ROL WORK + 5 
6cc0 : 26 09 __ ROL WORK + 6 
6cc2 : 26 0a __ ROL WORK + 7 
6cc4 : a5 07 __ LDA WORK + 4 
6cc6 : c5 03 __ CMP WORK + 0 
6cc8 : a5 08 __ LDA WORK + 5 
6cca : e5 04 __ SBC WORK + 1 
6ccc : a5 09 __ LDA WORK + 6 
6cce : e5 05 __ SBC WORK + 2 
6cd0 : aa __ __ TAX
6cd1 : a5 0a __ LDA WORK + 7 
6cd3 : e5 06 __ SBC WORK + 3 
6cd5 : 90 11 __ BCC $6ce8 ; (divmod32 + 205)
6cd7 : 86 09 __ STX WORK + 6 
6cd9 : 85 0a __ STA WORK + 7 
6cdb : a5 07 __ LDA WORK + 4 
6cdd : e5 03 __ SBC WORK + 0 
6cdf : 85 07 __ STA WORK + 4 
6ce1 : a5 08 __ LDA WORK + 5 
6ce3 : e5 04 __ SBC WORK + 1 
6ce5 : 85 08 __ STA WORK + 5 
6ce7 : 38 __ __ SEC
6ce8 : 88 __ __ DEY
6ce9 : d0 cd __ BNE $6cb8 ; (divmod32 + 157)
6ceb : 26 1b __ ROL ACCU + 0 
6ced : 26 1c __ ROL ACCU + 1 
6cef : a4 02 __ LDY $02 
6cf1 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc@proxy: ; crt_malloc@proxy
6cf2 : a5 43 __ LDA $43 
6cf4 : 85 1b __ STA ACCU + 0 
6cf6 : a5 44 __ LDA $44 
6cf8 : 85 1c __ STA ACCU + 1 
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
6cfa : 18 __ __ CLC
6cfb : a5 1b __ LDA ACCU + 0 
6cfd : 69 05 __ ADC #$05
6cff : 29 fc __ AND #$fc
6d01 : 85 03 __ STA WORK + 0 
6d03 : a5 1c __ LDA ACCU + 1 
6d05 : 69 00 __ ADC #$00
6d07 : 85 04 __ STA WORK + 1 
6d09 : ad de 83 LDA $83de ; (HeapNode.end + 0)
6d0c : d0 26 __ BNE $6d34 ; (crt_malloc + 58)
6d0e : a9 00 __ LDA #$00
6d10 : 8d e2 83 STA $83e2 
6d13 : 8d e3 83 STA $83e3 
6d16 : ee de 83 INC $83de ; (HeapNode.end + 0)
6d19 : a9 e0 __ LDA #$e0
6d1b : 09 02 __ ORA #$02
6d1d : 8d dc 83 STA $83dc ; (HeapNode.next + 0)
6d20 : a9 83 __ LDA #$83
6d22 : 8d dd 83 STA $83dd ; (HeapNode.next + 1)
6d25 : 38 __ __ SEC
6d26 : a9 00 __ LDA #$00
6d28 : e9 02 __ SBC #$02
6d2a : 8d e4 83 STA $83e4 
6d2d : a9 ed __ LDA #$ed
6d2f : e9 00 __ SBC #$00
6d31 : 8d e5 83 STA $83e5 
6d34 : a9 dc __ LDA #$dc
6d36 : a2 83 __ LDX #$83
6d38 : 85 1d __ STA ACCU + 2 
6d3a : 86 1e __ STX ACCU + 3 
6d3c : 18 __ __ CLC
6d3d : a0 00 __ LDY #$00
6d3f : b1 1d __ LDA (ACCU + 2),y 
6d41 : 85 1b __ STA ACCU + 0 
6d43 : 65 03 __ ADC WORK + 0 
6d45 : 85 05 __ STA WORK + 2 
6d47 : c8 __ __ INY
6d48 : b1 1d __ LDA (ACCU + 2),y 
6d4a : 85 1c __ STA ACCU + 1 
6d4c : f0 20 __ BEQ $6d6e ; (crt_malloc + 116)
6d4e : 65 04 __ ADC WORK + 1 
6d50 : 85 06 __ STA WORK + 3 
6d52 : b0 14 __ BCS $6d68 ; (crt_malloc + 110)
6d54 : a0 02 __ LDY #$02
6d56 : b1 1b __ LDA (ACCU + 0),y 
6d58 : c5 05 __ CMP WORK + 2 
6d5a : c8 __ __ INY
6d5b : b1 1b __ LDA (ACCU + 0),y 
6d5d : e5 06 __ SBC WORK + 3 
6d5f : b0 0e __ BCS $6d6f ; (crt_malloc + 117)
6d61 : a5 1b __ LDA ACCU + 0 
6d63 : a6 1c __ LDX ACCU + 1 
6d65 : 4c 38 6d JMP $6d38 ; (crt_malloc + 62)
6d68 : a9 00 __ LDA #$00
6d6a : 85 1b __ STA ACCU + 0 
6d6c : 85 1c __ STA ACCU + 1 
6d6e : 60 __ __ RTS
6d6f : a5 05 __ LDA WORK + 2 
6d71 : 85 07 __ STA WORK + 4 
6d73 : a5 06 __ LDA WORK + 3 
6d75 : 85 08 __ STA WORK + 5 
6d77 : a0 02 __ LDY #$02
6d79 : a5 07 __ LDA WORK + 4 
6d7b : d1 1b __ CMP (ACCU + 0),y 
6d7d : d0 15 __ BNE $6d94 ; (crt_malloc + 154)
6d7f : c8 __ __ INY
6d80 : a5 08 __ LDA WORK + 5 
6d82 : d1 1b __ CMP (ACCU + 0),y 
6d84 : d0 0e __ BNE $6d94 ; (crt_malloc + 154)
6d86 : a0 00 __ LDY #$00
6d88 : b1 1b __ LDA (ACCU + 0),y 
6d8a : 91 1d __ STA (ACCU + 2),y 
6d8c : c8 __ __ INY
6d8d : b1 1b __ LDA (ACCU + 0),y 
6d8f : 91 1d __ STA (ACCU + 2),y 
6d91 : 4c b1 6d JMP $6db1 ; (crt_malloc + 183)
6d94 : a0 00 __ LDY #$00
6d96 : b1 1b __ LDA (ACCU + 0),y 
6d98 : 91 07 __ STA (WORK + 4),y 
6d9a : a5 07 __ LDA WORK + 4 
6d9c : 91 1d __ STA (ACCU + 2),y 
6d9e : c8 __ __ INY
6d9f : b1 1b __ LDA (ACCU + 0),y 
6da1 : 91 07 __ STA (WORK + 4),y 
6da3 : a5 08 __ LDA WORK + 5 
6da5 : 91 1d __ STA (ACCU + 2),y 
6da7 : c8 __ __ INY
6da8 : b1 1b __ LDA (ACCU + 0),y 
6daa : 91 07 __ STA (WORK + 4),y 
6dac : c8 __ __ INY
6dad : b1 1b __ LDA (ACCU + 0),y 
6daf : 91 07 __ STA (WORK + 4),y 
6db1 : a0 00 __ LDY #$00
6db3 : a5 05 __ LDA WORK + 2 
6db5 : 91 1b __ STA (ACCU + 0),y 
6db7 : c8 __ __ INY
6db8 : a5 06 __ LDA WORK + 3 
6dba : 91 1b __ STA (ACCU + 0),y 
6dbc : 18 __ __ CLC
6dbd : a5 1b __ LDA ACCU + 0 
6dbf : 69 02 __ ADC #$02
6dc1 : 85 1b __ STA ACCU + 0 
6dc3 : 90 02 __ BCC $6dc7 ; (crt_malloc + 205)
6dc5 : e6 1c __ INC ACCU + 1 
6dc7 : 60 __ __ RTS
--------------------------------------------------------------------
mul16@proxy: ; mul16@proxy
6dc8 : a5 59 __ LDA $59 
6dca : 85 03 __ STA WORK + 0 
6dcc : a5 5a __ LDA $5a 
6dce : 85 04 __ STA WORK + 1 
6dd0 : 4c 3c 69 JMP $693c ; (mul16 + 0)
--------------------------------------------------------------------
mul16@proxy: ; mul16@proxy
6dd3 : a5 4f __ LDA $4f 
6dd5 : 85 03 __ STA WORK + 0 
6dd7 : a5 50 __ LDA $50 
6dd9 : 85 04 __ STA WORK + 1 
6ddb : 4c 3c 69 JMP $693c ; (mul16 + 0)
--------------------------------------------------------------------
divs16@proxy: ; divs16@proxy
6dde : a9 05 __ LDA #$05
6de0 : 85 03 __ STA WORK + 0 
6de2 : a9 00 __ LDA #$00
6de4 : 85 04 __ STA WORK + 1 
6de6 : a5 05 __ LDA WORK + 2 
6de8 : 85 1b __ STA ACCU + 0 
6dea : a5 06 __ LDA WORK + 3 
6dec : 85 1c __ STA ACCU + 1 
6dee : 4c 90 69 JMP $6990 ; (divs16 + 0)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
6df1 : a9 20 __ LDA #$20
6df3 : 85 05 __ STA WORK + 2 
6df5 : a9 41 __ LDA #$41
6df7 : 85 06 __ STA WORK + 3 
6df9 : 4c a0 66 JMP $66a0 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
6dfc : a5 43 __ LDA $43 
6dfe : 85 1b __ STA ACCU + 0 
6e00 : a5 44 __ LDA $44 
6e02 : 85 1c __ STA ACCU + 1 
6e04 : a5 45 __ LDA $45 
6e06 : 85 1d __ STA ACCU + 2 
6e08 : a5 46 __ LDA $46 
6e0a : 85 1e __ STA ACCU + 3 
6e0c : 4c 90 66 JMP $6690 ; (freg + 4)
--------------------------------------------------------------------
spentry:
6e0f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
bitmap:
6e10 : __ __ __ BYT 00 20                                           : . 
--------------------------------------------------------------------
fround5:
6e12 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
6e22 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
bit_tab:
6e2e : __ __ __ BYT 80 40 20 10 08 04 02 01                         : .@ .....
--------------------------------------------------------------------
drawing_mode:
6e36 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
plane_data:
6e38 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
plane_data_count:
6e3a : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sin_tab:
6e3c : __ __ __ BYT 00 06 0b 10 16 1b 20 25 29 2d 31 34 37 3a 3c 3e : ...... %)-147:<>
6e4c : __ __ __ BYT 3f 40 40 40 3f 3e 3c 3a 37 34 31 2d 29 25 20 1b : ?@@@?><:741-)% .
6e5c : __ __ __ BYT 16 10 0b 06 00 fa f5 f0 ea e5 e0 db d7 d3 cf cc : ................
6e6c : __ __ __ BYT c9 c6 c4 c2 c1 c0 c0 c0 c1 c2 c4 c6 c9 cc cf d3 : ................
6e7c : __ __ __ BYT d7 db e0 e5 ea f0 f5 fa                         : ........
--------------------------------------------------------------------
wireframeOn:
6e84 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PaintersOn:
6e86 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
backcolor:
6e88 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
linecolor:
6e8a : __ __ __ BYT 01 00                                           : ..
--------------------------------------------------------------------
files:
6e8c : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
6e94 : __ __ __ BSS	16
--------------------------------------------------------------------
c:
6ea4 : __ __ __ BSS	2
--------------------------------------------------------------------
d:
6ea6 : __ __ __ BSS	2
--------------------------------------------------------------------
h:
6ea8 : __ __ __ BSS	2
--------------------------------------------------------------------
u:
6eaa : __ __ __ BSS	2
--------------------------------------------------------------------
x_pct:
6eac : __ __ __ BSS	2
--------------------------------------------------------------------
y_pct:
6eae : __ __ __ BSS	2
--------------------------------------------------------------------
z_pct:
6eb0 : __ __ __ BSS	2
--------------------------------------------------------------------
z_rotated:
6eb2 : __ __ __ BSS	2
--------------------------------------------------------------------
vx_pct:
6eb4 : __ __ __ BSS	2
--------------------------------------------------------------------
vy_pct:
6eb6 : __ __ __ BSS	2
--------------------------------------------------------------------
u_array:
6eb8 : __ __ __ BSS	2
--------------------------------------------------------------------
a:
6eba : __ __ __ BSS	2
--------------------------------------------------------------------
bucket_head:
6ebc : __ __ __ BSS	512
--------------------------------------------------------------------
face_offset:
70bc : __ __ __ BSS	2048
--------------------------------------------------------------------
face_next:
78bc : __ __ __ BSS	2048
--------------------------------------------------------------------
min_x:
80bc : __ __ __ BSS	400
--------------------------------------------------------------------
max_x:
824c : __ __ __ BSS	400
--------------------------------------------------------------------
HeapNode:
83dc : __ __ __ BSS	4
