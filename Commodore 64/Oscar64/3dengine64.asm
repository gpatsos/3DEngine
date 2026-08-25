; Compiled with 1.32.273.0
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 4b 4d STX $4d4b ; (spentry + 0)
0811 : a2 4d __ LDX #$4d
0813 : a0 ff __ LDY #$ff
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 65 __ CPX #$65
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 00 __ CPY #$00
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 27 __ LDA #$27
083d : 85 23 __ STA SP + 0 
083f : a9 cf __ LDA #$cf
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 561, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
0880 : a2 0d __ LDX #$0d
0882 : b5 53 __ LDA T1 + 0,x 
0884 : 9d 29 cf STA $cf29,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 32 0f JSR $0f32 ; (load_vertex_data.s1 + 0)
088d : ad 1c 4e LDA $4e1c ; (h + 0)
0890 : 85 14 __ STA P7 
0892 : ad 1d 4e LDA $4e1d ; (h + 1)
0895 : 85 15 __ STA P8 
0897 : 20 3d 22 JSR $223d ; (load_plane_data.s1 + 0)
089a : 20 12 24 JSR $2412 ; (init_hires.s4 + 0)
089d : 20 6e 25 JSR $256e ; (ultra_fast_clear.s4 + 0)
08a0 : a9 00 __ LDA #$00
08a2 : 8d ef cf STA $cfef ; (sstack + 28)
08a5 : 8d f0 cf STA $cff0 ; (sstack + 29)
08a8 : 8d f1 cf STA $cff1 ; (sstack + 30)
08ab : 8d f2 cf STA $cff2 ; (sstack + 31)
08ae : 8d f3 cf STA $cff3 ; (sstack + 32)
08b1 : 8d f4 cf STA $cff4 ; (sstack + 33)
08b4 : 8d f6 cf STA $cff6 ; (sstack + 35)
08b7 : 8d f8 cf STA $cff8 ; (sstack + 37)
08ba : 8d fa cf STA $cffa ; (sstack + 39)
08bd : a9 a0 __ LDA #$a0
08bf : 85 5b __ STA T5 + 0 
08c1 : 8d f5 cf STA $cff5 ; (sstack + 34)
08c4 : a9 64 __ LDA #$64
08c6 : 85 5d __ STA T6 + 0 
08c8 : 8d f7 cf STA $cff7 ; (sstack + 36)
08cb : a9 0c __ LDA #$0c
08cd : 85 59 __ STA T4 + 0 
08cf : 8d f9 cf STA $cff9 ; (sstack + 38)
08d2 : a9 90 __ LDA #$90
08d4 : 8d fb cf STA $cffb ; (sstack + 40)
08d7 : a9 01 __ LDA #$01
08d9 : 8d fc cf STA $cffc ; (sstack + 41)
08dc : ad 18 4e LDA $4e18 ; (c + 0)
08df : 8d fd cf STA $cffd ; (sstack + 42)
08e2 : ad 19 4e LDA $4e19 ; (c + 1)
08e5 : 8d fe cf STA $cffe ; (sstack + 43)
08e8 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
08eb : a9 00 __ LDA #$00
08ed : 85 53 __ STA T1 + 0 
08ef : 85 54 __ STA T1 + 1 
08f1 : 85 55 __ STA T2 + 0 
08f3 : 85 56 __ STA T2 + 1 
08f5 : 85 57 __ STA T3 + 0 
08f7 : 85 58 __ STA T3 + 1 
08f9 : 85 5a __ STA T4 + 1 
08fb : 85 5c __ STA T5 + 1 
08fd : 85 5e __ STA T6 + 1 
08ff : 85 5f __ STA T7 + 0 
0901 : 85 60 __ STA T7 + 1 
.l5:
0903 : 20 92 44 JSR $4492 ; (keyb_poll.s4 + 0)
0906 : ad 3f 4e LDA $4e3f ; (keyb_matrix[0] + 7)
0909 : 0a __ __ ASL
090a : 30 6f __ BMI $097b ; (main.s6 + 0)
.s48:
090c : a5 53 __ LDA T1 + 0 
090e : 8d ef cf STA $cfef ; (sstack + 28)
0911 : a5 54 __ LDA T1 + 1 
0913 : 8d f0 cf STA $cff0 ; (sstack + 29)
0916 : a5 55 __ LDA T2 + 0 
0918 : 8d f1 cf STA $cff1 ; (sstack + 30)
091b : a5 56 __ LDA T2 + 1 
091d : 8d f2 cf STA $cff2 ; (sstack + 31)
0920 : a5 5b __ LDA T5 + 0 
0922 : 8d f5 cf STA $cff5 ; (sstack + 34)
0925 : a5 5c __ LDA T5 + 1 
0927 : 8d f6 cf STA $cff6 ; (sstack + 35)
092a : a5 5d __ LDA T6 + 0 
092c : 8d f7 cf STA $cff7 ; (sstack + 36)
092f : a5 5e __ LDA T6 + 1 
0931 : 8d f8 cf STA $cff8 ; (sstack + 37)
0934 : a5 59 __ LDA T4 + 0 
0936 : 8d f9 cf STA $cff9 ; (sstack + 38)
0939 : a5 5a __ LDA T4 + 1 
093b : 8d fa cf STA $cffa ; (sstack + 39)
093e : a9 90 __ LDA #$90
0940 : 8d fb cf STA $cffb ; (sstack + 40)
0943 : 18 __ __ CLC
0944 : a5 57 __ LDA T3 + 0 
0946 : 69 05 __ ADC #$05
0948 : 85 1b __ STA ACCU + 0 
094a : a5 58 __ LDA T3 + 1 
094c : 69 00 __ ADC #$00
094e : 85 1c __ STA ACCU + 1 
0950 : a9 01 __ LDA #$01
0952 : 8d fc cf STA $cffc ; (sstack + 41)
0955 : 85 04 __ STA WORK + 1 
0957 : a9 68 __ LDA #$68
0959 : 85 03 __ STA WORK + 0 
095b : 20 1c 4a JSR $4a1c ; (mods16 + 0)
095e : a5 05 __ LDA WORK + 2 
0960 : 85 57 __ STA T3 + 0 
0962 : 8d f3 cf STA $cff3 ; (sstack + 32)
0965 : a5 06 __ LDA WORK + 3 
0967 : 85 58 __ STA T3 + 1 
0969 : 8d f4 cf STA $cff4 ; (sstack + 33)
096c : ad 18 4e LDA $4e18 ; (c + 0)
096f : 8d fd cf STA $cffd ; (sstack + 42)
0972 : ad 19 4e LDA $4e19 ; (c + 1)
0975 : 8d fe cf STA $cffe ; (sstack + 43)
0978 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s6:
097b : ad 39 4e LDA $4e39 ; (keyb_matrix[0] + 1)
097e : 0a __ __ ASL
097f : 30 6f __ BMI $09f0 ; (main.s7 + 0)
.s47:
0981 : a5 53 __ LDA T1 + 0 
0983 : 8d ef cf STA $cfef ; (sstack + 28)
0986 : a5 54 __ LDA T1 + 1 
0988 : 8d f0 cf STA $cff0 ; (sstack + 29)
098b : a5 55 __ LDA T2 + 0 
098d : 8d f1 cf STA $cff1 ; (sstack + 30)
0990 : a5 56 __ LDA T2 + 1 
0992 : 8d f2 cf STA $cff2 ; (sstack + 31)
0995 : a5 5b __ LDA T5 + 0 
0997 : 8d f5 cf STA $cff5 ; (sstack + 34)
099a : a5 5c __ LDA T5 + 1 
099c : 8d f6 cf STA $cff6 ; (sstack + 35)
099f : a5 5d __ LDA T6 + 0 
09a1 : 8d f7 cf STA $cff7 ; (sstack + 36)
09a4 : a5 5e __ LDA T6 + 1 
09a6 : 8d f8 cf STA $cff8 ; (sstack + 37)
09a9 : a5 59 __ LDA T4 + 0 
09ab : 8d f9 cf STA $cff9 ; (sstack + 38)
09ae : a5 5a __ LDA T4 + 1 
09b0 : 8d fa cf STA $cffa ; (sstack + 39)
09b3 : a9 90 __ LDA #$90
09b5 : 8d fb cf STA $cffb ; (sstack + 40)
09b8 : 18 __ __ CLC
09b9 : a5 57 __ LDA T3 + 0 
09bb : 69 63 __ ADC #$63
09bd : 85 1b __ STA ACCU + 0 
09bf : a5 58 __ LDA T3 + 1 
09c1 : 69 01 __ ADC #$01
09c3 : 85 1c __ STA ACCU + 1 
09c5 : a9 01 __ LDA #$01
09c7 : 8d fc cf STA $cffc ; (sstack + 41)
09ca : 85 04 __ STA WORK + 1 
09cc : a9 68 __ LDA #$68
09ce : 85 03 __ STA WORK + 0 
09d0 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
09d3 : a5 05 __ LDA WORK + 2 
09d5 : 85 57 __ STA T3 + 0 
09d7 : 8d f3 cf STA $cff3 ; (sstack + 32)
09da : a5 06 __ LDA WORK + 3 
09dc : 85 58 __ STA T3 + 1 
09de : 8d f4 cf STA $cff4 ; (sstack + 33)
09e1 : ad 18 4e LDA $4e18 ; (c + 0)
09e4 : 8d fd cf STA $cffd ; (sstack + 42)
09e7 : ad 19 4e LDA $4e19 ; (c + 1)
09ea : 8d fe cf STA $cffe ; (sstack + 43)
09ed : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s7:
09f0 : ad 39 4e LDA $4e39 ; (keyb_matrix[0] + 1)
09f3 : 29 20 __ AND #$20
09f5 : d0 6f __ BNE $0a66 ; (main.s8 + 0)
.s46:
09f7 : a5 55 __ LDA T2 + 0 
09f9 : 8d f1 cf STA $cff1 ; (sstack + 30)
09fc : a5 56 __ LDA T2 + 1 
09fe : 8d f2 cf STA $cff2 ; (sstack + 31)
0a01 : a5 57 __ LDA T3 + 0 
0a03 : 8d f3 cf STA $cff3 ; (sstack + 32)
0a06 : a5 58 __ LDA T3 + 1 
0a08 : 8d f4 cf STA $cff4 ; (sstack + 33)
0a0b : a5 5b __ LDA T5 + 0 
0a0d : 8d f5 cf STA $cff5 ; (sstack + 34)
0a10 : a5 5c __ LDA T5 + 1 
0a12 : 8d f6 cf STA $cff6 ; (sstack + 35)
0a15 : a5 5d __ LDA T6 + 0 
0a17 : 8d f7 cf STA $cff7 ; (sstack + 36)
0a1a : a5 5e __ LDA T6 + 1 
0a1c : 8d f8 cf STA $cff8 ; (sstack + 37)
0a1f : a5 59 __ LDA T4 + 0 
0a21 : 8d f9 cf STA $cff9 ; (sstack + 38)
0a24 : a5 5a __ LDA T4 + 1 
0a26 : 8d fa cf STA $cffa ; (sstack + 39)
0a29 : a9 90 __ LDA #$90
0a2b : 8d fb cf STA $cffb ; (sstack + 40)
0a2e : 18 __ __ CLC
0a2f : a5 53 __ LDA T1 + 0 
0a31 : 69 05 __ ADC #$05
0a33 : 85 1b __ STA ACCU + 0 
0a35 : a5 54 __ LDA T1 + 1 
0a37 : 69 00 __ ADC #$00
0a39 : 85 1c __ STA ACCU + 1 
0a3b : a9 01 __ LDA #$01
0a3d : 8d fc cf STA $cffc ; (sstack + 41)
0a40 : 85 04 __ STA WORK + 1 
0a42 : a9 68 __ LDA #$68
0a44 : 85 03 __ STA WORK + 0 
0a46 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
0a49 : a5 05 __ LDA WORK + 2 
0a4b : 85 53 __ STA T1 + 0 
0a4d : 8d ef cf STA $cfef ; (sstack + 28)
0a50 : a5 06 __ LDA WORK + 3 
0a52 : 85 54 __ STA T1 + 1 
0a54 : 8d f0 cf STA $cff0 ; (sstack + 29)
0a57 : ad 18 4e LDA $4e18 ; (c + 0)
0a5a : 8d fd cf STA $cffd ; (sstack + 42)
0a5d : ad 19 4e LDA $4e19 ; (c + 1)
0a60 : 8d fe cf STA $cffe ; (sstack + 43)
0a63 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s8:
0a66 : ad 39 4e LDA $4e39 ; (keyb_matrix[0] + 1)
0a69 : 29 02 __ AND #$02
0a6b : d0 6f __ BNE $0adc ; (main.s9 + 0)
.s45:
0a6d : a5 55 __ LDA T2 + 0 
0a6f : 8d f1 cf STA $cff1 ; (sstack + 30)
0a72 : a5 56 __ LDA T2 + 1 
0a74 : 8d f2 cf STA $cff2 ; (sstack + 31)
0a77 : a5 57 __ LDA T3 + 0 
0a79 : 8d f3 cf STA $cff3 ; (sstack + 32)
0a7c : a5 58 __ LDA T3 + 1 
0a7e : 8d f4 cf STA $cff4 ; (sstack + 33)
0a81 : a5 5b __ LDA T5 + 0 
0a83 : 8d f5 cf STA $cff5 ; (sstack + 34)
0a86 : a5 5c __ LDA T5 + 1 
0a88 : 8d f6 cf STA $cff6 ; (sstack + 35)
0a8b : a5 5d __ LDA T6 + 0 
0a8d : 8d f7 cf STA $cff7 ; (sstack + 36)
0a90 : a5 5e __ LDA T6 + 1 
0a92 : 8d f8 cf STA $cff8 ; (sstack + 37)
0a95 : a5 59 __ LDA T4 + 0 
0a97 : 8d f9 cf STA $cff9 ; (sstack + 38)
0a9a : a5 5a __ LDA T4 + 1 
0a9c : 8d fa cf STA $cffa ; (sstack + 39)
0a9f : a9 90 __ LDA #$90
0aa1 : 8d fb cf STA $cffb ; (sstack + 40)
0aa4 : 18 __ __ CLC
0aa5 : a5 53 __ LDA T1 + 0 
0aa7 : 69 63 __ ADC #$63
0aa9 : 85 1b __ STA ACCU + 0 
0aab : a5 54 __ LDA T1 + 1 
0aad : 69 01 __ ADC #$01
0aaf : 85 1c __ STA ACCU + 1 
0ab1 : a9 01 __ LDA #$01
0ab3 : 8d fc cf STA $cffc ; (sstack + 41)
0ab6 : 85 04 __ STA WORK + 1 
0ab8 : a9 68 __ LDA #$68
0aba : 85 03 __ STA WORK + 0 
0abc : 20 1c 4a JSR $4a1c ; (mods16 + 0)
0abf : a5 05 __ LDA WORK + 2 
0ac1 : 85 53 __ STA T1 + 0 
0ac3 : 8d ef cf STA $cfef ; (sstack + 28)
0ac6 : a5 06 __ LDA WORK + 3 
0ac8 : 85 54 __ STA T1 + 1 
0aca : 8d f0 cf STA $cff0 ; (sstack + 29)
0acd : ad 18 4e LDA $4e18 ; (c + 0)
0ad0 : 8d fd cf STA $cffd ; (sstack + 42)
0ad3 : ad 19 4e LDA $4e19 ; (c + 1)
0ad6 : 8d fe cf STA $cffe ; (sstack + 43)
0ad9 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s9:
0adc : ad 39 4e LDA $4e39 ; (keyb_matrix[0] + 1)
0adf : 29 04 __ AND #$04
0ae1 : d0 6f __ BNE $0b52 ; (main.s10 + 0)
.s44:
0ae3 : a5 53 __ LDA T1 + 0 
0ae5 : 8d ef cf STA $cfef ; (sstack + 28)
0ae8 : a5 54 __ LDA T1 + 1 
0aea : 8d f0 cf STA $cff0 ; (sstack + 29)
0aed : a5 57 __ LDA T3 + 0 
0aef : 8d f3 cf STA $cff3 ; (sstack + 32)
0af2 : a5 58 __ LDA T3 + 1 
0af4 : 8d f4 cf STA $cff4 ; (sstack + 33)
0af7 : a5 5b __ LDA T5 + 0 
0af9 : 8d f5 cf STA $cff5 ; (sstack + 34)
0afc : a5 5c __ LDA T5 + 1 
0afe : 8d f6 cf STA $cff6 ; (sstack + 35)
0b01 : a5 5d __ LDA T6 + 0 
0b03 : 8d f7 cf STA $cff7 ; (sstack + 36)
0b06 : a5 5e __ LDA T6 + 1 
0b08 : 8d f8 cf STA $cff8 ; (sstack + 37)
0b0b : a5 59 __ LDA T4 + 0 
0b0d : 8d f9 cf STA $cff9 ; (sstack + 38)
0b10 : a5 5a __ LDA T4 + 1 
0b12 : 8d fa cf STA $cffa ; (sstack + 39)
0b15 : a9 90 __ LDA #$90
0b17 : 8d fb cf STA $cffb ; (sstack + 40)
0b1a : 18 __ __ CLC
0b1b : a5 55 __ LDA T2 + 0 
0b1d : 69 05 __ ADC #$05
0b1f : 85 1b __ STA ACCU + 0 
0b21 : a5 56 __ LDA T2 + 1 
0b23 : 69 00 __ ADC #$00
0b25 : 85 1c __ STA ACCU + 1 
0b27 : a9 01 __ LDA #$01
0b29 : 8d fc cf STA $cffc ; (sstack + 41)
0b2c : 85 04 __ STA WORK + 1 
0b2e : a9 68 __ LDA #$68
0b30 : 85 03 __ STA WORK + 0 
0b32 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
0b35 : a5 05 __ LDA WORK + 2 
0b37 : 85 55 __ STA T2 + 0 
0b39 : 8d f1 cf STA $cff1 ; (sstack + 30)
0b3c : a5 06 __ LDA WORK + 3 
0b3e : 85 56 __ STA T2 + 1 
0b40 : 8d f2 cf STA $cff2 ; (sstack + 31)
0b43 : ad 18 4e LDA $4e18 ; (c + 0)
0b46 : 8d fd cf STA $cffd ; (sstack + 42)
0b49 : ad 19 4e LDA $4e19 ; (c + 1)
0b4c : 8d fe cf STA $cffe ; (sstack + 43)
0b4f : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s10:
0b52 : ad 3a 4e LDA $4e3a ; (keyb_matrix[0] + 2)
0b55 : 29 04 __ AND #$04
0b57 : d0 6f __ BNE $0bc8 ; (main.s11 + 0)
.s43:
0b59 : a5 53 __ LDA T1 + 0 
0b5b : 8d ef cf STA $cfef ; (sstack + 28)
0b5e : a5 54 __ LDA T1 + 1 
0b60 : 8d f0 cf STA $cff0 ; (sstack + 29)
0b63 : a5 57 __ LDA T3 + 0 
0b65 : 8d f3 cf STA $cff3 ; (sstack + 32)
0b68 : a5 58 __ LDA T3 + 1 
0b6a : 8d f4 cf STA $cff4 ; (sstack + 33)
0b6d : a5 5b __ LDA T5 + 0 
0b6f : 8d f5 cf STA $cff5 ; (sstack + 34)
0b72 : a5 5c __ LDA T5 + 1 
0b74 : 8d f6 cf STA $cff6 ; (sstack + 35)
0b77 : a5 5d __ LDA T6 + 0 
0b79 : 8d f7 cf STA $cff7 ; (sstack + 36)
0b7c : a5 5e __ LDA T6 + 1 
0b7e : 8d f8 cf STA $cff8 ; (sstack + 37)
0b81 : a5 59 __ LDA T4 + 0 
0b83 : 8d f9 cf STA $cff9 ; (sstack + 38)
0b86 : a5 5a __ LDA T4 + 1 
0b88 : 8d fa cf STA $cffa ; (sstack + 39)
0b8b : a9 90 __ LDA #$90
0b8d : 8d fb cf STA $cffb ; (sstack + 40)
0b90 : 18 __ __ CLC
0b91 : a5 55 __ LDA T2 + 0 
0b93 : 69 63 __ ADC #$63
0b95 : 85 1b __ STA ACCU + 0 
0b97 : a5 56 __ LDA T2 + 1 
0b99 : 69 01 __ ADC #$01
0b9b : 85 1c __ STA ACCU + 1 
0b9d : a9 01 __ LDA #$01
0b9f : 8d fc cf STA $cffc ; (sstack + 41)
0ba2 : 85 04 __ STA WORK + 1 
0ba4 : a9 68 __ LDA #$68
0ba6 : 85 03 __ STA WORK + 0 
0ba8 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
0bab : a5 05 __ LDA WORK + 2 
0bad : 85 55 __ STA T2 + 0 
0baf : 8d f1 cf STA $cff1 ; (sstack + 30)
0bb2 : a5 06 __ LDA WORK + 3 
0bb4 : 85 56 __ STA T2 + 1 
0bb6 : 8d f2 cf STA $cff2 ; (sstack + 31)
0bb9 : ad 18 4e LDA $4e18 ; (c + 0)
0bbc : 8d fd cf STA $cffd ; (sstack + 42)
0bbf : ad 19 4e LDA $4e19 ; (c + 1)
0bc2 : 8d fe cf STA $cffe ; (sstack + 43)
0bc5 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s11:
0bc8 : ad 3e 4e LDA $4e3e ; (keyb_matrix[0] + 6)
0bcb : 29 10 __ AND #$10
0bcd : d0 39 __ BNE $0c08 ; (main.s12 + 0)
.s41:
0bcf : 2c 38 4e BIT $4e38 ; (keyb_matrix[0] + 0)
0bd2 : 30 34 __ BMI $0c08 ; (main.s12 + 0)
.s42:
0bd4 : 8d ef cf STA $cfef ; (sstack + 28)
0bd7 : 8d f0 cf STA $cff0 ; (sstack + 29)
0bda : a9 fb __ LDA #$fb
0bdc : 8d f1 cf STA $cff1 ; (sstack + 30)
0bdf : a9 ff __ LDA #$ff
0be1 : 8d f2 cf STA $cff2 ; (sstack + 31)
0be4 : a9 90 __ LDA #$90
0be6 : 8d f3 cf STA $cff3 ; (sstack + 32)
0be9 : a9 01 __ LDA #$01
0beb : 8d f4 cf STA $cff4 ; (sstack + 33)
0bee : ad 18 4e LDA $4e18 ; (c + 0)
0bf1 : 8d f5 cf STA $cff5 ; (sstack + 34)
0bf4 : ad 19 4e LDA $4e19 ; (c + 1)
0bf7 : 8d f6 cf STA $cff6 ; (sstack + 35)
0bfa : 20 45 45 JSR $4545 ; (DoTranslate.s4 + 0)
0bfd : 38 __ __ SEC
0bfe : a5 5d __ LDA T6 + 0 
0c00 : e9 05 __ SBC #$05
0c02 : 85 5d __ STA T6 + 0 
0c04 : b0 02 __ BCS $0c08 ; (main.s12 + 0)
.s49:
0c06 : c6 5e __ DEC T6 + 1 
.s12:
0c08 : ad 3e 4e LDA $4e3e ; (keyb_matrix[0] + 6)
0c0b : 29 10 __ AND #$10
0c0d : f0 39 __ BEQ $0c48 ; (main.s14 + 0)
.s13:
0c0f : 2c 38 4e BIT $4e38 ; (keyb_matrix[0] + 0)
0c12 : 30 34 __ BMI $0c48 ; (main.s14 + 0)
.s40:
0c14 : a9 00 __ LDA #$00
0c16 : 8d ef cf STA $cfef ; (sstack + 28)
0c19 : 8d f0 cf STA $cff0 ; (sstack + 29)
0c1c : 8d f2 cf STA $cff2 ; (sstack + 31)
0c1f : a9 05 __ LDA #$05
0c21 : 8d f1 cf STA $cff1 ; (sstack + 30)
0c24 : a9 90 __ LDA #$90
0c26 : 8d f3 cf STA $cff3 ; (sstack + 32)
0c29 : a9 01 __ LDA #$01
0c2b : 8d f4 cf STA $cff4 ; (sstack + 33)
0c2e : ad 18 4e LDA $4e18 ; (c + 0)
0c31 : 8d f5 cf STA $cff5 ; (sstack + 34)
0c34 : ad 19 4e LDA $4e19 ; (c + 1)
0c37 : 8d f6 cf STA $cff6 ; (sstack + 35)
0c3a : 20 45 45 JSR $4545 ; (DoTranslate.s4 + 0)
0c3d : 18 __ __ CLC
0c3e : a5 5d __ LDA T6 + 0 
0c40 : 69 05 __ ADC #$05
0c42 : 85 5d __ STA T6 + 0 
0c44 : 90 02 __ BCC $0c48 ; (main.s14 + 0)
.s53:
0c46 : e6 5e __ INC T6 + 1 
.s14:
0c48 : ad 3e 4e LDA $4e3e ; (keyb_matrix[0] + 6)
0c4b : 29 10 __ AND #$10
0c4d : d0 3b __ BNE $0c8a ; (main.s15 + 0)
.s38:
0c4f : ad 38 4e LDA $4e38 ; (keyb_matrix[0] + 0)
0c52 : 29 04 __ AND #$04
0c54 : d0 34 __ BNE $0c8a ; (main.s15 + 0)
.s39:
0c56 : 8d f1 cf STA $cff1 ; (sstack + 30)
0c59 : 8d f2 cf STA $cff2 ; (sstack + 31)
0c5c : a9 fb __ LDA #$fb
0c5e : 8d ef cf STA $cfef ; (sstack + 28)
0c61 : a9 ff __ LDA #$ff
0c63 : 8d f0 cf STA $cff0 ; (sstack + 29)
0c66 : a9 90 __ LDA #$90
0c68 : 8d f3 cf STA $cff3 ; (sstack + 32)
0c6b : a9 01 __ LDA #$01
0c6d : 8d f4 cf STA $cff4 ; (sstack + 33)
0c70 : ad 18 4e LDA $4e18 ; (c + 0)
0c73 : 8d f5 cf STA $cff5 ; (sstack + 34)
0c76 : ad 19 4e LDA $4e19 ; (c + 1)
0c79 : 8d f6 cf STA $cff6 ; (sstack + 35)
0c7c : 20 45 45 JSR $4545 ; (DoTranslate.s4 + 0)
0c7f : 38 __ __ SEC
0c80 : a5 5b __ LDA T5 + 0 
0c82 : e9 05 __ SBC #$05
0c84 : 85 5b __ STA T5 + 0 
0c86 : b0 02 __ BCS $0c8a ; (main.s15 + 0)
.s50:
0c88 : c6 5c __ DEC T5 + 1 
.s15:
0c8a : ad 3e 4e LDA $4e3e ; (keyb_matrix[0] + 6)
0c8d : 29 10 __ AND #$10
0c8f : f0 39 __ BEQ $0cca ; (main.s17 + 0)
.s16:
0c91 : ad 38 4e LDA $4e38 ; (keyb_matrix[0] + 0)
0c94 : 29 04 __ AND #$04
0c96 : d0 32 __ BNE $0cca ; (main.s17 + 0)
.s37:
0c98 : 8d f0 cf STA $cff0 ; (sstack + 29)
0c9b : 8d f1 cf STA $cff1 ; (sstack + 30)
0c9e : 8d f2 cf STA $cff2 ; (sstack + 31)
0ca1 : a9 05 __ LDA #$05
0ca3 : 8d ef cf STA $cfef ; (sstack + 28)
0ca6 : a9 90 __ LDA #$90
0ca8 : 8d f3 cf STA $cff3 ; (sstack + 32)
0cab : a9 01 __ LDA #$01
0cad : 8d f4 cf STA $cff4 ; (sstack + 33)
0cb0 : ad 18 4e LDA $4e18 ; (c + 0)
0cb3 : 8d f5 cf STA $cff5 ; (sstack + 34)
0cb6 : ad 19 4e LDA $4e19 ; (c + 1)
0cb9 : 8d f6 cf STA $cff6 ; (sstack + 35)
0cbc : 20 45 45 JSR $4545 ; (DoTranslate.s4 + 0)
0cbf : 18 __ __ CLC
0cc0 : a5 5b __ LDA T5 + 0 
0cc2 : 69 05 __ ADC #$05
0cc4 : 85 5b __ STA T5 + 0 
0cc6 : 90 02 __ BCC $0cca ; (main.s17 + 0)
.s52:
0cc8 : e6 5c __ INC T5 + 1 
.s17:
0cca : ad 3d 4e LDA $4e3d ; (keyb_matrix[0] + 5)
0ccd : 4a __ __ LSR
0cce : b0 5d __ BCS $0d2d ; (main.s18 + 0)
.s36:
0cd0 : a5 53 __ LDA T1 + 0 
0cd2 : 8d ef cf STA $cfef ; (sstack + 28)
0cd5 : a5 54 __ LDA T1 + 1 
0cd7 : 8d f0 cf STA $cff0 ; (sstack + 29)
0cda : a5 55 __ LDA T2 + 0 
0cdc : 8d f1 cf STA $cff1 ; (sstack + 30)
0cdf : a5 56 __ LDA T2 + 1 
0ce1 : 8d f2 cf STA $cff2 ; (sstack + 31)
0ce4 : a5 57 __ LDA T3 + 0 
0ce6 : 8d f3 cf STA $cff3 ; (sstack + 32)
0ce9 : a5 58 __ LDA T3 + 1 
0ceb : 8d f4 cf STA $cff4 ; (sstack + 33)
0cee : a5 5b __ LDA T5 + 0 
0cf0 : 8d f5 cf STA $cff5 ; (sstack + 34)
0cf3 : a5 5c __ LDA T5 + 1 
0cf5 : 8d f6 cf STA $cff6 ; (sstack + 35)
0cf8 : a5 5d __ LDA T6 + 0 
0cfa : 8d f7 cf STA $cff7 ; (sstack + 36)
0cfd : a5 5e __ LDA T6 + 1 
0cff : 8d f8 cf STA $cff8 ; (sstack + 37)
0d02 : a9 90 __ LDA #$90
0d04 : 8d fb cf STA $cffb ; (sstack + 40)
0d07 : a9 01 __ LDA #$01
0d09 : 8d fc cf STA $cffc ; (sstack + 41)
0d0c : a5 59 __ LDA T4 + 0 
0d0e : 69 01 __ ADC #$01
0d10 : 85 59 __ STA T4 + 0 
0d12 : 8d f9 cf STA $cff9 ; (sstack + 38)
0d15 : a5 5a __ LDA T4 + 1 
0d17 : 69 00 __ ADC #$00
0d19 : 85 5a __ STA T4 + 1 
0d1b : 8d fa cf STA $cffa ; (sstack + 39)
0d1e : ad 18 4e LDA $4e18 ; (c + 0)
0d21 : 8d fd cf STA $cffd ; (sstack + 42)
0d24 : ad 19 4e LDA $4e19 ; (c + 1)
0d27 : 8d fe cf STA $cffe ; (sstack + 43)
0d2a : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s18:
0d2d : ad 3d 4e LDA $4e3d ; (keyb_matrix[0] + 5)
0d30 : 29 08 __ AND #$08
0d32 : d0 6f __ BNE $0da3 ; (main.s19 + 0)
.s31:
0d34 : a9 90 __ LDA #$90
0d36 : 8d fb cf STA $cffb ; (sstack + 40)
0d39 : a9 01 __ LDA #$01
0d3b : 8d fc cf STA $cffc ; (sstack + 41)
0d3e : ad 18 4e LDA $4e18 ; (c + 0)
0d41 : 8d fd cf STA $cffd ; (sstack + 42)
0d44 : ad 19 4e LDA $4e19 ; (c + 1)
0d47 : 8d fe cf STA $cffe ; (sstack + 43)
0d4a : a5 5a __ LDA T4 + 1 
0d4c : 30 16 __ BMI $0d64 ; (main.s32 + 0)
.s35:
0d4e : f0 05 __ BEQ $0d55 ; (main.s34 + 0)
.s54:
0d50 : a5 59 __ LDA T4 + 0 
0d52 : 4c 5b 0d JMP $0d5b ; (main.s33 + 0)
.s34:
0d55 : a5 59 __ LDA T4 + 0 
0d57 : c9 02 __ CMP #$02
0d59 : 90 09 __ BCC $0d64 ; (main.s32 + 0)
.s33:
0d5b : 38 __ __ SEC
0d5c : e9 01 __ SBC #$01
0d5e : 85 59 __ STA T4 + 0 
0d60 : b0 02 __ BCS $0d64 ; (main.s32 + 0)
.s51:
0d62 : c6 5a __ DEC T4 + 1 
.s32:
0d64 : a5 53 __ LDA T1 + 0 
0d66 : 8d ef cf STA $cfef ; (sstack + 28)
0d69 : a5 54 __ LDA T1 + 1 
0d6b : 8d f0 cf STA $cff0 ; (sstack + 29)
0d6e : a5 55 __ LDA T2 + 0 
0d70 : 8d f1 cf STA $cff1 ; (sstack + 30)
0d73 : a5 56 __ LDA T2 + 1 
0d75 : 8d f2 cf STA $cff2 ; (sstack + 31)
0d78 : a5 57 __ LDA T3 + 0 
0d7a : 8d f3 cf STA $cff3 ; (sstack + 32)
0d7d : a5 58 __ LDA T3 + 1 
0d7f : 8d f4 cf STA $cff4 ; (sstack + 33)
0d82 : a5 5b __ LDA T5 + 0 
0d84 : 8d f5 cf STA $cff5 ; (sstack + 34)
0d87 : a5 5c __ LDA T5 + 1 
0d89 : 8d f6 cf STA $cff6 ; (sstack + 35)
0d8c : a5 5d __ LDA T6 + 0 
0d8e : 8d f7 cf STA $cff7 ; (sstack + 36)
0d91 : a5 5e __ LDA T6 + 1 
0d93 : 8d f8 cf STA $cff8 ; (sstack + 37)
0d96 : a5 59 __ LDA T4 + 0 
0d98 : 8d f9 cf STA $cff9 ; (sstack + 38)
0d9b : a5 5a __ LDA T4 + 1 
0d9d : 8d fa cf STA $cffa ; (sstack + 39)
0da0 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s19:
0da3 : 2c 3a 4e BIT $4e3a ; (keyb_matrix[0] + 2)
0da6 : 30 64 __ BMI $0e0c ; (main.s20 + 0)
.s30:
0da8 : a5 53 __ LDA T1 + 0 
0daa : 8d ef cf STA $cfef ; (sstack + 28)
0dad : a5 54 __ LDA T1 + 1 
0daf : 8d f0 cf STA $cff0 ; (sstack + 29)
0db2 : a5 55 __ LDA T2 + 0 
0db4 : 8d f1 cf STA $cff1 ; (sstack + 30)
0db7 : a5 56 __ LDA T2 + 1 
0db9 : 8d f2 cf STA $cff2 ; (sstack + 31)
0dbc : a5 57 __ LDA T3 + 0 
0dbe : 8d f3 cf STA $cff3 ; (sstack + 32)
0dc1 : a5 58 __ LDA T3 + 1 
0dc3 : 8d f4 cf STA $cff4 ; (sstack + 33)
0dc6 : a5 5b __ LDA T5 + 0 
0dc8 : 8d f5 cf STA $cff5 ; (sstack + 34)
0dcb : a5 5c __ LDA T5 + 1 
0dcd : 8d f6 cf STA $cff6 ; (sstack + 35)
0dd0 : a5 5d __ LDA T6 + 0 
0dd2 : 8d f7 cf STA $cff7 ; (sstack + 36)
0dd5 : a5 5e __ LDA T6 + 1 
0dd7 : 8d f8 cf STA $cff8 ; (sstack + 37)
0dda : a5 59 __ LDA T4 + 0 
0ddc : 8d f9 cf STA $cff9 ; (sstack + 38)
0ddf : a5 5a __ LDA T4 + 1 
0de1 : 8d fa cf STA $cffa ; (sstack + 39)
0de4 : a9 01 __ LDA #$01
0de6 : 8d fc cf STA $cffc ; (sstack + 41)
0de9 : 38 __ __ SEC
0dea : ed b5 4d SBC $4db5 ; (wireframeOn + 0)
0ded : 8d b5 4d STA $4db5 ; (wireframeOn + 0)
0df0 : a9 90 __ LDA #$90
0df2 : 8d fb cf STA $cffb ; (sstack + 40)
0df5 : a9 00 __ LDA #$00
0df7 : ed b6 4d SBC $4db6 ; (wireframeOn + 1)
0dfa : 8d b6 4d STA $4db6 ; (wireframeOn + 1)
0dfd : ad 18 4e LDA $4e18 ; (c + 0)
0e00 : 8d fd cf STA $cffd ; (sstack + 42)
0e03 : ad 19 4e LDA $4e19 ; (c + 1)
0e06 : 8d fe cf STA $cffe ; (sstack + 43)
0e09 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s20:
0e0c : ad 3d 4e LDA $4e3d ; (keyb_matrix[0] + 5)
0e0f : 29 02 __ AND #$02
0e11 : d0 6a __ BNE $0e7d ; (main.s21 + 0)
.s29:
0e13 : 8d b5 4d STA $4db5 ; (wireframeOn + 0)
0e16 : 8d b6 4d STA $4db6 ; (wireframeOn + 1)
0e19 : a5 53 __ LDA T1 + 0 
0e1b : 8d ef cf STA $cfef ; (sstack + 28)
0e1e : a5 54 __ LDA T1 + 1 
0e20 : 8d f0 cf STA $cff0 ; (sstack + 29)
0e23 : a5 55 __ LDA T2 + 0 
0e25 : 8d f1 cf STA $cff1 ; (sstack + 30)
0e28 : a5 56 __ LDA T2 + 1 
0e2a : 8d f2 cf STA $cff2 ; (sstack + 31)
0e2d : a5 57 __ LDA T3 + 0 
0e2f : 8d f3 cf STA $cff3 ; (sstack + 32)
0e32 : a5 58 __ LDA T3 + 1 
0e34 : 8d f4 cf STA $cff4 ; (sstack + 33)
0e37 : a5 5b __ LDA T5 + 0 
0e39 : 8d f5 cf STA $cff5 ; (sstack + 34)
0e3c : a5 5c __ LDA T5 + 1 
0e3e : 8d f6 cf STA $cff6 ; (sstack + 35)
0e41 : a5 5d __ LDA T6 + 0 
0e43 : 8d f7 cf STA $cff7 ; (sstack + 36)
0e46 : a5 5e __ LDA T6 + 1 
0e48 : 8d f8 cf STA $cff8 ; (sstack + 37)
0e4b : a5 59 __ LDA T4 + 0 
0e4d : 8d f9 cf STA $cff9 ; (sstack + 38)
0e50 : a5 5a __ LDA T4 + 1 
0e52 : 8d fa cf STA $cffa ; (sstack + 39)
0e55 : a9 90 __ LDA #$90
0e57 : 8d fb cf STA $cffb ; (sstack + 40)
0e5a : a9 01 __ LDA #$01
0e5c : 8d fc cf STA $cffc ; (sstack + 41)
0e5f : 38 __ __ SEC
0e60 : ed c1 4d SBC $4dc1 ; (PaintersOn + 0)
0e63 : 8d c1 4d STA $4dc1 ; (PaintersOn + 0)
0e66 : a9 00 __ LDA #$00
0e68 : ed c2 4d SBC $4dc2 ; (PaintersOn + 1)
0e6b : 8d c2 4d STA $4dc2 ; (PaintersOn + 1)
0e6e : ad 18 4e LDA $4e18 ; (c + 0)
0e71 : 8d fd cf STA $cffd ; (sstack + 42)
0e74 : ad 19 4e LDA $4e19 ; (c + 1)
0e77 : 8d fe cf STA $cffe ; (sstack + 43)
0e7a : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s21:
0e7d : ad 3a 4e LDA $4e3a ; (keyb_matrix[0] + 2)
0e80 : 29 10 __ AND #$10
0e82 : d0 75 __ BNE $0ef9 ; (main.s22 + 0)
.s28:
0e84 : a5 53 __ LDA T1 + 0 
0e86 : 8d ef cf STA $cfef ; (sstack + 28)
0e89 : a5 54 __ LDA T1 + 1 
0e8b : 8d f0 cf STA $cff0 ; (sstack + 29)
0e8e : a5 55 __ LDA T2 + 0 
0e90 : 8d f1 cf STA $cff1 ; (sstack + 30)
0e93 : a5 56 __ LDA T2 + 1 
0e95 : 8d f2 cf STA $cff2 ; (sstack + 31)
0e98 : a5 57 __ LDA T3 + 0 
0e9a : 8d f3 cf STA $cff3 ; (sstack + 32)
0e9d : a5 58 __ LDA T3 + 1 
0e9f : 8d f4 cf STA $cff4 ; (sstack + 33)
0ea2 : a5 5b __ LDA T5 + 0 
0ea4 : 8d f5 cf STA $cff5 ; (sstack + 34)
0ea7 : a5 5c __ LDA T5 + 1 
0ea9 : 8d f6 cf STA $cff6 ; (sstack + 35)
0eac : a5 5d __ LDA T6 + 0 
0eae : 8d f7 cf STA $cff7 ; (sstack + 36)
0eb1 : a5 5e __ LDA T6 + 1 
0eb3 : 8d f8 cf STA $cff8 ; (sstack + 37)
0eb6 : a5 59 __ LDA T4 + 0 
0eb8 : 8d f9 cf STA $cff9 ; (sstack + 38)
0ebb : a5 5a __ LDA T4 + 1 
0ebd : 8d fa cf STA $cffa ; (sstack + 39)
0ec0 : a9 01 __ LDA #$01
0ec2 : 8d fc cf STA $cffc ; (sstack + 41)
0ec5 : 38 __ __ SEC
0ec6 : ed c3 4d SBC $4dc3 ; (backcolor + 0)
0ec9 : 8d c3 4d STA $4dc3 ; (backcolor + 0)
0ecc : a9 90 __ LDA #$90
0ece : 8d fb cf STA $cffb ; (sstack + 40)
0ed1 : a9 00 __ LDA #$00
0ed3 : ed c4 4d SBC $4dc4 ; (backcolor + 1)
0ed6 : 8d c4 4d STA $4dc4 ; (backcolor + 1)
0ed9 : 38 __ __ SEC
0eda : a9 01 __ LDA #$01
0edc : ed c5 4d SBC $4dc5 ; (linecolor + 0)
0edf : 8d c5 4d STA $4dc5 ; (linecolor + 0)
0ee2 : a9 00 __ LDA #$00
0ee4 : ed c6 4d SBC $4dc6 ; (linecolor + 1)
0ee7 : 8d c6 4d STA $4dc6 ; (linecolor + 1)
0eea : ad 18 4e LDA $4e18 ; (c + 0)
0eed : 8d fd cf STA $cffd ; (sstack + 42)
0ef0 : ad 19 4e LDA $4e19 ; (c + 1)
0ef3 : 8d fe cf STA $cffe ; (sstack + 43)
0ef6 : 20 85 25 JSR $2585 ; (DoRender.s1 + 0)
.s22:
0ef9 : ad 3b 4e LDA $4e3b ; (keyb_matrix[0] + 3)
0efc : 29 10 __ AND #$10
0efe : d0 19 __ BNE $0f19 ; (main.s23 + 0)
.s25:
0f00 : 38 __ __ SEC
0f01 : a9 01 __ LDA #$01
0f03 : e5 5f __ SBC T7 + 0 
0f05 : 85 5f __ STA T7 + 0 
0f07 : a9 00 __ LDA #$00
0f09 : e5 60 __ SBC T7 + 1 
0f0b : 85 60 __ STA T7 + 1 
0f0d : a9 06 __ LDA #$06
0f0f : cd 20 d0 CMP $d020 
0f12 : d0 02 __ BNE $0f16 ; (main.s26 + 0)
.s27:
0f14 : a9 00 __ LDA #$00
.s26:
0f16 : 8d 20 d0 STA $d020 
.s23:
0f19 : ad 3f 4e LDA $4e3f ; (keyb_matrix[0] + 7)
0f1c : 29 10 __ AND #$10
0f1e : f0 03 __ BEQ $0f23 ; (main.s24 + 0)
0f20 : 4c 03 09 JMP $0903 ; (main.l5 + 0)
.s24:
0f23 : 85 1b __ STA ACCU + 0 
0f25 : 85 1c __ STA ACCU + 1 
.s3:
0f27 : a2 0d __ LDX #$0d
0f29 : bd 29 cf LDA $cf29,x ; (main@stack + 0)
0f2c : 95 53 __ STA T1 + 0,x 
0f2e : ca __ __ DEX
0f2f : 10 f8 __ BPL $0f29 ; (main.s3 + 2)
0f31 : 60 __ __ RTS
--------------------------------------------------------------------
load_vertex_data: ; load_vertex_data()->void
; 130, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
0f32 : a2 05 __ LDX #$05
0f34 : b5 53 __ LDA T1 + 0,x 
0f36 : 9d 37 cf STA $cf37,x ; (load_vertex_data@stack + 0)
0f39 : ca __ __ DEX
0f3a : 10 f8 __ BPL $0f34 ; (load_vertex_data.s1 + 2)
.s4:
0f3c : a9 ba __ LDA #$ba
0f3e : 85 10 __ STA P3 
0f40 : a9 13 __ LDA #$13
0f42 : 85 13 __ STA P6 
0f44 : a9 13 __ LDA #$13
0f46 : 85 11 __ STA P4 
0f48 : a9 c5 __ LDA #$c5
0f4a : 85 12 __ STA P5 
0f4c : 20 ec 11 JSR $11ec ; (fopen.s4 + 0)
0f4f : a5 1b __ LDA ACCU + 0 
0f51 : 85 55 __ STA T2 + 0 
0f53 : a5 1c __ LDA ACCU + 1 
0f55 : 85 56 __ STA T2 + 1 
0f57 : a9 00 __ LDA #$00
0f59 : 85 1b __ STA ACCU + 0 
0f5b : 85 1c __ STA ACCU + 1 
0f5d : c5 55 __ CMP T2 + 0 
0f5f : d0 14 __ BNE $0f75 ; (load_vertex_data.s5 + 0)
.s19:
0f61 : a5 56 __ LDA T2 + 1 
0f63 : d0 10 __ BNE $0f75 ; (load_vertex_data.s5 + 0)
.s18:
0f65 : a9 36 __ LDA #$36
0f67 : 8d db cf STA $cfdb ; (sstack + 8)
0f6a : a9 20 __ LDA #$20
0f6c : 8d dc cf STA $cfdc ; (sstack + 9)
0f6f : 20 c7 13 JSR $13c7 ; (printf.s4 + 0)
0f72 : 4c dc 11 JMP $11dc ; (load_vertex_data.s3 + 0)
.s5:
0f75 : a5 55 __ LDA T2 + 0 
0f77 : 85 17 __ STA P10 
0f79 : a9 40 __ LDA #$40
0f7b : 85 15 __ STA P8 
0f7d : a9 00 __ LDA #$00
0f7f : 85 16 __ STA P9 
0f81 : a5 56 __ LDA T2 + 1 
0f83 : 85 18 __ STA P11 
0f85 : a9 3f __ LDA #$3f
0f87 : 85 13 __ STA P6 
0f89 : a9 cf __ LDA #$cf
0f8b : 85 14 __ STA P7 
0f8d : 20 4d 20 JSR $204d ; (fgets.s4 + 0)
0f90 : a5 1b __ LDA ACCU + 0 
0f92 : 05 1c __ ORA ACCU + 1 
0f94 : d0 03 __ BNE $0f99 ; (load_vertex_data.s17 + 0)
0f96 : 4c 84 10 JMP $1084 ; (load_vertex_data.s6 + 0)
.s17:
0f99 : a9 3f __ LDA #$3f
0f9b : 85 0d __ STA P0 
0f9d : a9 4e __ LDA #$4e
0f9f : 85 10 __ STA P3 
0fa1 : a9 cf __ LDA #$cf
0fa3 : 85 0e __ STA P1 
0fa5 : a9 18 __ LDA #$18
0fa7 : 85 0f __ STA P2 
0fa9 : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
0fac : a5 1b __ LDA ACCU + 0 
0fae : 85 0d __ STA P0 
0fb0 : a5 1c __ LDA ACCU + 1 
0fb2 : 85 0e __ STA P1 
0fb4 : a9 1a __ LDA #$1a
0fb6 : 85 0f __ STA P2 
0fb8 : a9 4e __ LDA #$4e
0fba : 85 10 __ STA P3 
0fbc : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
0fbf : a5 1b __ LDA ACCU + 0 
0fc1 : 85 0d __ STA P0 
0fc3 : a5 1c __ LDA ACCU + 1 
0fc5 : 85 0e __ STA P1 
0fc7 : a9 1c __ LDA #$1c
0fc9 : 85 0f __ STA P2 
0fcb : a9 4e __ LDA #$4e
0fcd : 85 10 __ STA P3 
0fcf : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
0fd2 : a5 1b __ LDA ACCU + 0 
0fd4 : 85 0d __ STA P0 
0fd6 : a5 1c __ LDA ACCU + 1 
0fd8 : 85 0e __ STA P1 
0fda : a9 1e __ LDA #$1e
0fdc : 85 0f __ STA P2 
0fde : a9 4e __ LDA #$4e
0fe0 : 85 10 __ STA P3 
0fe2 : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
0fe5 : ad 18 4e LDA $4e18 ; (c + 0)
0fe8 : 0a __ __ ASL
0fe9 : 85 43 __ STA T0 + 0 
0feb : 85 1b __ STA ACCU + 0 
0fed : ad 19 4e LDA $4e19 ; (c + 1)
0ff0 : 2a __ __ ROL
0ff1 : 85 44 __ STA T0 + 1 
0ff3 : 85 1c __ STA ACCU + 1 
0ff5 : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
0ff8 : a5 1b __ LDA ACCU + 0 
0ffa : 8d 20 4e STA $4e20 ; (x_pct + 0)
0ffd : a5 1c __ LDA ACCU + 1 
0fff : 8d 21 4e STA $4e21 ; (x_pct + 1)
1002 : a5 43 __ LDA T0 + 0 
1004 : 85 1b __ STA ACCU + 0 
1006 : a5 44 __ LDA T0 + 1 
1008 : 85 1c __ STA ACCU + 1 
100a : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
100d : a5 1b __ LDA ACCU + 0 
100f : 8d 22 4e STA $4e22 ; (y_pct + 0)
1012 : a5 1c __ LDA ACCU + 1 
1014 : 8d 23 4e STA $4e23 ; (y_pct + 1)
1017 : a5 43 __ LDA T0 + 0 
1019 : 85 1b __ STA ACCU + 0 
101b : a5 44 __ LDA T0 + 1 
101d : 85 1c __ STA ACCU + 1 
101f : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
1022 : a5 1b __ LDA ACCU + 0 
1024 : 8d 24 4e STA $4e24 ; (z_pct + 0)
1027 : a5 1c __ LDA ACCU + 1 
1029 : 8d 25 4e STA $4e25 ; (z_pct + 1)
102c : a5 43 __ LDA T0 + 0 
102e : 85 1b __ STA ACCU + 0 
1030 : a5 44 __ LDA T0 + 1 
1032 : 85 1c __ STA ACCU + 1 
1034 : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
1037 : a5 1b __ LDA ACCU + 0 
1039 : 8d 26 4e STA $4e26 ; (z_rotated + 0)
103c : a5 1c __ LDA ACCU + 1 
103e : 8d 27 4e STA $4e27 ; (z_rotated + 1)
1041 : a5 43 __ LDA T0 + 0 
1043 : 85 1b __ STA ACCU + 0 
1045 : a5 44 __ LDA T0 + 1 
1047 : 85 1c __ STA ACCU + 1 
1049 : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
104c : a5 1b __ LDA ACCU + 0 
104e : 8d 28 4e STA $4e28 ; (vx_pct + 0)
1051 : a5 1c __ LDA ACCU + 1 
1053 : 8d 29 4e STA $4e29 ; (vx_pct + 1)
1056 : a5 43 __ LDA T0 + 0 
1058 : 85 1b __ STA ACCU + 0 
105a : a5 44 __ LDA T0 + 1 
105c : 85 1c __ STA ACCU + 1 
105e : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
1061 : a5 1b __ LDA ACCU + 0 
1063 : 8d 2a 4e STA $4e2a ; (vy_pct + 0)
1066 : a5 1c __ LDA ACCU + 1 
1068 : 8d 2b 4e STA $4e2b ; (vy_pct + 1)
106b : ad 1e 4e LDA $4e1e ; (u + 0)
106e : 0a __ __ ASL
106f : 85 1b __ STA ACCU + 0 
1071 : ad 1f 4e LDA $4e1f ; (u + 1)
1074 : 2a __ __ ROL
1075 : 85 1c __ STA ACCU + 1 
1077 : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
107a : a5 1b __ LDA ACCU + 0 
107c : 8d 2c 4e STA $4e2c ; (u_array + 0)
107f : a5 1c __ LDA ACCU + 1 
1081 : 8d 2d 4e STA $4e2d ; (u_array + 1)
.s6:
1084 : a9 0c __ LDA #$0c
1086 : 8d db cf STA $cfdb ; (sstack + 8)
1089 : a9 22 __ LDA #$22
108b : 8d dc cf STA $cfdc ; (sstack + 9)
108e : ad 18 4e LDA $4e18 ; (c + 0)
1091 : 8d dd cf STA $cfdd ; (sstack + 10)
1094 : ad 19 4e LDA $4e19 ; (c + 1)
1097 : 8d de cf STA $cfde ; (sstack + 11)
109a : 20 c7 13 JSR $13c7 ; (printf.s4 + 0)
109d : a9 13 __ LDA #$13
109f : 8d db cf STA $cfdb ; (sstack + 8)
10a2 : a9 22 __ LDA #$22
10a4 : 8d dc cf STA $cfdc ; (sstack + 9)
10a7 : ad 1a 4e LDA $4e1a ; (d + 0)
10aa : 8d dd cf STA $cfdd ; (sstack + 10)
10ad : ad 1b 4e LDA $4e1b ; (d + 1)
10b0 : 8d de cf STA $cfde ; (sstack + 11)
10b3 : 20 c7 13 JSR $13c7 ; (printf.s4 + 0)
10b6 : a9 1a __ LDA #$1a
10b8 : 8d db cf STA $cfdb ; (sstack + 8)
10bb : a9 22 __ LDA #$22
10bd : 8d dc cf STA $cfdc ; (sstack + 9)
10c0 : ad 1c 4e LDA $4e1c ; (h + 0)
10c3 : 8d dd cf STA $cfdd ; (sstack + 10)
10c6 : ad 1d 4e LDA $4e1d ; (h + 1)
10c9 : 8d de cf STA $cfde ; (sstack + 11)
10cc : 20 c7 13 JSR $13c7 ; (printf.s4 + 0)
10cf : a9 21 __ LDA #$21
10d1 : 8d db cf STA $cfdb ; (sstack + 8)
10d4 : a9 22 __ LDA #$22
10d6 : 8d dc cf STA $cfdc ; (sstack + 9)
10d9 : ad 1e 4e LDA $4e1e ; (u + 0)
10dc : 8d dd cf STA $cfdd ; (sstack + 10)
10df : ad 1f 4e LDA $4e1f ; (u + 1)
10e2 : 8d de cf STA $cfde ; (sstack + 11)
10e5 : 20 c7 13 JSR $13c7 ; (printf.s4 + 0)
10e8 : a9 28 __ LDA #$28
10ea : 8d db cf STA $cfdb ; (sstack + 8)
10ed : a9 22 __ LDA #$22
10ef : 8d dc cf STA $cfdc ; (sstack + 9)
10f2 : ad 1e 4e LDA $4e1e ; (u + 0)
10f5 : 8d dd cf STA $cfdd ; (sstack + 10)
10f8 : ad 1f 4e LDA $4e1f ; (u + 1)
10fb : 8d de cf STA $cfde ; (sstack + 11)
10fe : 20 c7 13 JSR $13c7 ; (printf.s4 + 0)
1101 : a9 01 __ LDA #$01
1103 : 8d 2e 4e STA $4e2e ; (a + 0)
1106 : a9 00 __ LDA #$00
1108 : 8d 2f 4e STA $4e2f ; (a + 1)
110b : ad 19 4e LDA $4e19 ; (c + 1)
110e : 10 03 __ BPL $1113 ; (load_vertex_data.s16 + 0)
1110 : 4c d0 11 JMP $11d0 ; (load_vertex_data.s7 + 0)
.s16:
1113 : d0 05 __ BNE $111a ; (load_vertex_data.s20 + 0)
.s15:
1115 : ad 18 4e LDA $4e18 ; (c + 0)
1118 : f0 f6 __ BEQ $1110 ; (load_vertex_data.s6 + 140)
.s20:
111a : a5 55 __ LDA T2 + 0 
111c : 85 17 __ STA P10 
111e : a9 3f __ LDA #$3f
1120 : 85 13 __ STA P6 
1122 : a9 cf __ LDA #$cf
1124 : 85 14 __ STA P7 
1126 : a9 40 __ LDA #$40
1128 : 85 15 __ STA P8 
112a : a9 00 __ LDA #$00
112c : 85 16 __ STA P9 
112e : a5 56 __ LDA T2 + 1 
1130 : 85 18 __ STA P11 
.l8:
1132 : 20 4d 20 JSR $204d ; (fgets.s4 + 0)
1135 : ad 2e 4e LDA $4e2e ; (a + 0)
1138 : 85 53 __ STA T1 + 0 
113a : ad 2f 4e LDA $4e2f ; (a + 1)
113d : 85 54 __ STA T1 + 1 
113f : a5 1b __ LDA ACCU + 0 
1141 : 05 1c __ ORA ACCU + 1 
1143 : f0 61 __ BEQ $11a6 ; (load_vertex_data.s9 + 0)
.s14:
1145 : a5 53 __ LDA T1 + 0 
1147 : 0a __ __ ASL
1148 : a8 __ __ TAY
1149 : a9 3f __ LDA #$3f
114b : 85 0d __ STA P0 
114d : a9 cf __ LDA #$cf
114f : 85 0e __ STA P1 
1151 : a5 54 __ LDA T1 + 1 
1153 : 2a __ __ ROL
1154 : aa __ __ TAX
1155 : 98 __ __ TYA
1156 : 38 __ __ SEC
1157 : e9 02 __ SBC #$02
1159 : 85 57 __ STA T4 + 0 
115b : 8a __ __ TXA
115c : e9 00 __ SBC #$00
115e : 85 58 __ STA T4 + 1 
1160 : ad 20 4e LDA $4e20 ; (x_pct + 0)
1163 : 18 __ __ CLC
1164 : 65 57 __ ADC T4 + 0 
1166 : 85 0f __ STA P2 
1168 : ad 21 4e LDA $4e21 ; (x_pct + 1)
116b : 65 58 __ ADC T4 + 1 
116d : 85 10 __ STA P3 
116f : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
1172 : a5 1b __ LDA ACCU + 0 
1174 : 85 0d __ STA P0 
1176 : a5 1c __ LDA ACCU + 1 
1178 : 85 0e __ STA P1 
117a : ad 22 4e LDA $4e22 ; (y_pct + 0)
117d : 18 __ __ CLC
117e : 65 57 __ ADC T4 + 0 
1180 : 85 0f __ STA P2 
1182 : ad 23 4e LDA $4e23 ; (y_pct + 1)
1185 : 65 58 __ ADC T4 + 1 
1187 : 85 10 __ STA P3 
1189 : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
118c : a5 1b __ LDA ACCU + 0 
118e : 85 0d __ STA P0 
1190 : a5 1c __ LDA ACCU + 1 
1192 : 85 0e __ STA P1 
1194 : ad 24 4e LDA $4e24 ; (z_pct + 0)
1197 : 18 __ __ CLC
1198 : 65 57 __ ADC T4 + 0 
119a : 85 0f __ STA P2 
119c : ad 25 4e LDA $4e25 ; (z_pct + 1)
119f : 65 58 __ ADC T4 + 1 
11a1 : 85 10 __ STA P3 
11a3 : 20 42 21 JSR $2142 ; (parse_next_int.s4 + 0)
.s9:
11a6 : 18 __ __ CLC
11a7 : a5 53 __ LDA T1 + 0 
11a9 : 69 01 __ ADC #$01
11ab : 8d 2e 4e STA $4e2e ; (a + 0)
11ae : a5 54 __ LDA T1 + 1 
11b0 : 69 00 __ ADC #$00
11b2 : 8d 2f 4e STA $4e2f ; (a + 1)
11b5 : ad 19 4e LDA $4e19 ; (c + 1)
11b8 : cd 2f 4e CMP $4e2f ; (a + 1)
11bb : d0 09 __ BNE $11c6 ; (load_vertex_data.s13 + 0)
.s10:
11bd : ad 18 4e LDA $4e18 ; (c + 0)
11c0 : cd 2e 4e CMP $4e2e ; (a + 0)
11c3 : 4c cb 11 JMP $11cb ; (load_vertex_data.s11 + 0)
.s13:
11c6 : 4d 2f 4e EOR $4e2f ; (a + 1)
11c9 : 30 1c __ BMI $11e7 ; (load_vertex_data.s12 + 0)
.s11:
11cb : 90 03 __ BCC $11d0 ; (load_vertex_data.s7 + 0)
11cd : 4c 32 11 JMP $1132 ; (load_vertex_data.l8 + 0)
.s7:
11d0 : a0 00 __ LDY #$00
11d2 : b1 55 __ LDA (T2 + 0),y 
11d4 : 20 35 22 JSR $2235 ; (krnio_close.s4 + 0)
11d7 : a9 00 __ LDA #$00
11d9 : a8 __ __ TAY
11da : 91 55 __ STA (T2 + 0),y 
.s3:
11dc : a2 05 __ LDX #$05
11de : bd 37 cf LDA $cf37,x ; (load_vertex_data@stack + 0)
11e1 : 95 53 __ STA T1 + 0,x 
11e3 : ca __ __ DEX
11e4 : 10 f8 __ BPL $11de ; (load_vertex_data.s3 + 2)
11e6 : 60 __ __ RTS
.s12:
11e7 : b0 e7 __ BCS $11d0 ; (load_vertex_data.s7 + 0)
11e9 : 4c 32 11 JMP $1132 ; (load_vertex_data.l8 + 0)
--------------------------------------------------------------------
fopen: ; fopen(const u8*,const u8*)->struct FILE*
;  40, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
11ec : a2 00 __ LDX #$00
.l5:
11ee : 8a __ __ TXA
11ef : a8 __ __ TAY
11f0 : 18 __ __ CLC
11f1 : 69 00 __ ADC #$00
11f3 : 85 49 __ STA T6 + 0 
11f5 : a9 4e __ LDA #$4e
11f7 : 69 00 __ ADC #$00
11f9 : 85 4a __ STA T6 + 1 
11fb : bd 00 4e LDA $4e00,x ; (files[0].fnum + 0)
11fe : f0 0c __ BEQ $120c ; (fopen.s6 + 0)
.s36:
1200 : e8 __ __ INX
1201 : e0 08 __ CPX #$08
1203 : 90 e9 __ BCC $11ee ; (fopen.l5 + 0)
.s19:
1205 : a9 00 __ LDA #$00
1207 : 85 1b __ STA ACCU + 0 
.s3:
1209 : 85 1c __ STA ACCU + 1 
120b : 60 __ __ RTS
.s6:
120c : 84 48 __ STY T5 + 0 
120e : 85 1b __ STA ACCU + 0 
1210 : 85 1c __ STA ACCU + 1 
1212 : 85 43 __ STA T1 + 0 
1214 : a9 08 __ LDA #$08
1216 : 85 4c __ STA T10 + 0 
1218 : d0 16 __ BNE $1230 ; (fopen.l7 + 0)
.s35:
121a : a5 43 __ LDA T1 + 0 
121c : 0a __ __ ASL
121d : 0a __ __ ASL
121e : 18 __ __ CLC
121f : 65 43 __ ADC T1 + 0 
1221 : 0a __ __ ASL
1222 : 85 43 __ STA T1 + 0 
1224 : b1 10 __ LDA (P3),y ; (fname + 0)
1226 : 38 __ __ SEC
1227 : e9 30 __ SBC #$30
1229 : 18 __ __ CLC
122a : 65 43 __ ADC T1 + 0 
122c : 85 43 __ STA T1 + 0 
122e : e6 1b __ INC ACCU + 0 
.l7:
1230 : a4 1b __ LDY ACCU + 0 
1232 : b1 10 __ LDA (P3),y ; (fname + 0)
1234 : c9 30 __ CMP #$30
1236 : 90 06 __ BCC $123e ; (fopen.s8 + 0)
.s27:
1238 : c9 3a __ CMP #$3a
123a : 90 de __ BCC $121a ; (fopen.s35 + 0)
.s28:
123c : f0 06 __ BEQ $1244 ; (fopen.s29 + 0)
.s8:
123e : a9 00 __ LDA #$00
1240 : 85 4b __ STA T7 + 0 
1242 : f0 3c __ BEQ $1280 ; (fopen.s9 + 0)
.s29:
1244 : c8 __ __ INY
1245 : 84 4b __ STY T7 + 0 
1247 : 84 1b __ STY ACCU + 0 
1249 : a5 43 __ LDA T1 + 0 
124b : 85 1c __ STA ACCU + 1 
124d : a9 00 __ LDA #$00
124f : b0 16 __ BCS $1267 ; (fopen.l30 + 0)
.s34:
1251 : a5 46 __ LDA T3 + 0 
1253 : 0a __ __ ASL
1254 : 0a __ __ ASL
1255 : 18 __ __ CLC
1256 : 65 46 __ ADC T3 + 0 
1258 : 0a __ __ ASL
1259 : 85 46 __ STA T3 + 0 
125b : b1 10 __ LDA (P3),y ; (fname + 0)
125d : 38 __ __ SEC
125e : e9 30 __ SBC #$30
1260 : 18 __ __ CLC
1261 : 65 46 __ ADC T3 + 0 
1263 : e6 1b __ INC ACCU + 0 
1265 : a4 1b __ LDY ACCU + 0 
.l30:
1267 : 85 46 __ STA T3 + 0 
1269 : b1 10 __ LDA (P3),y ; (fname + 0)
126b : c9 30 __ CMP #$30
126d : 90 11 __ BCC $1280 ; (fopen.s9 + 0)
.s31:
126f : c9 3a __ CMP #$3a
1271 : 90 de __ BCC $1251 ; (fopen.s34 + 0)
.s32:
1273 : d0 0b __ BNE $1280 ; (fopen.s9 + 0)
.s33:
1275 : a5 43 __ LDA T1 + 0 
1277 : 85 4c __ STA T10 + 0 
1279 : a5 46 __ LDA T3 + 0 
127b : 85 1c __ STA ACCU + 1 
127d : c8 __ __ INY
127e : 84 4b __ STY T7 + 0 
.s9:
1280 : a9 b5 __ LDA #$b5
1282 : 85 43 __ STA T1 + 0 
1284 : a9 cf __ LDA #$cf
1286 : 85 44 __ STA T1 + 1 
1288 : a5 1c __ LDA ACCU + 1 
128a : c9 0a __ CMP #$0a
128c : b0 14 __ BCS $12a2 ; (fopen.s26 + 0)
.s10:
128e : a9 b5 __ LDA #$b5
1290 : 85 46 __ STA T3 + 0 
1292 : a9 cf __ LDA #$cf
1294 : 85 47 __ STA T3 + 1 
1296 : a9 b4 __ LDA #$b4
1298 : 85 43 __ STA T1 + 0 
129a : a9 cf __ LDA #$cf
129c : 85 44 __ STA T1 + 1 
129e : a2 03 __ LDX #$03
12a0 : 90 21 __ BCC $12c3 ; (fopen.s11 + 0)
.s26:
12a2 : 85 1b __ STA ACCU + 0 
12a4 : a9 00 __ LDA #$00
12a6 : 85 1c __ STA ACCU + 1 
12a8 : a9 0a __ LDA #$0a
12aa : 20 c6 49 JSR $49c6 ; (divmod + 53)
12ad : a5 05 __ LDA WORK + 2 
12af : 85 1c __ STA ACCU + 1 
12b1 : 18 __ __ CLC
12b2 : a5 1b __ LDA ACCU + 0 
12b4 : 69 30 __ ADC #$30
12b6 : 8d b4 cf STA $cfb4 ; (cbmname[0] + 1)
12b9 : a9 b6 __ LDA #$b6
12bb : 85 46 __ STA T3 + 0 
12bd : a9 cf __ LDA #$cf
12bf : 85 47 __ STA T3 + 1 
12c1 : a2 04 __ LDX #$04
.s11:
12c3 : a9 3a __ LDA #$3a
12c5 : a0 00 __ LDY #$00
12c7 : 91 46 __ STA (T3 + 0),y 
12c9 : 18 __ __ CLC
12ca : a5 1c __ LDA ACCU + 1 
12cc : 69 30 __ ADC #$30
12ce : 91 43 __ STA (T1 + 0),y 
12d0 : a9 01 __ LDA #$01
12d2 : 85 46 __ STA T3 + 0 
12d4 : a4 4b __ LDY T7 + 0 
12d6 : b1 10 __ LDA (P3),y ; (fname + 0)
12d8 : f0 09 __ BEQ $12e3 ; (fopen.s12 + 0)
.l25:
12da : 9d b3 cf STA $cfb3,x ; (cbmname[0] + 0)
12dd : e8 __ __ INX
12de : c8 __ __ INY
12df : b1 10 __ LDA (P3),y ; (fname + 0)
12e1 : d0 f7 __ BNE $12da ; (fopen.l25 + 0)
.s12:
12e3 : a9 2c __ LDA #$2c
12e5 : 9d b3 cf STA $cfb3,x ; (cbmname[0] + 0)
12e8 : 9d b5 cf STA $cfb5,x ; (cbmname[0] + 2)
12eb : a9 53 __ LDA #$53
12ed : 9d b4 cf STA $cfb4,x ; (cbmname[0] + 1)
12f0 : a0 00 __ LDY #$00
12f2 : b1 12 __ LDA (P5),y ; (mode + 0)
12f4 : c9 77 __ CMP #$77
12f6 : f0 04 __ BEQ $12fc ; (fopen.s24 + 0)
.s13:
12f8 : c9 57 __ CMP #$57
12fa : d0 13 __ BNE $130f ; (fopen.s14 + 0)
.s24:
12fc : a9 57 __ LDA #$57
12fe : 9d b6 cf STA $cfb6,x ; (cbmname[0] + 3)
1301 : a9 40 __ LDA #$40
1303 : 8d b3 cf STA $cfb3 ; (cbmname[0] + 0)
1306 : 8a __ __ TXA
1307 : 69 03 __ ADC #$03
1309 : 85 45 __ STA T2 + 0 
130b : c6 46 __ DEC T3 + 0 
130d : f0 2a __ BEQ $1339 ; (fopen.s18 + 0)
.s14:
130f : c9 72 __ CMP #$72
1311 : f0 04 __ BEQ $1317 ; (fopen.s23 + 0)
.s15:
1313 : c9 52 __ CMP #$52
1315 : d0 0e __ BNE $1325 ; (fopen.s16 + 0)
.s23:
1317 : a9 52 __ LDA #$52
.s22:
1319 : 9d b6 cf STA $cfb6,x ; (cbmname[0] + 3)
131c : 8a __ __ TXA
131d : 18 __ __ CLC
131e : 69 04 __ ADC #$04
1320 : 85 45 __ STA T2 + 0 
1322 : 4c 39 13 JMP $1339 ; (fopen.s18 + 0)
.s16:
1325 : c9 61 __ CMP #$61
1327 : f0 0c __ BEQ $1335 ; (fopen.s21 + 0)
.s17:
1329 : 8a __ __ TXA
132a : 18 __ __ CLC
132b : 69 03 __ ADC #$03
132d : 85 45 __ STA T2 + 0 
132f : b1 12 __ LDA (P5),y ; (mode + 0)
1331 : c9 41 __ CMP #$41
1333 : d0 04 __ BNE $1339 ; (fopen.s18 + 0)
.s21:
1335 : a9 41 __ LDA #$41
1337 : d0 e0 __ BNE $1319 ; (fopen.s22 + 0)
.s18:
1339 : 98 __ __ TYA
133a : a6 45 __ LDX T2 + 0 
133c : 9d b3 cf STA $cfb3,x ; (cbmname[0] + 0)
133f : 18 __ __ CLC
1340 : a9 b3 __ LDA #$b3
1342 : 65 46 __ ADC T3 + 0 
1344 : 85 0d __ STA P0 
1346 : a9 cf __ LDA #$cf
1348 : 69 00 __ ADC #$00
134a : 85 0e __ STA P1 
134c : 20 76 13 JSR $1376 ; (krnio_setnam.s4 + 0)
134f : a5 4c __ LDA T10 + 0 
1351 : 85 0e __ STA P1 
1353 : 18 __ __ CLC
1354 : a5 48 __ LDA T5 + 0 
1356 : 69 02 __ ADC #$02
1358 : 85 48 __ STA T5 + 0 
135a : 85 0d __ STA P0 
135c : 85 0f __ STA P2 
135e : 20 8c 13 JSR $138c ; (krnio_open.s4 + 0)
1361 : aa __ __ TAX
1362 : d0 03 __ BNE $1367 ; (fopen.s20 + 0)
1364 : 4c 05 12 JMP $1205 ; (fopen.s19 + 0)
.s20:
1367 : a5 48 __ LDA T5 + 0 
1369 : a0 00 __ LDY #$00
136b : 91 49 __ STA (T6 + 0),y 
136d : a5 49 __ LDA T6 + 0 
136f : 85 1b __ STA ACCU + 0 
1371 : a5 4a __ LDA T6 + 1 
1373 : 85 1c __ STA ACCU + 1 
1375 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
1376 : a5 0d __ LDA P0 
1378 : 05 0e __ ORA P1 
137a : f0 08 __ BEQ $1384 ; (krnio_setnam.s4 + 14)
137c : a0 ff __ LDY #$ff
137e : c8 __ __ INY
137f : b1 0d __ LDA (P0),y 
1381 : d0 fb __ BNE $137e ; (krnio_setnam.s4 + 8)
1383 : 98 __ __ TYA
1384 : a6 0d __ LDX P0 
1386 : a4 0e __ LDY P1 
1388 : 20 bd ff JSR $ffbd 
.s3:
138b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
138c : a9 00 __ LDA #$00
138e : a6 0d __ LDX P0 ; (fnum + 0)
1390 : 9d 08 4e STA $4e08,x ; (krnio_pstatus[0] + 0)
1393 : a9 00 __ LDA #$00
1395 : 85 1b __ STA ACCU + 0 
1397 : 85 1c __ STA ACCU + 1 
1399 : a5 0d __ LDA P0 ; (fnum + 0)
139b : a6 0e __ LDX P1 
139d : a4 0f __ LDY P2 
139f : 20 ba ff JSR $ffba 
13a2 : 20 c0 ff JSR $ffc0 
13a5 : 90 08 __ BCC $13af ; (krnio_open.s4 + 35)
13a7 : a5 0d __ LDA P0 ; (fnum + 0)
13a9 : 20 c3 ff JSR $ffc3 
13ac : 4c b3 13 JMP $13b3 ; (krnio_open.s4 + 39)
13af : a9 01 __ LDA #$01
13b1 : 85 1b __ STA ACCU + 0 
13b3 : a5 1b __ LDA ACCU + 0 
13b5 : f0 02 __ BEQ $13b9 ; (krnio_open.s3 + 0)
.s5:
13b7 : a9 01 __ LDA #$01
.s3:
13b9 : 60 __ __ RTS
--------------------------------------------------------------------
13ba : __ __ __ BYT 56 45 52 54 45 58 2c 53 2c 52 00                : VERTEX,S,R.
--------------------------------------------------------------------
13c5 : __ __ __ BYT 72 00                                           : r.
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
13c7 : a9 01 __ LDA #$01
13c9 : 8d da cf STA $cfda ; (sstack + 7)
13cc : a9 7f __ LDA #$7f
13ce : 8d d4 cf STA $cfd4 ; (sstack + 1)
13d1 : a9 cf __ LDA #$cf
13d3 : 8d d5 cf STA $cfd5 ; (sstack + 2)
13d6 : ad db cf LDA $cfdb ; (sstack + 8)
13d9 : 8d d6 cf STA $cfd6 ; (sstack + 3)
13dc : ad dc cf LDA $cfdc ; (sstack + 9)
13df : 8d d7 cf STA $cfd7 ; (sstack + 4)
13e2 : a9 dd __ LDA #$dd
13e4 : 8d d8 cf STA $cfd8 ; (sstack + 5)
13e7 : a9 cf __ LDA #$cf
13e9 : 8d d9 cf STA $cfd9 ; (sstack + 6)
13ec : 4c ef 13 JMP $13ef ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s1:
13ef : a2 09 __ LDX #$09
13f1 : b5 53 __ LDA T1 + 0,x 
13f3 : 9d b1 cf STA $cfb1,x ; (sformat@stack + 0)
13f6 : ca __ __ DEX
13f7 : 10 f8 __ BPL $13f1 ; (sformat.s1 + 2)
.s4:
13f9 : ad d6 cf LDA $cfd6 ; (sstack + 3)
13fc : 85 55 __ STA T3 + 0 
13fe : a9 00 __ LDA #$00
1400 : 85 5b __ STA T6 + 0 
1402 : ad d7 cf LDA $cfd7 ; (sstack + 4)
1405 : 85 56 __ STA T3 + 1 
1407 : ad d4 cf LDA $cfd4 ; (sstack + 1)
140a : 85 57 __ STA T4 + 0 
140c : ad d5 cf LDA $cfd5 ; (sstack + 2)
140f : 85 58 __ STA T4 + 1 
.l5:
1411 : a0 00 __ LDY #$00
1413 : b1 55 __ LDA (T3 + 0),y 
1415 : d0 35 __ BNE $144c ; (sformat.s10 + 0)
.s6:
1417 : a4 5b __ LDY T6 + 0 
1419 : 91 57 __ STA (T4 + 0),y 
141b : f0 28 __ BEQ $1445 ; (sformat.s93 + 0)
.s7:
141d : ad da cf LDA $cfda ; (sstack + 7)
1420 : d0 18 __ BNE $143a ; (sformat.s9 + 0)
.s8:
1422 : 98 __ __ TYA
1423 : 18 __ __ CLC
1424 : 65 57 __ ADC T4 + 0 
1426 : aa __ __ TAX
1427 : a5 58 __ LDA T4 + 1 
1429 : 69 00 __ ADC #$00
.s3:
142b : 86 1b __ STX ACCU + 0 ; (buff + 1)
142d : 85 1c __ STA ACCU + 1 ; (fmt + 0)
142f : a2 09 __ LDX #$09
1431 : bd b1 cf LDA $cfb1,x ; (sformat@stack + 0)
1434 : 95 53 __ STA T1 + 0,x 
1436 : ca __ __ DEX
1437 : 10 f8 __ BPL $1431 ; (sformat.s3 + 6)
1439 : 60 __ __ RTS
.s9:
143a : a5 57 __ LDA T4 + 0 
143c : 85 0e __ STA P1 
143e : a5 58 __ LDA T4 + 1 
1440 : 85 0f __ STA P2 
1442 : 20 36 18 JSR $1836 ; (puts.l4 + 0)
.s93:
1445 : a5 58 __ LDA T4 + 1 
1447 : a6 57 __ LDX T4 + 0 
1449 : 4c 2b 14 JMP $142b ; (sformat.s3 + 0)
.s10:
144c : c9 25 __ CMP #$25
144e : f0 3e __ BEQ $148e ; (sformat.s15 + 0)
.s11:
1450 : a4 5b __ LDY T6 + 0 
1452 : 91 57 __ STA (T4 + 0),y 
1454 : e6 55 __ INC T3 + 0 
1456 : d0 02 __ BNE $145a ; (sformat.s115 + 0)
.s114:
1458 : e6 56 __ INC T3 + 1 
.s115:
145a : c8 __ __ INY
145b : 84 5b __ STY T6 + 0 
145d : 98 __ __ TYA
145e : c0 28 __ CPY #$28
1460 : 90 af __ BCC $1411 ; (sformat.l5 + 0)
.s12:
1462 : 85 43 __ STA T0 + 0 
1464 : a9 00 __ LDA #$00
1466 : 85 5b __ STA T6 + 0 
1468 : ad da cf LDA $cfda ; (sstack + 7)
146b : f0 14 __ BEQ $1481 ; (sformat.s13 + 0)
.s14:
146d : a5 57 __ LDA T4 + 0 
146f : 85 0e __ STA P1 
1471 : a5 58 __ LDA T4 + 1 
1473 : 85 0f __ STA P2 
1475 : a9 00 __ LDA #$00
1477 : a4 43 __ LDY T0 + 0 
1479 : 91 0e __ STA (P1),y 
147b : 20 36 18 JSR $1836 ; (puts.l4 + 0)
147e : 4c 11 14 JMP $1411 ; (sformat.l5 + 0)
.s13:
1481 : 18 __ __ CLC
1482 : a5 57 __ LDA T4 + 0 
1484 : 65 43 __ ADC T0 + 0 
1486 : 85 57 __ STA T4 + 0 
1488 : 90 87 __ BCC $1411 ; (sformat.l5 + 0)
.s116:
148a : e6 58 __ INC T4 + 1 
148c : b0 83 __ BCS $1411 ; (sformat.l5 + 0)
.s15:
148e : a5 5b __ LDA T6 + 0 
1490 : f0 27 __ BEQ $14b9 ; (sformat.s16 + 0)
.s88:
1492 : 84 5b __ STY T6 + 0 
1494 : 85 43 __ STA T0 + 0 
1496 : ad da cf LDA $cfda ; (sstack + 7)
1499 : f0 13 __ BEQ $14ae ; (sformat.s89 + 0)
.s90:
149b : a5 57 __ LDA T4 + 0 
149d : 85 0e __ STA P1 
149f : a5 58 __ LDA T4 + 1 
14a1 : 85 0f __ STA P2 
14a3 : 98 __ __ TYA
14a4 : a4 43 __ LDY T0 + 0 
14a6 : 91 0e __ STA (P1),y 
14a8 : 20 36 18 JSR $1836 ; (puts.l4 + 0)
14ab : 4c b9 14 JMP $14b9 ; (sformat.s16 + 0)
.s89:
14ae : 18 __ __ CLC
14af : a5 57 __ LDA T4 + 0 
14b1 : 65 43 __ ADC T0 + 0 
14b3 : 85 57 __ STA T4 + 0 
14b5 : 90 02 __ BCC $14b9 ; (sformat.s16 + 0)
.s113:
14b7 : e6 58 __ INC T4 + 1 
.s16:
14b9 : a9 00 __ LDA #$00
14bb : 8d c0 cf STA $cfc0 ; (si.sign + 0)
14be : 8d c1 cf STA $cfc1 ; (si.left + 0)
14c1 : 8d c2 cf STA $cfc2 ; (si.prefix + 0)
14c4 : a0 01 __ LDY #$01
14c6 : b1 55 __ LDA (T3 + 0),y 
14c8 : a2 20 __ LDX #$20
14ca : 8e bb cf STX $cfbb ; (si.fill + 0)
14cd : a2 00 __ LDX #$00
14cf : 8e bc cf STX $cfbc ; (si.width + 0)
14d2 : ca __ __ DEX
14d3 : 8e bd cf STX $cfbd ; (si.precision + 0)
14d6 : a2 0a __ LDX #$0a
14d8 : 8e bf cf STX $cfbf ; (si.base + 0)
14db : aa __ __ TAX
14dc : a9 02 __ LDA #$02
14de : d0 07 __ BNE $14e7 ; (sformat.l17 + 0)
.s84:
14e0 : a0 00 __ LDY #$00
14e2 : b1 55 __ LDA (T3 + 0),y 
14e4 : aa __ __ TAX
14e5 : a9 01 __ LDA #$01
.l17:
14e7 : 18 __ __ CLC
14e8 : 65 55 __ ADC T3 + 0 
14ea : 85 55 __ STA T3 + 0 
14ec : 90 02 __ BCC $14f0 ; (sformat.s104 + 0)
.s103:
14ee : e6 56 __ INC T3 + 1 
.s104:
14f0 : e0 2b __ CPX #$2b
14f2 : d0 07 __ BNE $14fb ; (sformat.s18 + 0)
.s87:
14f4 : a9 01 __ LDA #$01
14f6 : 8d c0 cf STA $cfc0 ; (si.sign + 0)
14f9 : d0 e5 __ BNE $14e0 ; (sformat.s84 + 0)
.s18:
14fb : 8a __ __ TXA
14fc : e0 30 __ CPX #$30
14fe : d0 05 __ BNE $1505 ; (sformat.s19 + 0)
.s86:
1500 : 8d bb cf STA $cfbb ; (si.fill + 0)
1503 : f0 db __ BEQ $14e0 ; (sformat.s84 + 0)
.s19:
1505 : c9 23 __ CMP #$23
1507 : d0 07 __ BNE $1510 ; (sformat.s20 + 0)
.s85:
1509 : a9 01 __ LDA #$01
150b : 8d c2 cf STA $cfc2 ; (si.prefix + 0)
150e : d0 d0 __ BNE $14e0 ; (sformat.s84 + 0)
.s20:
1510 : c9 2d __ CMP #$2d
1512 : d0 07 __ BNE $151b ; (sformat.s21 + 0)
.s83:
1514 : a9 01 __ LDA #$01
1516 : 8d c1 cf STA $cfc1 ; (si.left + 0)
1519 : d0 c5 __ BNE $14e0 ; (sformat.s84 + 0)
.s21:
151b : 85 47 __ STA T2 + 0 
151d : c9 30 __ CMP #$30
151f : 90 4a __ BCC $156b ; (sformat.s22 + 0)
.s79:
1521 : e0 3a __ CPX #$3a
1523 : 90 03 __ BCC $1528 ; (sformat.s80 + 0)
1525 : 4c a9 15 JMP $15a9 ; (sformat.s23 + 0)
.s80:
1528 : a9 00 __ LDA #$00
152a : e0 3a __ CPX #$3a
152c : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
152e : b0 34 __ BCS $1564 ; (sformat.s102 + 0)
.s117:
1530 : 85 43 __ STA T0 + 0 
1532 : a4 55 __ LDY T3 + 0 
1534 : 85 55 __ STA T3 + 0 
.l82:
1536 : a5 43 __ LDA T0 + 0 
1538 : 0a __ __ ASL
1539 : 85 1b __ STA ACCU + 0 ; (buff + 1)
153b : a9 00 __ LDA #$00
153d : 2a __ __ ROL
153e : 06 1b __ ASL ACCU + 0 ; (buff + 1)
1540 : 2a __ __ ROL
1541 : aa __ __ TAX
1542 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1544 : 65 43 __ ADC T0 + 0 
1546 : 0a __ __ ASL
1547 : 18 __ __ CLC
1548 : 65 47 __ ADC T2 + 0 
154a : 38 __ __ SEC
154b : e9 30 __ SBC #$30
154d : 85 43 __ STA T0 + 0 
154f : b1 55 __ LDA (T3 + 0),y 
1551 : 85 47 __ STA T2 + 0 
1553 : c8 __ __ INY
1554 : d0 02 __ BNE $1558 ; (sformat.s112 + 0)
.s111:
1556 : e6 56 __ INC T3 + 1 
.s112:
1558 : c9 30 __ CMP #$30
155a : 90 04 __ BCC $1560 ; (sformat.s118 + 0)
.s81:
155c : c9 3a __ CMP #$3a
155e : 90 d6 __ BCC $1536 ; (sformat.l82 + 0)
.s118:
1560 : 84 55 __ STY T3 + 0 
1562 : a5 43 __ LDA T0 + 0 
.s102:
1564 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
1566 : 8d bc cf STA $cfbc ; (si.width + 0)
1569 : a5 47 __ LDA T2 + 0 
.s22:
156b : c9 2e __ CMP #$2e
156d : d0 3a __ BNE $15a9 ; (sformat.s23 + 0)
.s75:
156f : a9 00 __ LDA #$00
1571 : a8 __ __ TAY
1572 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
1574 : 4c 8e 15 JMP $158e ; (sformat.l76 + 0)
.s78:
1577 : a5 43 __ LDA T0 + 0 
1579 : 0a __ __ ASL
157a : 85 1b __ STA ACCU + 0 ; (buff + 1)
157c : 98 __ __ TYA
157d : 2a __ __ ROL
157e : 06 1b __ ASL ACCU + 0 ; (buff + 1)
1580 : 2a __ __ ROL
1581 : aa __ __ TAX
1582 : 18 __ __ CLC
1583 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1585 : 65 43 __ ADC T0 + 0 
1587 : 0a __ __ ASL
1588 : 18 __ __ CLC
1589 : 65 47 __ ADC T2 + 0 
158b : 38 __ __ SEC
158c : e9 30 __ SBC #$30
.l76:
158e : 85 43 __ STA T0 + 0 
1590 : b1 55 __ LDA (T3 + 0),y 
1592 : 85 47 __ STA T2 + 0 
1594 : e6 55 __ INC T3 + 0 
1596 : d0 02 __ BNE $159a ; (sformat.s106 + 0)
.s105:
1598 : e6 56 __ INC T3 + 1 
.s106:
159a : c9 30 __ CMP #$30
159c : 90 04 __ BCC $15a2 ; (sformat.s101 + 0)
.s77:
159e : c9 3a __ CMP #$3a
15a0 : 90 d5 __ BCC $1577 ; (sformat.s78 + 0)
.s101:
15a2 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
15a4 : a6 43 __ LDX T0 + 0 
15a6 : 8e bd cf STX $cfbd ; (si.precision + 0)
.s23:
15a9 : c9 64 __ CMP #$64
15ab : f0 0c __ BEQ $15b9 ; (sformat.s74 + 0)
.s24:
15ad : c9 44 __ CMP #$44
15af : f0 08 __ BEQ $15b9 ; (sformat.s74 + 0)
.s25:
15b1 : c9 69 __ CMP #$69
15b3 : f0 04 __ BEQ $15b9 ; (sformat.s74 + 0)
.s26:
15b5 : c9 49 __ CMP #$49
15b7 : d0 05 __ BNE $15be ; (sformat.s27 + 0)
.s74:
15b9 : a9 01 __ LDA #$01
15bb : 4c fa 17 JMP $17fa ; (sformat.s73 + 0)
.s27:
15be : c9 75 __ CMP #$75
15c0 : d0 03 __ BNE $15c5 ; (sformat.s28 + 0)
15c2 : 4c f8 17 JMP $17f8 ; (sformat.s119 + 0)
.s28:
15c5 : c9 55 __ CMP #$55
15c7 : f0 f9 __ BEQ $15c2 ; (sformat.s27 + 4)
.s29:
15c9 : c9 78 __ CMP #$78
15cb : f0 04 __ BEQ $15d1 ; (sformat.s72 + 0)
.s30:
15cd : c9 58 __ CMP #$58
15cf : d0 0f __ BNE $15e0 ; (sformat.s31 + 0)
.s72:
15d1 : 29 e0 __ AND #$e0
15d3 : 09 01 __ ORA #$01
15d5 : 8d be cf STA $cfbe ; (si.cha + 0)
15d8 : a9 10 __ LDA #$10
15da : 8d bf cf STA $cfbf ; (si.base + 0)
15dd : 4c f8 17 JMP $17f8 ; (sformat.s119 + 0)
.s31:
15e0 : c9 6c __ CMP #$6c
15e2 : d0 03 __ BNE $15e7 ; (sformat.s32 + 0)
15e4 : 4c 69 17 JMP $1769 ; (sformat.s60 + 0)
.s32:
15e7 : c9 4c __ CMP #$4c
15e9 : f0 f9 __ BEQ $15e4 ; (sformat.s31 + 4)
.s33:
15eb : c9 66 __ CMP #$66
15ed : f0 14 __ BEQ $1603 ; (sformat.s59 + 0)
.s34:
15ef : c9 67 __ CMP #$67
15f1 : f0 10 __ BEQ $1603 ; (sformat.s59 + 0)
.s35:
15f3 : c9 65 __ CMP #$65
15f5 : f0 0c __ BEQ $1603 ; (sformat.s59 + 0)
.s36:
15f7 : c9 46 __ CMP #$46
15f9 : f0 08 __ BEQ $1603 ; (sformat.s59 + 0)
.s37:
15fb : c9 47 __ CMP #$47
15fd : f0 04 __ BEQ $1603 ; (sformat.s59 + 0)
.s38:
15ff : c9 45 __ CMP #$45
1601 : d0 5c __ BNE $165f ; (sformat.s39 + 0)
.s59:
1603 : a5 57 __ LDA T4 + 0 
1605 : 85 13 __ STA P6 
1607 : a5 58 __ LDA T4 + 1 
1609 : 85 14 __ STA P7 
160b : a5 47 __ LDA T2 + 0 
160d : 29 e0 __ AND #$e0
160f : 09 01 __ ORA #$01
1611 : 8d be cf STA $cfbe ; (si.cha + 0)
1614 : ad d8 cf LDA $cfd8 ; (sstack + 5)
1617 : 85 59 __ STA T5 + 0 
1619 : a9 bb __ LDA #$bb
161b : 85 11 __ STA P4 
161d : a9 cf __ LDA #$cf
161f : 85 12 __ STA P5 
1621 : ad d9 cf LDA $cfd9 ; (sstack + 6)
1624 : 85 5a __ STA T5 + 1 
1626 : a0 00 __ LDY #$00
1628 : b1 59 __ LDA (T5 + 0),y 
162a : 85 15 __ STA P8 
162c : c8 __ __ INY
162d : b1 59 __ LDA (T5 + 0),y 
162f : 85 16 __ STA P9 
1631 : c8 __ __ INY
1632 : b1 59 __ LDA (T5 + 0),y 
1634 : 85 17 __ STA P10 
1636 : c8 __ __ INY
1637 : b1 59 __ LDA (T5 + 0),y 
1639 : 85 18 __ STA P11 
163b : a5 47 __ LDA T2 + 0 
163d : ed be cf SBC $cfbe ; (si.cha + 0)
1640 : 18 __ __ CLC
1641 : 69 61 __ ADC #$61
1643 : 8d d3 cf STA $cfd3 ; (sstack + 0)
1646 : 20 13 1b JSR $1b13 ; (nformf.s1 + 0)
1649 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
164b : 85 5b __ STA T6 + 0 
164d : 18 __ __ CLC
164e : a5 59 __ LDA T5 + 0 
1650 : 69 04 __ ADC #$04
1652 : 8d d8 cf STA $cfd8 ; (sstack + 5)
1655 : a5 5a __ LDA T5 + 1 
1657 : 69 00 __ ADC #$00
1659 : 8d d9 cf STA $cfd9 ; (sstack + 6)
165c : 4c 11 14 JMP $1411 ; (sformat.l5 + 0)
.s39:
165f : c9 73 __ CMP #$73
1661 : f0 3b __ BEQ $169e ; (sformat.s47 + 0)
.s40:
1663 : c9 53 __ CMP #$53
1665 : f0 37 __ BEQ $169e ; (sformat.s47 + 0)
.s41:
1667 : c9 63 __ CMP #$63
1669 : f0 12 __ BEQ $167d ; (sformat.s46 + 0)
.s42:
166b : c9 43 __ CMP #$43
166d : f0 0e __ BEQ $167d ; (sformat.s46 + 0)
.s43:
166f : aa __ __ TAX
1670 : f0 ea __ BEQ $165c ; (sformat.s59 + 89)
.s44:
1672 : a0 00 __ LDY #$00
1674 : 91 57 __ STA (T4 + 0),y 
.s45:
1676 : a9 01 __ LDA #$01
.s94:
1678 : 85 5b __ STA T6 + 0 
167a : 4c 11 14 JMP $1411 ; (sformat.l5 + 0)
.s46:
167d : ad d8 cf LDA $cfd8 ; (sstack + 5)
1680 : 85 43 __ STA T0 + 0 
1682 : ad d9 cf LDA $cfd9 ; (sstack + 6)
1685 : 85 44 __ STA T0 + 1 
1687 : a0 00 __ LDY #$00
1689 : b1 43 __ LDA (T0 + 0),y 
168b : 91 57 __ STA (T4 + 0),y 
168d : a5 43 __ LDA T0 + 0 
168f : 69 01 __ ADC #$01
1691 : 8d d8 cf STA $cfd8 ; (sstack + 5)
1694 : a5 44 __ LDA T0 + 1 
1696 : 69 00 __ ADC #$00
1698 : 8d d9 cf STA $cfd9 ; (sstack + 6)
169b : 4c 76 16 JMP $1676 ; (sformat.s45 + 0)
.s47:
169e : ad d8 cf LDA $cfd8 ; (sstack + 5)
16a1 : 85 43 __ STA T0 + 0 
16a3 : 69 01 __ ADC #$01
16a5 : 8d d8 cf STA $cfd8 ; (sstack + 5)
16a8 : ad d9 cf LDA $cfd9 ; (sstack + 6)
16ab : 85 44 __ STA T0 + 1 
16ad : 69 00 __ ADC #$00
16af : 8d d9 cf STA $cfd9 ; (sstack + 6)
16b2 : a0 00 __ LDY #$00
16b4 : 84 5c __ STY T7 + 0 
16b6 : b1 43 __ LDA (T0 + 0),y 
16b8 : 85 1b __ STA ACCU + 0 ; (buff + 1)
16ba : 85 53 __ STA T1 + 0 
16bc : c8 __ __ INY
16bd : b1 43 __ LDA (T0 + 0),y 
16bf : 85 1c __ STA ACCU + 1 ; (fmt + 0)
16c1 : 85 54 __ STA T1 + 1 
16c3 : ad bc cf LDA $cfbc ; (si.width + 0)
16c6 : f0 0c __ BEQ $16d4 ; (sformat.s48 + 0)
.s98:
16c8 : 88 __ __ DEY
16c9 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
16cb : f0 05 __ BEQ $16d2 ; (sformat.s99 + 0)
.l58:
16cd : c8 __ __ INY
16ce : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
16d0 : d0 fb __ BNE $16cd ; (sformat.l58 + 0)
.s99:
16d2 : 84 5c __ STY T7 + 0 
.s48:
16d4 : ad c1 cf LDA $cfc1 ; (si.left + 0)
16d7 : 85 59 __ STA T5 + 0 
16d9 : d0 19 __ BNE $16f4 ; (sformat.s49 + 0)
.s96:
16db : a6 5c __ LDX T7 + 0 
16dd : ec bc cf CPX $cfbc ; (si.width + 0)
16e0 : a0 00 __ LDY #$00
16e2 : b0 0c __ BCS $16f0 ; (sformat.s97 + 0)
.l57:
16e4 : ad bb cf LDA $cfbb ; (si.fill + 0)
16e7 : 91 57 __ STA (T4 + 0),y 
16e9 : c8 __ __ INY
16ea : e8 __ __ INX
16eb : ec bc cf CPX $cfbc ; (si.width + 0)
16ee : 90 f4 __ BCC $16e4 ; (sformat.l57 + 0)
.s97:
16f0 : 86 5c __ STX T7 + 0 
16f2 : 84 5b __ STY T6 + 0 
.s49:
16f4 : ac da cf LDY $cfda ; (sstack + 7)
16f7 : d0 48 __ BNE $1741 ; (sformat.s54 + 0)
.s50:
16f9 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
16fb : f0 23 __ BEQ $1720 ; (sformat.s51 + 0)
.s53:
16fd : 18 __ __ CLC
16fe : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1700 : 69 01 __ ADC #$01
1702 : 85 43 __ STA T0 + 0 
1704 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
1706 : 69 00 __ ADC #$00
1708 : 85 44 __ STA T0 + 1 
170a : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l91:
170c : a4 5b __ LDY T6 + 0 
170e : 91 57 __ STA (T4 + 0),y 
1710 : a0 00 __ LDY #$00
1712 : b1 43 __ LDA (T0 + 0),y 
1714 : a8 __ __ TAY
1715 : e6 43 __ INC T0 + 0 
1717 : d0 02 __ BNE $171b ; (sformat.s110 + 0)
.s109:
1719 : e6 44 __ INC T0 + 1 
.s110:
171b : e6 5b __ INC T6 + 0 
171d : 98 __ __ TYA
171e : d0 ec __ BNE $170c ; (sformat.l91 + 0)
.s51:
1720 : a5 59 __ LDA T5 + 0 
1722 : d0 03 __ BNE $1727 ; (sformat.s95 + 0)
1724 : 4c 11 14 JMP $1411 ; (sformat.l5 + 0)
.s95:
1727 : a6 5c __ LDX T7 + 0 
1729 : ec bc cf CPX $cfbc ; (si.width + 0)
172c : a4 5b __ LDY T6 + 0 
172e : b0 0c __ BCS $173c ; (sformat.s100 + 0)
.l52:
1730 : ad bb cf LDA $cfbb ; (si.fill + 0)
1733 : 91 57 __ STA (T4 + 0),y 
1735 : c8 __ __ INY
1736 : e8 __ __ INX
1737 : ec bc cf CPX $cfbc ; (si.width + 0)
173a : 90 f4 __ BCC $1730 ; (sformat.l52 + 0)
.s100:
173c : 84 5b __ STY T6 + 0 
173e : 4c 11 14 JMP $1411 ; (sformat.l5 + 0)
.s54:
1741 : a4 5b __ LDY T6 + 0 
1743 : f0 11 __ BEQ $1756 ; (sformat.s55 + 0)
.s56:
1745 : a5 57 __ LDA T4 + 0 
1747 : 85 0e __ STA P1 
1749 : a5 58 __ LDA T4 + 1 
174b : 85 0f __ STA P2 
174d : a9 00 __ LDA #$00
174f : 85 5b __ STA T6 + 0 
1751 : 91 0e __ STA (P1),y 
1753 : 20 36 18 JSR $1836 ; (puts.l4 + 0)
.s55:
1756 : a5 53 __ LDA T1 + 0 
1758 : 85 0e __ STA P1 
175a : a5 54 __ LDA T1 + 1 
175c : 85 0f __ STA P2 
175e : 20 36 18 JSR $1836 ; (puts.l4 + 0)
1761 : ad c1 cf LDA $cfc1 ; (si.left + 0)
1764 : d0 c1 __ BNE $1727 ; (sformat.s95 + 0)
1766 : 4c 11 14 JMP $1411 ; (sformat.l5 + 0)
.s60:
1769 : ad d8 cf LDA $cfd8 ; (sstack + 5)
176c : 85 43 __ STA T0 + 0 
176e : 69 03 __ ADC #$03
1770 : 8d d8 cf STA $cfd8 ; (sstack + 5)
1773 : ad d9 cf LDA $cfd9 ; (sstack + 6)
1776 : 85 44 __ STA T0 + 1 
1778 : 69 00 __ ADC #$00
177a : 8d d9 cf STA $cfd9 ; (sstack + 6)
177d : a0 00 __ LDY #$00
177f : b1 55 __ LDA (T3 + 0),y 
1781 : aa __ __ TAX
1782 : e6 55 __ INC T3 + 0 
1784 : d0 02 __ BNE $1788 ; (sformat.s108 + 0)
.s107:
1786 : e6 56 __ INC T3 + 1 
.s108:
1788 : b1 43 __ LDA (T0 + 0),y 
178a : 85 1b __ STA ACCU + 0 ; (buff + 1)
178c : 85 11 __ STA P4 
178e : a0 01 __ LDY #$01
1790 : b1 43 __ LDA (T0 + 0),y 
1792 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
1794 : 85 12 __ STA P5 
1796 : c8 __ __ INY
1797 : b1 43 __ LDA (T0 + 0),y 
1799 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
179b : 85 13 __ STA P6 
179d : c8 __ __ INY
179e : b1 43 __ LDA (T0 + 0),y 
17a0 : 85 14 __ STA P7 
17a2 : e0 64 __ CPX #$64
17a4 : f0 0c __ BEQ $17b2 ; (sformat.s71 + 0)
.s61:
17a6 : e0 44 __ CPX #$44
17a8 : f0 08 __ BEQ $17b2 ; (sformat.s71 + 0)
.s62:
17aa : e0 69 __ CPX #$69
17ac : f0 04 __ BEQ $17b2 ; (sformat.s71 + 0)
.s63:
17ae : e0 49 __ CPX #$49
17b0 : d0 1c __ BNE $17ce ; (sformat.s64 + 0)
.s71:
17b2 : a9 01 __ LDA #$01
.s92:
17b4 : 85 15 __ STA P8 
.s69:
17b6 : a5 57 __ LDA T4 + 0 
17b8 : 85 0f __ STA P2 
17ba : a5 58 __ LDA T4 + 1 
17bc : 85 10 __ STA P3 
17be : a9 bb __ LDA #$bb
17c0 : 85 0d __ STA P0 
17c2 : a9 cf __ LDA #$cf
17c4 : 85 0e __ STA P1 
17c6 : 20 c8 19 JSR $19c8 ; (nforml.s4 + 0)
17c9 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
17cb : 4c 78 16 JMP $1678 ; (sformat.s94 + 0)
.s64:
17ce : e0 75 __ CPX #$75
17d0 : f0 04 __ BEQ $17d6 ; (sformat.s70 + 0)
.s65:
17d2 : e0 55 __ CPX #$55
17d4 : d0 04 __ BNE $17da ; (sformat.s66 + 0)
.s70:
17d6 : a9 00 __ LDA #$00
17d8 : f0 da __ BEQ $17b4 ; (sformat.s92 + 0)
.s66:
17da : e0 78 __ CPX #$78
17dc : f0 06 __ BEQ $17e4 ; (sformat.s68 + 0)
.s67:
17de : 85 1e __ STA ACCU + 3 ; (fps + 0)
17e0 : e0 58 __ CPX #$58
17e2 : d0 82 __ BNE $1766 ; (sformat.s55 + 16)
.s68:
17e4 : a9 10 __ LDA #$10
17e6 : 8d bf cf STA $cfbf ; (si.base + 0)
17e9 : a9 00 __ LDA #$00
17eb : 85 15 __ STA P8 
17ed : 8a __ __ TXA
17ee : 29 e0 __ AND #$e0
17f0 : 09 01 __ ORA #$01
17f2 : 8d be cf STA $cfbe ; (si.cha + 0)
17f5 : 4c b6 17 JMP $17b6 ; (sformat.s69 + 0)
.s119:
17f8 : a9 00 __ LDA #$00
.s73:
17fa : 85 13 __ STA P6 
17fc : a5 57 __ LDA T4 + 0 
17fe : 85 0f __ STA P2 
1800 : a5 58 __ LDA T4 + 1 
1802 : 85 10 __ STA P3 
1804 : ad d8 cf LDA $cfd8 ; (sstack + 5)
1807 : 85 43 __ STA T0 + 0 
1809 : ad d9 cf LDA $cfd9 ; (sstack + 6)
180c : 85 44 __ STA T0 + 1 
180e : a0 00 __ LDY #$00
1810 : b1 43 __ LDA (T0 + 0),y 
1812 : 85 11 __ STA P4 
1814 : c8 __ __ INY
1815 : b1 43 __ LDA (T0 + 0),y 
1817 : 85 12 __ STA P5 
1819 : 18 __ __ CLC
181a : a5 43 __ LDA T0 + 0 
181c : 69 02 __ ADC #$02
181e : 8d d8 cf STA $cfd8 ; (sstack + 5)
1821 : a5 44 __ LDA T0 + 1 
1823 : 69 00 __ ADC #$00
1825 : 8d d9 cf STA $cfd9 ; (sstack + 6)
1828 : a9 bb __ LDA #$bb
182a : 85 0d __ STA P0 
182c : a9 cf __ LDA #$cf
182e : 85 0e __ STA P1 
1830 : 20 b3 18 JSR $18b3 ; (nformi.s4 + 0)
1833 : 4c 78 16 JMP $1678 ; (sformat.s94 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "D:/Arbeit/dev/oscar64/include/stdio.h"
.l4:
1836 : a0 00 __ LDY #$00
1838 : b1 0e __ LDA (P1),y ; (str + 0)
183a : aa __ __ TAX
183b : 18 __ __ CLC
183c : a5 0e __ LDA P1 ; (str + 0)
183e : 69 01 __ ADC #$01
1840 : 85 0e __ STA P1 ; (str + 0)
1842 : 8a __ __ TXA
1843 : d0 01 __ BNE $1846 ; (puts.s5 + 0)
.s3:
1845 : 60 __ __ RTS
.s5:
1846 : 90 02 __ BCC $184a ; (puts.s7 + 0)
.s6:
1848 : e6 0f __ INC P2 ; (str + 1)
.s7:
184a : 20 50 18 JSR $1850 ; (putpch.s4 + 0)
184d : 4c 36 18 JMP $1836 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "D:/Arbeit/dev/oscar64/include/conio.h"
.s4:
1850 : 85 0d __ STA P0 ; (c + 0)
1852 : ad 4c 4d LDA $4d4c ; (giocharmap + 0)
1855 : f0 32 __ BEQ $1889 ; (putpch.s5 + 0)
.s6:
1857 : a5 0d __ LDA P0 ; (c + 0)
1859 : c9 0a __ CMP #$0a
185b : d0 04 __ BNE $1861 ; (putpch.s7 + 0)
.s18:
185d : a9 0d __ LDA #$0d
185f : d0 32 __ BNE $1893 ; (putpch.s15 + 0)
.s7:
1861 : c9 09 __ CMP #$09
1863 : f0 36 __ BEQ $189b ; (putpch.s16 + 0)
.s8:
1865 : ad 4c 4d LDA $4d4c ; (giocharmap + 0)
1868 : c9 02 __ CMP #$02
186a : 90 1d __ BCC $1889 ; (putpch.s5 + 0)
.s9:
186c : a5 0d __ LDA P0 ; (c + 0)
186e : c9 41 __ CMP #$41
1870 : 90 17 __ BCC $1889 ; (putpch.s5 + 0)
.s10:
1872 : c9 7b __ CMP #$7b
1874 : b0 13 __ BCS $1889 ; (putpch.s5 + 0)
.s11:
1876 : c9 61 __ CMP #$61
1878 : b0 04 __ BCS $187e ; (putpch.s13 + 0)
.s12:
187a : c9 5b __ CMP #$5b
187c : b0 0b __ BCS $1889 ; (putpch.s5 + 0)
.s13:
187e : 49 20 __ EOR #$20
1880 : 85 0d __ STA P0 ; (c + 0)
1882 : ad 4c 4d LDA $4d4c ; (giocharmap + 0)
1885 : c9 02 __ CMP #$02
1887 : f0 06 __ BEQ $188f ; (putpch.s14 + 0)
.s5:
1889 : a5 0d __ LDA P0 ; (c + 0)
188b : 20 d2 ff JSR $ffd2 
.s3:
188e : 60 __ __ RTS
.s14:
188f : a5 0d __ LDA P0 ; (c + 0)
1891 : 29 5f __ AND #$5f
.s15:
1893 : 85 43 __ STA T0 + 0 
1895 : a5 43 __ LDA T0 + 0 
1897 : 20 d2 ff JSR $ffd2 
189a : 60 __ __ RTS
.s16:
189b : a5 d3 __ LDA $d3 
189d : 29 03 __ AND #$03
189f : 85 43 __ STA T0 + 0 
18a1 : a9 20 __ LDA #$20
18a3 : 85 44 __ STA T1 + 0 
.l17:
18a5 : a5 44 __ LDA T1 + 0 
18a7 : 20 d2 ff JSR $ffd2 
18aa : e6 43 __ INC T0 + 0 
18ac : a5 43 __ LDA T0 + 0 
18ae : c9 04 __ CMP #$04
18b0 : 90 f3 __ BCC $18a5 ; (putpch.l17 + 0)
18b2 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s4:
18b3 : a9 00 __ LDA #$00
18b5 : 85 43 __ STA T5 + 0 
18b7 : a0 04 __ LDY #$04
18b9 : b1 0d __ LDA (P0),y ; (si + 0)
18bb : 85 44 __ STA T6 + 0 
18bd : a5 13 __ LDA P6 ; (s + 0)
18bf : f0 13 __ BEQ $18d4 ; (nformi.s5 + 0)
.s34:
18c1 : 24 12 __ BIT P5 ; (v + 1)
18c3 : 10 0f __ BPL $18d4 ; (nformi.s5 + 0)
.s35:
18c5 : 38 __ __ SEC
18c6 : a9 00 __ LDA #$00
18c8 : e5 11 __ SBC P4 ; (v + 0)
18ca : 85 11 __ STA P4 ; (v + 0)
18cc : a9 00 __ LDA #$00
18ce : e5 12 __ SBC P5 ; (v + 1)
18d0 : 85 12 __ STA P5 ; (v + 1)
18d2 : e6 43 __ INC T5 + 0 
.s5:
18d4 : a9 10 __ LDA #$10
18d6 : 85 45 __ STA T7 + 0 
18d8 : a5 11 __ LDA P4 ; (v + 0)
18da : 05 12 __ ORA P5 ; (v + 1)
18dc : f0 2d __ BEQ $190b ; (nformi.s6 + 0)
.s29:
18de : a5 11 __ LDA P4 ; (v + 0)
18e0 : 85 1b __ STA ACCU + 0 
18e2 : a5 12 __ LDA P5 ; (v + 1)
18e4 : 85 1c __ STA ACCU + 1 
.l30:
18e6 : a5 44 __ LDA T6 + 0 
18e8 : 20 c6 49 JSR $49c6 ; (divmod + 53)
18eb : a5 05 __ LDA WORK + 2 
18ed : c9 0a __ CMP #$0a
18ef : b0 04 __ BCS $18f5 ; (nformi.s33 + 0)
.s31:
18f1 : a9 30 __ LDA #$30
18f3 : 90 06 __ BCC $18fb ; (nformi.s32 + 0)
.s33:
18f5 : a0 03 __ LDY #$03
18f7 : b1 0d __ LDA (P0),y ; (si + 0)
18f9 : e9 0a __ SBC #$0a
.s32:
18fb : 18 __ __ CLC
18fc : 65 05 __ ADC WORK + 2 
18fe : a6 45 __ LDX T7 + 0 
1900 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1903 : c6 45 __ DEC T7 + 0 
1905 : a5 1b __ LDA ACCU + 0 
1907 : 05 1c __ ORA ACCU + 1 
1909 : d0 db __ BNE $18e6 ; (nformi.l30 + 0)
.s6:
190b : a9 ff __ LDA #$ff
190d : a0 02 __ LDY #$02
190f : d1 0d __ CMP (P0),y ; (si + 0)
1911 : d0 04 __ BNE $1917 ; (nformi.s28 + 0)
.s7:
1913 : a9 0f __ LDA #$0f
1915 : d0 05 __ BNE $191c ; (nformi.s40 + 0)
.s28:
1917 : 38 __ __ SEC
1918 : a9 10 __ LDA #$10
191a : f1 0d __ SBC (P0),y ; (si + 0)
.s40:
191c : a8 __ __ TAY
191d : c4 45 __ CPY T7 + 0 
191f : b0 0d __ BCS $192e ; (nformi.s8 + 0)
.s27:
1921 : a9 30 __ LDA #$30
.l41:
1923 : a6 45 __ LDX T7 + 0 
1925 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1928 : c6 45 __ DEC T7 + 0 
192a : c4 45 __ CPY T7 + 0 
192c : 90 f5 __ BCC $1923 ; (nformi.l41 + 0)
.s8:
192e : a0 07 __ LDY #$07
1930 : b1 0d __ LDA (P0),y ; (si + 0)
1932 : f0 1c __ BEQ $1950 ; (nformi.s9 + 0)
.s25:
1934 : a5 44 __ LDA T6 + 0 
1936 : c9 10 __ CMP #$10
1938 : d0 16 __ BNE $1950 ; (nformi.s9 + 0)
.s26:
193a : a0 03 __ LDY #$03
193c : b1 0d __ LDA (P0),y ; (si + 0)
193e : a8 __ __ TAY
193f : a9 30 __ LDA #$30
1941 : a6 45 __ LDX T7 + 0 
1943 : 9d c1 cf STA $cfc1,x ; (render_wireframe@stack + 4)
1946 : 98 __ __ TYA
1947 : 69 16 __ ADC #$16
1949 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
194c : ca __ __ DEX
194d : ca __ __ DEX
194e : 86 45 __ STX T7 + 0 
.s9:
1950 : a9 00 __ LDA #$00
1952 : 85 1b __ STA ACCU + 0 
1954 : a5 43 __ LDA T5 + 0 
1956 : f0 0c __ BEQ $1964 ; (nformi.s10 + 0)
.s24:
1958 : a9 2d __ LDA #$2d
.s23:
195a : a6 45 __ LDX T7 + 0 
195c : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
195f : c6 45 __ DEC T7 + 0 
1961 : 4c 6e 19 JMP $196e ; (nformi.s11 + 0)
.s10:
1964 : a0 05 __ LDY #$05
1966 : b1 0d __ LDA (P0),y ; (si + 0)
1968 : f0 04 __ BEQ $196e ; (nformi.s11 + 0)
.s22:
196a : a9 2b __ LDA #$2b
196c : d0 ec __ BNE $195a ; (nformi.s23 + 0)
.s11:
196e : a6 45 __ LDX T7 + 0 
1970 : a0 06 __ LDY #$06
1972 : b1 0d __ LDA (P0),y ; (si + 0)
1974 : d0 2b __ BNE $19a1 ; (nformi.s18 + 0)
.l12:
1976 : 8a __ __ TXA
1977 : 18 __ __ CLC
1978 : a0 01 __ LDY #$01
197a : 71 0d __ ADC (P0),y ; (si + 0)
197c : b0 04 __ BCS $1982 ; (nformi.s16 + 0)
.s17:
197e : c9 11 __ CMP #$11
1980 : 90 0a __ BCC $198c ; (nformi.s13 + 0)
.s16:
1982 : a0 00 __ LDY #$00
1984 : b1 0d __ LDA (P0),y ; (si + 0)
1986 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1989 : ca __ __ DEX
198a : b0 ea __ BCS $1976 ; (nformi.l12 + 0)
.s13:
198c : e0 10 __ CPX #$10
198e : b0 0e __ BCS $199e ; (nformi.s14 + 0)
.s15:
1990 : 88 __ __ DEY
.l38:
1991 : bd c3 cf LDA $cfc3,x ; (buffer[0] + 0)
1994 : 91 0f __ STA (P2),y ; (str + 0)
1996 : c8 __ __ INY
1997 : e8 __ __ INX
1998 : e0 10 __ CPX #$10
199a : 90 f5 __ BCC $1991 ; (nformi.l38 + 0)
.s39:
199c : 84 1b __ STY ACCU + 0 
.s14:
199e : a5 1b __ LDA ACCU + 0 
.s3:
19a0 : 60 __ __ RTS
.s18:
19a1 : e0 10 __ CPX #$10
19a3 : b0 1a __ BCS $19bf ; (nformi.l19 + 0)
.s21:
19a5 : a0 00 __ LDY #$00
.l36:
19a7 : bd c3 cf LDA $cfc3,x ; (buffer[0] + 0)
19aa : 91 0f __ STA (P2),y ; (str + 0)
19ac : c8 __ __ INY
19ad : e8 __ __ INX
19ae : e0 10 __ CPX #$10
19b0 : 90 f5 __ BCC $19a7 ; (nformi.l36 + 0)
.s37:
19b2 : 84 1b __ STY ACCU + 0 
19b4 : b0 09 __ BCS $19bf ; (nformi.l19 + 0)
.s20:
19b6 : 88 __ __ DEY
19b7 : b1 0d __ LDA (P0),y ; (si + 0)
19b9 : a4 1b __ LDY ACCU + 0 
19bb : 91 0f __ STA (P2),y ; (str + 0)
19bd : e6 1b __ INC ACCU + 0 
.l19:
19bf : a5 1b __ LDA ACCU + 0 
19c1 : a0 01 __ LDY #$01
19c3 : d1 0d __ CMP (P0),y ; (si + 0)
19c5 : 90 ef __ BCC $19b6 ; (nformi.s20 + 0)
19c7 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s4:
19c8 : a9 00 __ LDA #$00
19ca : 85 43 __ STA T4 + 0 
19cc : a5 15 __ LDA P8 ; (s + 0)
19ce : f0 1f __ BEQ $19ef ; (nforml.s5 + 0)
.s35:
19d0 : 24 14 __ BIT P7 ; (v + 3)
19d2 : 10 1b __ BPL $19ef ; (nforml.s5 + 0)
.s36:
19d4 : 38 __ __ SEC
19d5 : a9 00 __ LDA #$00
19d7 : e5 11 __ SBC P4 ; (v + 0)
19d9 : 85 11 __ STA P4 ; (v + 0)
19db : a9 00 __ LDA #$00
19dd : e5 12 __ SBC P5 ; (v + 1)
19df : 85 12 __ STA P5 ; (v + 1)
19e1 : a9 00 __ LDA #$00
19e3 : e5 13 __ SBC P6 ; (v + 2)
19e5 : 85 13 __ STA P6 ; (v + 2)
19e7 : a9 00 __ LDA #$00
19e9 : e5 14 __ SBC P7 ; (v + 3)
19eb : 85 14 __ STA P7 ; (v + 3)
19ed : e6 43 __ INC T4 + 0 
.s5:
19ef : a9 10 __ LDA #$10
19f1 : 85 44 __ STA T5 + 0 
19f3 : a5 14 __ LDA P7 ; (v + 3)
19f5 : d0 0c __ BNE $1a03 ; (nforml.l43 + 0)
.s31:
19f7 : a5 13 __ LDA P6 ; (v + 2)
19f9 : d0 08 __ BNE $1a03 ; (nforml.l43 + 0)
.s32:
19fb : a5 12 __ LDA P5 ; (v + 1)
19fd : d0 04 __ BNE $1a03 ; (nforml.l43 + 0)
.s33:
19ff : c5 11 __ CMP P4 ; (v + 0)
1a01 : b0 13 __ BCS $1a16 ; (nforml.s6 + 0)
.l43:
1a03 : a5 11 __ LDA P4 ; (v + 0)
1a05 : 85 1b __ STA ACCU + 0 
1a07 : a5 12 __ LDA P5 ; (v + 1)
1a09 : 85 1c __ STA ACCU + 1 
1a0b : a5 13 __ LDA P6 ; (v + 2)
1a0d : 85 1d __ STA ACCU + 2 
1a0f : a5 14 __ LDA P7 ; (v + 3)
1a11 : 85 1e __ STA ACCU + 3 
1a13 : 4c d2 1a JMP $1ad2 ; (nforml.l28 + 0)
.s6:
1a16 : a9 ff __ LDA #$ff
1a18 : a0 02 __ LDY #$02
1a1a : d1 0d __ CMP (P0),y ; (si + 0)
1a1c : d0 04 __ BNE $1a22 ; (nforml.s27 + 0)
.s7:
1a1e : a9 0f __ LDA #$0f
1a20 : d0 05 __ BNE $1a27 ; (nforml.s41 + 0)
.s27:
1a22 : 38 __ __ SEC
1a23 : a9 10 __ LDA #$10
1a25 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
1a27 : a8 __ __ TAY
1a28 : c4 44 __ CPY T5 + 0 
1a2a : b0 0d __ BCS $1a39 ; (nforml.s8 + 0)
.s26:
1a2c : a9 30 __ LDA #$30
.l42:
1a2e : a6 44 __ LDX T5 + 0 
1a30 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1a33 : c6 44 __ DEC T5 + 0 
1a35 : c4 44 __ CPY T5 + 0 
1a37 : 90 f5 __ BCC $1a2e ; (nforml.l42 + 0)
.s8:
1a39 : a0 07 __ LDY #$07
1a3b : b1 0d __ LDA (P0),y ; (si + 0)
1a3d : f0 1d __ BEQ $1a5c ; (nforml.s9 + 0)
.s24:
1a3f : a9 10 __ LDA #$10
1a41 : a0 04 __ LDY #$04
1a43 : d1 0d __ CMP (P0),y ; (si + 0)
1a45 : d0 15 __ BNE $1a5c ; (nforml.s9 + 0)
.s25:
1a47 : 88 __ __ DEY
1a48 : b1 0d __ LDA (P0),y ; (si + 0)
1a4a : a8 __ __ TAY
1a4b : a9 30 __ LDA #$30
1a4d : a6 44 __ LDX T5 + 0 
1a4f : 9d c1 cf STA $cfc1,x ; (render_wireframe@stack + 4)
1a52 : 98 __ __ TYA
1a53 : 69 16 __ ADC #$16
1a55 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1a58 : ca __ __ DEX
1a59 : ca __ __ DEX
1a5a : 86 44 __ STX T5 + 0 
.s9:
1a5c : a9 00 __ LDA #$00
1a5e : 85 1b __ STA ACCU + 0 
1a60 : a5 43 __ LDA T4 + 0 
1a62 : f0 0c __ BEQ $1a70 ; (nforml.s10 + 0)
.s23:
1a64 : a9 2d __ LDA #$2d
.s22:
1a66 : a6 44 __ LDX T5 + 0 
1a68 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1a6b : c6 44 __ DEC T5 + 0 
1a6d : 4c 7a 1a JMP $1a7a ; (nforml.s11 + 0)
.s10:
1a70 : a0 05 __ LDY #$05
1a72 : b1 0d __ LDA (P0),y ; (si + 0)
1a74 : f0 04 __ BEQ $1a7a ; (nforml.s11 + 0)
.s21:
1a76 : a9 2b __ LDA #$2b
1a78 : d0 ec __ BNE $1a66 ; (nforml.s22 + 0)
.s11:
1a7a : a0 06 __ LDY #$06
1a7c : a6 44 __ LDX T5 + 0 
1a7e : b1 0d __ LDA (P0),y ; (si + 0)
1a80 : d0 29 __ BNE $1aab ; (nforml.s17 + 0)
.l12:
1a82 : 8a __ __ TXA
1a83 : 18 __ __ CLC
1a84 : a0 01 __ LDY #$01
1a86 : 71 0d __ ADC (P0),y ; (si + 0)
1a88 : b0 04 __ BCS $1a8e ; (nforml.s15 + 0)
.s16:
1a8a : c9 11 __ CMP #$11
1a8c : 90 0a __ BCC $1a98 ; (nforml.s13 + 0)
.s15:
1a8e : a0 00 __ LDY #$00
1a90 : b1 0d __ LDA (P0),y ; (si + 0)
1a92 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1a95 : ca __ __ DEX
1a96 : b0 ea __ BCS $1a82 ; (nforml.l12 + 0)
.s13:
1a98 : e0 10 __ CPX #$10
1a9a : b0 0e __ BCS $1aaa ; (nforml.s3 + 0)
.s14:
1a9c : 88 __ __ DEY
.l39:
1a9d : bd c3 cf LDA $cfc3,x ; (buffer[0] + 0)
1aa0 : 91 0f __ STA (P2),y ; (str + 0)
1aa2 : c8 __ __ INY
1aa3 : e8 __ __ INX
1aa4 : e0 10 __ CPX #$10
1aa6 : 90 f5 __ BCC $1a9d ; (nforml.l39 + 0)
.s40:
1aa8 : 84 1b __ STY ACCU + 0 
.s3:
1aaa : 60 __ __ RTS
.s17:
1aab : e0 10 __ CPX #$10
1aad : b0 1a __ BCS $1ac9 ; (nforml.l18 + 0)
.s20:
1aaf : a0 00 __ LDY #$00
.l37:
1ab1 : bd c3 cf LDA $cfc3,x ; (buffer[0] + 0)
1ab4 : 91 0f __ STA (P2),y ; (str + 0)
1ab6 : c8 __ __ INY
1ab7 : e8 __ __ INX
1ab8 : e0 10 __ CPX #$10
1aba : 90 f5 __ BCC $1ab1 ; (nforml.l37 + 0)
.s38:
1abc : 84 1b __ STY ACCU + 0 
1abe : b0 09 __ BCS $1ac9 ; (nforml.l18 + 0)
.s19:
1ac0 : 88 __ __ DEY
1ac1 : b1 0d __ LDA (P0),y ; (si + 0)
1ac3 : a4 1b __ LDY ACCU + 0 
1ac5 : 91 0f __ STA (P2),y ; (str + 0)
1ac7 : e6 1b __ INC ACCU + 0 
.l18:
1ac9 : a5 1b __ LDA ACCU + 0 
1acb : a0 01 __ LDY #$01
1acd : d1 0d __ CMP (P0),y ; (si + 0)
1acf : 90 ef __ BCC $1ac0 ; (nforml.s19 + 0)
1ad1 : 60 __ __ RTS
.l28:
1ad2 : a0 04 __ LDY #$04
1ad4 : b1 0d __ LDA (P0),y ; (si + 0)
1ad6 : 85 03 __ STA WORK + 0 
1ad8 : a9 00 __ LDA #$00
1ada : 85 04 __ STA WORK + 1 
1adc : 85 05 __ STA WORK + 2 
1ade : 85 06 __ STA WORK + 3 
1ae0 : 20 96 4b JSR $4b96 ; (divmod32 + 0)
1ae3 : a5 07 __ LDA WORK + 4 
1ae5 : c9 0a __ CMP #$0a
1ae7 : b0 04 __ BCS $1aed ; (nforml.s34 + 0)
.s29:
1ae9 : a9 30 __ LDA #$30
1aeb : 90 06 __ BCC $1af3 ; (nforml.s30 + 0)
.s34:
1aed : a0 03 __ LDY #$03
1aef : b1 0d __ LDA (P0),y ; (si + 0)
1af1 : e9 0a __ SBC #$0a
.s30:
1af3 : 18 __ __ CLC
1af4 : 65 07 __ ADC WORK + 4 
1af6 : a6 44 __ LDX T5 + 0 
1af8 : 9d c2 cf STA $cfc2,x ; (render_wireframe@stack + 5)
1afb : a5 1b __ LDA ACCU + 0 
1afd : 85 11 __ STA P4 ; (v + 0)
1aff : a5 1c __ LDA ACCU + 1 
1b01 : 85 12 __ STA P5 ; (v + 1)
1b03 : a5 1d __ LDA ACCU + 2 
1b05 : 85 13 __ STA P6 ; (v + 2)
1b07 : a5 1e __ LDA ACCU + 3 
1b09 : 85 14 __ STA P7 ; (v + 3)
1b0b : c6 44 __ DEC T5 + 0 
1b0d : aa __ __ TAX
1b0e : d0 c2 __ BNE $1ad2 ; (nforml.l28 + 0)
1b10 : 4c f7 19 JMP $19f7 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s1:
1b13 : a2 03 __ LDX #$03
1b15 : b5 53 __ LDA T7 + 0,x 
1b17 : 9d ca cf STA $cfca,x ; (nformf@stack + 0)
1b1a : ca __ __ DEX
1b1b : 10 f8 __ BPL $1b15 ; (nformf.s1 + 2)
.s4:
1b1d : a5 16 __ LDA P9 ; (f + 1)
1b1f : 85 44 __ STA T0 + 1 
1b21 : a5 17 __ LDA P10 ; (f + 2)
1b23 : 85 45 __ STA T0 + 2 
1b25 : a5 18 __ LDA P11 ; (f + 3)
1b27 : 29 7f __ AND #$7f
1b29 : 05 17 __ ORA P10 ; (f + 2)
1b2b : 05 16 __ ORA P9 ; (f + 1)
1b2d : 05 15 __ ORA P8 ; (f + 0)
1b2f : f0 21 __ BEQ $1b52 ; (nformf.s5 + 0)
.s91:
1b31 : 24 18 __ BIT P11 ; (f + 3)
1b33 : 10 1d __ BPL $1b52 ; (nformf.s5 + 0)
.s90:
1b35 : a9 2d __ LDA #$2d
1b37 : a0 00 __ LDY #$00
1b39 : 91 13 __ STA (P6),y ; (str + 0)
1b3b : a5 18 __ LDA P11 ; (f + 3)
1b3d : 49 80 __ EOR #$80
1b3f : 85 18 __ STA P11 ; (f + 3)
1b41 : 85 10 __ STA P3 
1b43 : a5 15 __ LDA P8 ; (f + 0)
1b45 : 85 0d __ STA P0 
1b47 : a5 16 __ LDA P9 ; (f + 1)
1b49 : 85 0e __ STA P1 
1b4b : a5 17 __ LDA P10 ; (f + 2)
1b4d : 85 0f __ STA P2 
1b4f : 4c 16 20 JMP $2016 ; (nformf.s88 + 0)
.s5:
1b52 : a5 15 __ LDA P8 ; (f + 0)
1b54 : 85 0d __ STA P0 
1b56 : a5 16 __ LDA P9 ; (f + 1)
1b58 : 85 0e __ STA P1 
1b5a : a5 17 __ LDA P10 ; (f + 2)
1b5c : 85 0f __ STA P2 
1b5e : a5 18 __ LDA P11 ; (f + 3)
1b60 : 85 10 __ STA P3 
1b62 : a0 05 __ LDY #$05
1b64 : b1 11 __ LDA (P4),y ; (si + 0)
1b66 : f0 09 __ BEQ $1b71 ; (nformf.s6 + 0)
.s87:
1b68 : a9 2b __ LDA #$2b
1b6a : a0 00 __ LDY #$00
1b6c : 91 13 __ STA (P6),y ; (str + 0)
1b6e : 4c 16 20 JMP $2016 ; (nformf.s88 + 0)
.s6:
1b71 : 20 27 20 JSR $2027 ; (isinf.s4 + 0)
1b74 : a2 00 __ LDX #$00
1b76 : 86 54 __ STX T9 + 0 
1b78 : a8 __ __ TAY
1b79 : f0 05 __ BEQ $1b80 ; (nformf.s7 + 0)
.s85:
1b7b : a9 02 __ LDA #$02
1b7d : 4c e6 1f JMP $1fe6 ; (nformf.s86 + 0)
.s7:
1b80 : a5 11 __ LDA P4 ; (si + 0)
1b82 : 85 4b __ STA T2 + 0 
1b84 : a5 12 __ LDA P5 ; (si + 1)
1b86 : 85 4c __ STA T2 + 1 
1b88 : a0 02 __ LDY #$02
1b8a : b1 11 __ LDA (P4),y ; (si + 0)
1b8c : c9 ff __ CMP #$ff
1b8e : d0 02 __ BNE $1b92 ; (nformf.s84 + 0)
.s8:
1b90 : a9 06 __ LDA #$06
.s84:
1b92 : 85 52 __ STA T6 + 0 
1b94 : a9 00 __ LDA #$00
1b96 : 85 4f __ STA T4 + 0 
1b98 : 85 50 __ STA T4 + 1 
1b9a : a5 15 __ LDA P8 ; (f + 0)
1b9c : 85 43 __ STA T0 + 0 
1b9e : a5 18 __ LDA P11 ; (f + 3)
1ba0 : 85 46 __ STA T0 + 3 
1ba2 : 29 7f __ AND #$7f
1ba4 : 05 17 __ ORA P10 ; (f + 2)
1ba6 : 05 16 __ ORA P9 ; (f + 1)
1ba8 : 05 15 __ ORA P8 ; (f + 0)
1baa : d0 03 __ BNE $1baf ; (nformf.s63 + 0)
1bac : 4c ae 1c JMP $1cae ; (nformf.s9 + 0)
.s63:
1baf : a5 18 __ LDA P11 ; (f + 3)
1bb1 : 30 67 __ BMI $1c1a ; (nformf.l72 + 0)
.s81:
1bb3 : c9 44 __ CMP #$44
1bb5 : d0 06 __ BNE $1bbd ; (nformf.l83 + 0)
.s82:
1bb7 : a5 17 __ LDA P10 ; (f + 2)
1bb9 : c9 7a __ CMP #$7a
1bbb : f0 02 __ BEQ $1bbf ; (nformf.l78 + 0)
.l83:
1bbd : 90 4b __ BCC $1c0a ; (nformf.s64 + 0)
.l78:
1bbf : 18 __ __ CLC
1bc0 : a5 4f __ LDA T4 + 0 
1bc2 : 69 03 __ ADC #$03
1bc4 : 85 4f __ STA T4 + 0 
1bc6 : 90 02 __ BCC $1bca ; (nformf.s105 + 0)
.s104:
1bc8 : e6 50 __ INC T4 + 1 
.s105:
1bca : a5 43 __ LDA T0 + 0 
1bcc : 85 1b __ STA ACCU + 0 
1bce : a5 44 __ LDA T0 + 1 
1bd0 : 85 1c __ STA ACCU + 1 
1bd2 : a5 45 __ LDA T0 + 2 
1bd4 : 85 1d __ STA ACCU + 2 
1bd6 : a5 46 __ LDA T0 + 3 
1bd8 : 85 1e __ STA ACCU + 3 
1bda : a9 00 __ LDA #$00
1bdc : 85 03 __ STA WORK + 0 
1bde : 85 04 __ STA WORK + 1 
1be0 : a9 7a __ LDA #$7a
1be2 : 85 05 __ STA WORK + 2 
1be4 : a9 44 __ LDA #$44
1be6 : 85 06 __ STA WORK + 3 
1be8 : 20 81 46 JSR $4681 ; (freg + 20)
1beb : 20 67 48 JSR $4867 ; (crt_fdiv + 0)
1bee : a5 1b __ LDA ACCU + 0 
1bf0 : 85 43 __ STA T0 + 0 
1bf2 : a5 1c __ LDA ACCU + 1 
1bf4 : 85 44 __ STA T0 + 1 
1bf6 : a6 1d __ LDX ACCU + 2 
1bf8 : 86 45 __ STX T0 + 2 
1bfa : a5 1e __ LDA ACCU + 3 
1bfc : 85 46 __ STA T0 + 3 
1bfe : 30 0a __ BMI $1c0a ; (nformf.s64 + 0)
.s79:
1c00 : c9 44 __ CMP #$44
1c02 : d0 b9 __ BNE $1bbd ; (nformf.l83 + 0)
.s80:
1c04 : e0 7a __ CPX #$7a
1c06 : f0 b7 __ BEQ $1bbf ; (nformf.l78 + 0)
1c08 : d0 b3 __ BNE $1bbd ; (nformf.l83 + 0)
.s64:
1c0a : a5 46 __ LDA T0 + 3 
1c0c : 30 0c __ BMI $1c1a ; (nformf.l72 + 0)
.s76:
1c0e : c9 3f __ CMP #$3f
1c10 : d0 06 __ BNE $1c18 ; (nformf.s75 + 0)
.s77:
1c12 : a5 45 __ LDA T0 + 2 
1c14 : c9 80 __ CMP #$80
1c16 : f0 40 __ BEQ $1c58 ; (nformf.s65 + 0)
.s75:
1c18 : b0 3e __ BCS $1c58 ; (nformf.s65 + 0)
.l72:
1c1a : 38 __ __ SEC
1c1b : a5 4f __ LDA T4 + 0 
1c1d : e9 03 __ SBC #$03
1c1f : 85 4f __ STA T4 + 0 
1c21 : b0 02 __ BCS $1c25 ; (nformf.s100 + 0)
.s99:
1c23 : c6 50 __ DEC T4 + 1 
.s100:
1c25 : a9 00 __ LDA #$00
1c27 : 85 1b __ STA ACCU + 0 
1c29 : 85 1c __ STA ACCU + 1 
1c2b : a9 7a __ LDA #$7a
1c2d : 85 1d __ STA ACCU + 2 
1c2f : a9 44 __ LDA #$44
1c31 : 85 1e __ STA ACCU + 3 
1c33 : a2 43 __ LDX #$43
1c35 : 20 71 46 JSR $4671 ; (freg + 4)
1c38 : 20 9f 47 JSR $479f ; (crt_fmul + 0)
1c3b : a5 1b __ LDA ACCU + 0 
1c3d : 85 43 __ STA T0 + 0 
1c3f : a5 1c __ LDA ACCU + 1 
1c41 : 85 44 __ STA T0 + 1 
1c43 : a6 1d __ LDX ACCU + 2 
1c45 : 86 45 __ STX T0 + 2 
1c47 : a5 1e __ LDA ACCU + 3 
1c49 : 85 46 __ STA T0 + 3 
1c4b : 30 cd __ BMI $1c1a ; (nformf.l72 + 0)
.s73:
1c4d : c9 3f __ CMP #$3f
1c4f : 90 c9 __ BCC $1c1a ; (nformf.l72 + 0)
.s109:
1c51 : d0 05 __ BNE $1c58 ; (nformf.s65 + 0)
.s74:
1c53 : e0 80 __ CPX #$80
1c55 : 4c 18 1c JMP $1c18 ; (nformf.s75 + 0)
.s65:
1c58 : a5 46 __ LDA T0 + 3 
1c5a : 30 52 __ BMI $1cae ; (nformf.s9 + 0)
.s69:
1c5c : c9 41 __ CMP #$41
1c5e : d0 06 __ BNE $1c66 ; (nformf.l71 + 0)
.s70:
1c60 : a5 45 __ LDA T0 + 2 
1c62 : c9 20 __ CMP #$20
1c64 : f0 02 __ BEQ $1c68 ; (nformf.l66 + 0)
.l71:
1c66 : 90 46 __ BCC $1cae ; (nformf.s9 + 0)
.l66:
1c68 : e6 4f __ INC T4 + 0 
1c6a : d0 02 __ BNE $1c6e ; (nformf.s103 + 0)
.s102:
1c6c : e6 50 __ INC T4 + 1 
.s103:
1c6e : a5 43 __ LDA T0 + 0 
1c70 : 85 1b __ STA ACCU + 0 
1c72 : a5 44 __ LDA T0 + 1 
1c74 : 85 1c __ STA ACCU + 1 
1c76 : a5 45 __ LDA T0 + 2 
1c78 : 85 1d __ STA ACCU + 2 
1c7a : a5 46 __ LDA T0 + 3 
1c7c : 85 1e __ STA ACCU + 3 
1c7e : a9 00 __ LDA #$00
1c80 : 85 03 __ STA WORK + 0 
1c82 : 85 04 __ STA WORK + 1 
1c84 : a9 20 __ LDA #$20
1c86 : 85 05 __ STA WORK + 2 
1c88 : a9 41 __ LDA #$41
1c8a : 85 06 __ STA WORK + 3 
1c8c : 20 81 46 JSR $4681 ; (freg + 20)
1c8f : 20 67 48 JSR $4867 ; (crt_fdiv + 0)
1c92 : a5 1b __ LDA ACCU + 0 
1c94 : 85 43 __ STA T0 + 0 
1c96 : a5 1c __ LDA ACCU + 1 
1c98 : 85 44 __ STA T0 + 1 
1c9a : a6 1d __ LDX ACCU + 2 
1c9c : 86 45 __ STX T0 + 2 
1c9e : a5 1e __ LDA ACCU + 3 
1ca0 : 85 46 __ STA T0 + 3 
1ca2 : 30 0a __ BMI $1cae ; (nformf.s9 + 0)
.s67:
1ca4 : c9 41 __ CMP #$41
1ca6 : d0 be __ BNE $1c66 ; (nformf.l71 + 0)
.s68:
1ca8 : e0 20 __ CPX #$20
1caa : f0 bc __ BEQ $1c68 ; (nformf.l66 + 0)
1cac : d0 b8 __ BNE $1c66 ; (nformf.l71 + 0)
.s9:
1cae : ad d3 cf LDA $cfd3 ; (sstack + 0)
1cb1 : c9 65 __ CMP #$65
1cb3 : d0 04 __ BNE $1cb9 ; (nformf.s11 + 0)
.s10:
1cb5 : a9 01 __ LDA #$01
1cb7 : d0 02 __ BNE $1cbb ; (nformf.s12 + 0)
.s11:
1cb9 : a9 00 __ LDA #$00
.s12:
1cbb : 85 55 __ STA T10 + 0 
1cbd : a6 52 __ LDX T6 + 0 
1cbf : e8 __ __ INX
1cc0 : 86 51 __ STX T5 + 0 
1cc2 : ad d3 cf LDA $cfd3 ; (sstack + 0)
1cc5 : c9 67 __ CMP #$67
1cc7 : d0 13 __ BNE $1cdc ; (nformf.s13 + 0)
.s59:
1cc9 : a5 50 __ LDA T4 + 1 
1ccb : 30 08 __ BMI $1cd5 ; (nformf.s60 + 0)
.s62:
1ccd : d0 06 __ BNE $1cd5 ; (nformf.s60 + 0)
.s61:
1ccf : a5 4f __ LDA T4 + 0 
1cd1 : c9 04 __ CMP #$04
1cd3 : 90 07 __ BCC $1cdc ; (nformf.s13 + 0)
.s60:
1cd5 : a9 01 __ LDA #$01
1cd7 : 85 55 __ STA T10 + 0 
1cd9 : 4c 53 1f JMP $1f53 ; (nformf.s51 + 0)
.s13:
1cdc : a5 55 __ LDA T10 + 0 
1cde : d0 f9 __ BNE $1cd9 ; (nformf.s60 + 4)
.s14:
1ce0 : 24 50 __ BIT T4 + 1 
1ce2 : 10 43 __ BPL $1d27 ; (nformf.s15 + 0)
.s50:
1ce4 : a5 43 __ LDA T0 + 0 
1ce6 : 85 1b __ STA ACCU + 0 
1ce8 : a5 44 __ LDA T0 + 1 
1cea : 85 1c __ STA ACCU + 1 
1cec : a5 45 __ LDA T0 + 2 
1cee : 85 1d __ STA ACCU + 2 
1cf0 : a5 46 __ LDA T0 + 3 
1cf2 : 85 1e __ STA ACCU + 3 
.l92:
1cf4 : a9 00 __ LDA #$00
1cf6 : 85 03 __ STA WORK + 0 
1cf8 : 85 04 __ STA WORK + 1 
1cfa : a9 20 __ LDA #$20
1cfc : 85 05 __ STA WORK + 2 
1cfe : a9 41 __ LDA #$41
1d00 : 85 06 __ STA WORK + 3 
1d02 : 20 81 46 JSR $4681 ; (freg + 20)
1d05 : 20 67 48 JSR $4867 ; (crt_fdiv + 0)
1d08 : 18 __ __ CLC
1d09 : a5 4f __ LDA T4 + 0 
1d0b : 69 01 __ ADC #$01
1d0d : 85 4f __ STA T4 + 0 
1d0f : a5 50 __ LDA T4 + 1 
1d11 : 69 00 __ ADC #$00
1d13 : 85 50 __ STA T4 + 1 
1d15 : 30 dd __ BMI $1cf4 ; (nformf.l92 + 0)
.s93:
1d17 : a5 1e __ LDA ACCU + 3 
1d19 : 85 46 __ STA T0 + 3 
1d1b : a5 1d __ LDA ACCU + 2 
1d1d : 85 45 __ STA T0 + 2 
1d1f : a5 1c __ LDA ACCU + 1 
1d21 : 85 44 __ STA T0 + 1 
1d23 : a5 1b __ LDA ACCU + 0 
1d25 : 85 43 __ STA T0 + 0 
.s15:
1d27 : 18 __ __ CLC
1d28 : a5 52 __ LDA T6 + 0 
1d2a : 65 4f __ ADC T4 + 0 
1d2c : 18 __ __ CLC
1d2d : 69 01 __ ADC #$01
1d2f : 85 51 __ STA T5 + 0 
1d31 : c9 07 __ CMP #$07
1d33 : 90 14 __ BCC $1d49 ; (nformf.s49 + 0)
.s16:
1d35 : ad 65 4d LDA $4d65 ; (fround5[0] + 24)
1d38 : 85 47 __ STA T1 + 0 
1d3a : ad 66 4d LDA $4d66 ; (fround5[0] + 25)
1d3d : 85 48 __ STA T1 + 1 
1d3f : ad 67 4d LDA $4d67 ; (fround5[0] + 26)
1d42 : 85 49 __ STA T1 + 2 
1d44 : ad 68 4d LDA $4d68 ; (fround5[0] + 27)
1d47 : b0 15 __ BCS $1d5e ; (nformf.s17 + 0)
.s49:
1d49 : 0a __ __ ASL
1d4a : 0a __ __ ASL
1d4b : aa __ __ TAX
1d4c : bd 49 4d LDA $4d49,x ; (crt_malloc + 204)
1d4f : 85 47 __ STA T1 + 0 
1d51 : bd 4a 4d LDA $4d4a,x ; (crt_malloc + 205)
1d54 : 85 48 __ STA T1 + 1 
1d56 : bd 4b 4d LDA $4d4b,x ; (spentry + 0)
1d59 : 85 49 __ STA T1 + 2 
1d5b : bd 4c 4d LDA $4d4c,x ; (giocharmap + 0)
.s17:
1d5e : 85 4a __ STA T1 + 3 
1d60 : a5 43 __ LDA T0 + 0 
1d62 : 85 1b __ STA ACCU + 0 
1d64 : a5 44 __ LDA T0 + 1 
1d66 : 85 1c __ STA ACCU + 1 
1d68 : a5 45 __ LDA T0 + 2 
1d6a : 85 1d __ STA ACCU + 2 
1d6c : a5 46 __ LDA T0 + 3 
1d6e : 85 1e __ STA ACCU + 3 
1d70 : a2 47 __ LDX #$47
1d72 : 20 71 46 JSR $4671 ; (freg + 4)
1d75 : 20 b8 46 JSR $46b8 ; (faddsub + 6)
1d78 : a5 1c __ LDA ACCU + 1 
1d7a : 85 16 __ STA P9 ; (f + 1)
1d7c : a5 1d __ LDA ACCU + 2 
1d7e : 85 17 __ STA P10 ; (f + 2)
1d80 : a6 1b __ LDX ACCU + 0 
1d82 : a5 1e __ LDA ACCU + 3 
1d84 : 85 18 __ STA P11 ; (f + 3)
1d86 : 30 30 __ BMI $1db8 ; (nformf.s18 + 0)
.s46:
1d88 : c9 41 __ CMP #$41
1d8a : d0 06 __ BNE $1d92 ; (nformf.s48 + 0)
.s47:
1d8c : a5 17 __ LDA P10 ; (f + 2)
1d8e : c9 20 __ CMP #$20
1d90 : f0 02 __ BEQ $1d94 ; (nformf.s45 + 0)
.s48:
1d92 : 90 24 __ BCC $1db8 ; (nformf.s18 + 0)
.s45:
1d94 : a9 00 __ LDA #$00
1d96 : 85 03 __ STA WORK + 0 
1d98 : 85 04 __ STA WORK + 1 
1d9a : a9 20 __ LDA #$20
1d9c : 85 05 __ STA WORK + 2 
1d9e : a9 41 __ LDA #$41
1da0 : 85 06 __ STA WORK + 3 
1da2 : 20 81 46 JSR $4681 ; (freg + 20)
1da5 : 20 67 48 JSR $4867 ; (crt_fdiv + 0)
1da8 : a5 1c __ LDA ACCU + 1 
1daa : 85 16 __ STA P9 ; (f + 1)
1dac : a5 1d __ LDA ACCU + 2 
1dae : 85 17 __ STA P10 ; (f + 2)
1db0 : a5 1e __ LDA ACCU + 3 
1db2 : 85 18 __ STA P11 ; (f + 3)
1db4 : c6 52 __ DEC T6 + 0 
1db6 : a6 1b __ LDX ACCU + 0 
.s18:
1db8 : 38 __ __ SEC
1db9 : a5 51 __ LDA T5 + 0 
1dbb : e5 52 __ SBC T6 + 0 
1dbd : 85 4d __ STA T3 + 0 
1dbf : a5 51 __ LDA T5 + 0 
1dc1 : c9 15 __ CMP #$15
1dc3 : 90 04 __ BCC $1dc9 ; (nformf.s19 + 0)
.s44:
1dc5 : a9 14 __ LDA #$14
1dc7 : 85 51 __ STA T5 + 0 
.s19:
1dc9 : a5 4d __ LDA T3 + 0 
1dcb : d0 08 __ BNE $1dd5 ; (nformf.s21 + 0)
.s20:
1dcd : a9 30 __ LDA #$30
1dcf : a4 54 __ LDY T9 + 0 
1dd1 : 91 13 __ STA (P6),y ; (str + 0)
1dd3 : e6 54 __ INC T9 + 0 
.s21:
1dd5 : a9 00 __ LDA #$00
1dd7 : 85 56 __ STA T11 + 0 
1dd9 : c5 4d __ CMP T3 + 0 
1ddb : f0 6f __ BEQ $1e4c ; (nformf.l43 + 0)
.s23:
1ddd : c9 07 __ CMP #$07
1ddf : 90 04 __ BCC $1de5 ; (nformf.s24 + 0)
.l42:
1de1 : a9 30 __ LDA #$30
1de3 : b0 55 __ BCS $1e3a ; (nformf.l25 + 0)
.s24:
1de5 : 86 1b __ STX ACCU + 0 
1de7 : 86 43 __ STX T0 + 0 
1de9 : a5 16 __ LDA P9 ; (f + 1)
1deb : 85 1c __ STA ACCU + 1 
1ded : 85 44 __ STA T0 + 1 
1def : a5 17 __ LDA P10 ; (f + 2)
1df1 : 85 1d __ STA ACCU + 2 
1df3 : 85 45 __ STA T0 + 2 
1df5 : a5 18 __ LDA P11 ; (f + 3)
1df7 : 85 1e __ STA ACCU + 3 
1df9 : 85 46 __ STA T0 + 3 
1dfb : 20 49 4a JSR $4a49 ; (f32_to_i16 + 0)
1dfe : a5 1b __ LDA ACCU + 0 
1e00 : 85 53 __ STA T7 + 0 
1e02 : 20 95 4a JSR $4a95 ; (sint16_to_float + 0)
1e05 : a2 43 __ LDX #$43
1e07 : 20 71 46 JSR $4671 ; (freg + 4)
1e0a : a5 1e __ LDA ACCU + 3 
1e0c : 49 80 __ EOR #$80
1e0e : 85 1e __ STA ACCU + 3 
1e10 : 20 b8 46 JSR $46b8 ; (faddsub + 6)
1e13 : a9 00 __ LDA #$00
1e15 : 85 03 __ STA WORK + 0 
1e17 : 85 04 __ STA WORK + 1 
1e19 : a9 20 __ LDA #$20
1e1b : 85 05 __ STA WORK + 2 
1e1d : a9 41 __ LDA #$41
1e1f : 85 06 __ STA WORK + 3 
1e21 : 20 81 46 JSR $4681 ; (freg + 20)
1e24 : 20 9f 47 JSR $479f ; (crt_fmul + 0)
1e27 : a5 1c __ LDA ACCU + 1 
1e29 : 85 16 __ STA P9 ; (f + 1)
1e2b : a5 1d __ LDA ACCU + 2 
1e2d : 85 17 __ STA P10 ; (f + 2)
1e2f : a5 1e __ LDA ACCU + 3 
1e31 : 85 18 __ STA P11 ; (f + 3)
1e33 : 18 __ __ CLC
1e34 : a5 53 __ LDA T7 + 0 
1e36 : 69 30 __ ADC #$30
1e38 : a6 1b __ LDX ACCU + 0 
.l25:
1e3a : a4 54 __ LDY T9 + 0 
1e3c : 91 13 __ STA (P6),y ; (str + 0)
1e3e : e6 54 __ INC T9 + 0 
1e40 : e6 56 __ INC T11 + 0 
1e42 : a5 56 __ LDA T11 + 0 
1e44 : c5 51 __ CMP T5 + 0 
1e46 : b0 14 __ BCS $1e5c ; (nformf.s26 + 0)
.s22:
1e48 : c5 4d __ CMP T3 + 0 
1e4a : d0 91 __ BNE $1ddd ; (nformf.s23 + 0)
.l43:
1e4c : a9 2e __ LDA #$2e
1e4e : a4 54 __ LDY T9 + 0 
1e50 : 91 13 __ STA (P6),y ; (str + 0)
1e52 : a5 56 __ LDA T11 + 0 
1e54 : c9 07 __ CMP #$07
1e56 : e6 54 __ INC T9 + 0 
1e58 : 90 8b __ BCC $1de5 ; (nformf.s24 + 0)
1e5a : b0 85 __ BCS $1de1 ; (nformf.l42 + 0)
.s26:
1e5c : a5 55 __ LDA T10 + 0 
1e5e : f0 66 __ BEQ $1ec6 ; (nformf.s27 + 0)
.s38:
1e60 : a0 03 __ LDY #$03
1e62 : b1 4b __ LDA (T2 + 0),y 
1e64 : 69 03 __ ADC #$03
1e66 : a4 54 __ LDY T9 + 0 
1e68 : 91 13 __ STA (P6),y ; (str + 0)
1e6a : c8 __ __ INY
1e6b : 84 54 __ STY T9 + 0 
1e6d : 24 50 __ BIT T4 + 1 
1e6f : 30 06 __ BMI $1e77 ; (nformf.s41 + 0)
.s39:
1e71 : a9 2b __ LDA #$2b
1e73 : 91 13 __ STA (P6),y ; (str + 0)
1e75 : d0 11 __ BNE $1e88 ; (nformf.s40 + 0)
.s41:
1e77 : a9 2d __ LDA #$2d
1e79 : 91 13 __ STA (P6),y ; (str + 0)
1e7b : 38 __ __ SEC
1e7c : a9 00 __ LDA #$00
1e7e : e5 4f __ SBC T4 + 0 
1e80 : 85 4f __ STA T4 + 0 
1e82 : a9 00 __ LDA #$00
1e84 : e5 50 __ SBC T4 + 1 
1e86 : 85 50 __ STA T4 + 1 
.s40:
1e88 : a5 4f __ LDA T4 + 0 
1e8a : 85 1b __ STA ACCU + 0 
1e8c : a5 50 __ LDA T4 + 1 
1e8e : 85 1c __ STA ACCU + 1 
1e90 : e6 54 __ INC T9 + 0 
1e92 : a9 0a __ LDA #$0a
1e94 : 85 03 __ STA WORK + 0 
1e96 : a9 00 __ LDA #$00
1e98 : 85 04 __ STA WORK + 1 
1e9a : 20 57 49 JSR $4957 ; (divs16 + 0)
1e9d : 18 __ __ CLC
1e9e : a5 1b __ LDA ACCU + 0 
1ea0 : 69 30 __ ADC #$30
1ea2 : a4 54 __ LDY T9 + 0 
1ea4 : 91 13 __ STA (P6),y ; (str + 0)
1ea6 : a5 4f __ LDA T4 + 0 
1ea8 : 85 1b __ STA ACCU + 0 
1eaa : a5 50 __ LDA T4 + 1 
1eac : 85 1c __ STA ACCU + 1 
1eae : e6 54 __ INC T9 + 0 
1eb0 : a9 0a __ LDA #$0a
1eb2 : 85 03 __ STA WORK + 0 
1eb4 : a9 00 __ LDA #$00
1eb6 : 85 04 __ STA WORK + 1 
1eb8 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
1ebb : 18 __ __ CLC
1ebc : a5 05 __ LDA WORK + 2 
1ebe : 69 30 __ ADC #$30
1ec0 : a4 54 __ LDY T9 + 0 
1ec2 : 91 13 __ STA (P6),y ; (str + 0)
1ec4 : e6 54 __ INC T9 + 0 
.s27:
1ec6 : a5 54 __ LDA T9 + 0 
.s106:
1ec8 : a0 01 __ LDY #$01
1eca : d1 11 __ CMP (P4),y ; (si + 0)
1ecc : b0 69 __ BCS $1f37 ; (nformf.s3 + 0)
.s28:
1ece : a0 06 __ LDY #$06
1ed0 : b1 11 __ LDA (P4),y ; (si + 0)
1ed2 : f0 04 __ BEQ $1ed8 ; (nformf.s29 + 0)
.s94:
1ed4 : a6 54 __ LDX T9 + 0 
1ed6 : 90 6c __ BCC $1f44 ; (nformf.l36 + 0)
.s29:
1ed8 : a5 54 __ LDA T9 + 0 
1eda : f0 3c __ BEQ $1f18 ; (nformf.s30 + 0)
.s35:
1edc : e9 00 __ SBC #$00
1ede : a2 00 __ LDX #$00
1ee0 : b0 01 __ BCS $1ee3 ; (nformf.s108 + 0)
.s107:
1ee2 : ca __ __ DEX
.s108:
1ee3 : 18 __ __ CLC
1ee4 : 65 13 __ ADC P6 ; (str + 0)
1ee6 : 85 47 __ STA T1 + 0 
1ee8 : 8a __ __ TXA
1ee9 : 65 14 __ ADC P7 ; (str + 1)
1eeb : 85 48 __ STA T1 + 1 
1eed : a9 01 __ LDA #$01
1eef : 85 4b __ STA T2 + 0 
1ef1 : a6 14 __ LDX P7 ; (str + 1)
1ef3 : 38 __ __ SEC
.l95:
1ef4 : a0 01 __ LDY #$01
1ef6 : b1 11 __ LDA (P4),y ; (si + 0)
1ef8 : e5 4b __ SBC T2 + 0 
1efa : 85 4d __ STA T3 + 0 
1efc : 8a __ __ TXA
1efd : 69 ff __ ADC #$ff
1eff : 85 4e __ STA T3 + 1 
1f01 : 88 __ __ DEY
1f02 : b1 47 __ LDA (T1 + 0),y 
1f04 : a4 13 __ LDY P6 ; (str + 0)
1f06 : 91 4d __ STA (T3 + 0),y 
1f08 : a5 47 __ LDA T1 + 0 
1f0a : d0 02 __ BNE $1f0e ; (nformf.s98 + 0)
.s97:
1f0c : c6 48 __ DEC T1 + 1 
.s98:
1f0e : c6 47 __ DEC T1 + 0 
1f10 : e6 4b __ INC T2 + 0 
1f12 : a5 54 __ LDA T9 + 0 
1f14 : c5 4b __ CMP T2 + 0 
1f16 : b0 dc __ BCS $1ef4 ; (nformf.l95 + 0)
.s30:
1f18 : a9 00 __ LDA #$00
1f1a : 85 4d __ STA T3 + 0 
1f1c : 90 08 __ BCC $1f26 ; (nformf.l31 + 0)
.s33:
1f1e : a9 20 __ LDA #$20
1f20 : a4 4d __ LDY T3 + 0 
1f22 : 91 13 __ STA (P6),y ; (str + 0)
1f24 : e6 4d __ INC T3 + 0 
.l31:
1f26 : a0 01 __ LDY #$01
1f28 : b1 11 __ LDA (P4),y ; (si + 0)
1f2a : 38 __ __ SEC
1f2b : e5 54 __ SBC T9 + 0 
1f2d : 90 ef __ BCC $1f1e ; (nformf.s33 + 0)
.s34:
1f2f : c5 4d __ CMP T3 + 0 
1f31 : 90 02 __ BCC $1f35 ; (nformf.s32 + 0)
.s96:
1f33 : d0 e9 __ BNE $1f1e ; (nformf.s33 + 0)
.s32:
1f35 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
1f37 : 85 1b __ STA ACCU + 0 
1f39 : a2 03 __ LDX #$03
1f3b : bd ca cf LDA $cfca,x ; (nformf@stack + 0)
1f3e : 95 53 __ STA T7 + 0,x 
1f40 : ca __ __ DEX
1f41 : 10 f8 __ BPL $1f3b ; (nformf.s3 + 4)
1f43 : 60 __ __ RTS
.l36:
1f44 : 8a __ __ TXA
1f45 : a0 01 __ LDY #$01
1f47 : d1 11 __ CMP (P4),y ; (si + 0)
1f49 : b0 ea __ BCS $1f35 ; (nformf.s32 + 0)
.s37:
1f4b : a8 __ __ TAY
1f4c : a9 20 __ LDA #$20
1f4e : 91 13 __ STA (P6),y ; (str + 0)
1f50 : e8 __ __ INX
1f51 : 90 f1 __ BCC $1f44 ; (nformf.l36 + 0)
.s51:
1f53 : a5 51 __ LDA T5 + 0 
1f55 : c9 07 __ CMP #$07
1f57 : 90 14 __ BCC $1f6d ; (nformf.s58 + 0)
.s52:
1f59 : ad 65 4d LDA $4d65 ; (fround5[0] + 24)
1f5c : 85 47 __ STA T1 + 0 
1f5e : ad 66 4d LDA $4d66 ; (fround5[0] + 25)
1f61 : 85 48 __ STA T1 + 1 
1f63 : ad 67 4d LDA $4d67 ; (fround5[0] + 26)
1f66 : 85 49 __ STA T1 + 2 
1f68 : ad 68 4d LDA $4d68 ; (fround5[0] + 27)
1f6b : b0 15 __ BCS $1f82 ; (nformf.s53 + 0)
.s58:
1f6d : 0a __ __ ASL
1f6e : 0a __ __ ASL
1f6f : aa __ __ TAX
1f70 : bd 49 4d LDA $4d49,x ; (crt_malloc + 204)
1f73 : 85 47 __ STA T1 + 0 
1f75 : bd 4a 4d LDA $4d4a,x ; (crt_malloc + 205)
1f78 : 85 48 __ STA T1 + 1 
1f7a : bd 4b 4d LDA $4d4b,x ; (spentry + 0)
1f7d : 85 49 __ STA T1 + 2 
1f7f : bd 4c 4d LDA $4d4c,x ; (giocharmap + 0)
.s53:
1f82 : 85 4a __ STA T1 + 3 
1f84 : a5 43 __ LDA T0 + 0 
1f86 : 85 1b __ STA ACCU + 0 
1f88 : a5 44 __ LDA T0 + 1 
1f8a : 85 1c __ STA ACCU + 1 
1f8c : a5 45 __ LDA T0 + 2 
1f8e : 85 1d __ STA ACCU + 2 
1f90 : a5 46 __ LDA T0 + 3 
1f92 : 85 1e __ STA ACCU + 3 
1f94 : a2 47 __ LDX #$47
1f96 : 20 71 46 JSR $4671 ; (freg + 4)
1f99 : 20 b8 46 JSR $46b8 ; (faddsub + 6)
1f9c : a5 1c __ LDA ACCU + 1 
1f9e : 85 16 __ STA P9 ; (f + 1)
1fa0 : a5 1d __ LDA ACCU + 2 
1fa2 : 85 17 __ STA P10 ; (f + 2)
1fa4 : a6 1b __ LDX ACCU + 0 
1fa6 : a5 1e __ LDA ACCU + 3 
1fa8 : 85 18 __ STA P11 ; (f + 3)
1faa : 10 03 __ BPL $1faf ; (nformf.s55 + 0)
1fac : 4c b8 1d JMP $1db8 ; (nformf.s18 + 0)
.s55:
1faf : c9 41 __ CMP #$41
1fb1 : d0 06 __ BNE $1fb9 ; (nformf.s57 + 0)
.s56:
1fb3 : a5 17 __ LDA P10 ; (f + 2)
1fb5 : c9 20 __ CMP #$20
1fb7 : f0 02 __ BEQ $1fbb ; (nformf.s54 + 0)
.s57:
1fb9 : 90 f1 __ BCC $1fac ; (nformf.s53 + 42)
.s54:
1fbb : a9 00 __ LDA #$00
1fbd : 85 03 __ STA WORK + 0 
1fbf : 85 04 __ STA WORK + 1 
1fc1 : a9 20 __ LDA #$20
1fc3 : 85 05 __ STA WORK + 2 
1fc5 : a9 41 __ LDA #$41
1fc7 : 85 06 __ STA WORK + 3 
1fc9 : 20 81 46 JSR $4681 ; (freg + 20)
1fcc : 20 67 48 JSR $4867 ; (crt_fdiv + 0)
1fcf : a5 1c __ LDA ACCU + 1 
1fd1 : 85 16 __ STA P9 ; (f + 1)
1fd3 : a5 1d __ LDA ACCU + 2 
1fd5 : 85 17 __ STA P10 ; (f + 2)
1fd7 : a5 1e __ LDA ACCU + 3 
1fd9 : 85 18 __ STA P11 ; (f + 3)
1fdb : a6 1b __ LDX ACCU + 0 
1fdd : e6 4f __ INC T4 + 0 
1fdf : d0 cb __ BNE $1fac ; (nformf.s53 + 42)
.s101:
1fe1 : e6 50 __ INC T4 + 1 
1fe3 : 4c b8 1d JMP $1db8 ; (nformf.s18 + 0)
.s86:
1fe6 : 86 43 __ STX T0 + 0 
1fe8 : 85 47 __ STA T1 + 0 
1fea : a0 03 __ LDY #$03
1fec : b1 11 __ LDA (P4),y ; (si + 0)
1fee : 18 __ __ CLC
1fef : 69 08 __ ADC #$08
1ff1 : a4 43 __ LDY T0 + 0 
1ff3 : 91 13 __ STA (P6),y ; (str + 0)
1ff5 : 18 __ __ CLC
1ff6 : a0 03 __ LDY #$03
1ff8 : b1 11 __ LDA (P4),y ; (si + 0)
1ffa : 69 0d __ ADC #$0d
1ffc : a4 43 __ LDY T0 + 0 
1ffe : c8 __ __ INY
1fff : 91 13 __ STA (P6),y ; (str + 0)
2001 : a0 03 __ LDY #$03
2003 : b1 11 __ LDA (P4),y ; (si + 0)
2005 : 18 __ __ CLC
2006 : 69 05 __ ADC #$05
2008 : a4 47 __ LDY T1 + 0 
200a : 91 13 __ STA (P6),y ; (str + 0)
200c : 18 __ __ CLC
200d : a5 54 __ LDA T9 + 0 
200f : 69 03 __ ADC #$03
2011 : 85 54 __ STA T9 + 0 
2013 : 4c c8 1e JMP $1ec8 ; (nformf.s106 + 0)
.s88:
2016 : 20 27 20 JSR $2027 ; (isinf.s4 + 0)
2019 : a2 01 __ LDX #$01
201b : 86 54 __ STX T9 + 0 
201d : a8 __ __ TAY
201e : d0 03 __ BNE $2023 ; (nformf.s89 + 0)
2020 : 4c 80 1b JMP $1b80 ; (nformf.s7 + 0)
.s89:
2023 : a9 03 __ LDA #$03
2025 : d0 bf __ BNE $1fe6 ; (nformf.s86 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "D:/Arbeit/dev/oscar64/include/math.h"
.s4:
2027 : 06 0f __ ASL P2 ; (f + 2)
2029 : a5 10 __ LDA P3 ; (f + 3)
202b : 2a __ __ ROL
202c : c9 ff __ CMP #$ff
202e : d0 03 __ BNE $2033 ; (isinf.s6 + 0)
.s5:
2030 : a9 01 __ LDA #$01
2032 : 60 __ __ RTS
.s6:
2033 : a9 00 __ LDA #$00
.s3:
2035 : 60 __ __ RTS
--------------------------------------------------------------------
2036 : __ __ __ BYT 45 52 52 4f 52 3a 20 46 49 4c 45 20 4e 4f 54 20 : ERROR: FILE NOT 
2046 : __ __ __ BYT 46 4f 55 4e 44 0a 00                            : FOUND..
--------------------------------------------------------------------
fgets: ; fgets(u8*,i16,struct FILE*)->u8*
;  46, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
204d : a0 00 __ LDY #$00
204f : b1 17 __ LDA (P10),y ; (stream + 0)
2051 : 85 0e __ STA P1 
2053 : a5 13 __ LDA P6 ; (s + 0)
2055 : 85 0f __ STA P2 
2057 : a5 14 __ LDA P7 ; (s + 1)
2059 : 85 10 __ STA P3 
205b : a5 15 __ LDA P8 ; (n + 0)
205d : 85 11 __ STA P4 
205f : a5 16 __ LDA P9 ; (n + 1)
2061 : 85 12 __ STA P5 
2063 : 20 7d 20 JSR $207d ; (krnio_gets.s4 + 0)
2066 : a5 1c __ LDA ACCU + 1 
2068 : 30 04 __ BMI $206e ; (fgets.s5 + 0)
.s7:
206a : 05 1b __ ORA ACCU + 0 
206c : d0 06 __ BNE $2074 ; (fgets.s6 + 0)
.s5:
206e : a9 00 __ LDA #$00
2070 : 85 1b __ STA ACCU + 0 
2072 : f0 06 __ BEQ $207a ; (fgets.s3 + 0)
.s6:
2074 : a5 13 __ LDA P6 ; (s + 0)
2076 : 85 1b __ STA ACCU + 0 
2078 : a5 14 __ LDA P7 ; (s + 1)
.s3:
207a : 85 1c __ STA ACCU + 1 
207c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_gets: ; krnio_gets(u8,u8*,i16)->i16
;  98, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
207d : a9 40 __ LDA #$40
207f : a6 0e __ LDX P1 ; (fnum + 0)
2081 : dd 08 4e CMP $4e08,x ; (krnio_pstatus[0] + 0)
2084 : d0 07 __ BNE $208d ; (krnio_gets.s5 + 0)
.s18:
2086 : a9 00 __ LDA #$00
.s19:
2088 : 85 1b __ STA ACCU + 0 
.s3:
208a : 85 1c __ STA ACCU + 1 
208c : 60 __ __ RTS
.s5:
208d : 86 47 __ STX T3 + 0 
208f : 8a __ __ TXA
2090 : 20 15 21 JSR $2115 ; (krnio_chkin.s4 + 0)
2093 : aa __ __ TAX
2094 : d0 04 __ BNE $209a ; (krnio_gets.s7 + 0)
.s6:
2096 : a9 ff __ LDA #$ff
2098 : d0 ee __ BNE $2088 ; (krnio_gets.s19 + 0)
.s7:
209a : a2 00 __ LDX #$00
209c : 86 48 __ STX T4 + 0 
209e : 86 49 __ STX T4 + 1 
20a0 : 24 12 __ BIT P5 ; (num + 1)
20a2 : 30 28 __ BMI $20cc ; (krnio_gets.s20 + 0)
.l17:
20a4 : 18 __ __ CLC
20a5 : a5 48 __ LDA T4 + 0 
20a7 : 69 01 __ ADC #$01
20a9 : 85 45 __ STA T2 + 0 
20ab : a5 49 __ LDA T4 + 1 
20ad : 69 00 __ ADC #$00
20af : 85 46 __ STA T2 + 1 
20b1 : c5 12 __ CMP P5 ; (num + 1)
20b3 : d0 04 __ BNE $20b9 ; (krnio_gets.s16 + 0)
.s15:
20b5 : a5 45 __ LDA T2 + 0 
20b7 : c5 11 __ CMP P4 ; (num + 0)
.s16:
20b9 : b0 11 __ BCS $20cc ; (krnio_gets.s20 + 0)
.s10:
20bb : 20 2a 21 JSR $212a ; (krnio_chrin.s4 + 0)
20be : 85 4a __ STA T8 + 0 
20c0 : 20 32 21 JSR $2132 ; (krnio_status.s4 + 0)
20c3 : a4 49 __ LDY T4 + 1 
20c5 : aa __ __ TAX
20c6 : f0 09 __ BEQ $20d1 ; (krnio_gets.s11 + 0)
.s14:
20c8 : e0 40 __ CPX #$40
20ca : f0 05 __ BEQ $20d1 ; (krnio_gets.s11 + 0)
.s20:
20cc : a4 0f __ LDY P2 ; (data + 0)
20ce : 4c f4 20 JMP $20f4 ; (krnio_gets.s9 + 0)
.s11:
20d1 : e6 48 __ INC T4 + 0 
20d3 : a5 46 __ LDA T2 + 1 
20d5 : 85 49 __ STA T4 + 1 
20d7 : c6 45 __ DEC T2 + 0 
20d9 : 98 __ __ TYA
20da : 18 __ __ CLC
20db : 65 10 __ ADC P3 ; (data + 1)
20dd : 85 46 __ STA T2 + 1 
20df : a5 4a __ LDA T8 + 0 
20e1 : a4 0f __ LDY P2 ; (data + 0)
20e3 : 91 45 __ STA (T2 + 0),y 
20e5 : c9 0d __ CMP #$0d
20e7 : f0 0b __ BEQ $20f4 ; (krnio_gets.s9 + 0)
.s12:
20e9 : c9 0a __ CMP #$0a
20eb : f0 07 __ BEQ $20f4 ; (krnio_gets.s9 + 0)
.s13:
20ed : 8a __ __ TXA
20ee : d0 04 __ BNE $20f4 ; (krnio_gets.s9 + 0)
.s8:
20f0 : 24 12 __ BIT P5 ; (num + 1)
20f2 : 10 b0 __ BPL $20a4 ; (krnio_gets.l17 + 0)
.s9:
20f4 : 8a __ __ TXA
20f5 : a6 47 __ LDX T3 + 0 
20f7 : 9d 08 4e STA $4e08,x ; (krnio_pstatus[0] + 0)
20fa : a5 48 __ LDA T4 + 0 
20fc : 85 43 __ STA T0 + 0 
20fe : 18 __ __ CLC
20ff : a5 10 __ LDA P3 ; (data + 1)
2101 : 65 49 __ ADC T4 + 1 
2103 : 85 44 __ STA T0 + 1 
2105 : a9 00 __ LDA #$00
2107 : 91 43 __ STA (T0 + 0),y 
2109 : 20 3e 21 JSR $213e ; (krnio_clrchn.s4 + 0)
210c : a5 48 __ LDA T4 + 0 
210e : 85 1b __ STA ACCU + 0 
2110 : a5 49 __ LDA T4 + 1 
2112 : 85 1c __ STA ACCU + 1 
2114 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
2115 : 85 0d __ STA P0 
2117 : a6 0d __ LDX P0 
2119 : 20 c6 ff JSR $ffc6 
211c : a9 00 __ LDA #$00
211e : 2a __ __ ROL
211f : 49 01 __ EOR #$01
2121 : 85 1b __ STA ACCU + 0 
2123 : a5 1b __ LDA ACCU + 0 
2125 : f0 02 __ BEQ $2129 ; (krnio_chkin.s3 + 0)
.s5:
2127 : a9 01 __ LDA #$01
.s3:
2129 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
212a : 20 cf ff JSR $ffcf 
212d : 85 1b __ STA ACCU + 0 
.s3:
212f : a5 1b __ LDA ACCU + 0 
2131 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
2132 : 20 b7 ff JSR $ffb7 
2135 : 85 1b __ STA ACCU + 0 
2137 : a9 00 __ LDA #$00
2139 : 85 1c __ STA ACCU + 1 
.s3:
213b : a5 1b __ LDA ACCU + 0 
213d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
213e : 20 cc ff JSR $ffcc 
.s3:
2141 : 60 __ __ RTS
--------------------------------------------------------------------
parse_next_int: ; parse_next_int(const u8*,i16*)->const u8*
; 109, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
2142 : a9 00 __ LDA #$00
2144 : 85 43 __ STA T0 + 0 
2146 : 85 44 __ STA T0 + 1 
2148 : a9 01 __ LDA #$01
214a : 85 47 __ STA T3 + 0 
214c : a0 00 __ LDY #$00
214e : b1 0d __ LDA (P0),y ; (str + 0)
2150 : f0 24 __ BEQ $2176 ; (parse_next_int.s5 + 0)
.l11:
2152 : a5 0d __ LDA P0 ; (str + 0)
2154 : 85 45 __ STA T1 + 0 
2156 : a5 0e __ LDA P1 ; (str + 1)
2158 : 85 46 __ STA T1 + 1 
215a : a0 00 __ LDY #$00
215c : b1 0d __ LDA (P0),y ; (str + 0)
215e : c9 30 __ CMP #$30
2160 : b0 03 __ BCS $2165 ; (parse_next_int.s12 + 0)
2162 : 4c 02 22 JMP $2202 ; (parse_next_int.s14 + 0)
.s12:
2165 : c9 3a __ CMP #$3a
2167 : 90 0d __ BCC $2176 ; (parse_next_int.s5 + 0)
.s13:
2169 : e6 0d __ INC P0 ; (str + 0)
216b : d0 02 __ BNE $216f ; (parse_next_int.s20 + 0)
.s19:
216d : e6 0e __ INC P1 ; (str + 1)
.s20:
216f : a0 01 __ LDY #$01
2171 : b1 45 __ LDA (T1 + 0),y 
2173 : d0 dd __ BNE $2152 ; (parse_next_int.l11 + 0)
.s21:
2175 : a8 __ __ TAY
.s5:
2176 : b1 0d __ LDA (P0),y ; (str + 0)
2178 : c9 2d __ CMP #$2d
217a : d0 0a __ BNE $2186 ; (parse_next_int.s6 + 0)
.s10:
217c : e6 0d __ INC P0 ; (str + 0)
217e : d0 02 __ BNE $2182 ; (parse_next_int.s16 + 0)
.s15:
2180 : e6 0e __ INC P1 ; (str + 1)
.s16:
2182 : a9 ff __ LDA #$ff
2184 : 85 47 __ STA T3 + 0 
.s6:
2186 : b1 0d __ LDA (P0),y ; (str + 0)
2188 : c9 30 __ CMP #$30
218a : 90 4b __ BCC $21d7 ; (parse_next_int.s7 + 0)
.l8:
218c : a5 0d __ LDA P0 ; (str + 0)
218e : 85 45 __ STA T1 + 0 
2190 : a5 0e __ LDA P1 ; (str + 1)
2192 : 85 46 __ STA T1 + 1 
2194 : a0 00 __ LDY #$00
2196 : b1 0d __ LDA (P0),y ; (str + 0)
2198 : c9 3a __ CMP #$3a
219a : b0 3b __ BCS $21d7 ; (parse_next_int.s7 + 0)
.s9:
219c : e9 2f __ SBC #$2f
219e : aa __ __ TAX
219f : 98 __ __ TYA
21a0 : e9 00 __ SBC #$00
21a2 : 85 1c __ STA ACCU + 1 
21a4 : e6 0d __ INC P0 ; (str + 0)
21a6 : d0 02 __ BNE $21aa ; (parse_next_int.s18 + 0)
.s17:
21a8 : e6 0e __ INC P1 ; (str + 1)
.s18:
21aa : a5 43 __ LDA T0 + 0 
21ac : 0a __ __ ASL
21ad : 85 1b __ STA ACCU + 0 
21af : a5 44 __ LDA T0 + 1 
21b1 : 2a __ __ ROL
21b2 : 06 1b __ ASL ACCU + 0 
21b4 : 2a __ __ ROL
21b5 : a8 __ __ TAY
21b6 : 18 __ __ CLC
21b7 : a5 1b __ LDA ACCU + 0 
21b9 : 65 43 __ ADC T0 + 0 
21bb : 85 43 __ STA T0 + 0 
21bd : 98 __ __ TYA
21be : 65 44 __ ADC T0 + 1 
21c0 : 06 43 __ ASL T0 + 0 
21c2 : 2a __ __ ROL
21c3 : a8 __ __ TAY
21c4 : 8a __ __ TXA
21c5 : 18 __ __ CLC
21c6 : 65 43 __ ADC T0 + 0 
21c8 : 85 43 __ STA T0 + 0 
21ca : 98 __ __ TYA
21cb : 65 1c __ ADC ACCU + 1 
21cd : 85 44 __ STA T0 + 1 
21cf : a9 2f __ LDA #$2f
21d1 : a0 01 __ LDY #$01
21d3 : d1 45 __ CMP (T1 + 0),y 
21d5 : 90 b5 __ BCC $218c ; (parse_next_int.l8 + 0)
.s7:
21d7 : a5 47 __ LDA T3 + 0 
21d9 : 85 1b __ STA ACCU + 0 
21db : 29 80 __ AND #$80
21dd : 10 02 __ BPL $21e1 ; (parse_next_int.s7 + 10)
21df : a9 ff __ LDA #$ff
21e1 : 85 1c __ STA ACCU + 1 
21e3 : a5 43 __ LDA T0 + 0 
21e5 : 85 03 __ STA WORK + 0 
21e7 : a5 44 __ LDA T0 + 1 
21e9 : 85 04 __ STA WORK + 1 
21eb : 20 15 49 JSR $4915 ; (mul16 + 0)
21ee : a5 05 __ LDA WORK + 2 
21f0 : a0 00 __ LDY #$00
21f2 : 91 0f __ STA (P2),y ; (value + 0)
21f4 : a5 06 __ LDA WORK + 3 
21f6 : c8 __ __ INY
21f7 : 91 0f __ STA (P2),y ; (value + 0)
21f9 : a5 0d __ LDA P0 ; (str + 0)
21fb : 85 1b __ STA ACCU + 0 
21fd : a5 0e __ LDA P1 ; (str + 1)
21ff : 85 1c __ STA ACCU + 1 
.s3:
2201 : 60 __ __ RTS
.s14:
2202 : c9 2d __ CMP #$2d
2204 : d0 03 __ BNE $2209 ; (parse_next_int.s14 + 7)
2206 : 4c 76 21 JMP $2176 ; (parse_next_int.s5 + 0)
2209 : 4c 69 21 JMP $2169 ; (parse_next_int.s13 + 0)
--------------------------------------------------------------------
220c : __ __ __ BYT 43 3a 20 25 64 0a 00                            : C: %d..
--------------------------------------------------------------------
2213 : __ __ __ BYT 44 3a 20 25 64 0a 00                            : D: %d..
--------------------------------------------------------------------
221a : __ __ __ BYT 48 3a 20 25 64 0a 00                            : H: %d..
--------------------------------------------------------------------
2221 : __ __ __ BYT 55 3a 20 25 64 0a 00                            : U: %d..
--------------------------------------------------------------------
2228 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 2e 2e 2e 0a 00          : LOADING .....
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
2235 : 85 0d __ STA P0 
2237 : a5 0d __ LDA P0 
2239 : 20 c3 ff JSR $ffc3 
.s3:
223c : 60 __ __ RTS
--------------------------------------------------------------------
load_plane_data: ; load_plane_data(i16)->void
; 186, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
223d : a5 53 __ LDA T6 + 0 
223f : 8d ad cf STA $cfad ; (load_plane_data@stack + 0)
.s4:
2242 : a9 68 __ LDA #$68
2244 : 85 10 __ STA P3 
2246 : a9 13 __ LDA #$13
2248 : 85 13 __ STA P6 
224a : a9 23 __ LDA #$23
224c : 85 11 __ STA P4 
224e : a9 c5 __ LDA #$c5
2250 : 85 12 __ STA P5 
2252 : 20 ec 11 JSR $11ec ; (fopen.s4 + 0)
2255 : a5 1c __ LDA ACCU + 1 
2257 : 85 10 __ STA P3 
2259 : a5 1b __ LDA ACCU + 0 
225b : 85 0f __ STA P2 
225d : d0 07 __ BNE $2266 ; (load_plane_data.s5 + 0)
.s28:
225f : a5 10 __ LDA P3 
2261 : d0 03 __ BNE $2266 ; (load_plane_data.s5 + 0)
2263 : 4c 5c 23 JMP $235c ; (load_plane_data.s3 + 0)
.s5:
2266 : a5 14 __ LDA P7 ; (capacity + 0)
2268 : 0a __ __ ASL
2269 : 85 1b __ STA ACCU + 0 
226b : a5 15 __ LDA P8 ; (capacity + 1)
226d : 2a __ __ ROL
226e : 85 1c __ STA ACCU + 1 
2270 : 20 7d 4c JSR $4c7d ; (crt_malloc + 0)
2273 : a5 1b __ LDA ACCU + 0 
2275 : 85 4f __ STA T4 + 0 
2277 : 8d 69 4d STA $4d69 ; (plane_data + 0)
227a : a5 1c __ LDA ACCU + 1 
227c : 85 50 __ STA T4 + 1 
227e : 8d 6a 4d STA $4d6a ; (plane_data + 1)
2281 : a9 00 __ LDA #$00
2283 : 85 51 __ STA T5 + 0 
2285 : 85 52 __ STA T5 + 1 
.l6:
2287 : a9 00 __ LDA #$00
2289 : 85 4d __ STA T1 + 0 
228b : 85 4e __ STA T1 + 1 
.l29:
228d : 85 53 __ STA T6 + 0 
.l7:
228f : 20 73 23 JSR $2373 ; (fgetc.s4 + 0)
2292 : a5 1c __ LDA ACCU + 1 
2294 : a4 1b __ LDY ACCU + 0 
2296 : c9 ff __ CMP #$ff
2298 : d0 04 __ BNE $229e ; (load_plane_data.s15 + 0)
.s27:
229a : c5 1b __ CMP ACCU + 0 
229c : f0 76 __ BEQ $2314 ; (load_plane_data.s8 + 0)
.s15:
229e : aa __ __ TAX
229f : 30 0d __ BMI $22ae ; (load_plane_data.s16 + 0)
.s26:
22a1 : d0 04 __ BNE $22a7 ; (load_plane_data.s22 + 0)
.s25:
22a3 : c0 30 __ CPY #$30
22a5 : 90 07 __ BCC $22ae ; (load_plane_data.s16 + 0)
.s22:
22a7 : aa __ __ TAX
22a8 : d0 04 __ BNE $22ae ; (load_plane_data.s16 + 0)
.s24:
22aa : c0 3a __ CPY #$3a
22ac : 90 39 __ BCC $22e7 ; (load_plane_data.s23 + 0)
.s16:
22ae : a5 53 __ LDA T6 + 0 
22b0 : f0 dd __ BEQ $228f ; (load_plane_data.l7 + 0)
.s17:
22b2 : 24 15 __ BIT P8 ; (capacity + 1)
22b4 : 30 d1 __ BMI $2287 ; (load_plane_data.l6 + 0)
.s21:
22b6 : a5 52 __ LDA T5 + 1 
22b8 : c5 15 __ CMP P8 ; (capacity + 1)
22ba : f0 23 __ BEQ $22df ; (load_plane_data.s19 + 0)
.s20:
22bc : b0 c9 __ BCS $2287 ; (load_plane_data.l6 + 0)
.s34:
22be : a5 51 __ LDA T5 + 0 
.s18:
22c0 : 0a __ __ ASL
22c1 : 85 43 __ STA T0 + 0 
22c3 : a5 52 __ LDA T5 + 1 
22c5 : 2a __ __ ROL
22c6 : 18 __ __ CLC
22c7 : 65 50 __ ADC T4 + 1 
22c9 : 85 44 __ STA T0 + 1 
22cb : a5 4d __ LDA T1 + 0 
22cd : a4 4f __ LDY T4 + 0 
22cf : 91 43 __ STA (T0 + 0),y 
22d1 : a5 4e __ LDA T1 + 1 
22d3 : c8 __ __ INY
22d4 : 91 43 __ STA (T0 + 0),y 
22d6 : e6 51 __ INC T5 + 0 
22d8 : d0 ad __ BNE $2287 ; (load_plane_data.l6 + 0)
.s30:
22da : e6 52 __ INC T5 + 1 
22dc : 4c 87 22 JMP $2287 ; (load_plane_data.l6 + 0)
.s19:
22df : a5 51 __ LDA T5 + 0 
22e1 : c5 14 __ CMP P7 ; (capacity + 0)
22e3 : 90 db __ BCC $22c0 ; (load_plane_data.s18 + 0)
22e5 : b0 a0 __ BCS $2287 ; (load_plane_data.l6 + 0)
.s23:
22e7 : a5 4d __ LDA T1 + 0 
22e9 : 0a __ __ ASL
22ea : 85 1b __ STA ACCU + 0 
22ec : a5 4e __ LDA T1 + 1 
22ee : 2a __ __ ROL
22ef : 06 1b __ ASL ACCU + 0 
22f1 : 2a __ __ ROL
22f2 : aa __ __ TAX
22f3 : 18 __ __ CLC
22f4 : a5 1b __ LDA ACCU + 0 
22f6 : 65 4d __ ADC T1 + 0 
22f8 : 85 4d __ STA T1 + 0 
22fa : 8a __ __ TXA
22fb : 65 4e __ ADC T1 + 1 
22fd : 06 4d __ ASL T1 + 0 
22ff : 2a __ __ ROL
2300 : aa __ __ TAX
2301 : 98 __ __ TYA
2302 : 38 __ __ SEC
2303 : e9 30 __ SBC #$30
2305 : 18 __ __ CLC
2306 : 65 4d __ ADC T1 + 0 
2308 : 85 4d __ STA T1 + 0 
230a : 90 01 __ BCC $230d ; (load_plane_data.s32 + 0)
.s31:
230c : e8 __ __ INX
.s32:
230d : 86 4e __ STX T1 + 1 
230f : a9 01 __ LDA #$01
2311 : 4c 8d 22 JMP $228d ; (load_plane_data.l29 + 0)
.s8:
2314 : a0 00 __ LDY #$00
2316 : b1 0f __ LDA (P2),y 
2318 : aa __ __ TAX
2319 : a5 53 __ LDA T6 + 0 
231b : f0 2c __ BEQ $2349 ; (load_plane_data.s9 + 0)
.s10:
231d : 24 15 __ BIT P8 ; (capacity + 1)
231f : 30 28 __ BMI $2349 ; (load_plane_data.s9 + 0)
.s14:
2321 : a5 52 __ LDA T5 + 1 
2323 : c5 15 __ CMP P8 ; (capacity + 1)
2325 : d0 3b __ BNE $2362 ; (load_plane_data.s13 + 0)
.s12:
2327 : a5 51 __ LDA T5 + 0 
2329 : c5 14 __ CMP P7 ; (capacity + 0)
232b : b0 1c __ BCS $2349 ; (load_plane_data.s9 + 0)
.s11:
232d : 0a __ __ ASL
232e : 85 43 __ STA T0 + 0 
2330 : a5 52 __ LDA T5 + 1 
2332 : 2a __ __ ROL
2333 : 18 __ __ CLC
2334 : 65 50 __ ADC T4 + 1 
2336 : 85 44 __ STA T0 + 1 
2338 : a5 4d __ LDA T1 + 0 
233a : a4 4f __ LDY T4 + 0 
233c : 91 43 __ STA (T0 + 0),y 
233e : a5 4e __ LDA T1 + 1 
2340 : c8 __ __ INY
2341 : 91 43 __ STA (T0 + 0),y 
2343 : e6 51 __ INC T5 + 0 
2345 : d0 02 __ BNE $2349 ; (load_plane_data.s9 + 0)
.s33:
2347 : e6 52 __ INC T5 + 1 
.s9:
2349 : a5 51 __ LDA T5 + 0 
234b : 8d 6b 4d STA $4d6b ; (plane_data_count + 0)
234e : a5 52 __ LDA T5 + 1 
2350 : 8d 6c 4d STA $4d6c ; (plane_data_count + 1)
2353 : 8a __ __ TXA
2354 : 20 35 22 JSR $2235 ; (krnio_close.s4 + 0)
2357 : a9 00 __ LDA #$00
2359 : a8 __ __ TAY
235a : 91 0f __ STA (P2),y 
.s3:
235c : ad ad cf LDA $cfad ; (load_plane_data@stack + 0)
235f : 85 53 __ STA T6 + 0 
2361 : 60 __ __ RTS
.s13:
2362 : b0 e5 __ BCS $2349 ; (load_plane_data.s9 + 0)
.s35:
2364 : a5 51 __ LDA T5 + 0 
2366 : 90 c5 __ BCC $232d ; (load_plane_data.s11 + 0)
--------------------------------------------------------------------
2368 : __ __ __ BYT 50 4c 41 4e 45 53 2c 53 2c 52 00                : PLANES,S,R.
--------------------------------------------------------------------
fgetc: ; fgetc(struct FILE*)->i16
;  44, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
2373 : a0 00 __ LDY #$00
2375 : b1 0f __ LDA (P2),y ; (stream + 0)
2377 : 10 0a __ BPL $2383 ; (fgetc.s6 + 0)
.s5:
2379 : 20 d6 23 JSR $23d6 ; (getpch.s4 + 0)
237c : 85 1b __ STA ACCU + 0 
237e : a9 00 __ LDA #$00
2380 : 85 1c __ STA ACCU + 1 
.s3:
2382 : 60 __ __ RTS
.s6:
2383 : 85 0e __ STA P1 
2385 : 4c 88 23 JMP $2388 ; (krnio_getch.s4 + 0)
--------------------------------------------------------------------
krnio_getch: ; krnio_getch(u8)->i16
;  73, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
2388 : a9 40 __ LDA #$40
238a : a4 0e __ LDY P1 ; (fnum + 0)
238c : d9 08 4e CMP $4e08,y ; (krnio_pstatus[0] + 0)
238f : f0 3f __ BEQ $23d0 ; (krnio_getch.s12 + 0)
.s5:
2391 : 98 __ __ TYA
2392 : 20 15 21 JSR $2115 ; (krnio_chkin.s4 + 0)
2395 : aa __ __ TAX
2396 : d0 12 __ BNE $23aa ; (krnio_getch.s8 + 0)
.s6:
2398 : a9 ff __ LDA #$ff
239a : 85 43 __ STA T0 + 0 
239c : 85 44 __ STA T0 + 1 
.s7:
239e : 20 3e 21 JSR $213e ; (krnio_clrchn.s4 + 0)
23a1 : a5 43 __ LDA T0 + 0 
23a3 : 85 1b __ STA ACCU + 0 
23a5 : a5 44 __ LDA T0 + 1 
.s3:
23a7 : 85 1c __ STA ACCU + 1 
23a9 : 60 __ __ RTS
.s8:
23aa : 20 2a 21 JSR $212a ; (krnio_chrin.s4 + 0)
23ad : 85 43 __ STA T0 + 0 
23af : 20 32 21 JSR $2132 ; (krnio_status.s4 + 0)
23b2 : a6 0e __ LDX P1 ; (fnum + 0)
23b4 : 9d 08 4e STA $4e08,x ; (krnio_pstatus[0] + 0)
23b7 : a2 00 __ LDX #$00
23b9 : 86 44 __ STX T0 + 1 
23bb : aa __ __ TAX
23bc : f0 e0 __ BEQ $239e ; (krnio_getch.s7 + 0)
.s9:
23be : c9 40 __ CMP #$40
23c0 : d0 0b __ BNE $23cd ; (krnio_getch.s10 + 0)
.s11:
23c2 : 20 3e 21 JSR $213e ; (krnio_clrchn.s4 + 0)
23c5 : a5 43 __ LDA T0 + 0 
23c7 : 85 1b __ STA ACCU + 0 
23c9 : a9 01 __ LDA #$01
23cb : d0 da __ BNE $23a7 ; (krnio_getch.s3 + 0)
.s10:
23cd : 20 3e 21 JSR $213e ; (krnio_clrchn.s4 + 0)
.s12:
23d0 : a9 ff __ LDA #$ff
23d2 : 85 1b __ STA ACCU + 0 
23d4 : d0 d1 __ BNE $23a7 ; (krnio_getch.s3 + 0)
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "D:/Arbeit/dev/oscar64/include/conio.h"
.s4:
23d6 : 20 cf ff JSR $ffcf 
23d9 : 85 1b __ STA ACCU + 0 
23db : a5 1b __ LDA ACCU + 0 
23dd : 4c e0 23 JMP $23e0 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "D:/Arbeit/dev/oscar64/include/conio.c"
.s4:
23e0 : a8 __ __ TAY
23e1 : ad 4c 4d LDA $4d4c ; (giocharmap + 0)
23e4 : f0 27 __ BEQ $240d ; (convch.s5 + 0)
.s6:
23e6 : c0 0d __ CPY #$0d
23e8 : d0 03 __ BNE $23ed ; (convch.s7 + 0)
.s16:
23ea : a9 0a __ LDA #$0a
.s3:
23ec : 60 __ __ RTS
.s7:
23ed : c9 02 __ CMP #$02
23ef : 90 1c __ BCC $240d ; (convch.s5 + 0)
.s8:
23f1 : c0 41 __ CPY #$41
23f3 : 90 18 __ BCC $240d ; (convch.s5 + 0)
.s9:
23f5 : c0 db __ CPY #$db
23f7 : b0 14 __ BCS $240d ; (convch.s5 + 0)
.s10:
23f9 : 98 __ __ TYA
23fa : c0 c1 __ CPY #$c1
23fc : 90 03 __ BCC $2401 ; (convch.s11 + 0)
.s15:
23fe : 49 a0 __ EOR #$a0
2400 : a8 __ __ TAY
.s11:
2401 : c9 7b __ CMP #$7b
2403 : b0 08 __ BCS $240d ; (convch.s5 + 0)
.s12:
2405 : c9 61 __ CMP #$61
2407 : b0 06 __ BCS $240f ; (convch.s14 + 0)
.s13:
2409 : c9 5b __ CMP #$5b
240b : 90 02 __ BCC $240f ; (convch.s14 + 0)
.s5:
240d : 98 __ __ TYA
240e : 60 __ __ RTS
.s14:
240f : 49 20 __ EOR #$20
2411 : 60 __ __ RTS
--------------------------------------------------------------------
init_hires: ; init_hires()->void
;  80, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
2412 : 20 7c 24 JSR $247c ; (mmap_trampoline.s4 + 0)
2415 : a9 30 __ LDA #$30
2417 : 85 01 __ STA $01 
2419 : a9 00 __ LDA #$00
241b : 85 0f __ STA P2 
241d : 85 10 __ STA P3 
241f : a9 40 __ LDA #$40
2421 : 85 11 __ STA P4 
2423 : a9 1f __ LDA #$1f
2425 : 85 12 __ STA P5 
2427 : a9 50 __ LDA #$50
2429 : a2 fa __ LDX #$fa
.l6:
242b : ca __ __ DEX
242c : 9d 00 d0 STA $d000,x 
242f : 9d fa d0 STA $d0fa,x 
2432 : 9d f4 d1 STA $d1f4,x 
2435 : 9d ee d2 STA $d2ee,x 
2438 : d0 f1 __ BNE $242b ; (init_hires.l6 + 0)
.s5:
243a : a9 00 __ LDA #$00
243c : 85 0d __ STA P0 
243e : a9 e0 __ LDA #$e0
2440 : 85 0e __ STA P1 
2442 : 20 c6 24 JSR $24c6 ; (memset.s4 + 0)
2445 : a9 35 __ LDA #$35
2447 : 85 01 __ STA $01 
2449 : a9 00 __ LDA #$00
244b : 85 10 __ STA P3 
244d : 85 0e __ STA P1 
244f : a9 03 __ LDA #$03
2451 : 85 0d __ STA P0 
2453 : a9 e0 __ LDA #$e0
2455 : 85 11 __ STA P4 
2457 : a9 d0 __ LDA #$d0
2459 : 85 0f __ STA P2 
245b : 20 ea 24 JSR $24ea ; (vic_setmode.s4 + 0)
245e : a9 00 __ LDA #$00
2460 : 8d 20 d0 STA $d020 
2463 : 85 0f __ STA P2 
2465 : a9 e0 __ LDA #$e0
2467 : 85 10 __ STA P3 
2469 : a9 4e __ LDA #$4e
246b : 85 0e __ STA P1 
246d : a9 28 __ LDA #$28
246f : 85 11 __ STA P4 
2471 : a9 19 __ LDA #$19
2473 : 85 12 __ STA P5 
2475 : a9 30 __ LDA #$30
2477 : 85 0d __ STA P0 
2479 : 4c 3c 25 JMP $253c ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "D:/Arbeit/dev/oscar64/include/c64/memmap.h"
.s4:
247c : a9 91 __ LDA #$91
247e : 8d fa ff STA $fffa 
2481 : a9 24 __ LDA #$24
2483 : 8d fb ff STA $fffb 
2486 : a9 af __ LDA #$af
2488 : 8d fe ff STA $fffe 
248b : a9 24 __ LDA #$24
248d : 8d ff ff STA $ffff 
.s3:
2490 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
2491 : 48 __ __ PHA
2492 : 8a __ __ TXA
2493 : 48 __ __ PHA
2494 : a9 24 __ LDA #$24
2496 : 48 __ __ PHA
2497 : a9 a8 __ LDA #$a8
2499 : 48 __ __ PHA
249a : ba __ __ TSX
249b : bd 05 01 LDA $0105,x 
249e : 48 __ __ PHA
249f : a6 01 __ LDX $01 
24a1 : a9 36 __ LDA #$36
24a3 : 85 01 __ STA $01 
24a5 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
24a8 : 86 01 __ STX $01 
24aa : 68 __ __ PLA
24ab : aa __ __ TAX
24ac : 68 __ __ PLA
24ad : 40 __ __ RTI
24ae : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
24af : 48 __ __ PHA
24b0 : 8a __ __ TXA
24b1 : 48 __ __ PHA
24b2 : a9 24 __ LDA #$24
24b4 : 48 __ __ PHA
24b5 : a9 a8 __ LDA #$a8
24b7 : 48 __ __ PHA
24b8 : ba __ __ TSX
24b9 : bd 05 01 LDA $0105,x 
24bc : 48 __ __ PHA
24bd : a6 01 __ LDX $01 
24bf : a9 36 __ LDA #$36
24c1 : 85 01 __ STA $01 
24c3 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "D:/Arbeit/dev/oscar64/include/string.h"
.s4:
24c6 : a5 0f __ LDA P2 
24c8 : a6 12 __ LDX P5 
24ca : f0 0c __ BEQ $24d8 ; (memset.s4 + 18)
24cc : a0 00 __ LDY #$00
24ce : 91 0d __ STA (P0),y ; (dst + 0)
24d0 : c8 __ __ INY
24d1 : d0 fb __ BNE $24ce ; (memset.s4 + 8)
24d3 : e6 0e __ INC P1 ; (dst + 1)
24d5 : ca __ __ DEX
24d6 : d0 f6 __ BNE $24ce ; (memset.s4 + 8)
24d8 : a4 11 __ LDY P4 
24da : f0 05 __ BEQ $24e1 ; (memset.s4 + 27)
24dc : 88 __ __ DEY
24dd : 91 0d __ STA (P0),y ; (dst + 0)
24df : d0 fb __ BNE $24dc ; (memset.s4 + 22)
24e1 : a5 0d __ LDA P0 ; (dst + 0)
24e3 : 85 1b __ STA ACCU + 0 
24e5 : a5 0e __ LDA P1 ; (dst + 1)
24e7 : 85 1c __ STA ACCU + 1 
.s3:
24e9 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  97, "D:/Arbeit/dev/oscar64/include/c64/vic.h"
.s4:
24ea : a4 0d __ LDY P0 ; (mode + 0)
24ec : c0 02 __ CPY #$02
24ee : d0 09 __ BNE $24f9 ; (vic_setmode.s5 + 0)
.s10:
24f0 : a9 5b __ LDA #$5b
24f2 : 8d 11 d0 STA $d011 
.s8:
24f5 : a9 08 __ LDA #$08
24f7 : d0 0c __ BNE $2505 ; (vic_setmode.s7 + 0)
.s5:
24f9 : b0 36 __ BCS $2531 ; (vic_setmode.s6 + 0)
.s9:
24fb : a9 1b __ LDA #$1b
24fd : 8d 11 d0 STA $d011 
2500 : 98 __ __ TYA
2501 : f0 f2 __ BEQ $24f5 ; (vic_setmode.s8 + 0)
.s11:
2503 : a9 18 __ LDA #$18
.s7:
2505 : 8d 16 d0 STA $d016 
2508 : ad 00 dd LDA $dd00 
250b : 29 fc __ AND #$fc
250d : 85 1b __ STA ACCU + 0 
250f : a5 0f __ LDA P2 ; (text + 1)
2511 : 0a __ __ ASL
2512 : 2a __ __ ROL
2513 : 29 01 __ AND #$01
2515 : 2a __ __ ROL
2516 : 49 03 __ EOR #$03
2518 : 05 1b __ ORA ACCU + 0 
251a : 8d 00 dd STA $dd00 
251d : a5 0f __ LDA P2 ; (text + 1)
251f : 29 3c __ AND #$3c
2521 : 0a __ __ ASL
2522 : 0a __ __ ASL
2523 : 85 1b __ STA ACCU + 0 
2525 : a5 11 __ LDA P4 ; (font + 1)
2527 : 29 38 __ AND #$38
2529 : 4a __ __ LSR
252a : 4a __ __ LSR
252b : 05 1b __ ORA ACCU + 0 
252d : 8d 18 d0 STA $d018 
.s3:
2530 : 60 __ __ RTS
.s6:
2531 : a9 3b __ LDA #$3b
2533 : 8d 11 d0 STA $d011 
2536 : c0 03 __ CPY #$03
2538 : d0 c9 __ BNE $2503 ; (vic_setmode.s11 + 0)
253a : f0 b9 __ BEQ $24f5 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "D:/Arbeit/dev/oscar64/include/gfx/bitmap.h"
.s4:
253c : a5 0f __ LDA P2 ; (data + 0)
253e : a0 00 __ LDY #$00
2540 : 91 0d __ STA (P0),y ; (bm + 0)
2542 : a5 10 __ LDA P3 ; (data + 1)
2544 : c8 __ __ INY
2545 : 91 0d __ STA (P0),y ; (bm + 0)
2547 : a9 00 __ LDA #$00
2549 : c8 __ __ INY
254a : 91 0d __ STA (P0),y ; (bm + 0)
254c : c8 __ __ INY
254d : 91 0d __ STA (P0),y ; (bm + 0)
254f : a5 11 __ LDA P4 ; (cw + 0)
2551 : c8 __ __ INY
2552 : 91 0d __ STA (P0),y ; (bm + 0)
2554 : a5 12 __ LDA P5 ; (ch + 0)
2556 : c8 __ __ INY
2557 : 91 0d __ STA (P0),y ; (bm + 0)
2559 : a9 00 __ LDA #$00
255b : 06 11 __ ASL P4 ; (cw + 0)
255d : 2a __ __ ROL
255e : 06 11 __ ASL P4 ; (cw + 0)
2560 : 2a __ __ ROL
2561 : 06 11 __ ASL P4 ; (cw + 0)
2563 : 2a __ __ ROL
2564 : a0 07 __ LDY #$07
2566 : 91 0d __ STA (P0),y ; (bm + 0)
2568 : a5 11 __ LDA P4 ; (cw + 0)
256a : 88 __ __ DEY
256b : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
256d : 60 __ __ RTS
--------------------------------------------------------------------
ultra_fast_clear: ; ultra_fast_clear()->void
; 102, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
256e : a9 00 __ LDA #$00
2570 : 85 0f __ STA P2 
2572 : 85 10 __ STA P3 
2574 : 85 0d __ STA P0 
2576 : a9 40 __ LDA #$40
2578 : 85 11 __ STA P4 
257a : a9 e0 __ LDA #$e0
257c : 85 0e __ STA P1 
257e : a9 1f __ LDA #$1f
2580 : 85 12 __ STA P5 
2582 : 4c c6 24 JMP $24c6 ; (memset.s4 + 0)
--------------------------------------------------------------------
DoRender: ; DoRender(i16,i16,i16,i16,i16,i16,i16,i16)->void
; 511, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
2585 : a5 53 __ LDA T1 + 0 
2587 : 8d 91 cf STA $cf91 ; (DoRender@stack + 0)
258a : a5 54 __ LDA T1 + 1 
258c : 8d 92 cf STA $cf92 ; (DoRender@stack + 1)
.s4:
258f : ad ef cf LDA $cfef ; (sstack + 28)
2592 : 85 0d __ STA P0 
2594 : ad f0 cf LDA $cff0 ; (sstack + 29)
2597 : 85 0e __ STA P1 
2599 : ad f1 cf LDA $cff1 ; (sstack + 30)
259c : 85 0f __ STA P2 
259e : ad f2 cf LDA $cff2 ; (sstack + 31)
25a1 : 85 10 __ STA P3 
25a3 : ad f3 cf LDA $cff3 ; (sstack + 32)
25a6 : 85 11 __ STA P4 
25a8 : ad f4 cf LDA $cff4 ; (sstack + 33)
25ab : 85 12 __ STA P5 
25ad : ad f5 cf LDA $cff5 ; (sstack + 34)
25b0 : 85 13 __ STA P6 
25b2 : ad f6 cf LDA $cff6 ; (sstack + 35)
25b5 : 85 14 __ STA P7 
25b7 : ad f7 cf LDA $cff7 ; (sstack + 36)
25ba : 85 15 __ STA P8 
25bc : ad f8 cf LDA $cff8 ; (sstack + 37)
25bf : 85 16 __ STA P9 
25c1 : ad f9 cf LDA $cff9 ; (sstack + 38)
25c4 : 85 17 __ STA P10 
25c6 : ad fa cf LDA $cffa ; (sstack + 39)
25c9 : 85 18 __ STA P11 
25cb : ad fb cf LDA $cffb ; (sstack + 40)
25ce : 85 53 __ STA T1 + 0 
25d0 : 8d d3 cf STA $cfd3 ; (sstack + 0)
25d3 : ad fc cf LDA $cffc ; (sstack + 41)
25d6 : 85 54 __ STA T1 + 1 
25d8 : 8d d4 cf STA $cfd4 ; (sstack + 1)
25db : ad 18 4e LDA $4e18 ; (c + 0)
25de : 8d d5 cf STA $cfd5 ; (sstack + 2)
25e1 : ad 19 4e LDA $4e19 ; (c + 1)
25e4 : 8d d6 cf STA $cfd6 ; (sstack + 3)
25e7 : 20 05 26 JSR $2605 ; (render_full_rotation.s1 + 0)
25ea : 20 6e 25 JSR $256e ; (ultra_fast_clear.s4 + 0)
25ed : a5 53 __ LDA T1 + 0 
25ef : 8d ed cf STA $cfed ; (sstack + 26)
25f2 : a5 54 __ LDA T1 + 1 
25f4 : 8d ee cf STA $cfee ; (sstack + 27)
25f7 : 20 3b 30 JSR $303b ; (sort_and_render_faces.s1 + 0)
.s3:
25fa : ad 91 cf LDA $cf91 ; (DoRender@stack + 0)
25fd : 85 53 __ STA T1 + 0 
25ff : ad 92 cf LDA $cf92 ; (DoRender@stack + 1)
2602 : 85 54 __ STA T1 + 1 
2604 : 60 __ __ RTS
--------------------------------------------------------------------
render_full_rotation: ; render_full_rotation(i16,i16,i16,i16,i16,i16,i16,i16)->void
; 299, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
2605 : a2 2f __ LDX #$2f
2607 : b5 53 __ LDA T5 + 0,x 
2609 : 9d 93 cf STA $cf93,x ; (render_full_rotation@stack + 0)
260c : ca __ __ DEX
260d : 10 f8 __ BPL $2607 ; (render_full_rotation.s1 + 2)
.s4:
260f : ad d5 cf LDA $cfd5 ; (sstack + 2)
2612 : 85 75 __ STA T15 + 0 
2614 : ad d6 cf LDA $cfd6 ; (sstack + 3)
2617 : 30 06 __ BMI $261f ; (render_full_rotation.s3 + 0)
.s33:
2619 : 85 76 __ STA T15 + 1 
261b : 05 75 __ ORA T15 + 0 
261d : d0 0b __ BNE $262a ; (render_full_rotation.s5 + 0)
.s3:
261f : a2 2f __ LDX #$2f
2621 : bd 93 cf LDA $cf93,x ; (render_full_rotation@stack + 0)
2624 : 95 53 __ STA T5 + 0,x 
2626 : ca __ __ DEX
2627 : 10 f8 __ BPL $2621 ; (render_full_rotation.s3 + 2)
2629 : 60 __ __ RTS
.s5:
262a : ad 1a 4e LDA $4e1a ; (d + 0)
262d : 85 43 __ STA T0 + 0 
262f : ad 1b 4e LDA $4e1b ; (d + 1)
2632 : 85 44 __ STA T0 + 1 
2634 : 29 80 __ AND #$80
2636 : 10 02 __ BPL $263a ; (render_full_rotation.s5 + 16)
2638 : a9 ff __ LDA #$ff
263a : 85 45 __ STA T0 + 2 
263c : a5 18 __ LDA P11 ; (scale + 1)
263e : 29 80 __ AND #$80
2640 : 10 02 __ BPL $2644 ; (render_full_rotation.s5 + 26)
2642 : a9 ff __ LDA #$ff
2644 : 85 48 __ STA T1 + 2 
2646 : a5 0f __ LDA P2 ; (degY + 0)
2648 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
264a : a5 10 __ LDA P3 ; (degY + 1)
264c : 85 1c __ STA ACCU + 1 ; (num_points + 1)
264e : a9 68 __ LDA #$68
2650 : 85 03 __ STA WORK + 0 
2652 : a9 01 __ LDA #$01
2654 : 85 04 __ STA WORK + 1 
2656 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
2659 : a5 05 __ LDA WORK + 2 
265b : 85 1b __ STA ACCU + 0 ; (num_points + 0)
265d : a5 06 __ LDA WORK + 3 
265f : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2661 : a9 05 __ LDA #$05
2663 : 85 03 __ STA WORK + 0 
2665 : a9 00 __ LDA #$00
2667 : 85 04 __ STA WORK + 1 
2669 : 20 57 49 JSR $4957 ; (divs16 + 0)
266c : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
266e : 85 56 __ STA T6 + 0 
2670 : 18 __ __ CLC
2671 : 69 12 __ ADC #$12
2673 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2675 : a9 00 __ LDA #$00
2677 : 2a __ __ ROL
2678 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
267a : a9 48 __ LDA #$48
267c : 20 c6 49 JSR $49c6 ; (divmod + 53)
267f : a6 05 __ LDX WORK + 2 
2681 : bd 6d 4d LDA $4d6d,x ; (sin_tab[0] + 0)
2684 : 85 49 __ STA T2 + 0 
2686 : 29 80 __ AND #$80
2688 : 10 02 __ BPL $268c ; (render_full_rotation.s5 + 98)
268a : a9 ff __ LDA #$ff
268c : 85 4a __ STA T2 + 1 
268e : a5 11 __ LDA P4 ; (degZ + 0)
2690 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2692 : a5 12 __ LDA P5 ; (degZ + 1)
2694 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2696 : a9 68 __ LDA #$68
2698 : 85 03 __ STA WORK + 0 
269a : a9 01 __ LDA #$01
269c : 85 04 __ STA WORK + 1 
269e : 20 1c 4a JSR $4a1c ; (mods16 + 0)
26a1 : a5 05 __ LDA WORK + 2 
26a3 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
26a5 : a5 06 __ LDA WORK + 3 
26a7 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
26a9 : a9 05 __ LDA #$05
26ab : 85 03 __ STA WORK + 0 
26ad : a9 00 __ LDA #$00
26af : 85 04 __ STA WORK + 1 
26b1 : 20 57 49 JSR $4957 ; (divs16 + 0)
26b4 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
26b6 : 85 63 __ STA T10 + 0 
26b8 : 18 __ __ CLC
26b9 : 69 12 __ ADC #$12
26bb : 85 1b __ STA ACCU + 0 ; (num_points + 0)
26bd : a9 00 __ LDA #$00
26bf : 2a __ __ ROL
26c0 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
26c2 : a9 48 __ LDA #$48
26c4 : 20 c6 49 JSR $49c6 ; (divmod + 53)
26c7 : a6 05 __ LDX WORK + 2 
26c9 : bd 6d 4d LDA $4d6d,x ; (sin_tab[0] + 0)
26cc : 85 4c __ STA T3 + 0 
26ce : 85 1b __ STA ACCU + 0 ; (num_points + 0)
26d0 : 29 80 __ AND #$80
26d2 : 10 02 __ BPL $26d6 ; (render_full_rotation.s5 + 172)
26d4 : a9 ff __ LDA #$ff
26d6 : 85 4d __ STA T3 + 1 
26d8 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
26da : 85 1d __ STA ACCU + 2 
26dc : 85 1e __ STA ACCU + 3 
26de : a5 49 __ LDA T2 + 0 
26e0 : 85 03 __ STA WORK + 0 
26e2 : a5 4a __ LDA T2 + 1 
26e4 : 85 04 __ STA WORK + 1 
26e6 : 85 05 __ STA WORK + 2 
26e8 : 85 06 __ STA WORK + 3 
26ea : 20 dc 4a JSR $4adc ; (mul32 + 0)
26ed : a5 07 __ LDA WORK + 4 
26ef : 85 50 __ STA T4 + 0 
26f1 : a5 08 __ LDA WORK + 5 
26f3 : 85 51 __ STA T4 + 1 
26f5 : a5 09 __ LDA WORK + 6 
26f7 : 85 52 __ STA T4 + 2 
26f9 : a5 0a __ LDA WORK + 7 
26fb : a2 06 __ LDX #$06
.l6:
26fd : c9 80 __ CMP #$80
26ff : 6a __ __ ROR
2700 : 66 52 __ ROR T4 + 2 
2702 : 66 51 __ ROR T4 + 1 
2704 : 66 50 __ ROR T4 + 0 
2706 : ca __ __ DEX
2707 : d0 f4 __ BNE $26fd ; (render_full_rotation.l6 + 0)
.s7:
2709 : a5 51 __ LDA T4 + 1 
270b : 85 1c __ STA ACCU + 1 ; (num_points + 1)
270d : 0a __ __ ASL
270e : 8a __ __ TXA
270f : 69 ff __ ADC #$ff
2711 : 49 ff __ EOR #$ff
2713 : 85 1d __ STA ACCU + 2 
2715 : 85 1e __ STA ACCU + 3 
2717 : a5 50 __ LDA T4 + 0 
2719 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
271b : a5 17 __ LDA P10 ; (scale + 0)
271d : 85 03 __ STA WORK + 0 
271f : a5 18 __ LDA P11 ; (scale + 1)
2721 : 85 04 __ STA WORK + 1 
2723 : a5 48 __ LDA T1 + 2 
2725 : 85 05 __ STA WORK + 2 
2727 : 85 06 __ STA WORK + 3 
2729 : 20 dc 4a JSR $4adc ; (mul32 + 0)
272c : a5 07 __ LDA WORK + 4 
272e : 0a __ __ ASL
272f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2731 : a5 08 __ LDA WORK + 5 
2733 : 2a __ __ ROL
2734 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2736 : a5 09 __ LDA WORK + 6 
2738 : 2a __ __ ROL
2739 : 85 1d __ STA ACCU + 2 
273b : a5 0a __ LDA WORK + 7 
273d : 2a __ __ ROL
273e : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2740 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2742 : 26 1d __ ROL ACCU + 2 
2744 : 2a __ __ ROL
2745 : 85 1e __ STA ACCU + 3 
2747 : a5 43 __ LDA T0 + 0 
2749 : 85 03 __ STA WORK + 0 
274b : a5 44 __ LDA T0 + 1 
274d : 85 04 __ STA WORK + 1 
274f : a5 45 __ LDA T0 + 2 
2751 : 85 05 __ STA WORK + 2 
2753 : 85 06 __ STA WORK + 3 
2755 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2758 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
275a : 85 50 __ STA T4 + 0 
275c : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
275e : 85 51 __ STA T4 + 1 
2760 : a5 0d __ LDA P0 ; (degX + 0)
2762 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2764 : a5 0e __ LDA P1 ; (degX + 1)
2766 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2768 : a9 68 __ LDA #$68
276a : 85 03 __ STA WORK + 0 
276c : a9 01 __ LDA #$01
276e : 85 04 __ STA WORK + 1 
2770 : 20 1c 4a JSR $4a1c ; (mods16 + 0)
2773 : a5 05 __ LDA WORK + 2 
2775 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2777 : a5 06 __ LDA WORK + 3 
2779 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
277b : a9 05 __ LDA #$05
277d : 85 03 __ STA WORK + 0 
277f : a9 00 __ LDA #$00
2781 : 85 04 __ STA WORK + 1 
2783 : 20 57 49 JSR $4957 ; (divs16 + 0)
2786 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2788 : 85 60 __ STA T9 + 0 
278a : a9 00 __ LDA #$00
278c : 85 1c __ STA ACCU + 1 ; (num_points + 1)
278e : a9 48 __ LDA #$48
2790 : 20 c6 49 JSR $49c6 ; (divmod + 53)
2793 : a6 05 __ LDX WORK + 2 
2795 : bd 6d 4d LDA $4d6d,x ; (sin_tab[0] + 0)
2798 : 85 53 __ STA T5 + 0 
279a : 0a __ __ ASL
279b : a9 00 __ LDA #$00
279d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
279f : 69 ff __ ADC #$ff
27a1 : 49 ff __ EOR #$ff
27a3 : 85 54 __ STA T5 + 1 
27a5 : a5 56 __ LDA T6 + 0 
27a7 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
27a9 : a9 48 __ LDA #$48
27ab : 20 c6 49 JSR $49c6 ; (divmod + 53)
27ae : a6 05 __ LDX WORK + 2 
27b0 : bd 6d 4d LDA $4d6d,x ; (sin_tab[0] + 0)
27b3 : 85 56 __ STA T6 + 0 
27b5 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
27b7 : 29 80 __ AND #$80
27b9 : 10 02 __ BPL $27bd ; (render_full_rotation.s7 + 180)
27bb : a9 ff __ LDA #$ff
27bd : 85 57 __ STA T6 + 1 
27bf : 85 1c __ STA ACCU + 1 ; (num_points + 1)
27c1 : 85 1d __ STA ACCU + 2 
27c3 : 85 1e __ STA ACCU + 3 
27c5 : a5 53 __ LDA T5 + 0 
27c7 : 85 03 __ STA WORK + 0 
27c9 : a5 54 __ LDA T5 + 1 
27cb : 85 04 __ STA WORK + 1 
27cd : 85 05 __ STA WORK + 2 
27cf : 85 06 __ STA WORK + 3 
27d1 : 20 dc 4a JSR $4adc ; (mul32 + 0)
27d4 : a5 07 __ LDA WORK + 4 
27d6 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
27d8 : 85 58 __ STA T7 + 0 
27da : a5 08 __ LDA WORK + 5 
27dc : 85 1c __ STA ACCU + 1 ; (num_points + 1)
27de : 85 59 __ STA T7 + 1 
27e0 : a5 09 __ LDA WORK + 6 
27e2 : 85 1d __ STA ACCU + 2 
27e4 : 85 5a __ STA T7 + 2 
27e6 : a5 0a __ LDA WORK + 7 
27e8 : 85 1e __ STA ACCU + 3 
27ea : 85 5b __ STA T7 + 3 
27ec : a5 4c __ LDA T3 + 0 
27ee : 85 03 __ STA WORK + 0 
27f0 : a5 4d __ LDA T3 + 1 
27f2 : 85 04 __ STA WORK + 1 
27f4 : 85 05 __ STA WORK + 2 
27f6 : 85 06 __ STA WORK + 3 
27f8 : 20 dc 4a JSR $4adc ; (mul32 + 0)
27fb : a5 07 __ LDA WORK + 4 
27fd : 85 5c __ STA T8 + 0 
27ff : a5 08 __ LDA WORK + 5 
2801 : 85 5d __ STA T8 + 1 
2803 : a5 09 __ LDA WORK + 6 
2805 : 85 5e __ STA T8 + 2 
2807 : a5 0a __ LDA WORK + 7 
2809 : 85 5f __ STA T8 + 3 
280b : 18 __ __ CLC
280c : a5 60 __ LDA T9 + 0 
280e : 69 12 __ ADC #$12
2810 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2812 : a9 00 __ LDA #$00
2814 : 2a __ __ ROL
2815 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2817 : a9 48 __ LDA #$48
2819 : 20 c6 49 JSR $49c6 ; (divmod + 53)
281c : a6 05 __ LDX WORK + 2 
281e : bd 6d 4d LDA $4d6d,x ; (sin_tab[0] + 0)
2821 : 85 60 __ STA T9 + 0 
2823 : 0a __ __ ASL
2824 : a9 00 __ LDA #$00
2826 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2828 : 69 ff __ ADC #$ff
282a : 49 ff __ EOR #$ff
282c : 85 61 __ STA T9 + 1 
282e : a5 63 __ LDA T10 + 0 
2830 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2832 : a9 48 __ LDA #$48
2834 : 20 c6 49 JSR $49c6 ; (divmod + 53)
2837 : a6 05 __ LDX WORK + 2 
2839 : bd 6d 4d LDA $4d6d,x ; (sin_tab[0] + 0)
283c : 85 63 __ STA T10 + 0 
283e : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2840 : 29 80 __ AND #$80
2842 : 10 02 __ BPL $2846 ; (render_full_rotation.s7 + 317)
2844 : a9 ff __ LDA #$ff
2846 : 85 64 __ STA T10 + 1 
2848 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
284a : 85 1d __ STA ACCU + 2 
284c : 85 1e __ STA ACCU + 3 
284e : a5 60 __ LDA T9 + 0 
2850 : 85 03 __ STA WORK + 0 
2852 : a5 61 __ LDA T9 + 1 
2854 : 85 04 __ STA WORK + 1 
2856 : 85 05 __ STA WORK + 2 
2858 : 85 06 __ STA WORK + 3 
285a : 20 dc 4a JSR $4adc ; (mul32 + 0)
285d : a5 09 __ LDA WORK + 6 
285f : 85 69 __ STA T11 + 2 
2861 : a5 0a __ LDA WORK + 7 
2863 : a2 06 __ LDX #$06
.l8:
2865 : 06 07 __ ASL WORK + 4 
2867 : 26 08 __ ROL WORK + 5 
2869 : 26 69 __ ROL T11 + 2 
286b : 2a __ __ ROL
286c : ca __ __ DEX
286d : d0 f6 __ BNE $2865 ; (render_full_rotation.l8 + 0)
.s9:
286f : 85 6a __ STA T11 + 3 
2871 : 38 __ __ SEC
2872 : a5 5c __ LDA T8 + 0 
2874 : e5 07 __ SBC WORK + 4 
2876 : a5 5d __ LDA T8 + 1 
2878 : e5 08 __ SBC WORK + 5 
287a : 85 5c __ STA T8 + 0 
287c : a5 5e __ LDA T8 + 2 
287e : e5 69 __ SBC T11 + 2 
2880 : 85 5d __ STA T8 + 1 
2882 : a5 5f __ LDA T8 + 3 
2884 : e5 6a __ SBC T11 + 3 
2886 : a2 04 __ LDX #$04
.l10:
2888 : c9 80 __ CMP #$80
288a : 6a __ __ ROR
288b : 66 5d __ ROR T8 + 1 
288d : 66 5c __ ROR T8 + 0 
288f : ca __ __ DEX
2890 : d0 f6 __ BNE $2888 ; (render_full_rotation.l10 + 0)
.s11:
2892 : a5 5d __ LDA T8 + 1 
2894 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2896 : 0a __ __ ASL
2897 : 8a __ __ TXA
2898 : 69 ff __ ADC #$ff
289a : 49 ff __ EOR #$ff
289c : 85 1d __ STA ACCU + 2 
289e : 85 1e __ STA ACCU + 3 
28a0 : a5 5c __ LDA T8 + 0 
28a2 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
28a4 : a5 17 __ LDA P10 ; (scale + 0)
28a6 : 85 03 __ STA WORK + 0 
28a8 : a5 18 __ LDA P11 ; (scale + 1)
28aa : 85 04 __ STA WORK + 1 
28ac : a5 48 __ LDA T1 + 2 
28ae : 85 05 __ STA WORK + 2 
28b0 : 85 06 __ STA WORK + 3 
28b2 : 20 dc 4a JSR $4adc ; (mul32 + 0)
28b5 : a5 07 __ LDA WORK + 4 
28b7 : 0a __ __ ASL
28b8 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
28ba : a5 08 __ LDA WORK + 5 
28bc : 2a __ __ ROL
28bd : 85 1c __ STA ACCU + 1 ; (num_points + 1)
28bf : a5 09 __ LDA WORK + 6 
28c1 : 2a __ __ ROL
28c2 : 85 1d __ STA ACCU + 2 
28c4 : a5 0a __ LDA WORK + 7 
28c6 : 2a __ __ ROL
28c7 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
28c9 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
28cb : 26 1d __ ROL ACCU + 2 
28cd : 2a __ __ ROL
28ce : 85 1e __ STA ACCU + 3 
28d0 : a5 43 __ LDA T0 + 0 
28d2 : 85 03 __ STA WORK + 0 
28d4 : a5 44 __ LDA T0 + 1 
28d6 : 85 04 __ STA WORK + 1 
28d8 : a5 45 __ LDA T0 + 2 
28da : 85 05 __ STA WORK + 2 
28dc : 85 06 __ STA WORK + 3 
28de : 20 44 4b JSR $4b44 ; (divs32 + 0)
28e1 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
28e3 : 85 5c __ STA T8 + 0 
28e5 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
28e7 : 85 5d __ STA T8 + 1 
28e9 : a5 60 __ LDA T9 + 0 
28eb : 85 1b __ STA ACCU + 0 ; (num_points + 0)
28ed : a5 61 __ LDA T9 + 1 
28ef : 85 1c __ STA ACCU + 1 ; (num_points + 1)
28f1 : 85 1d __ STA ACCU + 2 
28f3 : 85 1e __ STA ACCU + 3 
28f5 : a5 56 __ LDA T6 + 0 
28f7 : 85 03 __ STA WORK + 0 
28f9 : a5 57 __ LDA T6 + 1 
28fb : 85 04 __ STA WORK + 1 
28fd : 85 05 __ STA WORK + 2 
28ff : 85 06 __ STA WORK + 3 
2901 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2904 : a5 07 __ LDA WORK + 4 
2906 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2908 : 85 67 __ STA T11 + 0 
290a : a5 08 __ LDA WORK + 5 
290c : 85 1c __ STA ACCU + 1 ; (num_points + 1)
290e : 85 68 __ STA T11 + 1 
2910 : a5 09 __ LDA WORK + 6 
2912 : 85 1d __ STA ACCU + 2 
2914 : 85 69 __ STA T11 + 2 
2916 : a5 0a __ LDA WORK + 7 
2918 : 85 1e __ STA ACCU + 3 
291a : 85 6a __ STA T11 + 3 
291c : a5 4c __ LDA T3 + 0 
291e : 85 03 __ STA WORK + 0 
2920 : a5 4d __ LDA T3 + 1 
2922 : 85 04 __ STA WORK + 1 
2924 : 85 05 __ STA WORK + 2 
2926 : 85 06 __ STA WORK + 3 
2928 : 20 dc 4a JSR $4adc ; (mul32 + 0)
292b : a5 07 __ LDA WORK + 4 
292d : 85 6b __ STA T12 + 0 
292f : a5 08 __ LDA WORK + 5 
2931 : 85 6c __ STA T12 + 1 
2933 : a5 09 __ LDA WORK + 6 
2935 : 85 6d __ STA T12 + 2 
2937 : a5 0a __ LDA WORK + 7 
2939 : 85 6e __ STA T12 + 3 
293b : a5 53 __ LDA T5 + 0 
293d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
293f : a5 54 __ LDA T5 + 1 
2941 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2943 : 85 1d __ STA ACCU + 2 
2945 : 85 1e __ STA ACCU + 3 
2947 : a5 63 __ LDA T10 + 0 
2949 : 85 03 __ STA WORK + 0 
294b : a5 64 __ LDA T10 + 1 
294d : 85 04 __ STA WORK + 1 
294f : 85 05 __ STA WORK + 2 
2951 : 85 06 __ STA WORK + 3 
2953 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2956 : a5 09 __ LDA WORK + 6 
2958 : 85 71 __ STA T13 + 2 
295a : a5 0a __ LDA WORK + 7 
295c : a2 06 __ LDX #$06
.l12:
295e : 06 07 __ ASL WORK + 4 
2960 : 26 08 __ ROL WORK + 5 
2962 : 26 71 __ ROL T13 + 2 
2964 : 2a __ __ ROL
2965 : ca __ __ DEX
2966 : d0 f6 __ BNE $295e ; (render_full_rotation.l12 + 0)
.s13:
2968 : aa __ __ TAX
2969 : 18 __ __ CLC
296a : a5 07 __ LDA WORK + 4 
296c : 65 6b __ ADC T12 + 0 
296e : a5 08 __ LDA WORK + 5 
2970 : 65 6c __ ADC T12 + 1 
2972 : 85 6b __ STA T12 + 0 
2974 : a5 71 __ LDA T13 + 2 
2976 : 65 6d __ ADC T12 + 2 
2978 : 85 6c __ STA T12 + 1 
297a : 8a __ __ TXA
297b : 65 6e __ ADC T12 + 3 
297d : a2 04 __ LDX #$04
.l14:
297f : c9 80 __ CMP #$80
2981 : 6a __ __ ROR
2982 : 66 6c __ ROR T12 + 1 
2984 : 66 6b __ ROR T12 + 0 
2986 : ca __ __ DEX
2987 : d0 f6 __ BNE $297f ; (render_full_rotation.l14 + 0)
.s15:
2989 : a5 6c __ LDA T12 + 1 
298b : 85 1c __ STA ACCU + 1 ; (num_points + 1)
298d : 0a __ __ ASL
298e : 8a __ __ TXA
298f : 69 ff __ ADC #$ff
2991 : 49 ff __ EOR #$ff
2993 : 85 1d __ STA ACCU + 2 
2995 : 85 1e __ STA ACCU + 3 
2997 : a5 6b __ LDA T12 + 0 
2999 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
299b : a5 17 __ LDA P10 ; (scale + 0)
299d : 85 03 __ STA WORK + 0 
299f : a5 18 __ LDA P11 ; (scale + 1)
29a1 : 85 04 __ STA WORK + 1 
29a3 : a5 48 __ LDA T1 + 2 
29a5 : 85 05 __ STA WORK + 2 
29a7 : 85 06 __ STA WORK + 3 
29a9 : 20 dc 4a JSR $4adc ; (mul32 + 0)
29ac : a5 07 __ LDA WORK + 4 
29ae : 0a __ __ ASL
29af : 85 1b __ STA ACCU + 0 ; (num_points + 0)
29b1 : a5 08 __ LDA WORK + 5 
29b3 : 2a __ __ ROL
29b4 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
29b6 : a5 09 __ LDA WORK + 6 
29b8 : 2a __ __ ROL
29b9 : 85 1d __ STA ACCU + 2 
29bb : a5 0a __ LDA WORK + 7 
29bd : 2a __ __ ROL
29be : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
29c0 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
29c2 : 26 1d __ ROL ACCU + 2 
29c4 : 2a __ __ ROL
29c5 : 85 1e __ STA ACCU + 3 
29c7 : a5 43 __ LDA T0 + 0 
29c9 : 85 03 __ STA WORK + 0 
29cb : a5 44 __ LDA T0 + 1 
29cd : 85 04 __ STA WORK + 1 
29cf : a5 45 __ LDA T0 + 2 
29d1 : 85 05 __ STA WORK + 2 
29d3 : 85 06 __ STA WORK + 3 
29d5 : 20 44 4b JSR $4b44 ; (divs32 + 0)
29d8 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
29da : 85 6b __ STA T12 + 0 
29dc : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
29de : 85 6c __ STA T12 + 1 
29e0 : a5 49 __ LDA T2 + 0 
29e2 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
29e4 : a5 4a __ LDA T2 + 1 
29e6 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
29e8 : 85 1d __ STA ACCU + 2 
29ea : 85 1e __ STA ACCU + 3 
29ec : a5 63 __ LDA T10 + 0 
29ee : 85 03 __ STA WORK + 0 
29f0 : a5 64 __ LDA T10 + 1 
29f2 : 85 04 __ STA WORK + 1 
29f4 : 85 05 __ STA WORK + 2 
29f6 : 85 06 __ STA WORK + 3 
29f8 : 20 dc 4a JSR $4adc ; (mul32 + 0)
29fb : a5 07 __ LDA WORK + 4 
29fd : 85 6f __ STA T13 + 0 
29ff : a5 08 __ LDA WORK + 5 
2a01 : 85 70 __ STA T13 + 1 
2a03 : a5 09 __ LDA WORK + 6 
2a05 : 85 71 __ STA T13 + 2 
2a07 : a5 0a __ LDA WORK + 7 
2a09 : a2 06 __ LDX #$06
.l16:
2a0b : c9 80 __ CMP #$80
2a0d : 6a __ __ ROR
2a0e : 66 71 __ ROR T13 + 2 
2a10 : 66 70 __ ROR T13 + 1 
2a12 : 66 6f __ ROR T13 + 0 
2a14 : ca __ __ DEX
2a15 : d0 f4 __ BNE $2a0b ; (render_full_rotation.l16 + 0)
.s17:
2a17 : a5 70 __ LDA T13 + 1 
2a19 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2a1b : 0a __ __ ASL
2a1c : 8a __ __ TXA
2a1d : 69 ff __ ADC #$ff
2a1f : 49 ff __ EOR #$ff
2a21 : 85 1d __ STA ACCU + 2 
2a23 : 85 1e __ STA ACCU + 3 
2a25 : a5 6f __ LDA T13 + 0 
2a27 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2a29 : a5 17 __ LDA P10 ; (scale + 0)
2a2b : 85 03 __ STA WORK + 0 
2a2d : a5 18 __ LDA P11 ; (scale + 1)
2a2f : 85 04 __ STA WORK + 1 
2a31 : a5 48 __ LDA T1 + 2 
2a33 : 85 05 __ STA WORK + 2 
2a35 : 85 06 __ STA WORK + 3 
2a37 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2a3a : a5 07 __ LDA WORK + 4 
2a3c : 0a __ __ ASL
2a3d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2a3f : a5 08 __ LDA WORK + 5 
2a41 : 2a __ __ ROL
2a42 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2a44 : a5 09 __ LDA WORK + 6 
2a46 : 2a __ __ ROL
2a47 : 85 1d __ STA ACCU + 2 
2a49 : a5 0a __ LDA WORK + 7 
2a4b : 2a __ __ ROL
2a4c : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2a4e : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2a50 : 26 1d __ ROL ACCU + 2 
2a52 : 2a __ __ ROL
2a53 : 85 1e __ STA ACCU + 3 
2a55 : a5 43 __ LDA T0 + 0 
2a57 : 85 03 __ STA WORK + 0 
2a59 : a5 44 __ LDA T0 + 1 
2a5b : 85 04 __ STA WORK + 1 
2a5d : a5 45 __ LDA T0 + 2 
2a5f : 85 05 __ STA WORK + 2 
2a61 : 85 06 __ STA WORK + 3 
2a63 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2a66 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2a68 : 85 6f __ STA T13 + 0 
2a6a : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2a6c : 85 70 __ STA T13 + 1 
2a6e : a5 58 __ LDA T7 + 0 
2a70 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2a72 : a5 59 __ LDA T7 + 1 
2a74 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2a76 : a5 5a __ LDA T7 + 2 
2a78 : 85 1d __ STA ACCU + 2 
2a7a : a5 5b __ LDA T7 + 3 
2a7c : 85 1e __ STA ACCU + 3 
2a7e : a5 63 __ LDA T10 + 0 
2a80 : 85 03 __ STA WORK + 0 
2a82 : a5 64 __ LDA T10 + 1 
2a84 : 85 04 __ STA WORK + 1 
2a86 : 85 05 __ STA WORK + 2 
2a88 : 85 06 __ STA WORK + 3 
2a8a : 20 dc 4a JSR $4adc ; (mul32 + 0)
2a8d : a5 07 __ LDA WORK + 4 
2a8f : 85 58 __ STA T7 + 0 
2a91 : a5 08 __ LDA WORK + 5 
2a93 : 85 59 __ STA T7 + 1 
2a95 : a5 09 __ LDA WORK + 6 
2a97 : 85 5a __ STA T7 + 2 
2a99 : a5 0a __ LDA WORK + 7 
2a9b : 85 5b __ STA T7 + 3 
2a9d : a5 60 __ LDA T9 + 0 
2a9f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2aa1 : a5 61 __ LDA T9 + 1 
2aa3 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2aa5 : 85 1d __ STA ACCU + 2 
2aa7 : 85 1e __ STA ACCU + 3 
2aa9 : a5 4c __ LDA T3 + 0 
2aab : 85 03 __ STA WORK + 0 
2aad : a5 4d __ LDA T3 + 1 
2aaf : 85 04 __ STA WORK + 1 
2ab1 : 85 05 __ STA WORK + 2 
2ab3 : 85 06 __ STA WORK + 3 
2ab5 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2ab8 : a5 09 __ LDA WORK + 6 
2aba : 85 74 __ STA T14 + 2 
2abc : a5 0a __ LDA WORK + 7 
2abe : a2 06 __ LDX #$06
.l18:
2ac0 : 06 07 __ ASL WORK + 4 
2ac2 : 26 08 __ ROL WORK + 5 
2ac4 : 26 74 __ ROL T14 + 2 
2ac6 : 2a __ __ ROL
2ac7 : ca __ __ DEX
2ac8 : d0 f6 __ BNE $2ac0 ; (render_full_rotation.l18 + 0)
.s19:
2aca : aa __ __ TAX
2acb : 18 __ __ CLC
2acc : a5 07 __ LDA WORK + 4 
2ace : 65 58 __ ADC T7 + 0 
2ad0 : a5 08 __ LDA WORK + 5 
2ad2 : 65 59 __ ADC T7 + 1 
2ad4 : 85 58 __ STA T7 + 0 
2ad6 : a5 74 __ LDA T14 + 2 
2ad8 : 65 5a __ ADC T7 + 2 
2ada : 85 59 __ STA T7 + 1 
2adc : 8a __ __ TXA
2add : 65 5b __ ADC T7 + 3 
2adf : a2 04 __ LDX #$04
.l20:
2ae1 : c9 80 __ CMP #$80
2ae3 : 6a __ __ ROR
2ae4 : 66 59 __ ROR T7 + 1 
2ae6 : 66 58 __ ROR T7 + 0 
2ae8 : ca __ __ DEX
2ae9 : d0 f6 __ BNE $2ae1 ; (render_full_rotation.l20 + 0)
.s21:
2aeb : a5 59 __ LDA T7 + 1 
2aed : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2aef : 0a __ __ ASL
2af0 : 8a __ __ TXA
2af1 : 69 ff __ ADC #$ff
2af3 : 49 ff __ EOR #$ff
2af5 : 85 1d __ STA ACCU + 2 
2af7 : 85 1e __ STA ACCU + 3 
2af9 : a5 58 __ LDA T7 + 0 
2afb : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2afd : a5 17 __ LDA P10 ; (scale + 0)
2aff : 85 03 __ STA WORK + 0 
2b01 : a5 18 __ LDA P11 ; (scale + 1)
2b03 : 85 04 __ STA WORK + 1 
2b05 : a5 48 __ LDA T1 + 2 
2b07 : 85 05 __ STA WORK + 2 
2b09 : 85 06 __ STA WORK + 3 
2b0b : 20 dc 4a JSR $4adc ; (mul32 + 0)
2b0e : a5 07 __ LDA WORK + 4 
2b10 : 0a __ __ ASL
2b11 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2b13 : a5 08 __ LDA WORK + 5 
2b15 : 2a __ __ ROL
2b16 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2b18 : a5 09 __ LDA WORK + 6 
2b1a : 2a __ __ ROL
2b1b : 85 1d __ STA ACCU + 2 
2b1d : a5 0a __ LDA WORK + 7 
2b1f : 2a __ __ ROL
2b20 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2b22 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2b24 : 26 1d __ ROL ACCU + 2 
2b26 : 2a __ __ ROL
2b27 : 85 1e __ STA ACCU + 3 
2b29 : a5 43 __ LDA T0 + 0 
2b2b : 85 03 __ STA WORK + 0 
2b2d : a5 44 __ LDA T0 + 1 
2b2f : 85 04 __ STA WORK + 1 
2b31 : a5 45 __ LDA T0 + 2 
2b33 : 85 05 __ STA WORK + 2 
2b35 : 85 06 __ STA WORK + 3 
2b37 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2b3a : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2b3c : 85 58 __ STA T7 + 0 
2b3e : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2b40 : 85 59 __ STA T7 + 1 
2b42 : a5 67 __ LDA T11 + 0 
2b44 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2b46 : a5 68 __ LDA T11 + 1 
2b48 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2b4a : a5 69 __ LDA T11 + 2 
2b4c : 85 1d __ STA ACCU + 2 
2b4e : a5 6a __ LDA T11 + 3 
2b50 : 85 1e __ STA ACCU + 3 
2b52 : a5 63 __ LDA T10 + 0 
2b54 : 85 03 __ STA WORK + 0 
2b56 : a5 64 __ LDA T10 + 1 
2b58 : 85 04 __ STA WORK + 1 
2b5a : 85 05 __ STA WORK + 2 
2b5c : 85 06 __ STA WORK + 3 
2b5e : 20 dc 4a JSR $4adc ; (mul32 + 0)
2b61 : a5 07 __ LDA WORK + 4 
2b63 : 85 63 __ STA T10 + 0 
2b65 : a5 08 __ LDA WORK + 5 
2b67 : 85 64 __ STA T10 + 1 
2b69 : a5 09 __ LDA WORK + 6 
2b6b : 85 65 __ STA T10 + 2 
2b6d : a5 0a __ LDA WORK + 7 
2b6f : 85 66 __ STA T10 + 3 
2b71 : a5 4c __ LDA T3 + 0 
2b73 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2b75 : a5 4d __ LDA T3 + 1 
2b77 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2b79 : 85 1d __ STA ACCU + 2 
2b7b : 85 1e __ STA ACCU + 3 
2b7d : a5 53 __ LDA T5 + 0 
2b7f : 85 03 __ STA WORK + 0 
2b81 : a5 54 __ LDA T5 + 1 
2b83 : 85 04 __ STA WORK + 1 
2b85 : 85 05 __ STA WORK + 2 
2b87 : 85 06 __ STA WORK + 3 
2b89 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2b8c : a5 07 __ LDA WORK + 4 
2b8e : 85 4c __ STA T3 + 0 
2b90 : a5 08 __ LDA WORK + 5 
2b92 : 85 4d __ STA T3 + 1 
2b94 : a5 09 __ LDA WORK + 6 
2b96 : 85 4e __ STA T3 + 2 
2b98 : a5 0a __ LDA WORK + 7 
2b9a : a2 06 __ LDX #$06
.l22:
2b9c : 06 4c __ ASL T3 + 0 
2b9e : 26 4d __ ROL T3 + 1 
2ba0 : 26 4e __ ROL T3 + 2 
2ba2 : 2a __ __ ROL
2ba3 : ca __ __ DEX
2ba4 : d0 f6 __ BNE $2b9c ; (render_full_rotation.l22 + 0)
.s23:
2ba6 : 85 4f __ STA T3 + 3 
2ba8 : 38 __ __ SEC
2ba9 : a5 63 __ LDA T10 + 0 
2bab : e5 4c __ SBC T3 + 0 
2bad : a5 64 __ LDA T10 + 1 
2baf : e5 4d __ SBC T3 + 1 
2bb1 : 85 4c __ STA T3 + 0 
2bb3 : a5 65 __ LDA T10 + 2 
2bb5 : e5 4e __ SBC T3 + 2 
2bb7 : 85 4d __ STA T3 + 1 
2bb9 : a5 66 __ LDA T10 + 3 
2bbb : e5 4f __ SBC T3 + 3 
2bbd : a2 04 __ LDX #$04
.l24:
2bbf : c9 80 __ CMP #$80
2bc1 : 6a __ __ ROR
2bc2 : 66 4d __ ROR T3 + 1 
2bc4 : 66 4c __ ROR T3 + 0 
2bc6 : ca __ __ DEX
2bc7 : d0 f6 __ BNE $2bbf ; (render_full_rotation.l24 + 0)
.s25:
2bc9 : a5 4d __ LDA T3 + 1 
2bcb : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2bcd : 0a __ __ ASL
2bce : 8a __ __ TXA
2bcf : 69 ff __ ADC #$ff
2bd1 : 49 ff __ EOR #$ff
2bd3 : 85 1d __ STA ACCU + 2 
2bd5 : 85 1e __ STA ACCU + 3 
2bd7 : a5 4c __ LDA T3 + 0 
2bd9 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2bdb : a5 17 __ LDA P10 ; (scale + 0)
2bdd : 85 03 __ STA WORK + 0 
2bdf : a5 18 __ LDA P11 ; (scale + 1)
2be1 : 85 04 __ STA WORK + 1 
2be3 : a5 48 __ LDA T1 + 2 
2be5 : 85 05 __ STA WORK + 2 
2be7 : 85 06 __ STA WORK + 3 
2be9 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2bec : a5 07 __ LDA WORK + 4 
2bee : 0a __ __ ASL
2bef : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2bf1 : a5 08 __ LDA WORK + 5 
2bf3 : 2a __ __ ROL
2bf4 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2bf6 : a5 09 __ LDA WORK + 6 
2bf8 : 2a __ __ ROL
2bf9 : 85 1d __ STA ACCU + 2 
2bfb : a5 0a __ LDA WORK + 7 
2bfd : 2a __ __ ROL
2bfe : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2c00 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2c02 : 26 1d __ ROL ACCU + 2 
2c04 : 2a __ __ ROL
2c05 : 85 1e __ STA ACCU + 3 
2c07 : a5 43 __ LDA T0 + 0 
2c09 : 85 03 __ STA WORK + 0 
2c0b : a5 44 __ LDA T0 + 1 
2c0d : 85 04 __ STA WORK + 1 
2c0f : a5 45 __ LDA T0 + 2 
2c11 : 85 05 __ STA WORK + 2 
2c13 : 85 06 __ STA WORK + 3 
2c15 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2c18 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2c1a : 85 4c __ STA T3 + 0 
2c1c : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2c1e : 85 4d __ STA T3 + 1 
2c20 : 38 __ __ SEC
2c21 : a9 00 __ LDA #$00
2c23 : e5 56 __ SBC T6 + 0 
2c25 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2c27 : a9 00 __ LDA #$00
2c29 : e5 57 __ SBC T6 + 1 
2c2b : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2c2d : 29 80 __ AND #$80
2c2f : 10 02 __ BPL $2c33 ; (render_full_rotation.s25 + 106)
2c31 : a9 ff __ LDA #$ff
2c33 : 85 1d __ STA ACCU + 2 
2c35 : 85 1e __ STA ACCU + 3 
2c37 : a5 17 __ LDA P10 ; (scale + 0)
2c39 : 85 03 __ STA WORK + 0 
2c3b : a5 18 __ LDA P11 ; (scale + 1)
2c3d : 85 04 __ STA WORK + 1 
2c3f : a5 48 __ LDA T1 + 2 
2c41 : 85 05 __ STA WORK + 2 
2c43 : 85 06 __ STA WORK + 3 
2c45 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2c48 : a5 07 __ LDA WORK + 4 
2c4a : 0a __ __ ASL
2c4b : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2c4d : a5 08 __ LDA WORK + 5 
2c4f : 2a __ __ ROL
2c50 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2c52 : a5 09 __ LDA WORK + 6 
2c54 : 2a __ __ ROL
2c55 : 85 1d __ STA ACCU + 2 
2c57 : a5 0a __ LDA WORK + 7 
2c59 : 2a __ __ ROL
2c5a : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2c5c : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2c5e : 26 1d __ ROL ACCU + 2 
2c60 : 2a __ __ ROL
2c61 : 85 1e __ STA ACCU + 3 
2c63 : a5 43 __ LDA T0 + 0 
2c65 : 85 03 __ STA WORK + 0 
2c67 : a5 44 __ LDA T0 + 1 
2c69 : 85 04 __ STA WORK + 1 
2c6b : a5 45 __ LDA T0 + 2 
2c6d : 85 05 __ STA WORK + 2 
2c6f : 85 06 __ STA WORK + 3 
2c71 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2c74 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2c76 : 85 56 __ STA T6 + 0 
2c78 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2c7a : 85 57 __ STA T6 + 1 
2c7c : a5 53 __ LDA T5 + 0 
2c7e : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2c80 : a5 54 __ LDA T5 + 1 
2c82 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2c84 : 85 1d __ STA ACCU + 2 
2c86 : 85 1e __ STA ACCU + 3 
2c88 : a5 49 __ LDA T2 + 0 
2c8a : 85 03 __ STA WORK + 0 
2c8c : a5 4a __ LDA T2 + 1 
2c8e : 85 04 __ STA WORK + 1 
2c90 : 85 05 __ STA WORK + 2 
2c92 : 85 06 __ STA WORK + 3 
2c94 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2c97 : a5 07 __ LDA WORK + 4 
2c99 : 85 53 __ STA T5 + 0 
2c9b : a5 08 __ LDA WORK + 5 
2c9d : 85 54 __ STA T5 + 1 
2c9f : a5 09 __ LDA WORK + 6 
2ca1 : 85 55 __ STA T5 + 2 
2ca3 : a5 0a __ LDA WORK + 7 
2ca5 : a2 06 __ LDX #$06
.l26:
2ca7 : c9 80 __ CMP #$80
2ca9 : 6a __ __ ROR
2caa : 66 55 __ ROR T5 + 2 
2cac : 66 54 __ ROR T5 + 1 
2cae : 66 53 __ ROR T5 + 0 
2cb0 : ca __ __ DEX
2cb1 : d0 f4 __ BNE $2ca7 ; (render_full_rotation.l26 + 0)
.s27:
2cb3 : a5 54 __ LDA T5 + 1 
2cb5 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2cb7 : 0a __ __ ASL
2cb8 : 8a __ __ TXA
2cb9 : 69 ff __ ADC #$ff
2cbb : 49 ff __ EOR #$ff
2cbd : 85 1d __ STA ACCU + 2 
2cbf : 85 1e __ STA ACCU + 3 
2cc1 : a5 53 __ LDA T5 + 0 
2cc3 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2cc5 : a5 17 __ LDA P10 ; (scale + 0)
2cc7 : 85 03 __ STA WORK + 0 
2cc9 : a5 18 __ LDA P11 ; (scale + 1)
2ccb : 85 04 __ STA WORK + 1 
2ccd : a5 48 __ LDA T1 + 2 
2ccf : 85 05 __ STA WORK + 2 
2cd1 : 85 06 __ STA WORK + 3 
2cd3 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2cd6 : a5 07 __ LDA WORK + 4 
2cd8 : 0a __ __ ASL
2cd9 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2cdb : a5 08 __ LDA WORK + 5 
2cdd : 2a __ __ ROL
2cde : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2ce0 : a5 09 __ LDA WORK + 6 
2ce2 : 2a __ __ ROL
2ce3 : 85 1d __ STA ACCU + 2 
2ce5 : a5 0a __ LDA WORK + 7 
2ce7 : 2a __ __ ROL
2ce8 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2cea : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2cec : 26 1d __ ROL ACCU + 2 
2cee : 2a __ __ ROL
2cef : 85 1e __ STA ACCU + 3 
2cf1 : a5 43 __ LDA T0 + 0 
2cf3 : 85 03 __ STA WORK + 0 
2cf5 : a5 44 __ LDA T0 + 1 
2cf7 : 85 04 __ STA WORK + 1 
2cf9 : a5 45 __ LDA T0 + 2 
2cfb : 85 05 __ STA WORK + 2 
2cfd : 85 06 __ STA WORK + 3 
2cff : 20 44 4b JSR $4b44 ; (divs32 + 0)
2d02 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2d04 : 85 53 __ STA T5 + 0 
2d06 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2d08 : 85 54 __ STA T5 + 1 
2d0a : a5 60 __ LDA T9 + 0 
2d0c : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2d0e : a5 61 __ LDA T9 + 1 
2d10 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2d12 : 85 1d __ STA ACCU + 2 
2d14 : 85 1e __ STA ACCU + 3 
2d16 : a5 49 __ LDA T2 + 0 
2d18 : 85 03 __ STA WORK + 0 
2d1a : a5 4a __ LDA T2 + 1 
2d1c : 85 04 __ STA WORK + 1 
2d1e : 85 05 __ STA WORK + 2 
2d20 : 85 06 __ STA WORK + 3 
2d22 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2d25 : a5 07 __ LDA WORK + 4 
2d27 : 85 49 __ STA T2 + 0 
2d29 : a5 08 __ LDA WORK + 5 
2d2b : 85 4a __ STA T2 + 1 
2d2d : a5 09 __ LDA WORK + 6 
2d2f : 85 4b __ STA T2 + 2 
2d31 : a5 0a __ LDA WORK + 7 
2d33 : a2 06 __ LDX #$06
.l28:
2d35 : c9 80 __ CMP #$80
2d37 : 6a __ __ ROR
2d38 : 66 4b __ ROR T2 + 2 
2d3a : 66 4a __ ROR T2 + 1 
2d3c : 66 49 __ ROR T2 + 0 
2d3e : ca __ __ DEX
2d3f : d0 f4 __ BNE $2d35 ; (render_full_rotation.l28 + 0)
.s29:
2d41 : a5 4a __ LDA T2 + 1 
2d43 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2d45 : 0a __ __ ASL
2d46 : 8a __ __ TXA
2d47 : 69 ff __ ADC #$ff
2d49 : 49 ff __ EOR #$ff
2d4b : 85 1d __ STA ACCU + 2 
2d4d : 85 1e __ STA ACCU + 3 
2d4f : a5 49 __ LDA T2 + 0 
2d51 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2d53 : a5 17 __ LDA P10 ; (scale + 0)
2d55 : 85 03 __ STA WORK + 0 
2d57 : a5 18 __ LDA P11 ; (scale + 1)
2d59 : 85 04 __ STA WORK + 1 
2d5b : a5 48 __ LDA T1 + 2 
2d5d : 85 05 __ STA WORK + 2 
2d5f : 85 06 __ STA WORK + 3 
2d61 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2d64 : a5 07 __ LDA WORK + 4 
2d66 : 0a __ __ ASL
2d67 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2d69 : a5 08 __ LDA WORK + 5 
2d6b : 2a __ __ ROL
2d6c : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2d6e : a5 09 __ LDA WORK + 6 
2d70 : 2a __ __ ROL
2d71 : 85 1d __ STA ACCU + 2 
2d73 : a5 0a __ LDA WORK + 7 
2d75 : 2a __ __ ROL
2d76 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
2d78 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
2d7a : 26 1d __ ROL ACCU + 2 
2d7c : 2a __ __ ROL
2d7d : 85 1e __ STA ACCU + 3 
2d7f : a5 43 __ LDA T0 + 0 
2d81 : 85 03 __ STA WORK + 0 
2d83 : a5 44 __ LDA T0 + 1 
2d85 : 85 04 __ STA WORK + 1 
2d87 : a5 45 __ LDA T0 + 2 
2d89 : 85 05 __ STA WORK + 2 
2d8b : 85 06 __ STA WORK + 3 
2d8d : 20 44 4b JSR $4b44 ; (divs32 + 0)
2d90 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2d92 : 85 43 __ STA T0 + 0 
2d94 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2d96 : 85 44 __ STA T0 + 1 
2d98 : ad 20 4e LDA $4e20 ; (x_pct + 0)
2d9b : 85 63 __ STA T10 + 0 
2d9d : ad 21 4e LDA $4e21 ; (x_pct + 1)
2da0 : 85 64 __ STA T10 + 1 
2da2 : ad 22 4e LDA $4e22 ; (y_pct + 0)
2da5 : 85 67 __ STA T11 + 0 
2da7 : ad 23 4e LDA $4e23 ; (y_pct + 1)
2daa : 85 68 __ STA T11 + 1 
2dac : ad 24 4e LDA $4e24 ; (z_pct + 0)
2daf : 85 72 __ STA T14 + 0 
2db1 : ad 25 4e LDA $4e25 ; (z_pct + 1)
2db4 : 85 73 __ STA T14 + 1 
2db6 : ad 28 4e LDA $4e28 ; (vx_pct + 0)
2db9 : 85 77 __ STA T16 + 0 
2dbb : ad 29 4e LDA $4e29 ; (vx_pct + 1)
2dbe : 85 78 __ STA T16 + 1 
2dc0 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
2dc3 : 85 79 __ STA T17 + 0 
2dc5 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
2dc8 : 85 7a __ STA T17 + 1 
2dca : ad 26 4e LDA $4e26 ; (z_rotated + 0)
2dcd : 85 7b __ STA T18 + 0 
2dcf : ad 27 4e LDA $4e27 ; (z_rotated + 1)
2dd2 : 85 7c __ STA T18 + 1 
2dd4 : ad d3 cf LDA $cfd3 ; (sstack + 0)
2dd7 : 85 7d __ STA T19 + 0 
2dd9 : ad d4 cf LDA $cfd4 ; (sstack + 1)
2ddc : 85 7e __ STA T19 + 1 
.l30:
2dde : a0 00 __ LDY #$00
2de0 : b1 63 __ LDA (T10 + 0),y 
2de2 : 85 46 __ STA T1 + 0 
2de4 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2de6 : c8 __ __ INY
2de7 : b1 63 __ LDA (T10 + 0),y 
2de9 : 85 47 __ STA T1 + 1 
2deb : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2ded : a5 56 __ LDA T6 + 0 
2def : 85 03 __ STA WORK + 0 
2df1 : a5 57 __ LDA T6 + 1 
2df3 : 85 04 __ STA WORK + 1 
2df5 : 20 15 49 JSR $4915 ; (mul16 + 0)
2df8 : a5 05 __ LDA WORK + 2 
2dfa : 85 49 __ STA T2 + 0 
2dfc : a5 06 __ LDA WORK + 3 
2dfe : 85 4a __ STA T2 + 1 
2e00 : a0 00 __ LDY #$00
2e02 : b1 67 __ LDA (T11 + 0),y 
2e04 : 85 60 __ STA T9 + 0 
2e06 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2e08 : c8 __ __ INY
2e09 : b1 67 __ LDA (T11 + 0),y 
2e0b : 85 61 __ STA T9 + 1 
2e0d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2e0f : a5 53 __ LDA T5 + 0 
2e11 : 85 03 __ STA WORK + 0 
2e13 : a5 54 __ LDA T5 + 1 
2e15 : 85 04 __ STA WORK + 1 
2e17 : 20 15 49 JSR $4915 ; (mul16 + 0)
2e1a : 18 __ __ CLC
2e1b : a5 05 __ LDA WORK + 2 
2e1d : 65 49 __ ADC T2 + 0 
2e1f : 85 49 __ STA T2 + 0 
2e21 : a5 06 __ LDA WORK + 3 
2e23 : 65 4a __ ADC T2 + 1 
2e25 : 85 4a __ STA T2 + 1 
2e27 : a0 00 __ LDY #$00
2e29 : b1 72 __ LDA (T14 + 0),y 
2e2b : 85 7f __ STA T22 + 0 
2e2d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2e2f : c8 __ __ INY
2e30 : b1 72 __ LDA (T14 + 0),y 
2e32 : 85 80 __ STA T22 + 1 
2e34 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2e36 : a5 43 __ LDA T0 + 0 
2e38 : 85 03 __ STA WORK + 0 
2e3a : a5 44 __ LDA T0 + 1 
2e3c : 85 04 __ STA WORK + 1 
2e3e : 20 15 49 JSR $4915 ; (mul16 + 0)
2e41 : 18 __ __ CLC
2e42 : a5 05 __ LDA WORK + 2 
2e44 : 65 49 __ ADC T2 + 0 
2e46 : a5 06 __ LDA WORK + 3 
2e48 : 65 4a __ ADC T2 + 1 
2e4a : 49 80 __ EOR #$80
2e4c : 38 __ __ SEC
2e4d : e9 80 __ SBC #$80
2e4f : 85 49 __ STA T2 + 0 
2e51 : a0 00 __ LDY #$00
2e53 : 91 7b __ STA (T18 + 0),y 
2e55 : e5 49 __ SBC T2 + 0 
2e57 : 85 4a __ STA T2 + 1 
2e59 : c8 __ __ INY
2e5a : 91 7b __ STA (T18 + 0),y 
2e5c : a5 50 __ LDA T4 + 0 
2e5e : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2e60 : a5 51 __ LDA T4 + 1 
2e62 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2e64 : a5 46 __ LDA T1 + 0 
2e66 : 85 03 __ STA WORK + 0 
2e68 : a5 47 __ LDA T1 + 1 
2e6a : 85 04 __ STA WORK + 1 
2e6c : 20 15 49 JSR $4915 ; (mul16 + 0)
2e6f : a5 05 __ LDA WORK + 2 
2e71 : 85 81 __ STA T23 + 0 
2e73 : a5 06 __ LDA WORK + 3 
2e75 : 85 82 __ STA T23 + 1 
2e77 : a5 5c __ LDA T8 + 0 
2e79 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2e7b : a5 5d __ LDA T8 + 1 
2e7d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2e7f : a5 60 __ LDA T9 + 0 
2e81 : 85 03 __ STA WORK + 0 
2e83 : a5 61 __ LDA T9 + 1 
2e85 : 85 04 __ STA WORK + 1 
2e87 : 20 15 49 JSR $4915 ; (mul16 + 0)
2e8a : 18 __ __ CLC
2e8b : a5 05 __ LDA WORK + 2 
2e8d : 65 81 __ ADC T23 + 0 
2e8f : 85 81 __ STA T23 + 0 
2e91 : a5 06 __ LDA WORK + 3 
2e93 : 65 82 __ ADC T23 + 1 
2e95 : 85 82 __ STA T23 + 1 
2e97 : a5 6b __ LDA T12 + 0 
2e99 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2e9b : a5 6c __ LDA T12 + 1 
2e9d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2e9f : a5 7f __ LDA T22 + 0 
2ea1 : 85 03 __ STA WORK + 0 
2ea3 : a5 80 __ LDA T22 + 1 
2ea5 : 85 04 __ STA WORK + 1 
2ea7 : 20 15 49 JSR $4915 ; (mul16 + 0)
2eaa : 18 __ __ CLC
2eab : a5 05 __ LDA WORK + 2 
2ead : 65 81 __ ADC T23 + 0 
2eaf : a5 06 __ LDA WORK + 3 
2eb1 : 65 82 __ ADC T23 + 1 
2eb3 : 85 82 __ STA T23 + 1 
2eb5 : a5 6f __ LDA T13 + 0 
2eb7 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2eb9 : a5 70 __ LDA T13 + 1 
2ebb : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2ebd : a5 46 __ LDA T1 + 0 
2ebf : 85 03 __ STA WORK + 0 
2ec1 : a5 47 __ LDA T1 + 1 
2ec3 : 85 04 __ STA WORK + 1 
2ec5 : 20 15 49 JSR $4915 ; (mul16 + 0)
2ec8 : a5 05 __ LDA WORK + 2 
2eca : 85 46 __ STA T1 + 0 
2ecc : a5 06 __ LDA WORK + 3 
2ece : 85 47 __ STA T1 + 1 
2ed0 : a5 58 __ LDA T7 + 0 
2ed2 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2ed4 : a5 59 __ LDA T7 + 1 
2ed6 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2ed8 : a5 60 __ LDA T9 + 0 
2eda : 85 03 __ STA WORK + 0 
2edc : a5 61 __ LDA T9 + 1 
2ede : 85 04 __ STA WORK + 1 
2ee0 : 20 15 49 JSR $4915 ; (mul16 + 0)
2ee3 : 18 __ __ CLC
2ee4 : a5 05 __ LDA WORK + 2 
2ee6 : 65 46 __ ADC T1 + 0 
2ee8 : 85 46 __ STA T1 + 0 
2eea : a5 06 __ LDA WORK + 3 
2eec : 65 47 __ ADC T1 + 1 
2eee : 85 47 __ STA T1 + 1 
2ef0 : a5 4c __ LDA T3 + 0 
2ef2 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2ef4 : a5 4d __ LDA T3 + 1 
2ef6 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2ef8 : a5 7f __ LDA T22 + 0 
2efa : 85 03 __ STA WORK + 0 
2efc : a5 80 __ LDA T22 + 1 
2efe : 85 04 __ STA WORK + 1 
2f00 : 20 15 49 JSR $4915 ; (mul16 + 0)
2f03 : 18 __ __ CLC
2f04 : a5 05 __ LDA WORK + 2 
2f06 : 65 46 __ ADC T1 + 0 
2f08 : a5 06 __ LDA WORK + 3 
2f0a : 65 47 __ ADC T1 + 1 
2f0c : 85 80 __ STA T22 + 1 
2f0e : 18 __ __ CLC
2f0f : a5 7d __ LDA T19 + 0 
2f11 : 65 49 __ ADC T2 + 0 
2f13 : 85 60 __ STA T9 + 0 
2f15 : a5 7e __ LDA T19 + 1 
2f17 : 65 4a __ ADC T2 + 1 
2f19 : 85 61 __ STA T9 + 1 
2f1b : 05 60 __ ORA T9 + 0 
2f1d : d0 08 __ BNE $2f27 ; (render_full_rotation.s31 + 0)
.s32:
2f1f : a9 01 __ LDA #$01
2f21 : 85 60 __ STA T9 + 0 
2f23 : a9 00 __ LDA #$00
2f25 : 85 61 __ STA T9 + 1 
.s31:
2f27 : a5 82 __ LDA T23 + 1 
2f29 : 49 80 __ EOR #$80
2f2b : 38 __ __ SEC
2f2c : e9 80 __ SBC #$80
2f2e : 85 03 __ STA WORK + 0 
2f30 : e5 03 __ SBC WORK + 0 
2f32 : 85 04 __ STA WORK + 1 
2f34 : 29 80 __ AND #$80
2f36 : 10 02 __ BPL $2f3a ; (render_full_rotation.s31 + 19)
2f38 : a9 ff __ LDA #$ff
2f3a : 85 05 __ STA WORK + 2 
2f3c : 85 06 __ STA WORK + 3 
2f3e : a5 7e __ LDA T19 + 1 
2f40 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2f42 : 29 80 __ AND #$80
2f44 : 10 02 __ BPL $2f48 ; (render_full_rotation.s31 + 33)
2f46 : a9 ff __ LDA #$ff
2f48 : 85 4b __ STA T2 + 2 
2f4a : 85 1e __ STA ACCU + 3 
2f4c : 85 1d __ STA ACCU + 2 
2f4e : a5 7d __ LDA T19 + 0 
2f50 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2f52 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2f55 : a5 61 __ LDA T9 + 1 
2f57 : 85 04 __ STA WORK + 1 
2f59 : 29 80 __ AND #$80
2f5b : 10 02 __ BPL $2f5f ; (render_full_rotation.s31 + 56)
2f5d : a9 ff __ LDA #$ff
2f5f : 85 62 __ STA T9 + 2 
2f61 : 85 06 __ STA WORK + 3 
2f63 : 85 05 __ STA WORK + 2 
2f65 : a5 07 __ LDA WORK + 4 
2f67 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2f69 : a5 08 __ LDA WORK + 5 
2f6b : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2f6d : a5 09 __ LDA WORK + 6 
2f6f : 85 1d __ STA ACCU + 2 
2f71 : a5 0a __ LDA WORK + 7 
2f73 : 85 1e __ STA ACCU + 3 
2f75 : a5 60 __ LDA T9 + 0 
2f77 : 85 03 __ STA WORK + 0 
2f79 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2f7c : 18 __ __ CLC
2f7d : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2f7f : 65 13 __ ADC P6 ; (dx + 0)
2f81 : a0 00 __ LDY #$00
2f83 : 91 77 __ STA (T16 + 0),y 
2f85 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2f87 : 65 14 __ ADC P7 ; (dx + 1)
2f89 : c8 __ __ INY
2f8a : 91 77 __ STA (T16 + 0),y 
2f8c : a5 80 __ LDA T22 + 1 
2f8e : 49 80 __ EOR #$80
2f90 : 38 __ __ SEC
2f91 : e9 80 __ SBC #$80
2f93 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2f95 : e5 1b __ SBC ACCU + 0 ; (num_points + 0)
2f97 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2f99 : 29 80 __ AND #$80
2f9b : 10 02 __ BPL $2f9f ; (render_full_rotation.s31 + 120)
2f9d : a9 ff __ LDA #$ff
2f9f : 85 1d __ STA ACCU + 2 
2fa1 : 85 1e __ STA ACCU + 3 
2fa3 : a5 7d __ LDA T19 + 0 
2fa5 : 85 03 __ STA WORK + 0 
2fa7 : a5 7e __ LDA T19 + 1 
2fa9 : 85 04 __ STA WORK + 1 
2fab : a5 4b __ LDA T2 + 2 
2fad : 85 05 __ STA WORK + 2 
2faf : 85 06 __ STA WORK + 3 
2fb1 : 20 dc 4a JSR $4adc ; (mul32 + 0)
2fb4 : a5 07 __ LDA WORK + 4 
2fb6 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
2fb8 : a5 08 __ LDA WORK + 5 
2fba : 85 1c __ STA ACCU + 1 ; (num_points + 1)
2fbc : a5 09 __ LDA WORK + 6 
2fbe : 85 1d __ STA ACCU + 2 
2fc0 : a5 0a __ LDA WORK + 7 
2fc2 : 85 1e __ STA ACCU + 3 
2fc4 : a5 60 __ LDA T9 + 0 
2fc6 : 85 03 __ STA WORK + 0 
2fc8 : a5 61 __ LDA T9 + 1 
2fca : 85 04 __ STA WORK + 1 
2fcc : a5 62 __ LDA T9 + 2 
2fce : 85 05 __ STA WORK + 2 
2fd0 : 85 06 __ STA WORK + 3 
2fd2 : 20 44 4b JSR $4b44 ; (divs32 + 0)
2fd5 : 18 __ __ CLC
2fd6 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
2fd8 : 65 15 __ ADC P8 ; (dy + 0)
2fda : a0 00 __ LDY #$00
2fdc : 91 79 __ STA (T17 + 0),y 
2fde : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
2fe0 : 65 16 __ ADC P9 ; (dy + 1)
2fe2 : c8 __ __ INY
2fe3 : 91 79 __ STA (T17 + 0),y 
2fe5 : 18 __ __ CLC
2fe6 : a5 72 __ LDA T14 + 0 
2fe8 : 69 02 __ ADC #$02
2fea : 85 72 __ STA T14 + 0 
2fec : 90 03 __ BCC $2ff1 ; (render_full_rotation.s38 + 0)
.s37:
2fee : e6 73 __ INC T14 + 1 
2ff0 : 18 __ __ CLC
.s38:
2ff1 : a5 67 __ LDA T11 + 0 
2ff3 : 69 02 __ ADC #$02
2ff5 : 85 67 __ STA T11 + 0 
2ff7 : 90 03 __ BCC $2ffc ; (render_full_rotation.s40 + 0)
.s39:
2ff9 : e6 68 __ INC T11 + 1 
2ffb : 18 __ __ CLC
.s40:
2ffc : a5 63 __ LDA T10 + 0 
2ffe : 69 02 __ ADC #$02
3000 : 85 63 __ STA T10 + 0 
3002 : 90 03 __ BCC $3007 ; (render_full_rotation.s42 + 0)
.s41:
3004 : e6 64 __ INC T10 + 1 
3006 : 18 __ __ CLC
.s42:
3007 : a5 7b __ LDA T18 + 0 
3009 : 69 02 __ ADC #$02
300b : 85 7b __ STA T18 + 0 
300d : 90 03 __ BCC $3012 ; (render_full_rotation.s44 + 0)
.s43:
300f : e6 7c __ INC T18 + 1 
3011 : 18 __ __ CLC
.s44:
3012 : a5 77 __ LDA T16 + 0 
3014 : 69 02 __ ADC #$02
3016 : 85 77 __ STA T16 + 0 
3018 : 90 03 __ BCC $301d ; (render_full_rotation.s46 + 0)
.s45:
301a : e6 78 __ INC T16 + 1 
301c : 18 __ __ CLC
.s46:
301d : a5 79 __ LDA T17 + 0 
301f : 69 02 __ ADC #$02
3021 : 85 79 __ STA T17 + 0 
3023 : 90 02 __ BCC $3027 ; (render_full_rotation.s48 + 0)
.s47:
3025 : e6 7a __ INC T17 + 1 
.s48:
3027 : a5 75 __ LDA T15 + 0 
3029 : d0 02 __ BNE $302d ; (render_full_rotation.s35 + 0)
.s34:
302b : c6 76 __ DEC T15 + 1 
.s35:
302d : c6 75 __ DEC T15 + 0 
302f : f0 03 __ BEQ $3034 ; (render_full_rotation.s36 + 0)
3031 : 4c de 2d JMP $2dde ; (render_full_rotation.l30 + 0)
.s36:
3034 : a5 76 __ LDA T15 + 1 
3036 : d0 f9 __ BNE $3031 ; (render_full_rotation.s35 + 4)
3038 : 4c 1f 26 JMP $261f ; (render_full_rotation.s3 + 0)
--------------------------------------------------------------------
sort_and_render_faces: ; sort_and_render_faces(i16)->void
; 440, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
303b : a2 0d __ LDX #$0d
303d : b5 53 __ LDA T4 + 0,x 
303f : 9d a8 cf STA $cfa8,x ; (sort_and_render_faces@stack + 0)
3042 : ca __ __ DEX
3043 : 10 f8 __ BPL $303d ; (sort_and_render_faces.s1 + 2)
.s4:
3045 : ad b6 4d LDA $4db6 ; (wireframeOn + 1)
3048 : d0 09 __ BNE $3053 ; (sort_and_render_faces.s5 + 0)
.s50:
304a : ae b5 4d LDX $4db5 ; (wireframeOn + 0)
304d : ca __ __ DEX
304e : d0 03 __ BNE $3053 ; (sort_and_render_faces.s5 + 0)
3050 : 4c c7 33 JMP $33c7 ; (sort_and_render_faces.s49 + 0)
.s5:
3053 : a9 ff __ LDA #$ff
3055 : a2 80 __ LDX #$80
.l7:
3057 : ca __ __ DEX
3058 : 9d e0 4f STA $4fe0,x ; (bucket_head[0] + 0)
305b : 9d 60 50 STA $5060,x ; (bucket_head[0] + 128)
305e : 9d e0 50 STA $50e0,x ; (bucket_head[0] + 256)
3061 : 9d 60 51 STA $5160,x ; (bucket_head[0] + 384)
3064 : d0 f1 __ BNE $3057 ; (sort_and_render_faces.l7 + 0)
.s6:
3066 : ad 6b 4d LDA $4d6b ; (plane_data_count + 0)
3069 : 85 4f __ STA T3 + 0 
306b : ad 6c 4d LDA $4d6c ; (plane_data_count + 1)
306e : 10 03 __ BPL $3073 ; (sort_and_render_faces.s48 + 0)
3070 : 4c 25 31 JMP $3125 ; (sort_and_render_faces.s8 + 0)
.s48:
3073 : 85 50 __ STA T3 + 1 
3075 : 05 4f __ ORA T3 + 0 
3077 : f0 f7 __ BEQ $3070 ; (sort_and_render_faces.s6 + 10)
.s18:
3079 : a9 00 __ LDA #$00
307b : 85 53 __ STA T4 + 0 
307d : 85 54 __ STA T4 + 1 
307f : 85 55 __ STA T5 + 0 
3081 : 85 56 __ STA T5 + 1 
.l19:
3083 : a5 54 __ LDA T4 + 1 
3085 : c9 04 __ CMP #$04
3087 : d0 04 __ BNE $308d ; (sort_and_render_faces.s20 + 0)
.s47:
3089 : a5 53 __ LDA T4 + 0 
308b : f0 e3 __ BEQ $3070 ; (sort_and_render_faces.s6 + 10)
.s20:
308d : a5 55 __ LDA T5 + 0 
308f : 85 51 __ STA T8 + 0 
3091 : 0a __ __ ASL
3092 : 85 43 __ STA T0 + 0 
3094 : a5 56 __ LDA T5 + 1 
3096 : 85 52 __ STA T8 + 1 
3098 : 2a __ __ ROL
3099 : 85 44 __ STA T0 + 1 
309b : ad 69 4d LDA $4d69 ; (plane_data + 0)
309e : 85 57 __ STA T6 + 0 
30a0 : 18 __ __ CLC
30a1 : 65 43 __ ADC T0 + 0 
30a3 : 85 59 __ STA T7 + 0 
30a5 : ad 6a 4d LDA $4d6a ; (plane_data + 1)
30a8 : 85 58 __ STA T6 + 1 
30aa : 65 44 __ ADC T0 + 1 
30ac : 85 5a __ STA T7 + 1 
30ae : a9 00 __ LDA #$00
30b0 : 85 5b __ STA T9 + 0 
30b2 : 85 5c __ STA T9 + 1 
30b4 : 85 43 __ STA T0 + 0 
30b6 : 85 44 __ STA T0 + 1 
30b8 : 85 45 __ STA T0 + 2 
30ba : 85 46 __ STA T0 + 3 
30bc : a9 01 __ LDA #$01
30be : 85 5d __ STA T10 + 0 
30c0 : a9 80 __ LDA #$80
30c2 : 85 5e __ STA T10 + 1 
.l21:
30c4 : a5 55 __ LDA T5 + 0 
30c6 : 0a __ __ ASL
30c7 : a8 __ __ TAY
30c8 : a5 56 __ LDA T5 + 1 
30ca : 2a __ __ ROL
30cb : aa __ __ TAX
30cc : 98 __ __ TYA
30cd : 18 __ __ CLC
30ce : 65 57 __ ADC T6 + 0 
30d0 : 85 47 __ STA T1 + 0 
30d2 : 8a __ __ TXA
30d3 : 65 58 __ ADC T6 + 1 
30d5 : 85 48 __ STA T1 + 1 
30d7 : a0 00 __ LDY #$00
30d9 : b1 47 __ LDA (T1 + 0),y 
30db : 85 4b __ STA T2 + 0 
30dd : c8 __ __ INY
30de : b1 47 __ LDA (T1 + 0),y 
30e0 : 85 4c __ STA T2 + 1 
30e2 : 05 4b __ ORA T2 + 0 
30e4 : f0 03 __ BEQ $30e9 ; (sort_and_render_faces.s22 + 0)
30e6 : 4c b3 32 JMP $32b3 ; (sort_and_render_faces.s38 + 0)
.s22:
30e9 : a5 5c __ LDA T9 + 1 
30eb : 30 1d __ BMI $310a ; (sort_and_render_faces.s23 + 0)
.s37:
30ed : d0 06 __ BNE $30f5 ; (sort_and_render_faces.s26 + 0)
.s36:
30ef : a5 5b __ LDA T9 + 0 
30f1 : c9 03 __ CMP #$03
30f3 : 90 15 __ BCC $310a ; (sort_and_render_faces.s23 + 0)
.s26:
30f5 : a5 46 __ LDA T0 + 3 
30f7 : 30 11 __ BMI $310a ; (sort_and_render_faces.s23 + 0)
.s32:
30f9 : f0 03 __ BEQ $30fe ; (sort_and_render_faces.s33 + 0)
30fb : 4c 1f 32 JMP $321f ; (sort_and_render_faces.s27 + 0)
.s33:
30fe : a5 45 __ LDA T0 + 2 
3100 : d0 f9 __ BNE $30fb ; (sort_and_render_faces.s32 + 2)
.s34:
3102 : a5 44 __ LDA T0 + 1 
3104 : d0 f5 __ BNE $30fb ; (sort_and_render_faces.s32 + 2)
.s35:
3106 : a5 43 __ LDA T0 + 0 
3108 : d0 f1 __ BNE $30fb ; (sort_and_render_faces.s32 + 2)
.s23:
310a : 24 50 __ BIT T3 + 1 
310c : 30 17 __ BMI $3125 ; (sort_and_render_faces.s8 + 0)
.s25:
310e : e6 55 __ INC T5 + 0 
3110 : d0 02 __ BNE $3114 ; (sort_and_render_faces.s64 + 0)
.s63:
3112 : e6 56 __ INC T5 + 1 
.s64:
3114 : a5 56 __ LDA T5 + 1 
3116 : c5 50 __ CMP T3 + 1 
3118 : b0 03 __ BCS $311d ; (sort_and_render_faces.s66 + 0)
311a : 4c 83 30 JMP $3083 ; (sort_and_render_faces.l19 + 0)
.s66:
311d : d0 06 __ BNE $3125 ; (sort_and_render_faces.s8 + 0)
.s24:
311f : a5 55 __ LDA T5 + 0 
3121 : c5 4f __ CMP T3 + 0 
3123 : 90 f5 __ BCC $311a ; (sort_and_render_faces.s64 + 6)
.s8:
3125 : a9 ff __ LDA #$ff
3127 : 85 53 __ STA T4 + 0 
3129 : a9 00 __ LDA #$00
.l9:
312b : 85 54 __ STA T4 + 1 
312d : a5 53 __ LDA T4 + 0 
312f : 0a __ __ ASL
3130 : a2 00 __ LDX #$00
3132 : 90 02 __ BCC $3136 ; (sort_and_render_faces.s61 + 0)
.s60:
3134 : e8 __ __ INX
3135 : 18 __ __ CLC
.s61:
3136 : 69 e0 __ ADC #$e0
3138 : 85 43 __ STA T0 + 0 
313a : 8a __ __ TXA
313b : 69 4f __ ADC #$4f
313d : 85 44 __ STA T0 + 1 
313f : a0 00 __ LDY #$00
3141 : b1 43 __ LDA (T0 + 0),y 
3143 : 85 1b __ STA ACCU + 0 
3145 : c8 __ __ INY
3146 : b1 43 __ LDA (T0 + 0),y 
3148 : aa __ __ TAX
3149 : e0 ff __ CPX #$ff
314b : d0 1c __ BNE $3169 ; (sort_and_render_faces.s11 + 0)
.s17:
314d : e4 1b __ CPX ACCU + 0 
314f : d0 18 __ BNE $3169 ; (sort_and_render_faces.s11 + 0)
.s10:
3151 : 18 __ __ CLC
3152 : a5 53 __ LDA T4 + 0 
3154 : 69 ff __ ADC #$ff
3156 : 85 53 __ STA T4 + 0 
3158 : a5 54 __ LDA T4 + 1 
315a : 69 ff __ ADC #$ff
315c : 10 cd __ BPL $312b ; (sort_and_render_faces.l9 + 0)
.s3:
315e : a2 0d __ LDX #$0d
3160 : bd a8 cf LDA $cfa8,x ; (sort_and_render_faces@stack + 0)
3163 : 95 53 __ STA T4 + 0,x 
3165 : ca __ __ DEX
3166 : 10 f8 __ BPL $3160 ; (sort_and_render_faces.s3 + 2)
3168 : 60 __ __ RTS
.s11:
3169 : ad 69 4d LDA $4d69 ; (plane_data + 0)
316c : 85 55 __ STA T5 + 0 
316e : ad 6a 4d LDA $4d6a ; (plane_data + 1)
3171 : 85 56 __ STA T5 + 1 
3173 : ad 2c 4e LDA $4e2c ; (u_array + 0)
3176 : 85 57 __ STA T6 + 0 
3178 : ad 2d 4e LDA $4e2d ; (u_array + 1)
317b : 85 58 __ STA T6 + 1 
.l12:
317d : a9 00 __ LDA #$00
317f : 85 47 __ STA T1 + 0 
3181 : 85 48 __ STA T1 + 1 
3183 : a5 1b __ LDA ACCU + 0 
3185 : 0a __ __ ASL
3186 : 85 59 __ STA T7 + 0 
3188 : a8 __ __ TAY
3189 : 8a __ __ TXA
318a : 2a __ __ ROL
318b : 85 5a __ STA T7 + 1 
318d : 18 __ __ CLC
318e : 69 51 __ ADC #$51
3190 : 85 44 __ STA T0 + 1 
3192 : a9 e0 __ LDA #$e0
3194 : 85 43 __ STA T0 + 0 
3196 : b1 43 __ LDA (T0 + 0),y 
3198 : aa __ __ TAX
3199 : c8 __ __ INY
319a : b1 43 __ LDA (T0 + 0),y 
319c : 85 44 __ STA T0 + 1 
.l13:
319e : 8a __ __ TXA
319f : 18 __ __ CLC
31a0 : 65 47 __ ADC T1 + 0 
31a2 : 85 4b __ STA T2 + 0 
31a4 : a5 44 __ LDA T0 + 1 
31a6 : 65 48 __ ADC T1 + 1 
31a8 : 06 4b __ ASL T2 + 0 
31aa : 2a __ __ ROL
31ab : 18 __ __ CLC
31ac : 65 56 __ ADC T5 + 1 
31ae : 85 4c __ STA T2 + 1 
31b0 : a4 55 __ LDY T5 + 0 
31b2 : b1 4b __ LDA (T2 + 0),y 
31b4 : 85 1b __ STA ACCU + 0 
31b6 : c8 __ __ INY
31b7 : b1 4b __ LDA (T2 + 0),y 
31b9 : 85 4c __ STA T2 + 1 
31bb : 05 1b __ ORA ACCU + 0 
31bd : f0 26 __ BEQ $31e5 ; (sort_and_render_faces.s14 + 0)
.s16:
31bf : a5 47 __ LDA T1 + 0 
31c1 : 0a __ __ ASL
31c2 : 85 4f __ STA T3 + 0 
31c4 : a5 48 __ LDA T1 + 1 
31c6 : 2a __ __ ROL
31c7 : 18 __ __ CLC
31c8 : 65 58 __ ADC T6 + 1 
31ca : 85 50 __ STA T3 + 1 
31cc : 38 __ __ SEC
31cd : a5 1b __ LDA ACCU + 0 
31cf : e9 01 __ SBC #$01
31d1 : a4 57 __ LDY T6 + 0 
31d3 : 91 4f __ STA (T3 + 0),y 
31d5 : a5 4c __ LDA T2 + 1 
31d7 : e9 00 __ SBC #$00
31d9 : c8 __ __ INY
31da : 91 4f __ STA (T3 + 0),y 
31dc : e6 47 __ INC T1 + 0 
31de : d0 be __ BNE $319e ; (sort_and_render_faces.l13 + 0)
.s62:
31e0 : e6 48 __ INC T1 + 1 
31e2 : 4c 9e 31 JMP $319e ; (sort_and_render_faces.l13 + 0)
.s14:
31e5 : a5 57 __ LDA T6 + 0 
31e7 : 8d e9 cf STA $cfe9 ; (sstack + 22)
31ea : a5 58 __ LDA T6 + 1 
31ec : 8d ea cf STA $cfea ; (sstack + 23)
31ef : a5 47 __ LDA T1 + 0 
31f1 : 8d eb cf STA $cfeb ; (sstack + 24)
31f4 : a5 48 __ LDA T1 + 1 
31f6 : 8d ec cf STA $cfec ; (sstack + 25)
31f9 : 20 a5 3f JSR $3fa5 ; (draw_plane.s1 + 0)
31fc : a9 e0 __ LDA #$e0
31fe : 85 43 __ STA T0 + 0 
3200 : 18 __ __ CLC
3201 : a9 59 __ LDA #$59
3203 : 65 5a __ ADC T7 + 1 
3205 : 85 44 __ STA T0 + 1 
3207 : a4 59 __ LDY T7 + 0 
3209 : b1 43 __ LDA (T0 + 0),y 
320b : 85 1b __ STA ACCU + 0 
320d : c8 __ __ INY
320e : b1 43 __ LDA (T0 + 0),y 
3210 : aa __ __ TAX
3211 : e0 ff __ CPX #$ff
3213 : f0 03 __ BEQ $3218 ; (sort_and_render_faces.s15 + 0)
3215 : 4c 7d 31 JMP $317d ; (sort_and_render_faces.l12 + 0)
.s15:
3218 : e4 1b __ CPX ACCU + 0 
321a : d0 f9 __ BNE $3215 ; (sort_and_render_faces.s14 + 48)
321c : 4c 51 31 JMP $3151 ; (sort_and_render_faces.s10 + 0)
.s27:
321f : a5 53 __ LDA T4 + 0 
3221 : 0a __ __ ASL
3222 : 85 43 __ STA T0 + 0 
3224 : a8 __ __ TAY
3225 : a5 54 __ LDA T4 + 1 
3227 : 2a __ __ ROL
3228 : 85 44 __ STA T0 + 1 
322a : 18 __ __ CLC
322b : 69 51 __ ADC #$51
322d : 85 48 __ STA T1 + 1 
322f : a9 e0 __ LDA #$e0
3231 : 85 47 __ STA T1 + 0 
3233 : a5 51 __ LDA T8 + 0 
3235 : 91 47 __ STA (T1 + 0),y 
3237 : a5 52 __ LDA T8 + 1 
3239 : c8 __ __ INY
323a : 91 47 __ STA (T1 + 0),y 
323c : ad ed cf LDA $cfed ; (sstack + 26)
323f : 65 5d __ ADC T10 + 0 
3241 : 85 47 __ STA T1 + 0 
3243 : ad ee cf LDA $cfee ; (sstack + 27)
3246 : 65 5e __ ADC T10 + 1 
3248 : 18 __ __ CLC
3249 : 69 01 __ ADC #$01
324b : 4a __ __ LSR
324c : 66 47 __ ROR T1 + 0 
324e : 4a __ __ LSR
324f : 66 47 __ ROR T1 + 0 
3251 : 49 20 __ EOR #$20
3253 : 38 __ __ SEC
3254 : e9 20 __ SBC #$20
3256 : 10 08 __ BPL $3260 ; (sort_and_render_faces.s28 + 0)
.s31:
3258 : a9 00 __ LDA #$00
325a : 85 47 __ STA T1 + 0 
.s51:
325c : 85 48 __ STA T1 + 1 
325e : f0 0c __ BEQ $326c ; (sort_and_render_faces.s29 + 0)
.s28:
3260 : 85 48 __ STA T1 + 1 
3262 : f0 08 __ BEQ $326c ; (sort_and_render_faces.s29 + 0)
.s30:
3264 : a9 ff __ LDA #$ff
3266 : 85 47 __ STA T1 + 0 
3268 : a9 00 __ LDA #$00
326a : 85 48 __ STA T1 + 1 
.s29:
326c : 06 47 __ ASL T1 + 0 
326e : 26 48 __ ROL T1 + 1 
3270 : 18 __ __ CLC
3271 : a9 e0 __ LDA #$e0
3273 : 65 47 __ ADC T1 + 0 
3275 : 85 47 __ STA T1 + 0 
3277 : a9 4f __ LDA #$4f
3279 : 65 48 __ ADC T1 + 1 
327b : 85 48 __ STA T1 + 1 
327d : a0 00 __ LDY #$00
327f : b1 47 __ LDA (T1 + 0),y 
3281 : aa __ __ TAX
3282 : c8 __ __ INY
3283 : b1 47 __ LDA (T1 + 0),y 
3285 : 85 4c __ STA T2 + 1 
3287 : a5 53 __ LDA T4 + 0 
3289 : 88 __ __ DEY
328a : 91 47 __ STA (T1 + 0),y 
328c : a5 54 __ LDA T4 + 1 
328e : c8 __ __ INY
328f : 91 47 __ STA (T1 + 0),y 
3291 : 18 __ __ CLC
3292 : a9 e0 __ LDA #$e0
3294 : 65 43 __ ADC T0 + 0 
3296 : 85 43 __ STA T0 + 0 
3298 : a9 59 __ LDA #$59
329a : 65 44 __ ADC T0 + 1 
329c : 85 44 __ STA T0 + 1 
329e : 8a __ __ TXA
329f : 88 __ __ DEY
32a0 : 91 43 __ STA (T0 + 0),y 
32a2 : a5 4c __ LDA T2 + 1 
32a4 : c8 __ __ INY
32a5 : 91 43 __ STA (T0 + 0),y 
32a7 : e6 53 __ INC T4 + 0 
32a9 : f0 03 __ BEQ $32ae ; (sort_and_render_faces.s65 + 0)
32ab : 4c 0a 31 JMP $310a ; (sort_and_render_faces.s23 + 0)
.s65:
32ae : e6 54 __ INC T4 + 1 
32b0 : 4c 0a 31 JMP $310a ; (sort_and_render_faces.s23 + 0)
.s38:
32b3 : c8 __ __ INY
32b4 : b1 47 __ LDA (T1 + 0),y 
32b6 : aa __ __ TAX
32b7 : c8 __ __ INY
32b8 : b1 47 __ LDA (T1 + 0),y 
32ba : 86 47 __ STX T1 + 0 
32bc : 85 48 __ STA T1 + 1 
32be : 05 47 __ ORA T1 + 0 
32c0 : d0 0b __ BNE $32cd ; (sort_and_render_faces.s39 + 0)
.s46:
32c2 : a8 __ __ TAY
32c3 : b1 59 __ LDA (T7 + 0),y 
32c5 : 85 47 __ STA T1 + 0 
32c7 : a0 01 __ LDY #$01
32c9 : b1 59 __ LDA (T7 + 0),y 
32cb : 85 48 __ STA T1 + 1 
.s39:
32cd : 38 __ __ SEC
32ce : a5 47 __ LDA T1 + 0 
32d0 : e9 01 __ SBC #$01
32d2 : 85 47 __ STA T1 + 0 
32d4 : b0 02 __ BCS $32d8 ; (sort_and_render_faces.s53 + 0)
.s52:
32d6 : c6 48 __ DEC T1 + 1 
.s53:
32d8 : 06 4b __ ASL T2 + 0 
32da : 26 4c __ ROL T2 + 1 
32dc : 38 __ __ SEC
32dd : a5 4b __ LDA T2 + 0 
32df : e9 02 __ SBC #$02
32e1 : 85 4b __ STA T2 + 0 
32e3 : b0 02 __ BCS $32e7 ; (sort_and_render_faces.s55 + 0)
.s54:
32e5 : c6 4c __ DEC T2 + 1 
.s55:
32e7 : 18 __ __ CLC
32e8 : 6d 26 4e ADC $4e26 ; (z_rotated + 0)
32eb : 85 5f __ STA T11 + 0 
32ed : ad 27 4e LDA $4e27 ; (z_rotated + 1)
32f0 : 65 4c __ ADC T2 + 1 
32f2 : 85 60 __ STA T11 + 1 
32f4 : a0 00 __ LDY #$00
32f6 : b1 5f __ LDA (T11 + 0),y 
32f8 : 85 1b __ STA ACCU + 0 
32fa : c8 __ __ INY
32fb : b1 5f __ LDA (T11 + 0),y 
32fd : 85 60 __ STA T11 + 1 
32ff : a5 5e __ LDA T10 + 1 
3301 : c5 60 __ CMP T11 + 1 
3303 : d0 08 __ BNE $330d ; (sort_and_render_faces.s45 + 0)
.s42:
3305 : a5 5d __ LDA T10 + 0 
3307 : c5 1b __ CMP ACCU + 0 
.s43:
3309 : 90 08 __ BCC $3313 ; (sort_and_render_faces.s41 + 0)
330b : b0 0e __ BCS $331b ; (sort_and_render_faces.s40 + 0)
.s45:
330d : 45 60 __ EOR T11 + 1 
330f : 10 f8 __ BPL $3309 ; (sort_and_render_faces.s43 + 0)
.s44:
3311 : 90 08 __ BCC $331b ; (sort_and_render_faces.s40 + 0)
.s41:
3313 : a5 1b __ LDA ACCU + 0 
3315 : 85 5d __ STA T10 + 0 
3317 : a5 60 __ LDA T11 + 1 
3319 : 85 5e __ STA T10 + 1 
.s40:
331b : e6 55 __ INC T5 + 0 
331d : d0 02 __ BNE $3321 ; (sort_and_render_faces.s57 + 0)
.s56:
331f : e6 56 __ INC T5 + 1 
.s57:
3321 : e6 5b __ INC T9 + 0 
3323 : d0 02 __ BNE $3327 ; (sort_and_render_faces.s59 + 0)
.s58:
3325 : e6 5c __ INC T9 + 1 
.s59:
3327 : ad 28 4e LDA $4e28 ; (vx_pct + 0)
332a : 18 __ __ CLC
332b : 65 4b __ ADC T2 + 0 
332d : 85 1b __ STA ACCU + 0 
332f : ad 29 4e LDA $4e29 ; (vx_pct + 1)
3332 : 65 4c __ ADC T2 + 1 
3334 : 85 1c __ STA ACCU + 1 
3336 : a0 00 __ LDY #$00
3338 : b1 1b __ LDA (ACCU + 0),y 
333a : 85 1d __ STA ACCU + 2 
333c : c8 __ __ INY
333d : b1 1b __ LDA (ACCU + 0),y 
333f : aa __ __ TAX
3340 : a5 47 __ LDA T1 + 0 
3342 : 0a __ __ ASL
3343 : 85 1b __ STA ACCU + 0 
3345 : a5 48 __ LDA T1 + 1 
3347 : 2a __ __ ROL
3348 : 85 1c __ STA ACCU + 1 
334a : ad 28 4e LDA $4e28 ; (vx_pct + 0)
334d : 18 __ __ CLC
334e : 65 1b __ ADC ACCU + 0 
3350 : 85 5f __ STA T11 + 0 
3352 : ad 29 4e LDA $4e29 ; (vx_pct + 1)
3355 : 65 1c __ ADC ACCU + 1 
3357 : 85 60 __ STA T11 + 1 
3359 : 88 __ __ DEY
335a : b1 5f __ LDA (T11 + 0),y 
335c : 18 __ __ CLC
335d : 65 1d __ ADC ACCU + 2 
335f : 85 03 __ STA WORK + 0 
3361 : 8a __ __ TXA
3362 : c8 __ __ INY
3363 : 71 5f __ ADC (T11 + 0),y 
3365 : 85 04 __ STA WORK + 1 
3367 : 29 80 __ AND #$80
3369 : 10 02 __ BPL $336d ; (sort_and_render_faces.s59 + 70)
336b : a9 ff __ LDA #$ff
336d : 85 05 __ STA WORK + 2 
336f : 85 06 __ STA WORK + 3 
3371 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
3374 : 18 __ __ CLC
3375 : 65 4b __ ADC T2 + 0 
3377 : 85 4b __ STA T2 + 0 
3379 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
337c : 65 4c __ ADC T2 + 1 
337e : 85 4c __ STA T2 + 1 
3380 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
3383 : 18 __ __ CLC
3384 : 65 1b __ ADC ACCU + 0 
3386 : 85 5f __ STA T11 + 0 
3388 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
338b : 65 1c __ ADC ACCU + 1 
338d : 85 60 __ STA T11 + 1 
338f : 88 __ __ DEY
3390 : b1 4b __ LDA (T2 + 0),y 
3392 : 38 __ __ SEC
3393 : f1 5f __ SBC (T11 + 0),y 
3395 : 85 1b __ STA ACCU + 0 
3397 : c8 __ __ INY
3398 : b1 4b __ LDA (T2 + 0),y 
339a : f1 5f __ SBC (T11 + 0),y 
339c : 85 1c __ STA ACCU + 1 
339e : 29 80 __ AND #$80
33a0 : 10 02 __ BPL $33a4 ; (sort_and_render_faces.s59 + 125)
33a2 : a9 ff __ LDA #$ff
33a4 : 85 1d __ STA ACCU + 2 
33a6 : 85 1e __ STA ACCU + 3 
33a8 : 20 dc 4a JSR $4adc ; (mul32 + 0)
33ab : 18 __ __ CLC
33ac : a5 07 __ LDA WORK + 4 
33ae : 65 43 __ ADC T0 + 0 
33b0 : 85 43 __ STA T0 + 0 
33b2 : a5 08 __ LDA WORK + 5 
33b4 : 65 44 __ ADC T0 + 1 
33b6 : 85 44 __ STA T0 + 1 
33b8 : a5 09 __ LDA WORK + 6 
33ba : 65 45 __ ADC T0 + 2 
33bc : 85 45 __ STA T0 + 2 
33be : a5 0a __ LDA WORK + 7 
33c0 : 65 46 __ ADC T0 + 3 
33c2 : 85 46 __ STA T0 + 3 
33c4 : 4c c4 30 JMP $30c4 ; (sort_and_render_faces.l21 + 0)
.s49:
33c7 : 20 cd 33 JSR $33cd ; (render_wireframe.s1 + 0)
33ca : 4c 5e 31 JMP $315e ; (sort_and_render_faces.s3 + 0)
--------------------------------------------------------------------
render_wireframe: ; render_wireframe()->void
; 381, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
33cd : a2 07 __ LDX #$07
33cf : b5 53 __ LDA T4 + 0,x 
33d1 : 9d bd cf STA $cfbd,x ; (render_wireframe@stack + 0)
33d4 : ca __ __ DEX
33d5 : 10 f8 __ BPL $33cf ; (render_wireframe.s1 + 2)
.s4:
33d7 : ad 6b 4d LDA $4d6b ; (plane_data_count + 0)
33da : 85 53 __ STA T4 + 0 
33dc : ad 6c 4d LDA $4d6c ; (plane_data_count + 1)
33df : 30 6d __ BMI $344e ; (render_wireframe.s3 + 0)
.s15:
33e1 : 85 54 __ STA T4 + 1 
33e3 : 05 53 __ ORA T4 + 0 
33e5 : f0 67 __ BEQ $344e ; (render_wireframe.s3 + 0)
.s5:
33e7 : a9 00 __ LDA #$00
33e9 : 85 55 __ STA T5 + 0 
33eb : 85 56 __ STA T5 + 1 
33ed : ad 69 4d LDA $4d69 ; (plane_data + 0)
33f0 : 85 57 __ STA T6 + 0 
33f2 : ad 6a 4d LDA $4d6a ; (plane_data + 1)
33f5 : 85 58 __ STA T6 + 1 
.l6:
33f7 : a5 55 __ LDA T5 + 0 
.l22:
33f9 : 0a __ __ ASL
33fa : 85 43 __ STA T0 + 0 
33fc : a5 56 __ LDA T5 + 1 
33fe : 2a __ __ ROL
33ff : 18 __ __ CLC
3400 : 65 58 __ ADC T6 + 1 
3402 : 85 44 __ STA T0 + 1 
3404 : a4 57 __ LDY T6 + 0 
3406 : b1 43 __ LDA (T0 + 0),y 
3408 : 38 __ __ SEC
3409 : e9 01 __ SBC #$01
340b : 85 59 __ STA T7 + 0 
340d : c8 __ __ INY
340e : b1 43 __ LDA (T0 + 0),y 
3410 : e9 00 __ SBC #$00
3412 : 85 5a __ STA T7 + 1 
.l7:
3414 : a5 55 __ LDA T5 + 0 
3416 : 0a __ __ ASL
3417 : a8 __ __ TAY
3418 : a5 56 __ LDA T5 + 1 
341a : 2a __ __ ROL
341b : aa __ __ TAX
341c : 98 __ __ TYA
341d : 18 __ __ CLC
341e : 65 57 __ ADC T6 + 0 
3420 : 85 43 __ STA T0 + 0 
3422 : 8a __ __ TXA
3423 : 65 58 __ ADC T6 + 1 
3425 : 85 44 __ STA T0 + 1 
3427 : a0 00 __ LDY #$00
3429 : b1 43 __ LDA (T0 + 0),y 
342b : 85 45 __ STA T1 + 0 
342d : c8 __ __ INY
342e : b1 43 __ LDA (T0 + 0),y 
3430 : 85 46 __ STA T1 + 1 
3432 : 05 45 __ ORA T1 + 0 
3434 : d0 23 __ BNE $3459 ; (render_wireframe.s11 + 0)
.s8:
3436 : 24 54 __ BIT T4 + 1 
3438 : 30 14 __ BMI $344e ; (render_wireframe.s3 + 0)
.s10:
343a : e6 55 __ INC T5 + 0 
343c : d0 02 __ BNE $3440 ; (render_wireframe.s20 + 0)
.s19:
343e : e6 56 __ INC T5 + 1 
.s20:
3440 : a5 56 __ LDA T5 + 1 
3442 : c5 54 __ CMP T4 + 1 
3444 : 90 b1 __ BCC $33f7 ; (render_wireframe.l6 + 0)
.s21:
3446 : d0 06 __ BNE $344e ; (render_wireframe.s3 + 0)
.s9:
3448 : a5 55 __ LDA T5 + 0 
344a : c5 53 __ CMP T4 + 0 
344c : 90 ab __ BCC $33f9 ; (render_wireframe.l22 + 0)
.s3:
344e : a2 07 __ LDX #$07
3450 : bd bd cf LDA $cfbd,x ; (render_wireframe@stack + 0)
3453 : 95 53 __ STA T4 + 0,x 
3455 : ca __ __ DEX
3456 : 10 f8 __ BPL $3450 ; (render_wireframe.s3 + 2)
3458 : 60 __ __ RTS
.s11:
3459 : 06 45 __ ASL T1 + 0 
345b : 26 46 __ ROL T1 + 1 
345d : 38 __ __ SEC
345e : a5 45 __ LDA T1 + 0 
3460 : e9 02 __ SBC #$02
3462 : 85 45 __ STA T1 + 0 
3464 : b0 02 __ BCS $3468 ; (render_wireframe.s17 + 0)
.s16:
3466 : c6 46 __ DEC T1 + 1 
.s17:
3468 : 18 __ __ CLC
3469 : 6d 28 4e ADC $4e28 ; (vx_pct + 0)
346c : 85 49 __ STA T3 + 0 
346e : ad 29 4e LDA $4e29 ; (vx_pct + 1)
3471 : 65 46 __ ADC T1 + 1 
3473 : 85 4a __ STA T3 + 1 
3475 : a0 00 __ LDY #$00
3477 : b1 49 __ LDA (T3 + 0),y 
3479 : 8d e1 cf STA $cfe1 ; (sstack + 14)
347c : c8 __ __ INY
347d : b1 49 __ LDA (T3 + 0),y 
347f : 8d e2 cf STA $cfe2 ; (sstack + 15)
3482 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
3485 : 18 __ __ CLC
3486 : 65 45 __ ADC T1 + 0 
3488 : 85 45 __ STA T1 + 0 
348a : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
348d : 65 46 __ ADC T1 + 1 
348f : 85 46 __ STA T1 + 1 
3491 : 88 __ __ DEY
3492 : b1 45 __ LDA (T1 + 0),y 
3494 : 8d e3 cf STA $cfe3 ; (sstack + 16)
3497 : c8 __ __ INY
3498 : b1 45 __ LDA (T1 + 0),y 
349a : 8d e4 cf STA $cfe4 ; (sstack + 17)
349d : c8 __ __ INY
349e : b1 43 __ LDA (T0 + 0),y 
34a0 : 85 1b __ STA ACCU + 0 
34a2 : c8 __ __ INY
34a3 : b1 43 __ LDA (T0 + 0),y 
34a5 : aa __ __ TAX
34a6 : 05 1b __ ORA ACCU + 0 
34a8 : f0 0d __ BEQ $34b7 ; (render_wireframe.s14 + 0)
.s12:
34aa : 38 __ __ SEC
34ab : a5 1b __ LDA ACCU + 0 
34ad : e9 01 __ SBC #$01
34af : 85 43 __ STA T0 + 0 
34b1 : 8a __ __ TXA
34b2 : e9 00 __ SBC #$00
34b4 : 4c bd 34 JMP $34bd ; (render_wireframe.s13 + 0)
.s14:
34b7 : a5 59 __ LDA T7 + 0 
34b9 : 85 43 __ STA T0 + 0 
34bb : a5 5a __ LDA T7 + 1 
.s13:
34bd : 06 43 __ ASL T0 + 0 
34bf : 2a __ __ ROL
34c0 : 85 44 __ STA T0 + 1 
34c2 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
34c5 : 18 __ __ CLC
34c6 : 65 43 __ ADC T0 + 0 
34c8 : 85 49 __ STA T3 + 0 
34ca : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
34cd : 65 44 __ ADC T0 + 1 
34cf : 85 4a __ STA T3 + 1 
34d1 : a0 00 __ LDY #$00
34d3 : b1 49 __ LDA (T3 + 0),y 
34d5 : 8d e7 cf STA $cfe7 ; (sstack + 20)
34d8 : c8 __ __ INY
34d9 : b1 49 __ LDA (T3 + 0),y 
34db : 8d e8 cf STA $cfe8 ; (sstack + 21)
34de : ad 28 4e LDA $4e28 ; (vx_pct + 0)
34e1 : 18 __ __ CLC
34e2 : 65 43 __ ADC T0 + 0 
34e4 : 85 47 __ STA T2 + 0 
34e6 : ad 29 4e LDA $4e29 ; (vx_pct + 1)
34e9 : 65 44 __ ADC T0 + 1 
34eb : 85 48 __ STA T2 + 1 
34ed : 88 __ __ DEY
34ee : b1 47 __ LDA (T2 + 0),y 
34f0 : 8d e5 cf STA $cfe5 ; (sstack + 18)
34f3 : c8 __ __ INY
34f4 : b1 47 __ LDA (T2 + 0),y 
34f6 : 8d e6 cf STA $cfe6 ; (sstack + 19)
34f9 : 20 08 35 JSR $3508 ; (drawline.s4 + 0)
34fc : e6 55 __ INC T5 + 0 
34fe : f0 03 __ BEQ $3503 ; (render_wireframe.s18 + 0)
3500 : 4c 14 34 JMP $3414 ; (render_wireframe.l7 + 0)
.s18:
3503 : e6 56 __ INC T5 + 1 
3505 : 4c 14 34 JMP $3414 ; (render_wireframe.l7 + 0)
--------------------------------------------------------------------
drawline: ; drawline(i16,i16,i16,i16)->void
; 244, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
3508 : a9 00 __ LDA #$00
350a : 8d e0 cf STA $cfe0 ; (sstack + 13)
350d : a9 30 __ LDA #$30
350f : 8d d3 cf STA $cfd3 ; (sstack + 0)
3512 : a9 4e __ LDA #$4e
3514 : 8d d4 cf STA $cfd4 ; (sstack + 1)
3517 : a9 b9 __ LDA #$b9
3519 : 8d d5 cf STA $cfd5 ; (sstack + 2)
351c : a9 4d __ LDA #$4d
351e : 8d d6 cf STA $cfd6 ; (sstack + 3)
3521 : ad e1 cf LDA $cfe1 ; (sstack + 14)
3524 : 8d d7 cf STA $cfd7 ; (sstack + 4)
3527 : ad e2 cf LDA $cfe2 ; (sstack + 15)
352a : 8d d8 cf STA $cfd8 ; (sstack + 5)
352d : ad e3 cf LDA $cfe3 ; (sstack + 16)
3530 : 8d d9 cf STA $cfd9 ; (sstack + 6)
3533 : ad e4 cf LDA $cfe4 ; (sstack + 17)
3536 : 8d da cf STA $cfda ; (sstack + 7)
3539 : ad e5 cf LDA $cfe5 ; (sstack + 18)
353c : 8d db cf STA $cfdb ; (sstack + 8)
353f : ad e6 cf LDA $cfe6 ; (sstack + 19)
3542 : 8d dc cf STA $cfdc ; (sstack + 9)
3545 : ad e7 cf LDA $cfe7 ; (sstack + 20)
3548 : 8d dd cf STA $cfdd ; (sstack + 10)
354b : ad e8 cf LDA $cfe8 ; (sstack + 21)
354e : 8d de cf STA $cfde ; (sstack + 11)
3551 : ad b8 4d LDA $4db8 ; (drawing_mode + 1)
3554 : 0d b7 4d ORA $4db7 ; (drawing_mode + 0)
3557 : f0 02 __ BEQ $355b ; (drawline.s6 + 0)
.s5:
3559 : a9 ff __ LDA #$ff
.s6:
355b : 8d df cf STA $cfdf ; (sstack + 12)
355e : 4c 61 35 JMP $3561 ; (bm_line.s1 + 0)
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "D:/Arbeit/dev/oscar64/include/gfx/bitmap.h"
.s1:
3561 : a2 0d __ LDX #$0d
3563 : b5 53 __ LDA T2 + 0,x 
3565 : 9d c5 cf STA $cfc5,x ; (bm_line@stack + 0)
3568 : ca __ __ DEX
3569 : 10 f8 __ BPL $3563 ; (bm_line.s1 + 2)
.s4:
356b : ad d9 cf LDA $cfd9 ; (sstack + 6)
356e : 85 55 __ STA T3 + 0 
3570 : ad da cf LDA $cfda ; (sstack + 7)
3573 : 85 56 __ STA T3 + 1 
3575 : ad dd cf LDA $cfdd ; (sstack + 10)
3578 : 85 53 __ STA T2 + 0 
357a : 38 __ __ SEC
357b : e5 55 __ SBC T3 + 0 
357d : 85 57 __ STA T4 + 0 
357f : ad de cf LDA $cfde ; (sstack + 11)
3582 : 85 54 __ STA T2 + 1 
3584 : e5 56 __ SBC T3 + 1 
3586 : 85 58 __ STA T4 + 1 
3588 : ad d5 cf LDA $cfd5 ; (sstack + 2)
358b : 85 59 __ STA T5 + 0 
358d : ad d6 cf LDA $cfd6 ; (sstack + 3)
3590 : 85 5a __ STA T5 + 1 
3592 : a0 00 __ LDY #$00
3594 : b1 59 __ LDA (T5 + 0),y 
3596 : 85 43 __ STA T0 + 0 
3598 : c8 __ __ INY
3599 : b1 59 __ LDA (T5 + 0),y 
359b : 85 44 __ STA T0 + 1 
359d : a0 04 __ LDY #$04
359f : b1 59 __ LDA (T5 + 0),y 
35a1 : 85 45 __ STA T1 + 0 
35a3 : ad d7 cf LDA $cfd7 ; (sstack + 4)
35a6 : 85 5d __ STA T7 + 0 
35a8 : ad d8 cf LDA $cfd8 ; (sstack + 5)
35ab : 85 5e __ STA T7 + 1 
35ad : ad db cf LDA $cfdb ; (sstack + 8)
35b0 : 85 5b __ STA T6 + 0 
35b2 : 38 __ __ SEC
35b3 : e5 5d __ SBC T7 + 0 
35b5 : 85 5f __ STA T8 + 0 
35b7 : ad dc cf LDA $cfdc ; (sstack + 9)
35ba : 85 5c __ STA T6 + 1 
35bc : c8 __ __ INY
35bd : e5 5e __ SBC T7 + 1 
35bf : 85 60 __ STA T8 + 1 
35c1 : 30 07 __ BMI $35ca ; (bm_line.s5 + 0)
.s82:
35c3 : 05 5f __ ORA T8 + 0 
35c5 : f0 03 __ BEQ $35ca ; (bm_line.s5 + 0)
35c7 : 4c f9 38 JMP $38f9 ; (bm_line.s64 + 0)
.s5:
35ca : a5 5e __ LDA T7 + 1 
35cc : 10 03 __ BPL $35d1 ; (bm_line.s63 + 0)
35ce : 4c 46 37 JMP $3746 ; (bm_line.s3 + 0)
.s63:
35d1 : c5 44 __ CMP T0 + 1 
35d3 : d0 04 __ BNE $35d9 ; (bm_line.s62 + 0)
.s61:
35d5 : a5 5d __ LDA T7 + 0 
35d7 : c5 43 __ CMP T0 + 0 
.s62:
35d9 : 90 f3 __ BCC $35ce ; (bm_line.s5 + 4)
.s6:
35db : a5 5c __ LDA T6 + 1 
35dd : 10 03 __ BPL $35e2 ; (bm_line.s60 + 0)
35df : 4c a3 38 JMP $38a3 ; (bm_line.s52 + 0)
.s60:
35e2 : d1 59 __ CMP (T5 + 0),y 
35e4 : d0 04 __ BNE $35ea ; (bm_line.s59 + 0)
.s58:
35e6 : a5 5b __ LDA T6 + 0 
35e8 : c5 45 __ CMP T1 + 0 
.s59:
35ea : b0 e2 __ BCS $35ce ; (bm_line.s5 + 4)
.s7:
35ec : a5 5c __ LDA T6 + 1 
35ee : c5 44 __ CMP T0 + 1 
35f0 : d0 04 __ BNE $35f6 ; (bm_line.s57 + 0)
.s56:
35f2 : a5 5b __ LDA T6 + 0 
35f4 : c5 43 __ CMP T0 + 0 
.s57:
35f6 : 90 e7 __ BCC $35df ; (bm_line.s6 + 4)
.s8:
35f8 : a5 5e __ LDA T7 + 1 
35fa : d1 59 __ CMP (T5 + 0),y 
35fc : d0 04 __ BNE $3602 ; (bm_line.s54 + 0)
.s51:
35fe : a5 5d __ LDA T7 + 0 
3600 : c5 45 __ CMP T1 + 0 
.s54:
3602 : 90 4e __ BCC $3652 ; (bm_line.s9 + 0)
.s50:
3604 : a5 57 __ LDA T4 + 0 
3606 : 85 0f __ STA P2 
3608 : a5 58 __ LDA T4 + 1 
360a : 85 10 __ STA P3 
360c : a5 5f __ LDA T8 + 0 
360e : 85 11 __ STA P4 
3610 : a5 60 __ LDA T8 + 1 
3612 : 85 12 __ STA P5 
3614 : 18 __ __ CLC
3615 : a5 5d __ LDA T7 + 0 
3617 : 69 01 __ ADC #$01
3619 : a8 __ __ TAY
361a : a5 5e __ LDA T7 + 1 
361c : 69 00 __ ADC #$00
361e : aa __ __ TAX
361f : 98 __ __ TYA
3620 : 38 __ __ SEC
3621 : a0 04 __ LDY #$04
3623 : f1 59 __ SBC (T5 + 0),y 
3625 : 85 0d __ STA P0 
3627 : 8a __ __ TXA
3628 : c8 __ __ INY
3629 : f1 59 __ SBC (T5 + 0),y 
362b : 85 0e __ STA P1 
362d : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
3630 : 38 __ __ SEC
3631 : a5 55 __ LDA T3 + 0 
3633 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3635 : 8d d9 cf STA $cfd9 ; (sstack + 6)
3638 : a5 56 __ LDA T3 + 1 
363a : e5 1c __ SBC ACCU + 1 ; (clip + 1)
363c : 8d da cf STA $cfda ; (sstack + 7)
363f : a0 04 __ LDY #$04
3641 : b1 59 __ LDA (T5 + 0),y 
3643 : 38 __ __ SEC
3644 : e9 01 __ SBC #$01
3646 : aa __ __ TAX
3647 : c8 __ __ INY
3648 : b1 59 __ LDA (T5 + 0),y 
364a : 8e d7 cf STX $cfd7 ; (sstack + 4)
364d : e9 00 __ SBC #$00
364f : 8d d8 cf STA $cfd8 ; (sstack + 5)
.s9:
3652 : a0 02 __ LDY #$02
3654 : b1 59 __ LDA (T5 + 0),y 
3656 : 85 43 __ STA T0 + 0 
3658 : c8 __ __ INY
3659 : b1 59 __ LDA (T5 + 0),y 
365b : 85 44 __ STA T0 + 1 
365d : a0 06 __ LDY #$06
365f : b1 59 __ LDA (T5 + 0),y 
3661 : 85 45 __ STA T1 + 0 
3663 : c8 __ __ INY
3664 : a5 58 __ LDA T4 + 1 
3666 : 30 07 __ BMI $366f ; (bm_line.s10 + 0)
.s49:
3668 : 05 57 __ ORA T4 + 0 
366a : f0 03 __ BEQ $366f ; (bm_line.s10 + 0)
366c : 4c ab 37 JMP $37ab ; (bm_line.s30 + 0)
.s10:
366f : ad d9 cf LDA $cfd9 ; (sstack + 6)
3672 : 85 55 __ STA T3 + 0 
3674 : ad da cf LDA $cfda ; (sstack + 7)
3677 : 10 03 __ BPL $367c ; (bm_line.s29 + 0)
3679 : 4c 46 37 JMP $3746 ; (bm_line.s3 + 0)
.s29:
367c : 85 56 __ STA T3 + 1 
367e : c5 44 __ CMP T0 + 1 
3680 : d0 04 __ BNE $3686 ; (bm_line.s28 + 0)
.s27:
3682 : a5 55 __ LDA T3 + 0 
3684 : c5 43 __ CMP T0 + 0 
.s28:
3686 : 90 f1 __ BCC $3679 ; (bm_line.s10 + 10)
.s11:
3688 : ad de cf LDA $cfde ; (sstack + 11)
368b : 10 03 __ BPL $3690 ; (bm_line.s26 + 0)
368d : 4c 51 37 JMP $3751 ; (bm_line.s17 + 0)
.s26:
3690 : d1 59 __ CMP (T5 + 0),y 
3692 : d0 05 __ BNE $3699 ; (bm_line.s25 + 0)
.s24:
3694 : ad dd cf LDA $cfdd ; (sstack + 10)
3697 : c5 45 __ CMP T1 + 0 
.s25:
3699 : b0 de __ BCS $3679 ; (bm_line.s10 + 10)
.s12:
369b : ad de cf LDA $cfde ; (sstack + 11)
369e : 30 ed __ BMI $368d ; (bm_line.s11 + 5)
.s23:
36a0 : c5 44 __ CMP T0 + 1 
36a2 : d0 05 __ BNE $36a9 ; (bm_line.s22 + 0)
.s21:
36a4 : ad dd cf LDA $cfdd ; (sstack + 10)
36a7 : c5 43 __ CMP T0 + 0 
.s22:
36a9 : 90 e2 __ BCC $368d ; (bm_line.s11 + 5)
.s13:
36ab : a5 56 __ LDA T3 + 1 
36ad : d1 59 __ CMP (T5 + 0),y 
36af : d0 04 __ BNE $36b5 ; (bm_line.s19 + 0)
.s16:
36b1 : a5 55 __ LDA T3 + 0 
36b3 : c5 45 __ CMP T1 + 0 
.s19:
36b5 : 90 50 __ BCC $3707 ; (bm_line.s14 + 0)
.s15:
36b7 : a5 5f __ LDA T8 + 0 
36b9 : 85 0f __ STA P2 
36bb : a5 60 __ LDA T8 + 1 
36bd : 85 10 __ STA P3 
36bf : a5 57 __ LDA T4 + 0 
36c1 : 85 11 __ STA P4 
36c3 : a5 58 __ LDA T4 + 1 
36c5 : 85 12 __ STA P5 
36c7 : 18 __ __ CLC
36c8 : a5 55 __ LDA T3 + 0 
36ca : 69 01 __ ADC #$01
36cc : a8 __ __ TAY
36cd : a5 56 __ LDA T3 + 1 
36cf : 69 00 __ ADC #$00
36d1 : aa __ __ TAX
36d2 : 98 __ __ TYA
36d3 : 38 __ __ SEC
36d4 : a0 06 __ LDY #$06
36d6 : f1 59 __ SBC (T5 + 0),y 
36d8 : 85 0d __ STA P0 
36da : 8a __ __ TXA
36db : c8 __ __ INY
36dc : f1 59 __ SBC (T5 + 0),y 
36de : 85 0e __ STA P1 
36e0 : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
36e3 : ad d7 cf LDA $cfd7 ; (sstack + 4)
36e6 : 38 __ __ SEC
36e7 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
36e9 : 8d d7 cf STA $cfd7 ; (sstack + 4)
36ec : ad d8 cf LDA $cfd8 ; (sstack + 5)
36ef : e5 1c __ SBC ACCU + 1 ; (clip + 1)
36f1 : 8d d8 cf STA $cfd8 ; (sstack + 5)
36f4 : a0 06 __ LDY #$06
36f6 : b1 59 __ LDA (T5 + 0),y 
36f8 : 38 __ __ SEC
36f9 : e9 01 __ SBC #$01
36fb : aa __ __ TAX
36fc : c8 __ __ INY
36fd : b1 59 __ LDA (T5 + 0),y 
36ff : 8e d9 cf STX $cfd9 ; (sstack + 6)
3702 : e9 00 __ SBC #$00
3704 : 8d da cf STA $cfda ; (sstack + 7)
.s14:
3707 : ad d3 cf LDA $cfd3 ; (sstack + 0)
370a : 85 0d __ STA P0 
370c : ad d4 cf LDA $cfd4 ; (sstack + 1)
370f : 85 0e __ STA P1 
3711 : ad d7 cf LDA $cfd7 ; (sstack + 4)
3714 : 85 0f __ STA P2 
3716 : ad d8 cf LDA $cfd8 ; (sstack + 5)
3719 : 85 10 __ STA P3 
371b : ad d9 cf LDA $cfd9 ; (sstack + 6)
371e : 85 11 __ STA P4 
3720 : ad da cf LDA $cfda ; (sstack + 7)
3723 : 85 12 __ STA P5 
3725 : ad db cf LDA $cfdb ; (sstack + 8)
3728 : 85 13 __ STA P6 
372a : ad dc cf LDA $cfdc ; (sstack + 9)
372d : 85 14 __ STA P7 
372f : ad dd cf LDA $cfdd ; (sstack + 10)
3732 : 85 15 __ STA P8 
3734 : ad de cf LDA $cfde ; (sstack + 11)
3737 : 85 16 __ STA P9 
3739 : ad df cf LDA $cfdf ; (sstack + 12)
373c : 85 17 __ STA P10 
373e : ad e0 cf LDA $cfe0 ; (sstack + 13)
3741 : 85 18 __ STA P11 
3743 : 20 99 3a JSR $3a99 ; (bmu_line.s4 + 0)
.s3:
3746 : a2 0d __ LDX #$0d
3748 : bd c5 cf LDA $cfc5,x ; (bm_line@stack + 0)
374b : 95 53 __ STA T2 + 0,x 
374d : ca __ __ DEX
374e : 10 f8 __ BPL $3748 ; (bm_line.s3 + 2)
3750 : 60 __ __ RTS
.s17:
3751 : 38 __ __ SEC
3752 : a5 43 __ LDA T0 + 0 
3754 : ed dd cf SBC $cfdd ; (sstack + 10)
3757 : 85 0d __ STA P0 
3759 : a5 44 __ LDA T0 + 1 
375b : ed de cf SBC $cfde ; (sstack + 11)
375e : 85 0e __ STA P1 
3760 : a5 5f __ LDA T8 + 0 
3762 : 85 0f __ STA P2 
3764 : a5 60 __ LDA T8 + 1 
3766 : 85 10 __ STA P3 
3768 : a5 57 __ LDA T4 + 0 
376a : 85 11 __ STA P4 
376c : a5 58 __ LDA T4 + 1 
376e : 85 12 __ STA P5 
3770 : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
3773 : a0 02 __ LDY #$02
3775 : b1 59 __ LDA (T5 + 0),y 
3777 : 8d dd cf STA $cfdd ; (sstack + 10)
377a : c8 __ __ INY
377b : b1 59 __ LDA (T5 + 0),y 
377d : 8d de cf STA $cfde ; (sstack + 11)
3780 : ad db cf LDA $cfdb ; (sstack + 8)
3783 : 18 __ __ CLC
3784 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3786 : 8d db cf STA $cfdb ; (sstack + 8)
3789 : ad dc cf LDA $cfdc ; (sstack + 9)
378c : 65 1c __ ADC ACCU + 1 ; (clip + 1)
378e : 8d dc cf STA $cfdc ; (sstack + 9)
3791 : a0 07 __ LDY #$07
3793 : b1 59 __ LDA (T5 + 0),y 
3795 : 10 03 __ BPL $379a ; (bm_line.s20 + 0)
3797 : 4c b7 36 JMP $36b7 ; (bm_line.s15 + 0)
.s20:
379a : a5 56 __ LDA T3 + 1 
379c : d1 59 __ CMP (T5 + 0),y 
379e : f0 03 __ BEQ $37a3 ; (bm_line.s18 + 0)
37a0 : 4c b5 36 JMP $36b5 ; (bm_line.s19 + 0)
.s18:
37a3 : a5 55 __ LDA T3 + 0 
37a5 : 88 __ __ DEY
37a6 : d1 59 __ CMP (T5 + 0),y 
37a8 : 4c b5 36 JMP $36b5 ; (bm_line.s19 + 0)
.s30:
37ab : ad dd cf LDA $cfdd ; (sstack + 10)
37ae : 85 55 __ STA T3 + 0 
37b0 : ad de cf LDA $cfde ; (sstack + 11)
37b3 : 30 91 __ BMI $3746 ; (bm_line.s3 + 0)
.s48:
37b5 : 85 56 __ STA T3 + 1 
37b7 : c5 44 __ CMP T0 + 1 
37b9 : d0 04 __ BNE $37bf ; (bm_line.s47 + 0)
.s46:
37bb : a5 55 __ LDA T3 + 0 
37bd : c5 43 __ CMP T0 + 0 
.s47:
37bf : 90 85 __ BCC $3746 ; (bm_line.s3 + 0)
.s31:
37c1 : ad da cf LDA $cfda ; (sstack + 7)
37c4 : 10 03 __ BPL $37c9 ; (bm_line.s45 + 0)
37c6 : 4c 49 38 JMP $3849 ; (bm_line.s36 + 0)
.s45:
37c9 : d1 59 __ CMP (T5 + 0),y 
37cb : d0 05 __ BNE $37d2 ; (bm_line.s44 + 0)
.s43:
37cd : ad d9 cf LDA $cfd9 ; (sstack + 6)
37d0 : c5 45 __ CMP T1 + 0 
.s44:
37d2 : 90 03 __ BCC $37d7 ; (bm_line.s32 + 0)
37d4 : 4c 46 37 JMP $3746 ; (bm_line.s3 + 0)
.s32:
37d7 : ad da cf LDA $cfda ; (sstack + 7)
37da : 30 6d __ BMI $3849 ; (bm_line.s36 + 0)
.s42:
37dc : c5 44 __ CMP T0 + 1 
37de : d0 05 __ BNE $37e5 ; (bm_line.s41 + 0)
.s40:
37e0 : ad d9 cf LDA $cfd9 ; (sstack + 6)
37e3 : c5 43 __ CMP T0 + 0 
.s41:
37e5 : 90 62 __ BCC $3849 ; (bm_line.s36 + 0)
.s33:
37e7 : a5 56 __ LDA T3 + 1 
37e9 : d1 59 __ CMP (T5 + 0),y 
37eb : d0 04 __ BNE $37f1 ; (bm_line.s38 + 0)
.s35:
37ed : a5 55 __ LDA T3 + 0 
37ef : c5 45 __ CMP T1 + 0 
.s38:
37f1 : b0 03 __ BCS $37f6 ; (bm_line.s34 + 0)
37f3 : 4c 07 37 JMP $3707 ; (bm_line.s14 + 0)
.s34:
37f6 : a5 5f __ LDA T8 + 0 
37f8 : 85 0f __ STA P2 
37fa : a5 60 __ LDA T8 + 1 
37fc : 85 10 __ STA P3 
37fe : a5 57 __ LDA T4 + 0 
3800 : 85 11 __ STA P4 
3802 : a5 58 __ LDA T4 + 1 
3804 : 85 12 __ STA P5 
3806 : 18 __ __ CLC
3807 : a5 55 __ LDA T3 + 0 
3809 : 69 01 __ ADC #$01
380b : a8 __ __ TAY
380c : a5 56 __ LDA T3 + 1 
380e : 69 00 __ ADC #$00
3810 : aa __ __ TAX
3811 : 98 __ __ TYA
3812 : 38 __ __ SEC
3813 : a0 06 __ LDY #$06
3815 : f1 59 __ SBC (T5 + 0),y 
3817 : 85 0d __ STA P0 
3819 : 8a __ __ TXA
381a : c8 __ __ INY
381b : f1 59 __ SBC (T5 + 0),y 
381d : 85 0e __ STA P1 
381f : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
3822 : ad db cf LDA $cfdb ; (sstack + 8)
3825 : 38 __ __ SEC
3826 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3828 : 8d db cf STA $cfdb ; (sstack + 8)
382b : ad dc cf LDA $cfdc ; (sstack + 9)
382e : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3830 : 8d dc cf STA $cfdc ; (sstack + 9)
3833 : a0 06 __ LDY #$06
3835 : b1 59 __ LDA (T5 + 0),y 
3837 : 38 __ __ SEC
3838 : e9 01 __ SBC #$01
383a : aa __ __ TAX
383b : c8 __ __ INY
383c : b1 59 __ LDA (T5 + 0),y 
383e : 8e dd cf STX $cfdd ; (sstack + 10)
3841 : e9 00 __ SBC #$00
3843 : 8d de cf STA $cfde ; (sstack + 11)
3846 : 4c 07 37 JMP $3707 ; (bm_line.s14 + 0)
.s36:
3849 : 38 __ __ SEC
384a : a5 43 __ LDA T0 + 0 
384c : ed d9 cf SBC $cfd9 ; (sstack + 6)
384f : 85 0d __ STA P0 
3851 : a5 44 __ LDA T0 + 1 
3853 : ed da cf SBC $cfda ; (sstack + 7)
3856 : 85 0e __ STA P1 
3858 : a5 5f __ LDA T8 + 0 
385a : 85 0f __ STA P2 
385c : a5 60 __ LDA T8 + 1 
385e : 85 10 __ STA P3 
3860 : a5 57 __ LDA T4 + 0 
3862 : 85 11 __ STA P4 
3864 : a5 58 __ LDA T4 + 1 
3866 : 85 12 __ STA P5 
3868 : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
386b : a0 02 __ LDY #$02
386d : b1 59 __ LDA (T5 + 0),y 
386f : 8d d9 cf STA $cfd9 ; (sstack + 6)
3872 : c8 __ __ INY
3873 : b1 59 __ LDA (T5 + 0),y 
3875 : 8d da cf STA $cfda ; (sstack + 7)
3878 : ad d7 cf LDA $cfd7 ; (sstack + 4)
387b : 18 __ __ CLC
387c : 65 1b __ ADC ACCU + 0 ; (clip + 0)
387e : 8d d7 cf STA $cfd7 ; (sstack + 4)
3881 : ad d8 cf LDA $cfd8 ; (sstack + 5)
3884 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3886 : 8d d8 cf STA $cfd8 ; (sstack + 5)
3889 : a0 07 __ LDY #$07
388b : b1 59 __ LDA (T5 + 0),y 
388d : 10 03 __ BPL $3892 ; (bm_line.s39 + 0)
388f : 4c f6 37 JMP $37f6 ; (bm_line.s34 + 0)
.s39:
3892 : a5 56 __ LDA T3 + 1 
3894 : d1 59 __ CMP (T5 + 0),y 
3896 : f0 03 __ BEQ $389b ; (bm_line.s37 + 0)
3898 : 4c f1 37 JMP $37f1 ; (bm_line.s38 + 0)
.s37:
389b : a5 55 __ LDA T3 + 0 
389d : 88 __ __ DEY
389e : d1 59 __ CMP (T5 + 0),y 
38a0 : 4c f1 37 JMP $37f1 ; (bm_line.s38 + 0)
.s52:
38a3 : 38 __ __ SEC
38a4 : a5 43 __ LDA T0 + 0 
38a6 : e5 5b __ SBC T6 + 0 
38a8 : 85 0d __ STA P0 
38aa : a5 44 __ LDA T0 + 1 
38ac : e5 5c __ SBC T6 + 1 
38ae : 85 0e __ STA P1 
38b0 : a5 57 __ LDA T4 + 0 
38b2 : 85 0f __ STA P2 
38b4 : a5 58 __ LDA T4 + 1 
38b6 : 85 10 __ STA P3 
38b8 : a5 5f __ LDA T8 + 0 
38ba : 85 11 __ STA P4 
38bc : a5 60 __ LDA T8 + 1 
38be : 85 12 __ STA P5 
38c0 : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
38c3 : 18 __ __ CLC
38c4 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
38c6 : 65 53 __ ADC T2 + 0 
38c8 : 8d dd cf STA $cfdd ; (sstack + 10)
38cb : a5 1c __ LDA ACCU + 1 ; (clip + 1)
38cd : 65 54 __ ADC T2 + 1 
38cf : 8d de cf STA $cfde ; (sstack + 11)
38d2 : a0 00 __ LDY #$00
38d4 : b1 59 __ LDA (T5 + 0),y 
38d6 : 8d db cf STA $cfdb ; (sstack + 8)
38d9 : c8 __ __ INY
38da : b1 59 __ LDA (T5 + 0),y 
38dc : 8d dc cf STA $cfdc ; (sstack + 9)
38df : a0 05 __ LDY #$05
38e1 : b1 59 __ LDA (T5 + 0),y 
38e3 : 10 03 __ BPL $38e8 ; (bm_line.s55 + 0)
38e5 : 4c 04 36 JMP $3604 ; (bm_line.s50 + 0)
.s55:
38e8 : a5 5e __ LDA T7 + 1 
38ea : d1 59 __ CMP (T5 + 0),y 
38ec : f0 03 __ BEQ $38f1 ; (bm_line.s53 + 0)
38ee : 4c 02 36 JMP $3602 ; (bm_line.s54 + 0)
.s53:
38f1 : a5 5d __ LDA T7 + 0 
38f3 : 88 __ __ DEY
38f4 : d1 59 __ CMP (T5 + 0),y 
38f6 : 4c 02 36 JMP $3602 ; (bm_line.s54 + 0)
.s64:
38f9 : a5 5c __ LDA T6 + 1 
38fb : 10 03 __ BPL $3900 ; (bm_line.s81 + 0)
38fd : 4c 46 37 JMP $3746 ; (bm_line.s3 + 0)
.s81:
3900 : c5 44 __ CMP T0 + 1 
3902 : d0 04 __ BNE $3908 ; (bm_line.s80 + 0)
.s79:
3904 : a5 5b __ LDA T6 + 0 
3906 : c5 43 __ CMP T0 + 0 
.s80:
3908 : 90 f3 __ BCC $38fd ; (bm_line.s64 + 4)
.s65:
390a : a5 5e __ LDA T7 + 1 
390c : 30 76 __ BMI $3984 ; (bm_line.s70 + 0)
.s78:
390e : d1 59 __ CMP (T5 + 0),y 
3910 : d0 04 __ BNE $3916 ; (bm_line.s77 + 0)
.s76:
3912 : a5 5d __ LDA T7 + 0 
3914 : c5 45 __ CMP T1 + 0 
.s77:
3916 : b0 e5 __ BCS $38fd ; (bm_line.s64 + 4)
.s66:
3918 : a5 5e __ LDA T7 + 1 
391a : c5 44 __ CMP T0 + 1 
391c : d0 04 __ BNE $3922 ; (bm_line.s75 + 0)
.s74:
391e : a5 5d __ LDA T7 + 0 
3920 : c5 43 __ CMP T0 + 0 
.s75:
3922 : 90 60 __ BCC $3984 ; (bm_line.s70 + 0)
.s67:
3924 : a5 5c __ LDA T6 + 1 
3926 : d1 59 __ CMP (T5 + 0),y 
3928 : d0 04 __ BNE $392e ; (bm_line.s72 + 0)
.s69:
392a : a5 5b __ LDA T6 + 0 
392c : c5 45 __ CMP T1 + 0 
.s72:
392e : b0 03 __ BCS $3933 ; (bm_line.s68 + 0)
3930 : 4c 52 36 JMP $3652 ; (bm_line.s9 + 0)
.s68:
3933 : a5 57 __ LDA T4 + 0 
3935 : 85 0f __ STA P2 
3937 : a5 58 __ LDA T4 + 1 
3939 : 85 10 __ STA P3 
393b : a5 5f __ LDA T8 + 0 
393d : 85 11 __ STA P4 
393f : a5 60 __ LDA T8 + 1 
3941 : 85 12 __ STA P5 
3943 : 18 __ __ CLC
3944 : a5 5b __ LDA T6 + 0 
3946 : 69 01 __ ADC #$01
3948 : a8 __ __ TAY
3949 : a5 5c __ LDA T6 + 1 
394b : 69 00 __ ADC #$00
394d : aa __ __ TAX
394e : 98 __ __ TYA
394f : 38 __ __ SEC
3950 : a0 04 __ LDY #$04
3952 : f1 59 __ SBC (T5 + 0),y 
3954 : 85 0d __ STA P0 
3956 : 8a __ __ TXA
3957 : c8 __ __ INY
3958 : f1 59 __ SBC (T5 + 0),y 
395a : 85 0e __ STA P1 
395c : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
395f : 38 __ __ SEC
3960 : a5 53 __ LDA T2 + 0 
3962 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3964 : 8d dd cf STA $cfdd ; (sstack + 10)
3967 : a5 54 __ LDA T2 + 1 
3969 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
396b : 8d de cf STA $cfde ; (sstack + 11)
396e : a0 04 __ LDY #$04
3970 : b1 59 __ LDA (T5 + 0),y 
3972 : 38 __ __ SEC
3973 : e9 01 __ SBC #$01
3975 : aa __ __ TAX
3976 : c8 __ __ INY
3977 : b1 59 __ LDA (T5 + 0),y 
3979 : 8e db cf STX $cfdb ; (sstack + 8)
397c : e9 00 __ SBC #$00
397e : 8d dc cf STA $cfdc ; (sstack + 9)
3981 : 4c 52 36 JMP $3652 ; (bm_line.s9 + 0)
.s70:
3984 : 38 __ __ SEC
3985 : a5 43 __ LDA T0 + 0 
3987 : e5 5d __ SBC T7 + 0 
3989 : 85 0d __ STA P0 
398b : a5 44 __ LDA T0 + 1 
398d : e5 5e __ SBC T7 + 1 
398f : 85 0e __ STA P1 
3991 : a5 57 __ LDA T4 + 0 
3993 : 85 0f __ STA P2 
3995 : a5 58 __ LDA T4 + 1 
3997 : 85 10 __ STA P3 
3999 : a5 5f __ LDA T8 + 0 
399b : 85 11 __ STA P4 
399d : a5 60 __ LDA T8 + 1 
399f : 85 12 __ STA P5 
39a1 : 20 da 39 JSR $39da ; (lmuldiv16s.s4 + 0)
39a4 : 18 __ __ CLC
39a5 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
39a7 : 65 55 __ ADC T3 + 0 
39a9 : 8d d9 cf STA $cfd9 ; (sstack + 6)
39ac : a5 1c __ LDA ACCU + 1 ; (clip + 1)
39ae : 65 56 __ ADC T3 + 1 
39b0 : 8d da cf STA $cfda ; (sstack + 7)
39b3 : a0 00 __ LDY #$00
39b5 : b1 59 __ LDA (T5 + 0),y 
39b7 : 8d d7 cf STA $cfd7 ; (sstack + 4)
39ba : c8 __ __ INY
39bb : b1 59 __ LDA (T5 + 0),y 
39bd : 8d d8 cf STA $cfd8 ; (sstack + 5)
39c0 : a0 05 __ LDY #$05
39c2 : b1 59 __ LDA (T5 + 0),y 
39c4 : 10 03 __ BPL $39c9 ; (bm_line.s73 + 0)
39c6 : 4c 33 39 JMP $3933 ; (bm_line.s68 + 0)
.s73:
39c9 : a5 5c __ LDA T6 + 1 
39cb : d1 59 __ CMP (T5 + 0),y 
39cd : f0 03 __ BEQ $39d2 ; (bm_line.s71 + 0)
39cf : 4c 2e 39 JMP $392e ; (bm_line.s72 + 0)
.s71:
39d2 : a5 5b __ LDA T6 + 0 
39d4 : 88 __ __ DEY
39d5 : d1 59 __ CMP (T5 + 0),y 
39d7 : 4c 2e 39 JMP $392e ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "D:/Arbeit/dev/oscar64/include/fixmath.h"
.s4:
39da : a9 00 __ LDA #$00
39dc : 24 0e __ BIT P1 ; (a + 1)
39de : 10 0d __ BPL $39ed ; (lmuldiv16s.s5 + 0)
.s10:
39e0 : 38 __ __ SEC
39e1 : e5 0d __ SBC P0 ; (a + 0)
39e3 : 85 0d __ STA P0 ; (a + 0)
39e5 : a9 00 __ LDA #$00
39e7 : e5 0e __ SBC P1 ; (a + 1)
39e9 : 85 0e __ STA P1 ; (a + 1)
39eb : a9 01 __ LDA #$01
.s5:
39ed : 85 43 __ STA T1 + 0 
39ef : 24 10 __ BIT P3 ; (b + 1)
39f1 : 10 14 __ BPL $3a07 ; (lmuldiv16s.s6 + 0)
.s9:
39f3 : 38 __ __ SEC
39f4 : a9 00 __ LDA #$00
39f6 : e5 0f __ SBC P2 ; (b + 0)
39f8 : 85 0f __ STA P2 ; (b + 0)
39fa : a9 00 __ LDA #$00
39fc : e5 10 __ SBC P3 ; (b + 1)
39fe : 85 10 __ STA P3 ; (b + 1)
3a00 : a9 00 __ LDA #$00
3a02 : c5 43 __ CMP T1 + 0 
3a04 : 2a __ __ ROL
3a05 : 85 43 __ STA T1 + 0 
.s6:
3a07 : 24 12 __ BIT P5 ; (c + 1)
3a09 : 10 14 __ BPL $3a1f ; (lmuldiv16s.s7 + 0)
.s8:
3a0b : 38 __ __ SEC
3a0c : a9 00 __ LDA #$00
3a0e : e5 11 __ SBC P4 ; (c + 0)
3a10 : 85 11 __ STA P4 ; (c + 0)
3a12 : a9 00 __ LDA #$00
3a14 : e5 12 __ SBC P5 ; (c + 1)
3a16 : 85 12 __ STA P5 ; (c + 1)
3a18 : a9 00 __ LDA #$00
3a1a : c5 43 __ CMP T1 + 0 
3a1c : 2a __ __ ROL
3a1d : 85 43 __ STA T1 + 0 
.s7:
3a1f : a9 00 __ LDA #$00
3a21 : 85 05 __ STA WORK + 2 
3a23 : 85 06 __ STA WORK + 3 
3a25 : a5 0d __ LDA P0 ; (a + 0)
3a27 : 38 __ __ SEC
3a28 : a0 08 __ LDY #$08
3a2a : 6a __ __ ROR
3a2b : 90 0f __ BCC $3a3c ; (lmuldiv16s.s7 + 29)
3a2d : aa __ __ TAX
3a2e : 18 __ __ CLC
3a2f : a5 05 __ LDA WORK + 2 
3a31 : 65 0f __ ADC P2 ; (b + 0)
3a33 : 85 05 __ STA WORK + 2 
3a35 : a5 06 __ LDA WORK + 3 
3a37 : 65 10 __ ADC P3 ; (b + 1)
3a39 : 85 06 __ STA WORK + 3 
3a3b : 8a __ __ TXA
3a3c : 66 06 __ ROR WORK + 3 
3a3e : 66 05 __ ROR WORK + 2 
3a40 : 88 __ __ DEY
3a41 : d0 e7 __ BNE $3a2a ; (lmuldiv16s.s7 + 11)
3a43 : 6a __ __ ROR
3a44 : 90 07 __ BCC $3a4d ; (lmuldiv16s.s7 + 46)
3a46 : 85 03 __ STA WORK + 0 
3a48 : a5 0e __ LDA P1 ; (a + 1)
3a4a : 18 __ __ CLC
3a4b : 90 db __ BCC $3a28 ; (lmuldiv16s.s7 + 9)
3a4d : 38 __ __ SEC
3a4e : 85 04 __ STA WORK + 1 
3a50 : a2 08 __ LDX #$08
3a52 : 26 04 __ ROL WORK + 1 
3a54 : 26 05 __ ROL WORK + 2 
3a56 : 26 06 __ ROL WORK + 3 
3a58 : 90 0c __ BCC $3a66 ; (lmuldiv16s.s7 + 71)
3a5a : a5 05 __ LDA WORK + 2 
3a5c : e5 11 __ SBC P4 ; (c + 0)
3a5e : a8 __ __ TAY
3a5f : a5 06 __ LDA WORK + 3 
3a61 : e5 12 __ SBC P5 ; (c + 1)
3a63 : 38 __ __ SEC
3a64 : b0 0c __ BCS $3a72 ; (lmuldiv16s.s7 + 83)
3a66 : 38 __ __ SEC
3a67 : a5 05 __ LDA WORK + 2 
3a69 : e5 11 __ SBC P4 ; (c + 0)
3a6b : a8 __ __ TAY
3a6c : a5 06 __ LDA WORK + 3 
3a6e : e5 12 __ SBC P5 ; (c + 1)
3a70 : 90 04 __ BCC $3a76 ; (lmuldiv16s.s7 + 87)
3a72 : 85 06 __ STA WORK + 3 
3a74 : 84 05 __ STY WORK + 2 
3a76 : ca __ __ DEX
3a77 : d0 d9 __ BNE $3a52 ; (lmuldiv16s.s7 + 51)
3a79 : a5 04 __ LDA WORK + 1 
3a7b : 2a __ __ ROL
3a7c : 90 07 __ BCC $3a85 ; (lmuldiv16s.s7 + 102)
3a7e : 85 1c __ STA ACCU + 1 
3a80 : a5 03 __ LDA WORK + 0 
3a82 : 18 __ __ CLC
3a83 : 90 c9 __ BCC $3a4e ; (lmuldiv16s.s7 + 47)
3a85 : 85 1b __ STA ACCU + 0 
3a87 : a5 43 __ LDA T1 + 0 
3a89 : f0 0d __ BEQ $3a98 ; (lmuldiv16s.s3 + 0)
3a8b : 38 __ __ SEC
3a8c : a9 00 __ LDA #$00
3a8e : e5 1b __ SBC ACCU + 0 
3a90 : 85 1b __ STA ACCU + 0 
3a92 : a9 00 __ LDA #$00
3a94 : e5 1c __ SBC ACCU + 1 
3a96 : 85 1c __ STA ACCU + 1 
.s3:
3a98 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "D:/Arbeit/dev/oscar64/include/gfx/bitmap.h"
.s4:
3a99 : a5 17 __ LDA P10 ; (pattern + 0)
3a9b : f0 03 __ BEQ $3aa0 ; (bmu_line.s5 + 0)
3a9d : 4c 95 3f JMP $3f95 ; (bmu_line.s59 + 0)
.s5:
3aa0 : a5 18 __ LDA P11 ; (op + 0)
3aa2 : f0 01 __ BEQ $3aa5 ; (bmu_line.s6 + 0)
3aa4 : 60 __ __ RTS
.s6:
3aa5 : c6 17 __ DEC P10 ; (pattern + 0)
3aa7 : a9 02 __ LDA #$02
.s63:
3aa9 : 85 18 __ STA P11 ; (op + 0)
.s7:
3aab : 38 __ __ SEC
3aac : a5 13 __ LDA P6 ; (x1 + 0)
3aae : e5 0f __ SBC P2 ; (x0 + 0)
3ab0 : 85 46 __ STA T2 + 0 
3ab2 : a5 14 __ LDA P7 ; (x1 + 1)
3ab4 : e5 10 __ SBC P3 ; (x0 + 1)
3ab6 : 85 47 __ STA T2 + 1 
3ab8 : 10 11 __ BPL $3acb ; (bmu_line.s8 + 0)
.s58:
3aba : 38 __ __ SEC
3abb : a9 00 __ LDA #$00
3abd : e5 46 __ SBC T2 + 0 
3abf : 85 46 __ STA T2 + 0 
3ac1 : a9 00 __ LDA #$00
3ac3 : e5 47 __ SBC T2 + 1 
3ac5 : 85 47 __ STA T2 + 1 
3ac7 : a9 01 __ LDA #$01
3ac9 : d0 02 __ BNE $3acd ; (bmu_line.s9 + 0)
.s8:
3acb : a9 00 __ LDA #$00
.s9:
3acd : 85 51 __ STA T10 + 0 
3acf : 38 __ __ SEC
3ad0 : a5 15 __ LDA P8 ; (y1 + 0)
3ad2 : e5 11 __ SBC P4 ; (y0 + 0)
3ad4 : 85 43 __ STA T0 + 0 
3ad6 : a5 16 __ LDA P9 ; (y1 + 1)
3ad8 : e5 12 __ SBC P5 ; (y0 + 1)
3ada : 85 44 __ STA T0 + 1 
3adc : 10 11 __ BPL $3aef ; (bmu_line.s10 + 0)
.s57:
3ade : 38 __ __ SEC
3adf : a9 00 __ LDA #$00
3ae1 : e5 43 __ SBC T0 + 0 
3ae3 : 85 43 __ STA T0 + 0 
3ae5 : a9 00 __ LDA #$00
3ae7 : e5 44 __ SBC T0 + 1 
3ae9 : 85 44 __ STA T0 + 1 
3aeb : a9 01 __ LDA #$01
3aed : d0 02 __ BNE $3af1 ; (bmu_line.s11 + 0)
.s10:
3aef : a9 00 __ LDA #$00
.s11:
3af1 : 85 52 __ STA T11 + 0 
3af3 : a5 44 __ LDA T0 + 1 
3af5 : c5 47 __ CMP T2 + 1 
3af7 : d0 04 __ BNE $3afd ; (bmu_line.s56 + 0)
.s55:
3af9 : a5 43 __ LDA T0 + 0 
3afb : c5 46 __ CMP T2 + 0 
.s56:
3afd : b0 06 __ BCS $3b05 ; (bmu_line.s12 + 0)
.s54:
3aff : a5 47 __ LDA T2 + 1 
3b01 : a6 46 __ LDX T2 + 0 
3b03 : 90 04 __ BCC $3b09 ; (bmu_line.s13 + 0)
.s12:
3b05 : a5 44 __ LDA T0 + 1 
3b07 : a6 43 __ LDX T0 + 0 
.s13:
3b09 : 86 49 __ STX T4 + 0 
3b0b : 85 4a __ STA T4 + 1 
3b0d : 38 __ __ SEC
3b0e : a5 43 __ LDA T0 + 0 
3b10 : e5 46 __ SBC T2 + 0 
3b12 : 85 4b __ STA T5 + 0 
3b14 : a5 44 __ LDA T0 + 1 
3b16 : e5 47 __ SBC T2 + 1 
3b18 : 85 4c __ STA T5 + 1 
3b1a : a5 4b __ LDA T5 + 0 
3b1c : 4a __ __ LSR
3b1d : b0 0c __ BCS $3b2b ; (bmu_line.s53 + 0)
.s14:
3b1f : a5 4c __ LDA T5 + 1 
3b21 : c9 80 __ CMP #$80
3b23 : 6a __ __ ROR
3b24 : 85 4c __ STA T5 + 1 
3b26 : 66 4b __ ROR T5 + 0 
3b28 : 4c 33 3b JMP $3b33 ; (bmu_line.s15 + 0)
.s53:
3b2b : 06 43 __ ASL T0 + 0 
3b2d : 26 44 __ ROL T0 + 1 
3b2f : 06 46 __ ASL T2 + 0 
3b31 : 26 47 __ ROL T2 + 1 
.s15:
3b33 : a0 00 __ LDY #$00
3b35 : b1 0d __ LDA (P0),y ; (bm + 0)
3b37 : 85 4d __ STA T7 + 0 
3b39 : c8 __ __ INY
3b3a : b1 0d __ LDA (P0),y ; (bm + 0)
3b3c : 85 4e __ STA T7 + 1 
3b3e : a0 04 __ LDY #$04
3b40 : b1 0d __ LDA (P0),y ; (bm + 0)
3b42 : aa __ __ TAX
3b43 : 0a __ __ ASL
3b44 : 85 4f __ STA T8 + 0 
3b46 : a9 a0 __ LDA #$a0
3b48 : 8d 00 4f STA $4f00 ; (BLIT_CODE[0] + 0)
3b4b : a9 a2 __ LDA #$a2
3b4d : 8d 02 4f STA $4f02 ; (BLIT_CODE[0] + 2)
3b50 : a9 a5 __ LDA #$a5
3b52 : 8d 04 4f STA $4f04 ; (BLIT_CODE[0] + 4)
3b55 : a9 0a __ LDA #$0a
3b57 : 8d 05 4f STA $4f05 ; (BLIT_CODE[0] + 5)
3b5a : a9 00 __ LDA #$00
3b5c : 2a __ __ ROL
3b5d : 06 4f __ ASL T8 + 0 
3b5f : 2a __ __ ROL
3b60 : 06 4f __ ASL T8 + 0 
3b62 : 2a __ __ ROL
3b63 : 85 50 __ STA T8 + 1 
3b65 : a5 52 __ LDA T11 + 0 
3b67 : f0 0d __ BEQ $3b76 ; (bmu_line.s16 + 0)
.s52:
3b69 : 38 __ __ SEC
3b6a : a9 00 __ LDA #$00
3b6c : e5 4f __ SBC T8 + 0 
3b6e : 85 4f __ STA T8 + 0 
3b70 : a9 00 __ LDA #$00
3b72 : e5 50 __ SBC T8 + 1 
3b74 : 85 50 __ STA T8 + 1 
.s16:
3b76 : a5 11 __ LDA P4 ; (y0 + 0)
3b78 : 29 f8 __ AND #$f8
3b7a : 85 1b __ STA ACCU + 0 
3b7c : a5 12 __ LDA P5 ; (y0 + 1)
3b7e : 85 1c __ STA ACCU + 1 
3b80 : 8a __ __ TXA
3b81 : 20 ff 45 JSR $45ff ; (mul16by8 + 0)
3b84 : 18 __ __ CLC
3b85 : a5 4d __ LDA T7 + 0 
3b87 : 65 1b __ ADC ACCU + 0 
3b89 : 85 4d __ STA T7 + 0 
3b8b : a5 4e __ LDA T7 + 1 
3b8d : 65 1c __ ADC ACCU + 1 
3b8f : aa __ __ TAX
3b90 : a5 0f __ LDA P2 ; (x0 + 0)
3b92 : 29 f8 __ AND #$f8
3b94 : 18 __ __ CLC
3b95 : 65 4d __ ADC T7 + 0 
3b97 : 85 4d __ STA T7 + 0 
3b99 : 8a __ __ TXA
3b9a : 65 10 __ ADC P3 ; (x0 + 1)
3b9c : 85 4e __ STA T7 + 1 
3b9e : a5 46 __ LDA T2 + 0 
3ba0 : 05 43 __ ORA T0 + 0 
3ba2 : 29 80 __ AND #$80
3ba4 : 85 1b __ STA ACCU + 0 
3ba6 : a5 47 __ LDA T2 + 1 
3ba8 : 05 44 __ ORA T0 + 1 
3baa : 05 1b __ ORA ACCU + 0 
3bac : f0 02 __ BEQ $3bb0 ; (bmu_line.s67 + 0)
.s66:
3bae : a9 01 __ LDA #$01
.s67:
3bb0 : 85 1b __ STA ACCU + 0 
3bb2 : a5 11 __ LDA P4 ; (y0 + 0)
3bb4 : 29 07 __ AND #$07
3bb6 : 8d 01 4f STA $4f01 ; (BLIT_CODE[0] + 1)
3bb9 : a6 49 __ LDX T4 + 0 
3bbb : e8 __ __ INX
3bbc : 8e 03 4f STX $4f03 ; (BLIT_CODE[0] + 3)
3bbf : a5 0f __ LDA P2 ; (x0 + 0)
3bc1 : 29 07 __ AND #$07
3bc3 : aa __ __ TAX
3bc4 : bd e7 4d LDA $4de7,x ; (bitshift[0] + 32)
3bc7 : 85 48 __ STA T3 + 0 
3bc9 : a5 18 __ LDA P11 ; (op + 0)
3bcb : a2 06 __ LDX #$06
3bcd : c9 02 __ CMP #$02
3bcf : d0 03 __ BNE $3bd4 ; (bmu_line.s17 + 0)
3bd1 : 4c 51 3f JMP $3f51 ; (bmu_line.s49 + 0)
.s17:
3bd4 : 86 45 __ STX T1 + 0 
3bd6 : b0 03 __ BCS $3bdb ; (bmu_line.s18 + 0)
3bd8 : 4c db 3e JMP $3edb ; (bmu_line.s44 + 0)
.s18:
3bdb : c9 03 __ CMP #$03
3bdd : d0 3d __ BNE $3c1c ; (bmu_line.s19 + 0)
.s40:
3bdf : a6 17 __ LDX P10 ; (pattern + 0)
3be1 : e8 __ __ INX
3be2 : f0 1e __ BEQ $3c02 ; (bmu_line.s41 + 0)
.s43:
3be4 : a9 06 __ LDA #$06
3be6 : 8d 06 4f STA $4f06 ; (BLIT_CODE[0] + 6)
3be9 : 8d 09 4f STA $4f09 ; (BLIT_CODE[0] + 9)
3bec : a9 07 __ LDA #$07
3bee : 8d 07 4f STA $4f07 ; (BLIT_CODE[0] + 7)
3bf1 : 8d 0b 4f STA $4f0b ; (BLIT_CODE[0] + 11)
3bf4 : a9 90 __ LDA #$90
3bf6 : 8d 08 4f STA $4f08 ; (BLIT_CODE[0] + 8)
3bf9 : a9 e6 __ LDA #$e6
3bfb : 8d 0a 4f STA $4f0a ; (BLIT_CODE[0] + 10)
3bfe : a9 0c __ LDA #$0c
3c00 : 85 45 __ STA T1 + 0 
.s41:
3c02 : a9 51 __ LDA #$51
.s42:
3c04 : a6 45 __ LDX T1 + 0 
3c06 : 9d 00 4f STA $4f00,x ; (BLIT_CODE[0] + 0)
3c09 : a9 03 __ LDA #$03
3c0b : 9d 01 4f STA $4f01,x ; (BLIT_CODE[0] + 1)
3c0e : 9d 03 4f STA $4f03,x ; (BLIT_CODE[0] + 3)
3c11 : a9 91 __ LDA #$91
3c13 : 9d 02 4f STA $4f02,x ; (BLIT_CODE[0] + 2)
3c16 : 8a __ __ TXA
3c17 : 18 __ __ CLC
3c18 : 69 04 __ ADC #$04
.s64:
3c1a : 85 45 __ STA T1 + 0 
.s19:
3c1c : a5 43 __ LDA T0 + 0 
3c1e : 05 44 __ ORA T0 + 1 
3c20 : f0 03 __ BEQ $3c25 ; (bmu_line.s20 + 0)
3c22 : 4c f8 3c JMP $3cf8 ; (bmu_line.s28 + 0)
.s20:
3c25 : a5 46 __ LDA T2 + 0 
3c27 : 05 47 __ ORA T2 + 1 
3c29 : f0 75 __ BEQ $3ca0 ; (bmu_line.s21 + 0)
.s22:
3c2b : a9 0a __ LDA #$0a
3c2d : a6 45 __ LDX T1 + 0 
3c2f : 9d 01 4f STA $4f01,x ; (BLIT_CODE[0] + 1)
3c32 : 9d 05 4f STA $4f05,x ; (BLIT_CODE[0] + 5)
3c35 : a9 90 __ LDA #$90
3c37 : 9d 02 4f STA $4f02,x ; (BLIT_CODE[0] + 2)
3c3a : a9 0c __ LDA #$0c
3c3c : 9d 03 4f STA $4f03,x ; (BLIT_CODE[0] + 3)
3c3f : a9 a5 __ LDA #$a5
3c41 : 9d 06 4f STA $4f06,x ; (BLIT_CODE[0] + 6)
3c44 : a9 03 __ LDA #$03
3c46 : 9d 07 4f STA $4f07,x ; (BLIT_CODE[0] + 7)
3c49 : a9 69 __ LDA #$69
3c4b : 9d 08 4f STA $4f08,x ; (BLIT_CODE[0] + 8)
3c4e : a5 51 __ LDA T10 + 0 
3c50 : f0 09 __ BEQ $3c5b ; (bmu_line.s23 + 0)
.s27:
3c52 : a9 06 __ LDA #$06
3c54 : 9d 00 4f STA $4f00,x ; (BLIT_CODE[0] + 0)
3c57 : a9 26 __ LDA #$26
3c59 : d0 07 __ BNE $3c62 ; (bmu_line.s62 + 0)
.s23:
3c5b : a9 46 __ LDA #$46
3c5d : 9d 00 4f STA $4f00,x ; (BLIT_CODE[0] + 0)
3c60 : a9 66 __ LDA #$66
.s62:
3c62 : 9d 04 4f STA $4f04,x ; (BLIT_CODE[0] + 4)
3c65 : a9 02 __ LDA #$02
3c67 : 9d 0b 4f STA $4f0b,x ; (BLIT_CODE[0] + 11)
3c6a : a5 51 __ LDA T10 + 0 
3c6c : f0 0e __ BEQ $3c7c ; (bmu_line.s24 + 0)
.s26:
3c6e : a9 f8 __ LDA #$f8
3c70 : 9d 09 4f STA $4f09,x ; (BLIT_CODE[0] + 9)
3c73 : a9 b0 __ LDA #$b0
3c75 : 9d 0a 4f STA $4f0a,x ; (BLIT_CODE[0] + 10)
3c78 : a9 c6 __ LDA #$c6
3c7a : d0 0c __ BNE $3c88 ; (bmu_line.s25 + 0)
.s24:
3c7c : a9 08 __ LDA #$08
3c7e : 9d 09 4f STA $4f09,x ; (BLIT_CODE[0] + 9)
3c81 : a9 90 __ LDA #$90
3c83 : 9d 0a 4f STA $4f0a,x ; (BLIT_CODE[0] + 10)
3c86 : a9 e6 __ LDA #$e6
.s25:
3c88 : 9d 0c 4f STA $4f0c,x ; (BLIT_CODE[0] + 12)
3c8b : a9 04 __ LDA #$04
3c8d : 9d 0d 4f STA $4f0d,x ; (BLIT_CODE[0] + 13)
3c90 : a9 85 __ LDA #$85
3c92 : 9d 0e 4f STA $4f0e,x ; (BLIT_CODE[0] + 14)
3c95 : a9 03 __ LDA #$03
3c97 : 9d 0f 4f STA $4f0f,x ; (BLIT_CODE[0] + 15)
3c9a : 8a __ __ TXA
3c9b : 18 __ __ CLC
3c9c : 69 10 __ ADC #$10
3c9e : 85 45 __ STA T1 + 0 
.s21:
3ca0 : a9 ca __ LDA #$ca
3ca2 : a6 45 __ LDX T1 + 0 
3ca4 : 86 43 __ STX T0 + 0 
3ca6 : 9d 00 4f STA $4f00,x ; (BLIT_CODE[0] + 0)
3ca9 : a9 d0 __ LDA #$d0
3cab : 9d 01 4f STA $4f01,x ; (BLIT_CODE[0] + 1)
3cae : a9 c6 __ LDA #$c6
3cb0 : 9d 03 4f STA $4f03,x ; (BLIT_CODE[0] + 3)
3cb3 : a9 0b __ LDA #$0b
3cb5 : 9d 04 4f STA $4f04,x ; (BLIT_CODE[0] + 4)
3cb8 : a9 10 __ LDA #$10
3cba : 9d 05 4f STA $4f05,x ; (BLIT_CODE[0] + 5)
3cbd : a9 60 __ LDA #$60
3cbf : 9d 07 4f STA $4f07,x ; (BLIT_CODE[0] + 7)
3cc2 : e6 43 __ INC T0 + 0 
3cc4 : 38 __ __ SEC
3cc5 : a9 02 __ LDA #$02
3cc7 : e5 43 __ SBC T0 + 0 
3cc9 : 9d 02 4f STA $4f02,x ; (BLIT_CODE[0] + 2)
3ccc : 38 __ __ SEC
3ccd : a9 fe __ LDA #$fe
3ccf : e5 43 __ SBC T0 + 0 
3cd1 : 9d 06 4f STA $4f06,x ; (BLIT_CODE[0] + 6)
3cd4 : a5 4a __ LDA T4 + 1 
3cd6 : 85 49 __ STA T4 + 0 
3cd8 : a5 4d __ LDA T7 + 0 
3cda : 85 03 __ STA WORK + 0 
3cdc : a5 4e __ LDA T7 + 1 
3cde : 85 04 __ STA WORK + 1 
3ce0 : a5 4b __ LDA T5 + 0 
3ce2 : 85 05 __ STA WORK + 2 
3ce4 : a5 4c __ LDA T5 + 1 
3ce6 : 85 06 __ STA WORK + 3 
3ce8 : a5 49 __ LDA T4 + 0 
3cea : 85 0b __ STA WORK + 8 
3cec : a5 48 __ LDA T3 + 0 
3cee : 85 0a __ STA WORK + 7 
3cf0 : a5 17 __ LDA P10 ; (pattern + 0)
3cf2 : 85 07 __ STA WORK + 4 
3cf4 : 20 00 4f JSR $4f00 ; (BLIT_CODE[0] + 0)
.s3:
3cf7 : 60 __ __ RTS
.s28:
3cf8 : a5 46 __ LDA T2 + 0 
3cfa : 05 47 __ ORA T2 + 1 
3cfc : c9 01 __ CMP #$01
3cfe : a9 00 __ LDA #$00
3d00 : 6a __ __ ROR
3d01 : 85 1c __ STA ACCU + 1 
3d03 : f0 03 __ BEQ $3d08 ; (bmu_line.s29 + 0)
3d05 : 4c 9b 3e JMP $3e9b ; (bmu_line.s35 + 0)
.s29:
3d08 : a2 00 __ LDX #$00
3d0a : 86 46 __ STX T2 + 0 
3d0c : 86 47 __ STX T2 + 1 
3d0e : a5 52 __ LDA T11 + 0 
3d10 : f0 03 __ BEQ $3d15 ; (bmu_line.s30 + 0)
3d12 : 4c 33 3e JMP $3e33 ; (bmu_line.s34 + 0)
.s30:
3d15 : a9 c8 __ LDA #$c8
3d17 : a4 45 __ LDY T1 + 0 
3d19 : 99 00 4f STA $4f00,y ; (BLIT_CODE[0] + 0)
3d1c : a9 c0 __ LDA #$c0
3d1e : 99 01 4f STA $4f01,y ; (BLIT_CODE[0] + 1)
3d21 : a9 08 __ LDA #$08
3d23 : 99 02 4f STA $4f02,y ; (BLIT_CODE[0] + 2)
3d26 : a9 d0 __ LDA #$d0
3d28 : 99 03 4f STA $4f03,y ; (BLIT_CODE[0] + 3)
3d2b : a9 a0 __ LDA #$a0
3d2d : 99 05 4f STA $4f05,y ; (BLIT_CODE[0] + 5)
3d30 : a9 00 __ LDA #$00
3d32 : 99 06 4f STA $4f06,y ; (BLIT_CODE[0] + 6)
3d35 : a9 a5 __ LDA #$a5
3d37 : 99 07 4f STA $4f07,y ; (BLIT_CODE[0] + 7)
3d3a : 99 0d 4f STA $4f0d,y ; (BLIT_CODE[0] + 13)
3d3d : a9 03 __ LDA #$03
3d3f : 99 08 4f STA $4f08,y ; (BLIT_CODE[0] + 8)
3d42 : 99 0c 4f STA $4f0c,y ; (BLIT_CODE[0] + 12)
3d45 : a9 69 __ LDA #$69
3d47 : 99 09 4f STA $4f09,y ; (BLIT_CODE[0] + 9)
3d4a : 99 0f 4f STA $4f0f,y ; (BLIT_CODE[0] + 15)
3d4d : a9 85 __ LDA #$85
3d4f : 99 0b 4f STA $4f0b,y ; (BLIT_CODE[0] + 11)
3d52 : 99 11 4f STA $4f11,y ; (BLIT_CODE[0] + 17)
3d55 : a9 04 __ LDA #$04
3d57 : 99 0e 4f STA $4f0e,y ; (BLIT_CODE[0] + 14)
3d5a : 99 12 4f STA $4f12,y ; (BLIT_CODE[0] + 18)
3d5d : 8a __ __ TXA
3d5e : f0 02 __ BEQ $3d62 ; (bmu_line.s71 + 0)
.s72:
3d60 : a9 1e __ LDA #$1e
.s71:
3d62 : 49 0e __ EOR #$0e
3d64 : 99 04 4f STA $4f04,y ; (BLIT_CODE[0] + 4)
3d67 : 38 __ __ SEC
3d68 : a5 4f __ LDA T8 + 0 
3d6a : e9 01 __ SBC #$01
3d6c : 99 0a 4f STA $4f0a,y ; (BLIT_CODE[0] + 10)
3d6f : a5 50 __ LDA T8 + 1 
3d71 : e9 00 __ SBC #$00
3d73 : 99 10 4f STA $4f10,y ; (BLIT_CODE[0] + 16)
3d76 : 98 __ __ TYA
3d77 : 18 __ __ CLC
3d78 : 69 13 __ ADC #$13
3d7a : 85 45 __ STA T1 + 0 
3d7c : a8 __ __ TAY
3d7d : 24 1c __ BIT ACCU + 1 
3d7f : 30 03 __ BMI $3d84 ; (bmu_line.s31 + 0)
3d81 : 4c 25 3c JMP $3c25 ; (bmu_line.s20 + 0)
.s31:
3d84 : a9 a5 __ LDA #$a5
3d86 : 99 00 4f STA $4f00,y ; (BLIT_CODE[0] + 0)
3d89 : a9 05 __ LDA #$05
3d8b : 99 01 4f STA $4f01,y ; (BLIT_CODE[0] + 1)
3d8e : 99 06 4f STA $4f06,y ; (BLIT_CODE[0] + 6)
3d91 : a9 38 __ LDA #$38
3d93 : 99 02 4f STA $4f02,y ; (BLIT_CODE[0] + 2)
3d96 : a9 e9 __ LDA #$e9
3d98 : 99 03 4f STA $4f03,y ; (BLIT_CODE[0] + 3)
3d9b : a9 85 __ LDA #$85
3d9d : 99 05 4f STA $4f05,y ; (BLIT_CODE[0] + 5)
3da0 : a5 46 __ LDA T2 + 0 
3da2 : 99 04 4f STA $4f04,y ; (BLIT_CODE[0] + 4)
3da5 : a5 1b __ LDA ACCU + 0 
3da7 : d0 2a __ BNE $3dd3 ; (bmu_line.s33 + 0)
.s32:
3da9 : a9 10 __ LDA #$10
3dab : 99 07 4f STA $4f07,y ; (BLIT_CODE[0] + 7)
3dae : a9 15 __ LDA #$15
3db0 : 99 08 4f STA $4f08,y ; (BLIT_CODE[0] + 8)
3db3 : a9 18 __ LDA #$18
3db5 : 99 09 4f STA $4f09,y ; (BLIT_CODE[0] + 9)
3db8 : a9 69 __ LDA #$69
3dba : 99 0a 4f STA $4f0a,y ; (BLIT_CODE[0] + 10)
3dbd : a5 43 __ LDA T0 + 0 
3dbf : 99 0b 4f STA $4f0b,y ; (BLIT_CODE[0] + 11)
3dc2 : a9 85 __ LDA #$85
3dc4 : 99 0c 4f STA $4f0c,y ; (BLIT_CODE[0] + 12)
3dc7 : a9 05 __ LDA #$05
3dc9 : 99 0d 4f STA $4f0d,y ; (BLIT_CODE[0] + 13)
3dcc : 98 __ __ TYA
3dcd : 18 __ __ CLC
3dce : 69 0e __ ADC #$0e
3dd0 : 4c 2e 3e JMP $3e2e ; (bmu_line.s65 + 0)
.s33:
3dd3 : a9 a5 __ LDA #$a5
3dd5 : 99 10 4f STA $4f10,y ; (BLIT_CODE[0] + 16)
3dd8 : 99 07 4f STA $4f07,y ; (BLIT_CODE[0] + 7)
3ddb : 99 16 4f STA $4f16,y ; (BLIT_CODE[0] + 22)
3dde : a9 18 __ LDA #$18
3de0 : 99 0f 4f STA $4f0f,y ; (BLIT_CODE[0] + 15)
3de3 : a9 1d __ LDA #$1d
3de5 : 99 0e 4f STA $4f0e,y ; (BLIT_CODE[0] + 14)
3de8 : a9 10 __ LDA #$10
3dea : 99 0d 4f STA $4f0d,y ; (BLIT_CODE[0] + 13)
3ded : a9 06 __ LDA #$06
3def : 99 0c 4f STA $4f0c,y ; (BLIT_CODE[0] + 12)
3df2 : 99 08 4f STA $4f08,y ; (BLIT_CODE[0] + 8)
3df5 : 99 17 4f STA $4f17,y ; (BLIT_CODE[0] + 23)
3df8 : 99 1b 4f STA $4f1b,y ; (BLIT_CODE[0] + 27)
3dfb : a9 85 __ LDA #$85
3dfd : 99 0b 4f STA $4f0b,y ; (BLIT_CODE[0] + 11)
3e00 : 99 14 4f STA $4f14,y ; (BLIT_CODE[0] + 20)
3e03 : 99 1a 4f STA $4f1a,y ; (BLIT_CODE[0] + 26)
3e06 : a9 e9 __ LDA #$e9
3e08 : 99 09 4f STA $4f09,y ; (BLIT_CODE[0] + 9)
3e0b : a9 05 __ LDA #$05
3e0d : 99 11 4f STA $4f11,y ; (BLIT_CODE[0] + 17)
3e10 : 99 15 4f STA $4f15,y ; (BLIT_CODE[0] + 21)
3e13 : a9 69 __ LDA #$69
3e15 : 99 12 4f STA $4f12,y ; (BLIT_CODE[0] + 18)
3e18 : 99 18 4f STA $4f18,y ; (BLIT_CODE[0] + 24)
3e1b : a5 43 __ LDA T0 + 0 
3e1d : 99 13 4f STA $4f13,y ; (BLIT_CODE[0] + 19)
3e20 : a5 47 __ LDA T2 + 1 
3e22 : 99 0a 4f STA $4f0a,y ; (BLIT_CODE[0] + 10)
3e25 : a5 44 __ LDA T0 + 1 
3e27 : 99 19 4f STA $4f19,y ; (BLIT_CODE[0] + 25)
3e2a : 98 __ __ TYA
3e2b : 18 __ __ CLC
3e2c : 69 1c __ ADC #$1c
.s65:
3e2e : 85 45 __ STA T1 + 0 
3e30 : 4c 2b 3c JMP $3c2b ; (bmu_line.s22 + 0)
.s34:
3e33 : a9 88 __ LDA #$88
3e35 : a4 45 __ LDY T1 + 0 
3e37 : 99 00 4f STA $4f00,y ; (BLIT_CODE[0] + 0)
3e3a : a9 10 __ LDA #$10
3e3c : 99 01 4f STA $4f01,y ; (BLIT_CODE[0] + 1)
3e3f : a9 18 __ LDA #$18
3e41 : 99 03 4f STA $4f03,y ; (BLIT_CODE[0] + 3)
3e44 : a9 a0 __ LDA #$a0
3e46 : 99 04 4f STA $4f04,y ; (BLIT_CODE[0] + 4)
3e49 : a9 07 __ LDA #$07
3e4b : 99 05 4f STA $4f05,y ; (BLIT_CODE[0] + 5)
3e4e : a9 a5 __ LDA #$a5
3e50 : 99 06 4f STA $4f06,y ; (BLIT_CODE[0] + 6)
3e53 : 99 0c 4f STA $4f0c,y ; (BLIT_CODE[0] + 12)
3e56 : a9 03 __ LDA #$03
3e58 : 99 07 4f STA $4f07,y ; (BLIT_CODE[0] + 7)
3e5b : 99 0b 4f STA $4f0b,y ; (BLIT_CODE[0] + 11)
3e5e : a9 69 __ LDA #$69
3e60 : 99 08 4f STA $4f08,y ; (BLIT_CODE[0] + 8)
3e63 : 99 0e 4f STA $4f0e,y ; (BLIT_CODE[0] + 14)
3e66 : a9 85 __ LDA #$85
3e68 : 99 0a 4f STA $4f0a,y ; (BLIT_CODE[0] + 10)
3e6b : 99 10 4f STA $4f10,y ; (BLIT_CODE[0] + 16)
3e6e : a9 04 __ LDA #$04
3e70 : 99 0d 4f STA $4f0d,y ; (BLIT_CODE[0] + 13)
3e73 : 99 11 4f STA $4f11,y ; (BLIT_CODE[0] + 17)
3e76 : 8a __ __ TXA
3e77 : f0 02 __ BEQ $3e7b ; (bmu_line.s68 + 0)
.s69:
3e79 : a9 1e __ LDA #$1e
.s68:
3e7b : 49 0f __ EOR #$0f
3e7d : 99 02 4f STA $4f02,y ; (BLIT_CODE[0] + 2)
3e80 : a5 4f __ LDA T8 + 0 
3e82 : 99 09 4f STA $4f09,y ; (BLIT_CODE[0] + 9)
3e85 : a5 50 __ LDA T8 + 1 
3e87 : 99 0f 4f STA $4f0f,y ; (BLIT_CODE[0] + 15)
3e8a : 98 __ __ TYA
3e8b : 18 __ __ CLC
3e8c : 69 12 __ ADC #$12
3e8e : 85 45 __ STA T1 + 0 
3e90 : a8 __ __ TAY
3e91 : 24 1c __ BIT ACCU + 1 
3e93 : 10 03 __ BPL $3e98 ; (bmu_line.s68 + 29)
3e95 : 4c 84 3d JMP $3d84 ; (bmu_line.s31 + 0)
3e98 : 4c 25 3c JMP $3c25 ; (bmu_line.s20 + 0)
.s35:
3e9b : a9 a5 __ LDA #$a5
3e9d : a4 45 __ LDY T1 + 0 
3e9f : 99 00 4f STA $4f00,y ; (BLIT_CODE[0] + 0)
3ea2 : a9 30 __ LDA #$30
3ea4 : 99 02 4f STA $4f02,y ; (BLIT_CODE[0] + 2)
3ea7 : a5 1b __ LDA ACCU + 0 
3ea9 : 69 05 __ ADC #$05
3eab : 99 01 4f STA $4f01,y ; (BLIT_CODE[0] + 1)
3eae : a5 1b __ LDA ACCU + 0 
3eb0 : d0 21 __ BNE $3ed3 ; (bmu_line.s39 + 0)
.s36:
3eb2 : a2 1b __ LDX #$1b
3eb4 : a5 52 __ LDA T11 + 0 
3eb6 : d0 01 __ BNE $3eb9 ; (bmu_line.s38 + 0)
.s37:
3eb8 : e8 __ __ INX
.s38:
3eb9 : 8a __ __ TXA
3eba : 99 03 4f STA $4f03,y ; (BLIT_CODE[0] + 3)
3ebd : 98 __ __ TYA
3ebe : 18 __ __ CLC
3ebf : 69 04 __ ADC #$04
3ec1 : 85 45 __ STA T1 + 0 
3ec3 : a9 00 __ LDA #$00
3ec5 : c5 1b __ CMP ACCU + 0 
3ec7 : 2a __ __ ROL
3ec8 : aa __ __ TAX
3ec9 : a5 52 __ LDA T11 + 0 
3ecb : f0 03 __ BEQ $3ed0 ; (bmu_line.s38 + 23)
3ecd : 4c 33 3e JMP $3e33 ; (bmu_line.s34 + 0)
3ed0 : 4c 15 3d JMP $3d15 ; (bmu_line.s30 + 0)
.s39:
3ed3 : a2 21 __ LDX #$21
3ed5 : a5 52 __ LDA T11 + 0 
3ed7 : d0 e0 __ BNE $3eb9 ; (bmu_line.s38 + 0)
3ed9 : f0 dd __ BEQ $3eb8 ; (bmu_line.s37 + 0)
.s44:
3edb : a8 __ __ TAY
3edc : d0 4b __ BNE $3f29 ; (bmu_line.s46 + 0)
.s45:
3ede : 8e 09 4f STX $4f09 ; (BLIT_CODE[0] + 9)
3ee1 : 8e 06 4f STX $4f06 ; (BLIT_CODE[0] + 6)
3ee4 : a9 07 __ LDA #$07
3ee6 : 8d 0b 4f STA $4f0b ; (BLIT_CODE[0] + 11)
3ee9 : 8d 07 4f STA $4f07 ; (BLIT_CODE[0] + 7)
3eec : a9 e6 __ LDA #$e6
3eee : 8d 0a 4f STA $4f0a ; (BLIT_CODE[0] + 10)
3ef1 : a9 03 __ LDA #$03
3ef3 : 8d 0d 4f STA $4f0d ; (BLIT_CODE[0] + 13)
3ef6 : 8d 13 4f STA $4f13 ; (BLIT_CODE[0] + 19)
3ef9 : 8d 15 4f STA $4f15 ; (BLIT_CODE[0] + 21)
3efc : a9 90 __ LDA #$90
3efe : 8d 08 4f STA $4f08 ; (BLIT_CODE[0] + 8)
3f01 : a9 11 __ LDA #$11
3f03 : 8d 0c 4f STA $4f0c ; (BLIT_CODE[0] + 12)
3f06 : a9 d0 __ LDA #$d0
3f08 : 8d 0e 4f STA $4f0e ; (BLIT_CODE[0] + 14)
3f0b : a9 04 __ LDA #$04
3f0d : 8d 0f 4f STA $4f0f ; (BLIT_CODE[0] + 15)
3f10 : a9 49 __ LDA #$49
3f12 : 8d 10 4f STA $4f10 ; (BLIT_CODE[0] + 16)
3f15 : a9 ff __ LDA #$ff
3f17 : 8d 11 4f STA $4f11 ; (BLIT_CODE[0] + 17)
3f1a : a9 31 __ LDA #$31
3f1c : 8d 12 4f STA $4f12 ; (BLIT_CODE[0] + 18)
3f1f : a9 91 __ LDA #$91
3f21 : 8d 14 4f STA $4f14 ; (BLIT_CODE[0] + 20)
3f24 : a9 16 __ LDA #$16
3f26 : 4c 1a 3c JMP $3c1a ; (bmu_line.s64 + 0)
.s46:
3f29 : a6 17 __ LDX P10 ; (pattern + 0)
3f2b : e8 __ __ INX
3f2c : f0 1e __ BEQ $3f4c ; (bmu_line.s47 + 0)
.s48:
3f2e : a9 06 __ LDA #$06
3f30 : 8d 06 4f STA $4f06 ; (BLIT_CODE[0] + 6)
3f33 : 8d 09 4f STA $4f09 ; (BLIT_CODE[0] + 9)
3f36 : a9 07 __ LDA #$07
3f38 : 8d 07 4f STA $4f07 ; (BLIT_CODE[0] + 7)
3f3b : 8d 0b 4f STA $4f0b ; (BLIT_CODE[0] + 11)
3f3e : a9 90 __ LDA #$90
3f40 : 8d 08 4f STA $4f08 ; (BLIT_CODE[0] + 8)
3f43 : a9 e6 __ LDA #$e6
3f45 : 8d 0a 4f STA $4f0a ; (BLIT_CODE[0] + 10)
3f48 : a9 0c __ LDA #$0c
3f4a : 85 45 __ STA T1 + 0 
.s47:
3f4c : a9 11 __ LDA #$11
3f4e : 4c 04 3c JMP $3c04 ; (bmu_line.s42 + 0)
.s49:
3f51 : a4 17 __ LDY P10 ; (pattern + 0)
3f53 : c8 __ __ INY
3f54 : f0 1c __ BEQ $3f72 ; (bmu_line.s50 + 0)
.s51:
3f56 : 8e 06 4f STX $4f06 ; (BLIT_CODE[0] + 6)
3f59 : a9 07 __ LDA #$07
3f5b : 8d 07 4f STA $4f07 ; (BLIT_CODE[0] + 7)
3f5e : 8d 0b 4f STA $4f0b ; (BLIT_CODE[0] + 11)
3f61 : a9 90 __ LDA #$90
3f63 : 8d 08 4f STA $4f08 ; (BLIT_CODE[0] + 8)
3f66 : a9 08 __ LDA #$08
3f68 : 8d 09 4f STA $4f09 ; (BLIT_CODE[0] + 9)
3f6b : a9 e6 __ LDA #$e6
3f6d : 8d 0a 4f STA $4f0a ; (BLIT_CODE[0] + 10)
3f70 : a2 0c __ LDX #$0c
.s50:
3f72 : a9 49 __ LDA #$49
3f74 : 9d 00 4f STA $4f00,x ; (BLIT_CODE[0] + 0)
3f77 : a9 ff __ LDA #$ff
3f79 : 9d 01 4f STA $4f01,x ; (BLIT_CODE[0] + 1)
3f7c : a9 31 __ LDA #$31
3f7e : 9d 02 4f STA $4f02,x ; (BLIT_CODE[0] + 2)
3f81 : a9 03 __ LDA #$03
3f83 : 9d 03 4f STA $4f03,x ; (BLIT_CODE[0] + 3)
3f86 : 9d 05 4f STA $4f05,x ; (BLIT_CODE[0] + 5)
3f89 : a9 91 __ LDA #$91
3f8b : 9d 04 4f STA $4f04,x ; (BLIT_CODE[0] + 4)
3f8e : 8a __ __ TXA
3f8f : 18 __ __ CLC
3f90 : 69 06 __ ADC #$06
3f92 : 4c 1a 3c JMP $3c1a ; (bmu_line.s64 + 0)
.s59:
3f95 : c9 ff __ CMP #$ff
3f97 : f0 03 __ BEQ $3f9c ; (bmu_line.s60 + 0)
3f99 : 4c ab 3a JMP $3aab ; (bmu_line.s7 + 0)
.s60:
3f9c : a5 18 __ LDA P11 ; (op + 0)
3f9e : d0 f9 __ BNE $3f99 ; (bmu_line.s59 + 4)
.s61:
3fa0 : a9 01 __ LDA #$01
3fa2 : 4c a9 3a JMP $3aa9 ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
draw_plane: ; draw_plane(i16*,i16)->void
; 418, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s1:
3fa5 : a2 0a __ LDX #$0a
3fa7 : b5 53 __ LDA T3 + 0,x 
3fa9 : 9d ba cf STA $cfba,x ; (draw_plane@stack + 0)
3fac : ca __ __ DEX
3fad : 10 f8 __ BPL $3fa7 ; (draw_plane.s1 + 2)
.s4:
3faf : ad c2 4d LDA $4dc2 ; (PaintersOn + 1)
3fb2 : d0 09 __ BNE $3fbd ; (draw_plane.s5 + 0)
.s54:
3fb4 : ae c1 4d LDX $4dc1 ; (PaintersOn + 0)
3fb7 : ca __ __ DEX
3fb8 : d0 03 __ BNE $3fbd ; (draw_plane.s5 + 0)
3fba : 4c c0 40 JMP $40c0 ; (draw_plane.s10 + 0)
.s5:
3fbd : ad eb cf LDA $cfeb ; (sstack + 24)
3fc0 : 85 53 __ STA T3 + 0 
3fc2 : ad ec cf LDA $cfec ; (sstack + 25)
3fc5 : 30 06 __ BMI $3fcd ; (draw_plane.s3 + 0)
.s9:
3fc7 : 85 54 __ STA T3 + 1 
3fc9 : 05 53 __ ORA T3 + 0 
3fcb : d0 0b __ BNE $3fd8 ; (draw_plane.s6 + 0)
.s3:
3fcd : a2 0a __ LDX #$0a
3fcf : bd ba cf LDA $cfba,x ; (draw_plane@stack + 0)
3fd2 : 95 53 __ STA T3 + 0,x 
3fd4 : ca __ __ DEX
3fd5 : 10 f8 __ BPL $3fcf ; (draw_plane.s3 + 2)
3fd7 : 60 __ __ RTS
.s6:
3fd8 : a9 00 __ LDA #$00
3fda : 85 55 __ STA T4 + 0 
3fdc : 85 56 __ STA T4 + 1 
3fde : ad e9 cf LDA $cfe9 ; (sstack + 22)
3fe1 : 85 57 __ STA T5 + 0 
3fe3 : ad ea cf LDA $cfea ; (sstack + 23)
3fe6 : 85 58 __ STA T5 + 1 
.l7:
3fe8 : a5 55 __ LDA T4 + 0 
.l68:
3fea : 0a __ __ ASL
3feb : 85 43 __ STA T0 + 0 
3fed : a5 56 __ LDA T4 + 1 
3fef : 2a __ __ ROL
3ff0 : 18 __ __ CLC
3ff1 : 65 58 __ ADC T5 + 1 
3ff3 : 85 44 __ STA T0 + 1 
3ff5 : a4 57 __ LDY T5 + 0 
3ff7 : b1 43 __ LDA (T0 + 0),y 
3ff9 : 0a __ __ ASL
3ffa : 85 1b __ STA ACCU + 0 
3ffc : c8 __ __ INY
3ffd : b1 43 __ LDA (T0 + 0),y 
3fff : 2a __ __ ROL
4000 : 85 1c __ STA ACCU + 1 
4002 : ad 28 4e LDA $4e28 ; (vx_pct + 0)
4005 : 18 __ __ CLC
4006 : 65 1b __ ADC ACCU + 0 
4008 : 85 47 __ STA T2 + 0 
400a : ad 29 4e LDA $4e29 ; (vx_pct + 1)
400d : 65 1c __ ADC ACCU + 1 
400f : 85 48 __ STA T2 + 1 
4011 : a0 00 __ LDY #$00
4013 : b1 47 __ LDA (T2 + 0),y 
4015 : 8d e1 cf STA $cfe1 ; (sstack + 14)
4018 : c8 __ __ INY
4019 : b1 47 __ LDA (T2 + 0),y 
401b : 8d e2 cf STA $cfe2 ; (sstack + 15)
401e : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
4021 : 18 __ __ CLC
4022 : 65 1b __ ADC ACCU + 0 
4024 : 85 43 __ STA T0 + 0 
4026 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
4029 : 65 1c __ ADC ACCU + 1 
402b : 85 44 __ STA T0 + 1 
402d : 88 __ __ DEY
402e : b1 43 __ LDA (T0 + 0),y 
4030 : 8d e3 cf STA $cfe3 ; (sstack + 16)
4033 : c8 __ __ INY
4034 : b1 43 __ LDA (T0 + 0),y 
4036 : 8d e4 cf STA $cfe4 ; (sstack + 17)
4039 : 18 __ __ CLC
403a : a5 55 __ LDA T4 + 0 
403c : 69 01 __ ADC #$01
403e : 85 55 __ STA T4 + 0 
4040 : 85 1b __ STA ACCU + 0 
4042 : a5 56 __ LDA T4 + 1 
4044 : 69 00 __ ADC #$00
4046 : 85 56 __ STA T4 + 1 
4048 : 85 1c __ STA ACCU + 1 
404a : a5 53 __ LDA T3 + 0 
404c : 85 03 __ STA WORK + 0 
404e : a5 54 __ LDA T3 + 1 
4050 : 85 04 __ STA WORK + 1 
4052 : 20 91 49 JSR $4991 ; (divmod + 0)
4055 : a5 05 __ LDA WORK + 2 
4057 : 0a __ __ ASL
4058 : 85 43 __ STA T0 + 0 
405a : a5 06 __ LDA WORK + 3 
405c : 2a __ __ ROL
405d : 18 __ __ CLC
405e : 65 58 __ ADC T5 + 1 
4060 : 85 44 __ STA T0 + 1 
4062 : a4 57 __ LDY T5 + 0 
4064 : b1 43 __ LDA (T0 + 0),y 
4066 : 0a __ __ ASL
4067 : 85 1b __ STA ACCU + 0 
4069 : c8 __ __ INY
406a : b1 43 __ LDA (T0 + 0),y 
406c : 2a __ __ ROL
406d : 85 1c __ STA ACCU + 1 
406f : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
4072 : 18 __ __ CLC
4073 : 65 1b __ ADC ACCU + 0 
4075 : 85 47 __ STA T2 + 0 
4077 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
407a : 65 1c __ ADC ACCU + 1 
407c : 85 48 __ STA T2 + 1 
407e : a0 00 __ LDY #$00
4080 : b1 47 __ LDA (T2 + 0),y 
4082 : 8d e7 cf STA $cfe7 ; (sstack + 20)
4085 : c8 __ __ INY
4086 : b1 47 __ LDA (T2 + 0),y 
4088 : 8d e8 cf STA $cfe8 ; (sstack + 21)
408b : ad 28 4e LDA $4e28 ; (vx_pct + 0)
408e : 18 __ __ CLC
408f : 65 1b __ ADC ACCU + 0 
4091 : 85 45 __ STA T1 + 0 
4093 : ad 29 4e LDA $4e29 ; (vx_pct + 1)
4096 : 65 1c __ ADC ACCU + 1 
4098 : 85 46 __ STA T1 + 1 
409a : 88 __ __ DEY
409b : b1 45 __ LDA (T1 + 0),y 
409d : 8d e5 cf STA $cfe5 ; (sstack + 18)
40a0 : c8 __ __ INY
40a1 : b1 45 __ LDA (T1 + 0),y 
40a3 : 8d e6 cf STA $cfe6 ; (sstack + 19)
40a6 : 20 08 35 JSR $3508 ; (drawline.s4 + 0)
40a9 : a5 56 __ LDA T4 + 1 
40ab : c5 54 __ CMP T3 + 1 
40ad : b0 03 __ BCS $40b2 ; (draw_plane.s66 + 0)
40af : 4c e8 3f JMP $3fe8 ; (draw_plane.l7 + 0)
.s66:
40b2 : f0 03 __ BEQ $40b7 ; (draw_plane.s8 + 0)
40b4 : 4c cd 3f JMP $3fcd ; (draw_plane.s3 + 0)
.s8:
40b7 : a5 55 __ LDA T4 + 0 
40b9 : c5 53 __ CMP T3 + 0 
40bb : b0 f7 __ BCS $40b4 ; (draw_plane.s66 + 2)
40bd : 4c ea 3f JMP $3fea ; (draw_plane.l68 + 0)
.s10:
40c0 : 85 55 __ STA T4 + 0 
40c2 : 85 56 __ STA T4 + 1 
40c4 : 85 58 __ STA T5 + 1 
40c6 : ad eb cf LDA $cfeb ; (sstack + 24)
40c9 : 85 59 __ STA T6 + 0 
40cb : a9 c8 __ LDA #$c8
40cd : 85 57 __ STA T5 + 0 
40cf : ad ec cf LDA $cfec ; (sstack + 25)
40d2 : 85 5a __ STA T6 + 1 
40d4 : 10 06 __ BPL $40dc ; (draw_plane.s12 + 0)
.s11:
40d6 : 8a __ __ TXA
.s64:
40d7 : 85 5b __ STA T7 + 0 
40d9 : 4c 70 41 JMP $4170 ; (draw_plane.s13 + 0)
.s12:
40dc : 05 59 __ ORA T6 + 0 
40de : f0 f7 __ BEQ $40d7 ; (draw_plane.s64 + 0)
.s55:
40e0 : 86 44 __ STX T0 + 1 
40e2 : ad e9 cf LDA $cfe9 ; (sstack + 22)
40e5 : 85 45 __ STA T1 + 0 
40e7 : a9 01 __ LDA #$01
40e9 : 85 5b __ STA T7 + 0 
40eb : ad ea cf LDA $cfea ; (sstack + 23)
40ee : 85 46 __ STA T1 + 1 
40f0 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
40f3 : 85 47 __ STA T2 + 0 
40f5 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
40f8 : 85 48 __ STA T2 + 1 
.l40:
40fa : 8a __ __ TXA
40fb : 0a __ __ ASL
40fc : 85 53 __ STA T3 + 0 
40fe : a5 44 __ LDA T0 + 1 
4100 : 2a __ __ ROL
4101 : 18 __ __ CLC
4102 : 65 46 __ ADC T1 + 1 
4104 : 85 54 __ STA T3 + 1 
4106 : a4 45 __ LDY T1 + 0 
4108 : b1 53 __ LDA (T3 + 0),y 
410a : 0a __ __ ASL
410b : 85 1b __ STA ACCU + 0 
410d : c8 __ __ INY
410e : b1 53 __ LDA (T3 + 0),y 
4110 : 2a __ __ ROL
4111 : a8 __ __ TAY
4112 : 18 __ __ CLC
4113 : a5 47 __ LDA T2 + 0 
4115 : 65 1b __ ADC ACCU + 0 
4117 : 85 53 __ STA T3 + 0 
4119 : 98 __ __ TYA
411a : 65 48 __ ADC T2 + 1 
411c : 85 54 __ STA T3 + 1 
411e : a0 00 __ LDY #$00
4120 : b1 53 __ LDA (T3 + 0),y 
4122 : 85 1b __ STA ACCU + 0 
4124 : c8 __ __ INY
4125 : b1 53 __ LDA (T3 + 0),y 
4127 : 85 54 __ STA T3 + 1 
4129 : c5 58 __ CMP T5 + 1 
412b : d0 08 __ BNE $4135 ; (draw_plane.s53 + 0)
.s50:
412d : a5 1b __ LDA ACCU + 0 
412f : c5 57 __ CMP T5 + 0 
.s51:
4131 : 90 08 __ BCC $413b ; (draw_plane.s49 + 0)
4133 : b0 0e __ BCS $4143 ; (draw_plane.s41 + 0)
.s53:
4135 : 45 58 __ EOR T5 + 1 
4137 : 10 f8 __ BPL $4131 ; (draw_plane.s51 + 0)
.s52:
4139 : 90 08 __ BCC $4143 ; (draw_plane.s41 + 0)
.s49:
413b : a5 1b __ LDA ACCU + 0 
413d : 85 57 __ STA T5 + 0 
413f : a5 54 __ LDA T3 + 1 
4141 : 85 58 __ STA T5 + 1 
.s41:
4143 : a5 56 __ LDA T4 + 1 
4145 : c5 54 __ CMP T3 + 1 
4147 : d0 08 __ BNE $4151 ; (draw_plane.s48 + 0)
.s45:
4149 : a5 55 __ LDA T4 + 0 
414b : c5 1b __ CMP ACCU + 0 
.s46:
414d : 90 08 __ BCC $4157 ; (draw_plane.s44 + 0)
414f : b0 0e __ BCS $415f ; (draw_plane.s42 + 0)
.s48:
4151 : 45 54 __ EOR T3 + 1 
4153 : 10 f8 __ BPL $414d ; (draw_plane.s46 + 0)
.s47:
4155 : 90 08 __ BCC $415f ; (draw_plane.s42 + 0)
.s44:
4157 : a5 1b __ LDA ACCU + 0 
4159 : 85 55 __ STA T4 + 0 
415b : a5 54 __ LDA T3 + 1 
415d : 85 56 __ STA T4 + 1 
.s42:
415f : e8 __ __ INX
4160 : d0 02 __ BNE $4164 ; (draw_plane.s57 + 0)
.s56:
4162 : e6 44 __ INC T0 + 1 
.s57:
4164 : a5 44 __ LDA T0 + 1 
4166 : c5 5a __ CMP T6 + 1 
4168 : 90 90 __ BCC $40fa ; (draw_plane.l40 + 0)
.s65:
416a : d0 04 __ BNE $4170 ; (draw_plane.s13 + 0)
.s43:
416c : e4 59 __ CPX T6 + 0 
416e : 90 8a __ BCC $40fa ; (draw_plane.l40 + 0)
.s13:
4170 : a5 56 __ LDA T4 + 1 
4172 : c5 58 __ CMP T5 + 1 
4174 : d0 09 __ BNE $417f ; (draw_plane.s18 + 0)
.s15:
4176 : a5 55 __ LDA T4 + 0 
4178 : c5 57 __ CMP T5 + 0 
.s16:
417a : a9 00 __ LDA #$00
417c : 2a __ __ ROL
417d : 90 09 __ BCC $4188 ; (draw_plane.s14 + 0)
.s18:
417f : 45 58 __ EOR T5 + 1 
4181 : 10 f7 __ BPL $417a ; (draw_plane.s16 + 0)
.s17:
4183 : a9 00 __ LDA #$00
4185 : 2a __ __ ROL
4186 : 49 01 __ EOR #$01
.s14:
4188 : 85 5d __ STA T8 + 0 
418a : f0 66 __ BEQ $41f2 ; (draw_plane.s19 + 0)
.s35:
418c : a5 58 __ LDA T5 + 1 
418e : 85 44 __ STA T0 + 1 
4190 : a5 57 __ LDA T5 + 0 
4192 : 85 43 __ STA T0 + 0 
4194 : 0a __ __ ASL
4195 : 85 45 __ STA T1 + 0 
4197 : a9 00 __ LDA #$00
4199 : 2a __ __ ROL
419a : 85 46 __ STA T1 + 1 
419c : a9 70 __ LDA #$70
419e : 65 45 __ ADC T1 + 0 
41a0 : 85 47 __ STA T2 + 0 
41a2 : a9 63 __ LDA #$63
41a4 : 65 46 __ ADC T1 + 1 
41a6 : 85 48 __ STA T2 + 1 
41a8 : 18 __ __ CLC
41a9 : a9 e0 __ LDA #$e0
41ab : 65 45 __ ADC T1 + 0 
41ad : 85 45 __ STA T1 + 0 
41af : a9 61 __ LDA #$61
41b1 : 65 46 __ ADC T1 + 1 
41b3 : 85 46 __ STA T1 + 1 
41b5 : a6 55 __ LDX T4 + 0 
.l36:
41b7 : a9 ff __ LDA #$ff
41b9 : a0 00 __ LDY #$00
41bb : 91 47 __ STA (T2 + 0),y 
41bd : c8 __ __ INY
41be : 91 47 __ STA (T2 + 0),y 
41c0 : a9 40 __ LDA #$40
41c2 : 88 __ __ DEY
41c3 : 91 45 __ STA (T1 + 0),y 
41c5 : a9 01 __ LDA #$01
41c7 : a8 __ __ TAY
41c8 : 91 45 __ STA (T1 + 0),y 
41ca : 18 __ __ CLC
41cb : a5 45 __ LDA T1 + 0 
41cd : 69 02 __ ADC #$02
41cf : 85 45 __ STA T1 + 0 
41d1 : 90 03 __ BCC $41d6 ; (draw_plane.s59 + 0)
.s58:
41d3 : e6 46 __ INC T1 + 1 
41d5 : 18 __ __ CLC
.s59:
41d6 : a5 47 __ LDA T2 + 0 
41d8 : 69 02 __ ADC #$02
41da : 85 47 __ STA T2 + 0 
41dc : 90 02 __ BCC $41e0 ; (draw_plane.s61 + 0)
.s60:
41de : e6 48 __ INC T2 + 1 
.s61:
41e0 : e6 43 __ INC T0 + 0 
41e2 : d0 02 __ BNE $41e6 ; (draw_plane.s63 + 0)
.s62:
41e4 : e6 44 __ INC T0 + 1 
.s63:
41e6 : a5 56 __ LDA T4 + 1 
41e8 : 30 08 __ BMI $41f2 ; (draw_plane.s19 + 0)
.s39:
41ea : c5 44 __ CMP T0 + 1 
41ec : d0 02 __ BNE $41f0 ; (draw_plane.s38 + 0)
.s37:
41ee : e4 43 __ CPX T0 + 0 
.s38:
41f0 : b0 c5 __ BCS $41b7 ; (draw_plane.l36 + 0)
.s19:
41f2 : a5 5b __ LDA T7 + 0 
41f4 : f0 13 __ BEQ $4209 ; (draw_plane.s20 + 0)
.s31:
41f6 : a9 00 __ LDA #$00
41f8 : 85 53 __ STA T3 + 0 
41fa : 85 54 __ STA T3 + 1 
41fc : ad e9 cf LDA $cfe9 ; (sstack + 22)
41ff : 85 5b __ STA T7 + 0 
4201 : ad ea cf LDA $cfea ; (sstack + 23)
4204 : 85 5c __ STA T7 + 1 
4206 : 4c 98 42 JMP $4298 ; (draw_plane.l32 + 0)
.s20:
4209 : a9 01 __ LDA #$01
420b : 8d b7 4d STA $4db7 ; (drawing_mode + 0)
420e : a9 00 __ LDA #$00
4210 : 8d b8 4d STA $4db8 ; (drawing_mode + 1)
4213 : a5 5d __ LDA T8 + 0 
4215 : f0 76 __ BEQ $428d ; (draw_plane.s21 + 0)
.l22:
4217 : a5 57 __ LDA T5 + 0 
4219 : 0a __ __ ASL
421a : 85 43 __ STA T0 + 0 
421c : a8 __ __ TAY
421d : a9 00 __ LDA #$00
421f : 2a __ __ ROL
4220 : 85 44 __ STA T0 + 1 
4222 : 69 61 __ ADC #$61
4224 : 85 46 __ STA T1 + 1 
4226 : a9 e0 __ LDA #$e0
4228 : 85 45 __ STA T1 + 0 
422a : b1 45 __ LDA (T1 + 0),y 
422c : aa __ __ TAX
422d : c8 __ __ INY
422e : b1 45 __ LDA (T1 + 0),y 
4230 : 85 46 __ STA T1 + 1 
4232 : a9 70 __ LDA #$70
4234 : 65 43 __ ADC T0 + 0 
4236 : 85 43 __ STA T0 + 0 
4238 : a9 63 __ LDA #$63
423a : 65 44 __ ADC T0 + 1 
423c : 85 44 __ STA T0 + 1 
423e : a0 00 __ LDY #$00
4240 : b1 43 __ LDA (T0 + 0),y 
4242 : 85 1b __ STA ACCU + 0 
4244 : c8 __ __ INY
4245 : b1 43 __ LDA (T0 + 0),y 
4247 : a8 __ __ TAY
4248 : c5 46 __ CMP T1 + 1 
424a : d0 0a __ BNE $4256 ; (draw_plane.s30 + 0)
.s27:
424c : 86 45 __ STX T1 + 0 
424e : a5 1b __ LDA ACCU + 0 
4250 : c5 45 __ CMP T1 + 0 
.s28:
4252 : b0 08 __ BCS $425c ; (draw_plane.s26 + 0)
4254 : 90 29 __ BCC $427f ; (draw_plane.s23 + 0)
.s30:
4256 : 45 46 __ EOR T1 + 1 
4258 : 10 f8 __ BPL $4252 ; (draw_plane.s28 + 0)
.s29:
425a : b0 23 __ BCS $427f ; (draw_plane.s23 + 0)
.s26:
425c : 8e e1 cf STX $cfe1 ; (sstack + 14)
425f : 8c e6 cf STY $cfe6 ; (sstack + 19)
4262 : a5 46 __ LDA T1 + 1 
4264 : 8d e2 cf STA $cfe2 ; (sstack + 15)
4267 : a5 57 __ LDA T5 + 0 
4269 : 8d e3 cf STA $cfe3 ; (sstack + 16)
426c : 8d e7 cf STA $cfe7 ; (sstack + 20)
426f : a9 00 __ LDA #$00
4271 : 8d e4 cf STA $cfe4 ; (sstack + 17)
4274 : 8d e8 cf STA $cfe8 ; (sstack + 21)
4277 : a5 1b __ LDA ACCU + 0 
4279 : 8d e5 cf STA $cfe5 ; (sstack + 18)
427c : 20 08 35 JSR $3508 ; (drawline.s4 + 0)
.s23:
427f : e6 57 __ INC T5 + 0 
4281 : a5 56 __ LDA T4 + 1 
4283 : 30 08 __ BMI $428d ; (draw_plane.s21 + 0)
.s25:
4285 : d0 90 __ BNE $4217 ; (draw_plane.l22 + 0)
.s24:
4287 : a5 55 __ LDA T4 + 0 
4289 : c5 57 __ CMP T5 + 0 
428b : b0 8a __ BCS $4217 ; (draw_plane.l22 + 0)
.s21:
428d : a9 00 __ LDA #$00
428f : 8d b7 4d STA $4db7 ; (drawing_mode + 0)
4292 : 8d b8 4d STA $4db8 ; (drawing_mode + 1)
4295 : 4c bd 3f JMP $3fbd ; (draw_plane.s5 + 0)
.l32:
4298 : a5 53 __ LDA T3 + 0 
.l69:
429a : 0a __ __ ASL
429b : 85 43 __ STA T0 + 0 
429d : a5 54 __ LDA T3 + 1 
429f : 2a __ __ ROL
42a0 : 18 __ __ CLC
42a1 : 65 5c __ ADC T7 + 1 
42a3 : 85 44 __ STA T0 + 1 
42a5 : a4 5b __ LDY T7 + 0 
42a7 : b1 43 __ LDA (T0 + 0),y 
42a9 : 0a __ __ ASL
42aa : 85 1b __ STA ACCU + 0 
42ac : c8 __ __ INY
42ad : b1 43 __ LDA (T0 + 0),y 
42af : 2a __ __ ROL
42b0 : 85 1c __ STA ACCU + 1 
42b2 : ad 28 4e LDA $4e28 ; (vx_pct + 0)
42b5 : 18 __ __ CLC
42b6 : 65 1b __ ADC ACCU + 0 
42b8 : 85 47 __ STA T2 + 0 
42ba : ad 29 4e LDA $4e29 ; (vx_pct + 1)
42bd : 65 1c __ ADC ACCU + 1 
42bf : 85 48 __ STA T2 + 1 
42c1 : a0 00 __ LDY #$00
42c3 : b1 47 __ LDA (T2 + 0),y 
42c5 : 85 0d __ STA P0 
42c7 : c8 __ __ INY
42c8 : b1 47 __ LDA (T2 + 0),y 
42ca : 85 0e __ STA P1 
42cc : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
42cf : 18 __ __ CLC
42d0 : 65 1b __ ADC ACCU + 0 
42d2 : 85 43 __ STA T0 + 0 
42d4 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
42d7 : 65 1c __ ADC ACCU + 1 
42d9 : 85 44 __ STA T0 + 1 
42db : 88 __ __ DEY
42dc : b1 43 __ LDA (T0 + 0),y 
42de : 85 0f __ STA P2 
42e0 : c8 __ __ INY
42e1 : b1 43 __ LDA (T0 + 0),y 
42e3 : 85 10 __ STA P3 
42e5 : 18 __ __ CLC
42e6 : a5 53 __ LDA T3 + 0 
42e8 : 69 01 __ ADC #$01
42ea : 85 53 __ STA T3 + 0 
42ec : 85 1b __ STA ACCU + 0 
42ee : a5 54 __ LDA T3 + 1 
42f0 : 69 00 __ ADC #$00
42f2 : 85 54 __ STA T3 + 1 
42f4 : 85 1c __ STA ACCU + 1 
42f6 : a5 59 __ LDA T6 + 0 
42f8 : 85 03 __ STA WORK + 0 
42fa : a5 5a __ LDA T6 + 1 
42fc : 85 04 __ STA WORK + 1 
42fe : 20 1c 4a JSR $4a1c ; (mods16 + 0)
4301 : a5 05 __ LDA WORK + 2 
4303 : 0a __ __ ASL
4304 : 85 43 __ STA T0 + 0 
4306 : a5 06 __ LDA WORK + 3 
4308 : 2a __ __ ROL
4309 : 18 __ __ CLC
430a : 65 5c __ ADC T7 + 1 
430c : 85 44 __ STA T0 + 1 
430e : a4 5b __ LDY T7 + 0 
4310 : b1 43 __ LDA (T0 + 0),y 
4312 : 0a __ __ ASL
4313 : 85 1b __ STA ACCU + 0 
4315 : c8 __ __ INY
4316 : b1 43 __ LDA (T0 + 0),y 
4318 : 2a __ __ ROL
4319 : 85 1c __ STA ACCU + 1 
431b : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
431e : 18 __ __ CLC
431f : 65 1b __ ADC ACCU + 0 
4321 : 85 47 __ STA T2 + 0 
4323 : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
4326 : 65 1c __ ADC ACCU + 1 
4328 : 85 48 __ STA T2 + 1 
432a : a0 00 __ LDY #$00
432c : b1 47 __ LDA (T2 + 0),y 
432e : 85 13 __ STA P6 
4330 : c8 __ __ INY
4331 : b1 47 __ LDA (T2 + 0),y 
4333 : 85 14 __ STA P7 
4335 : ad 28 4e LDA $4e28 ; (vx_pct + 0)
4338 : 18 __ __ CLC
4339 : 65 1b __ ADC ACCU + 0 
433b : 85 45 __ STA T1 + 0 
433d : ad 29 4e LDA $4e29 ; (vx_pct + 1)
4340 : 65 1c __ ADC ACCU + 1 
4342 : 85 46 __ STA T1 + 1 
4344 : 88 __ __ DEY
4345 : b1 45 __ LDA (T1 + 0),y 
4347 : 85 11 __ STA P4 
4349 : c8 __ __ INY
434a : b1 45 __ LDA (T1 + 0),y 
434c : 85 12 __ STA P5 
434e : 20 6c 43 JSR $436c ; (scan_edge.s4 + 0)
4351 : 24 5a __ BIT T6 + 1 
4353 : 10 03 __ BPL $4358 ; (draw_plane.s34 + 0)
4355 : 4c 09 42 JMP $4209 ; (draw_plane.s20 + 0)
.s34:
4358 : a5 54 __ LDA T3 + 1 
435a : c5 5a __ CMP T6 + 1 
435c : b0 03 __ BCS $4361 ; (draw_plane.s67 + 0)
435e : 4c 98 42 JMP $4298 ; (draw_plane.l32 + 0)
.s67:
4361 : d0 f2 __ BNE $4355 ; (draw_plane.l69 + 187)
.s33:
4363 : a5 53 __ LDA T3 + 0 
4365 : c5 59 __ CMP T6 + 0 
4367 : b0 ec __ BCS $4355 ; (draw_plane.l69 + 187)
4369 : 4c 9a 42 JMP $429a ; (draw_plane.l69 + 0)
--------------------------------------------------------------------
scan_edge: ; scan_edge(i16,i16,i16,i16)->void
; 364, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
436c : a6 0f __ LDX P2 ; (y1 + 0)
436e : a4 10 __ LDY P3 ; (y1 + 1)
4370 : c4 14 __ CPY P7 ; (y2 + 1)
4372 : d0 05 __ BNE $4379 ; (scan_edge.s5 + 0)
.s36:
4374 : e4 13 __ CPX P6 ; (y2 + 0)
4376 : d0 01 __ BNE $4379 ; (scan_edge.s5 + 0)
4378 : 60 __ __ RTS
.s5:
4379 : a5 14 __ LDA P7 ; (y2 + 1)
437b : c5 10 __ CMP P3 ; (y1 + 1)
437d : d0 08 __ BNE $4387 ; (scan_edge.s35 + 0)
.s32:
437f : a5 13 __ LDA P6 ; (y2 + 0)
4381 : c5 0f __ CMP P2 ; (y1 + 0)
.s33:
4383 : 90 08 __ BCC $438d ; (scan_edge.s31 + 0)
4385 : b0 22 __ BCS $43a9 ; (scan_edge.s6 + 0)
.s35:
4387 : 45 10 __ EOR P3 ; (y1 + 1)
4389 : 10 f8 __ BPL $4383 ; (scan_edge.s33 + 0)
.s34:
438b : 90 1c __ BCC $43a9 ; (scan_edge.s6 + 0)
.s31:
438d : a5 13 __ LDA P6 ; (y2 + 0)
438f : 86 13 __ STX P6 ; (y2 + 0)
4391 : 85 0f __ STA P2 ; (y1 + 0)
4393 : a5 14 __ LDA P7 ; (y2 + 1)
4395 : 84 14 __ STY P7 ; (y2 + 1)
4397 : 85 10 __ STA P3 ; (y1 + 1)
4399 : a5 11 __ LDA P4 ; (x2 + 0)
439b : a6 0d __ LDX P0 ; (x1 + 0)
439d : 86 11 __ STX P4 ; (x2 + 0)
439f : 85 0d __ STA P0 ; (x1 + 0)
43a1 : a5 12 __ LDA P5 ; (x2 + 1)
43a3 : a6 0e __ LDX P1 ; (x1 + 1)
43a5 : 86 12 __ STX P5 ; (x2 + 1)
43a7 : 85 0e __ STA P1 ; (x1 + 1)
.s6:
43a9 : a5 14 __ LDA P7 ; (y2 + 1)
43ab : c5 10 __ CMP P3 ; (y1 + 1)
43ad : d0 07 __ BNE $43b6 ; (scan_edge.s30 + 0)
.s27:
43af : a5 13 __ LDA P6 ; (y2 + 0)
43b1 : c5 0f __ CMP P2 ; (y1 + 0)
.s28:
43b3 : b0 08 __ BCS $43bd ; (scan_edge.s7 + 0)
43b5 : 60 __ __ RTS
.s30:
43b6 : 45 10 __ EOR P3 ; (y1 + 1)
43b8 : 10 f9 __ BPL $43b3 ; (scan_edge.s28 + 0)
.s29:
43ba : 90 01 __ BCC $43bd ; (scan_edge.s7 + 0)
43bc : 60 __ __ RTS
.s7:
43bd : a5 11 __ LDA P4 ; (x2 + 0)
43bf : 38 __ __ SEC
43c0 : e5 0d __ SBC P0 ; (x1 + 0)
43c2 : 85 1c __ STA ACCU + 1 
43c4 : a5 12 __ LDA P5 ; (x2 + 1)
43c6 : e5 0e __ SBC P1 ; (x1 + 1)
43c8 : 85 1d __ STA ACCU + 2 
43ca : 29 80 __ AND #$80
43cc : 10 02 __ BPL $43d0 ; (scan_edge.s7 + 19)
43ce : a9 ff __ LDA #$ff
43d0 : 85 1e __ STA ACCU + 3 
43d2 : 38 __ __ SEC
43d3 : a5 13 __ LDA P6 ; (y2 + 0)
43d5 : e5 0f __ SBC P2 ; (y1 + 0)
43d7 : 85 03 __ STA WORK + 0 
43d9 : a5 14 __ LDA P7 ; (y2 + 1)
43db : e5 10 __ SBC P3 ; (y1 + 1)
43dd : 85 04 __ STA WORK + 1 
43df : 0a __ __ ASL
43e0 : a9 00 __ LDA #$00
43e2 : 85 1b __ STA ACCU + 0 
43e4 : 69 ff __ ADC #$ff
43e6 : 49 ff __ EOR #$ff
43e8 : 85 05 __ STA WORK + 2 
43ea : 85 06 __ STA WORK + 3 
43ec : 20 44 4b JSR $4b44 ; (divs32 + 0)
43ef : a2 00 __ LDX #$00
43f1 : a5 10 __ LDA P3 ; (y1 + 1)
43f3 : d0 6b __ BNE $4460 ; (scan_edge.l8 + 0)
.l26:
43f5 : a5 0f __ LDA P2 ; (y1 + 0)
43f7 : c9 c8 __ CMP #$c8
43f9 : b0 65 __ BCS $4460 ; (scan_edge.l8 + 0)
.s14:
43fb : 0a __ __ ASL
43fc : 85 43 __ STA T5 + 0 
43fe : a8 __ __ TAY
43ff : a9 00 __ LDA #$00
4401 : 2a __ __ ROL
4402 : 85 44 __ STA T5 + 1 
4404 : a9 e0 __ LDA #$e0
4406 : 85 45 __ STA T6 + 0 
4408 : a9 61 __ LDA #$61
440a : 65 44 __ ADC T5 + 1 
440c : 85 46 __ STA T6 + 1 
440e : b1 45 __ LDA (T6 + 0),y 
4410 : 85 1e __ STA ACCU + 3 
4412 : a5 0e __ LDA P1 ; (x1 + 1)
4414 : c8 __ __ INY
4415 : d1 45 __ CMP (T6 + 0),y 
4417 : d0 08 __ BNE $4421 ; (scan_edge.s25 + 0)
.s22:
4419 : a5 0d __ LDA P0 ; (x1 + 0)
441b : c5 1e __ CMP ACCU + 3 
.s23:
441d : 90 08 __ BCC $4427 ; (scan_edge.s21 + 0)
441f : b0 10 __ BCS $4431 ; (scan_edge.s15 + 0)
.s25:
4421 : 51 45 __ EOR (T6 + 0),y 
4423 : 10 f8 __ BPL $441d ; (scan_edge.s23 + 0)
.s24:
4425 : 90 0a __ BCC $4431 ; (scan_edge.s15 + 0)
.s21:
4427 : a5 0d __ LDA P0 ; (x1 + 0)
4429 : 88 __ __ DEY
442a : 91 45 __ STA (T6 + 0),y 
442c : a5 0e __ LDA P1 ; (x1 + 1)
442e : c8 __ __ INY
442f : 91 45 __ STA (T6 + 0),y 
.s15:
4431 : 18 __ __ CLC
4432 : a9 70 __ LDA #$70
4434 : 65 43 __ ADC T5 + 0 
4436 : 85 43 __ STA T5 + 0 
4438 : a9 63 __ LDA #$63
443a : 65 44 __ ADC T5 + 1 
443c : 85 44 __ STA T5 + 1 
443e : a0 01 __ LDY #$01
4440 : b1 43 __ LDA (T5 + 0),y 
4442 : c5 0e __ CMP P1 ; (x1 + 1)
4444 : d0 09 __ BNE $444f ; (scan_edge.s20 + 0)
.s17:
4446 : 88 __ __ DEY
4447 : b1 43 __ LDA (T5 + 0),y 
4449 : c5 0d __ CMP P0 ; (x1 + 0)
.s18:
444b : 90 08 __ BCC $4455 ; (scan_edge.s16 + 0)
444d : b0 11 __ BCS $4460 ; (scan_edge.l8 + 0)
.s20:
444f : 45 0e __ EOR P1 ; (x1 + 1)
4451 : 10 f8 __ BPL $444b ; (scan_edge.s18 + 0)
.s19:
4453 : 90 0b __ BCC $4460 ; (scan_edge.l8 + 0)
.s16:
4455 : a5 0d __ LDA P0 ; (x1 + 0)
4457 : a0 00 __ LDY #$00
4459 : 91 43 __ STA (T5 + 0),y 
445b : a5 0e __ LDA P1 ; (x1 + 1)
445d : c8 __ __ INY
445e : 91 43 __ STA (T5 + 0),y 
.l8:
4460 : e6 0f __ INC P2 ; (y1 + 0)
4462 : d0 02 __ BNE $4466 ; (scan_edge.s38 + 0)
.s37:
4464 : e6 10 __ INC P3 ; (y1 + 1)
.s38:
4466 : a5 14 __ LDA P7 ; (y2 + 1)
4468 : c5 10 __ CMP P3 ; (y1 + 1)
446a : d0 07 __ BNE $4473 ; (scan_edge.s13 + 0)
.s10:
446c : a5 13 __ LDA P6 ; (y2 + 0)
446e : c5 0f __ CMP P2 ; (y1 + 0)
.s11:
4470 : b0 07 __ BCS $4479 ; (scan_edge.s9 + 0)
4472 : 60 __ __ RTS
.s13:
4473 : 45 10 __ EOR P3 ; (y1 + 1)
4475 : 10 f9 __ BPL $4470 ; (scan_edge.s11 + 0)
.s12:
4477 : b0 18 __ BCS $4491 ; (scan_edge.s3 + 0)
.s9:
4479 : 8a __ __ TXA
447a : 18 __ __ CLC
447b : 65 1b __ ADC ACCU + 0 
447d : aa __ __ TAX
447e : a5 0d __ LDA P0 ; (x1 + 0)
4480 : 65 1c __ ADC ACCU + 1 
4482 : 85 0d __ STA P0 ; (x1 + 0)
4484 : a5 0e __ LDA P1 ; (x1 + 1)
4486 : 65 1d __ ADC ACCU + 2 
4488 : 85 0e __ STA P1 ; (x1 + 1)
448a : a5 10 __ LDA P3 ; (y1 + 1)
448c : d0 d2 __ BNE $4460 ; (scan_edge.l8 + 0)
448e : 4c f5 43 JMP $43f5 ; (scan_edge.l26 + 0)
.s3:
4491 : 60 __ __ RTS
--------------------------------------------------------------------
keyb_poll: ; keyb_poll()->void
; 126, "D:/Arbeit/dev/oscar64/include/c64/keyboard.h"
.s4:
4492 : a9 ff __ LDA #$ff
4494 : 8d 02 dc STA $dc02 
4497 : 8d 00 dc STA $dc00 
449a : a9 00 __ LDA #$00
449c : 8d ff 4d STA $4dff ; (keyb_key + 0)
449f : ae 01 dc LDX $dc01 
44a2 : e8 __ __ INX
44a3 : d0 25 __ BNE $44ca ; (keyb_poll.s3 + 0)
.s5:
44a5 : 8d 03 dc STA $dc03 
44a8 : 8d 00 dc STA $dc00 
44ab : ad 01 dc LDA $dc01 
44ae : c9 ff __ CMP #$ff
44b0 : d0 1f __ BNE $44d1 ; (keyb_poll.s7 + 0)
.s6:
44b2 : 8d 38 4e STA $4e38 ; (keyb_matrix[0] + 0)
44b5 : 8d 39 4e STA $4e39 ; (keyb_matrix[0] + 1)
44b8 : 8d 3a 4e STA $4e3a ; (keyb_matrix[0] + 2)
44bb : 8d 3b 4e STA $4e3b ; (keyb_matrix[0] + 3)
44be : 8d 3c 4e STA $4e3c ; (keyb_matrix[0] + 4)
44c1 : 8d 3d 4e STA $4e3d ; (keyb_matrix[0] + 5)
44c4 : 8d 3e 4e STA $4e3e ; (keyb_matrix[0] + 6)
44c7 : 8d 3f 4e STA $4e3f ; (keyb_matrix[0] + 7)
.s3:
44ca : ad 40 4e LDA $4e40 ; (ciaa_pra_def + 0)
44cd : 8d 00 dc STA $dc00 
44d0 : 60 __ __ RTS
.s7:
44d1 : ad 3e 4e LDA $4e3e ; (keyb_matrix[0] + 6)
44d4 : 29 ef __ AND #$ef
44d6 : 8d 3e 4e STA $4e3e ; (keyb_matrix[0] + 6)
44d9 : ad 39 4e LDA $4e39 ; (keyb_matrix[0] + 1)
44dc : 29 7f __ AND #$7f
44de : 8d 39 4e STA $4e39 ; (keyb_matrix[0] + 1)
44e1 : a9 fe __ LDA #$fe
44e3 : 85 1b __ STA ACCU + 0 
44e5 : d0 02 __ BNE $44e9 ; (keyb_poll.l21 + 0)
.s20:
44e7 : a5 1b __ LDA ACCU + 0 
.l21:
44e9 : 8d 00 dc STA $dc00 
44ec : bd 38 4e LDA $4e38,x ; (keyb_matrix[0] + 0)
44ef : 85 1c __ STA ACCU + 1 
44f1 : ad 01 dc LDA $dc01 
44f4 : 9d 38 4e STA $4e38,x ; (keyb_matrix[0] + 0)
44f7 : 38 __ __ SEC
44f8 : 26 1b __ ROL ACCU + 0 
44fa : 49 ff __ EOR #$ff
44fc : 25 1c __ AND ACCU + 1 
44fe : f0 25 __ BEQ $4525 ; (keyb_poll.s8 + 0)
.s13:
4500 : 85 1c __ STA ACCU + 1 
4502 : 8a __ __ TXA
4503 : 0a __ __ ASL
4504 : 0a __ __ ASL
4505 : 0a __ __ ASL
4506 : 09 80 __ ORA #$80
4508 : a8 __ __ TAY
4509 : a5 1c __ LDA ACCU + 1 
450b : 29 f0 __ AND #$f0
450d : f0 04 __ BEQ $4513 ; (keyb_poll.s14 + 0)
.s19:
450f : 98 __ __ TYA
4510 : 09 04 __ ORA #$04
4512 : a8 __ __ TAY
.s14:
4513 : a5 1c __ LDA ACCU + 1 
4515 : 29 cc __ AND #$cc
4517 : f0 02 __ BEQ $451b ; (keyb_poll.s15 + 0)
.s18:
4519 : c8 __ __ INY
451a : c8 __ __ INY
.s15:
451b : a5 1c __ LDA ACCU + 1 
451d : 29 aa __ AND #$aa
451f : f0 01 __ BEQ $4522 ; (keyb_poll.s16 + 0)
.s17:
4521 : c8 __ __ INY
.s16:
4522 : 8c ff 4d STY $4dff ; (keyb_key + 0)
.s8:
4525 : e8 __ __ INX
4526 : e0 08 __ CPX #$08
4528 : 90 bd __ BCC $44e7 ; (keyb_poll.s20 + 0)
.s9:
452a : ad ff 4d LDA $4dff ; (keyb_key + 0)
452d : f0 9b __ BEQ $44ca ; (keyb_poll.s3 + 0)
.s10:
452f : 2c 39 4e BIT $4e39 ; (keyb_matrix[0] + 1)
4532 : 10 07 __ BPL $453b ; (keyb_poll.s11 + 0)
.s12:
4534 : ad 3e 4e LDA $4e3e ; (keyb_matrix[0] + 6)
4537 : 29 10 __ AND #$10
4539 : d0 8f __ BNE $44ca ; (keyb_poll.s3 + 0)
.s11:
453b : ad ff 4d LDA $4dff ; (keyb_key + 0)
453e : 09 40 __ ORA #$40
4540 : 8d ff 4d STA $4dff ; (keyb_key + 0)
4543 : b0 85 __ BCS $44ca ; (keyb_poll.s3 + 0)
--------------------------------------------------------------------
DoTranslate: ; DoTranslate(i16,i16,i16,i16)->void
; 545, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
4545 : ad ef cf LDA $cfef ; (sstack + 28)
4548 : 85 0d __ STA P0 
454a : ad f0 cf LDA $cff0 ; (sstack + 29)
454d : 85 0e __ STA P1 
454f : ad f1 cf LDA $cff1 ; (sstack + 30)
4552 : 85 0f __ STA P2 
4554 : ad f2 cf LDA $cff2 ; (sstack + 31)
4557 : 85 10 __ STA P3 
4559 : ad 18 4e LDA $4e18 ; (c + 0)
455c : 85 11 __ STA P4 
455e : ad 19 4e LDA $4e19 ; (c + 1)
4561 : 85 12 __ STA P5 
4563 : 20 78 45 JSR $4578 ; (Translate.s4 + 0)
4566 : 20 6e 25 JSR $256e ; (ultra_fast_clear.s4 + 0)
4569 : ad f3 cf LDA $cff3 ; (sstack + 32)
456c : 8d ed cf STA $cfed ; (sstack + 26)
456f : ad f4 cf LDA $cff4 ; (sstack + 33)
4572 : 8d ee cf STA $cfee ; (sstack + 27)
4575 : 4c 3b 30 JMP $303b ; (sort_and_render_faces.s1 + 0)
--------------------------------------------------------------------
Translate: ; Translate(i16,i16,i16)->void
; 526, "D:/Arbeit/dev/OscarTutorials-main/5000 VectorAnimXor/3dengine64.c"
.s4:
4578 : ad 2a 4e LDA $4e2a ; (vy_pct + 0)
457b : 85 1b __ STA ACCU + 0 
457d : ad 2b 4e LDA $4e2b ; (vy_pct + 1)
4580 : 85 1c __ STA ACCU + 1 
4582 : a5 0e __ LDA P1 ; (DX + 1)
4584 : 05 0d __ ORA P0 ; (DX + 0)
4586 : f0 3f __ BEQ $45c7 ; (Translate.s5 + 0)
.s9:
4588 : a5 12 __ LDA P5 ; (num_points + 1)
458a : 30 3b __ BMI $45c7 ; (Translate.s5 + 0)
.s12:
458c : 05 11 __ ORA P4 ; (num_points + 0)
458e : f0 37 __ BEQ $45c7 ; (Translate.s5 + 0)
.s10:
4590 : a5 11 __ LDA P4 ; (num_points + 0)
4592 : 85 1d __ STA ACCU + 2 
4594 : ad 28 4e LDA $4e28 ; (vx_pct + 0)
4597 : 85 43 __ STA T3 + 0 
4599 : ad 29 4e LDA $4e29 ; (vx_pct + 1)
459c : 85 44 __ STA T3 + 1 
459e : a6 12 __ LDX P5 ; (num_points + 1)
.l11:
45a0 : 18 __ __ CLC
45a1 : a0 00 __ LDY #$00
45a3 : b1 43 __ LDA (T3 + 0),y 
45a5 : 65 0d __ ADC P0 ; (DX + 0)
45a7 : 91 43 __ STA (T3 + 0),y 
45a9 : c8 __ __ INY
45aa : b1 43 __ LDA (T3 + 0),y 
45ac : 65 0e __ ADC P1 ; (DX + 1)
45ae : 91 43 __ STA (T3 + 0),y 
45b0 : 18 __ __ CLC
45b1 : a5 43 __ LDA T3 + 0 
45b3 : 69 02 __ ADC #$02
45b5 : 85 43 __ STA T3 + 0 
45b7 : 90 02 __ BCC $45bb ; (Translate.s18 + 0)
.s17:
45b9 : e6 44 __ INC T3 + 1 
.s18:
45bb : a5 1d __ LDA ACCU + 2 
45bd : d0 01 __ BNE $45c0 ; (Translate.s15 + 0)
.s14:
45bf : ca __ __ DEX
.s15:
45c0 : c6 1d __ DEC ACCU + 2 
45c2 : d0 dc __ BNE $45a0 ; (Translate.l11 + 0)
.s16:
45c4 : 8a __ __ TXA
45c5 : d0 d9 __ BNE $45a0 ; (Translate.l11 + 0)
.s5:
45c7 : a5 10 __ LDA P3 ; (DY + 1)
45c9 : 05 0f __ ORA P2 ; (DY + 0)
45cb : f0 31 __ BEQ $45fe ; (Translate.s3 + 0)
.s6:
45cd : a5 12 __ LDA P5 ; (num_points + 1)
45cf : 30 2d __ BMI $45fe ; (Translate.s3 + 0)
.s8:
45d1 : 05 11 __ ORA P4 ; (num_points + 0)
45d3 : f0 29 __ BEQ $45fe ; (Translate.s3 + 0)
.s13:
45d5 : a6 12 __ LDX P5 ; (num_points + 1)
.l7:
45d7 : 18 __ __ CLC
45d8 : a0 00 __ LDY #$00
45da : b1 1b __ LDA (ACCU + 0),y 
45dc : 65 0f __ ADC P2 ; (DY + 0)
45de : 91 1b __ STA (ACCU + 0),y 
45e0 : c8 __ __ INY
45e1 : b1 1b __ LDA (ACCU + 0),y 
45e3 : 65 10 __ ADC P3 ; (DY + 1)
45e5 : 91 1b __ STA (ACCU + 0),y 
45e7 : 18 __ __ CLC
45e8 : a5 1b __ LDA ACCU + 0 
45ea : 69 02 __ ADC #$02
45ec : 85 1b __ STA ACCU + 0 
45ee : 90 02 __ BCC $45f2 ; (Translate.s23 + 0)
.s22:
45f0 : e6 1c __ INC ACCU + 1 
.s23:
45f2 : a5 11 __ LDA P4 ; (num_points + 0)
45f4 : d0 01 __ BNE $45f7 ; (Translate.s20 + 0)
.s19:
45f6 : ca __ __ DEX
.s20:
45f7 : c6 11 __ DEC P4 ; (num_points + 0)
45f9 : d0 dc __ BNE $45d7 ; (Translate.l7 + 0)
.s21:
45fb : 8a __ __ TXA
45fc : d0 d9 __ BNE $45d7 ; (Translate.l7 + 0)
.s3:
45fe : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
45ff : 4a __ __ LSR
4600 : f0 2e __ BEQ $4630 ; (mul16by8 + 49)
4602 : a2 00 __ LDX #$00
4604 : a0 00 __ LDY #$00
4606 : 90 13 __ BCC $461b ; (mul16by8 + 28)
4608 : a4 1b __ LDY ACCU + 0 
460a : a6 1c __ LDX ACCU + 1 
460c : b0 0d __ BCS $461b ; (mul16by8 + 28)
460e : 85 02 __ STA $02 
4610 : 18 __ __ CLC
4611 : 98 __ __ TYA
4612 : 65 1b __ ADC ACCU + 0 
4614 : a8 __ __ TAY
4615 : 8a __ __ TXA
4616 : 65 1c __ ADC ACCU + 1 
4618 : aa __ __ TAX
4619 : a5 02 __ LDA $02 
461b : 06 1b __ ASL ACCU + 0 
461d : 26 1c __ ROL ACCU + 1 
461f : 4a __ __ LSR
4620 : 90 f9 __ BCC $461b ; (mul16by8 + 28)
4622 : d0 ea __ BNE $460e ; (mul16by8 + 15)
4624 : 18 __ __ CLC
4625 : 98 __ __ TYA
4626 : 65 1b __ ADC ACCU + 0 
4628 : 85 1b __ STA ACCU + 0 
462a : 8a __ __ TXA
462b : 65 1c __ ADC ACCU + 1 
462d : 85 1c __ STA ACCU + 1 
462f : 60 __ __ RTS
4630 : b0 04 __ BCS $4636 ; (mul16by8 + 55)
4632 : 85 1b __ STA ACCU + 0 
4634 : 85 1c __ STA ACCU + 1 
4636 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
4637 : a0 00 __ LDY #$00
4639 : 84 07 __ STY WORK + 4 
463b : 84 08 __ STY WORK + 5 
463d : 84 09 __ STY WORK + 6 
463f : 4a __ __ LSR
4640 : b0 0d __ BCS $464f ; (mul32by8 + 24)
4642 : f0 26 __ BEQ $466a ; (mul32by8 + 51)
4644 : 06 1b __ ASL ACCU + 0 
4646 : 26 1c __ ROL ACCU + 1 
4648 : 26 1d __ ROL ACCU + 2 
464a : 26 1e __ ROL ACCU + 3 
464c : 4a __ __ LSR
464d : 90 f5 __ BCC $4644 ; (mul32by8 + 13)
464f : aa __ __ TAX
4650 : 18 __ __ CLC
4651 : a5 07 __ LDA WORK + 4 
4653 : 65 1b __ ADC ACCU + 0 
4655 : 85 07 __ STA WORK + 4 
4657 : a5 08 __ LDA WORK + 5 
4659 : 65 1c __ ADC ACCU + 1 
465b : 85 08 __ STA WORK + 5 
465d : a5 09 __ LDA WORK + 6 
465f : 65 1d __ ADC ACCU + 2 
4661 : 85 09 __ STA WORK + 6 
4663 : 98 __ __ TYA
4664 : 65 1e __ ADC ACCU + 3 
4666 : a8 __ __ TAY
4667 : 8a __ __ TXA
4668 : d0 da __ BNE $4644 ; (mul32by8 + 13)
466a : 84 0a __ STY WORK + 7 
466c : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
466d : b1 19 __ LDA (IP + 0),y 
466f : c8 __ __ INY
4670 : aa __ __ TAX
4671 : b5 00 __ LDA $00,x 
4673 : 85 03 __ STA WORK + 0 
4675 : b5 01 __ LDA $01,x 
4677 : 85 04 __ STA WORK + 1 
4679 : b5 02 __ LDA $02,x 
467b : 85 05 __ STA WORK + 2 
467d : b5 03 __ LDA WORK + 0,x 
467f : 85 06 __ STA WORK + 3 
4681 : a5 05 __ LDA WORK + 2 
4683 : 0a __ __ ASL
4684 : a5 06 __ LDA WORK + 3 
4686 : 2a __ __ ROL
4687 : 85 08 __ STA WORK + 5 
4689 : f0 06 __ BEQ $4691 ; (freg + 36)
468b : a5 05 __ LDA WORK + 2 
468d : 09 80 __ ORA #$80
468f : 85 05 __ STA WORK + 2 
4691 : a5 1d __ LDA ACCU + 2 
4693 : 0a __ __ ASL
4694 : a5 1e __ LDA ACCU + 3 
4696 : 2a __ __ ROL
4697 : 85 07 __ STA WORK + 4 
4699 : f0 06 __ BEQ $46a1 ; (freg + 52)
469b : a5 1d __ LDA ACCU + 2 
469d : 09 80 __ ORA #$80
469f : 85 1d __ STA ACCU + 2 
46a1 : 60 __ __ RTS
46a2 : 06 1e __ ASL ACCU + 3 
46a4 : a5 07 __ LDA WORK + 4 
46a6 : 6a __ __ ROR
46a7 : 85 1e __ STA ACCU + 3 
46a9 : b0 06 __ BCS $46b1 ; (freg + 68)
46ab : a5 1d __ LDA ACCU + 2 
46ad : 29 7f __ AND #$7f
46af : 85 1d __ STA ACCU + 2 
46b1 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
46b2 : a5 06 __ LDA WORK + 3 
46b4 : 49 80 __ EOR #$80
46b6 : 85 06 __ STA WORK + 3 
46b8 : a9 ff __ LDA #$ff
46ba : c5 07 __ CMP WORK + 4 
46bc : f0 04 __ BEQ $46c2 ; (faddsub + 16)
46be : c5 08 __ CMP WORK + 5 
46c0 : d0 11 __ BNE $46d3 ; (faddsub + 33)
46c2 : a5 1e __ LDA ACCU + 3 
46c4 : 09 7f __ ORA #$7f
46c6 : 85 1e __ STA ACCU + 3 
46c8 : a9 80 __ LDA #$80
46ca : 85 1d __ STA ACCU + 2 
46cc : a9 00 __ LDA #$00
46ce : 85 1b __ STA ACCU + 0 
46d0 : 85 1c __ STA ACCU + 1 
46d2 : 60 __ __ RTS
46d3 : 38 __ __ SEC
46d4 : a5 07 __ LDA WORK + 4 
46d6 : e5 08 __ SBC WORK + 5 
46d8 : f0 38 __ BEQ $4712 ; (faddsub + 96)
46da : aa __ __ TAX
46db : b0 25 __ BCS $4702 ; (faddsub + 80)
46dd : e0 e9 __ CPX #$e9
46df : b0 0e __ BCS $46ef ; (faddsub + 61)
46e1 : a5 08 __ LDA WORK + 5 
46e3 : 85 07 __ STA WORK + 4 
46e5 : a9 00 __ LDA #$00
46e7 : 85 1b __ STA ACCU + 0 
46e9 : 85 1c __ STA ACCU + 1 
46eb : 85 1d __ STA ACCU + 2 
46ed : f0 23 __ BEQ $4712 ; (faddsub + 96)
46ef : a5 1d __ LDA ACCU + 2 
46f1 : 4a __ __ LSR
46f2 : 66 1c __ ROR ACCU + 1 
46f4 : 66 1b __ ROR ACCU + 0 
46f6 : e8 __ __ INX
46f7 : d0 f8 __ BNE $46f1 ; (faddsub + 63)
46f9 : 85 1d __ STA ACCU + 2 
46fb : a5 08 __ LDA WORK + 5 
46fd : 85 07 __ STA WORK + 4 
46ff : 4c 12 47 JMP $4712 ; (faddsub + 96)
4702 : e0 18 __ CPX #$18
4704 : b0 33 __ BCS $4739 ; (faddsub + 135)
4706 : a5 05 __ LDA WORK + 2 
4708 : 4a __ __ LSR
4709 : 66 04 __ ROR WORK + 1 
470b : 66 03 __ ROR WORK + 0 
470d : ca __ __ DEX
470e : d0 f8 __ BNE $4708 ; (faddsub + 86)
4710 : 85 05 __ STA WORK + 2 
4712 : a5 1e __ LDA ACCU + 3 
4714 : 29 80 __ AND #$80
4716 : 85 1e __ STA ACCU + 3 
4718 : 45 06 __ EOR WORK + 3 
471a : 30 31 __ BMI $474d ; (faddsub + 155)
471c : 18 __ __ CLC
471d : a5 1b __ LDA ACCU + 0 
471f : 65 03 __ ADC WORK + 0 
4721 : 85 1b __ STA ACCU + 0 
4723 : a5 1c __ LDA ACCU + 1 
4725 : 65 04 __ ADC WORK + 1 
4727 : 85 1c __ STA ACCU + 1 
4729 : a5 1d __ LDA ACCU + 2 
472b : 65 05 __ ADC WORK + 2 
472d : 85 1d __ STA ACCU + 2 
472f : 90 08 __ BCC $4739 ; (faddsub + 135)
4731 : 66 1d __ ROR ACCU + 2 
4733 : 66 1c __ ROR ACCU + 1 
4735 : 66 1b __ ROR ACCU + 0 
4737 : e6 07 __ INC WORK + 4 
4739 : a5 07 __ LDA WORK + 4 
473b : c9 ff __ CMP #$ff
473d : f0 83 __ BEQ $46c2 ; (faddsub + 16)
473f : 4a __ __ LSR
4740 : 05 1e __ ORA ACCU + 3 
4742 : 85 1e __ STA ACCU + 3 
4744 : b0 06 __ BCS $474c ; (faddsub + 154)
4746 : a5 1d __ LDA ACCU + 2 
4748 : 29 7f __ AND #$7f
474a : 85 1d __ STA ACCU + 2 
474c : 60 __ __ RTS
474d : 38 __ __ SEC
474e : a5 1b __ LDA ACCU + 0 
4750 : e5 03 __ SBC WORK + 0 
4752 : 85 1b __ STA ACCU + 0 
4754 : a5 1c __ LDA ACCU + 1 
4756 : e5 04 __ SBC WORK + 1 
4758 : 85 1c __ STA ACCU + 1 
475a : a5 1d __ LDA ACCU + 2 
475c : e5 05 __ SBC WORK + 2 
475e : 85 1d __ STA ACCU + 2 
4760 : b0 19 __ BCS $477b ; (faddsub + 201)
4762 : 38 __ __ SEC
4763 : a9 00 __ LDA #$00
4765 : e5 1b __ SBC ACCU + 0 
4767 : 85 1b __ STA ACCU + 0 
4769 : a9 00 __ LDA #$00
476b : e5 1c __ SBC ACCU + 1 
476d : 85 1c __ STA ACCU + 1 
476f : a9 00 __ LDA #$00
4771 : e5 1d __ SBC ACCU + 2 
4773 : 85 1d __ STA ACCU + 2 
4775 : a5 1e __ LDA ACCU + 3 
4777 : 49 80 __ EOR #$80
4779 : 85 1e __ STA ACCU + 3 
477b : a5 1d __ LDA ACCU + 2 
477d : 30 ba __ BMI $4739 ; (faddsub + 135)
477f : 05 1c __ ORA ACCU + 1 
4781 : 05 1b __ ORA ACCU + 0 
4783 : f0 0f __ BEQ $4794 ; (faddsub + 226)
4785 : c6 07 __ DEC WORK + 4 
4787 : f0 0b __ BEQ $4794 ; (faddsub + 226)
4789 : 06 1b __ ASL ACCU + 0 
478b : 26 1c __ ROL ACCU + 1 
478d : 26 1d __ ROL ACCU + 2 
478f : 10 f4 __ BPL $4785 ; (faddsub + 211)
4791 : 4c 39 47 JMP $4739 ; (faddsub + 135)
4794 : a9 00 __ LDA #$00
4796 : 85 1b __ STA ACCU + 0 
4798 : 85 1c __ STA ACCU + 1 
479a : 85 1d __ STA ACCU + 2 
479c : 85 1e __ STA ACCU + 3 
479e : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
479f : a5 1b __ LDA ACCU + 0 
47a1 : 05 1c __ ORA ACCU + 1 
47a3 : 05 1d __ ORA ACCU + 2 
47a5 : f0 0e __ BEQ $47b5 ; (crt_fmul + 22)
47a7 : a5 03 __ LDA WORK + 0 
47a9 : 05 04 __ ORA WORK + 1 
47ab : 05 05 __ ORA WORK + 2 
47ad : d0 09 __ BNE $47b8 ; (crt_fmul + 25)
47af : 85 1b __ STA ACCU + 0 
47b1 : 85 1c __ STA ACCU + 1 
47b3 : 85 1d __ STA ACCU + 2 
47b5 : 85 1e __ STA ACCU + 3 
47b7 : 60 __ __ RTS
47b8 : a5 1e __ LDA ACCU + 3 
47ba : 45 06 __ EOR WORK + 3 
47bc : 29 80 __ AND #$80
47be : 85 1e __ STA ACCU + 3 
47c0 : a9 ff __ LDA #$ff
47c2 : c5 07 __ CMP WORK + 4 
47c4 : f0 42 __ BEQ $4808 ; (crt_fmul + 105)
47c6 : c5 08 __ CMP WORK + 5 
47c8 : f0 3e __ BEQ $4808 ; (crt_fmul + 105)
47ca : a9 00 __ LDA #$00
47cc : 85 09 __ STA WORK + 6 
47ce : 85 0a __ STA WORK + 7 
47d0 : 85 0b __ STA WORK + 8 
47d2 : a4 1b __ LDY ACCU + 0 
47d4 : a5 03 __ LDA WORK + 0 
47d6 : d0 06 __ BNE $47de ; (crt_fmul + 63)
47d8 : a5 04 __ LDA WORK + 1 
47da : f0 0a __ BEQ $47e6 ; (crt_fmul + 71)
47dc : d0 05 __ BNE $47e3 ; (crt_fmul + 68)
47de : 20 39 48 JSR $4839 ; (crt_fmul8 + 0)
47e1 : a5 04 __ LDA WORK + 1 
47e3 : 20 39 48 JSR $4839 ; (crt_fmul8 + 0)
47e6 : a5 05 __ LDA WORK + 2 
47e8 : 20 39 48 JSR $4839 ; (crt_fmul8 + 0)
47eb : 38 __ __ SEC
47ec : a5 0b __ LDA WORK + 8 
47ee : 30 06 __ BMI $47f6 ; (crt_fmul + 87)
47f0 : 06 09 __ ASL WORK + 6 
47f2 : 26 0a __ ROL WORK + 7 
47f4 : 2a __ __ ROL
47f5 : 18 __ __ CLC
47f6 : 29 7f __ AND #$7f
47f8 : 85 0b __ STA WORK + 8 
47fa : a5 07 __ LDA WORK + 4 
47fc : 65 08 __ ADC WORK + 5 
47fe : 90 19 __ BCC $4819 ; (crt_fmul + 122)
4800 : e9 7f __ SBC #$7f
4802 : b0 04 __ BCS $4808 ; (crt_fmul + 105)
4804 : c9 ff __ CMP #$ff
4806 : d0 15 __ BNE $481d ; (crt_fmul + 126)
4808 : a5 1e __ LDA ACCU + 3 
480a : 09 7f __ ORA #$7f
480c : 85 1e __ STA ACCU + 3 
480e : a9 80 __ LDA #$80
4810 : 85 1d __ STA ACCU + 2 
4812 : a9 00 __ LDA #$00
4814 : 85 1b __ STA ACCU + 0 
4816 : 85 1c __ STA ACCU + 1 
4818 : 60 __ __ RTS
4819 : e9 7e __ SBC #$7e
481b : 90 15 __ BCC $4832 ; (crt_fmul + 147)
481d : 4a __ __ LSR
481e : 05 1e __ ORA ACCU + 3 
4820 : 85 1e __ STA ACCU + 3 
4822 : a9 00 __ LDA #$00
4824 : 6a __ __ ROR
4825 : 05 0b __ ORA WORK + 8 
4827 : 85 1d __ STA ACCU + 2 
4829 : a5 0a __ LDA WORK + 7 
482b : 85 1c __ STA ACCU + 1 
482d : a5 09 __ LDA WORK + 6 
482f : 85 1b __ STA ACCU + 0 
4831 : 60 __ __ RTS
4832 : a9 00 __ LDA #$00
4834 : 85 1e __ STA ACCU + 3 
4836 : f0 d8 __ BEQ $4810 ; (crt_fmul + 113)
4838 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
4839 : 38 __ __ SEC
483a : 6a __ __ ROR
483b : 90 1e __ BCC $485b ; (crt_fmul8 + 34)
483d : aa __ __ TAX
483e : 18 __ __ CLC
483f : 98 __ __ TYA
4840 : 65 09 __ ADC WORK + 6 
4842 : 85 09 __ STA WORK + 6 
4844 : a5 0a __ LDA WORK + 7 
4846 : 65 1c __ ADC ACCU + 1 
4848 : 85 0a __ STA WORK + 7 
484a : a5 0b __ LDA WORK + 8 
484c : 65 1d __ ADC ACCU + 2 
484e : 6a __ __ ROR
484f : 85 0b __ STA WORK + 8 
4851 : 8a __ __ TXA
4852 : 66 0a __ ROR WORK + 7 
4854 : 66 09 __ ROR WORK + 6 
4856 : 4a __ __ LSR
4857 : f0 0d __ BEQ $4866 ; (crt_fmul8 + 45)
4859 : b0 e2 __ BCS $483d ; (crt_fmul8 + 4)
485b : 66 0b __ ROR WORK + 8 
485d : 66 0a __ ROR WORK + 7 
485f : 66 09 __ ROR WORK + 6 
4861 : 4a __ __ LSR
4862 : 90 f7 __ BCC $485b ; (crt_fmul8 + 34)
4864 : d0 d7 __ BNE $483d ; (crt_fmul8 + 4)
4866 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
4867 : a5 1b __ LDA ACCU + 0 
4869 : 05 1c __ ORA ACCU + 1 
486b : 05 1d __ ORA ACCU + 2 
486d : d0 03 __ BNE $4872 ; (crt_fdiv + 11)
486f : 85 1e __ STA ACCU + 3 
4871 : 60 __ __ RTS
4872 : a5 1e __ LDA ACCU + 3 
4874 : 45 06 __ EOR WORK + 3 
4876 : 29 80 __ AND #$80
4878 : 85 1e __ STA ACCU + 3 
487a : a5 08 __ LDA WORK + 5 
487c : f0 62 __ BEQ $48e0 ; (crt_fdiv + 121)
487e : a5 07 __ LDA WORK + 4 
4880 : c9 ff __ CMP #$ff
4882 : f0 5c __ BEQ $48e0 ; (crt_fdiv + 121)
4884 : a9 00 __ LDA #$00
4886 : 85 09 __ STA WORK + 6 
4888 : 85 0a __ STA WORK + 7 
488a : 85 0b __ STA WORK + 8 
488c : a2 18 __ LDX #$18
488e : a5 1b __ LDA ACCU + 0 
4890 : c5 03 __ CMP WORK + 0 
4892 : a5 1c __ LDA ACCU + 1 
4894 : e5 04 __ SBC WORK + 1 
4896 : a5 1d __ LDA ACCU + 2 
4898 : e5 05 __ SBC WORK + 2 
489a : 90 13 __ BCC $48af ; (crt_fdiv + 72)
489c : a5 1b __ LDA ACCU + 0 
489e : e5 03 __ SBC WORK + 0 
48a0 : 85 1b __ STA ACCU + 0 
48a2 : a5 1c __ LDA ACCU + 1 
48a4 : e5 04 __ SBC WORK + 1 
48a6 : 85 1c __ STA ACCU + 1 
48a8 : a5 1d __ LDA ACCU + 2 
48aa : e5 05 __ SBC WORK + 2 
48ac : 85 1d __ STA ACCU + 2 
48ae : 38 __ __ SEC
48af : 26 09 __ ROL WORK + 6 
48b1 : 26 0a __ ROL WORK + 7 
48b3 : 26 0b __ ROL WORK + 8 
48b5 : ca __ __ DEX
48b6 : f0 0a __ BEQ $48c2 ; (crt_fdiv + 91)
48b8 : 06 1b __ ASL ACCU + 0 
48ba : 26 1c __ ROL ACCU + 1 
48bc : 26 1d __ ROL ACCU + 2 
48be : b0 dc __ BCS $489c ; (crt_fdiv + 53)
48c0 : 90 cc __ BCC $488e ; (crt_fdiv + 39)
48c2 : 38 __ __ SEC
48c3 : a5 0b __ LDA WORK + 8 
48c5 : 30 06 __ BMI $48cd ; (crt_fdiv + 102)
48c7 : 06 09 __ ASL WORK + 6 
48c9 : 26 0a __ ROL WORK + 7 
48cb : 2a __ __ ROL
48cc : 18 __ __ CLC
48cd : 29 7f __ AND #$7f
48cf : 85 0b __ STA WORK + 8 
48d1 : a5 07 __ LDA WORK + 4 
48d3 : e5 08 __ SBC WORK + 5 
48d5 : 90 1a __ BCC $48f1 ; (crt_fdiv + 138)
48d7 : 18 __ __ CLC
48d8 : 69 7f __ ADC #$7f
48da : b0 04 __ BCS $48e0 ; (crt_fdiv + 121)
48dc : c9 ff __ CMP #$ff
48de : d0 15 __ BNE $48f5 ; (crt_fdiv + 142)
48e0 : a5 1e __ LDA ACCU + 3 
48e2 : 09 7f __ ORA #$7f
48e4 : 85 1e __ STA ACCU + 3 
48e6 : a9 80 __ LDA #$80
48e8 : 85 1d __ STA ACCU + 2 
48ea : a9 00 __ LDA #$00
48ec : 85 1c __ STA ACCU + 1 
48ee : 85 1b __ STA ACCU + 0 
48f0 : 60 __ __ RTS
48f1 : 69 7f __ ADC #$7f
48f3 : 90 15 __ BCC $490a ; (crt_fdiv + 163)
48f5 : 4a __ __ LSR
48f6 : 05 1e __ ORA ACCU + 3 
48f8 : 85 1e __ STA ACCU + 3 
48fa : a9 00 __ LDA #$00
48fc : 6a __ __ ROR
48fd : 05 0b __ ORA WORK + 8 
48ff : 85 1d __ STA ACCU + 2 
4901 : a5 0a __ LDA WORK + 7 
4903 : 85 1c __ STA ACCU + 1 
4905 : a5 09 __ LDA WORK + 6 
4907 : 85 1b __ STA ACCU + 0 
4909 : 60 __ __ RTS
490a : a9 00 __ LDA #$00
490c : 85 1e __ STA ACCU + 3 
490e : 85 1d __ STA ACCU + 2 
4910 : 85 1c __ STA ACCU + 1 
4912 : 85 1b __ STA ACCU + 0 
4914 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
4915 : a0 00 __ LDY #$00
4917 : 84 06 __ STY WORK + 3 
4919 : a5 03 __ LDA WORK + 0 
491b : a6 04 __ LDX WORK + 1 
491d : f0 1c __ BEQ $493b ; (mul16 + 38)
491f : 38 __ __ SEC
4920 : 6a __ __ ROR
4921 : 90 0d __ BCC $4930 ; (mul16 + 27)
4923 : aa __ __ TAX
4924 : 18 __ __ CLC
4925 : 98 __ __ TYA
4926 : 65 1b __ ADC ACCU + 0 
4928 : a8 __ __ TAY
4929 : a5 06 __ LDA WORK + 3 
492b : 65 1c __ ADC ACCU + 1 
492d : 85 06 __ STA WORK + 3 
492f : 8a __ __ TXA
4930 : 06 1b __ ASL ACCU + 0 
4932 : 26 1c __ ROL ACCU + 1 
4934 : 4a __ __ LSR
4935 : 90 f9 __ BCC $4930 ; (mul16 + 27)
4937 : d0 ea __ BNE $4923 ; (mul16 + 14)
4939 : a5 04 __ LDA WORK + 1 
493b : 4a __ __ LSR
493c : 90 0d __ BCC $494b ; (mul16 + 54)
493e : aa __ __ TAX
493f : 18 __ __ CLC
4940 : 98 __ __ TYA
4941 : 65 1b __ ADC ACCU + 0 
4943 : a8 __ __ TAY
4944 : a5 06 __ LDA WORK + 3 
4946 : 65 1c __ ADC ACCU + 1 
4948 : 85 06 __ STA WORK + 3 
494a : 8a __ __ TXA
494b : 06 1b __ ASL ACCU + 0 
494d : 26 1c __ ROL ACCU + 1 
494f : 4a __ __ LSR
4950 : b0 ec __ BCS $493e ; (mul16 + 41)
4952 : d0 f7 __ BNE $494b ; (mul16 + 54)
4954 : 84 05 __ STY WORK + 2 
4956 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
4957 : 24 1c __ BIT ACCU + 1 
4959 : 10 0d __ BPL $4968 ; (divs16 + 17)
495b : 20 75 49 JSR $4975 ; (negaccu + 0)
495e : 24 04 __ BIT WORK + 1 
4960 : 10 0d __ BPL $496f ; (divs16 + 24)
4962 : 20 83 49 JSR $4983 ; (negtmp + 0)
4965 : 4c 91 49 JMP $4991 ; (divmod + 0)
4968 : 24 04 __ BIT WORK + 1 
496a : 10 f9 __ BPL $4965 ; (divs16 + 14)
496c : 20 83 49 JSR $4983 ; (negtmp + 0)
496f : 20 91 49 JSR $4991 ; (divmod + 0)
4972 : 4c 75 49 JMP $4975 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
4975 : 38 __ __ SEC
4976 : a9 00 __ LDA #$00
4978 : e5 1b __ SBC ACCU + 0 
497a : 85 1b __ STA ACCU + 0 
497c : a9 00 __ LDA #$00
497e : e5 1c __ SBC ACCU + 1 
4980 : 85 1c __ STA ACCU + 1 
4982 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
4983 : 38 __ __ SEC
4984 : a9 00 __ LDA #$00
4986 : e5 03 __ SBC WORK + 0 
4988 : 85 03 __ STA WORK + 0 
498a : a9 00 __ LDA #$00
498c : e5 04 __ SBC WORK + 1 
498e : 85 04 __ STA WORK + 1 
4990 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4991 : a5 1c __ LDA ACCU + 1 
4993 : d0 3b __ BNE $49d0 ; (divmod + 63)
4995 : a5 04 __ LDA WORK + 1 
4997 : d0 1e __ BNE $49b7 ; (divmod + 38)
4999 : 85 06 __ STA WORK + 3 
499b : a2 04 __ LDX #$04
499d : 06 1b __ ASL ACCU + 0 
499f : 2a __ __ ROL
49a0 : c5 03 __ CMP WORK + 0 
49a2 : 90 02 __ BCC $49a6 ; (divmod + 21)
49a4 : e5 03 __ SBC WORK + 0 
49a6 : 26 1b __ ROL ACCU + 0 
49a8 : 2a __ __ ROL
49a9 : c5 03 __ CMP WORK + 0 
49ab : 90 02 __ BCC $49af ; (divmod + 30)
49ad : e5 03 __ SBC WORK + 0 
49af : 26 1b __ ROL ACCU + 0 
49b1 : ca __ __ DEX
49b2 : d0 eb __ BNE $499f ; (divmod + 14)
49b4 : 85 05 __ STA WORK + 2 
49b6 : 60 __ __ RTS
49b7 : a5 1b __ LDA ACCU + 0 
49b9 : 85 05 __ STA WORK + 2 
49bb : a5 1c __ LDA ACCU + 1 
49bd : 85 06 __ STA WORK + 3 
49bf : a9 00 __ LDA #$00
49c1 : 85 1b __ STA ACCU + 0 
49c3 : 85 1c __ STA ACCU + 1 
49c5 : 60 __ __ RTS
49c6 : 85 03 __ STA WORK + 0 
49c8 : a9 00 __ LDA #$00
49ca : 85 04 __ STA WORK + 1 
49cc : a5 1c __ LDA ACCU + 1 
49ce : f0 c9 __ BEQ $4999 ; (divmod + 8)
49d0 : a5 04 __ LDA WORK + 1 
49d2 : d0 1f __ BNE $49f3 ; (divmod + 98)
49d4 : a5 03 __ LDA WORK + 0 
49d6 : 30 1b __ BMI $49f3 ; (divmod + 98)
49d8 : a9 00 __ LDA #$00
49da : 85 06 __ STA WORK + 3 
49dc : a2 10 __ LDX #$10
49de : 06 1b __ ASL ACCU + 0 
49e0 : 26 1c __ ROL ACCU + 1 
49e2 : 2a __ __ ROL
49e3 : c5 03 __ CMP WORK + 0 
49e5 : 90 02 __ BCC $49e9 ; (divmod + 88)
49e7 : e5 03 __ SBC WORK + 0 
49e9 : 26 1b __ ROL ACCU + 0 
49eb : 26 1c __ ROL ACCU + 1 
49ed : ca __ __ DEX
49ee : d0 f2 __ BNE $49e2 ; (divmod + 81)
49f0 : 85 05 __ STA WORK + 2 
49f2 : 60 __ __ RTS
49f3 : a9 00 __ LDA #$00
49f5 : 85 05 __ STA WORK + 2 
49f7 : 85 06 __ STA WORK + 3 
49f9 : a0 10 __ LDY #$10
49fb : 18 __ __ CLC
49fc : 26 1b __ ROL ACCU + 0 
49fe : 26 1c __ ROL ACCU + 1 
4a00 : 26 05 __ ROL WORK + 2 
4a02 : 26 06 __ ROL WORK + 3 
4a04 : 38 __ __ SEC
4a05 : a5 05 __ LDA WORK + 2 
4a07 : e5 03 __ SBC WORK + 0 
4a09 : aa __ __ TAX
4a0a : a5 06 __ LDA WORK + 3 
4a0c : e5 04 __ SBC WORK + 1 
4a0e : 90 04 __ BCC $4a14 ; (divmod + 131)
4a10 : 86 05 __ STX WORK + 2 
4a12 : 85 06 __ STA WORK + 3 
4a14 : 88 __ __ DEY
4a15 : d0 e5 __ BNE $49fc ; (divmod + 107)
4a17 : 26 1b __ ROL ACCU + 0 
4a19 : 26 1c __ ROL ACCU + 1 
4a1b : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
4a1c : 24 1c __ BIT ACCU + 1 
4a1e : 10 10 __ BPL $4a30 ; (mods16 + 20)
4a20 : 20 75 49 JSR $4975 ; (negaccu + 0)
4a23 : 24 04 __ BIT WORK + 1 
4a25 : 10 03 __ BPL $4a2a ; (mods16 + 14)
4a27 : 20 83 49 JSR $4983 ; (negtmp + 0)
4a2a : 20 91 49 JSR $4991 ; (divmod + 0)
4a2d : 4c 3b 4a JMP $4a3b ; (negtmpb + 0)
4a30 : 24 04 __ BIT WORK + 1 
4a32 : 10 03 __ BPL $4a37 ; (mods16 + 27)
4a34 : 20 83 49 JSR $4983 ; (negtmp + 0)
4a37 : 4c 91 49 JMP $4991 ; (divmod + 0)
4a3a : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
4a3b : 38 __ __ SEC
4a3c : a9 00 __ LDA #$00
4a3e : e5 05 __ SBC WORK + 2 
4a40 : 85 05 __ STA WORK + 2 
4a42 : a9 00 __ LDA #$00
4a44 : e5 06 __ SBC WORK + 3 
4a46 : 85 06 __ STA WORK + 3 
4a48 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
4a49 : 20 91 46 JSR $4691 ; (freg + 36)
4a4c : a5 07 __ LDA WORK + 4 
4a4e : c9 7f __ CMP #$7f
4a50 : b0 07 __ BCS $4a59 ; (f32_to_i16 + 16)
4a52 : a9 00 __ LDA #$00
4a54 : 85 1b __ STA ACCU + 0 
4a56 : 85 1c __ STA ACCU + 1 
4a58 : 60 __ __ RTS
4a59 : e9 8e __ SBC #$8e
4a5b : 90 16 __ BCC $4a73 ; (f32_to_i16 + 42)
4a5d : 24 1e __ BIT ACCU + 3 
4a5f : 30 09 __ BMI $4a6a ; (f32_to_i16 + 33)
4a61 : a9 ff __ LDA #$ff
4a63 : 85 1b __ STA ACCU + 0 
4a65 : a9 7f __ LDA #$7f
4a67 : 85 1c __ STA ACCU + 1 
4a69 : 60 __ __ RTS
4a6a : a9 00 __ LDA #$00
4a6c : 85 1b __ STA ACCU + 0 
4a6e : a9 80 __ LDA #$80
4a70 : 85 1c __ STA ACCU + 1 
4a72 : 60 __ __ RTS
4a73 : aa __ __ TAX
4a74 : a5 1c __ LDA ACCU + 1 
4a76 : 46 1d __ LSR ACCU + 2 
4a78 : 6a __ __ ROR
4a79 : e8 __ __ INX
4a7a : d0 fa __ BNE $4a76 ; (f32_to_i16 + 45)
4a7c : 24 1e __ BIT ACCU + 3 
4a7e : 10 0e __ BPL $4a8e ; (f32_to_i16 + 69)
4a80 : 38 __ __ SEC
4a81 : 49 ff __ EOR #$ff
4a83 : 69 00 __ ADC #$00
4a85 : 85 1b __ STA ACCU + 0 
4a87 : a9 00 __ LDA #$00
4a89 : e5 1d __ SBC ACCU + 2 
4a8b : 85 1c __ STA ACCU + 1 
4a8d : 60 __ __ RTS
4a8e : 85 1b __ STA ACCU + 0 
4a90 : a5 1d __ LDA ACCU + 2 
4a92 : 85 1c __ STA ACCU + 1 
4a94 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
4a95 : 24 1c __ BIT ACCU + 1 
4a97 : 30 03 __ BMI $4a9c ; (sint16_to_float + 7)
4a99 : 4c b3 4a JMP $4ab3 ; (uint16_to_float + 0)
4a9c : 38 __ __ SEC
4a9d : a9 00 __ LDA #$00
4a9f : e5 1b __ SBC ACCU + 0 
4aa1 : 85 1b __ STA ACCU + 0 
4aa3 : a9 00 __ LDA #$00
4aa5 : e5 1c __ SBC ACCU + 1 
4aa7 : 85 1c __ STA ACCU + 1 
4aa9 : 20 b3 4a JSR $4ab3 ; (uint16_to_float + 0)
4aac : a5 1e __ LDA ACCU + 3 
4aae : 09 80 __ ORA #$80
4ab0 : 85 1e __ STA ACCU + 3 
4ab2 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
4ab3 : a5 1b __ LDA ACCU + 0 
4ab5 : 05 1c __ ORA ACCU + 1 
4ab7 : d0 05 __ BNE $4abe ; (uint16_to_float + 11)
4ab9 : 85 1d __ STA ACCU + 2 
4abb : 85 1e __ STA ACCU + 3 
4abd : 60 __ __ RTS
4abe : a2 8e __ LDX #$8e
4ac0 : a5 1c __ LDA ACCU + 1 
4ac2 : 30 06 __ BMI $4aca ; (uint16_to_float + 23)
4ac4 : ca __ __ DEX
4ac5 : 06 1b __ ASL ACCU + 0 
4ac7 : 2a __ __ ROL
4ac8 : 10 fa __ BPL $4ac4 ; (uint16_to_float + 17)
4aca : 0a __ __ ASL
4acb : 85 1d __ STA ACCU + 2 
4acd : a5 1b __ LDA ACCU + 0 
4acf : 85 1c __ STA ACCU + 1 
4ad1 : 8a __ __ TXA
4ad2 : 4a __ __ LSR
4ad3 : 85 1e __ STA ACCU + 3 
4ad5 : a9 00 __ LDA #$00
4ad7 : 85 1b __ STA ACCU + 0 
4ad9 : 66 1d __ ROR ACCU + 2 
4adb : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
4adc : a5 04 __ LDA WORK + 1 
4ade : 05 05 __ ORA WORK + 2 
4ae0 : 05 06 __ ORA WORK + 3 
4ae2 : d0 05 __ BNE $4ae9 ; (mul32 + 13)
4ae4 : a5 03 __ LDA WORK + 0 
4ae6 : 4c 37 46 JMP $4637 ; (mul32by8 + 0)
4ae9 : a0 00 __ LDY #$00
4aeb : 84 07 __ STY WORK + 4 
4aed : 84 08 __ STY WORK + 5 
4aef : 98 __ __ TYA
4af0 : 38 __ __ SEC
4af1 : 66 03 __ ROR WORK + 0 
4af3 : 90 15 __ BCC $4b0a ; (mul32 + 46)
4af5 : aa __ __ TAX
4af6 : 18 __ __ CLC
4af7 : a5 07 __ LDA WORK + 4 
4af9 : 65 1b __ ADC ACCU + 0 
4afb : 85 07 __ STA WORK + 4 
4afd : a5 08 __ LDA WORK + 5 
4aff : 65 1c __ ADC ACCU + 1 
4b01 : 85 08 __ STA WORK + 5 
4b03 : 98 __ __ TYA
4b04 : 65 1d __ ADC ACCU + 2 
4b06 : a8 __ __ TAY
4b07 : 8a __ __ TXA
4b08 : 65 1e __ ADC ACCU + 3 
4b0a : 46 04 __ LSR WORK + 1 
4b0c : 90 0f __ BCC $4b1d ; (mul32 + 65)
4b0e : aa __ __ TAX
4b0f : 18 __ __ CLC
4b10 : a5 08 __ LDA WORK + 5 
4b12 : 65 1b __ ADC ACCU + 0 
4b14 : 85 08 __ STA WORK + 5 
4b16 : 98 __ __ TYA
4b17 : 65 1c __ ADC ACCU + 1 
4b19 : a8 __ __ TAY
4b1a : 8a __ __ TXA
4b1b : 65 1d __ ADC ACCU + 2 
4b1d : 46 05 __ LSR WORK + 2 
4b1f : 90 09 __ BCC $4b2a ; (mul32 + 78)
4b21 : aa __ __ TAX
4b22 : 18 __ __ CLC
4b23 : 98 __ __ TYA
4b24 : 65 1b __ ADC ACCU + 0 
4b26 : a8 __ __ TAY
4b27 : 8a __ __ TXA
4b28 : 65 1c __ ADC ACCU + 1 
4b2a : 46 06 __ LSR WORK + 3 
4b2c : 90 03 __ BCC $4b31 ; (mul32 + 85)
4b2e : 18 __ __ CLC
4b2f : 65 1b __ ADC ACCU + 0 
4b31 : 06 1b __ ASL ACCU + 0 
4b33 : 26 1c __ ROL ACCU + 1 
4b35 : 26 1d __ ROL ACCU + 2 
4b37 : 26 1e __ ROL ACCU + 3 
4b39 : 46 03 __ LSR WORK + 0 
4b3b : 90 cd __ BCC $4b0a ; (mul32 + 46)
4b3d : d0 b6 __ BNE $4af5 ; (mul32 + 25)
4b3f : 84 09 __ STY WORK + 6 
4b41 : 85 0a __ STA WORK + 7 
4b43 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
4b44 : 24 1e __ BIT ACCU + 3 
4b46 : 10 0d __ BPL $4b55 ; (divs32 + 17)
4b48 : 20 62 4b JSR $4b62 ; (negaccu32 + 0)
4b4b : 24 06 __ BIT WORK + 3 
4b4d : 10 0d __ BPL $4b5c ; (divs32 + 24)
4b4f : 20 7c 4b JSR $4b7c ; (negtmp32 + 0)
4b52 : 4c 96 4b JMP $4b96 ; (divmod32 + 0)
4b55 : 24 06 __ BIT WORK + 3 
4b57 : 10 f9 __ BPL $4b52 ; (divs32 + 14)
4b59 : 20 7c 4b JSR $4b7c ; (negtmp32 + 0)
4b5c : 20 96 4b JSR $4b96 ; (divmod32 + 0)
4b5f : 4c 62 4b JMP $4b62 ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
4b62 : 38 __ __ SEC
4b63 : a9 00 __ LDA #$00
4b65 : e5 1b __ SBC ACCU + 0 
4b67 : 85 1b __ STA ACCU + 0 
4b69 : a9 00 __ LDA #$00
4b6b : e5 1c __ SBC ACCU + 1 
4b6d : 85 1c __ STA ACCU + 1 
4b6f : a9 00 __ LDA #$00
4b71 : e5 1d __ SBC ACCU + 2 
4b73 : 85 1d __ STA ACCU + 2 
4b75 : a9 00 __ LDA #$00
4b77 : e5 1e __ SBC ACCU + 3 
4b79 : 85 1e __ STA ACCU + 3 
4b7b : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
4b7c : 38 __ __ SEC
4b7d : a9 00 __ LDA #$00
4b7f : e5 03 __ SBC WORK + 0 
4b81 : 85 03 __ STA WORK + 0 
4b83 : a9 00 __ LDA #$00
4b85 : e5 04 __ SBC WORK + 1 
4b87 : 85 04 __ STA WORK + 1 
4b89 : a9 00 __ LDA #$00
4b8b : e5 05 __ SBC WORK + 2 
4b8d : 85 05 __ STA WORK + 2 
4b8f : a9 00 __ LDA #$00
4b91 : e5 06 __ SBC WORK + 3 
4b93 : 85 06 __ STA WORK + 3 
4b95 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4b96 : a9 00 __ LDA #$00
4b98 : 85 07 __ STA WORK + 4 
4b9a : 85 08 __ STA WORK + 5 
4b9c : 85 09 __ STA WORK + 6 
4b9e : 85 0a __ STA WORK + 7 
4ba0 : a5 05 __ LDA WORK + 2 
4ba2 : 05 06 __ ORA WORK + 3 
4ba4 : f0 4b __ BEQ $4bf1 ; (divmod32 + 91)
4ba6 : a0 10 __ LDY #$10
4ba8 : a5 1e __ LDA ACCU + 3 
4baa : 85 08 __ STA WORK + 5 
4bac : a5 1d __ LDA ACCU + 2 
4bae : 85 07 __ STA WORK + 4 
4bb0 : a9 00 __ LDA #$00
4bb2 : 85 1d __ STA ACCU + 2 
4bb4 : 85 1e __ STA ACCU + 3 
4bb6 : 18 __ __ CLC
4bb7 : 26 1b __ ROL ACCU + 0 
4bb9 : 26 1c __ ROL ACCU + 1 
4bbb : 26 07 __ ROL WORK + 4 
4bbd : 26 08 __ ROL WORK + 5 
4bbf : 26 09 __ ROL WORK + 6 
4bc1 : 26 0a __ ROL WORK + 7 
4bc3 : a5 07 __ LDA WORK + 4 
4bc5 : c5 03 __ CMP WORK + 0 
4bc7 : a5 08 __ LDA WORK + 5 
4bc9 : e5 04 __ SBC WORK + 1 
4bcb : a5 09 __ LDA WORK + 6 
4bcd : e5 05 __ SBC WORK + 2 
4bcf : aa __ __ TAX
4bd0 : a5 0a __ LDA WORK + 7 
4bd2 : e5 06 __ SBC WORK + 3 
4bd4 : 90 11 __ BCC $4be7 ; (divmod32 + 81)
4bd6 : 86 09 __ STX WORK + 6 
4bd8 : 85 0a __ STA WORK + 7 
4bda : a5 07 __ LDA WORK + 4 
4bdc : e5 03 __ SBC WORK + 0 
4bde : 85 07 __ STA WORK + 4 
4be0 : a5 08 __ LDA WORK + 5 
4be2 : e5 04 __ SBC WORK + 1 
4be4 : 85 08 __ STA WORK + 5 
4be6 : 38 __ __ SEC
4be7 : 88 __ __ DEY
4be8 : d0 cd __ BNE $4bb7 ; (divmod32 + 33)
4bea : 26 1b __ ROL ACCU + 0 
4bec : 26 1c __ ROL ACCU + 1 
4bee : a4 02 __ LDY $02 
4bf0 : 60 __ __ RTS
4bf1 : a5 1d __ LDA ACCU + 2 
4bf3 : 05 1e __ ORA ACCU + 3 
4bf5 : d0 0c __ BNE $4c03 ; (divmod32 + 109)
4bf7 : 20 91 49 JSR $4991 ; (divmod + 0)
4bfa : a5 05 __ LDA WORK + 2 
4bfc : 85 07 __ STA WORK + 4 
4bfe : a5 06 __ LDA WORK + 3 
4c00 : 85 08 __ STA WORK + 5 
4c02 : 60 __ __ RTS
4c03 : a0 20 __ LDY #$20
4c05 : a5 04 __ LDA WORK + 1 
4c07 : d0 27 __ BNE $4c30 ; (divmod32 + 154)
4c09 : 18 __ __ CLC
4c0a : 26 1b __ ROL ACCU + 0 
4c0c : 26 1c __ ROL ACCU + 1 
4c0e : 26 1d __ ROL ACCU + 2 
4c10 : 26 1e __ ROL ACCU + 3 
4c12 : 2a __ __ ROL
4c13 : 90 05 __ BCC $4c1a ; (divmod32 + 132)
4c15 : e5 03 __ SBC WORK + 0 
4c17 : 38 __ __ SEC
4c18 : b0 06 __ BCS $4c20 ; (divmod32 + 138)
4c1a : c5 03 __ CMP WORK + 0 
4c1c : 90 02 __ BCC $4c20 ; (divmod32 + 138)
4c1e : e5 03 __ SBC WORK + 0 
4c20 : 88 __ __ DEY
4c21 : d0 e7 __ BNE $4c0a ; (divmod32 + 116)
4c23 : 85 07 __ STA WORK + 4 
4c25 : 26 1b __ ROL ACCU + 0 
4c27 : 26 1c __ ROL ACCU + 1 
4c29 : 26 1d __ ROL ACCU + 2 
4c2b : 26 1e __ ROL ACCU + 3 
4c2d : a4 02 __ LDY $02 
4c2f : 60 __ __ RTS
4c30 : a5 1e __ LDA ACCU + 3 
4c32 : d0 10 __ BNE $4c44 ; (divmod32 + 174)
4c34 : a6 1d __ LDX ACCU + 2 
4c36 : 86 1e __ STX ACCU + 3 
4c38 : a6 1c __ LDX ACCU + 1 
4c3a : 86 1d __ STX ACCU + 2 
4c3c : a6 1b __ LDX ACCU + 0 
4c3e : 86 1c __ STX ACCU + 1 
4c40 : 85 1b __ STA ACCU + 0 
4c42 : a0 18 __ LDY #$18
4c44 : 18 __ __ CLC
4c45 : 26 1b __ ROL ACCU + 0 
4c47 : 26 1c __ ROL ACCU + 1 
4c49 : 26 1d __ ROL ACCU + 2 
4c4b : 26 1e __ ROL ACCU + 3 
4c4d : 26 07 __ ROL WORK + 4 
4c4f : 26 08 __ ROL WORK + 5 
4c51 : 90 0c __ BCC $4c5f ; (divmod32 + 201)
4c53 : a5 07 __ LDA WORK + 4 
4c55 : e5 03 __ SBC WORK + 0 
4c57 : aa __ __ TAX
4c58 : a5 08 __ LDA WORK + 5 
4c5a : e5 04 __ SBC WORK + 1 
4c5c : 38 __ __ SEC
4c5d : b0 0c __ BCS $4c6b ; (divmod32 + 213)
4c5f : 38 __ __ SEC
4c60 : a5 07 __ LDA WORK + 4 
4c62 : e5 03 __ SBC WORK + 0 
4c64 : aa __ __ TAX
4c65 : a5 08 __ LDA WORK + 5 
4c67 : e5 04 __ SBC WORK + 1 
4c69 : 90 04 __ BCC $4c6f ; (divmod32 + 217)
4c6b : 86 07 __ STX WORK + 4 
4c6d : 85 08 __ STA WORK + 5 
4c6f : 88 __ __ DEY
4c70 : d0 d3 __ BNE $4c45 ; (divmod32 + 175)
4c72 : 26 1b __ ROL ACCU + 0 
4c74 : 26 1c __ ROL ACCU + 1 
4c76 : 26 1d __ ROL ACCU + 2 
4c78 : 26 1e __ ROL ACCU + 3 
4c7a : a4 02 __ LDY $02 
4c7c : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
4c7d : 18 __ __ CLC
4c7e : a5 1b __ LDA ACCU + 0 
4c80 : 69 05 __ ADC #$05
4c82 : 29 fc __ AND #$fc
4c84 : 85 03 __ STA WORK + 0 
4c86 : a5 1c __ LDA ACCU + 1 
4c88 : 69 00 __ ADC #$00
4c8a : 85 04 __ STA WORK + 1 
4c8c : ad 43 4e LDA $4e43 ; (HeapNode.end + 0)
4c8f : d0 26 __ BNE $4cb7 ; (crt_malloc + 58)
4c91 : a9 00 __ LDA #$00
4c93 : 8d 02 65 STA $6502 
4c96 : 8d 03 65 STA $6503 
4c99 : ee 43 4e INC $4e43 ; (HeapNode.end + 0)
4c9c : a9 00 __ LDA #$00
4c9e : 09 02 __ ORA #$02
4ca0 : 8d 41 4e STA $4e41 ; (HeapNode.next + 0)
4ca3 : a9 65 __ LDA #$65
4ca5 : 8d 42 4e STA $4e42 ; (HeapNode.next + 1)
4ca8 : 38 __ __ SEC
4ca9 : a9 f8 __ LDA #$f8
4cab : e9 02 __ SBC #$02
4cad : 8d 04 65 STA $6504 
4cb0 : a9 bf __ LDA #$bf
4cb2 : e9 00 __ SBC #$00
4cb4 : 8d 05 65 STA $6505 
4cb7 : a9 41 __ LDA #$41
4cb9 : a2 4e __ LDX #$4e
4cbb : 85 1d __ STA ACCU + 2 
4cbd : 86 1e __ STX ACCU + 3 
4cbf : 18 __ __ CLC
4cc0 : a0 00 __ LDY #$00
4cc2 : b1 1d __ LDA (ACCU + 2),y 
4cc4 : 85 1b __ STA ACCU + 0 
4cc6 : 65 03 __ ADC WORK + 0 
4cc8 : 85 05 __ STA WORK + 2 
4cca : c8 __ __ INY
4ccb : b1 1d __ LDA (ACCU + 2),y 
4ccd : 85 1c __ STA ACCU + 1 
4ccf : f0 20 __ BEQ $4cf1 ; (crt_malloc + 116)
4cd1 : 65 04 __ ADC WORK + 1 
4cd3 : 85 06 __ STA WORK + 3 
4cd5 : b0 14 __ BCS $4ceb ; (crt_malloc + 110)
4cd7 : a0 02 __ LDY #$02
4cd9 : b1 1b __ LDA (ACCU + 0),y 
4cdb : c5 05 __ CMP WORK + 2 
4cdd : c8 __ __ INY
4cde : b1 1b __ LDA (ACCU + 0),y 
4ce0 : e5 06 __ SBC WORK + 3 
4ce2 : b0 0e __ BCS $4cf2 ; (crt_malloc + 117)
4ce4 : a5 1b __ LDA ACCU + 0 
4ce6 : a6 1c __ LDX ACCU + 1 
4ce8 : 4c bb 4c JMP $4cbb ; (crt_malloc + 62)
4ceb : a9 00 __ LDA #$00
4ced : 85 1b __ STA ACCU + 0 
4cef : 85 1c __ STA ACCU + 1 
4cf1 : 60 __ __ RTS
4cf2 : a5 05 __ LDA WORK + 2 
4cf4 : 85 07 __ STA WORK + 4 
4cf6 : a5 06 __ LDA WORK + 3 
4cf8 : 85 08 __ STA WORK + 5 
4cfa : a0 02 __ LDY #$02
4cfc : a5 07 __ LDA WORK + 4 
4cfe : d1 1b __ CMP (ACCU + 0),y 
4d00 : d0 15 __ BNE $4d17 ; (crt_malloc + 154)
4d02 : c8 __ __ INY
4d03 : a5 08 __ LDA WORK + 5 
4d05 : d1 1b __ CMP (ACCU + 0),y 
4d07 : d0 0e __ BNE $4d17 ; (crt_malloc + 154)
4d09 : a0 00 __ LDY #$00
4d0b : b1 1b __ LDA (ACCU + 0),y 
4d0d : 91 1d __ STA (ACCU + 2),y 
4d0f : c8 __ __ INY
4d10 : b1 1b __ LDA (ACCU + 0),y 
4d12 : 91 1d __ STA (ACCU + 2),y 
4d14 : 4c 34 4d JMP $4d34 ; (crt_malloc + 183)
4d17 : a0 00 __ LDY #$00
4d19 : b1 1b __ LDA (ACCU + 0),y 
4d1b : 91 07 __ STA (WORK + 4),y 
4d1d : a5 07 __ LDA WORK + 4 
4d1f : 91 1d __ STA (ACCU + 2),y 
4d21 : c8 __ __ INY
4d22 : b1 1b __ LDA (ACCU + 0),y 
4d24 : 91 07 __ STA (WORK + 4),y 
4d26 : a5 08 __ LDA WORK + 5 
4d28 : 91 1d __ STA (ACCU + 2),y 
4d2a : c8 __ __ INY
4d2b : b1 1b __ LDA (ACCU + 0),y 
4d2d : 91 07 __ STA (WORK + 4),y 
4d2f : c8 __ __ INY
4d30 : b1 1b __ LDA (ACCU + 0),y 
4d32 : 91 07 __ STA (WORK + 4),y 
4d34 : a0 00 __ LDY #$00
4d36 : a5 05 __ LDA WORK + 2 
4d38 : 91 1b __ STA (ACCU + 0),y 
4d3a : c8 __ __ INY
4d3b : a5 06 __ LDA WORK + 3 
4d3d : 91 1b __ STA (ACCU + 0),y 
4d3f : 18 __ __ CLC
4d40 : a5 1b __ LDA ACCU + 0 
4d42 : 69 02 __ ADC #$02
4d44 : 85 1b __ STA ACCU + 0 
4d46 : 90 02 __ BCC $4d4a ; (crt_malloc + 205)
4d48 : e6 1c __ INC ACCU + 1 
4d4a : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
4d4b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
4d4c : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
4d4d : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
4d5d : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
plane_data:
4d69 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
plane_data_count:
4d6b : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
sin_tab:
4d6d : __ __ __ BYT 00 06 0b 10 16 1b 20 25 29 2d 31 34 37 3a 3c 3e : ...... %)-147:<>
4d7d : __ __ __ BYT 3f 40 40 40 3f 3e 3c 3a 37 34 31 2d 29 25 20 1b : ?@@@?><:741-)% .
4d8d : __ __ __ BYT 16 10 0b 06 00 fa f5 f0 ea e5 e0 db d7 d3 cf cc : ................
4d9d : __ __ __ BYT c9 c6 c4 c2 c1 c0 c0 c0 c1 c2 c4 c6 c9 cc cf d3 : ................
4dad : __ __ __ BYT d7 db e0 e5 ea f0 f5 fa                         : ........
--------------------------------------------------------------------
wireframeOn:
4db5 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
drawing_mode:
4db7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
cr:
4db9 : __ __ __ BYT 00 00 00 00 3f 01 c7 00                         : ....?...
--------------------------------------------------------------------
PaintersOn:
4dc1 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
backcolor:
4dc3 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
linecolor:
4dc5 : __ __ __ BYT 01 00                                           : ..
--------------------------------------------------------------------
bitshift:
4dc7 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
4dd7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4de7 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
4df7 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
keyb_key:
4dff : __ __ __ BSS	1
--------------------------------------------------------------------
files:
4e00 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
4e08 : __ __ __ BSS	16
--------------------------------------------------------------------
c:
4e18 : __ __ __ BSS	2
--------------------------------------------------------------------
d:
4e1a : __ __ __ BSS	2
--------------------------------------------------------------------
h:
4e1c : __ __ __ BSS	2
--------------------------------------------------------------------
u:
4e1e : __ __ __ BSS	2
--------------------------------------------------------------------
x_pct:
4e20 : __ __ __ BSS	2
--------------------------------------------------------------------
y_pct:
4e22 : __ __ __ BSS	2
--------------------------------------------------------------------
z_pct:
4e24 : __ __ __ BSS	2
--------------------------------------------------------------------
z_rotated:
4e26 : __ __ __ BSS	2
--------------------------------------------------------------------
vx_pct:
4e28 : __ __ __ BSS	2
--------------------------------------------------------------------
vy_pct:
4e2a : __ __ __ BSS	2
--------------------------------------------------------------------
u_array:
4e2c : __ __ __ BSS	2
--------------------------------------------------------------------
a:
4e2e : __ __ __ BSS	2
--------------------------------------------------------------------
Screen:
4e30 : __ __ __ BSS	8
--------------------------------------------------------------------
keyb_matrix:
4e38 : __ __ __ BSS	8
--------------------------------------------------------------------
ciaa_pra_def:
4e40 : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
4e41 : __ __ __ BSS	4
--------------------------------------------------------------------
BLIT_CODE:
4f00 : __ __ __ BSS	224
--------------------------------------------------------------------
bucket_head:
4fe0 : __ __ __ BSS	512
--------------------------------------------------------------------
face_offset:
51e0 : __ __ __ BSS	2048
--------------------------------------------------------------------
face_next:
59e0 : __ __ __ BSS	2048
--------------------------------------------------------------------
min_x:
61e0 : __ __ __ BSS	400
--------------------------------------------------------------------
max_x:
6370 : __ __ __ BSS	400
