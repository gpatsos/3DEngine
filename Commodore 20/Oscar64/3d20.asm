; Compiled with 1.32.273.0
--------------------------------------------------------------------
startup: ; startup
1201 : 0b __ __ INV
1202 : 12 __ __ INV
1203 : 0a __ __ ASL
1204 : 00 __ __ BRK
1205 : 9e __ __ INV
1206 : 34 __ __ INV
1207 : 36 32 __ ROL $32,x 
1209 : 31 00 __ AND ($00),y 
120b : 00 __ __ BRK
120c : 00 __ __ BRK
120d : ba __ __ TSX
120e : 8e fc 36 STX $36fc ; (spentry + 0)
1211 : a2 5b __ LDX #$5b
1213 : a0 a2 __ LDY #$a2
1215 : a9 00 __ LDA #$00
1217 : 85 19 __ STA IP + 0 
1219 : 86 1a __ STX IP + 1 
121b : e0 76 __ CPX #$76
121d : f0 0b __ BEQ $122a ; (startup + 41)
121f : 91 19 __ STA (IP + 0),y 
1221 : c8 __ __ INY
1222 : d0 fb __ BNE $121f ; (startup + 30)
1224 : e8 __ __ INX
1225 : d0 f2 __ BNE $1219 ; (startup + 24)
1227 : 91 19 __ STA (IP + 0),y 
1229 : c8 __ __ INY
122a : c0 a6 __ CPY #$a6
122c : d0 f9 __ BNE $1227 ; (startup + 38)
122e : a9 00 __ LDA #$00
1230 : a2 f7 __ LDX #$f7
1232 : d0 03 __ BNE $1237 ; (startup + 54)
1234 : 95 00 __ STA $00,x 
1236 : e8 __ __ INX
1237 : e0 f7 __ CPX #$f7
1239 : d0 f9 __ BNE $1234 ; (startup + 51)
123b : a9 46 __ LDA #$46
123d : 85 23 __ STA SP + 0 
123f : a9 bf __ LDA #$bf
1241 : 85 24 __ STA SP + 1 
1243 : 20 00 24 JSR $2400 ; (main.s1 + 0)
1246 : a9 4c __ LDA #$4c
1248 : 85 54 __ STA $54 
124a : a9 00 __ LDA #$00
124c : 85 13 __ STA P6 
124e : a9 19 __ LDA #$19
1250 : 85 16 __ STA P9 
1252 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 755, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
2400 : a2 07 __ LDX #$07
2402 : b5 53 __ LDA T1 + 0,x 
2404 : 9d 48 bf STA $bf48,x ; (main@stack + 0)
2407 : ca __ __ DEX
2408 : 10 f8 __ BPL $2402 ; (main.s1 + 2)
.s4:
240a : 20 ec 25 JSR $25ec ; (load_vertex_data.s1 + 0)
240d : ad be 5b LDA $5bbe ; (h + 0)
2410 : 85 14 __ STA P7 
2412 : ad bf 5b LDA $5bbf ; (h + 1)
2415 : 85 15 __ STA P8 
2417 : 20 fb 38 JSR $38fb ; (load_plane_data.s1 + 0)
241a : a9 00 __ LDA #$00
241c : 8d f0 bf STA $bff0 ; (sstack + 4)
241f : 8d f1 bf STA $bff1 ; (sstack + 5)
2422 : 8d f3 bf STA $bff3 ; (sstack + 7)
2425 : 8d f4 bf STA $bff4 ; (sstack + 8)
2428 : 8d f5 bf STA $bff5 ; (sstack + 9)
242b : 8d f7 bf STA $bff7 ; (sstack + 11)
242e : 8d f9 bf STA $bff9 ; (sstack + 13)
2431 : 8d fb bf STA $bffb ; (sstack + 15)
2434 : a9 0f __ LDA #$0f
2436 : 85 55 __ STA T2 + 0 
2438 : 8d f2 bf STA $bff2 ; (sstack + 6)
243b : a9 1b __ LDA #$1b
243d : 85 59 __ STA T4 + 0 
243f : 8d fa bf STA $bffa ; (sstack + 14)
2442 : a9 58 __ LDA #$58
2444 : 8d f6 bf STA $bff6 ; (sstack + 10)
2447 : a9 5a __ LDA #$5a
2449 : 8d f8 bf STA $bff8 ; (sstack + 12)
244c : a9 90 __ LDA #$90
244e : 8d fc bf STA $bffc ; (sstack + 16)
2451 : a9 01 __ LDA #$01
2453 : 8d fd bf STA $bffd ; (sstack + 17)
2456 : 20 d0 3a JSR $3ad0 ; (hires_init.s4 + 0)
2459 : 20 41 3b JSR $3b41 ; (ultra_fast_clear.s4 + 0)
245c : a9 00 __ LDA #$00
245e : 85 53 __ STA T1 + 0 
2460 : 85 54 __ STA T1 + 1 
2462 : 85 56 __ STA T2 + 1 
2464 : 85 57 __ STA T3 + 0 
2466 : 85 58 __ STA T3 + 1 
2468 : 85 5a __ STA T4 + 1 
.l5:
246a : ad ba 5b LDA $5bba ; (c + 0)
246d : 8d fe bf STA $bffe ; (sstack + 18)
2470 : ad bb 5b LDA $5bbb ; (c + 1)
2473 : 8d ff bf STA $bfff ; (sstack + 19)
2476 : 20 5a 3b JSR $3b5a ; (DoRender.s1 + 0)
2479 : a9 00 __ LDA #$00
247b : 85 43 __ STA T0 + 0 
.l6:
247d : ad 8d 02 LDA $028d 
2480 : a5 c5 __ LDA $c5 
2482 : c9 40 __ CMP #$40
2484 : d0 4b __ BNE $24d1 ; (main.s9 + 0)
.s7:
2486 : a6 43 __ LDX T0 + 0 
2488 : ca __ __ DEX
2489 : d0 f2 __ BNE $247d ; (main.l6 + 0)
.s8:
248b : a5 53 __ LDA T1 + 0 
248d : 8d f0 bf STA $bff0 ; (sstack + 4)
2490 : a5 54 __ LDA T1 + 1 
2492 : 8d f1 bf STA $bff1 ; (sstack + 5)
2495 : a5 55 __ LDA T2 + 0 
2497 : 8d f2 bf STA $bff2 ; (sstack + 6)
249a : a5 56 __ LDA T2 + 1 
249c : 8d f3 bf STA $bff3 ; (sstack + 7)
249f : a5 57 __ LDA T3 + 0 
24a1 : 8d f4 bf STA $bff4 ; (sstack + 8)
24a4 : a5 58 __ LDA T3 + 1 
24a6 : 8d f5 bf STA $bff5 ; (sstack + 9)
24a9 : a9 00 __ LDA #$00
24ab : 8d f7 bf STA $bff7 ; (sstack + 11)
24ae : 8d f9 bf STA $bff9 ; (sstack + 13)
24b1 : a9 58 __ LDA #$58
24b3 : 8d f6 bf STA $bff6 ; (sstack + 10)
24b6 : a9 5a __ LDA #$5a
24b8 : 8d f8 bf STA $bff8 ; (sstack + 12)
24bb : a5 59 __ LDA T4 + 0 
24bd : 8d fa bf STA $bffa ; (sstack + 14)
24c0 : a5 5a __ LDA T4 + 1 
24c2 : 8d fb bf STA $bffb ; (sstack + 15)
24c5 : a9 90 __ LDA #$90
24c7 : 8d fc bf STA $bffc ; (sstack + 16)
24ca : a9 01 __ LDA #$01
24cc : 8d fd bf STA $bffd ; (sstack + 17)
24cf : d0 99 __ BNE $246a ; (main.l5 + 0)
.s9:
24d1 : 85 45 __ STA T5 + 0 
24d3 : c9 30 __ CMP #$30
24d5 : d0 0b __ BNE $24e2 ; (main.s10 + 0)
.s30:
24d7 : a5 57 __ LDA T3 + 0 
24d9 : 69 04 __ ADC #$04
24db : 85 1b __ STA ACCU + 0 
24dd : a9 00 __ LDA #$00
24df : 4c ce 25 JMP $25ce ; (main.s31 + 0)
.s10:
24e2 : c9 31 __ CMP #$31
24e4 : d0 0b __ BNE $24f1 ; (main.s11 + 0)
.s29:
24e6 : a5 57 __ LDA T3 + 0 
24e8 : 69 62 __ ADC #$62
24ea : 85 1b __ STA ACCU + 0 
24ec : a9 01 __ LDA #$01
24ee : 4c ce 25 JMP $25ce ; (main.s31 + 0)
.s11:
24f1 : c9 29 __ CMP #$29
24f3 : d0 22 __ BNE $2517 ; (main.s12 + 0)
.s28:
24f5 : a5 53 __ LDA T1 + 0 
24f7 : 69 04 __ ADC #$04
24f9 : 85 1b __ STA ACCU + 0 
24fb : a9 00 __ LDA #$00
.s33:
24fd : 65 54 __ ADC T1 + 1 
24ff : 85 1c __ STA ACCU + 1 
2501 : a9 68 __ LDA #$68
2503 : 85 03 __ STA WORK + 0 
2505 : a9 01 __ LDA #$01
2507 : 85 04 __ STA WORK + 1 
2509 : 20 5e 57 JSR $575e ; (mods16 + 0)
250c : a5 05 __ LDA WORK + 2 
250e : 85 53 __ STA T1 + 0 
2510 : a5 06 __ LDA WORK + 3 
2512 : 85 54 __ STA T1 + 1 
2514 : 4c c5 25 JMP $25c5 ; (main.s32 + 0)
.s12:
2517 : c9 09 __ CMP #$09
2519 : d0 0a __ BNE $2525 ; (main.s13 + 0)
.s27:
251b : a5 53 __ LDA T1 + 0 
251d : 69 62 __ ADC #$62
251f : 85 1b __ STA ACCU + 0 
2521 : a9 01 __ LDA #$01
2523 : d0 d8 __ BNE $24fd ; (main.s33 + 0)
.s13:
2525 : c9 11 __ CMP #$11
2527 : d0 22 __ BNE $254b ; (main.s14 + 0)
.s26:
2529 : a5 55 __ LDA T2 + 0 
252b : 69 04 __ ADC #$04
252d : 85 1b __ STA ACCU + 0 
252f : a5 56 __ LDA T2 + 1 
2531 : 69 00 __ ADC #$00
2533 : 85 1c __ STA ACCU + 1 
2535 : a9 68 __ LDA #$68
2537 : 85 03 __ STA WORK + 0 
2539 : a9 01 __ LDA #$01
253b : 85 04 __ STA WORK + 1 
253d : 20 5e 57 JSR $575e ; (mods16 + 0)
2540 : a5 05 __ LDA WORK + 2 
2542 : 85 55 __ STA T2 + 0 
2544 : a5 06 __ LDA WORK + 3 
2546 : 85 56 __ STA T2 + 1 
2548 : 4c c5 25 JMP $25c5 ; (main.s32 + 0)
.s14:
254b : c9 12 __ CMP #$12
254d : d0 22 __ BNE $2571 ; (main.s15 + 0)
.s25:
254f : a5 55 __ LDA T2 + 0 
2551 : 69 62 __ ADC #$62
2553 : 85 1b __ STA ACCU + 0 
2555 : a5 56 __ LDA T2 + 1 
2557 : 69 01 __ ADC #$01
2559 : 85 1c __ STA ACCU + 1 
255b : a9 68 __ LDA #$68
255d : 85 03 __ STA WORK + 0 
255f : a9 01 __ LDA #$01
2561 : 85 04 __ STA WORK + 1 
2563 : 20 5e 57 JSR $575e ; (mods16 + 0)
2566 : a5 05 __ LDA WORK + 2 
2568 : 85 55 __ STA T2 + 0 
256a : a5 06 __ LDA WORK + 3 
256c : 85 56 __ STA T2 + 1 
256e : 4c bf 25 JMP $25bf ; (main.s34 + 0)
.s15:
2571 : c9 05 __ CMP #$05
2573 : f0 44 __ BEQ $25b9 ; (main.s24 + 0)
.s16:
2575 : c9 3d __ CMP #$3d
2577 : f0 20 __ BEQ $2599 ; (main.s20 + 0)
.s17:
2579 : c9 23 __ CMP #$23
257b : d0 15 __ BNE $2592 ; (main.s18 + 0)
.s19:
257d : a9 01 __ LDA #$01
257f : ed 68 5b SBC $5b68 ; (borderOn + 0)
2582 : 8d 68 5b STA $5b68 ; (borderOn + 0)
2585 : a9 00 __ LDA #$00
2587 : 85 c6 __ STA $c6 
2589 : ed 69 5b SBC $5b69 ; (borderOn + 1)
258c : 8d 69 5b STA $5b69 ; (borderOn + 1)
258f : 4c 8b 24 JMP $248b ; (main.s8 + 0)
.s18:
2592 : a9 00 __ LDA #$00
2594 : 85 c6 __ STA $c6 
2596 : 4c 86 24 JMP $2486 ; (main.s7 + 0)
.s20:
2599 : a9 01 __ LDA #$01
259b : 85 43 __ STA T0 + 0 
259d : a5 5a __ LDA T4 + 1 
259f : 30 f1 __ BMI $2592 ; (main.s18 + 0)
.s23:
25a1 : d0 11 __ BNE $25b4 ; (main.s37 + 0)
.s22:
25a3 : a5 59 __ LDA T4 + 0 
25a5 : c9 02 __ CMP #$02
25a7 : 90 e9 __ BCC $2592 ; (main.s18 + 0)
.s21:
25a9 : 38 __ __ SEC
25aa : e9 01 __ SBC #$01
25ac : 85 59 __ STA T4 + 0 
25ae : b0 e2 __ BCS $2592 ; (main.s18 + 0)
.s35:
25b0 : c6 5a __ DEC T4 + 1 
25b2 : 90 de __ BCC $2592 ; (main.s18 + 0)
.s37:
25b4 : a5 59 __ LDA T4 + 0 
25b6 : 4c a9 25 JMP $25a9 ; (main.s21 + 0)
.s24:
25b9 : e6 59 __ INC T4 + 0 
25bb : d0 02 __ BNE $25bf ; (main.s34 + 0)
.s36:
25bd : e6 5a __ INC T4 + 1 
.s34:
25bf : a9 01 __ LDA #$01
25c1 : 85 43 __ STA T0 + 0 
25c3 : d0 cd __ BNE $2592 ; (main.s18 + 0)
.s32:
25c5 : a9 01 __ LDA #$01
25c7 : 85 43 __ STA T0 + 0 
25c9 : a5 45 __ LDA T5 + 0 
25cb : 4c 75 25 JMP $2575 ; (main.s16 + 0)
.s31:
25ce : 65 58 __ ADC T3 + 1 
25d0 : 85 1c __ STA ACCU + 1 
25d2 : a9 01 __ LDA #$01
25d4 : 85 43 __ STA T0 + 0 
25d6 : 85 04 __ STA WORK + 1 
25d8 : a9 68 __ LDA #$68
25da : 85 03 __ STA WORK + 0 
25dc : 20 5e 57 JSR $575e ; (mods16 + 0)
25df : a5 05 __ LDA WORK + 2 
25e1 : 85 57 __ STA T3 + 0 
25e3 : a5 06 __ LDA WORK + 3 
25e5 : 85 58 __ STA T3 + 1 
25e7 : a5 45 __ LDA T5 + 0 
25e9 : 4c 25 25 JMP $2525 ; (main.s13 + 0)
--------------------------------------------------------------------
load_vertex_data: ; load_vertex_data()->void
; 111, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
25ec : a2 05 __ LDX #$05
25ee : b5 53 __ LDA T1 + 0,x 
25f0 : 9d 50 bf STA $bf50,x ; (load_vertex_data@stack + 0)
25f3 : ca __ __ DEX
25f4 : 10 f8 __ BPL $25ee ; (load_vertex_data.s1 + 2)
.s4:
25f6 : a9 74 __ LDA #$74
25f8 : 85 10 __ STA P3 
25fa : a9 2a __ LDA #$2a
25fc : 85 13 __ STA P6 
25fe : a9 2a __ LDA #$2a
2600 : 85 11 __ STA P4 
2602 : a9 7f __ LDA #$7f
2604 : 85 12 __ STA P5 
2606 : 20 a6 28 JSR $28a6 ; (fopen.s4 + 0)
2609 : a5 1b __ LDA ACCU + 0 
260b : 85 55 __ STA T2 + 0 
260d : a5 1c __ LDA ACCU + 1 
260f : 85 56 __ STA T2 + 1 
2611 : a9 00 __ LDA #$00
2613 : 85 1b __ STA ACCU + 0 
2615 : 85 1c __ STA ACCU + 1 
2617 : c5 55 __ CMP T2 + 0 
2619 : d0 14 __ BNE $262f ; (load_vertex_data.s5 + 0)
.s19:
261b : a5 56 __ LDA T2 + 1 
261d : d0 10 __ BNE $262f ; (load_vertex_data.s5 + 0)
.s18:
261f : a9 00 __ LDA #$00
2621 : 8d f4 bf STA $bff4 ; (sstack + 8)
2624 : a9 37 __ LDA #$37
2626 : 8d f5 bf STA $bff5 ; (sstack + 9)
2629 : 20 81 2a JSR $2a81 ; (printf.s4 + 0)
262c : 4c 96 28 JMP $2896 ; (load_vertex_data.s3 + 0)
.s5:
262f : a5 55 __ LDA T2 + 0 
2631 : 85 17 __ STA P10 
2633 : a9 40 __ LDA #$40
2635 : 85 15 __ STA P8 
2637 : a9 00 __ LDA #$00
2639 : 85 16 __ STA P9 
263b : a5 56 __ LDA T2 + 1 
263d : 85 18 __ STA P11 
263f : a9 58 __ LDA #$58
2641 : 85 13 __ STA P6 
2643 : a9 bf __ LDA #$bf
2645 : 85 14 __ STA P7 
2647 : 20 17 37 JSR $3717 ; (fgets.s4 + 0)
264a : a5 1b __ LDA ACCU + 0 
264c : 05 1c __ ORA ACCU + 1 
264e : d0 03 __ BNE $2653 ; (load_vertex_data.s17 + 0)
2650 : 4c 3e 27 JMP $273e ; (load_vertex_data.s6 + 0)
.s17:
2653 : a9 58 __ LDA #$58
2655 : 85 0d __ STA P0 
2657 : a9 5b __ LDA #$5b
2659 : 85 10 __ STA P3 
265b : a9 bf __ LDA #$bf
265d : 85 0e __ STA P1 
265f : a9 ba __ LDA #$ba
2661 : 85 0f __ STA P2 
2663 : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
2666 : a5 1b __ LDA ACCU + 0 
2668 : 85 0d __ STA P0 
266a : a5 1c __ LDA ACCU + 1 
266c : 85 0e __ STA P1 
266e : a9 bc __ LDA #$bc
2670 : 85 0f __ STA P2 
2672 : a9 5b __ LDA #$5b
2674 : 85 10 __ STA P3 
2676 : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
2679 : a5 1b __ LDA ACCU + 0 
267b : 85 0d __ STA P0 
267d : a5 1c __ LDA ACCU + 1 
267f : 85 0e __ STA P1 
2681 : a9 be __ LDA #$be
2683 : 85 0f __ STA P2 
2685 : a9 5b __ LDA #$5b
2687 : 85 10 __ STA P3 
2689 : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
268c : a5 1b __ LDA ACCU + 0 
268e : 85 0d __ STA P0 
2690 : a5 1c __ LDA ACCU + 1 
2692 : 85 0e __ STA P1 
2694 : a9 c0 __ LDA #$c0
2696 : 85 0f __ STA P2 
2698 : a9 5b __ LDA #$5b
269a : 85 10 __ STA P3 
269c : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
269f : ad ba 5b LDA $5bba ; (c + 0)
26a2 : 0a __ __ ASL
26a3 : 85 43 __ STA T0 + 0 
26a5 : 85 1b __ STA ACCU + 0 
26a7 : ad bb 5b LDA $5bbb ; (c + 1)
26aa : 2a __ __ ROL
26ab : 85 44 __ STA T0 + 1 
26ad : 85 1c __ STA ACCU + 1 
26af : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
26b2 : a5 1b __ LDA ACCU + 0 
26b4 : 8d c2 5b STA $5bc2 ; (x_pct + 0)
26b7 : a5 1c __ LDA ACCU + 1 
26b9 : 8d c3 5b STA $5bc3 ; (x_pct + 1)
26bc : a5 43 __ LDA T0 + 0 
26be : 85 1b __ STA ACCU + 0 
26c0 : a5 44 __ LDA T0 + 1 
26c2 : 85 1c __ STA ACCU + 1 
26c4 : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
26c7 : a5 1b __ LDA ACCU + 0 
26c9 : 8d c4 5b STA $5bc4 ; (y_pct + 0)
26cc : a5 1c __ LDA ACCU + 1 
26ce : 8d c5 5b STA $5bc5 ; (y_pct + 1)
26d1 : a5 43 __ LDA T0 + 0 
26d3 : 85 1b __ STA ACCU + 0 
26d5 : a5 44 __ LDA T0 + 1 
26d7 : 85 1c __ STA ACCU + 1 
26d9 : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
26dc : a5 1b __ LDA ACCU + 0 
26de : 8d c6 5b STA $5bc6 ; (z_pct + 0)
26e1 : a5 1c __ LDA ACCU + 1 
26e3 : 8d c7 5b STA $5bc7 ; (z_pct + 1)
26e6 : a5 43 __ LDA T0 + 0 
26e8 : 85 1b __ STA ACCU + 0 
26ea : a5 44 __ LDA T0 + 1 
26ec : 85 1c __ STA ACCU + 1 
26ee : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
26f1 : a5 1b __ LDA ACCU + 0 
26f3 : 8d c8 5b STA $5bc8 ; (z_rotated + 0)
26f6 : a5 1c __ LDA ACCU + 1 
26f8 : 8d c9 5b STA $5bc9 ; (z_rotated + 1)
26fb : a5 43 __ LDA T0 + 0 
26fd : 85 1b __ STA ACCU + 0 
26ff : a5 44 __ LDA T0 + 1 
2701 : 85 1c __ STA ACCU + 1 
2703 : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
2706 : a5 1b __ LDA ACCU + 0 
2708 : 8d ca 5b STA $5bca ; (vx_pct + 0)
270b : a5 1c __ LDA ACCU + 1 
270d : 8d cb 5b STA $5bcb ; (vx_pct + 1)
2710 : a5 43 __ LDA T0 + 0 
2712 : 85 1b __ STA ACCU + 0 
2714 : a5 44 __ LDA T0 + 1 
2716 : 85 1c __ STA ACCU + 1 
2718 : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
271b : a5 1b __ LDA ACCU + 0 
271d : 8d cc 5b STA $5bcc ; (vy_pct + 0)
2720 : a5 1c __ LDA ACCU + 1 
2722 : 8d cd 5b STA $5bcd ; (vy_pct + 1)
2725 : ad c0 5b LDA $5bc0 ; (u + 0)
2728 : 0a __ __ ASL
2729 : 85 1b __ STA ACCU + 0 
272b : ad c1 5b LDA $5bc1 ; (u + 1)
272e : 2a __ __ ROL
272f : 85 1c __ STA ACCU + 1 
2731 : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
2734 : a5 1b __ LDA ACCU + 0 
2736 : 8d ce 5b STA $5bce ; (u_array + 0)
2739 : a5 1c __ LDA ACCU + 1 
273b : 8d cf 5b STA $5bcf ; (u_array + 1)
.s6:
273e : a9 ca __ LDA #$ca
2740 : 8d f4 bf STA $bff4 ; (sstack + 8)
2743 : a9 38 __ LDA #$38
2745 : 8d f5 bf STA $bff5 ; (sstack + 9)
2748 : ad ba 5b LDA $5bba ; (c + 0)
274b : 8d f6 bf STA $bff6 ; (sstack + 10)
274e : ad bb 5b LDA $5bbb ; (c + 1)
2751 : 8d f7 bf STA $bff7 ; (sstack + 11)
2754 : 20 81 2a JSR $2a81 ; (printf.s4 + 0)
2757 : a9 d1 __ LDA #$d1
2759 : 8d f4 bf STA $bff4 ; (sstack + 8)
275c : a9 38 __ LDA #$38
275e : 8d f5 bf STA $bff5 ; (sstack + 9)
2761 : ad bc 5b LDA $5bbc ; (d + 0)
2764 : 8d f6 bf STA $bff6 ; (sstack + 10)
2767 : ad bd 5b LDA $5bbd ; (d + 1)
276a : 8d f7 bf STA $bff7 ; (sstack + 11)
276d : 20 81 2a JSR $2a81 ; (printf.s4 + 0)
2770 : a9 d8 __ LDA #$d8
2772 : 8d f4 bf STA $bff4 ; (sstack + 8)
2775 : a9 38 __ LDA #$38
2777 : 8d f5 bf STA $bff5 ; (sstack + 9)
277a : ad be 5b LDA $5bbe ; (h + 0)
277d : 8d f6 bf STA $bff6 ; (sstack + 10)
2780 : ad bf 5b LDA $5bbf ; (h + 1)
2783 : 8d f7 bf STA $bff7 ; (sstack + 11)
2786 : 20 81 2a JSR $2a81 ; (printf.s4 + 0)
2789 : a9 df __ LDA #$df
278b : 8d f4 bf STA $bff4 ; (sstack + 8)
278e : a9 38 __ LDA #$38
2790 : 8d f5 bf STA $bff5 ; (sstack + 9)
2793 : ad c0 5b LDA $5bc0 ; (u + 0)
2796 : 8d f6 bf STA $bff6 ; (sstack + 10)
2799 : ad c1 5b LDA $5bc1 ; (u + 1)
279c : 8d f7 bf STA $bff7 ; (sstack + 11)
279f : 20 81 2a JSR $2a81 ; (printf.s4 + 0)
27a2 : a9 e6 __ LDA #$e6
27a4 : 8d f4 bf STA $bff4 ; (sstack + 8)
27a7 : a9 38 __ LDA #$38
27a9 : 8d f5 bf STA $bff5 ; (sstack + 9)
27ac : ad c0 5b LDA $5bc0 ; (u + 0)
27af : 8d f6 bf STA $bff6 ; (sstack + 10)
27b2 : ad c1 5b LDA $5bc1 ; (u + 1)
27b5 : 8d f7 bf STA $bff7 ; (sstack + 11)
27b8 : 20 81 2a JSR $2a81 ; (printf.s4 + 0)
27bb : a9 01 __ LDA #$01
27bd : 8d d0 5b STA $5bd0 ; (a + 0)
27c0 : a9 00 __ LDA #$00
27c2 : 8d d1 5b STA $5bd1 ; (a + 1)
27c5 : ad bb 5b LDA $5bbb ; (c + 1)
27c8 : 10 03 __ BPL $27cd ; (load_vertex_data.s16 + 0)
27ca : 4c 8a 28 JMP $288a ; (load_vertex_data.s7 + 0)
.s16:
27cd : d0 05 __ BNE $27d4 ; (load_vertex_data.s20 + 0)
.s15:
27cf : ad ba 5b LDA $5bba ; (c + 0)
27d2 : f0 f6 __ BEQ $27ca ; (load_vertex_data.s6 + 140)
.s20:
27d4 : a5 55 __ LDA T2 + 0 
27d6 : 85 17 __ STA P10 
27d8 : a9 58 __ LDA #$58
27da : 85 13 __ STA P6 
27dc : a9 bf __ LDA #$bf
27de : 85 14 __ STA P7 
27e0 : a9 40 __ LDA #$40
27e2 : 85 15 __ STA P8 
27e4 : a9 00 __ LDA #$00
27e6 : 85 16 __ STA P9 
27e8 : a5 56 __ LDA T2 + 1 
27ea : 85 18 __ STA P11 
.l8:
27ec : 20 17 37 JSR $3717 ; (fgets.s4 + 0)
27ef : ad d0 5b LDA $5bd0 ; (a + 0)
27f2 : 85 53 __ STA T1 + 0 
27f4 : ad d1 5b LDA $5bd1 ; (a + 1)
27f7 : 85 54 __ STA T1 + 1 
27f9 : a5 1b __ LDA ACCU + 0 
27fb : 05 1c __ ORA ACCU + 1 
27fd : f0 61 __ BEQ $2860 ; (load_vertex_data.s9 + 0)
.s14:
27ff : a5 53 __ LDA T1 + 0 
2801 : 0a __ __ ASL
2802 : a8 __ __ TAY
2803 : a9 58 __ LDA #$58
2805 : 85 0d __ STA P0 
2807 : a9 bf __ LDA #$bf
2809 : 85 0e __ STA P1 
280b : a5 54 __ LDA T1 + 1 
280d : 2a __ __ ROL
280e : aa __ __ TAX
280f : 98 __ __ TYA
2810 : 38 __ __ SEC
2811 : e9 02 __ SBC #$02
2813 : 85 57 __ STA T4 + 0 
2815 : 8a __ __ TXA
2816 : e9 00 __ SBC #$00
2818 : 85 58 __ STA T4 + 1 
281a : ad c2 5b LDA $5bc2 ; (x_pct + 0)
281d : 18 __ __ CLC
281e : 65 57 __ ADC T4 + 0 
2820 : 85 0f __ STA P2 
2822 : ad c3 5b LDA $5bc3 ; (x_pct + 1)
2825 : 65 58 __ ADC T4 + 1 
2827 : 85 10 __ STA P3 
2829 : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
282c : a5 1b __ LDA ACCU + 0 
282e : 85 0d __ STA P0 
2830 : a5 1c __ LDA ACCU + 1 
2832 : 85 0e __ STA P1 
2834 : ad c4 5b LDA $5bc4 ; (y_pct + 0)
2837 : 18 __ __ CLC
2838 : 65 57 __ ADC T4 + 0 
283a : 85 0f __ STA P2 
283c : ad c5 5b LDA $5bc5 ; (y_pct + 1)
283f : 65 58 __ ADC T4 + 1 
2841 : 85 10 __ STA P3 
2843 : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
2846 : a5 1b __ LDA ACCU + 0 
2848 : 85 0d __ STA P0 
284a : a5 1c __ LDA ACCU + 1 
284c : 85 0e __ STA P1 
284e : ad c6 5b LDA $5bc6 ; (z_pct + 0)
2851 : 18 __ __ CLC
2852 : 65 57 __ ADC T4 + 0 
2854 : 85 0f __ STA P2 
2856 : ad c7 5b LDA $5bc7 ; (z_pct + 1)
2859 : 65 58 __ ADC T4 + 1 
285b : 85 10 __ STA P3 
285d : 20 00 38 JSR $3800 ; (parse_next_int.s4 + 0)
.s9:
2860 : 18 __ __ CLC
2861 : a5 53 __ LDA T1 + 0 
2863 : 69 01 __ ADC #$01
2865 : 8d d0 5b STA $5bd0 ; (a + 0)
2868 : a5 54 __ LDA T1 + 1 
286a : 69 00 __ ADC #$00
286c : 8d d1 5b STA $5bd1 ; (a + 1)
286f : ad bb 5b LDA $5bbb ; (c + 1)
2872 : cd d1 5b CMP $5bd1 ; (a + 1)
2875 : d0 09 __ BNE $2880 ; (load_vertex_data.s13 + 0)
.s10:
2877 : ad ba 5b LDA $5bba ; (c + 0)
287a : cd d0 5b CMP $5bd0 ; (a + 0)
287d : 4c 85 28 JMP $2885 ; (load_vertex_data.s11 + 0)
.s13:
2880 : 4d d1 5b EOR $5bd1 ; (a + 1)
2883 : 30 1c __ BMI $28a1 ; (load_vertex_data.s12 + 0)
.s11:
2885 : 90 03 __ BCC $288a ; (load_vertex_data.s7 + 0)
2887 : 4c ec 27 JMP $27ec ; (load_vertex_data.l8 + 0)
.s7:
288a : a0 00 __ LDY #$00
288c : b1 55 __ LDA (T2 + 0),y 
288e : 20 f3 38 JSR $38f3 ; (krnio_close.s4 + 0)
2891 : a9 00 __ LDA #$00
2893 : a8 __ __ TAY
2894 : 91 55 __ STA (T2 + 0),y 
.s3:
2896 : a2 05 __ LDX #$05
2898 : bd 50 bf LDA $bf50,x ; (load_vertex_data@stack + 0)
289b : 95 53 __ STA T1 + 0,x 
289d : ca __ __ DEX
289e : 10 f8 __ BPL $2898 ; (load_vertex_data.s3 + 2)
28a0 : 60 __ __ RTS
.s12:
28a1 : b0 e7 __ BCS $288a ; (load_vertex_data.s7 + 0)
28a3 : 4c ec 27 JMP $27ec ; (load_vertex_data.l8 + 0)
--------------------------------------------------------------------
fopen: ; fopen(const u8*,const u8*)->struct FILE*
;  40, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
28a6 : a2 00 __ LDX #$00
.l5:
28a8 : 8a __ __ TXA
28a9 : a8 __ __ TAY
28aa : 18 __ __ CLC
28ab : 69 a2 __ ADC #$a2
28ad : 85 49 __ STA T6 + 0 
28af : a9 5b __ LDA #$5b
28b1 : 69 00 __ ADC #$00
28b3 : 85 4a __ STA T6 + 1 
28b5 : bd a2 5b LDA $5ba2,x ; (files[0].fnum + 0)
28b8 : f0 0c __ BEQ $28c6 ; (fopen.s6 + 0)
.s36:
28ba : e8 __ __ INX
28bb : e0 08 __ CPX #$08
28bd : 90 e9 __ BCC $28a8 ; (fopen.l5 + 0)
.s19:
28bf : a9 00 __ LDA #$00
28c1 : 85 1b __ STA ACCU + 0 
.s3:
28c3 : 85 1c __ STA ACCU + 1 
28c5 : 60 __ __ RTS
.s6:
28c6 : 84 48 __ STY T5 + 0 
28c8 : 85 1b __ STA ACCU + 0 
28ca : 85 1c __ STA ACCU + 1 
28cc : 85 43 __ STA T1 + 0 
28ce : a9 08 __ LDA #$08
28d0 : 85 4c __ STA T10 + 0 
28d2 : d0 16 __ BNE $28ea ; (fopen.l7 + 0)
.s35:
28d4 : a5 43 __ LDA T1 + 0 
28d6 : 0a __ __ ASL
28d7 : 0a __ __ ASL
28d8 : 18 __ __ CLC
28d9 : 65 43 __ ADC T1 + 0 
28db : 0a __ __ ASL
28dc : 85 43 __ STA T1 + 0 
28de : b1 10 __ LDA (P3),y ; (fname + 0)
28e0 : 38 __ __ SEC
28e1 : e9 30 __ SBC #$30
28e3 : 18 __ __ CLC
28e4 : 65 43 __ ADC T1 + 0 
28e6 : 85 43 __ STA T1 + 0 
28e8 : e6 1b __ INC ACCU + 0 
.l7:
28ea : a4 1b __ LDY ACCU + 0 
28ec : b1 10 __ LDA (P3),y ; (fname + 0)
28ee : c9 30 __ CMP #$30
28f0 : 90 06 __ BCC $28f8 ; (fopen.s8 + 0)
.s27:
28f2 : c9 3a __ CMP #$3a
28f4 : 90 de __ BCC $28d4 ; (fopen.s35 + 0)
.s28:
28f6 : f0 06 __ BEQ $28fe ; (fopen.s29 + 0)
.s8:
28f8 : a9 00 __ LDA #$00
28fa : 85 4b __ STA T7 + 0 
28fc : f0 3c __ BEQ $293a ; (fopen.s9 + 0)
.s29:
28fe : c8 __ __ INY
28ff : 84 4b __ STY T7 + 0 
2901 : 84 1b __ STY ACCU + 0 
2903 : a5 43 __ LDA T1 + 0 
2905 : 85 1c __ STA ACCU + 1 
2907 : a9 00 __ LDA #$00
2909 : b0 16 __ BCS $2921 ; (fopen.l30 + 0)
.s34:
290b : a5 46 __ LDA T3 + 0 
290d : 0a __ __ ASL
290e : 0a __ __ ASL
290f : 18 __ __ CLC
2910 : 65 46 __ ADC T3 + 0 
2912 : 0a __ __ ASL
2913 : 85 46 __ STA T3 + 0 
2915 : b1 10 __ LDA (P3),y ; (fname + 0)
2917 : 38 __ __ SEC
2918 : e9 30 __ SBC #$30
291a : 18 __ __ CLC
291b : 65 46 __ ADC T3 + 0 
291d : e6 1b __ INC ACCU + 0 
291f : a4 1b __ LDY ACCU + 0 
.l30:
2921 : 85 46 __ STA T3 + 0 
2923 : b1 10 __ LDA (P3),y ; (fname + 0)
2925 : c9 30 __ CMP #$30
2927 : 90 11 __ BCC $293a ; (fopen.s9 + 0)
.s31:
2929 : c9 3a __ CMP #$3a
292b : 90 de __ BCC $290b ; (fopen.s34 + 0)
.s32:
292d : d0 0b __ BNE $293a ; (fopen.s9 + 0)
.s33:
292f : a5 43 __ LDA T1 + 0 
2931 : 85 4c __ STA T10 + 0 
2933 : a5 46 __ LDA T3 + 0 
2935 : 85 1c __ STA ACCU + 1 
2937 : c8 __ __ INY
2938 : 84 4b __ STY T7 + 0 
.s9:
293a : a9 ce __ LDA #$ce
293c : 85 43 __ STA T1 + 0 
293e : a9 bf __ LDA #$bf
2940 : 85 44 __ STA T1 + 1 
2942 : a5 1c __ LDA ACCU + 1 
2944 : c9 0a __ CMP #$0a
2946 : b0 14 __ BCS $295c ; (fopen.s26 + 0)
.s10:
2948 : a9 ce __ LDA #$ce
294a : 85 46 __ STA T3 + 0 
294c : a9 bf __ LDA #$bf
294e : 85 47 __ STA T3 + 1 
2950 : a9 cd __ LDA #$cd
2952 : 85 43 __ STA T1 + 0 
2954 : a9 bf __ LDA #$bf
2956 : 85 44 __ STA T1 + 1 
2958 : a2 03 __ LDX #$03
295a : 90 21 __ BCC $297d ; (fopen.s11 + 0)
.s26:
295c : 85 1b __ STA ACCU + 0 
295e : a9 00 __ LDA #$00
2960 : 85 1c __ STA ACCU + 1 
2962 : a9 0a __ LDA #$0a
2964 : 20 08 57 JSR $5708 ; (divmod + 53)
2967 : a5 05 __ LDA WORK + 2 
2969 : 85 1c __ STA ACCU + 1 
296b : 18 __ __ CLC
296c : a5 1b __ LDA ACCU + 0 
296e : 69 30 __ ADC #$30
2970 : 8d cd bf STA $bfcd ; (cbmname[0] + 1)
2973 : a9 cf __ LDA #$cf
2975 : 85 46 __ STA T3 + 0 
2977 : a9 bf __ LDA #$bf
2979 : 85 47 __ STA T3 + 1 
297b : a2 04 __ LDX #$04
.s11:
297d : a9 3a __ LDA #$3a
297f : a0 00 __ LDY #$00
2981 : 91 46 __ STA (T3 + 0),y 
2983 : 18 __ __ CLC
2984 : a5 1c __ LDA ACCU + 1 
2986 : 69 30 __ ADC #$30
2988 : 91 43 __ STA (T1 + 0),y 
298a : a9 01 __ LDA #$01
298c : 85 46 __ STA T3 + 0 
298e : a4 4b __ LDY T7 + 0 
2990 : b1 10 __ LDA (P3),y ; (fname + 0)
2992 : f0 09 __ BEQ $299d ; (fopen.s12 + 0)
.l25:
2994 : 9d cc bf STA $bfcc,x ; (cbmname[0] + 0)
2997 : e8 __ __ INX
2998 : c8 __ __ INY
2999 : b1 10 __ LDA (P3),y ; (fname + 0)
299b : d0 f7 __ BNE $2994 ; (fopen.l25 + 0)
.s12:
299d : a9 2c __ LDA #$2c
299f : 9d cc bf STA $bfcc,x ; (cbmname[0] + 0)
29a2 : 9d ce bf STA $bfce,x ; (cbmname[0] + 2)
29a5 : a9 53 __ LDA #$53
29a7 : 9d cd bf STA $bfcd,x ; (cbmname[0] + 1)
29aa : a0 00 __ LDY #$00
29ac : b1 12 __ LDA (P5),y ; (mode + 0)
29ae : c9 77 __ CMP #$77
29b0 : f0 04 __ BEQ $29b6 ; (fopen.s24 + 0)
.s13:
29b2 : c9 57 __ CMP #$57
29b4 : d0 13 __ BNE $29c9 ; (fopen.s14 + 0)
.s24:
29b6 : a9 57 __ LDA #$57
29b8 : 9d cf bf STA $bfcf,x ; (cbmname[0] + 3)
29bb : a9 40 __ LDA #$40
29bd : 8d cc bf STA $bfcc ; (cbmname[0] + 0)
29c0 : 8a __ __ TXA
29c1 : 69 03 __ ADC #$03
29c3 : 85 45 __ STA T2 + 0 
29c5 : c6 46 __ DEC T3 + 0 
29c7 : f0 2a __ BEQ $29f3 ; (fopen.s18 + 0)
.s14:
29c9 : c9 72 __ CMP #$72
29cb : f0 04 __ BEQ $29d1 ; (fopen.s23 + 0)
.s15:
29cd : c9 52 __ CMP #$52
29cf : d0 0e __ BNE $29df ; (fopen.s16 + 0)
.s23:
29d1 : a9 52 __ LDA #$52
.s22:
29d3 : 9d cf bf STA $bfcf,x ; (cbmname[0] + 3)
29d6 : 8a __ __ TXA
29d7 : 18 __ __ CLC
29d8 : 69 04 __ ADC #$04
29da : 85 45 __ STA T2 + 0 
29dc : 4c f3 29 JMP $29f3 ; (fopen.s18 + 0)
.s16:
29df : c9 61 __ CMP #$61
29e1 : f0 0c __ BEQ $29ef ; (fopen.s21 + 0)
.s17:
29e3 : 8a __ __ TXA
29e4 : 18 __ __ CLC
29e5 : 69 03 __ ADC #$03
29e7 : 85 45 __ STA T2 + 0 
29e9 : b1 12 __ LDA (P5),y ; (mode + 0)
29eb : c9 41 __ CMP #$41
29ed : d0 04 __ BNE $29f3 ; (fopen.s18 + 0)
.s21:
29ef : a9 41 __ LDA #$41
29f1 : d0 e0 __ BNE $29d3 ; (fopen.s22 + 0)
.s18:
29f3 : 98 __ __ TYA
29f4 : a6 45 __ LDX T2 + 0 
29f6 : 9d cc bf STA $bfcc,x ; (cbmname[0] + 0)
29f9 : 18 __ __ CLC
29fa : a9 cc __ LDA #$cc
29fc : 65 46 __ ADC T3 + 0 
29fe : 85 0d __ STA P0 
2a00 : a9 bf __ LDA #$bf
2a02 : 69 00 __ ADC #$00
2a04 : 85 0e __ STA P1 
2a06 : 20 30 2a JSR $2a30 ; (krnio_setnam.s4 + 0)
2a09 : a5 4c __ LDA T10 + 0 
2a0b : 85 0e __ STA P1 
2a0d : 18 __ __ CLC
2a0e : a5 48 __ LDA T5 + 0 
2a10 : 69 02 __ ADC #$02
2a12 : 85 48 __ STA T5 + 0 
2a14 : 85 0d __ STA P0 
2a16 : 85 0f __ STA P2 
2a18 : 20 46 2a JSR $2a46 ; (krnio_open.s4 + 0)
2a1b : aa __ __ TAX
2a1c : d0 03 __ BNE $2a21 ; (fopen.s20 + 0)
2a1e : 4c bf 28 JMP $28bf ; (fopen.s19 + 0)
.s20:
2a21 : a5 48 __ LDA T5 + 0 
2a23 : a0 00 __ LDY #$00
2a25 : 91 49 __ STA (T6 + 0),y 
2a27 : a5 49 __ LDA T6 + 0 
2a29 : 85 1b __ STA ACCU + 0 
2a2b : a5 4a __ LDA T6 + 1 
2a2d : 85 1c __ STA ACCU + 1 
2a2f : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
2a30 : a5 0d __ LDA P0 
2a32 : 05 0e __ ORA P1 
2a34 : f0 08 __ BEQ $2a3e ; (krnio_setnam.s4 + 14)
2a36 : a0 ff __ LDY #$ff
2a38 : c8 __ __ INY
2a39 : b1 0d __ LDA (P0),y 
2a3b : d0 fb __ BNE $2a38 ; (krnio_setnam.s4 + 8)
2a3d : 98 __ __ TYA
2a3e : a6 0d __ LDX P0 
2a40 : a4 0e __ LDY P1 
2a42 : 20 bd ff JSR $ffbd 
.s3:
2a45 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
2a46 : a9 00 __ LDA #$00
2a48 : a6 0d __ LDX P0 ; (fnum + 0)
2a4a : 9d aa 5b STA $5baa,x ; (krnio_pstatus[0] + 0)
2a4d : a9 00 __ LDA #$00
2a4f : 85 1b __ STA ACCU + 0 
2a51 : 85 1c __ STA ACCU + 1 
2a53 : a5 0d __ LDA P0 ; (fnum + 0)
2a55 : a6 0e __ LDX P1 
2a57 : a4 0f __ LDY P2 
2a59 : 20 ba ff JSR $ffba 
2a5c : 20 c0 ff JSR $ffc0 
2a5f : 90 08 __ BCC $2a69 ; (krnio_open.s4 + 35)
2a61 : a5 0d __ LDA P0 ; (fnum + 0)
2a63 : 20 c3 ff JSR $ffc3 
2a66 : 4c 6d 2a JMP $2a6d ; (krnio_open.s4 + 39)
2a69 : a9 01 __ LDA #$01
2a6b : 85 1b __ STA ACCU + 0 
2a6d : a5 1b __ LDA ACCU + 0 
2a6f : f0 02 __ BEQ $2a73 ; (krnio_open.s3 + 0)
.s5:
2a71 : a9 01 __ LDA #$01
.s3:
2a73 : 60 __ __ RTS
--------------------------------------------------------------------
2a74 : __ __ __ BYT 56 45 52 54 45 58 2c 53 2c 52 00                : VERTEX,S,R.
--------------------------------------------------------------------
2a7f : __ __ __ BYT 72 00                                           : r.
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
2a81 : a9 01 __ LDA #$01
2a83 : 8d f3 bf STA $bff3 ; (sstack + 7)
2a86 : a9 98 __ LDA #$98
2a88 : 8d ed bf STA $bfed ; (sstack + 1)
2a8b : a9 bf __ LDA #$bf
2a8d : 8d ee bf STA $bfee ; (sstack + 2)
2a90 : ad f4 bf LDA $bff4 ; (sstack + 8)
2a93 : 8d ef bf STA $bfef ; (sstack + 3)
2a96 : ad f5 bf LDA $bff5 ; (sstack + 9)
2a99 : 8d f0 bf STA $bff0 ; (sstack + 4)
2a9c : a9 f6 __ LDA #$f6
2a9e : 8d f1 bf STA $bff1 ; (sstack + 5)
2aa1 : a9 bf __ LDA #$bf
2aa3 : 8d f2 bf STA $bff2 ; (sstack + 6)
2aa6 : 4c a9 2a JMP $2aa9 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s1:
2aa9 : a2 09 __ LDX #$09
2aab : b5 53 __ LDA T1 + 0,x 
2aad : 9d ca bf STA $bfca,x ; (sformat@stack + 0)
2ab0 : ca __ __ DEX
2ab1 : 10 f8 __ BPL $2aab ; (sformat.s1 + 2)
.s4:
2ab3 : ad ef bf LDA $bfef ; (sstack + 3)
2ab6 : 85 55 __ STA T3 + 0 
2ab8 : a9 00 __ LDA #$00
2aba : 85 5b __ STA T6 + 0 
2abc : ad f0 bf LDA $bff0 ; (sstack + 4)
2abf : 85 56 __ STA T3 + 1 
2ac1 : ad ed bf LDA $bfed ; (sstack + 1)
2ac4 : 85 57 __ STA T4 + 0 
2ac6 : ad ee bf LDA $bfee ; (sstack + 2)
2ac9 : 85 58 __ STA T4 + 1 
.l5:
2acb : a0 00 __ LDY #$00
2acd : b1 55 __ LDA (T3 + 0),y 
2acf : d0 35 __ BNE $2b06 ; (sformat.s10 + 0)
.s6:
2ad1 : a4 5b __ LDY T6 + 0 
2ad3 : 91 57 __ STA (T4 + 0),y 
2ad5 : f0 28 __ BEQ $2aff ; (sformat.s93 + 0)
.s7:
2ad7 : ad f3 bf LDA $bff3 ; (sstack + 7)
2ada : d0 18 __ BNE $2af4 ; (sformat.s9 + 0)
.s8:
2adc : 98 __ __ TYA
2add : 18 __ __ CLC
2ade : 65 57 __ ADC T4 + 0 
2ae0 : aa __ __ TAX
2ae1 : a5 58 __ LDA T4 + 1 
2ae3 : 69 00 __ ADC #$00
.s3:
2ae5 : 86 1b __ STX ACCU + 0 ; (buff + 1)
2ae7 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
2ae9 : a2 09 __ LDX #$09
2aeb : bd ca bf LDA $bfca,x ; (sformat@stack + 0)
2aee : 95 53 __ STA T1 + 0,x 
2af0 : ca __ __ DEX
2af1 : 10 f8 __ BPL $2aeb ; (sformat.s3 + 6)
2af3 : 60 __ __ RTS
.s9:
2af4 : a5 57 __ LDA T4 + 0 
2af6 : 85 0e __ STA P1 
2af8 : a5 58 __ LDA T4 + 1 
2afa : 85 0f __ STA P2 
2afc : 20 f0 2e JSR $2ef0 ; (puts.l4 + 0)
.s93:
2aff : a5 58 __ LDA T4 + 1 
2b01 : a6 57 __ LDX T4 + 0 
2b03 : 4c e5 2a JMP $2ae5 ; (sformat.s3 + 0)
.s10:
2b06 : c9 25 __ CMP #$25
2b08 : f0 3e __ BEQ $2b48 ; (sformat.s15 + 0)
.s11:
2b0a : a4 5b __ LDY T6 + 0 
2b0c : 91 57 __ STA (T4 + 0),y 
2b0e : e6 55 __ INC T3 + 0 
2b10 : d0 02 __ BNE $2b14 ; (sformat.s115 + 0)
.s114:
2b12 : e6 56 __ INC T3 + 1 
.s115:
2b14 : c8 __ __ INY
2b15 : 84 5b __ STY T6 + 0 
2b17 : 98 __ __ TYA
2b18 : c0 28 __ CPY #$28
2b1a : 90 af __ BCC $2acb ; (sformat.l5 + 0)
.s12:
2b1c : 85 43 __ STA T0 + 0 
2b1e : a9 00 __ LDA #$00
2b20 : 85 5b __ STA T6 + 0 
2b22 : ad f3 bf LDA $bff3 ; (sstack + 7)
2b25 : f0 14 __ BEQ $2b3b ; (sformat.s13 + 0)
.s14:
2b27 : a5 57 __ LDA T4 + 0 
2b29 : 85 0e __ STA P1 
2b2b : a5 58 __ LDA T4 + 1 
2b2d : 85 0f __ STA P2 
2b2f : a9 00 __ LDA #$00
2b31 : a4 43 __ LDY T0 + 0 
2b33 : 91 0e __ STA (P1),y 
2b35 : 20 f0 2e JSR $2ef0 ; (puts.l4 + 0)
2b38 : 4c cb 2a JMP $2acb ; (sformat.l5 + 0)
.s13:
2b3b : 18 __ __ CLC
2b3c : a5 57 __ LDA T4 + 0 
2b3e : 65 43 __ ADC T0 + 0 
2b40 : 85 57 __ STA T4 + 0 
2b42 : 90 87 __ BCC $2acb ; (sformat.l5 + 0)
.s116:
2b44 : e6 58 __ INC T4 + 1 
2b46 : b0 83 __ BCS $2acb ; (sformat.l5 + 0)
.s15:
2b48 : a5 5b __ LDA T6 + 0 
2b4a : f0 27 __ BEQ $2b73 ; (sformat.s16 + 0)
.s88:
2b4c : 84 5b __ STY T6 + 0 
2b4e : 85 43 __ STA T0 + 0 
2b50 : ad f3 bf LDA $bff3 ; (sstack + 7)
2b53 : f0 13 __ BEQ $2b68 ; (sformat.s89 + 0)
.s90:
2b55 : a5 57 __ LDA T4 + 0 
2b57 : 85 0e __ STA P1 
2b59 : a5 58 __ LDA T4 + 1 
2b5b : 85 0f __ STA P2 
2b5d : 98 __ __ TYA
2b5e : a4 43 __ LDY T0 + 0 
2b60 : 91 0e __ STA (P1),y 
2b62 : 20 f0 2e JSR $2ef0 ; (puts.l4 + 0)
2b65 : 4c 73 2b JMP $2b73 ; (sformat.s16 + 0)
.s89:
2b68 : 18 __ __ CLC
2b69 : a5 57 __ LDA T4 + 0 
2b6b : 65 43 __ ADC T0 + 0 
2b6d : 85 57 __ STA T4 + 0 
2b6f : 90 02 __ BCC $2b73 ; (sformat.s16 + 0)
.s113:
2b71 : e6 58 __ INC T4 + 1 
.s16:
2b73 : a9 00 __ LDA #$00
2b75 : 8d d9 bf STA $bfd9 ; (si.sign + 0)
2b78 : 8d da bf STA $bfda ; (si.left + 0)
2b7b : 8d db bf STA $bfdb ; (si.prefix + 0)
2b7e : a0 01 __ LDY #$01
2b80 : b1 55 __ LDA (T3 + 0),y 
2b82 : a2 20 __ LDX #$20
2b84 : 8e d4 bf STX $bfd4 ; (si.fill + 0)
2b87 : a2 00 __ LDX #$00
2b89 : 8e d5 bf STX $bfd5 ; (si.width + 0)
2b8c : ca __ __ DEX
2b8d : 8e d6 bf STX $bfd6 ; (si.precision + 0)
2b90 : a2 0a __ LDX #$0a
2b92 : 8e d8 bf STX $bfd8 ; (si.base + 0)
2b95 : aa __ __ TAX
2b96 : a9 02 __ LDA #$02
2b98 : d0 07 __ BNE $2ba1 ; (sformat.l17 + 0)
.s84:
2b9a : a0 00 __ LDY #$00
2b9c : b1 55 __ LDA (T3 + 0),y 
2b9e : aa __ __ TAX
2b9f : a9 01 __ LDA #$01
.l17:
2ba1 : 18 __ __ CLC
2ba2 : 65 55 __ ADC T3 + 0 
2ba4 : 85 55 __ STA T3 + 0 
2ba6 : 90 02 __ BCC $2baa ; (sformat.s104 + 0)
.s103:
2ba8 : e6 56 __ INC T3 + 1 
.s104:
2baa : e0 2b __ CPX #$2b
2bac : d0 07 __ BNE $2bb5 ; (sformat.s18 + 0)
.s87:
2bae : a9 01 __ LDA #$01
2bb0 : 8d d9 bf STA $bfd9 ; (si.sign + 0)
2bb3 : d0 e5 __ BNE $2b9a ; (sformat.s84 + 0)
.s18:
2bb5 : 8a __ __ TXA
2bb6 : e0 30 __ CPX #$30
2bb8 : d0 05 __ BNE $2bbf ; (sformat.s19 + 0)
.s86:
2bba : 8d d4 bf STA $bfd4 ; (si.fill + 0)
2bbd : f0 db __ BEQ $2b9a ; (sformat.s84 + 0)
.s19:
2bbf : c9 23 __ CMP #$23
2bc1 : d0 07 __ BNE $2bca ; (sformat.s20 + 0)
.s85:
2bc3 : a9 01 __ LDA #$01
2bc5 : 8d db bf STA $bfdb ; (si.prefix + 0)
2bc8 : d0 d0 __ BNE $2b9a ; (sformat.s84 + 0)
.s20:
2bca : c9 2d __ CMP #$2d
2bcc : d0 07 __ BNE $2bd5 ; (sformat.s21 + 0)
.s83:
2bce : a9 01 __ LDA #$01
2bd0 : 8d da bf STA $bfda ; (si.left + 0)
2bd3 : d0 c5 __ BNE $2b9a ; (sformat.s84 + 0)
.s21:
2bd5 : 85 47 __ STA T2 + 0 
2bd7 : c9 30 __ CMP #$30
2bd9 : 90 4a __ BCC $2c25 ; (sformat.s22 + 0)
.s79:
2bdb : e0 3a __ CPX #$3a
2bdd : 90 03 __ BCC $2be2 ; (sformat.s80 + 0)
2bdf : 4c 63 2c JMP $2c63 ; (sformat.s23 + 0)
.s80:
2be2 : a9 00 __ LDA #$00
2be4 : e0 3a __ CPX #$3a
2be6 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
2be8 : b0 34 __ BCS $2c1e ; (sformat.s102 + 0)
.s117:
2bea : 85 43 __ STA T0 + 0 
2bec : a4 55 __ LDY T3 + 0 
2bee : 85 55 __ STA T3 + 0 
.l82:
2bf0 : a5 43 __ LDA T0 + 0 
2bf2 : 0a __ __ ASL
2bf3 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2bf5 : a9 00 __ LDA #$00
2bf7 : 2a __ __ ROL
2bf8 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
2bfa : 2a __ __ ROL
2bfb : aa __ __ TAX
2bfc : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2bfe : 65 43 __ ADC T0 + 0 
2c00 : 0a __ __ ASL
2c01 : 18 __ __ CLC
2c02 : 65 47 __ ADC T2 + 0 
2c04 : 38 __ __ SEC
2c05 : e9 30 __ SBC #$30
2c07 : 85 43 __ STA T0 + 0 
2c09 : b1 55 __ LDA (T3 + 0),y 
2c0b : 85 47 __ STA T2 + 0 
2c0d : c8 __ __ INY
2c0e : d0 02 __ BNE $2c12 ; (sformat.s112 + 0)
.s111:
2c10 : e6 56 __ INC T3 + 1 
.s112:
2c12 : c9 30 __ CMP #$30
2c14 : 90 04 __ BCC $2c1a ; (sformat.s118 + 0)
.s81:
2c16 : c9 3a __ CMP #$3a
2c18 : 90 d6 __ BCC $2bf0 ; (sformat.l82 + 0)
.s118:
2c1a : 84 55 __ STY T3 + 0 
2c1c : a5 43 __ LDA T0 + 0 
.s102:
2c1e : 86 1c __ STX ACCU + 1 ; (fmt + 0)
2c20 : 8d d5 bf STA $bfd5 ; (si.width + 0)
2c23 : a5 47 __ LDA T2 + 0 
.s22:
2c25 : c9 2e __ CMP #$2e
2c27 : d0 3a __ BNE $2c63 ; (sformat.s23 + 0)
.s75:
2c29 : a9 00 __ LDA #$00
2c2b : a8 __ __ TAY
2c2c : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
2c2e : 4c 48 2c JMP $2c48 ; (sformat.l76 + 0)
.s78:
2c31 : a5 43 __ LDA T0 + 0 
2c33 : 0a __ __ ASL
2c34 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2c36 : 98 __ __ TYA
2c37 : 2a __ __ ROL
2c38 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
2c3a : 2a __ __ ROL
2c3b : aa __ __ TAX
2c3c : 18 __ __ CLC
2c3d : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2c3f : 65 43 __ ADC T0 + 0 
2c41 : 0a __ __ ASL
2c42 : 18 __ __ CLC
2c43 : 65 47 __ ADC T2 + 0 
2c45 : 38 __ __ SEC
2c46 : e9 30 __ SBC #$30
.l76:
2c48 : 85 43 __ STA T0 + 0 
2c4a : b1 55 __ LDA (T3 + 0),y 
2c4c : 85 47 __ STA T2 + 0 
2c4e : e6 55 __ INC T3 + 0 
2c50 : d0 02 __ BNE $2c54 ; (sformat.s106 + 0)
.s105:
2c52 : e6 56 __ INC T3 + 1 
.s106:
2c54 : c9 30 __ CMP #$30
2c56 : 90 04 __ BCC $2c5c ; (sformat.s101 + 0)
.s77:
2c58 : c9 3a __ CMP #$3a
2c5a : 90 d5 __ BCC $2c31 ; (sformat.s78 + 0)
.s101:
2c5c : 86 1c __ STX ACCU + 1 ; (fmt + 0)
2c5e : a6 43 __ LDX T0 + 0 
2c60 : 8e d6 bf STX $bfd6 ; (si.precision + 0)
.s23:
2c63 : c9 64 __ CMP #$64
2c65 : f0 0c __ BEQ $2c73 ; (sformat.s74 + 0)
.s24:
2c67 : c9 44 __ CMP #$44
2c69 : f0 08 __ BEQ $2c73 ; (sformat.s74 + 0)
.s25:
2c6b : c9 69 __ CMP #$69
2c6d : f0 04 __ BEQ $2c73 ; (sformat.s74 + 0)
.s26:
2c6f : c9 49 __ CMP #$49
2c71 : d0 05 __ BNE $2c78 ; (sformat.s27 + 0)
.s74:
2c73 : a9 01 __ LDA #$01
2c75 : 4c b4 2e JMP $2eb4 ; (sformat.s73 + 0)
.s27:
2c78 : c9 75 __ CMP #$75
2c7a : d0 03 __ BNE $2c7f ; (sformat.s28 + 0)
2c7c : 4c b2 2e JMP $2eb2 ; (sformat.s119 + 0)
.s28:
2c7f : c9 55 __ CMP #$55
2c81 : f0 f9 __ BEQ $2c7c ; (sformat.s27 + 4)
.s29:
2c83 : c9 78 __ CMP #$78
2c85 : f0 04 __ BEQ $2c8b ; (sformat.s72 + 0)
.s30:
2c87 : c9 58 __ CMP #$58
2c89 : d0 0f __ BNE $2c9a ; (sformat.s31 + 0)
.s72:
2c8b : 29 e0 __ AND #$e0
2c8d : 09 01 __ ORA #$01
2c8f : 8d d7 bf STA $bfd7 ; (si.cha + 0)
2c92 : a9 10 __ LDA #$10
2c94 : 8d d8 bf STA $bfd8 ; (si.base + 0)
2c97 : 4c b2 2e JMP $2eb2 ; (sformat.s119 + 0)
.s31:
2c9a : c9 6c __ CMP #$6c
2c9c : d0 03 __ BNE $2ca1 ; (sformat.s32 + 0)
2c9e : 4c 23 2e JMP $2e23 ; (sformat.s60 + 0)
.s32:
2ca1 : c9 4c __ CMP #$4c
2ca3 : f0 f9 __ BEQ $2c9e ; (sformat.s31 + 4)
.s33:
2ca5 : c9 66 __ CMP #$66
2ca7 : f0 14 __ BEQ $2cbd ; (sformat.s59 + 0)
.s34:
2ca9 : c9 67 __ CMP #$67
2cab : f0 10 __ BEQ $2cbd ; (sformat.s59 + 0)
.s35:
2cad : c9 65 __ CMP #$65
2caf : f0 0c __ BEQ $2cbd ; (sformat.s59 + 0)
.s36:
2cb1 : c9 46 __ CMP #$46
2cb3 : f0 08 __ BEQ $2cbd ; (sformat.s59 + 0)
.s37:
2cb5 : c9 47 __ CMP #$47
2cb7 : f0 04 __ BEQ $2cbd ; (sformat.s59 + 0)
.s38:
2cb9 : c9 45 __ CMP #$45
2cbb : d0 5c __ BNE $2d19 ; (sformat.s39 + 0)
.s59:
2cbd : a5 57 __ LDA T4 + 0 
2cbf : 85 13 __ STA P6 
2cc1 : a5 58 __ LDA T4 + 1 
2cc3 : 85 14 __ STA P7 
2cc5 : a5 47 __ LDA T2 + 0 
2cc7 : 29 e0 __ AND #$e0
2cc9 : 09 01 __ ORA #$01
2ccb : 8d d7 bf STA $bfd7 ; (si.cha + 0)
2cce : ad f1 bf LDA $bff1 ; (sstack + 5)
2cd1 : 85 59 __ STA T5 + 0 
2cd3 : a9 d4 __ LDA #$d4
2cd5 : 85 11 __ STA P4 
2cd7 : a9 bf __ LDA #$bf
2cd9 : 85 12 __ STA P5 
2cdb : ad f2 bf LDA $bff2 ; (sstack + 6)
2cde : 85 5a __ STA T5 + 1 
2ce0 : a0 00 __ LDY #$00
2ce2 : b1 59 __ LDA (T5 + 0),y 
2ce4 : 85 15 __ STA P8 
2ce6 : c8 __ __ INY
2ce7 : b1 59 __ LDA (T5 + 0),y 
2ce9 : 85 16 __ STA P9 
2ceb : c8 __ __ INY
2cec : b1 59 __ LDA (T5 + 0),y 
2cee : 85 17 __ STA P10 
2cf0 : c8 __ __ INY
2cf1 : b1 59 __ LDA (T5 + 0),y 
2cf3 : 85 18 __ STA P11 
2cf5 : a5 47 __ LDA T2 + 0 
2cf7 : ed d7 bf SBC $bfd7 ; (si.cha + 0)
2cfa : 18 __ __ CLC
2cfb : 69 61 __ ADC #$61
2cfd : 8d ec bf STA $bfec ; (sstack + 0)
2d00 : 20 cd 31 JSR $31cd ; (nformf.s1 + 0)
2d03 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2d05 : 85 5b __ STA T6 + 0 
2d07 : 18 __ __ CLC
2d08 : a5 59 __ LDA T5 + 0 
2d0a : 69 04 __ ADC #$04
2d0c : 8d f1 bf STA $bff1 ; (sstack + 5)
2d0f : a5 5a __ LDA T5 + 1 
2d11 : 69 00 __ ADC #$00
2d13 : 8d f2 bf STA $bff2 ; (sstack + 6)
2d16 : 4c cb 2a JMP $2acb ; (sformat.l5 + 0)
.s39:
2d19 : c9 73 __ CMP #$73
2d1b : f0 3b __ BEQ $2d58 ; (sformat.s47 + 0)
.s40:
2d1d : c9 53 __ CMP #$53
2d1f : f0 37 __ BEQ $2d58 ; (sformat.s47 + 0)
.s41:
2d21 : c9 63 __ CMP #$63
2d23 : f0 12 __ BEQ $2d37 ; (sformat.s46 + 0)
.s42:
2d25 : c9 43 __ CMP #$43
2d27 : f0 0e __ BEQ $2d37 ; (sformat.s46 + 0)
.s43:
2d29 : aa __ __ TAX
2d2a : f0 ea __ BEQ $2d16 ; (sformat.s59 + 89)
.s44:
2d2c : a0 00 __ LDY #$00
2d2e : 91 57 __ STA (T4 + 0),y 
.s45:
2d30 : a9 01 __ LDA #$01
.s94:
2d32 : 85 5b __ STA T6 + 0 
2d34 : 4c cb 2a JMP $2acb ; (sformat.l5 + 0)
.s46:
2d37 : ad f1 bf LDA $bff1 ; (sstack + 5)
2d3a : 85 43 __ STA T0 + 0 
2d3c : ad f2 bf LDA $bff2 ; (sstack + 6)
2d3f : 85 44 __ STA T0 + 1 
2d41 : a0 00 __ LDY #$00
2d43 : b1 43 __ LDA (T0 + 0),y 
2d45 : 91 57 __ STA (T4 + 0),y 
2d47 : a5 43 __ LDA T0 + 0 
2d49 : 69 01 __ ADC #$01
2d4b : 8d f1 bf STA $bff1 ; (sstack + 5)
2d4e : a5 44 __ LDA T0 + 1 
2d50 : 69 00 __ ADC #$00
2d52 : 8d f2 bf STA $bff2 ; (sstack + 6)
2d55 : 4c 30 2d JMP $2d30 ; (sformat.s45 + 0)
.s47:
2d58 : ad f1 bf LDA $bff1 ; (sstack + 5)
2d5b : 85 43 __ STA T0 + 0 
2d5d : 69 01 __ ADC #$01
2d5f : 8d f1 bf STA $bff1 ; (sstack + 5)
2d62 : ad f2 bf LDA $bff2 ; (sstack + 6)
2d65 : 85 44 __ STA T0 + 1 
2d67 : 69 00 __ ADC #$00
2d69 : 8d f2 bf STA $bff2 ; (sstack + 6)
2d6c : a0 00 __ LDY #$00
2d6e : 84 5c __ STY T7 + 0 
2d70 : b1 43 __ LDA (T0 + 0),y 
2d72 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2d74 : 85 53 __ STA T1 + 0 
2d76 : c8 __ __ INY
2d77 : b1 43 __ LDA (T0 + 0),y 
2d79 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
2d7b : 85 54 __ STA T1 + 1 
2d7d : ad d5 bf LDA $bfd5 ; (si.width + 0)
2d80 : f0 0c __ BEQ $2d8e ; (sformat.s48 + 0)
.s98:
2d82 : 88 __ __ DEY
2d83 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
2d85 : f0 05 __ BEQ $2d8c ; (sformat.s99 + 0)
.l58:
2d87 : c8 __ __ INY
2d88 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
2d8a : d0 fb __ BNE $2d87 ; (sformat.l58 + 0)
.s99:
2d8c : 84 5c __ STY T7 + 0 
.s48:
2d8e : ad da bf LDA $bfda ; (si.left + 0)
2d91 : 85 59 __ STA T5 + 0 
2d93 : d0 19 __ BNE $2dae ; (sformat.s49 + 0)
.s96:
2d95 : a6 5c __ LDX T7 + 0 
2d97 : ec d5 bf CPX $bfd5 ; (si.width + 0)
2d9a : a0 00 __ LDY #$00
2d9c : b0 0c __ BCS $2daa ; (sformat.s97 + 0)
.l57:
2d9e : ad d4 bf LDA $bfd4 ; (si.fill + 0)
2da1 : 91 57 __ STA (T4 + 0),y 
2da3 : c8 __ __ INY
2da4 : e8 __ __ INX
2da5 : ec d5 bf CPX $bfd5 ; (si.width + 0)
2da8 : 90 f4 __ BCC $2d9e ; (sformat.l57 + 0)
.s97:
2daa : 86 5c __ STX T7 + 0 
2dac : 84 5b __ STY T6 + 0 
.s49:
2dae : ac f3 bf LDY $bff3 ; (sstack + 7)
2db1 : d0 48 __ BNE $2dfb ; (sformat.s54 + 0)
.s50:
2db3 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
2db5 : f0 23 __ BEQ $2dda ; (sformat.s51 + 0)
.s53:
2db7 : 18 __ __ CLC
2db8 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2dba : 69 01 __ ADC #$01
2dbc : 85 43 __ STA T0 + 0 
2dbe : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
2dc0 : 69 00 __ ADC #$00
2dc2 : 85 44 __ STA T0 + 1 
2dc4 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l91:
2dc6 : a4 5b __ LDY T6 + 0 
2dc8 : 91 57 __ STA (T4 + 0),y 
2dca : a0 00 __ LDY #$00
2dcc : b1 43 __ LDA (T0 + 0),y 
2dce : a8 __ __ TAY
2dcf : e6 43 __ INC T0 + 0 
2dd1 : d0 02 __ BNE $2dd5 ; (sformat.s110 + 0)
.s109:
2dd3 : e6 44 __ INC T0 + 1 
.s110:
2dd5 : e6 5b __ INC T6 + 0 
2dd7 : 98 __ __ TYA
2dd8 : d0 ec __ BNE $2dc6 ; (sformat.l91 + 0)
.s51:
2dda : a5 59 __ LDA T5 + 0 
2ddc : d0 03 __ BNE $2de1 ; (sformat.s95 + 0)
2dde : 4c cb 2a JMP $2acb ; (sformat.l5 + 0)
.s95:
2de1 : a6 5c __ LDX T7 + 0 
2de3 : ec d5 bf CPX $bfd5 ; (si.width + 0)
2de6 : a4 5b __ LDY T6 + 0 
2de8 : b0 0c __ BCS $2df6 ; (sformat.s100 + 0)
.l52:
2dea : ad d4 bf LDA $bfd4 ; (si.fill + 0)
2ded : 91 57 __ STA (T4 + 0),y 
2def : c8 __ __ INY
2df0 : e8 __ __ INX
2df1 : ec d5 bf CPX $bfd5 ; (si.width + 0)
2df4 : 90 f4 __ BCC $2dea ; (sformat.l52 + 0)
.s100:
2df6 : 84 5b __ STY T6 + 0 
2df8 : 4c cb 2a JMP $2acb ; (sformat.l5 + 0)
.s54:
2dfb : a4 5b __ LDY T6 + 0 
2dfd : f0 11 __ BEQ $2e10 ; (sformat.s55 + 0)
.s56:
2dff : a5 57 __ LDA T4 + 0 
2e01 : 85 0e __ STA P1 
2e03 : a5 58 __ LDA T4 + 1 
2e05 : 85 0f __ STA P2 
2e07 : a9 00 __ LDA #$00
2e09 : 85 5b __ STA T6 + 0 
2e0b : 91 0e __ STA (P1),y 
2e0d : 20 f0 2e JSR $2ef0 ; (puts.l4 + 0)
.s55:
2e10 : a5 53 __ LDA T1 + 0 
2e12 : 85 0e __ STA P1 
2e14 : a5 54 __ LDA T1 + 1 
2e16 : 85 0f __ STA P2 
2e18 : 20 f0 2e JSR $2ef0 ; (puts.l4 + 0)
2e1b : ad da bf LDA $bfda ; (si.left + 0)
2e1e : d0 c1 __ BNE $2de1 ; (sformat.s95 + 0)
2e20 : 4c cb 2a JMP $2acb ; (sformat.l5 + 0)
.s60:
2e23 : ad f1 bf LDA $bff1 ; (sstack + 5)
2e26 : 85 43 __ STA T0 + 0 
2e28 : 69 03 __ ADC #$03
2e2a : 8d f1 bf STA $bff1 ; (sstack + 5)
2e2d : ad f2 bf LDA $bff2 ; (sstack + 6)
2e30 : 85 44 __ STA T0 + 1 
2e32 : 69 00 __ ADC #$00
2e34 : 8d f2 bf STA $bff2 ; (sstack + 6)
2e37 : a0 00 __ LDY #$00
2e39 : b1 55 __ LDA (T3 + 0),y 
2e3b : aa __ __ TAX
2e3c : e6 55 __ INC T3 + 0 
2e3e : d0 02 __ BNE $2e42 ; (sformat.s108 + 0)
.s107:
2e40 : e6 56 __ INC T3 + 1 
.s108:
2e42 : b1 43 __ LDA (T0 + 0),y 
2e44 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2e46 : 85 11 __ STA P4 
2e48 : a0 01 __ LDY #$01
2e4a : b1 43 __ LDA (T0 + 0),y 
2e4c : 85 1c __ STA ACCU + 1 ; (fmt + 0)
2e4e : 85 12 __ STA P5 
2e50 : c8 __ __ INY
2e51 : b1 43 __ LDA (T0 + 0),y 
2e53 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
2e55 : 85 13 __ STA P6 
2e57 : c8 __ __ INY
2e58 : b1 43 __ LDA (T0 + 0),y 
2e5a : 85 14 __ STA P7 
2e5c : e0 64 __ CPX #$64
2e5e : f0 0c __ BEQ $2e6c ; (sformat.s71 + 0)
.s61:
2e60 : e0 44 __ CPX #$44
2e62 : f0 08 __ BEQ $2e6c ; (sformat.s71 + 0)
.s62:
2e64 : e0 69 __ CPX #$69
2e66 : f0 04 __ BEQ $2e6c ; (sformat.s71 + 0)
.s63:
2e68 : e0 49 __ CPX #$49
2e6a : d0 1c __ BNE $2e88 ; (sformat.s64 + 0)
.s71:
2e6c : a9 01 __ LDA #$01
.s92:
2e6e : 85 15 __ STA P8 
.s69:
2e70 : a5 57 __ LDA T4 + 0 
2e72 : 85 0f __ STA P2 
2e74 : a5 58 __ LDA T4 + 1 
2e76 : 85 10 __ STA P3 
2e78 : a9 d4 __ LDA #$d4
2e7a : 85 0d __ STA P0 
2e7c : a9 bf __ LDA #$bf
2e7e : 85 0e __ STA P1 
2e80 : 20 82 30 JSR $3082 ; (nforml.s4 + 0)
2e83 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2e85 : 4c 32 2d JMP $2d32 ; (sformat.s94 + 0)
.s64:
2e88 : e0 75 __ CPX #$75
2e8a : f0 04 __ BEQ $2e90 ; (sformat.s70 + 0)
.s65:
2e8c : e0 55 __ CPX #$55
2e8e : d0 04 __ BNE $2e94 ; (sformat.s66 + 0)
.s70:
2e90 : a9 00 __ LDA #$00
2e92 : f0 da __ BEQ $2e6e ; (sformat.s92 + 0)
.s66:
2e94 : e0 78 __ CPX #$78
2e96 : f0 06 __ BEQ $2e9e ; (sformat.s68 + 0)
.s67:
2e98 : 85 1e __ STA ACCU + 3 ; (fps + 0)
2e9a : e0 58 __ CPX #$58
2e9c : d0 82 __ BNE $2e20 ; (sformat.s55 + 16)
.s68:
2e9e : a9 10 __ LDA #$10
2ea0 : 8d d8 bf STA $bfd8 ; (si.base + 0)
2ea3 : a9 00 __ LDA #$00
2ea5 : 85 15 __ STA P8 
2ea7 : 8a __ __ TXA
2ea8 : 29 e0 __ AND #$e0
2eaa : 09 01 __ ORA #$01
2eac : 8d d7 bf STA $bfd7 ; (si.cha + 0)
2eaf : 4c 70 2e JMP $2e70 ; (sformat.s69 + 0)
.s119:
2eb2 : a9 00 __ LDA #$00
.s73:
2eb4 : 85 13 __ STA P6 
2eb6 : a5 57 __ LDA T4 + 0 
2eb8 : 85 0f __ STA P2 
2eba : a5 58 __ LDA T4 + 1 
2ebc : 85 10 __ STA P3 
2ebe : ad f1 bf LDA $bff1 ; (sstack + 5)
2ec1 : 85 43 __ STA T0 + 0 
2ec3 : ad f2 bf LDA $bff2 ; (sstack + 6)
2ec6 : 85 44 __ STA T0 + 1 
2ec8 : a0 00 __ LDY #$00
2eca : b1 43 __ LDA (T0 + 0),y 
2ecc : 85 11 __ STA P4 
2ece : c8 __ __ INY
2ecf : b1 43 __ LDA (T0 + 0),y 
2ed1 : 85 12 __ STA P5 
2ed3 : 18 __ __ CLC
2ed4 : a5 43 __ LDA T0 + 0 
2ed6 : 69 02 __ ADC #$02
2ed8 : 8d f1 bf STA $bff1 ; (sstack + 5)
2edb : a5 44 __ LDA T0 + 1 
2edd : 69 00 __ ADC #$00
2edf : 8d f2 bf STA $bff2 ; (sstack + 6)
2ee2 : a9 d4 __ LDA #$d4
2ee4 : 85 0d __ STA P0 
2ee6 : a9 bf __ LDA #$bf
2ee8 : 85 0e __ STA P1 
2eea : 20 6d 2f JSR $2f6d ; (nformi.s4 + 0)
2eed : 4c 32 2d JMP $2d32 ; (sformat.s94 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "D:/Arbeit/dev/oscar64/include/stdio.h"
.l4:
2ef0 : a0 00 __ LDY #$00
2ef2 : b1 0e __ LDA (P1),y ; (str + 0)
2ef4 : aa __ __ TAX
2ef5 : 18 __ __ CLC
2ef6 : a5 0e __ LDA P1 ; (str + 0)
2ef8 : 69 01 __ ADC #$01
2efa : 85 0e __ STA P1 ; (str + 0)
2efc : 8a __ __ TXA
2efd : d0 01 __ BNE $2f00 ; (puts.s5 + 0)
.s3:
2eff : 60 __ __ RTS
.s5:
2f00 : 90 02 __ BCC $2f04 ; (puts.s7 + 0)
.s6:
2f02 : e6 0f __ INC P2 ; (str + 1)
.s7:
2f04 : 20 0a 2f JSR $2f0a ; (putpch.s4 + 0)
2f07 : 4c f0 2e JMP $2ef0 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "D:/Arbeit/dev/oscar64/include/conio.h"
.s4:
2f0a : 85 0d __ STA P0 ; (c + 0)
2f0c : ad fd 36 LDA $36fd ; (giocharmap + 0)
2f0f : f0 32 __ BEQ $2f43 ; (putpch.s5 + 0)
.s6:
2f11 : a5 0d __ LDA P0 ; (c + 0)
2f13 : c9 0a __ CMP #$0a
2f15 : d0 04 __ BNE $2f1b ; (putpch.s7 + 0)
.s18:
2f17 : a9 0d __ LDA #$0d
2f19 : d0 32 __ BNE $2f4d ; (putpch.s15 + 0)
.s7:
2f1b : c9 09 __ CMP #$09
2f1d : f0 36 __ BEQ $2f55 ; (putpch.s16 + 0)
.s8:
2f1f : ad fd 36 LDA $36fd ; (giocharmap + 0)
2f22 : c9 02 __ CMP #$02
2f24 : 90 1d __ BCC $2f43 ; (putpch.s5 + 0)
.s9:
2f26 : a5 0d __ LDA P0 ; (c + 0)
2f28 : c9 41 __ CMP #$41
2f2a : 90 17 __ BCC $2f43 ; (putpch.s5 + 0)
.s10:
2f2c : c9 7b __ CMP #$7b
2f2e : b0 13 __ BCS $2f43 ; (putpch.s5 + 0)
.s11:
2f30 : c9 61 __ CMP #$61
2f32 : b0 04 __ BCS $2f38 ; (putpch.s13 + 0)
.s12:
2f34 : c9 5b __ CMP #$5b
2f36 : b0 0b __ BCS $2f43 ; (putpch.s5 + 0)
.s13:
2f38 : 49 20 __ EOR #$20
2f3a : 85 0d __ STA P0 ; (c + 0)
2f3c : ad fd 36 LDA $36fd ; (giocharmap + 0)
2f3f : c9 02 __ CMP #$02
2f41 : f0 06 __ BEQ $2f49 ; (putpch.s14 + 0)
.s5:
2f43 : a5 0d __ LDA P0 ; (c + 0)
2f45 : 20 d2 ff JSR $ffd2 
.s3:
2f48 : 60 __ __ RTS
.s14:
2f49 : a5 0d __ LDA P0 ; (c + 0)
2f4b : 29 5f __ AND #$5f
.s15:
2f4d : 85 43 __ STA T0 + 0 
2f4f : a5 43 __ LDA T0 + 0 
2f51 : 20 d2 ff JSR $ffd2 
2f54 : 60 __ __ RTS
.s16:
2f55 : a5 d3 __ LDA $d3 
2f57 : 29 03 __ AND #$03
2f59 : 85 43 __ STA T0 + 0 
2f5b : a9 20 __ LDA #$20
2f5d : 85 44 __ STA T1 + 0 
.l17:
2f5f : a5 44 __ LDA T1 + 0 
2f61 : 20 d2 ff JSR $ffd2 
2f64 : e6 43 __ INC T0 + 0 
2f66 : a5 43 __ LDA T0 + 0 
2f68 : c9 04 __ CMP #$04
2f6a : 90 f3 __ BCC $2f5f ; (putpch.l17 + 0)
2f6c : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s4:
2f6d : a9 00 __ LDA #$00
2f6f : 85 43 __ STA T5 + 0 
2f71 : a0 04 __ LDY #$04
2f73 : b1 0d __ LDA (P0),y ; (si + 0)
2f75 : 85 44 __ STA T6 + 0 
2f77 : a5 13 __ LDA P6 ; (s + 0)
2f79 : f0 13 __ BEQ $2f8e ; (nformi.s5 + 0)
.s34:
2f7b : 24 12 __ BIT P5 ; (v + 1)
2f7d : 10 0f __ BPL $2f8e ; (nformi.s5 + 0)
.s35:
2f7f : 38 __ __ SEC
2f80 : a9 00 __ LDA #$00
2f82 : e5 11 __ SBC P4 ; (v + 0)
2f84 : 85 11 __ STA P4 ; (v + 0)
2f86 : a9 00 __ LDA #$00
2f88 : e5 12 __ SBC P5 ; (v + 1)
2f8a : 85 12 __ STA P5 ; (v + 1)
2f8c : e6 43 __ INC T5 + 0 
.s5:
2f8e : a9 10 __ LDA #$10
2f90 : 85 45 __ STA T7 + 0 
2f92 : a5 11 __ LDA P4 ; (v + 0)
2f94 : 05 12 __ ORA P5 ; (v + 1)
2f96 : f0 2d __ BEQ $2fc5 ; (nformi.s6 + 0)
.s29:
2f98 : a5 11 __ LDA P4 ; (v + 0)
2f9a : 85 1b __ STA ACCU + 0 
2f9c : a5 12 __ LDA P5 ; (v + 1)
2f9e : 85 1c __ STA ACCU + 1 
.l30:
2fa0 : a5 44 __ LDA T6 + 0 
2fa2 : 20 08 57 JSR $5708 ; (divmod + 53)
2fa5 : a5 05 __ LDA WORK + 2 
2fa7 : c9 0a __ CMP #$0a
2fa9 : b0 04 __ BCS $2faf ; (nformi.s33 + 0)
.s31:
2fab : a9 30 __ LDA #$30
2fad : 90 06 __ BCC $2fb5 ; (nformi.s32 + 0)
.s33:
2faf : a0 03 __ LDY #$03
2fb1 : b1 0d __ LDA (P0),y ; (si + 0)
2fb3 : e9 0a __ SBC #$0a
.s32:
2fb5 : 18 __ __ CLC
2fb6 : 65 05 __ ADC WORK + 2 
2fb8 : a6 45 __ LDX T7 + 0 
2fba : 9d db bf STA $bfdb,x ; (si.prefix + 0)
2fbd : c6 45 __ DEC T7 + 0 
2fbf : a5 1b __ LDA ACCU + 0 
2fc1 : 05 1c __ ORA ACCU + 1 
2fc3 : d0 db __ BNE $2fa0 ; (nformi.l30 + 0)
.s6:
2fc5 : a9 ff __ LDA #$ff
2fc7 : a0 02 __ LDY #$02
2fc9 : d1 0d __ CMP (P0),y ; (si + 0)
2fcb : d0 04 __ BNE $2fd1 ; (nformi.s28 + 0)
.s7:
2fcd : a9 0f __ LDA #$0f
2fcf : d0 05 __ BNE $2fd6 ; (nformi.s40 + 0)
.s28:
2fd1 : 38 __ __ SEC
2fd2 : a9 10 __ LDA #$10
2fd4 : f1 0d __ SBC (P0),y ; (si + 0)
.s40:
2fd6 : a8 __ __ TAY
2fd7 : c4 45 __ CPY T7 + 0 
2fd9 : b0 0d __ BCS $2fe8 ; (nformi.s8 + 0)
.s27:
2fdb : a9 30 __ LDA #$30
.l41:
2fdd : a6 45 __ LDX T7 + 0 
2fdf : 9d db bf STA $bfdb,x ; (si.prefix + 0)
2fe2 : c6 45 __ DEC T7 + 0 
2fe4 : c4 45 __ CPY T7 + 0 
2fe6 : 90 f5 __ BCC $2fdd ; (nformi.l41 + 0)
.s8:
2fe8 : a0 07 __ LDY #$07
2fea : b1 0d __ LDA (P0),y ; (si + 0)
2fec : f0 1c __ BEQ $300a ; (nformi.s9 + 0)
.s25:
2fee : a5 44 __ LDA T6 + 0 
2ff0 : c9 10 __ CMP #$10
2ff2 : d0 16 __ BNE $300a ; (nformi.s9 + 0)
.s26:
2ff4 : a0 03 __ LDY #$03
2ff6 : b1 0d __ LDA (P0),y ; (si + 0)
2ff8 : a8 __ __ TAY
2ff9 : a9 30 __ LDA #$30
2ffb : a6 45 __ LDX T7 + 0 
2ffd : 9d da bf STA $bfda,x ; (si.left + 0)
3000 : 98 __ __ TYA
3001 : 69 16 __ ADC #$16
3003 : 9d db bf STA $bfdb,x ; (si.prefix + 0)
3006 : ca __ __ DEX
3007 : ca __ __ DEX
3008 : 86 45 __ STX T7 + 0 
.s9:
300a : a9 00 __ LDA #$00
300c : 85 1b __ STA ACCU + 0 
300e : a5 43 __ LDA T5 + 0 
3010 : f0 0c __ BEQ $301e ; (nformi.s10 + 0)
.s24:
3012 : a9 2d __ LDA #$2d
.s23:
3014 : a6 45 __ LDX T7 + 0 
3016 : 9d db bf STA $bfdb,x ; (si.prefix + 0)
3019 : c6 45 __ DEC T7 + 0 
301b : 4c 28 30 JMP $3028 ; (nformi.s11 + 0)
.s10:
301e : a0 05 __ LDY #$05
3020 : b1 0d __ LDA (P0),y ; (si + 0)
3022 : f0 04 __ BEQ $3028 ; (nformi.s11 + 0)
.s22:
3024 : a9 2b __ LDA #$2b
3026 : d0 ec __ BNE $3014 ; (nformi.s23 + 0)
.s11:
3028 : a6 45 __ LDX T7 + 0 
302a : a0 06 __ LDY #$06
302c : b1 0d __ LDA (P0),y ; (si + 0)
302e : d0 2b __ BNE $305b ; (nformi.s18 + 0)
.l12:
3030 : 8a __ __ TXA
3031 : 18 __ __ CLC
3032 : a0 01 __ LDY #$01
3034 : 71 0d __ ADC (P0),y ; (si + 0)
3036 : b0 04 __ BCS $303c ; (nformi.s16 + 0)
.s17:
3038 : c9 11 __ CMP #$11
303a : 90 0a __ BCC $3046 ; (nformi.s13 + 0)
.s16:
303c : a0 00 __ LDY #$00
303e : b1 0d __ LDA (P0),y ; (si + 0)
3040 : 9d db bf STA $bfdb,x ; (si.prefix + 0)
3043 : ca __ __ DEX
3044 : b0 ea __ BCS $3030 ; (nformi.l12 + 0)
.s13:
3046 : e0 10 __ CPX #$10
3048 : b0 0e __ BCS $3058 ; (nformi.s14 + 0)
.s15:
304a : 88 __ __ DEY
.l38:
304b : bd dc bf LDA $bfdc,x ; (buffer[0] + 0)
304e : 91 0f __ STA (P2),y ; (str + 0)
3050 : c8 __ __ INY
3051 : e8 __ __ INX
3052 : e0 10 __ CPX #$10
3054 : 90 f5 __ BCC $304b ; (nformi.l38 + 0)
.s39:
3056 : 84 1b __ STY ACCU + 0 
.s14:
3058 : a5 1b __ LDA ACCU + 0 
.s3:
305a : 60 __ __ RTS
.s18:
305b : e0 10 __ CPX #$10
305d : b0 1a __ BCS $3079 ; (nformi.l19 + 0)
.s21:
305f : a0 00 __ LDY #$00
.l36:
3061 : bd dc bf LDA $bfdc,x ; (buffer[0] + 0)
3064 : 91 0f __ STA (P2),y ; (str + 0)
3066 : c8 __ __ INY
3067 : e8 __ __ INX
3068 : e0 10 __ CPX #$10
306a : 90 f5 __ BCC $3061 ; (nformi.l36 + 0)
.s37:
306c : 84 1b __ STY ACCU + 0 
306e : b0 09 __ BCS $3079 ; (nformi.l19 + 0)
.s20:
3070 : 88 __ __ DEY
3071 : b1 0d __ LDA (P0),y ; (si + 0)
3073 : a4 1b __ LDY ACCU + 0 
3075 : 91 0f __ STA (P2),y ; (str + 0)
3077 : e6 1b __ INC ACCU + 0 
.l19:
3079 : a5 1b __ LDA ACCU + 0 
307b : a0 01 __ LDY #$01
307d : d1 0d __ CMP (P0),y ; (si + 0)
307f : 90 ef __ BCC $3070 ; (nformi.s20 + 0)
3081 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s4:
3082 : a9 00 __ LDA #$00
3084 : 85 43 __ STA T4 + 0 
3086 : a5 15 __ LDA P8 ; (s + 0)
3088 : f0 1f __ BEQ $30a9 ; (nforml.s5 + 0)
.s35:
308a : 24 14 __ BIT P7 ; (v + 3)
308c : 10 1b __ BPL $30a9 ; (nforml.s5 + 0)
.s36:
308e : 38 __ __ SEC
308f : a9 00 __ LDA #$00
3091 : e5 11 __ SBC P4 ; (v + 0)
3093 : 85 11 __ STA P4 ; (v + 0)
3095 : a9 00 __ LDA #$00
3097 : e5 12 __ SBC P5 ; (v + 1)
3099 : 85 12 __ STA P5 ; (v + 1)
309b : a9 00 __ LDA #$00
309d : e5 13 __ SBC P6 ; (v + 2)
309f : 85 13 __ STA P6 ; (v + 2)
30a1 : a9 00 __ LDA #$00
30a3 : e5 14 __ SBC P7 ; (v + 3)
30a5 : 85 14 __ STA P7 ; (v + 3)
30a7 : e6 43 __ INC T4 + 0 
.s5:
30a9 : a9 10 __ LDA #$10
30ab : 85 44 __ STA T5 + 0 
30ad : a5 14 __ LDA P7 ; (v + 3)
30af : d0 0c __ BNE $30bd ; (nforml.l43 + 0)
.s31:
30b1 : a5 13 __ LDA P6 ; (v + 2)
30b3 : d0 08 __ BNE $30bd ; (nforml.l43 + 0)
.s32:
30b5 : a5 12 __ LDA P5 ; (v + 1)
30b7 : d0 04 __ BNE $30bd ; (nforml.l43 + 0)
.s33:
30b9 : c5 11 __ CMP P4 ; (v + 0)
30bb : b0 13 __ BCS $30d0 ; (nforml.s6 + 0)
.l43:
30bd : a5 11 __ LDA P4 ; (v + 0)
30bf : 85 1b __ STA ACCU + 0 
30c1 : a5 12 __ LDA P5 ; (v + 1)
30c3 : 85 1c __ STA ACCU + 1 
30c5 : a5 13 __ LDA P6 ; (v + 2)
30c7 : 85 1d __ STA ACCU + 2 
30c9 : a5 14 __ LDA P7 ; (v + 3)
30cb : 85 1e __ STA ACCU + 3 
30cd : 4c 8c 31 JMP $318c ; (nforml.l28 + 0)
.s6:
30d0 : a9 ff __ LDA #$ff
30d2 : a0 02 __ LDY #$02
30d4 : d1 0d __ CMP (P0),y ; (si + 0)
30d6 : d0 04 __ BNE $30dc ; (nforml.s27 + 0)
.s7:
30d8 : a9 0f __ LDA #$0f
30da : d0 05 __ BNE $30e1 ; (nforml.s41 + 0)
.s27:
30dc : 38 __ __ SEC
30dd : a9 10 __ LDA #$10
30df : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
30e1 : a8 __ __ TAY
30e2 : c4 44 __ CPY T5 + 0 
30e4 : b0 0d __ BCS $30f3 ; (nforml.s8 + 0)
.s26:
30e6 : a9 30 __ LDA #$30
.l42:
30e8 : a6 44 __ LDX T5 + 0 
30ea : 9d db bf STA $bfdb,x ; (si.prefix + 0)
30ed : c6 44 __ DEC T5 + 0 
30ef : c4 44 __ CPY T5 + 0 
30f1 : 90 f5 __ BCC $30e8 ; (nforml.l42 + 0)
.s8:
30f3 : a0 07 __ LDY #$07
30f5 : b1 0d __ LDA (P0),y ; (si + 0)
30f7 : f0 1d __ BEQ $3116 ; (nforml.s9 + 0)
.s24:
30f9 : a9 10 __ LDA #$10
30fb : a0 04 __ LDY #$04
30fd : d1 0d __ CMP (P0),y ; (si + 0)
30ff : d0 15 __ BNE $3116 ; (nforml.s9 + 0)
.s25:
3101 : 88 __ __ DEY
3102 : b1 0d __ LDA (P0),y ; (si + 0)
3104 : a8 __ __ TAY
3105 : a9 30 __ LDA #$30
3107 : a6 44 __ LDX T5 + 0 
3109 : 9d da bf STA $bfda,x ; (si.left + 0)
310c : 98 __ __ TYA
310d : 69 16 __ ADC #$16
310f : 9d db bf STA $bfdb,x ; (si.prefix + 0)
3112 : ca __ __ DEX
3113 : ca __ __ DEX
3114 : 86 44 __ STX T5 + 0 
.s9:
3116 : a9 00 __ LDA #$00
3118 : 85 1b __ STA ACCU + 0 
311a : a5 43 __ LDA T4 + 0 
311c : f0 0c __ BEQ $312a ; (nforml.s10 + 0)
.s23:
311e : a9 2d __ LDA #$2d
.s22:
3120 : a6 44 __ LDX T5 + 0 
3122 : 9d db bf STA $bfdb,x ; (si.prefix + 0)
3125 : c6 44 __ DEC T5 + 0 
3127 : 4c 34 31 JMP $3134 ; (nforml.s11 + 0)
.s10:
312a : a0 05 __ LDY #$05
312c : b1 0d __ LDA (P0),y ; (si + 0)
312e : f0 04 __ BEQ $3134 ; (nforml.s11 + 0)
.s21:
3130 : a9 2b __ LDA #$2b
3132 : d0 ec __ BNE $3120 ; (nforml.s22 + 0)
.s11:
3134 : a0 06 __ LDY #$06
3136 : a6 44 __ LDX T5 + 0 
3138 : b1 0d __ LDA (P0),y ; (si + 0)
313a : d0 29 __ BNE $3165 ; (nforml.s17 + 0)
.l12:
313c : 8a __ __ TXA
313d : 18 __ __ CLC
313e : a0 01 __ LDY #$01
3140 : 71 0d __ ADC (P0),y ; (si + 0)
3142 : b0 04 __ BCS $3148 ; (nforml.s15 + 0)
.s16:
3144 : c9 11 __ CMP #$11
3146 : 90 0a __ BCC $3152 ; (nforml.s13 + 0)
.s15:
3148 : a0 00 __ LDY #$00
314a : b1 0d __ LDA (P0),y ; (si + 0)
314c : 9d db bf STA $bfdb,x ; (si.prefix + 0)
314f : ca __ __ DEX
3150 : b0 ea __ BCS $313c ; (nforml.l12 + 0)
.s13:
3152 : e0 10 __ CPX #$10
3154 : b0 0e __ BCS $3164 ; (nforml.s3 + 0)
.s14:
3156 : 88 __ __ DEY
.l39:
3157 : bd dc bf LDA $bfdc,x ; (buffer[0] + 0)
315a : 91 0f __ STA (P2),y ; (str + 0)
315c : c8 __ __ INY
315d : e8 __ __ INX
315e : e0 10 __ CPX #$10
3160 : 90 f5 __ BCC $3157 ; (nforml.l39 + 0)
.s40:
3162 : 84 1b __ STY ACCU + 0 
.s3:
3164 : 60 __ __ RTS
.s17:
3165 : e0 10 __ CPX #$10
3167 : b0 1a __ BCS $3183 ; (nforml.l18 + 0)
.s20:
3169 : a0 00 __ LDY #$00
.l37:
316b : bd dc bf LDA $bfdc,x ; (buffer[0] + 0)
316e : 91 0f __ STA (P2),y ; (str + 0)
3170 : c8 __ __ INY
3171 : e8 __ __ INX
3172 : e0 10 __ CPX #$10
3174 : 90 f5 __ BCC $316b ; (nforml.l37 + 0)
.s38:
3176 : 84 1b __ STY ACCU + 0 
3178 : b0 09 __ BCS $3183 ; (nforml.l18 + 0)
.s19:
317a : 88 __ __ DEY
317b : b1 0d __ LDA (P0),y ; (si + 0)
317d : a4 1b __ LDY ACCU + 0 
317f : 91 0f __ STA (P2),y ; (str + 0)
3181 : e6 1b __ INC ACCU + 0 
.l18:
3183 : a5 1b __ LDA ACCU + 0 
3185 : a0 01 __ LDY #$01
3187 : d1 0d __ CMP (P0),y ; (si + 0)
3189 : 90 ef __ BCC $317a ; (nforml.s19 + 0)
318b : 60 __ __ RTS
.l28:
318c : a0 04 __ LDY #$04
318e : b1 0d __ LDA (P0),y ; (si + 0)
3190 : 85 03 __ STA WORK + 0 
3192 : a9 00 __ LDA #$00
3194 : 85 04 __ STA WORK + 1 
3196 : 85 05 __ STA WORK + 2 
3198 : 85 06 __ STA WORK + 3 
319a : 20 46 59 JSR $5946 ; (divmod32 + 0)
319d : a5 07 __ LDA WORK + 4 
319f : c9 0a __ CMP #$0a
31a1 : b0 04 __ BCS $31a7 ; (nforml.s34 + 0)
.s29:
31a3 : a9 30 __ LDA #$30
31a5 : 90 06 __ BCC $31ad ; (nforml.s30 + 0)
.s34:
31a7 : a0 03 __ LDY #$03
31a9 : b1 0d __ LDA (P0),y ; (si + 0)
31ab : e9 0a __ SBC #$0a
.s30:
31ad : 18 __ __ CLC
31ae : 65 07 __ ADC WORK + 4 
31b0 : a6 44 __ LDX T5 + 0 
31b2 : 9d db bf STA $bfdb,x ; (si.prefix + 0)
31b5 : a5 1b __ LDA ACCU + 0 
31b7 : 85 11 __ STA P4 ; (v + 0)
31b9 : a5 1c __ LDA ACCU + 1 
31bb : 85 12 __ STA P5 ; (v + 1)
31bd : a5 1d __ LDA ACCU + 2 
31bf : 85 13 __ STA P6 ; (v + 2)
31c1 : a5 1e __ LDA ACCU + 3 
31c3 : 85 14 __ STA P7 ; (v + 3)
31c5 : c6 44 __ DEC T5 + 0 
31c7 : aa __ __ TAX
31c8 : d0 c2 __ BNE $318c ; (nforml.l28 + 0)
31ca : 4c b1 30 JMP $30b1 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "D:/Arbeit/dev/oscar64/include/stdio.c"
.s1:
31cd : a2 03 __ LDX #$03
31cf : b5 53 __ LDA T7 + 0,x 
31d1 : 9d e3 bf STA $bfe3,x ; (nformf@stack + 0)
31d4 : ca __ __ DEX
31d5 : 10 f8 __ BPL $31cf ; (nformf.s1 + 2)
.s4:
31d7 : a5 16 __ LDA P9 ; (f + 1)
31d9 : 85 44 __ STA T0 + 1 
31db : a5 17 __ LDA P10 ; (f + 2)
31dd : 85 45 __ STA T0 + 2 
31df : a5 18 __ LDA P11 ; (f + 3)
31e1 : 29 7f __ AND #$7f
31e3 : 05 17 __ ORA P10 ; (f + 2)
31e5 : 05 16 __ ORA P9 ; (f + 1)
31e7 : 05 15 __ ORA P8 ; (f + 0)
31e9 : f0 21 __ BEQ $320c ; (nformf.s5 + 0)
.s91:
31eb : 24 18 __ BIT P11 ; (f + 3)
31ed : 10 1d __ BPL $320c ; (nformf.s5 + 0)
.s90:
31ef : a9 2d __ LDA #$2d
31f1 : a0 00 __ LDY #$00
31f3 : 91 13 __ STA (P6),y ; (str + 0)
31f5 : a5 18 __ LDA P11 ; (f + 3)
31f7 : 49 80 __ EOR #$80
31f9 : 85 18 __ STA P11 ; (f + 3)
31fb : 85 10 __ STA P3 
31fd : a5 15 __ LDA P8 ; (f + 0)
31ff : 85 0d __ STA P0 
3201 : a5 16 __ LDA P9 ; (f + 1)
3203 : 85 0e __ STA P1 
3205 : a5 17 __ LDA P10 ; (f + 2)
3207 : 85 0f __ STA P2 
3209 : 4c d0 36 JMP $36d0 ; (nformf.s88 + 0)
.s5:
320c : a5 15 __ LDA P8 ; (f + 0)
320e : 85 0d __ STA P0 
3210 : a5 16 __ LDA P9 ; (f + 1)
3212 : 85 0e __ STA P1 
3214 : a5 17 __ LDA P10 ; (f + 2)
3216 : 85 0f __ STA P2 
3218 : a5 18 __ LDA P11 ; (f + 3)
321a : 85 10 __ STA P3 
321c : a0 05 __ LDY #$05
321e : b1 11 __ LDA (P4),y ; (si + 0)
3220 : f0 09 __ BEQ $322b ; (nformf.s6 + 0)
.s87:
3222 : a9 2b __ LDA #$2b
3224 : a0 00 __ LDY #$00
3226 : 91 13 __ STA (P6),y ; (str + 0)
3228 : 4c d0 36 JMP $36d0 ; (nformf.s88 + 0)
.s6:
322b : 20 e1 36 JSR $36e1 ; (isinf.s4 + 0)
322e : a2 00 __ LDX #$00
3230 : 86 54 __ STX T9 + 0 
3232 : a8 __ __ TAY
3233 : f0 05 __ BEQ $323a ; (nformf.s7 + 0)
.s85:
3235 : a9 02 __ LDA #$02
3237 : 4c a0 36 JMP $36a0 ; (nformf.s86 + 0)
.s7:
323a : a5 11 __ LDA P4 ; (si + 0)
323c : 85 4b __ STA T2 + 0 
323e : a5 12 __ LDA P5 ; (si + 1)
3240 : 85 4c __ STA T2 + 1 
3242 : a0 02 __ LDY #$02
3244 : b1 11 __ LDA (P4),y ; (si + 0)
3246 : c9 ff __ CMP #$ff
3248 : d0 02 __ BNE $324c ; (nformf.s84 + 0)
.s8:
324a : a9 06 __ LDA #$06
.s84:
324c : 85 52 __ STA T6 + 0 
324e : a9 00 __ LDA #$00
3250 : 85 4f __ STA T4 + 0 
3252 : 85 50 __ STA T4 + 1 
3254 : a5 15 __ LDA P8 ; (f + 0)
3256 : 85 43 __ STA T0 + 0 
3258 : a5 18 __ LDA P11 ; (f + 3)
325a : 85 46 __ STA T0 + 3 
325c : 29 7f __ AND #$7f
325e : 05 17 __ ORA P10 ; (f + 2)
3260 : 05 16 __ ORA P9 ; (f + 1)
3262 : 05 15 __ ORA P8 ; (f + 0)
3264 : d0 03 __ BNE $3269 ; (nformf.s63 + 0)
3266 : 4c 68 33 JMP $3368 ; (nformf.s9 + 0)
.s63:
3269 : a5 18 __ LDA P11 ; (f + 3)
326b : 30 67 __ BMI $32d4 ; (nformf.l72 + 0)
.s81:
326d : c9 44 __ CMP #$44
326f : d0 06 __ BNE $3277 ; (nformf.l83 + 0)
.s82:
3271 : a5 17 __ LDA P10 ; (f + 2)
3273 : c9 7a __ CMP #$7a
3275 : f0 02 __ BEQ $3279 ; (nformf.l78 + 0)
.l83:
3277 : 90 4b __ BCC $32c4 ; (nformf.s64 + 0)
.l78:
3279 : 18 __ __ CLC
327a : a5 4f __ LDA T4 + 0 
327c : 69 03 __ ADC #$03
327e : 85 4f __ STA T4 + 0 
3280 : 90 02 __ BCC $3284 ; (nformf.s105 + 0)
.s104:
3282 : e6 50 __ INC T4 + 1 
.s105:
3284 : a5 43 __ LDA T0 + 0 
3286 : 85 1b __ STA ACCU + 0 
3288 : a5 44 __ LDA T0 + 1 
328a : 85 1c __ STA ACCU + 1 
328c : a5 45 __ LDA T0 + 2 
328e : 85 1d __ STA ACCU + 2 
3290 : a5 46 __ LDA T0 + 3 
3292 : 85 1e __ STA ACCU + 3 
3294 : a9 00 __ LDA #$00
3296 : 85 03 __ STA WORK + 0 
3298 : 85 04 __ STA WORK + 1 
329a : a9 7a __ LDA #$7a
329c : 85 05 __ STA WORK + 2 
329e : a9 44 __ LDA #$44
32a0 : 85 06 __ STA WORK + 3 
32a2 : 20 c3 53 JSR $53c3 ; (freg + 20)
32a5 : 20 a9 55 JSR $55a9 ; (crt_fdiv + 0)
32a8 : a5 1b __ LDA ACCU + 0 
32aa : 85 43 __ STA T0 + 0 
32ac : a5 1c __ LDA ACCU + 1 
32ae : 85 44 __ STA T0 + 1 
32b0 : a6 1d __ LDX ACCU + 2 
32b2 : 86 45 __ STX T0 + 2 
32b4 : a5 1e __ LDA ACCU + 3 
32b6 : 85 46 __ STA T0 + 3 
32b8 : 30 0a __ BMI $32c4 ; (nformf.s64 + 0)
.s79:
32ba : c9 44 __ CMP #$44
32bc : d0 b9 __ BNE $3277 ; (nformf.l83 + 0)
.s80:
32be : e0 7a __ CPX #$7a
32c0 : f0 b7 __ BEQ $3279 ; (nformf.l78 + 0)
32c2 : d0 b3 __ BNE $3277 ; (nformf.l83 + 0)
.s64:
32c4 : a5 46 __ LDA T0 + 3 
32c6 : 30 0c __ BMI $32d4 ; (nformf.l72 + 0)
.s76:
32c8 : c9 3f __ CMP #$3f
32ca : d0 06 __ BNE $32d2 ; (nformf.s75 + 0)
.s77:
32cc : a5 45 __ LDA T0 + 2 
32ce : c9 80 __ CMP #$80
32d0 : f0 40 __ BEQ $3312 ; (nformf.s65 + 0)
.s75:
32d2 : b0 3e __ BCS $3312 ; (nformf.s65 + 0)
.l72:
32d4 : 38 __ __ SEC
32d5 : a5 4f __ LDA T4 + 0 
32d7 : e9 03 __ SBC #$03
32d9 : 85 4f __ STA T4 + 0 
32db : b0 02 __ BCS $32df ; (nformf.s100 + 0)
.s99:
32dd : c6 50 __ DEC T4 + 1 
.s100:
32df : a9 00 __ LDA #$00
32e1 : 85 1b __ STA ACCU + 0 
32e3 : 85 1c __ STA ACCU + 1 
32e5 : a9 7a __ LDA #$7a
32e7 : 85 1d __ STA ACCU + 2 
32e9 : a9 44 __ LDA #$44
32eb : 85 1e __ STA ACCU + 3 
32ed : a2 43 __ LDX #$43
32ef : 20 b3 53 JSR $53b3 ; (freg + 4)
32f2 : 20 e1 54 JSR $54e1 ; (crt_fmul + 0)
32f5 : a5 1b __ LDA ACCU + 0 
32f7 : 85 43 __ STA T0 + 0 
32f9 : a5 1c __ LDA ACCU + 1 
32fb : 85 44 __ STA T0 + 1 
32fd : a6 1d __ LDX ACCU + 2 
32ff : 86 45 __ STX T0 + 2 
3301 : a5 1e __ LDA ACCU + 3 
3303 : 85 46 __ STA T0 + 3 
3305 : 30 cd __ BMI $32d4 ; (nformf.l72 + 0)
.s73:
3307 : c9 3f __ CMP #$3f
3309 : 90 c9 __ BCC $32d4 ; (nformf.l72 + 0)
.s109:
330b : d0 05 __ BNE $3312 ; (nformf.s65 + 0)
.s74:
330d : e0 80 __ CPX #$80
330f : 4c d2 32 JMP $32d2 ; (nformf.s75 + 0)
.s65:
3312 : a5 46 __ LDA T0 + 3 
3314 : 30 52 __ BMI $3368 ; (nformf.s9 + 0)
.s69:
3316 : c9 41 __ CMP #$41
3318 : d0 06 __ BNE $3320 ; (nformf.l71 + 0)
.s70:
331a : a5 45 __ LDA T0 + 2 
331c : c9 20 __ CMP #$20
331e : f0 02 __ BEQ $3322 ; (nformf.l66 + 0)
.l71:
3320 : 90 46 __ BCC $3368 ; (nformf.s9 + 0)
.l66:
3322 : e6 4f __ INC T4 + 0 
3324 : d0 02 __ BNE $3328 ; (nformf.s103 + 0)
.s102:
3326 : e6 50 __ INC T4 + 1 
.s103:
3328 : a5 43 __ LDA T0 + 0 
332a : 85 1b __ STA ACCU + 0 
332c : a5 44 __ LDA T0 + 1 
332e : 85 1c __ STA ACCU + 1 
3330 : a5 45 __ LDA T0 + 2 
3332 : 85 1d __ STA ACCU + 2 
3334 : a5 46 __ LDA T0 + 3 
3336 : 85 1e __ STA ACCU + 3 
3338 : a9 00 __ LDA #$00
333a : 85 03 __ STA WORK + 0 
333c : 85 04 __ STA WORK + 1 
333e : a9 20 __ LDA #$20
3340 : 85 05 __ STA WORK + 2 
3342 : a9 41 __ LDA #$41
3344 : 85 06 __ STA WORK + 3 
3346 : 20 c3 53 JSR $53c3 ; (freg + 20)
3349 : 20 a9 55 JSR $55a9 ; (crt_fdiv + 0)
334c : a5 1b __ LDA ACCU + 0 
334e : 85 43 __ STA T0 + 0 
3350 : a5 1c __ LDA ACCU + 1 
3352 : 85 44 __ STA T0 + 1 
3354 : a6 1d __ LDX ACCU + 2 
3356 : 86 45 __ STX T0 + 2 
3358 : a5 1e __ LDA ACCU + 3 
335a : 85 46 __ STA T0 + 3 
335c : 30 0a __ BMI $3368 ; (nformf.s9 + 0)
.s67:
335e : c9 41 __ CMP #$41
3360 : d0 be __ BNE $3320 ; (nformf.l71 + 0)
.s68:
3362 : e0 20 __ CPX #$20
3364 : f0 bc __ BEQ $3322 ; (nformf.l66 + 0)
3366 : d0 b8 __ BNE $3320 ; (nformf.l71 + 0)
.s9:
3368 : ad ec bf LDA $bfec ; (sstack + 0)
336b : c9 65 __ CMP #$65
336d : d0 04 __ BNE $3373 ; (nformf.s11 + 0)
.s10:
336f : a9 01 __ LDA #$01
3371 : d0 02 __ BNE $3375 ; (nformf.s12 + 0)
.s11:
3373 : a9 00 __ LDA #$00
.s12:
3375 : 85 55 __ STA T10 + 0 
3377 : a6 52 __ LDX T6 + 0 
3379 : e8 __ __ INX
337a : 86 51 __ STX T5 + 0 
337c : ad ec bf LDA $bfec ; (sstack + 0)
337f : c9 67 __ CMP #$67
3381 : d0 13 __ BNE $3396 ; (nformf.s13 + 0)
.s59:
3383 : a5 50 __ LDA T4 + 1 
3385 : 30 08 __ BMI $338f ; (nformf.s60 + 0)
.s62:
3387 : d0 06 __ BNE $338f ; (nformf.s60 + 0)
.s61:
3389 : a5 4f __ LDA T4 + 0 
338b : c9 04 __ CMP #$04
338d : 90 07 __ BCC $3396 ; (nformf.s13 + 0)
.s60:
338f : a9 01 __ LDA #$01
3391 : 85 55 __ STA T10 + 0 
3393 : 4c 0d 36 JMP $360d ; (nformf.s51 + 0)
.s13:
3396 : a5 55 __ LDA T10 + 0 
3398 : d0 f9 __ BNE $3393 ; (nformf.s60 + 4)
.s14:
339a : 24 50 __ BIT T4 + 1 
339c : 10 43 __ BPL $33e1 ; (nformf.s15 + 0)
.s50:
339e : a5 43 __ LDA T0 + 0 
33a0 : 85 1b __ STA ACCU + 0 
33a2 : a5 44 __ LDA T0 + 1 
33a4 : 85 1c __ STA ACCU + 1 
33a6 : a5 45 __ LDA T0 + 2 
33a8 : 85 1d __ STA ACCU + 2 
33aa : a5 46 __ LDA T0 + 3 
33ac : 85 1e __ STA ACCU + 3 
.l92:
33ae : a9 00 __ LDA #$00
33b0 : 85 03 __ STA WORK + 0 
33b2 : 85 04 __ STA WORK + 1 
33b4 : a9 20 __ LDA #$20
33b6 : 85 05 __ STA WORK + 2 
33b8 : a9 41 __ LDA #$41
33ba : 85 06 __ STA WORK + 3 
33bc : 20 c3 53 JSR $53c3 ; (freg + 20)
33bf : 20 a9 55 JSR $55a9 ; (crt_fdiv + 0)
33c2 : 18 __ __ CLC
33c3 : a5 4f __ LDA T4 + 0 
33c5 : 69 01 __ ADC #$01
33c7 : 85 4f __ STA T4 + 0 
33c9 : a5 50 __ LDA T4 + 1 
33cb : 69 00 __ ADC #$00
33cd : 85 50 __ STA T4 + 1 
33cf : 30 dd __ BMI $33ae ; (nformf.l92 + 0)
.s93:
33d1 : a5 1e __ LDA ACCU + 3 
33d3 : 85 46 __ STA T0 + 3 
33d5 : a5 1d __ LDA ACCU + 2 
33d7 : 85 45 __ STA T0 + 2 
33d9 : a5 1c __ LDA ACCU + 1 
33db : 85 44 __ STA T0 + 1 
33dd : a5 1b __ LDA ACCU + 0 
33df : 85 43 __ STA T0 + 0 
.s15:
33e1 : 18 __ __ CLC
33e2 : a5 52 __ LDA T6 + 0 
33e4 : 65 4f __ ADC T4 + 0 
33e6 : 18 __ __ CLC
33e7 : 69 01 __ ADC #$01
33e9 : 85 51 __ STA T5 + 0 
33eb : c9 07 __ CMP #$07
33ed : 90 14 __ BCC $3403 ; (nformf.s49 + 0)
.s16:
33ef : ad 18 5b LDA $5b18 ; (fround5[0] + 24)
33f2 : 85 47 __ STA T1 + 0 
33f4 : ad 19 5b LDA $5b19 ; (fround5[0] + 25)
33f7 : 85 48 __ STA T1 + 1 
33f9 : ad 1a 5b LDA $5b1a ; (fround5[0] + 26)
33fc : 85 49 __ STA T1 + 2 
33fe : ad 1b 5b LDA $5b1b ; (fround5[0] + 27)
3401 : b0 15 __ BCS $3418 ; (nformf.s17 + 0)
.s49:
3403 : 0a __ __ ASL
3404 : 0a __ __ ASL
3405 : aa __ __ TAX
3406 : bd fc 5a LDA $5afc,x ; (plane_data_count + 1)
3409 : 85 47 __ STA T1 + 0 
340b : bd fd 5a LDA $5afd,x ; (wireframeOn + 0)
340e : 85 48 __ STA T1 + 1 
3410 : bd fe 5a LDA $5afe,x ; (wireframeOn + 1)
3413 : 85 49 __ STA T1 + 2 
3415 : bd ff 5a LDA $5aff,x 
.s17:
3418 : 85 4a __ STA T1 + 3 
341a : a5 43 __ LDA T0 + 0 
341c : 85 1b __ STA ACCU + 0 
341e : a5 44 __ LDA T0 + 1 
3420 : 85 1c __ STA ACCU + 1 
3422 : a5 45 __ LDA T0 + 2 
3424 : 85 1d __ STA ACCU + 2 
3426 : a5 46 __ LDA T0 + 3 
3428 : 85 1e __ STA ACCU + 3 
342a : a2 47 __ LDX #$47
342c : 20 b3 53 JSR $53b3 ; (freg + 4)
342f : 20 fa 53 JSR $53fa ; (faddsub + 6)
3432 : a5 1c __ LDA ACCU + 1 
3434 : 85 16 __ STA P9 ; (f + 1)
3436 : a5 1d __ LDA ACCU + 2 
3438 : 85 17 __ STA P10 ; (f + 2)
343a : a6 1b __ LDX ACCU + 0 
343c : a5 1e __ LDA ACCU + 3 
343e : 85 18 __ STA P11 ; (f + 3)
3440 : 30 30 __ BMI $3472 ; (nformf.s18 + 0)
.s46:
3442 : c9 41 __ CMP #$41
3444 : d0 06 __ BNE $344c ; (nformf.s48 + 0)
.s47:
3446 : a5 17 __ LDA P10 ; (f + 2)
3448 : c9 20 __ CMP #$20
344a : f0 02 __ BEQ $344e ; (nformf.s45 + 0)
.s48:
344c : 90 24 __ BCC $3472 ; (nformf.s18 + 0)
.s45:
344e : a9 00 __ LDA #$00
3450 : 85 03 __ STA WORK + 0 
3452 : 85 04 __ STA WORK + 1 
3454 : a9 20 __ LDA #$20
3456 : 85 05 __ STA WORK + 2 
3458 : a9 41 __ LDA #$41
345a : 85 06 __ STA WORK + 3 
345c : 20 c3 53 JSR $53c3 ; (freg + 20)
345f : 20 a9 55 JSR $55a9 ; (crt_fdiv + 0)
3462 : a5 1c __ LDA ACCU + 1 
3464 : 85 16 __ STA P9 ; (f + 1)
3466 : a5 1d __ LDA ACCU + 2 
3468 : 85 17 __ STA P10 ; (f + 2)
346a : a5 1e __ LDA ACCU + 3 
346c : 85 18 __ STA P11 ; (f + 3)
346e : c6 52 __ DEC T6 + 0 
3470 : a6 1b __ LDX ACCU + 0 
.s18:
3472 : 38 __ __ SEC
3473 : a5 51 __ LDA T5 + 0 
3475 : e5 52 __ SBC T6 + 0 
3477 : 85 4d __ STA T3 + 0 
3479 : a5 51 __ LDA T5 + 0 
347b : c9 15 __ CMP #$15
347d : 90 04 __ BCC $3483 ; (nformf.s19 + 0)
.s44:
347f : a9 14 __ LDA #$14
3481 : 85 51 __ STA T5 + 0 
.s19:
3483 : a5 4d __ LDA T3 + 0 
3485 : d0 08 __ BNE $348f ; (nformf.s21 + 0)
.s20:
3487 : a9 30 __ LDA #$30
3489 : a4 54 __ LDY T9 + 0 
348b : 91 13 __ STA (P6),y ; (str + 0)
348d : e6 54 __ INC T9 + 0 
.s21:
348f : a9 00 __ LDA #$00
3491 : 85 56 __ STA T11 + 0 
3493 : c5 4d __ CMP T3 + 0 
3495 : f0 6f __ BEQ $3506 ; (nformf.l43 + 0)
.s23:
3497 : c9 07 __ CMP #$07
3499 : 90 04 __ BCC $349f ; (nformf.s24 + 0)
.l42:
349b : a9 30 __ LDA #$30
349d : b0 55 __ BCS $34f4 ; (nformf.l25 + 0)
.s24:
349f : 86 1b __ STX ACCU + 0 
34a1 : 86 43 __ STX T0 + 0 
34a3 : a5 16 __ LDA P9 ; (f + 1)
34a5 : 85 1c __ STA ACCU + 1 
34a7 : 85 44 __ STA T0 + 1 
34a9 : a5 17 __ LDA P10 ; (f + 2)
34ab : 85 1d __ STA ACCU + 2 
34ad : 85 45 __ STA T0 + 2 
34af : a5 18 __ LDA P11 ; (f + 3)
34b1 : 85 1e __ STA ACCU + 3 
34b3 : 85 46 __ STA T0 + 3 
34b5 : 20 8b 57 JSR $578b ; (f32_to_i16 + 0)
34b8 : a5 1b __ LDA ACCU + 0 
34ba : 85 53 __ STA T7 + 0 
34bc : 20 d7 57 JSR $57d7 ; (sint16_to_float + 0)
34bf : a2 43 __ LDX #$43
34c1 : 20 b3 53 JSR $53b3 ; (freg + 4)
34c4 : a5 1e __ LDA ACCU + 3 
34c6 : 49 80 __ EOR #$80
34c8 : 85 1e __ STA ACCU + 3 
34ca : 20 fa 53 JSR $53fa ; (faddsub + 6)
34cd : a9 00 __ LDA #$00
34cf : 85 03 __ STA WORK + 0 
34d1 : 85 04 __ STA WORK + 1 
34d3 : a9 20 __ LDA #$20
34d5 : 85 05 __ STA WORK + 2 
34d7 : a9 41 __ LDA #$41
34d9 : 85 06 __ STA WORK + 3 
34db : 20 c3 53 JSR $53c3 ; (freg + 20)
34de : 20 e1 54 JSR $54e1 ; (crt_fmul + 0)
34e1 : a5 1c __ LDA ACCU + 1 
34e3 : 85 16 __ STA P9 ; (f + 1)
34e5 : a5 1d __ LDA ACCU + 2 
34e7 : 85 17 __ STA P10 ; (f + 2)
34e9 : a5 1e __ LDA ACCU + 3 
34eb : 85 18 __ STA P11 ; (f + 3)
34ed : 18 __ __ CLC
34ee : a5 53 __ LDA T7 + 0 
34f0 : 69 30 __ ADC #$30
34f2 : a6 1b __ LDX ACCU + 0 
.l25:
34f4 : a4 54 __ LDY T9 + 0 
34f6 : 91 13 __ STA (P6),y ; (str + 0)
34f8 : e6 54 __ INC T9 + 0 
34fa : e6 56 __ INC T11 + 0 
34fc : a5 56 __ LDA T11 + 0 
34fe : c5 51 __ CMP T5 + 0 
3500 : b0 14 __ BCS $3516 ; (nformf.s26 + 0)
.s22:
3502 : c5 4d __ CMP T3 + 0 
3504 : d0 91 __ BNE $3497 ; (nformf.s23 + 0)
.l43:
3506 : a9 2e __ LDA #$2e
3508 : a4 54 __ LDY T9 + 0 
350a : 91 13 __ STA (P6),y ; (str + 0)
350c : a5 56 __ LDA T11 + 0 
350e : c9 07 __ CMP #$07
3510 : e6 54 __ INC T9 + 0 
3512 : 90 8b __ BCC $349f ; (nformf.s24 + 0)
3514 : b0 85 __ BCS $349b ; (nformf.l42 + 0)
.s26:
3516 : a5 55 __ LDA T10 + 0 
3518 : f0 66 __ BEQ $3580 ; (nformf.s27 + 0)
.s38:
351a : a0 03 __ LDY #$03
351c : b1 4b __ LDA (T2 + 0),y 
351e : 69 03 __ ADC #$03
3520 : a4 54 __ LDY T9 + 0 
3522 : 91 13 __ STA (P6),y ; (str + 0)
3524 : c8 __ __ INY
3525 : 84 54 __ STY T9 + 0 
3527 : 24 50 __ BIT T4 + 1 
3529 : 30 06 __ BMI $3531 ; (nformf.s41 + 0)
.s39:
352b : a9 2b __ LDA #$2b
352d : 91 13 __ STA (P6),y ; (str + 0)
352f : d0 11 __ BNE $3542 ; (nformf.s40 + 0)
.s41:
3531 : a9 2d __ LDA #$2d
3533 : 91 13 __ STA (P6),y ; (str + 0)
3535 : 38 __ __ SEC
3536 : a9 00 __ LDA #$00
3538 : e5 4f __ SBC T4 + 0 
353a : 85 4f __ STA T4 + 0 
353c : a9 00 __ LDA #$00
353e : e5 50 __ SBC T4 + 1 
3540 : 85 50 __ STA T4 + 1 
.s40:
3542 : a5 4f __ LDA T4 + 0 
3544 : 85 1b __ STA ACCU + 0 
3546 : a5 50 __ LDA T4 + 1 
3548 : 85 1c __ STA ACCU + 1 
354a : e6 54 __ INC T9 + 0 
354c : a9 0a __ LDA #$0a
354e : 85 03 __ STA WORK + 0 
3550 : a9 00 __ LDA #$00
3552 : 85 04 __ STA WORK + 1 
3554 : 20 99 56 JSR $5699 ; (divs16 + 0)
3557 : 18 __ __ CLC
3558 : a5 1b __ LDA ACCU + 0 
355a : 69 30 __ ADC #$30
355c : a4 54 __ LDY T9 + 0 
355e : 91 13 __ STA (P6),y ; (str + 0)
3560 : a5 4f __ LDA T4 + 0 
3562 : 85 1b __ STA ACCU + 0 
3564 : a5 50 __ LDA T4 + 1 
3566 : 85 1c __ STA ACCU + 1 
3568 : e6 54 __ INC T9 + 0 
356a : a9 0a __ LDA #$0a
356c : 85 03 __ STA WORK + 0 
356e : a9 00 __ LDA #$00
3570 : 85 04 __ STA WORK + 1 
3572 : 20 5e 57 JSR $575e ; (mods16 + 0)
3575 : 18 __ __ CLC
3576 : a5 05 __ LDA WORK + 2 
3578 : 69 30 __ ADC #$30
357a : a4 54 __ LDY T9 + 0 
357c : 91 13 __ STA (P6),y ; (str + 0)
357e : e6 54 __ INC T9 + 0 
.s27:
3580 : a5 54 __ LDA T9 + 0 
.s106:
3582 : a0 01 __ LDY #$01
3584 : d1 11 __ CMP (P4),y ; (si + 0)
3586 : b0 69 __ BCS $35f1 ; (nformf.s3 + 0)
.s28:
3588 : a0 06 __ LDY #$06
358a : b1 11 __ LDA (P4),y ; (si + 0)
358c : f0 04 __ BEQ $3592 ; (nformf.s29 + 0)
.s94:
358e : a6 54 __ LDX T9 + 0 
3590 : 90 6c __ BCC $35fe ; (nformf.l36 + 0)
.s29:
3592 : a5 54 __ LDA T9 + 0 
3594 : f0 3c __ BEQ $35d2 ; (nformf.s30 + 0)
.s35:
3596 : e9 00 __ SBC #$00
3598 : a2 00 __ LDX #$00
359a : b0 01 __ BCS $359d ; (nformf.s108 + 0)
.s107:
359c : ca __ __ DEX
.s108:
359d : 18 __ __ CLC
359e : 65 13 __ ADC P6 ; (str + 0)
35a0 : 85 47 __ STA T1 + 0 
35a2 : 8a __ __ TXA
35a3 : 65 14 __ ADC P7 ; (str + 1)
35a5 : 85 48 __ STA T1 + 1 
35a7 : a9 01 __ LDA #$01
35a9 : 85 4b __ STA T2 + 0 
35ab : a6 14 __ LDX P7 ; (str + 1)
35ad : 38 __ __ SEC
.l95:
35ae : a0 01 __ LDY #$01
35b0 : b1 11 __ LDA (P4),y ; (si + 0)
35b2 : e5 4b __ SBC T2 + 0 
35b4 : 85 4d __ STA T3 + 0 
35b6 : 8a __ __ TXA
35b7 : 69 ff __ ADC #$ff
35b9 : 85 4e __ STA T3 + 1 
35bb : 88 __ __ DEY
35bc : b1 47 __ LDA (T1 + 0),y 
35be : a4 13 __ LDY P6 ; (str + 0)
35c0 : 91 4d __ STA (T3 + 0),y 
35c2 : a5 47 __ LDA T1 + 0 
35c4 : d0 02 __ BNE $35c8 ; (nformf.s98 + 0)
.s97:
35c6 : c6 48 __ DEC T1 + 1 
.s98:
35c8 : c6 47 __ DEC T1 + 0 
35ca : e6 4b __ INC T2 + 0 
35cc : a5 54 __ LDA T9 + 0 
35ce : c5 4b __ CMP T2 + 0 
35d0 : b0 dc __ BCS $35ae ; (nformf.l95 + 0)
.s30:
35d2 : a9 00 __ LDA #$00
35d4 : 85 4d __ STA T3 + 0 
35d6 : 90 08 __ BCC $35e0 ; (nformf.l31 + 0)
.s33:
35d8 : a9 20 __ LDA #$20
35da : a4 4d __ LDY T3 + 0 
35dc : 91 13 __ STA (P6),y ; (str + 0)
35de : e6 4d __ INC T3 + 0 
.l31:
35e0 : a0 01 __ LDY #$01
35e2 : b1 11 __ LDA (P4),y ; (si + 0)
35e4 : 38 __ __ SEC
35e5 : e5 54 __ SBC T9 + 0 
35e7 : 90 ef __ BCC $35d8 ; (nformf.s33 + 0)
.s34:
35e9 : c5 4d __ CMP T3 + 0 
35eb : 90 02 __ BCC $35ef ; (nformf.s32 + 0)
.s96:
35ed : d0 e9 __ BNE $35d8 ; (nformf.s33 + 0)
.s32:
35ef : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
35f1 : 85 1b __ STA ACCU + 0 
35f3 : a2 03 __ LDX #$03
35f5 : bd e3 bf LDA $bfe3,x ; (nformf@stack + 0)
35f8 : 95 53 __ STA T7 + 0,x 
35fa : ca __ __ DEX
35fb : 10 f8 __ BPL $35f5 ; (nformf.s3 + 4)
35fd : 60 __ __ RTS
.l36:
35fe : 8a __ __ TXA
35ff : a0 01 __ LDY #$01
3601 : d1 11 __ CMP (P4),y ; (si + 0)
3603 : b0 ea __ BCS $35ef ; (nformf.s32 + 0)
.s37:
3605 : a8 __ __ TAY
3606 : a9 20 __ LDA #$20
3608 : 91 13 __ STA (P6),y ; (str + 0)
360a : e8 __ __ INX
360b : 90 f1 __ BCC $35fe ; (nformf.l36 + 0)
.s51:
360d : a5 51 __ LDA T5 + 0 
360f : c9 07 __ CMP #$07
3611 : 90 14 __ BCC $3627 ; (nformf.s58 + 0)
.s52:
3613 : ad 18 5b LDA $5b18 ; (fround5[0] + 24)
3616 : 85 47 __ STA T1 + 0 
3618 : ad 19 5b LDA $5b19 ; (fround5[0] + 25)
361b : 85 48 __ STA T1 + 1 
361d : ad 1a 5b LDA $5b1a ; (fround5[0] + 26)
3620 : 85 49 __ STA T1 + 2 
3622 : ad 1b 5b LDA $5b1b ; (fround5[0] + 27)
3625 : b0 15 __ BCS $363c ; (nformf.s53 + 0)
.s58:
3627 : 0a __ __ ASL
3628 : 0a __ __ ASL
3629 : aa __ __ TAX
362a : bd fc 5a LDA $5afc,x ; (plane_data_count + 1)
362d : 85 47 __ STA T1 + 0 
362f : bd fd 5a LDA $5afd,x ; (wireframeOn + 0)
3632 : 85 48 __ STA T1 + 1 
3634 : bd fe 5a LDA $5afe,x ; (wireframeOn + 1)
3637 : 85 49 __ STA T1 + 2 
3639 : bd ff 5a LDA $5aff,x 
.s53:
363c : 85 4a __ STA T1 + 3 
363e : a5 43 __ LDA T0 + 0 
3640 : 85 1b __ STA ACCU + 0 
3642 : a5 44 __ LDA T0 + 1 
3644 : 85 1c __ STA ACCU + 1 
3646 : a5 45 __ LDA T0 + 2 
3648 : 85 1d __ STA ACCU + 2 
364a : a5 46 __ LDA T0 + 3 
364c : 85 1e __ STA ACCU + 3 
364e : a2 47 __ LDX #$47
3650 : 20 b3 53 JSR $53b3 ; (freg + 4)
3653 : 20 fa 53 JSR $53fa ; (faddsub + 6)
3656 : a5 1c __ LDA ACCU + 1 
3658 : 85 16 __ STA P9 ; (f + 1)
365a : a5 1d __ LDA ACCU + 2 
365c : 85 17 __ STA P10 ; (f + 2)
365e : a6 1b __ LDX ACCU + 0 
3660 : a5 1e __ LDA ACCU + 3 
3662 : 85 18 __ STA P11 ; (f + 3)
3664 : 10 03 __ BPL $3669 ; (nformf.s55 + 0)
3666 : 4c 72 34 JMP $3472 ; (nformf.s18 + 0)
.s55:
3669 : c9 41 __ CMP #$41
366b : d0 06 __ BNE $3673 ; (nformf.s57 + 0)
.s56:
366d : a5 17 __ LDA P10 ; (f + 2)
366f : c9 20 __ CMP #$20
3671 : f0 02 __ BEQ $3675 ; (nformf.s54 + 0)
.s57:
3673 : 90 f1 __ BCC $3666 ; (nformf.s53 + 42)
.s54:
3675 : a9 00 __ LDA #$00
3677 : 85 03 __ STA WORK + 0 
3679 : 85 04 __ STA WORK + 1 
367b : a9 20 __ LDA #$20
367d : 85 05 __ STA WORK + 2 
367f : a9 41 __ LDA #$41
3681 : 85 06 __ STA WORK + 3 
3683 : 20 c3 53 JSR $53c3 ; (freg + 20)
3686 : 20 a9 55 JSR $55a9 ; (crt_fdiv + 0)
3689 : a5 1c __ LDA ACCU + 1 
368b : 85 16 __ STA P9 ; (f + 1)
368d : a5 1d __ LDA ACCU + 2 
368f : 85 17 __ STA P10 ; (f + 2)
3691 : a5 1e __ LDA ACCU + 3 
3693 : 85 18 __ STA P11 ; (f + 3)
3695 : a6 1b __ LDX ACCU + 0 
3697 : e6 4f __ INC T4 + 0 
3699 : d0 cb __ BNE $3666 ; (nformf.s53 + 42)
.s101:
369b : e6 50 __ INC T4 + 1 
369d : 4c 72 34 JMP $3472 ; (nformf.s18 + 0)
.s86:
36a0 : 86 43 __ STX T0 + 0 
36a2 : 85 47 __ STA T1 + 0 
36a4 : a0 03 __ LDY #$03
36a6 : b1 11 __ LDA (P4),y ; (si + 0)
36a8 : 18 __ __ CLC
36a9 : 69 08 __ ADC #$08
36ab : a4 43 __ LDY T0 + 0 
36ad : 91 13 __ STA (P6),y ; (str + 0)
36af : 18 __ __ CLC
36b0 : a0 03 __ LDY #$03
36b2 : b1 11 __ LDA (P4),y ; (si + 0)
36b4 : 69 0d __ ADC #$0d
36b6 : a4 43 __ LDY T0 + 0 
36b8 : c8 __ __ INY
36b9 : 91 13 __ STA (P6),y ; (str + 0)
36bb : a0 03 __ LDY #$03
36bd : b1 11 __ LDA (P4),y ; (si + 0)
36bf : 18 __ __ CLC
36c0 : 69 05 __ ADC #$05
36c2 : a4 47 __ LDY T1 + 0 
36c4 : 91 13 __ STA (P6),y ; (str + 0)
36c6 : 18 __ __ CLC
36c7 : a5 54 __ LDA T9 + 0 
36c9 : 69 03 __ ADC #$03
36cb : 85 54 __ STA T9 + 0 
36cd : 4c 82 35 JMP $3582 ; (nformf.s106 + 0)
.s88:
36d0 : 20 e1 36 JSR $36e1 ; (isinf.s4 + 0)
36d3 : a2 01 __ LDX #$01
36d5 : 86 54 __ STX T9 + 0 
36d7 : a8 __ __ TAY
36d8 : d0 03 __ BNE $36dd ; (nformf.s89 + 0)
36da : 4c 3a 32 JMP $323a ; (nformf.s7 + 0)
.s89:
36dd : a9 03 __ LDA #$03
36df : d0 bf __ BNE $36a0 ; (nformf.s86 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "D:/Arbeit/dev/oscar64/include/math.h"
.s4:
36e1 : 06 0f __ ASL P2 ; (f + 2)
36e3 : a5 10 __ LDA P3 ; (f + 3)
36e5 : 2a __ __ ROL
36e6 : c9 ff __ CMP #$ff
36e8 : d0 03 __ BNE $36ed ; (isinf.s6 + 0)
.s5:
36ea : a9 01 __ LDA #$01
36ec : 60 __ __ RTS
.s6:
36ed : a9 00 __ LDA #$00
.s3:
36ef : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
36f0 : 20 cf ff JSR $ffcf 
36f3 : 85 1b __ STA ACCU + 0 
.s3:
36f5 : a5 1b __ LDA ACCU + 0 
36f7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
36f8 : 20 cc ff JSR $ffcc 
.s3:
36fb : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
36fc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
36fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
plane_data:
36fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
3700 : __ __ __ BYT 45 52 52 4f 52 3a 20 46 49 4c 45 20 4e 4f 54 20 : ERROR: FILE NOT 
3710 : __ __ __ BYT 46 4f 55 4e 44 0a 00                            : FOUND..
--------------------------------------------------------------------
fgets: ; fgets(u8*,i16,struct FILE*)->u8*
;  46, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
3717 : a0 00 __ LDY #$00
3719 : b1 17 __ LDA (P10),y ; (stream + 0)
371b : 85 0e __ STA P1 
371d : a5 13 __ LDA P6 ; (s + 0)
371f : 85 0f __ STA P2 
3721 : a5 14 __ LDA P7 ; (s + 1)
3723 : 85 10 __ STA P3 
3725 : a5 15 __ LDA P8 ; (n + 0)
3727 : 85 11 __ STA P4 
3729 : a5 16 __ LDA P9 ; (n + 1)
372b : 85 12 __ STA P5 
372d : 20 47 37 JSR $3747 ; (krnio_gets.s4 + 0)
3730 : a5 1c __ LDA ACCU + 1 
3732 : 30 04 __ BMI $3738 ; (fgets.s5 + 0)
.s7:
3734 : 05 1b __ ORA ACCU + 0 
3736 : d0 06 __ BNE $373e ; (fgets.s6 + 0)
.s5:
3738 : a9 00 __ LDA #$00
373a : 85 1b __ STA ACCU + 0 
373c : f0 06 __ BEQ $3744 ; (fgets.s3 + 0)
.s6:
373e : a5 13 __ LDA P6 ; (s + 0)
3740 : 85 1b __ STA ACCU + 0 
3742 : a5 14 __ LDA P7 ; (s + 1)
.s3:
3744 : 85 1c __ STA ACCU + 1 
3746 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_gets: ; krnio_gets(u8,u8*,i16)->i16
;  98, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
3747 : a9 40 __ LDA #$40
3749 : a6 0e __ LDX P1 ; (fnum + 0)
374b : dd aa 5b CMP $5baa,x ; (krnio_pstatus[0] + 0)
374e : d0 07 __ BNE $3757 ; (krnio_gets.s5 + 0)
.s18:
3750 : a9 00 __ LDA #$00
.s19:
3752 : 85 1b __ STA ACCU + 0 
.s3:
3754 : 85 1c __ STA ACCU + 1 
3756 : 60 __ __ RTS
.s5:
3757 : 86 47 __ STX T3 + 0 
3759 : 8a __ __ TXA
375a : 20 df 37 JSR $37df ; (krnio_chkin.s4 + 0)
375d : aa __ __ TAX
375e : d0 04 __ BNE $3764 ; (krnio_gets.s7 + 0)
.s6:
3760 : a9 ff __ LDA #$ff
3762 : d0 ee __ BNE $3752 ; (krnio_gets.s19 + 0)
.s7:
3764 : a2 00 __ LDX #$00
3766 : 86 48 __ STX T4 + 0 
3768 : 86 49 __ STX T4 + 1 
376a : 24 12 __ BIT P5 ; (num + 1)
376c : 30 28 __ BMI $3796 ; (krnio_gets.s20 + 0)
.l17:
376e : 18 __ __ CLC
376f : a5 48 __ LDA T4 + 0 
3771 : 69 01 __ ADC #$01
3773 : 85 45 __ STA T2 + 0 
3775 : a5 49 __ LDA T4 + 1 
3777 : 69 00 __ ADC #$00
3779 : 85 46 __ STA T2 + 1 
377b : c5 12 __ CMP P5 ; (num + 1)
377d : d0 04 __ BNE $3783 ; (krnio_gets.s16 + 0)
.s15:
377f : a5 45 __ LDA T2 + 0 
3781 : c5 11 __ CMP P4 ; (num + 0)
.s16:
3783 : b0 11 __ BCS $3796 ; (krnio_gets.s20 + 0)
.s10:
3785 : 20 f0 36 JSR $36f0 ; (krnio_chrin.s4 + 0)
3788 : 85 4a __ STA T8 + 0 
378a : 20 f4 37 JSR $37f4 ; (krnio_status.s4 + 0)
378d : a4 49 __ LDY T4 + 1 
378f : aa __ __ TAX
3790 : f0 09 __ BEQ $379b ; (krnio_gets.s11 + 0)
.s14:
3792 : e0 40 __ CPX #$40
3794 : f0 05 __ BEQ $379b ; (krnio_gets.s11 + 0)
.s20:
3796 : a4 0f __ LDY P2 ; (data + 0)
3798 : 4c be 37 JMP $37be ; (krnio_gets.s9 + 0)
.s11:
379b : e6 48 __ INC T4 + 0 
379d : a5 46 __ LDA T2 + 1 
379f : 85 49 __ STA T4 + 1 
37a1 : c6 45 __ DEC T2 + 0 
37a3 : 98 __ __ TYA
37a4 : 18 __ __ CLC
37a5 : 65 10 __ ADC P3 ; (data + 1)
37a7 : 85 46 __ STA T2 + 1 
37a9 : a5 4a __ LDA T8 + 0 
37ab : a4 0f __ LDY P2 ; (data + 0)
37ad : 91 45 __ STA (T2 + 0),y 
37af : c9 0d __ CMP #$0d
37b1 : f0 0b __ BEQ $37be ; (krnio_gets.s9 + 0)
.s12:
37b3 : c9 0a __ CMP #$0a
37b5 : f0 07 __ BEQ $37be ; (krnio_gets.s9 + 0)
.s13:
37b7 : 8a __ __ TXA
37b8 : d0 04 __ BNE $37be ; (krnio_gets.s9 + 0)
.s8:
37ba : 24 12 __ BIT P5 ; (num + 1)
37bc : 10 b0 __ BPL $376e ; (krnio_gets.l17 + 0)
.s9:
37be : 8a __ __ TXA
37bf : a6 47 __ LDX T3 + 0 
37c1 : 9d aa 5b STA $5baa,x ; (krnio_pstatus[0] + 0)
37c4 : a5 48 __ LDA T4 + 0 
37c6 : 85 43 __ STA T0 + 0 
37c8 : 18 __ __ CLC
37c9 : a5 10 __ LDA P3 ; (data + 1)
37cb : 65 49 __ ADC T4 + 1 
37cd : 85 44 __ STA T0 + 1 
37cf : a9 00 __ LDA #$00
37d1 : 91 43 __ STA (T0 + 0),y 
37d3 : 20 f8 36 JSR $36f8 ; (krnio_clrchn.s4 + 0)
37d6 : a5 48 __ LDA T4 + 0 
37d8 : 85 1b __ STA ACCU + 0 
37da : a5 49 __ LDA T4 + 1 
37dc : 85 1c __ STA ACCU + 1 
37de : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
37df : 85 0d __ STA P0 
37e1 : a6 0d __ LDX P0 
37e3 : 20 c6 ff JSR $ffc6 
37e6 : a9 00 __ LDA #$00
37e8 : 2a __ __ ROL
37e9 : 49 01 __ EOR #$01
37eb : 85 1b __ STA ACCU + 0 
37ed : a5 1b __ LDA ACCU + 0 
37ef : f0 02 __ BEQ $37f3 ; (krnio_chkin.s3 + 0)
.s5:
37f1 : a9 01 __ LDA #$01
.s3:
37f3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
37f4 : 20 b7 ff JSR $ffb7 
37f7 : 85 1b __ STA ACCU + 0 
37f9 : a9 00 __ LDA #$00
37fb : 85 1c __ STA ACCU + 1 
.s3:
37fd : a5 1b __ LDA ACCU + 0 
37ff : 60 __ __ RTS
--------------------------------------------------------------------
parse_next_int: ; parse_next_int(const u8*,i16*)->const u8*
;  90, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
3800 : a9 00 __ LDA #$00
3802 : 85 43 __ STA T0 + 0 
3804 : 85 44 __ STA T0 + 1 
3806 : a9 01 __ LDA #$01
3808 : 85 47 __ STA T3 + 0 
380a : a0 00 __ LDY #$00
380c : b1 0d __ LDA (P0),y ; (str + 0)
380e : f0 24 __ BEQ $3834 ; (parse_next_int.s5 + 0)
.l11:
3810 : a5 0d __ LDA P0 ; (str + 0)
3812 : 85 45 __ STA T1 + 0 
3814 : a5 0e __ LDA P1 ; (str + 1)
3816 : 85 46 __ STA T1 + 1 
3818 : a0 00 __ LDY #$00
381a : b1 0d __ LDA (P0),y ; (str + 0)
381c : c9 30 __ CMP #$30
381e : b0 03 __ BCS $3823 ; (parse_next_int.s12 + 0)
3820 : 4c c0 38 JMP $38c0 ; (parse_next_int.s14 + 0)
.s12:
3823 : c9 3a __ CMP #$3a
3825 : 90 0d __ BCC $3834 ; (parse_next_int.s5 + 0)
.s13:
3827 : e6 0d __ INC P0 ; (str + 0)
3829 : d0 02 __ BNE $382d ; (parse_next_int.s20 + 0)
.s19:
382b : e6 0e __ INC P1 ; (str + 1)
.s20:
382d : a0 01 __ LDY #$01
382f : b1 45 __ LDA (T1 + 0),y 
3831 : d0 dd __ BNE $3810 ; (parse_next_int.l11 + 0)
.s21:
3833 : a8 __ __ TAY
.s5:
3834 : b1 0d __ LDA (P0),y ; (str + 0)
3836 : c9 2d __ CMP #$2d
3838 : d0 0a __ BNE $3844 ; (parse_next_int.s6 + 0)
.s10:
383a : e6 0d __ INC P0 ; (str + 0)
383c : d0 02 __ BNE $3840 ; (parse_next_int.s16 + 0)
.s15:
383e : e6 0e __ INC P1 ; (str + 1)
.s16:
3840 : a9 ff __ LDA #$ff
3842 : 85 47 __ STA T3 + 0 
.s6:
3844 : b1 0d __ LDA (P0),y ; (str + 0)
3846 : c9 30 __ CMP #$30
3848 : 90 4b __ BCC $3895 ; (parse_next_int.s7 + 0)
.l8:
384a : a5 0d __ LDA P0 ; (str + 0)
384c : 85 45 __ STA T1 + 0 
384e : a5 0e __ LDA P1 ; (str + 1)
3850 : 85 46 __ STA T1 + 1 
3852 : a0 00 __ LDY #$00
3854 : b1 0d __ LDA (P0),y ; (str + 0)
3856 : c9 3a __ CMP #$3a
3858 : b0 3b __ BCS $3895 ; (parse_next_int.s7 + 0)
.s9:
385a : e9 2f __ SBC #$2f
385c : aa __ __ TAX
385d : 98 __ __ TYA
385e : e9 00 __ SBC #$00
3860 : 85 1c __ STA ACCU + 1 
3862 : e6 0d __ INC P0 ; (str + 0)
3864 : d0 02 __ BNE $3868 ; (parse_next_int.s18 + 0)
.s17:
3866 : e6 0e __ INC P1 ; (str + 1)
.s18:
3868 : a5 43 __ LDA T0 + 0 
386a : 0a __ __ ASL
386b : 85 1b __ STA ACCU + 0 
386d : a5 44 __ LDA T0 + 1 
386f : 2a __ __ ROL
3870 : 06 1b __ ASL ACCU + 0 
3872 : 2a __ __ ROL
3873 : a8 __ __ TAY
3874 : 18 __ __ CLC
3875 : a5 1b __ LDA ACCU + 0 
3877 : 65 43 __ ADC T0 + 0 
3879 : 85 43 __ STA T0 + 0 
387b : 98 __ __ TYA
387c : 65 44 __ ADC T0 + 1 
387e : 06 43 __ ASL T0 + 0 
3880 : 2a __ __ ROL
3881 : a8 __ __ TAY
3882 : 8a __ __ TXA
3883 : 18 __ __ CLC
3884 : 65 43 __ ADC T0 + 0 
3886 : 85 43 __ STA T0 + 0 
3888 : 98 __ __ TYA
3889 : 65 1c __ ADC ACCU + 1 
388b : 85 44 __ STA T0 + 1 
388d : a9 2f __ LDA #$2f
388f : a0 01 __ LDY #$01
3891 : d1 45 __ CMP (T1 + 0),y 
3893 : 90 b5 __ BCC $384a ; (parse_next_int.l8 + 0)
.s7:
3895 : a5 47 __ LDA T3 + 0 
3897 : 85 1b __ STA ACCU + 0 
3899 : 29 80 __ AND #$80
389b : 10 02 __ BPL $389f ; (parse_next_int.s7 + 10)
389d : a9 ff __ LDA #$ff
389f : 85 1c __ STA ACCU + 1 
38a1 : a5 43 __ LDA T0 + 0 
38a3 : 85 03 __ STA WORK + 0 
38a5 : a5 44 __ LDA T0 + 1 
38a7 : 85 04 __ STA WORK + 1 
38a9 : 20 57 56 JSR $5657 ; (mul16 + 0)
38ac : a5 05 __ LDA WORK + 2 
38ae : a0 00 __ LDY #$00
38b0 : 91 0f __ STA (P2),y ; (value + 0)
38b2 : a5 06 __ LDA WORK + 3 
38b4 : c8 __ __ INY
38b5 : 91 0f __ STA (P2),y ; (value + 0)
38b7 : a5 0d __ LDA P0 ; (str + 0)
38b9 : 85 1b __ STA ACCU + 0 
38bb : a5 0e __ LDA P1 ; (str + 1)
38bd : 85 1c __ STA ACCU + 1 
.s3:
38bf : 60 __ __ RTS
.s14:
38c0 : c9 2d __ CMP #$2d
38c2 : d0 03 __ BNE $38c7 ; (parse_next_int.s14 + 7)
38c4 : 4c 34 38 JMP $3834 ; (parse_next_int.s5 + 0)
38c7 : 4c 27 38 JMP $3827 ; (parse_next_int.s13 + 0)
--------------------------------------------------------------------
38ca : __ __ __ BYT 43 3a 20 25 64 0a 00                            : C: %d..
--------------------------------------------------------------------
38d1 : __ __ __ BYT 44 3a 20 25 64 0a 00                            : D: %d..
--------------------------------------------------------------------
38d8 : __ __ __ BYT 48 3a 20 25 64 0a 00                            : H: %d..
--------------------------------------------------------------------
38df : __ __ __ BYT 55 3a 20 25 64 0a 00                            : U: %d..
--------------------------------------------------------------------
38e6 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 2e 2e 2e 0a 00          : LOADING .....
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
38f3 : 85 0d __ STA P0 
38f5 : a5 0d __ LDA P0 
38f7 : 20 c3 ff JSR $ffc3 
.s3:
38fa : 60 __ __ RTS
--------------------------------------------------------------------
load_plane_data: ; load_plane_data(i16)->void
; 167, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
38fb : a5 53 __ LDA T6 + 0 
38fd : 8d c6 bf STA $bfc6 ; (load_plane_data@stack + 0)
.s4:
3900 : a9 26 __ LDA #$26
3902 : 85 10 __ STA P3 
3904 : a9 2a __ LDA #$2a
3906 : 85 13 __ STA P6 
3908 : a9 3a __ LDA #$3a
390a : 85 11 __ STA P4 
390c : a9 7f __ LDA #$7f
390e : 85 12 __ STA P5 
3910 : 20 a6 28 JSR $28a6 ; (fopen.s4 + 0)
3913 : a5 1c __ LDA ACCU + 1 
3915 : 85 10 __ STA P3 
3917 : a5 1b __ LDA ACCU + 0 
3919 : 85 0f __ STA P2 
391b : d0 07 __ BNE $3924 ; (load_plane_data.s5 + 0)
.s28:
391d : a5 10 __ LDA P3 
391f : d0 03 __ BNE $3924 ; (load_plane_data.s5 + 0)
3921 : 4c 1a 3a JMP $3a1a ; (load_plane_data.s3 + 0)
.s5:
3924 : a5 14 __ LDA P7 ; (capacity + 0)
3926 : 0a __ __ ASL
3927 : 85 1b __ STA ACCU + 0 
3929 : a5 15 __ LDA P8 ; (capacity + 1)
392b : 2a __ __ ROL
392c : 85 1c __ STA ACCU + 1 
392e : 20 2d 5a JSR $5a2d ; (crt_malloc + 0)
3931 : a5 1b __ LDA ACCU + 0 
3933 : 85 4f __ STA T4 + 0 
3935 : 8d fe 36 STA $36fe ; (plane_data + 0)
3938 : a5 1c __ LDA ACCU + 1 
393a : 85 50 __ STA T4 + 1 
393c : 8d ff 36 STA $36ff ; (plane_data + 1)
393f : a9 00 __ LDA #$00
3941 : 85 51 __ STA T5 + 0 
3943 : 85 52 __ STA T5 + 1 
.l6:
3945 : a9 00 __ LDA #$00
3947 : 85 4d __ STA T1 + 0 
3949 : 85 4e __ STA T1 + 1 
.l29:
394b : 85 53 __ STA T6 + 0 
.l7:
394d : 20 31 3a JSR $3a31 ; (fgetc.s4 + 0)
3950 : a5 1c __ LDA ACCU + 1 
3952 : a4 1b __ LDY ACCU + 0 
3954 : c9 ff __ CMP #$ff
3956 : d0 04 __ BNE $395c ; (load_plane_data.s15 + 0)
.s27:
3958 : c5 1b __ CMP ACCU + 0 
395a : f0 76 __ BEQ $39d2 ; (load_plane_data.s8 + 0)
.s15:
395c : aa __ __ TAX
395d : 30 0d __ BMI $396c ; (load_plane_data.s16 + 0)
.s26:
395f : d0 04 __ BNE $3965 ; (load_plane_data.s22 + 0)
.s25:
3961 : c0 30 __ CPY #$30
3963 : 90 07 __ BCC $396c ; (load_plane_data.s16 + 0)
.s22:
3965 : aa __ __ TAX
3966 : d0 04 __ BNE $396c ; (load_plane_data.s16 + 0)
.s24:
3968 : c0 3a __ CPY #$3a
396a : 90 39 __ BCC $39a5 ; (load_plane_data.s23 + 0)
.s16:
396c : a5 53 __ LDA T6 + 0 
396e : f0 dd __ BEQ $394d ; (load_plane_data.l7 + 0)
.s17:
3970 : 24 15 __ BIT P8 ; (capacity + 1)
3972 : 30 d1 __ BMI $3945 ; (load_plane_data.l6 + 0)
.s21:
3974 : a5 52 __ LDA T5 + 1 
3976 : c5 15 __ CMP P8 ; (capacity + 1)
3978 : f0 23 __ BEQ $399d ; (load_plane_data.s19 + 0)
.s20:
397a : b0 c9 __ BCS $3945 ; (load_plane_data.l6 + 0)
.s34:
397c : a5 51 __ LDA T5 + 0 
.s18:
397e : 0a __ __ ASL
397f : 85 43 __ STA T0 + 0 
3981 : a5 52 __ LDA T5 + 1 
3983 : 2a __ __ ROL
3984 : 18 __ __ CLC
3985 : 65 50 __ ADC T4 + 1 
3987 : 85 44 __ STA T0 + 1 
3989 : a5 4d __ LDA T1 + 0 
398b : a4 4f __ LDY T4 + 0 
398d : 91 43 __ STA (T0 + 0),y 
398f : a5 4e __ LDA T1 + 1 
3991 : c8 __ __ INY
3992 : 91 43 __ STA (T0 + 0),y 
3994 : e6 51 __ INC T5 + 0 
3996 : d0 ad __ BNE $3945 ; (load_plane_data.l6 + 0)
.s30:
3998 : e6 52 __ INC T5 + 1 
399a : 4c 45 39 JMP $3945 ; (load_plane_data.l6 + 0)
.s19:
399d : a5 51 __ LDA T5 + 0 
399f : c5 14 __ CMP P7 ; (capacity + 0)
39a1 : 90 db __ BCC $397e ; (load_plane_data.s18 + 0)
39a3 : b0 a0 __ BCS $3945 ; (load_plane_data.l6 + 0)
.s23:
39a5 : a5 4d __ LDA T1 + 0 
39a7 : 0a __ __ ASL
39a8 : 85 1b __ STA ACCU + 0 
39aa : a5 4e __ LDA T1 + 1 
39ac : 2a __ __ ROL
39ad : 06 1b __ ASL ACCU + 0 
39af : 2a __ __ ROL
39b0 : aa __ __ TAX
39b1 : 18 __ __ CLC
39b2 : a5 1b __ LDA ACCU + 0 
39b4 : 65 4d __ ADC T1 + 0 
39b6 : 85 4d __ STA T1 + 0 
39b8 : 8a __ __ TXA
39b9 : 65 4e __ ADC T1 + 1 
39bb : 06 4d __ ASL T1 + 0 
39bd : 2a __ __ ROL
39be : aa __ __ TAX
39bf : 98 __ __ TYA
39c0 : 38 __ __ SEC
39c1 : e9 30 __ SBC #$30
39c3 : 18 __ __ CLC
39c4 : 65 4d __ ADC T1 + 0 
39c6 : 85 4d __ STA T1 + 0 
39c8 : 90 01 __ BCC $39cb ; (load_plane_data.s32 + 0)
.s31:
39ca : e8 __ __ INX
.s32:
39cb : 86 4e __ STX T1 + 1 
39cd : a9 01 __ LDA #$01
39cf : 4c 4b 39 JMP $394b ; (load_plane_data.l29 + 0)
.s8:
39d2 : a0 00 __ LDY #$00
39d4 : b1 0f __ LDA (P2),y 
39d6 : aa __ __ TAX
39d7 : a5 53 __ LDA T6 + 0 
39d9 : f0 2c __ BEQ $3a07 ; (load_plane_data.s9 + 0)
.s10:
39db : 24 15 __ BIT P8 ; (capacity + 1)
39dd : 30 28 __ BMI $3a07 ; (load_plane_data.s9 + 0)
.s14:
39df : a5 52 __ LDA T5 + 1 
39e1 : c5 15 __ CMP P8 ; (capacity + 1)
39e3 : d0 3b __ BNE $3a20 ; (load_plane_data.s13 + 0)
.s12:
39e5 : a5 51 __ LDA T5 + 0 
39e7 : c5 14 __ CMP P7 ; (capacity + 0)
39e9 : b0 1c __ BCS $3a07 ; (load_plane_data.s9 + 0)
.s11:
39eb : 0a __ __ ASL
39ec : 85 43 __ STA T0 + 0 
39ee : a5 52 __ LDA T5 + 1 
39f0 : 2a __ __ ROL
39f1 : 18 __ __ CLC
39f2 : 65 50 __ ADC T4 + 1 
39f4 : 85 44 __ STA T0 + 1 
39f6 : a5 4d __ LDA T1 + 0 
39f8 : a4 4f __ LDY T4 + 0 
39fa : 91 43 __ STA (T0 + 0),y 
39fc : a5 4e __ LDA T1 + 1 
39fe : c8 __ __ INY
39ff : 91 43 __ STA (T0 + 0),y 
3a01 : e6 51 __ INC T5 + 0 
3a03 : d0 02 __ BNE $3a07 ; (load_plane_data.s9 + 0)
.s33:
3a05 : e6 52 __ INC T5 + 1 
.s9:
3a07 : a5 51 __ LDA T5 + 0 
3a09 : 8d fb 5a STA $5afb ; (plane_data_count + 0)
3a0c : a5 52 __ LDA T5 + 1 
3a0e : 8d fc 5a STA $5afc ; (plane_data_count + 1)
3a11 : 8a __ __ TXA
3a12 : 20 f3 38 JSR $38f3 ; (krnio_close.s4 + 0)
3a15 : a9 00 __ LDA #$00
3a17 : a8 __ __ TAY
3a18 : 91 0f __ STA (P2),y 
.s3:
3a1a : ad c6 bf LDA $bfc6 ; (load_plane_data@stack + 0)
3a1d : 85 53 __ STA T6 + 0 
3a1f : 60 __ __ RTS
.s13:
3a20 : b0 e5 __ BCS $3a07 ; (load_plane_data.s9 + 0)
.s35:
3a22 : a5 51 __ LDA T5 + 0 
3a24 : 90 c5 __ BCC $39eb ; (load_plane_data.s11 + 0)
--------------------------------------------------------------------
3a26 : __ __ __ BYT 50 4c 41 4e 45 53 2c 53 2c 52 00                : PLANES,S,R.
--------------------------------------------------------------------
fgetc: ; fgetc(struct FILE*)->i16
;  44, "D:/Arbeit/dev/oscar64/include/stdio.h"
.s4:
3a31 : a0 00 __ LDY #$00
3a33 : b1 0f __ LDA (P2),y ; (stream + 0)
3a35 : 10 0a __ BPL $3a41 ; (fgetc.s6 + 0)
.s5:
3a37 : 20 94 3a JSR $3a94 ; (getpch.s4 + 0)
3a3a : 85 1b __ STA ACCU + 0 
3a3c : a9 00 __ LDA #$00
3a3e : 85 1c __ STA ACCU + 1 
.s3:
3a40 : 60 __ __ RTS
.s6:
3a41 : 85 0e __ STA P1 
3a43 : 4c 46 3a JMP $3a46 ; (krnio_getch.s4 + 0)
--------------------------------------------------------------------
krnio_getch: ; krnio_getch(u8)->i16
;  73, "D:/Arbeit/dev/oscar64/include/c64/kernalio.h"
.s4:
3a46 : a9 40 __ LDA #$40
3a48 : a4 0e __ LDY P1 ; (fnum + 0)
3a4a : d9 aa 5b CMP $5baa,y ; (krnio_pstatus[0] + 0)
3a4d : f0 3f __ BEQ $3a8e ; (krnio_getch.s12 + 0)
.s5:
3a4f : 98 __ __ TYA
3a50 : 20 df 37 JSR $37df ; (krnio_chkin.s4 + 0)
3a53 : aa __ __ TAX
3a54 : d0 12 __ BNE $3a68 ; (krnio_getch.s8 + 0)
.s6:
3a56 : a9 ff __ LDA #$ff
3a58 : 85 43 __ STA T0 + 0 
3a5a : 85 44 __ STA T0 + 1 
.s7:
3a5c : 20 f8 36 JSR $36f8 ; (krnio_clrchn.s4 + 0)
3a5f : a5 43 __ LDA T0 + 0 
3a61 : 85 1b __ STA ACCU + 0 
3a63 : a5 44 __ LDA T0 + 1 
.s3:
3a65 : 85 1c __ STA ACCU + 1 
3a67 : 60 __ __ RTS
.s8:
3a68 : 20 f0 36 JSR $36f0 ; (krnio_chrin.s4 + 0)
3a6b : 85 43 __ STA T0 + 0 
3a6d : 20 f4 37 JSR $37f4 ; (krnio_status.s4 + 0)
3a70 : a6 0e __ LDX P1 ; (fnum + 0)
3a72 : 9d aa 5b STA $5baa,x ; (krnio_pstatus[0] + 0)
3a75 : a2 00 __ LDX #$00
3a77 : 86 44 __ STX T0 + 1 
3a79 : aa __ __ TAX
3a7a : f0 e0 __ BEQ $3a5c ; (krnio_getch.s7 + 0)
.s9:
3a7c : c9 40 __ CMP #$40
3a7e : d0 0b __ BNE $3a8b ; (krnio_getch.s10 + 0)
.s11:
3a80 : 20 f8 36 JSR $36f8 ; (krnio_clrchn.s4 + 0)
3a83 : a5 43 __ LDA T0 + 0 
3a85 : 85 1b __ STA ACCU + 0 
3a87 : a9 01 __ LDA #$01
3a89 : d0 da __ BNE $3a65 ; (krnio_getch.s3 + 0)
.s10:
3a8b : 20 f8 36 JSR $36f8 ; (krnio_clrchn.s4 + 0)
.s12:
3a8e : a9 ff __ LDA #$ff
3a90 : 85 1b __ STA ACCU + 0 
3a92 : d0 d1 __ BNE $3a65 ; (krnio_getch.s3 + 0)
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "D:/Arbeit/dev/oscar64/include/conio.h"
.s4:
3a94 : 20 cf ff JSR $ffcf 
3a97 : 85 1b __ STA ACCU + 0 
3a99 : a5 1b __ LDA ACCU + 0 
3a9b : 4c 9e 3a JMP $3a9e ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "D:/Arbeit/dev/oscar64/include/conio.c"
.s4:
3a9e : a8 __ __ TAY
3a9f : ad fd 36 LDA $36fd ; (giocharmap + 0)
3aa2 : f0 27 __ BEQ $3acb ; (convch.s5 + 0)
.s6:
3aa4 : c0 0d __ CPY #$0d
3aa6 : d0 03 __ BNE $3aab ; (convch.s7 + 0)
.s16:
3aa8 : a9 0a __ LDA #$0a
.s3:
3aaa : 60 __ __ RTS
.s7:
3aab : c9 02 __ CMP #$02
3aad : 90 1c __ BCC $3acb ; (convch.s5 + 0)
.s8:
3aaf : c0 41 __ CPY #$41
3ab1 : 90 18 __ BCC $3acb ; (convch.s5 + 0)
.s9:
3ab3 : c0 db __ CPY #$db
3ab5 : b0 14 __ BCS $3acb ; (convch.s5 + 0)
.s10:
3ab7 : 98 __ __ TYA
3ab8 : c0 c1 __ CPY #$c1
3aba : 90 03 __ BCC $3abf ; (convch.s11 + 0)
.s15:
3abc : 49 a0 __ EOR #$a0
3abe : a8 __ __ TAY
.s11:
3abf : c9 7b __ CMP #$7b
3ac1 : b0 08 __ BCS $3acb ; (convch.s5 + 0)
.s12:
3ac3 : c9 61 __ CMP #$61
3ac5 : b0 06 __ BCS $3acd ; (convch.s14 + 0)
.s13:
3ac7 : c9 5b __ CMP #$5b
3ac9 : 90 02 __ BCC $3acd ; (convch.s14 + 0)
.s5:
3acb : 98 __ __ TYA
3acc : 60 __ __ RTS
.s14:
3acd : 49 20 __ EOR #$20
3acf : 60 __ __ RTS
--------------------------------------------------------------------
hires_init: ; hires_init()->void
; 394, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
3ad0 : a9 00 __ LDA #$00
3ad2 : 85 1b __ STA ACCU + 0 
3ad4 : 85 1f __ STA ADDR + 0 
3ad6 : a9 96 __ LDA #$96
3ad8 : 8d 02 90 STA $9002 
3adb : a9 2e __ LDA #$2e
3add : 8d 03 90 STA $9003 
3ae0 : a9 fc __ LDA #$fc
3ae2 : 8d 05 90 STA $9005 
3ae5 : a9 08 __ LDA #$08
3ae7 : 8d 0f 90 STA $900f 
3aea : a9 1e __ LDA #$1e
3aec : 85 1c __ STA ACCU + 1 
3aee : d0 02 __ BNE $3af2 ; (hires_init.l5 + 0)
.s13:
3af0 : e6 1c __ INC ACCU + 1 
.l5:
3af2 : a9 00 __ LDA #$00
3af4 : a8 __ __ TAY
3af5 : 91 1b __ STA (ACCU + 0),y 
3af7 : 18 __ __ CLC
3af8 : a5 1c __ LDA ACCU + 1 
3afa : 69 78 __ ADC #$78
3afc : 85 20 __ STA ADDR + 1 
3afe : a9 05 __ LDA #$05
3b00 : a4 1b __ LDY ACCU + 0 
3b02 : 91 1f __ STA (ADDR + 0),y 
3b04 : 98 __ __ TYA
3b05 : 18 __ __ CLC
3b06 : 69 01 __ ADC #$01
3b08 : 85 1b __ STA ACCU + 0 
3b0a : b0 e4 __ BCS $3af0 ; (hires_init.s13 + 0)
.s14:
3b0c : c9 fa __ CMP #$fa
3b0e : d0 e2 __ BNE $3af2 ; (hires_init.l5 + 0)
.s12:
3b10 : a5 1c __ LDA ACCU + 1 
3b12 : c9 1f __ CMP #$1f
3b14 : d0 dc __ BNE $3af2 ; (hires_init.l5 + 0)
.s6:
3b16 : a9 10 __ LDA #$10
3b18 : 85 20 __ STA ADDR + 1 
3b1a : a9 00 __ LDA #$00
3b1c : a8 __ __ TAY
3b1d : a2 08 __ LDX #$08
.l8:
3b1f : 91 1f __ STA (ADDR + 0),y 
3b21 : c8 __ __ INY
3b22 : d0 fb __ BNE $3b1f ; (hires_init.l8 + 0)
.s9:
3b24 : e6 20 __ INC ADDR + 1 
3b26 : ca __ __ DEX
3b27 : d0 f6 __ BNE $3b1f ; (hires_init.l8 + 0)
.s7:
3b29 : a9 a2 __ LDA #$a2
3b2b : 85 1f __ STA ADDR + 0 
3b2d : a9 5b __ LDA #$5b
3b2f : 85 20 __ STA ADDR + 1 
3b31 : 98 __ __ TYA
3b32 : a2 10 __ LDX #$10
3b34 : a0 30 __ LDY #$30
.l10:
3b36 : 91 1f __ STA (ADDR + 0),y 
3b38 : c8 __ __ INY
3b39 : d0 fb __ BNE $3b36 ; (hires_init.l10 + 0)
.s11:
3b3b : e6 20 __ INC ADDR + 1 
3b3d : ca __ __ DEX
3b3e : d0 f6 __ BNE $3b36 ; (hires_init.l10 + 0)
.s3:
3b40 : 60 __ __ RTS
--------------------------------------------------------------------
ultra_fast_clear: ; ultra_fast_clear()->void
; 222, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
3b41 : a9 a2 __ LDA #$a2
3b43 : 85 1f __ STA ADDR + 0 
3b45 : a9 5b __ LDA #$5b
3b47 : 85 20 __ STA ADDR + 1 
3b49 : a9 00 __ LDA #$00
3b4b : a2 10 __ LDX #$10
3b4d : a0 30 __ LDY #$30
.l5:
3b4f : 91 1f __ STA (ADDR + 0),y 
3b51 : c8 __ __ INY
3b52 : d0 fb __ BNE $3b4f ; (ultra_fast_clear.l5 + 0)
.s6:
3b54 : e6 20 __ INC ADDR + 1 
3b56 : ca __ __ DEX
3b57 : d0 f6 __ BNE $3b4f ; (ultra_fast_clear.l5 + 0)
.s3:
3b59 : 60 __ __ RTS
--------------------------------------------------------------------
DoRender: ; DoRender(i16,i16,i16,i16,i16,i16,i16,i16)->void
; 671, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
3b5a : a5 53 __ LDA T1 + 0 
3b5c : 8d aa bf STA $bfaa ; (DoRender@stack + 0)
3b5f : a5 54 __ LDA T1 + 1 
3b61 : 8d ab bf STA $bfab ; (DoRender@stack + 1)
.s4:
3b64 : ad f0 bf LDA $bff0 ; (sstack + 4)
3b67 : 85 0d __ STA P0 
3b69 : ad f1 bf LDA $bff1 ; (sstack + 5)
3b6c : 85 0e __ STA P1 
3b6e : ad f2 bf LDA $bff2 ; (sstack + 6)
3b71 : 85 0f __ STA P2 
3b73 : ad f3 bf LDA $bff3 ; (sstack + 7)
3b76 : 85 10 __ STA P3 
3b78 : ad f4 bf LDA $bff4 ; (sstack + 8)
3b7b : 85 11 __ STA P4 
3b7d : ad f5 bf LDA $bff5 ; (sstack + 9)
3b80 : 85 12 __ STA P5 
3b82 : ad f6 bf LDA $bff6 ; (sstack + 10)
3b85 : 85 13 __ STA P6 
3b87 : ad f7 bf LDA $bff7 ; (sstack + 11)
3b8a : 85 14 __ STA P7 
3b8c : ad f8 bf LDA $bff8 ; (sstack + 12)
3b8f : 85 15 __ STA P8 
3b91 : ad f9 bf LDA $bff9 ; (sstack + 13)
3b94 : 85 16 __ STA P9 
3b96 : ad fa bf LDA $bffa ; (sstack + 14)
3b99 : 85 17 __ STA P10 
3b9b : ad fb bf LDA $bffb ; (sstack + 15)
3b9e : 85 18 __ STA P11 
3ba0 : ad fc bf LDA $bffc ; (sstack + 16)
3ba3 : 85 53 __ STA T1 + 0 
3ba5 : 8d ec bf STA $bfec ; (sstack + 0)
3ba8 : ad fd bf LDA $bffd ; (sstack + 17)
3bab : 85 54 __ STA T1 + 1 
3bad : 8d ed bf STA $bfed ; (sstack + 1)
3bb0 : ad ba 5b LDA $5bba ; (c + 0)
3bb3 : 8d ee bf STA $bfee ; (sstack + 2)
3bb6 : ad bb 5b LDA $5bbb ; (c + 1)
3bb9 : 8d ef bf STA $bfef ; (sstack + 3)
3bbc : 20 eb 3b JSR $3beb ; (render_full_rotation.s1 + 0)
3bbf : a5 53 __ LDA T1 + 0 
3bc1 : 8d ee bf STA $bfee ; (sstack + 2)
3bc4 : a5 54 __ LDA T1 + 1 
3bc6 : 8d ef bf STA $bfef ; (sstack + 3)
3bc9 : 20 41 3b JSR $3b41 ; (ultra_fast_clear.s4 + 0)
3bcc : 20 6d 46 JSR $466d ; (sort_and_render_faces.s1 + 0)
3bcf : ad 69 5b LDA $5b69 ; (borderOn + 1)
3bd2 : d0 09 __ BNE $3bdd ; (DoRender.s5 + 0)
.s7:
3bd4 : ae 68 5b LDX $5b68 ; (borderOn + 0)
3bd7 : ca __ __ DEX
3bd8 : d0 03 __ BNE $3bdd ; (DoRender.s5 + 0)
.s6:
3bda : 20 ce 51 JSR $51ce ; (DrawBorders.s4 + 0)
.s5:
3bdd : 20 1c 52 JSR $521c ; (hires_render.s4 + 0)
.s3:
3be0 : ad aa bf LDA $bfaa ; (DoRender@stack + 0)
3be3 : 85 53 __ STA T1 + 0 
3be5 : ad ab bf LDA $bfab ; (DoRender@stack + 1)
3be8 : 85 54 __ STA T1 + 1 
3bea : 60 __ __ RTS
--------------------------------------------------------------------
render_full_rotation: ; render_full_rotation(i16,i16,i16,i16,i16,i16,i16,i16)->void
; 411, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
3beb : a2 31 __ LDX #$31
3bed : b5 53 __ LDA T4 + 0,x 
3bef : 9d ac bf STA $bfac,x ; (render_full_rotation@stack + 0)
3bf2 : ca __ __ DEX
3bf3 : 10 f8 __ BPL $3bed ; (render_full_rotation.s1 + 2)
.s4:
3bf5 : ad ee bf LDA $bfee ; (sstack + 2)
3bf8 : 85 77 __ STA T15 + 0 
3bfa : ad ef bf LDA $bfef ; (sstack + 3)
3bfd : 30 06 __ BMI $3c05 ; (render_full_rotation.s3 + 0)
.s33:
3bff : 85 78 __ STA T15 + 1 
3c01 : 05 77 __ ORA T15 + 0 
3c03 : d0 0b __ BNE $3c10 ; (render_full_rotation.s5 + 0)
.s3:
3c05 : a2 31 __ LDX #$31
3c07 : bd ac bf LDA $bfac,x ; (render_full_rotation@stack + 0)
3c0a : 95 53 __ STA T4 + 0,x 
3c0c : ca __ __ DEX
3c0d : 10 f8 __ BPL $3c07 ; (render_full_rotation.s3 + 2)
3c0f : 60 __ __ RTS
.s5:
3c10 : ad bc 5b LDA $5bbc ; (d + 0)
3c13 : 85 43 __ STA T0 + 0 
3c15 : ad bd 5b LDA $5bbd ; (d + 1)
3c18 : 85 44 __ STA T0 + 1 
3c1a : 29 80 __ AND #$80
3c1c : 10 02 __ BPL $3c20 ; (render_full_rotation.s5 + 16)
3c1e : a9 ff __ LDA #$ff
3c20 : 85 45 __ STA T0 + 2 
3c22 : a5 18 __ LDA P11 ; (scale + 1)
3c24 : 29 80 __ AND #$80
3c26 : 10 02 __ BPL $3c2a ; (render_full_rotation.s5 + 26)
3c28 : a9 ff __ LDA #$ff
3c2a : 85 48 __ STA T1 + 2 
3c2c : a5 0f __ LDA P2 ; (degY + 0)
3c2e : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3c30 : a5 10 __ LDA P3 ; (degY + 1)
3c32 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3c34 : a9 68 __ LDA #$68
3c36 : 85 03 __ STA WORK + 0 
3c38 : a9 01 __ LDA #$01
3c3a : 85 04 __ STA WORK + 1 
3c3c : 20 5e 57 JSR $575e ; (mods16 + 0)
3c3f : a5 05 __ LDA WORK + 2 
3c41 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3c43 : a5 06 __ LDA WORK + 3 
3c45 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3c47 : a9 05 __ LDA #$05
3c49 : 85 03 __ STA WORK + 0 
3c4b : a9 00 __ LDA #$00
3c4d : 85 04 __ STA WORK + 1 
3c4f : 20 99 56 JSR $5699 ; (divs16 + 0)
3c52 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
3c54 : 85 59 __ STA T6 + 0 
3c56 : 18 __ __ CLC
3c57 : 69 12 __ ADC #$12
3c59 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3c5b : a9 00 __ LDA #$00
3c5d : 2a __ __ ROL
3c5e : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3c60 : a9 48 __ LDA #$48
3c62 : 20 08 57 JSR $5708 ; (divmod + 53)
3c65 : a6 05 __ LDX WORK + 2 
3c67 : bd 1c 5b LDA $5b1c,x ; (sin_tab[0] + 0)
3c6a : 85 4a __ STA T2 + 0 
3c6c : 29 80 __ AND #$80
3c6e : 10 02 __ BPL $3c72 ; (render_full_rotation.s5 + 98)
3c70 : a9 ff __ LDA #$ff
3c72 : 85 4b __ STA T2 + 1 
3c74 : a5 11 __ LDA P4 ; (degZ + 0)
3c76 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3c78 : a5 12 __ LDA P5 ; (degZ + 1)
3c7a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3c7c : a9 68 __ LDA #$68
3c7e : 85 03 __ STA WORK + 0 
3c80 : a9 01 __ LDA #$01
3c82 : 85 04 __ STA WORK + 1 
3c84 : 20 5e 57 JSR $575e ; (mods16 + 0)
3c87 : a5 05 __ LDA WORK + 2 
3c89 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3c8b : a5 06 __ LDA WORK + 3 
3c8d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3c8f : a9 05 __ LDA #$05
3c91 : 85 03 __ STA WORK + 0 
3c93 : a9 00 __ LDA #$00
3c95 : 85 04 __ STA WORK + 1 
3c97 : 20 99 56 JSR $5699 ; (divs16 + 0)
3c9a : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
3c9c : 85 65 __ STA T10 + 0 
3c9e : 18 __ __ CLC
3c9f : 69 12 __ ADC #$12
3ca1 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3ca3 : a9 00 __ LDA #$00
3ca5 : 2a __ __ ROL
3ca6 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3ca8 : a9 48 __ LDA #$48
3caa : 20 08 57 JSR $5708 ; (divmod + 53)
3cad : a6 05 __ LDX WORK + 2 
3caf : bd 1c 5b LDA $5b1c,x ; (sin_tab[0] + 0)
3cb2 : 85 4e __ STA T3 + 0 
3cb4 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3cb6 : 29 80 __ AND #$80
3cb8 : 10 02 __ BPL $3cbc ; (render_full_rotation.s5 + 172)
3cba : a9 ff __ LDA #$ff
3cbc : 85 4f __ STA T3 + 1 
3cbe : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3cc0 : 85 1d __ STA ACCU + 2 
3cc2 : 85 1e __ STA ACCU + 3 
3cc4 : a5 4a __ LDA T2 + 0 
3cc6 : 85 03 __ STA WORK + 0 
3cc8 : a5 4b __ LDA T2 + 1 
3cca : 85 04 __ STA WORK + 1 
3ccc : 85 05 __ STA WORK + 2 
3cce : 85 06 __ STA WORK + 3 
3cd0 : 20 8c 58 JSR $588c ; (mul32 + 0)
3cd3 : a5 07 __ LDA WORK + 4 
3cd5 : 85 53 __ STA T4 + 0 
3cd7 : a5 08 __ LDA WORK + 5 
3cd9 : 85 54 __ STA T4 + 1 
3cdb : a5 09 __ LDA WORK + 6 
3cdd : 85 55 __ STA T4 + 2 
3cdf : a5 0a __ LDA WORK + 7 
3ce1 : a2 06 __ LDX #$06
.l6:
3ce3 : c9 80 __ CMP #$80
3ce5 : 6a __ __ ROR
3ce6 : 66 55 __ ROR T4 + 2 
3ce8 : 66 54 __ ROR T4 + 1 
3cea : 66 53 __ ROR T4 + 0 
3cec : ca __ __ DEX
3ced : d0 f4 __ BNE $3ce3 ; (render_full_rotation.l6 + 0)
.s7:
3cef : a5 54 __ LDA T4 + 1 
3cf1 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3cf3 : 0a __ __ ASL
3cf4 : 8a __ __ TXA
3cf5 : 69 ff __ ADC #$ff
3cf7 : 49 ff __ EOR #$ff
3cf9 : 85 1d __ STA ACCU + 2 
3cfb : 85 1e __ STA ACCU + 3 
3cfd : a5 53 __ LDA T4 + 0 
3cff : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3d01 : a5 17 __ LDA P10 ; (scale + 0)
3d03 : 85 03 __ STA WORK + 0 
3d05 : a5 18 __ LDA P11 ; (scale + 1)
3d07 : 85 04 __ STA WORK + 1 
3d09 : a5 48 __ LDA T1 + 2 
3d0b : 85 05 __ STA WORK + 2 
3d0d : 85 06 __ STA WORK + 3 
3d0f : 20 8c 58 JSR $588c ; (mul32 + 0)
3d12 : a5 07 __ LDA WORK + 4 
3d14 : 0a __ __ ASL
3d15 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3d17 : a5 08 __ LDA WORK + 5 
3d19 : 2a __ __ ROL
3d1a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3d1c : a5 09 __ LDA WORK + 6 
3d1e : 2a __ __ ROL
3d1f : 85 1d __ STA ACCU + 2 
3d21 : a5 0a __ LDA WORK + 7 
3d23 : 2a __ __ ROL
3d24 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
3d26 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
3d28 : 26 1d __ ROL ACCU + 2 
3d2a : 2a __ __ ROL
3d2b : 85 1e __ STA ACCU + 3 
3d2d : a5 43 __ LDA T0 + 0 
3d2f : 85 03 __ STA WORK + 0 
3d31 : a5 44 __ LDA T0 + 1 
3d33 : 85 04 __ STA WORK + 1 
3d35 : a5 45 __ LDA T0 + 2 
3d37 : 85 05 __ STA WORK + 2 
3d39 : 85 06 __ STA WORK + 3 
3d3b : 20 f4 58 JSR $58f4 ; (divs32 + 0)
3d3e : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
3d40 : 85 53 __ STA T4 + 0 
3d42 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
3d44 : 85 54 __ STA T4 + 1 
3d46 : a5 0d __ LDA P0 ; (degX + 0)
3d48 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3d4a : a5 0e __ LDA P1 ; (degX + 1)
3d4c : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3d4e : a9 68 __ LDA #$68
3d50 : 85 03 __ STA WORK + 0 
3d52 : a9 01 __ LDA #$01
3d54 : 85 04 __ STA WORK + 1 
3d56 : 20 5e 57 JSR $575e ; (mods16 + 0)
3d59 : a5 05 __ LDA WORK + 2 
3d5b : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3d5d : a5 06 __ LDA WORK + 3 
3d5f : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3d61 : a9 05 __ LDA #$05
3d63 : 85 03 __ STA WORK + 0 
3d65 : a9 00 __ LDA #$00
3d67 : 85 04 __ STA WORK + 1 
3d69 : 20 99 56 JSR $5699 ; (divs16 + 0)
3d6c : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
3d6e : 85 63 __ STA T9 + 0 
3d70 : a9 00 __ LDA #$00
3d72 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3d74 : a9 48 __ LDA #$48
3d76 : 20 08 57 JSR $5708 ; (divmod + 53)
3d79 : a6 05 __ LDX WORK + 2 
3d7b : bd 1c 5b LDA $5b1c,x ; (sin_tab[0] + 0)
3d7e : 85 56 __ STA T5 + 0 
3d80 : 0a __ __ ASL
3d81 : a9 00 __ LDA #$00
3d83 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3d85 : 69 ff __ ADC #$ff
3d87 : 49 ff __ EOR #$ff
3d89 : 85 57 __ STA T5 + 1 
3d8b : a5 59 __ LDA T6 + 0 
3d8d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3d8f : a9 48 __ LDA #$48
3d91 : 20 08 57 JSR $5708 ; (divmod + 53)
3d94 : a6 05 __ LDX WORK + 2 
3d96 : bd 1c 5b LDA $5b1c,x ; (sin_tab[0] + 0)
3d99 : 85 59 __ STA T6 + 0 
3d9b : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3d9d : 29 80 __ AND #$80
3d9f : 10 02 __ BPL $3da3 ; (render_full_rotation.s7 + 180)
3da1 : a9 ff __ LDA #$ff
3da3 : 85 5a __ STA T6 + 1 
3da5 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3da7 : 85 1d __ STA ACCU + 2 
3da9 : 85 1e __ STA ACCU + 3 
3dab : a5 56 __ LDA T5 + 0 
3dad : 85 03 __ STA WORK + 0 
3daf : a5 57 __ LDA T5 + 1 
3db1 : 85 04 __ STA WORK + 1 
3db3 : 85 05 __ STA WORK + 2 
3db5 : 85 06 __ STA WORK + 3 
3db7 : 20 8c 58 JSR $588c ; (mul32 + 0)
3dba : a5 07 __ LDA WORK + 4 
3dbc : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3dbe : 85 5b __ STA T7 + 0 
3dc0 : a5 08 __ LDA WORK + 5 
3dc2 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3dc4 : 85 5c __ STA T7 + 1 
3dc6 : a5 09 __ LDA WORK + 6 
3dc8 : 85 1d __ STA ACCU + 2 
3dca : 85 5d __ STA T7 + 2 
3dcc : a5 0a __ LDA WORK + 7 
3dce : 85 1e __ STA ACCU + 3 
3dd0 : 85 5e __ STA T7 + 3 
3dd2 : a5 4e __ LDA T3 + 0 
3dd4 : 85 03 __ STA WORK + 0 
3dd6 : a5 4f __ LDA T3 + 1 
3dd8 : 85 04 __ STA WORK + 1 
3dda : 85 05 __ STA WORK + 2 
3ddc : 85 06 __ STA WORK + 3 
3dde : 20 8c 58 JSR $588c ; (mul32 + 0)
3de1 : a5 07 __ LDA WORK + 4 
3de3 : 85 5f __ STA T8 + 0 
3de5 : a5 08 __ LDA WORK + 5 
3de7 : 85 60 __ STA T8 + 1 
3de9 : a5 09 __ LDA WORK + 6 
3deb : 85 61 __ STA T8 + 2 
3ded : a5 0a __ LDA WORK + 7 
3def : 85 62 __ STA T8 + 3 
3df1 : 18 __ __ CLC
3df2 : a5 63 __ LDA T9 + 0 
3df4 : 69 12 __ ADC #$12
3df6 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3df8 : a9 00 __ LDA #$00
3dfa : 2a __ __ ROL
3dfb : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3dfd : a9 48 __ LDA #$48
3dff : 20 08 57 JSR $5708 ; (divmod + 53)
3e02 : a6 05 __ LDX WORK + 2 
3e04 : bd 1c 5b LDA $5b1c,x ; (sin_tab[0] + 0)
3e07 : 85 63 __ STA T9 + 0 
3e09 : 0a __ __ ASL
3e0a : a9 00 __ LDA #$00
3e0c : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3e0e : 69 ff __ ADC #$ff
3e10 : 49 ff __ EOR #$ff
3e12 : 85 64 __ STA T9 + 1 
3e14 : a5 65 __ LDA T10 + 0 
3e16 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3e18 : a9 48 __ LDA #$48
3e1a : 20 08 57 JSR $5708 ; (divmod + 53)
3e1d : a6 05 __ LDX WORK + 2 
3e1f : bd 1c 5b LDA $5b1c,x ; (sin_tab[0] + 0)
3e22 : 85 65 __ STA T10 + 0 
3e24 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3e26 : 29 80 __ AND #$80
3e28 : 10 02 __ BPL $3e2c ; (render_full_rotation.s7 + 317)
3e2a : a9 ff __ LDA #$ff
3e2c : 85 66 __ STA T10 + 1 
3e2e : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3e30 : 85 1d __ STA ACCU + 2 
3e32 : 85 1e __ STA ACCU + 3 
3e34 : a5 63 __ LDA T9 + 0 
3e36 : 85 03 __ STA WORK + 0 
3e38 : a5 64 __ LDA T9 + 1 
3e3a : 85 04 __ STA WORK + 1 
3e3c : 85 05 __ STA WORK + 2 
3e3e : 85 06 __ STA WORK + 3 
3e40 : 20 8c 58 JSR $588c ; (mul32 + 0)
3e43 : a5 09 __ LDA WORK + 6 
3e45 : 85 6b __ STA T11 + 2 
3e47 : a5 0a __ LDA WORK + 7 
3e49 : a2 06 __ LDX #$06
.l8:
3e4b : 06 07 __ ASL WORK + 4 
3e4d : 26 08 __ ROL WORK + 5 
3e4f : 26 6b __ ROL T11 + 2 
3e51 : 2a __ __ ROL
3e52 : ca __ __ DEX
3e53 : d0 f6 __ BNE $3e4b ; (render_full_rotation.l8 + 0)
.s9:
3e55 : 85 6c __ STA T11 + 3 
3e57 : 38 __ __ SEC
3e58 : a5 5f __ LDA T8 + 0 
3e5a : e5 07 __ SBC WORK + 4 
3e5c : a5 60 __ LDA T8 + 1 
3e5e : e5 08 __ SBC WORK + 5 
3e60 : 85 5f __ STA T8 + 0 
3e62 : a5 61 __ LDA T8 + 2 
3e64 : e5 6b __ SBC T11 + 2 
3e66 : 85 60 __ STA T8 + 1 
3e68 : a5 62 __ LDA T8 + 3 
3e6a : e5 6c __ SBC T11 + 3 
3e6c : a2 04 __ LDX #$04
.l10:
3e6e : c9 80 __ CMP #$80
3e70 : 6a __ __ ROR
3e71 : 66 60 __ ROR T8 + 1 
3e73 : 66 5f __ ROR T8 + 0 
3e75 : ca __ __ DEX
3e76 : d0 f6 __ BNE $3e6e ; (render_full_rotation.l10 + 0)
.s11:
3e78 : a5 60 __ LDA T8 + 1 
3e7a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3e7c : 0a __ __ ASL
3e7d : 8a __ __ TXA
3e7e : 69 ff __ ADC #$ff
3e80 : 49 ff __ EOR #$ff
3e82 : 85 1d __ STA ACCU + 2 
3e84 : 85 1e __ STA ACCU + 3 
3e86 : a5 5f __ LDA T8 + 0 
3e88 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3e8a : a5 17 __ LDA P10 ; (scale + 0)
3e8c : 85 03 __ STA WORK + 0 
3e8e : a5 18 __ LDA P11 ; (scale + 1)
3e90 : 85 04 __ STA WORK + 1 
3e92 : a5 48 __ LDA T1 + 2 
3e94 : 85 05 __ STA WORK + 2 
3e96 : 85 06 __ STA WORK + 3 
3e98 : 20 8c 58 JSR $588c ; (mul32 + 0)
3e9b : a5 07 __ LDA WORK + 4 
3e9d : 0a __ __ ASL
3e9e : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3ea0 : a5 08 __ LDA WORK + 5 
3ea2 : 2a __ __ ROL
3ea3 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3ea5 : a5 09 __ LDA WORK + 6 
3ea7 : 2a __ __ ROL
3ea8 : 85 1d __ STA ACCU + 2 
3eaa : a5 0a __ LDA WORK + 7 
3eac : 2a __ __ ROL
3ead : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
3eaf : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
3eb1 : 26 1d __ ROL ACCU + 2 
3eb3 : 2a __ __ ROL
3eb4 : 85 1e __ STA ACCU + 3 
3eb6 : a5 43 __ LDA T0 + 0 
3eb8 : 85 03 __ STA WORK + 0 
3eba : a5 44 __ LDA T0 + 1 
3ebc : 85 04 __ STA WORK + 1 
3ebe : a5 45 __ LDA T0 + 2 
3ec0 : 85 05 __ STA WORK + 2 
3ec2 : 85 06 __ STA WORK + 3 
3ec4 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
3ec7 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
3ec9 : 85 5f __ STA T8 + 0 
3ecb : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
3ecd : 85 60 __ STA T8 + 1 
3ecf : a5 63 __ LDA T9 + 0 
3ed1 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3ed3 : a5 64 __ LDA T9 + 1 
3ed5 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3ed7 : 85 1d __ STA ACCU + 2 
3ed9 : 85 1e __ STA ACCU + 3 
3edb : a5 59 __ LDA T6 + 0 
3edd : 85 03 __ STA WORK + 0 
3edf : a5 5a __ LDA T6 + 1 
3ee1 : 85 04 __ STA WORK + 1 
3ee3 : 85 05 __ STA WORK + 2 
3ee5 : 85 06 __ STA WORK + 3 
3ee7 : 20 8c 58 JSR $588c ; (mul32 + 0)
3eea : a5 07 __ LDA WORK + 4 
3eec : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3eee : 85 69 __ STA T11 + 0 
3ef0 : a5 08 __ LDA WORK + 5 
3ef2 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3ef4 : 85 6a __ STA T11 + 1 
3ef6 : a5 09 __ LDA WORK + 6 
3ef8 : 85 1d __ STA ACCU + 2 
3efa : 85 6b __ STA T11 + 2 
3efc : a5 0a __ LDA WORK + 7 
3efe : 85 1e __ STA ACCU + 3 
3f00 : 85 6c __ STA T11 + 3 
3f02 : a5 4e __ LDA T3 + 0 
3f04 : 85 03 __ STA WORK + 0 
3f06 : a5 4f __ LDA T3 + 1 
3f08 : 85 04 __ STA WORK + 1 
3f0a : 85 05 __ STA WORK + 2 
3f0c : 85 06 __ STA WORK + 3 
3f0e : 20 8c 58 JSR $588c ; (mul32 + 0)
3f11 : a5 07 __ LDA WORK + 4 
3f13 : 85 6d __ STA T12 + 0 
3f15 : a5 08 __ LDA WORK + 5 
3f17 : 85 6e __ STA T12 + 1 
3f19 : a5 09 __ LDA WORK + 6 
3f1b : 85 6f __ STA T12 + 2 
3f1d : a5 0a __ LDA WORK + 7 
3f1f : 85 70 __ STA T12 + 3 
3f21 : a5 56 __ LDA T5 + 0 
3f23 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3f25 : a5 57 __ LDA T5 + 1 
3f27 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3f29 : 85 1d __ STA ACCU + 2 
3f2b : 85 1e __ STA ACCU + 3 
3f2d : a5 65 __ LDA T10 + 0 
3f2f : 85 03 __ STA WORK + 0 
3f31 : a5 66 __ LDA T10 + 1 
3f33 : 85 04 __ STA WORK + 1 
3f35 : 85 05 __ STA WORK + 2 
3f37 : 85 06 __ STA WORK + 3 
3f39 : 20 8c 58 JSR $588c ; (mul32 + 0)
3f3c : a5 09 __ LDA WORK + 6 
3f3e : 85 73 __ STA T13 + 2 
3f40 : a5 0a __ LDA WORK + 7 
3f42 : a2 06 __ LDX #$06
.l12:
3f44 : 06 07 __ ASL WORK + 4 
3f46 : 26 08 __ ROL WORK + 5 
3f48 : 26 73 __ ROL T13 + 2 
3f4a : 2a __ __ ROL
3f4b : ca __ __ DEX
3f4c : d0 f6 __ BNE $3f44 ; (render_full_rotation.l12 + 0)
.s13:
3f4e : aa __ __ TAX
3f4f : 18 __ __ CLC
3f50 : a5 07 __ LDA WORK + 4 
3f52 : 65 6d __ ADC T12 + 0 
3f54 : a5 08 __ LDA WORK + 5 
3f56 : 65 6e __ ADC T12 + 1 
3f58 : 85 6d __ STA T12 + 0 
3f5a : a5 73 __ LDA T13 + 2 
3f5c : 65 6f __ ADC T12 + 2 
3f5e : 85 6e __ STA T12 + 1 
3f60 : 8a __ __ TXA
3f61 : 65 70 __ ADC T12 + 3 
3f63 : a2 04 __ LDX #$04
.l14:
3f65 : c9 80 __ CMP #$80
3f67 : 6a __ __ ROR
3f68 : 66 6e __ ROR T12 + 1 
3f6a : 66 6d __ ROR T12 + 0 
3f6c : ca __ __ DEX
3f6d : d0 f6 __ BNE $3f65 ; (render_full_rotation.l14 + 0)
.s15:
3f6f : a5 6e __ LDA T12 + 1 
3f71 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3f73 : 0a __ __ ASL
3f74 : 8a __ __ TXA
3f75 : 69 ff __ ADC #$ff
3f77 : 49 ff __ EOR #$ff
3f79 : 85 1d __ STA ACCU + 2 
3f7b : 85 1e __ STA ACCU + 3 
3f7d : a5 6d __ LDA T12 + 0 
3f7f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3f81 : a5 17 __ LDA P10 ; (scale + 0)
3f83 : 85 03 __ STA WORK + 0 
3f85 : a5 18 __ LDA P11 ; (scale + 1)
3f87 : 85 04 __ STA WORK + 1 
3f89 : a5 48 __ LDA T1 + 2 
3f8b : 85 05 __ STA WORK + 2 
3f8d : 85 06 __ STA WORK + 3 
3f8f : 20 8c 58 JSR $588c ; (mul32 + 0)
3f92 : a5 07 __ LDA WORK + 4 
3f94 : 0a __ __ ASL
3f95 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3f97 : a5 08 __ LDA WORK + 5 
3f99 : 2a __ __ ROL
3f9a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3f9c : a5 09 __ LDA WORK + 6 
3f9e : 2a __ __ ROL
3f9f : 85 1d __ STA ACCU + 2 
3fa1 : a5 0a __ LDA WORK + 7 
3fa3 : 2a __ __ ROL
3fa4 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
3fa6 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
3fa8 : 26 1d __ ROL ACCU + 2 
3faa : 2a __ __ ROL
3fab : 85 1e __ STA ACCU + 3 
3fad : a5 43 __ LDA T0 + 0 
3faf : 85 03 __ STA WORK + 0 
3fb1 : a5 44 __ LDA T0 + 1 
3fb3 : 85 04 __ STA WORK + 1 
3fb5 : a5 45 __ LDA T0 + 2 
3fb7 : 85 05 __ STA WORK + 2 
3fb9 : 85 06 __ STA WORK + 3 
3fbb : 20 f4 58 JSR $58f4 ; (divs32 + 0)
3fbe : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
3fc0 : 85 6d __ STA T12 + 0 
3fc2 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
3fc4 : 85 6e __ STA T12 + 1 
3fc6 : a5 4a __ LDA T2 + 0 
3fc8 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
3fca : a5 4b __ LDA T2 + 1 
3fcc : 85 1c __ STA ACCU + 1 ; (num_points + 1)
3fce : 85 1d __ STA ACCU + 2 
3fd0 : 85 1e __ STA ACCU + 3 
3fd2 : a5 65 __ LDA T10 + 0 
3fd4 : 85 03 __ STA WORK + 0 
3fd6 : a5 66 __ LDA T10 + 1 
3fd8 : 85 04 __ STA WORK + 1 
3fda : 85 05 __ STA WORK + 2 
3fdc : 85 06 __ STA WORK + 3 
3fde : 20 8c 58 JSR $588c ; (mul32 + 0)
3fe1 : a5 07 __ LDA WORK + 4 
3fe3 : 85 71 __ STA T13 + 0 
3fe5 : a5 08 __ LDA WORK + 5 
3fe7 : 85 72 __ STA T13 + 1 
3fe9 : a5 09 __ LDA WORK + 6 
3feb : 85 73 __ STA T13 + 2 
3fed : a5 0a __ LDA WORK + 7 
3fef : a2 06 __ LDX #$06
.l16:
3ff1 : c9 80 __ CMP #$80
3ff3 : 6a __ __ ROR
3ff4 : 66 73 __ ROR T13 + 2 
3ff6 : 66 72 __ ROR T13 + 1 
3ff8 : 66 71 __ ROR T13 + 0 
3ffa : ca __ __ DEX
3ffb : d0 f4 __ BNE $3ff1 ; (render_full_rotation.l16 + 0)
.s17:
3ffd : a5 72 __ LDA T13 + 1 
3fff : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4001 : 0a __ __ ASL
4002 : 8a __ __ TXA
4003 : 69 ff __ ADC #$ff
4005 : 49 ff __ EOR #$ff
4007 : 85 1d __ STA ACCU + 2 
4009 : 85 1e __ STA ACCU + 3 
400b : a5 71 __ LDA T13 + 0 
400d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
400f : a5 17 __ LDA P10 ; (scale + 0)
4011 : 85 03 __ STA WORK + 0 
4013 : a5 18 __ LDA P11 ; (scale + 1)
4015 : 85 04 __ STA WORK + 1 
4017 : a5 48 __ LDA T1 + 2 
4019 : 85 05 __ STA WORK + 2 
401b : 85 06 __ STA WORK + 3 
401d : 20 8c 58 JSR $588c ; (mul32 + 0)
4020 : a5 07 __ LDA WORK + 4 
4022 : 0a __ __ ASL
4023 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4025 : a5 08 __ LDA WORK + 5 
4027 : 2a __ __ ROL
4028 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
402a : a5 09 __ LDA WORK + 6 
402c : 2a __ __ ROL
402d : 85 1d __ STA ACCU + 2 
402f : a5 0a __ LDA WORK + 7 
4031 : 2a __ __ ROL
4032 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
4034 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
4036 : 26 1d __ ROL ACCU + 2 
4038 : 2a __ __ ROL
4039 : 85 1e __ STA ACCU + 3 
403b : a5 43 __ LDA T0 + 0 
403d : 85 03 __ STA WORK + 0 
403f : a5 44 __ LDA T0 + 1 
4041 : 85 04 __ STA WORK + 1 
4043 : a5 45 __ LDA T0 + 2 
4045 : 85 05 __ STA WORK + 2 
4047 : 85 06 __ STA WORK + 3 
4049 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
404c : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
404e : 85 71 __ STA T13 + 0 
4050 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4052 : 85 72 __ STA T13 + 1 
4054 : a5 5b __ LDA T7 + 0 
4056 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4058 : a5 5c __ LDA T7 + 1 
405a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
405c : a5 5d __ LDA T7 + 2 
405e : 85 1d __ STA ACCU + 2 
4060 : a5 5e __ LDA T7 + 3 
4062 : 85 1e __ STA ACCU + 3 
4064 : a5 65 __ LDA T10 + 0 
4066 : 85 03 __ STA WORK + 0 
4068 : a5 66 __ LDA T10 + 1 
406a : 85 04 __ STA WORK + 1 
406c : 85 05 __ STA WORK + 2 
406e : 85 06 __ STA WORK + 3 
4070 : 20 8c 58 JSR $588c ; (mul32 + 0)
4073 : a5 07 __ LDA WORK + 4 
4075 : 85 5b __ STA T7 + 0 
4077 : a5 08 __ LDA WORK + 5 
4079 : 85 5c __ STA T7 + 1 
407b : a5 09 __ LDA WORK + 6 
407d : 85 5d __ STA T7 + 2 
407f : a5 0a __ LDA WORK + 7 
4081 : 85 5e __ STA T7 + 3 
4083 : a5 63 __ LDA T9 + 0 
4085 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4087 : a5 64 __ LDA T9 + 1 
4089 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
408b : 85 1d __ STA ACCU + 2 
408d : 85 1e __ STA ACCU + 3 
408f : a5 4e __ LDA T3 + 0 
4091 : 85 03 __ STA WORK + 0 
4093 : a5 4f __ LDA T3 + 1 
4095 : 85 04 __ STA WORK + 1 
4097 : 85 05 __ STA WORK + 2 
4099 : 85 06 __ STA WORK + 3 
409b : 20 8c 58 JSR $588c ; (mul32 + 0)
409e : a5 09 __ LDA WORK + 6 
40a0 : 85 76 __ STA T14 + 2 
40a2 : a5 0a __ LDA WORK + 7 
40a4 : a2 06 __ LDX #$06
.l18:
40a6 : 06 07 __ ASL WORK + 4 
40a8 : 26 08 __ ROL WORK + 5 
40aa : 26 76 __ ROL T14 + 2 
40ac : 2a __ __ ROL
40ad : ca __ __ DEX
40ae : d0 f6 __ BNE $40a6 ; (render_full_rotation.l18 + 0)
.s19:
40b0 : aa __ __ TAX
40b1 : 18 __ __ CLC
40b2 : a5 07 __ LDA WORK + 4 
40b4 : 65 5b __ ADC T7 + 0 
40b6 : a5 08 __ LDA WORK + 5 
40b8 : 65 5c __ ADC T7 + 1 
40ba : 85 5b __ STA T7 + 0 
40bc : a5 76 __ LDA T14 + 2 
40be : 65 5d __ ADC T7 + 2 
40c0 : 85 5c __ STA T7 + 1 
40c2 : 8a __ __ TXA
40c3 : 65 5e __ ADC T7 + 3 
40c5 : a2 04 __ LDX #$04
.l20:
40c7 : c9 80 __ CMP #$80
40c9 : 6a __ __ ROR
40ca : 66 5c __ ROR T7 + 1 
40cc : 66 5b __ ROR T7 + 0 
40ce : ca __ __ DEX
40cf : d0 f6 __ BNE $40c7 ; (render_full_rotation.l20 + 0)
.s21:
40d1 : a5 5c __ LDA T7 + 1 
40d3 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
40d5 : 0a __ __ ASL
40d6 : 8a __ __ TXA
40d7 : 69 ff __ ADC #$ff
40d9 : 49 ff __ EOR #$ff
40db : 85 1d __ STA ACCU + 2 
40dd : 85 1e __ STA ACCU + 3 
40df : a5 5b __ LDA T7 + 0 
40e1 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
40e3 : a5 17 __ LDA P10 ; (scale + 0)
40e5 : 85 03 __ STA WORK + 0 
40e7 : a5 18 __ LDA P11 ; (scale + 1)
40e9 : 85 04 __ STA WORK + 1 
40eb : a5 48 __ LDA T1 + 2 
40ed : 85 05 __ STA WORK + 2 
40ef : 85 06 __ STA WORK + 3 
40f1 : 20 8c 58 JSR $588c ; (mul32 + 0)
40f4 : a5 07 __ LDA WORK + 4 
40f6 : 0a __ __ ASL
40f7 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
40f9 : a5 08 __ LDA WORK + 5 
40fb : 2a __ __ ROL
40fc : 85 1c __ STA ACCU + 1 ; (num_points + 1)
40fe : a5 09 __ LDA WORK + 6 
4100 : 2a __ __ ROL
4101 : 85 1d __ STA ACCU + 2 
4103 : a5 0a __ LDA WORK + 7 
4105 : 2a __ __ ROL
4106 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
4108 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
410a : 26 1d __ ROL ACCU + 2 
410c : 2a __ __ ROL
410d : 85 1e __ STA ACCU + 3 
410f : a5 43 __ LDA T0 + 0 
4111 : 85 03 __ STA WORK + 0 
4113 : a5 44 __ LDA T0 + 1 
4115 : 85 04 __ STA WORK + 1 
4117 : a5 45 __ LDA T0 + 2 
4119 : 85 05 __ STA WORK + 2 
411b : 85 06 __ STA WORK + 3 
411d : 20 f4 58 JSR $58f4 ; (divs32 + 0)
4120 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
4122 : 85 5b __ STA T7 + 0 
4124 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4126 : 85 5c __ STA T7 + 1 
4128 : a5 69 __ LDA T11 + 0 
412a : 85 1b __ STA ACCU + 0 ; (num_points + 0)
412c : a5 6a __ LDA T11 + 1 
412e : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4130 : a5 6b __ LDA T11 + 2 
4132 : 85 1d __ STA ACCU + 2 
4134 : a5 6c __ LDA T11 + 3 
4136 : 85 1e __ STA ACCU + 3 
4138 : a5 65 __ LDA T10 + 0 
413a : 85 03 __ STA WORK + 0 
413c : a5 66 __ LDA T10 + 1 
413e : 85 04 __ STA WORK + 1 
4140 : 85 05 __ STA WORK + 2 
4142 : 85 06 __ STA WORK + 3 
4144 : 20 8c 58 JSR $588c ; (mul32 + 0)
4147 : a5 07 __ LDA WORK + 4 
4149 : 85 65 __ STA T10 + 0 
414b : a5 08 __ LDA WORK + 5 
414d : 85 66 __ STA T10 + 1 
414f : a5 09 __ LDA WORK + 6 
4151 : 85 67 __ STA T10 + 2 
4153 : a5 0a __ LDA WORK + 7 
4155 : 85 68 __ STA T10 + 3 
4157 : a5 4e __ LDA T3 + 0 
4159 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
415b : a5 4f __ LDA T3 + 1 
415d : 85 1c __ STA ACCU + 1 ; (num_points + 1)
415f : 85 1d __ STA ACCU + 2 
4161 : 85 1e __ STA ACCU + 3 
4163 : a5 56 __ LDA T5 + 0 
4165 : 85 03 __ STA WORK + 0 
4167 : a5 57 __ LDA T5 + 1 
4169 : 85 04 __ STA WORK + 1 
416b : 85 05 __ STA WORK + 2 
416d : 85 06 __ STA WORK + 3 
416f : 20 8c 58 JSR $588c ; (mul32 + 0)
4172 : a5 07 __ LDA WORK + 4 
4174 : 85 4e __ STA T3 + 0 
4176 : a5 08 __ LDA WORK + 5 
4178 : 85 4f __ STA T3 + 1 
417a : a5 09 __ LDA WORK + 6 
417c : 85 50 __ STA T3 + 2 
417e : a5 0a __ LDA WORK + 7 
4180 : a2 06 __ LDX #$06
.l22:
4182 : 06 4e __ ASL T3 + 0 
4184 : 26 4f __ ROL T3 + 1 
4186 : 26 50 __ ROL T3 + 2 
4188 : 2a __ __ ROL
4189 : ca __ __ DEX
418a : d0 f6 __ BNE $4182 ; (render_full_rotation.l22 + 0)
.s23:
418c : 85 51 __ STA T3 + 3 
418e : 38 __ __ SEC
418f : a5 65 __ LDA T10 + 0 
4191 : e5 4e __ SBC T3 + 0 
4193 : a5 66 __ LDA T10 + 1 
4195 : e5 4f __ SBC T3 + 1 
4197 : 85 4e __ STA T3 + 0 
4199 : a5 67 __ LDA T10 + 2 
419b : e5 50 __ SBC T3 + 2 
419d : 85 4f __ STA T3 + 1 
419f : a5 68 __ LDA T10 + 3 
41a1 : e5 51 __ SBC T3 + 3 
41a3 : a2 04 __ LDX #$04
.l24:
41a5 : c9 80 __ CMP #$80
41a7 : 6a __ __ ROR
41a8 : 66 4f __ ROR T3 + 1 
41aa : 66 4e __ ROR T3 + 0 
41ac : ca __ __ DEX
41ad : d0 f6 __ BNE $41a5 ; (render_full_rotation.l24 + 0)
.s25:
41af : a5 4f __ LDA T3 + 1 
41b1 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
41b3 : 0a __ __ ASL
41b4 : 8a __ __ TXA
41b5 : 69 ff __ ADC #$ff
41b7 : 49 ff __ EOR #$ff
41b9 : 85 1d __ STA ACCU + 2 
41bb : 85 1e __ STA ACCU + 3 
41bd : a5 4e __ LDA T3 + 0 
41bf : 85 1b __ STA ACCU + 0 ; (num_points + 0)
41c1 : a5 17 __ LDA P10 ; (scale + 0)
41c3 : 85 03 __ STA WORK + 0 
41c5 : a5 18 __ LDA P11 ; (scale + 1)
41c7 : 85 04 __ STA WORK + 1 
41c9 : a5 48 __ LDA T1 + 2 
41cb : 85 05 __ STA WORK + 2 
41cd : 85 06 __ STA WORK + 3 
41cf : 20 8c 58 JSR $588c ; (mul32 + 0)
41d2 : a5 07 __ LDA WORK + 4 
41d4 : 0a __ __ ASL
41d5 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
41d7 : a5 08 __ LDA WORK + 5 
41d9 : 2a __ __ ROL
41da : 85 1c __ STA ACCU + 1 ; (num_points + 1)
41dc : a5 09 __ LDA WORK + 6 
41de : 2a __ __ ROL
41df : 85 1d __ STA ACCU + 2 
41e1 : a5 0a __ LDA WORK + 7 
41e3 : 2a __ __ ROL
41e4 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
41e6 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
41e8 : 26 1d __ ROL ACCU + 2 
41ea : 2a __ __ ROL
41eb : 85 1e __ STA ACCU + 3 
41ed : a5 43 __ LDA T0 + 0 
41ef : 85 03 __ STA WORK + 0 
41f1 : a5 44 __ LDA T0 + 1 
41f3 : 85 04 __ STA WORK + 1 
41f5 : a5 45 __ LDA T0 + 2 
41f7 : 85 05 __ STA WORK + 2 
41f9 : 85 06 __ STA WORK + 3 
41fb : 20 f4 58 JSR $58f4 ; (divs32 + 0)
41fe : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
4200 : 85 4e __ STA T3 + 0 
4202 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4204 : 85 4f __ STA T3 + 1 
4206 : 38 __ __ SEC
4207 : a9 00 __ LDA #$00
4209 : e5 59 __ SBC T6 + 0 
420b : 85 1b __ STA ACCU + 0 ; (num_points + 0)
420d : a9 00 __ LDA #$00
420f : e5 5a __ SBC T6 + 1 
4211 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4213 : 29 80 __ AND #$80
4215 : 10 02 __ BPL $4219 ; (render_full_rotation.s25 + 106)
4217 : a9 ff __ LDA #$ff
4219 : 85 1d __ STA ACCU + 2 
421b : 85 1e __ STA ACCU + 3 
421d : a5 17 __ LDA P10 ; (scale + 0)
421f : 85 03 __ STA WORK + 0 
4221 : a5 18 __ LDA P11 ; (scale + 1)
4223 : 85 04 __ STA WORK + 1 
4225 : a5 48 __ LDA T1 + 2 
4227 : 85 05 __ STA WORK + 2 
4229 : 85 06 __ STA WORK + 3 
422b : 20 8c 58 JSR $588c ; (mul32 + 0)
422e : a5 07 __ LDA WORK + 4 
4230 : 0a __ __ ASL
4231 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4233 : a5 08 __ LDA WORK + 5 
4235 : 2a __ __ ROL
4236 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4238 : a5 09 __ LDA WORK + 6 
423a : 2a __ __ ROL
423b : 85 1d __ STA ACCU + 2 
423d : a5 0a __ LDA WORK + 7 
423f : 2a __ __ ROL
4240 : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
4242 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
4244 : 26 1d __ ROL ACCU + 2 
4246 : 2a __ __ ROL
4247 : 85 1e __ STA ACCU + 3 
4249 : a5 43 __ LDA T0 + 0 
424b : 85 03 __ STA WORK + 0 
424d : a5 44 __ LDA T0 + 1 
424f : 85 04 __ STA WORK + 1 
4251 : a5 45 __ LDA T0 + 2 
4253 : 85 05 __ STA WORK + 2 
4255 : 85 06 __ STA WORK + 3 
4257 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
425a : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
425c : 85 59 __ STA T6 + 0 
425e : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4260 : 85 5a __ STA T6 + 1 
4262 : a5 56 __ LDA T5 + 0 
4264 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4266 : a5 57 __ LDA T5 + 1 
4268 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
426a : 85 1d __ STA ACCU + 2 
426c : 85 1e __ STA ACCU + 3 
426e : a5 4a __ LDA T2 + 0 
4270 : 85 03 __ STA WORK + 0 
4272 : a5 4b __ LDA T2 + 1 
4274 : 85 04 __ STA WORK + 1 
4276 : 85 05 __ STA WORK + 2 
4278 : 85 06 __ STA WORK + 3 
427a : 20 8c 58 JSR $588c ; (mul32 + 0)
427d : a5 07 __ LDA WORK + 4 
427f : 85 56 __ STA T5 + 0 
4281 : a5 08 __ LDA WORK + 5 
4283 : 85 57 __ STA T5 + 1 
4285 : a5 09 __ LDA WORK + 6 
4287 : 85 58 __ STA T5 + 2 
4289 : a5 0a __ LDA WORK + 7 
428b : a2 06 __ LDX #$06
.l26:
428d : c9 80 __ CMP #$80
428f : 6a __ __ ROR
4290 : 66 58 __ ROR T5 + 2 
4292 : 66 57 __ ROR T5 + 1 
4294 : 66 56 __ ROR T5 + 0 
4296 : ca __ __ DEX
4297 : d0 f4 __ BNE $428d ; (render_full_rotation.l26 + 0)
.s27:
4299 : a5 57 __ LDA T5 + 1 
429b : 85 1c __ STA ACCU + 1 ; (num_points + 1)
429d : 0a __ __ ASL
429e : 8a __ __ TXA
429f : 69 ff __ ADC #$ff
42a1 : 49 ff __ EOR #$ff
42a3 : 85 1d __ STA ACCU + 2 
42a5 : 85 1e __ STA ACCU + 3 
42a7 : a5 56 __ LDA T5 + 0 
42a9 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
42ab : a5 17 __ LDA P10 ; (scale + 0)
42ad : 85 03 __ STA WORK + 0 
42af : a5 18 __ LDA P11 ; (scale + 1)
42b1 : 85 04 __ STA WORK + 1 
42b3 : a5 48 __ LDA T1 + 2 
42b5 : 85 05 __ STA WORK + 2 
42b7 : 85 06 __ STA WORK + 3 
42b9 : 20 8c 58 JSR $588c ; (mul32 + 0)
42bc : a5 07 __ LDA WORK + 4 
42be : 0a __ __ ASL
42bf : 85 1b __ STA ACCU + 0 ; (num_points + 0)
42c1 : a5 08 __ LDA WORK + 5 
42c3 : 2a __ __ ROL
42c4 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
42c6 : a5 09 __ LDA WORK + 6 
42c8 : 2a __ __ ROL
42c9 : 85 1d __ STA ACCU + 2 
42cb : a5 0a __ LDA WORK + 7 
42cd : 2a __ __ ROL
42ce : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
42d0 : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
42d2 : 26 1d __ ROL ACCU + 2 
42d4 : 2a __ __ ROL
42d5 : 85 1e __ STA ACCU + 3 
42d7 : a5 43 __ LDA T0 + 0 
42d9 : 85 03 __ STA WORK + 0 
42db : a5 44 __ LDA T0 + 1 
42dd : 85 04 __ STA WORK + 1 
42df : a5 45 __ LDA T0 + 2 
42e1 : 85 05 __ STA WORK + 2 
42e3 : 85 06 __ STA WORK + 3 
42e5 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
42e8 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
42ea : 85 56 __ STA T5 + 0 
42ec : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
42ee : 85 57 __ STA T5 + 1 
42f0 : a5 63 __ LDA T9 + 0 
42f2 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
42f4 : a5 64 __ LDA T9 + 1 
42f6 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
42f8 : 85 1d __ STA ACCU + 2 
42fa : 85 1e __ STA ACCU + 3 
42fc : a5 4a __ LDA T2 + 0 
42fe : 85 03 __ STA WORK + 0 
4300 : a5 4b __ LDA T2 + 1 
4302 : 85 04 __ STA WORK + 1 
4304 : 85 05 __ STA WORK + 2 
4306 : 85 06 __ STA WORK + 3 
4308 : 20 8c 58 JSR $588c ; (mul32 + 0)
430b : a5 07 __ LDA WORK + 4 
430d : 85 4a __ STA T2 + 0 
430f : a5 08 __ LDA WORK + 5 
4311 : 85 4b __ STA T2 + 1 
4313 : a5 09 __ LDA WORK + 6 
4315 : 85 4c __ STA T2 + 2 
4317 : a5 0a __ LDA WORK + 7 
4319 : a2 06 __ LDX #$06
.l28:
431b : c9 80 __ CMP #$80
431d : 6a __ __ ROR
431e : 66 4c __ ROR T2 + 2 
4320 : 66 4b __ ROR T2 + 1 
4322 : 66 4a __ ROR T2 + 0 
4324 : ca __ __ DEX
4325 : d0 f4 __ BNE $431b ; (render_full_rotation.l28 + 0)
.s29:
4327 : a5 4b __ LDA T2 + 1 
4329 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
432b : 0a __ __ ASL
432c : 8a __ __ TXA
432d : 69 ff __ ADC #$ff
432f : 49 ff __ EOR #$ff
4331 : 85 1d __ STA ACCU + 2 
4333 : 85 1e __ STA ACCU + 3 
4335 : a5 4a __ LDA T2 + 0 
4337 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4339 : a5 17 __ LDA P10 ; (scale + 0)
433b : 85 03 __ STA WORK + 0 
433d : a5 18 __ LDA P11 ; (scale + 1)
433f : 85 04 __ STA WORK + 1 
4341 : a5 48 __ LDA T1 + 2 
4343 : 85 05 __ STA WORK + 2 
4345 : 85 06 __ STA WORK + 3 
4347 : 20 8c 58 JSR $588c ; (mul32 + 0)
434a : a5 07 __ LDA WORK + 4 
434c : 0a __ __ ASL
434d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
434f : a5 08 __ LDA WORK + 5 
4351 : 2a __ __ ROL
4352 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4354 : a5 09 __ LDA WORK + 6 
4356 : 2a __ __ ROL
4357 : 85 1d __ STA ACCU + 2 
4359 : a5 0a __ LDA WORK + 7 
435b : 2a __ __ ROL
435c : 06 1b __ ASL ACCU + 0 ; (num_points + 0)
435e : 26 1c __ ROL ACCU + 1 ; (num_points + 1)
4360 : 26 1d __ ROL ACCU + 2 
4362 : 2a __ __ ROL
4363 : 85 1e __ STA ACCU + 3 
4365 : a5 43 __ LDA T0 + 0 
4367 : 85 03 __ STA WORK + 0 
4369 : a5 44 __ LDA T0 + 1 
436b : 85 04 __ STA WORK + 1 
436d : a5 45 __ LDA T0 + 2 
436f : 85 05 __ STA WORK + 2 
4371 : 85 06 __ STA WORK + 3 
4373 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
4376 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
4378 : 85 43 __ STA T0 + 0 
437a : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
437c : 85 44 __ STA T0 + 1 
437e : ad c2 5b LDA $5bc2 ; (x_pct + 0)
4381 : 85 63 __ STA T9 + 0 
4383 : ad c3 5b LDA $5bc3 ; (x_pct + 1)
4386 : 85 64 __ STA T9 + 1 
4388 : ad c4 5b LDA $5bc4 ; (y_pct + 0)
438b : 85 65 __ STA T10 + 0 
438d : ad c5 5b LDA $5bc5 ; (y_pct + 1)
4390 : 85 66 __ STA T10 + 1 
4392 : ad c6 5b LDA $5bc6 ; (z_pct + 0)
4395 : 85 69 __ STA T11 + 0 
4397 : ad c7 5b LDA $5bc7 ; (z_pct + 1)
439a : 85 6a __ STA T11 + 1 
439c : ad ca 5b LDA $5bca ; (vx_pct + 0)
439f : 85 74 __ STA T14 + 0 
43a1 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
43a4 : 85 75 __ STA T14 + 1 
43a6 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
43a9 : 85 79 __ STA T16 + 0 
43ab : ad cd 5b LDA $5bcd ; (vy_pct + 1)
43ae : 85 7a __ STA T16 + 1 
43b0 : ad c8 5b LDA $5bc8 ; (z_rotated + 0)
43b3 : 85 7b __ STA T17 + 0 
43b5 : ad c9 5b LDA $5bc9 ; (z_rotated + 1)
43b8 : 85 7c __ STA T17 + 1 
43ba : ad ec bf LDA $bfec ; (sstack + 0)
43bd : 85 7d __ STA T18 + 0 
43bf : ad ed bf LDA $bfed ; (sstack + 1)
43c2 : 85 7e __ STA T18 + 1 
.l30:
43c4 : a0 00 __ LDY #$00
43c6 : b1 63 __ LDA (T9 + 0),y 
43c8 : 85 46 __ STA T1 + 0 
43ca : 85 1b __ STA ACCU + 0 ; (num_points + 0)
43cc : c8 __ __ INY
43cd : b1 63 __ LDA (T9 + 0),y 
43cf : 85 47 __ STA T1 + 1 
43d1 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
43d3 : a5 59 __ LDA T6 + 0 
43d5 : 85 03 __ STA WORK + 0 
43d7 : a5 5a __ LDA T6 + 1 
43d9 : 85 04 __ STA WORK + 1 
43db : 20 57 56 JSR $5657 ; (mul16 + 0)
43de : a5 05 __ LDA WORK + 2 
43e0 : 85 4a __ STA T2 + 0 
43e2 : a5 06 __ LDA WORK + 3 
43e4 : 85 4b __ STA T2 + 1 
43e6 : a0 00 __ LDY #$00
43e8 : b1 65 __ LDA (T10 + 0),y 
43ea : 85 7f __ STA T21 + 0 
43ec : 85 1b __ STA ACCU + 0 ; (num_points + 0)
43ee : c8 __ __ INY
43ef : b1 65 __ LDA (T10 + 0),y 
43f1 : 85 80 __ STA T21 + 1 
43f3 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
43f5 : a5 56 __ LDA T5 + 0 
43f7 : 85 03 __ STA WORK + 0 
43f9 : a5 57 __ LDA T5 + 1 
43fb : 85 04 __ STA WORK + 1 
43fd : 20 57 56 JSR $5657 ; (mul16 + 0)
4400 : 18 __ __ CLC
4401 : a5 05 __ LDA WORK + 2 
4403 : 65 4a __ ADC T2 + 0 
4405 : 85 4a __ STA T2 + 0 
4407 : a5 06 __ LDA WORK + 3 
4409 : 65 4b __ ADC T2 + 1 
440b : 85 4b __ STA T2 + 1 
440d : a0 00 __ LDY #$00
440f : b1 69 __ LDA (T11 + 0),y 
4411 : 85 81 __ STA T22 + 0 
4413 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4415 : c8 __ __ INY
4416 : b1 69 __ LDA (T11 + 0),y 
4418 : 85 82 __ STA T22 + 1 
441a : 85 1c __ STA ACCU + 1 ; (num_points + 1)
441c : a5 43 __ LDA T0 + 0 
441e : 85 03 __ STA WORK + 0 
4420 : a5 44 __ LDA T0 + 1 
4422 : 85 04 __ STA WORK + 1 
4424 : 20 57 56 JSR $5657 ; (mul16 + 0)
4427 : 18 __ __ CLC
4428 : a5 05 __ LDA WORK + 2 
442a : 65 4a __ ADC T2 + 0 
442c : a5 06 __ LDA WORK + 3 
442e : 65 4b __ ADC T2 + 1 
4430 : 49 80 __ EOR #$80
4432 : 38 __ __ SEC
4433 : e9 80 __ SBC #$80
4435 : 85 4a __ STA T2 + 0 
4437 : a0 00 __ LDY #$00
4439 : 91 7b __ STA (T17 + 0),y 
443b : e5 4a __ SBC T2 + 0 
443d : 85 4b __ STA T2 + 1 
443f : c8 __ __ INY
4440 : 91 7b __ STA (T17 + 0),y 
4442 : a5 53 __ LDA T4 + 0 
4444 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4446 : a5 54 __ LDA T4 + 1 
4448 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
444a : a5 46 __ LDA T1 + 0 
444c : 85 03 __ STA WORK + 0 
444e : a5 47 __ LDA T1 + 1 
4450 : 85 04 __ STA WORK + 1 
4452 : 20 57 56 JSR $5657 ; (mul16 + 0)
4455 : a5 05 __ LDA WORK + 2 
4457 : 85 83 __ STA T23 + 0 
4459 : a5 06 __ LDA WORK + 3 
445b : 85 84 __ STA T23 + 1 
445d : a5 5f __ LDA T8 + 0 
445f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4461 : a5 60 __ LDA T8 + 1 
4463 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4465 : a5 7f __ LDA T21 + 0 
4467 : 85 03 __ STA WORK + 0 
4469 : a5 80 __ LDA T21 + 1 
446b : 85 04 __ STA WORK + 1 
446d : 20 57 56 JSR $5657 ; (mul16 + 0)
4470 : 18 __ __ CLC
4471 : a5 05 __ LDA WORK + 2 
4473 : 65 83 __ ADC T23 + 0 
4475 : 85 83 __ STA T23 + 0 
4477 : a5 06 __ LDA WORK + 3 
4479 : 65 84 __ ADC T23 + 1 
447b : 85 84 __ STA T23 + 1 
447d : a5 6d __ LDA T12 + 0 
447f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4481 : a5 6e __ LDA T12 + 1 
4483 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4485 : a5 81 __ LDA T22 + 0 
4487 : 85 03 __ STA WORK + 0 
4489 : a5 82 __ LDA T22 + 1 
448b : 85 04 __ STA WORK + 1 
448d : 20 57 56 JSR $5657 ; (mul16 + 0)
4490 : 18 __ __ CLC
4491 : a5 05 __ LDA WORK + 2 
4493 : 65 83 __ ADC T23 + 0 
4495 : a5 06 __ LDA WORK + 3 
4497 : 65 84 __ ADC T23 + 1 
4499 : 85 84 __ STA T23 + 1 
449b : a5 71 __ LDA T13 + 0 
449d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
449f : a5 72 __ LDA T13 + 1 
44a1 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
44a3 : a5 46 __ LDA T1 + 0 
44a5 : 85 03 __ STA WORK + 0 
44a7 : a5 47 __ LDA T1 + 1 
44a9 : 85 04 __ STA WORK + 1 
44ab : 20 57 56 JSR $5657 ; (mul16 + 0)
44ae : a5 05 __ LDA WORK + 2 
44b0 : 85 46 __ STA T1 + 0 
44b2 : a5 06 __ LDA WORK + 3 
44b4 : 85 47 __ STA T1 + 1 
44b6 : a5 5b __ LDA T7 + 0 
44b8 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
44ba : a5 5c __ LDA T7 + 1 
44bc : 85 1c __ STA ACCU + 1 ; (num_points + 1)
44be : a5 7f __ LDA T21 + 0 
44c0 : 85 03 __ STA WORK + 0 
44c2 : a5 80 __ LDA T21 + 1 
44c4 : 85 04 __ STA WORK + 1 
44c6 : 20 57 56 JSR $5657 ; (mul16 + 0)
44c9 : 18 __ __ CLC
44ca : a5 05 __ LDA WORK + 2 
44cc : 65 46 __ ADC T1 + 0 
44ce : 85 46 __ STA T1 + 0 
44d0 : a5 06 __ LDA WORK + 3 
44d2 : 65 47 __ ADC T1 + 1 
44d4 : 85 47 __ STA T1 + 1 
44d6 : a5 4e __ LDA T3 + 0 
44d8 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
44da : a5 4f __ LDA T3 + 1 
44dc : 85 1c __ STA ACCU + 1 ; (num_points + 1)
44de : a5 81 __ LDA T22 + 0 
44e0 : 85 03 __ STA WORK + 0 
44e2 : a5 82 __ LDA T22 + 1 
44e4 : 85 04 __ STA WORK + 1 
44e6 : 20 57 56 JSR $5657 ; (mul16 + 0)
44e9 : 18 __ __ CLC
44ea : a5 05 __ LDA WORK + 2 
44ec : 65 46 __ ADC T1 + 0 
44ee : a5 06 __ LDA WORK + 3 
44f0 : 65 47 __ ADC T1 + 1 
44f2 : 85 80 __ STA T21 + 1 
44f4 : 18 __ __ CLC
44f5 : a5 7d __ LDA T18 + 0 
44f7 : 65 4a __ ADC T2 + 0 
44f9 : 85 81 __ STA T22 + 0 
44fb : a5 7e __ LDA T18 + 1 
44fd : 65 4b __ ADC T2 + 1 
44ff : 85 82 __ STA T22 + 1 
4501 : 05 81 __ ORA T22 + 0 
4503 : d0 08 __ BNE $450d ; (render_full_rotation.s31 + 0)
.s32:
4505 : a9 01 __ LDA #$01
4507 : 85 81 __ STA T22 + 0 
4509 : a9 00 __ LDA #$00
450b : 85 82 __ STA T22 + 1 
.s31:
450d : a5 84 __ LDA T23 + 1 
450f : 49 80 __ EOR #$80
4511 : 38 __ __ SEC
4512 : e9 80 __ SBC #$80
4514 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4516 : e5 1b __ SBC ACCU + 0 ; (num_points + 0)
4518 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
451a : 29 80 __ AND #$80
451c : 10 02 __ BPL $4520 ; (render_full_rotation.s31 + 19)
451e : a9 ff __ LDA #$ff
4520 : 85 1d __ STA ACCU + 2 
4522 : 85 1e __ STA ACCU + 3 
4524 : 20 1e 58 JSR $581e ; (sint32_to_float + 0)
4527 : a9 9a __ LDA #$9a
4529 : 85 03 __ STA WORK + 0 
452b : a9 3f __ LDA #$3f
452d : 85 06 __ STA WORK + 3 
452f : a9 99 __ LDA #$99
4531 : 85 04 __ STA WORK + 1 
4533 : a9 19 __ LDA #$19
4535 : 85 05 __ STA WORK + 2 
4537 : 20 c3 53 JSR $53c3 ; (freg + 20)
453a : 20 e1 54 JSR $54e1 ; (crt_fmul + 0)
453d : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
453f : 85 46 __ STA T1 + 0 
4541 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4543 : 85 47 __ STA T1 + 1 
4545 : a5 1d __ LDA ACCU + 2 
4547 : 85 48 __ STA T1 + 2 
4549 : a5 1e __ LDA ACCU + 3 
454b : 85 49 __ STA T1 + 3 
454d : a5 7d __ LDA T18 + 0 
454f : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4551 : a5 7e __ LDA T18 + 1 
4553 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4555 : 20 d7 57 JSR $57d7 ; (sint16_to_float + 0)
4558 : a2 46 __ LDX #$46
455a : 20 b3 53 JSR $53b3 ; (freg + 4)
455d : 20 e1 54 JSR $54e1 ; (crt_fmul + 0)
4560 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
4562 : 85 46 __ STA T1 + 0 
4564 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4566 : 85 47 __ STA T1 + 1 
4568 : a5 1d __ LDA ACCU + 2 
456a : 85 48 __ STA T1 + 2 
456c : a5 1e __ LDA ACCU + 3 
456e : 85 49 __ STA T1 + 3 
4570 : a5 81 __ LDA T22 + 0 
4572 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
4574 : a5 82 __ LDA T22 + 1 
4576 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4578 : 20 d7 57 JSR $57d7 ; (sint16_to_float + 0)
457b : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
457d : 85 4a __ STA T2 + 0 
457f : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4581 : 85 4b __ STA T2 + 1 
4583 : a5 1d __ LDA ACCU + 2 
4585 : 85 4c __ STA T2 + 2 
4587 : a5 1e __ LDA ACCU + 3 
4589 : 85 4d __ STA T2 + 3 
458b : a5 46 __ LDA T1 + 0 
458d : 85 1b __ STA ACCU + 0 ; (num_points + 0)
458f : a5 47 __ LDA T1 + 1 
4591 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
4593 : a5 48 __ LDA T1 + 2 
4595 : 85 1d __ STA ACCU + 2 
4597 : a5 49 __ LDA T1 + 3 
4599 : 85 1e __ STA ACCU + 3 
459b : a2 4a __ LDX #$4a
459d : 20 b3 53 JSR $53b3 ; (freg + 4)
45a0 : 20 a9 55 JSR $55a9 ; (crt_fdiv + 0)
45a3 : 20 8b 57 JSR $578b ; (f32_to_i16 + 0)
45a6 : 18 __ __ CLC
45a7 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
45a9 : 65 13 __ ADC P6 ; (dx + 0)
45ab : a0 00 __ LDY #$00
45ad : 91 74 __ STA (T14 + 0),y 
45af : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
45b1 : 65 14 __ ADC P7 ; (dx + 1)
45b3 : c8 __ __ INY
45b4 : 91 74 __ STA (T14 + 0),y 
45b6 : a5 80 __ LDA T21 + 1 
45b8 : 49 80 __ EOR #$80
45ba : 38 __ __ SEC
45bb : e9 80 __ SBC #$80
45bd : 85 03 __ STA WORK + 0 
45bf : e5 03 __ SBC WORK + 0 
45c1 : 85 04 __ STA WORK + 1 
45c3 : 29 80 __ AND #$80
45c5 : 10 02 __ BPL $45c9 ; (render_full_rotation.s31 + 188)
45c7 : a9 ff __ LDA #$ff
45c9 : 85 05 __ STA WORK + 2 
45cb : 85 06 __ STA WORK + 3 
45cd : a5 7e __ LDA T18 + 1 
45cf : 85 1c __ STA ACCU + 1 ; (num_points + 1)
45d1 : 29 80 __ AND #$80
45d3 : 10 02 __ BPL $45d7 ; (render_full_rotation.s31 + 202)
45d5 : a9 ff __ LDA #$ff
45d7 : 85 1d __ STA ACCU + 2 
45d9 : 85 1e __ STA ACCU + 3 
45db : a5 7d __ LDA T18 + 0 
45dd : 85 1b __ STA ACCU + 0 ; (num_points + 0)
45df : 20 8c 58 JSR $588c ; (mul32 + 0)
45e2 : a5 82 __ LDA T22 + 1 
45e4 : 85 04 __ STA WORK + 1 
45e6 : 29 80 __ AND #$80
45e8 : 10 02 __ BPL $45ec ; (render_full_rotation.s31 + 223)
45ea : a9 ff __ LDA #$ff
45ec : 85 05 __ STA WORK + 2 
45ee : 85 06 __ STA WORK + 3 
45f0 : a5 07 __ LDA WORK + 4 
45f2 : 85 1b __ STA ACCU + 0 ; (num_points + 0)
45f4 : a5 08 __ LDA WORK + 5 
45f6 : 85 1c __ STA ACCU + 1 ; (num_points + 1)
45f8 : a5 09 __ LDA WORK + 6 
45fa : 85 1d __ STA ACCU + 2 
45fc : a5 0a __ LDA WORK + 7 
45fe : 85 1e __ STA ACCU + 3 
4600 : a5 81 __ LDA T22 + 0 
4602 : 85 03 __ STA WORK + 0 
4604 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
4607 : 18 __ __ CLC
4608 : a5 1b __ LDA ACCU + 0 ; (num_points + 0)
460a : 65 15 __ ADC P8 ; (dy + 0)
460c : a0 00 __ LDY #$00
460e : 91 79 __ STA (T16 + 0),y 
4610 : a5 1c __ LDA ACCU + 1 ; (num_points + 1)
4612 : 65 16 __ ADC P9 ; (dy + 1)
4614 : c8 __ __ INY
4615 : 91 79 __ STA (T16 + 0),y 
4617 : 18 __ __ CLC
4618 : a5 69 __ LDA T11 + 0 
461a : 69 02 __ ADC #$02
461c : 85 69 __ STA T11 + 0 
461e : 90 03 __ BCC $4623 ; (render_full_rotation.s38 + 0)
.s37:
4620 : e6 6a __ INC T11 + 1 
4622 : 18 __ __ CLC
.s38:
4623 : a5 65 __ LDA T10 + 0 
4625 : 69 02 __ ADC #$02
4627 : 85 65 __ STA T10 + 0 
4629 : 90 03 __ BCC $462e ; (render_full_rotation.s40 + 0)
.s39:
462b : e6 66 __ INC T10 + 1 
462d : 18 __ __ CLC
.s40:
462e : a5 63 __ LDA T9 + 0 
4630 : 69 02 __ ADC #$02
4632 : 85 63 __ STA T9 + 0 
4634 : 90 03 __ BCC $4639 ; (render_full_rotation.s42 + 0)
.s41:
4636 : e6 64 __ INC T9 + 1 
4638 : 18 __ __ CLC
.s42:
4639 : a5 7b __ LDA T17 + 0 
463b : 69 02 __ ADC #$02
463d : 85 7b __ STA T17 + 0 
463f : 90 03 __ BCC $4644 ; (render_full_rotation.s44 + 0)
.s43:
4641 : e6 7c __ INC T17 + 1 
4643 : 18 __ __ CLC
.s44:
4644 : a5 74 __ LDA T14 + 0 
4646 : 69 02 __ ADC #$02
4648 : 85 74 __ STA T14 + 0 
464a : 90 03 __ BCC $464f ; (render_full_rotation.s46 + 0)
.s45:
464c : e6 75 __ INC T14 + 1 
464e : 18 __ __ CLC
.s46:
464f : a5 79 __ LDA T16 + 0 
4651 : 69 02 __ ADC #$02
4653 : 85 79 __ STA T16 + 0 
4655 : 90 02 __ BCC $4659 ; (render_full_rotation.s48 + 0)
.s47:
4657 : e6 7a __ INC T16 + 1 
.s48:
4659 : a5 77 __ LDA T15 + 0 
465b : d0 02 __ BNE $465f ; (render_full_rotation.s35 + 0)
.s34:
465d : c6 78 __ DEC T15 + 1 
.s35:
465f : c6 77 __ DEC T15 + 0 
4661 : f0 03 __ BEQ $4666 ; (render_full_rotation.s36 + 0)
4663 : 4c c4 43 JMP $43c4 ; (render_full_rotation.l30 + 0)
.s36:
4666 : a5 78 __ LDA T15 + 1 
4668 : d0 f9 __ BNE $4663 ; (render_full_rotation.s35 + 4)
466a : 4c 05 3c JMP $3c05 ; (render_full_rotation.s3 + 0)
--------------------------------------------------------------------
sort_and_render_faces: ; sort_and_render_faces(i16)->void
; 600, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
466d : a2 0d __ LDX #$0d
466f : b5 53 __ LDA T4 + 0,x 
4671 : 9d d2 bf STA $bfd2,x ; (sort_and_render_faces@stack + 0)
4674 : ca __ __ DEX
4675 : 10 f8 __ BPL $466f ; (sort_and_render_faces.s1 + 2)
.s4:
4677 : ad fe 5a LDA $5afe ; (wireframeOn + 1)
467a : d0 09 __ BNE $4685 ; (sort_and_render_faces.s5 + 0)
.s50:
467c : ae fd 5a LDX $5afd ; (wireframeOn + 0)
467f : ca __ __ DEX
4680 : d0 03 __ BNE $4685 ; (sort_and_render_faces.s5 + 0)
4682 : 4c ff 49 JMP $49ff ; (sort_and_render_faces.s49 + 0)
.s5:
4685 : a9 ff __ LDA #$ff
4687 : a2 80 __ LDX #$80
.l7:
4689 : ca __ __ DEX
468a : 9d a2 6b STA $6ba2,x ; (bucket_head[0] + 0)
468d : 9d 22 6c STA $6c22,x ; (bucket_head[0] + 128)
4690 : 9d a2 6c STA $6ca2,x ; (bucket_head[0] + 256)
4693 : 9d 22 6d STA $6d22,x ; (bucket_head[0] + 384)
4696 : d0 f1 __ BNE $4689 ; (sort_and_render_faces.l7 + 0)
.s6:
4698 : ad fb 5a LDA $5afb ; (plane_data_count + 0)
469b : 85 4f __ STA T3 + 0 
469d : ad fc 5a LDA $5afc ; (plane_data_count + 1)
46a0 : 10 03 __ BPL $46a5 ; (sort_and_render_faces.s48 + 0)
46a2 : 4c 58 47 JMP $4758 ; (sort_and_render_faces.s8 + 0)
.s48:
46a5 : 85 50 __ STA T3 + 1 
46a7 : 05 4f __ ORA T3 + 0 
46a9 : f0 f7 __ BEQ $46a2 ; (sort_and_render_faces.s6 + 10)
.s18:
46ab : a9 00 __ LDA #$00
46ad : 85 53 __ STA T4 + 0 
46af : 85 54 __ STA T4 + 1 
46b1 : 85 55 __ STA T5 + 0 
46b3 : 85 56 __ STA T5 + 1 
.l19:
46b5 : a6 54 __ LDX T4 + 1 
46b7 : ca __ __ DEX
46b8 : d0 06 __ BNE $46c0 ; (sort_and_render_faces.s20 + 0)
.s47:
46ba : a5 53 __ LDA T4 + 0 
46bc : c9 90 __ CMP #$90
46be : f0 e2 __ BEQ $46a2 ; (sort_and_render_faces.s6 + 10)
.s20:
46c0 : a5 55 __ LDA T5 + 0 
46c2 : 85 51 __ STA T8 + 0 
46c4 : 0a __ __ ASL
46c5 : 85 43 __ STA T0 + 0 
46c7 : a5 56 __ LDA T5 + 1 
46c9 : 85 52 __ STA T8 + 1 
46cb : 2a __ __ ROL
46cc : 85 44 __ STA T0 + 1 
46ce : ad fe 36 LDA $36fe ; (plane_data + 0)
46d1 : 85 57 __ STA T6 + 0 
46d3 : 18 __ __ CLC
46d4 : 65 43 __ ADC T0 + 0 
46d6 : 85 59 __ STA T7 + 0 
46d8 : ad ff 36 LDA $36ff ; (plane_data + 1)
46db : 85 58 __ STA T6 + 1 
46dd : 65 44 __ ADC T0 + 1 
46df : 85 5a __ STA T7 + 1 
46e1 : a9 00 __ LDA #$00
46e3 : 85 5b __ STA T9 + 0 
46e5 : 85 5c __ STA T9 + 1 
46e7 : 85 43 __ STA T0 + 0 
46e9 : 85 44 __ STA T0 + 1 
46eb : 85 45 __ STA T0 + 2 
46ed : 85 46 __ STA T0 + 3 
46ef : a9 01 __ LDA #$01
46f1 : 85 5d __ STA T10 + 0 
46f3 : a9 80 __ LDA #$80
46f5 : 85 5e __ STA T10 + 1 
.l21:
46f7 : a5 55 __ LDA T5 + 0 
46f9 : 0a __ __ ASL
46fa : a8 __ __ TAY
46fb : a5 56 __ LDA T5 + 1 
46fd : 2a __ __ ROL
46fe : aa __ __ TAX
46ff : 98 __ __ TYA
4700 : 18 __ __ CLC
4701 : 65 57 __ ADC T6 + 0 
4703 : 85 47 __ STA T1 + 0 
4705 : 8a __ __ TXA
4706 : 65 58 __ ADC T6 + 1 
4708 : 85 48 __ STA T1 + 1 
470a : a0 00 __ LDY #$00
470c : b1 47 __ LDA (T1 + 0),y 
470e : 85 4b __ STA T2 + 0 
4710 : c8 __ __ INY
4711 : b1 47 __ LDA (T1 + 0),y 
4713 : 85 4c __ STA T2 + 1 
4715 : 05 4b __ ORA T2 + 0 
4717 : f0 03 __ BEQ $471c ; (sort_and_render_faces.s22 + 0)
4719 : 4c eb 48 JMP $48eb ; (sort_and_render_faces.s38 + 0)
.s22:
471c : a5 5c __ LDA T9 + 1 
471e : 30 1d __ BMI $473d ; (sort_and_render_faces.s23 + 0)
.s37:
4720 : d0 06 __ BNE $4728 ; (sort_and_render_faces.s26 + 0)
.s36:
4722 : a5 5b __ LDA T9 + 0 
4724 : c9 03 __ CMP #$03
4726 : 90 15 __ BCC $473d ; (sort_and_render_faces.s23 + 0)
.s26:
4728 : a5 46 __ LDA T0 + 3 
472a : 30 11 __ BMI $473d ; (sort_and_render_faces.s23 + 0)
.s32:
472c : f0 03 __ BEQ $4731 ; (sort_and_render_faces.s33 + 0)
472e : 4c 57 48 JMP $4857 ; (sort_and_render_faces.s27 + 0)
.s33:
4731 : a5 45 __ LDA T0 + 2 
4733 : d0 f9 __ BNE $472e ; (sort_and_render_faces.s32 + 2)
.s34:
4735 : a5 44 __ LDA T0 + 1 
4737 : d0 f5 __ BNE $472e ; (sort_and_render_faces.s32 + 2)
.s35:
4739 : a5 43 __ LDA T0 + 0 
473b : d0 f1 __ BNE $472e ; (sort_and_render_faces.s32 + 2)
.s23:
473d : 24 50 __ BIT T3 + 1 
473f : 30 17 __ BMI $4758 ; (sort_and_render_faces.s8 + 0)
.s25:
4741 : e6 55 __ INC T5 + 0 
4743 : d0 02 __ BNE $4747 ; (sort_and_render_faces.s65 + 0)
.s64:
4745 : e6 56 __ INC T5 + 1 
.s65:
4747 : a5 56 __ LDA T5 + 1 
4749 : c5 50 __ CMP T3 + 1 
474b : b0 03 __ BCS $4750 ; (sort_and_render_faces.s67 + 0)
474d : 4c b5 46 JMP $46b5 ; (sort_and_render_faces.l19 + 0)
.s67:
4750 : d0 06 __ BNE $4758 ; (sort_and_render_faces.s8 + 0)
.s24:
4752 : a5 55 __ LDA T5 + 0 
4754 : c5 4f __ CMP T3 + 0 
4756 : 90 f5 __ BCC $474d ; (sort_and_render_faces.s65 + 6)
.s8:
4758 : a9 ff __ LDA #$ff
475a : 85 53 __ STA T4 + 0 
475c : a9 00 __ LDA #$00
.l9:
475e : 85 54 __ STA T4 + 1 
4760 : a5 53 __ LDA T4 + 0 
4762 : 0a __ __ ASL
4763 : a2 00 __ LDX #$00
4765 : 90 02 __ BCC $4769 ; (sort_and_render_faces.s61 + 0)
.s60:
4767 : e8 __ __ INX
4768 : 18 __ __ CLC
.s61:
4769 : 69 a2 __ ADC #$a2
476b : 85 43 __ STA T0 + 0 
476d : 8a __ __ TXA
476e : 69 6b __ ADC #$6b
4770 : 85 44 __ STA T0 + 1 
4772 : a0 00 __ LDY #$00
4774 : b1 43 __ LDA (T0 + 0),y 
4776 : 85 1b __ STA ACCU + 0 ; (fs + 0)
4778 : c8 __ __ INY
4779 : b1 43 __ LDA (T0 + 0),y 
477b : aa __ __ TAX
477c : e0 ff __ CPX #$ff
477e : d0 1c __ BNE $479c ; (sort_and_render_faces.s11 + 0)
.s17:
4780 : e4 1b __ CPX ACCU + 0 ; (fs + 0)
4782 : d0 18 __ BNE $479c ; (sort_and_render_faces.s11 + 0)
.s10:
4784 : 18 __ __ CLC
4785 : a5 53 __ LDA T4 + 0 
4787 : 69 ff __ ADC #$ff
4789 : 85 53 __ STA T4 + 0 
478b : a5 54 __ LDA T4 + 1 
478d : 69 ff __ ADC #$ff
478f : 10 cd __ BPL $475e ; (sort_and_render_faces.l9 + 0)
.s3:
4791 : a2 0d __ LDX #$0d
4793 : bd d2 bf LDA $bfd2,x ; (sort_and_render_faces@stack + 0)
4796 : 95 53 __ STA T4 + 0,x 
4798 : ca __ __ DEX
4799 : 10 f8 __ BPL $4793 ; (sort_and_render_faces.s3 + 2)
479b : 60 __ __ RTS
.s11:
479c : ad fe 36 LDA $36fe ; (plane_data + 0)
479f : 85 55 __ STA T5 + 0 
47a1 : ad ff 36 LDA $36ff ; (plane_data + 1)
47a4 : 85 56 __ STA T5 + 1 
47a6 : ad ce 5b LDA $5bce ; (u_array + 0)
47a9 : 85 57 __ STA T6 + 0 
47ab : ad cf 5b LDA $5bcf ; (u_array + 1)
47ae : 85 58 __ STA T6 + 1 
.l12:
47b0 : a9 00 __ LDA #$00
47b2 : 85 47 __ STA T1 + 0 
47b4 : 85 48 __ STA T1 + 1 
47b6 : a5 1b __ LDA ACCU + 0 ; (fs + 0)
47b8 : 0a __ __ ASL
47b9 : 85 59 __ STA T7 + 0 
47bb : a8 __ __ TAY
47bc : 8a __ __ TXA
47bd : 2a __ __ ROL
47be : 85 5a __ STA T7 + 1 
47c0 : 18 __ __ CLC
47c1 : 69 6d __ ADC #$6d
47c3 : 85 44 __ STA T0 + 1 
47c5 : a9 a2 __ LDA #$a2
47c7 : 85 43 __ STA T0 + 0 
47c9 : b1 43 __ LDA (T0 + 0),y 
47cb : aa __ __ TAX
47cc : c8 __ __ INY
47cd : b1 43 __ LDA (T0 + 0),y 
47cf : 86 43 __ STX T0 + 0 
47d1 : 85 44 __ STA T0 + 1 
47d3 : 8a __ __ TXA
47d4 : 4c d9 47 JMP $47d9 ; (sort_and_render_faces.l13 + 0)
.s63:
47d7 : a5 43 __ LDA T0 + 0 
.l13:
47d9 : 18 __ __ CLC
47da : 65 47 __ ADC T1 + 0 
47dc : 85 4b __ STA T2 + 0 
47de : a5 44 __ LDA T0 + 1 
47e0 : 65 48 __ ADC T1 + 1 
47e2 : 06 4b __ ASL T2 + 0 
47e4 : 2a __ __ ROL
47e5 : 18 __ __ CLC
47e6 : 65 56 __ ADC T5 + 1 
47e8 : 85 4c __ STA T2 + 1 
47ea : a4 55 __ LDY T5 + 0 
47ec : b1 4b __ LDA (T2 + 0),y 
47ee : 85 1b __ STA ACCU + 0 ; (fs + 0)
47f0 : c8 __ __ INY
47f1 : b1 4b __ LDA (T2 + 0),y 
47f3 : aa __ __ TAX
47f4 : 05 1b __ ORA ACCU + 0 ; (fs + 0)
47f6 : f0 25 __ BEQ $481d ; (sort_and_render_faces.s14 + 0)
.s16:
47f8 : a5 47 __ LDA T1 + 0 
47fa : 0a __ __ ASL
47fb : 85 4f __ STA T3 + 0 
47fd : a5 48 __ LDA T1 + 1 
47ff : 2a __ __ ROL
4800 : 18 __ __ CLC
4801 : 65 58 __ ADC T6 + 1 
4803 : 85 50 __ STA T3 + 1 
4805 : 38 __ __ SEC
4806 : a5 1b __ LDA ACCU + 0 ; (fs + 0)
4808 : e9 01 __ SBC #$01
480a : a4 57 __ LDY T6 + 0 
480c : 91 4f __ STA (T3 + 0),y 
480e : 8a __ __ TXA
480f : e9 00 __ SBC #$00
4811 : c8 __ __ INY
4812 : 91 4f __ STA (T3 + 0),y 
4814 : e6 47 __ INC T1 + 0 
4816 : d0 bf __ BNE $47d7 ; (sort_and_render_faces.s63 + 0)
.s62:
4818 : e6 48 __ INC T1 + 1 
481a : 4c d7 47 JMP $47d7 ; (sort_and_render_faces.s63 + 0)
.s14:
481d : 86 1c __ STX ACCU + 1 ; (fs + 1)
481f : a5 57 __ LDA T6 + 0 
4821 : 85 17 __ STA P10 
4823 : a5 58 __ LDA T6 + 1 
4825 : 85 18 __ STA P11 
4827 : a5 47 __ LDA T1 + 0 
4829 : 8d ec bf STA $bfec ; (sstack + 0)
482c : a5 48 __ LDA T1 + 1 
482e : 8d ed bf STA $bfed ; (sstack + 1)
4831 : 20 0a 4d JSR $4d0a ; (draw_plane.s1 + 0)
4834 : a9 c2 __ LDA #$c2
4836 : 85 43 __ STA T0 + 0 
4838 : 18 __ __ CLC
4839 : a9 70 __ LDA #$70
483b : 65 5a __ ADC T7 + 1 
483d : 85 44 __ STA T0 + 1 
483f : a4 59 __ LDY T7 + 0 
4841 : b1 43 __ LDA (T0 + 0),y 
4843 : 85 1b __ STA ACCU + 0 ; (fs + 0)
4845 : c8 __ __ INY
4846 : b1 43 __ LDA (T0 + 0),y 
4848 : aa __ __ TAX
4849 : e0 ff __ CPX #$ff
484b : f0 03 __ BEQ $4850 ; (sort_and_render_faces.s15 + 0)
484d : 4c b0 47 JMP $47b0 ; (sort_and_render_faces.l12 + 0)
.s15:
4850 : e4 1b __ CPX ACCU + 0 ; (fs + 0)
4852 : d0 f9 __ BNE $484d ; (sort_and_render_faces.s14 + 48)
4854 : 4c 84 47 JMP $4784 ; (sort_and_render_faces.s10 + 0)
.s27:
4857 : a5 53 __ LDA T4 + 0 
4859 : 0a __ __ ASL
485a : 85 43 __ STA T0 + 0 
485c : a8 __ __ TAY
485d : a5 54 __ LDA T4 + 1 
485f : 2a __ __ ROL
4860 : 85 44 __ STA T0 + 1 
4862 : 18 __ __ CLC
4863 : 69 6d __ ADC #$6d
4865 : 85 48 __ STA T1 + 1 
4867 : a9 a2 __ LDA #$a2
4869 : 85 47 __ STA T1 + 0 
486b : a5 51 __ LDA T8 + 0 
486d : 91 47 __ STA (T1 + 0),y 
486f : a5 52 __ LDA T8 + 1 
4871 : c8 __ __ INY
4872 : 91 47 __ STA (T1 + 0),y 
4874 : ad ee bf LDA $bfee ; (sstack + 2)
4877 : 65 5d __ ADC T10 + 0 
4879 : 85 47 __ STA T1 + 0 
487b : ad ef bf LDA $bfef ; (sstack + 3)
487e : 65 5e __ ADC T10 + 1 
4880 : 18 __ __ CLC
4881 : 69 01 __ ADC #$01
4883 : 4a __ __ LSR
4884 : 66 47 __ ROR T1 + 0 
4886 : 4a __ __ LSR
4887 : 66 47 __ ROR T1 + 0 
4889 : 49 20 __ EOR #$20
488b : 38 __ __ SEC
488c : e9 20 __ SBC #$20
488e : 10 08 __ BPL $4898 ; (sort_and_render_faces.s28 + 0)
.s31:
4890 : a9 00 __ LDA #$00
4892 : 85 47 __ STA T1 + 0 
.s51:
4894 : 85 48 __ STA T1 + 1 
4896 : f0 0c __ BEQ $48a4 ; (sort_and_render_faces.s29 + 0)
.s28:
4898 : 85 48 __ STA T1 + 1 
489a : f0 08 __ BEQ $48a4 ; (sort_and_render_faces.s29 + 0)
.s30:
489c : a9 ff __ LDA #$ff
489e : 85 47 __ STA T1 + 0 
48a0 : a9 00 __ LDA #$00
48a2 : 85 48 __ STA T1 + 1 
.s29:
48a4 : 06 47 __ ASL T1 + 0 
48a6 : 26 48 __ ROL T1 + 1 
48a8 : 18 __ __ CLC
48a9 : a9 a2 __ LDA #$a2
48ab : 65 47 __ ADC T1 + 0 
48ad : 85 47 __ STA T1 + 0 
48af : a9 6b __ LDA #$6b
48b1 : 65 48 __ ADC T1 + 1 
48b3 : 85 48 __ STA T1 + 1 
48b5 : a0 00 __ LDY #$00
48b7 : b1 47 __ LDA (T1 + 0),y 
48b9 : aa __ __ TAX
48ba : c8 __ __ INY
48bb : b1 47 __ LDA (T1 + 0),y 
48bd : 85 4c __ STA T2 + 1 
48bf : a5 53 __ LDA T4 + 0 
48c1 : 88 __ __ DEY
48c2 : 91 47 __ STA (T1 + 0),y 
48c4 : a5 54 __ LDA T4 + 1 
48c6 : c8 __ __ INY
48c7 : 91 47 __ STA (T1 + 0),y 
48c9 : 18 __ __ CLC
48ca : a9 c2 __ LDA #$c2
48cc : 65 43 __ ADC T0 + 0 
48ce : 85 43 __ STA T0 + 0 
48d0 : a9 70 __ LDA #$70
48d2 : 65 44 __ ADC T0 + 1 
48d4 : 85 44 __ STA T0 + 1 
48d6 : 8a __ __ TXA
48d7 : 88 __ __ DEY
48d8 : 91 43 __ STA (T0 + 0),y 
48da : a5 4c __ LDA T2 + 1 
48dc : c8 __ __ INY
48dd : 91 43 __ STA (T0 + 0),y 
48df : e6 53 __ INC T4 + 0 
48e1 : f0 03 __ BEQ $48e6 ; (sort_and_render_faces.s66 + 0)
48e3 : 4c 3d 47 JMP $473d ; (sort_and_render_faces.s23 + 0)
.s66:
48e6 : e6 54 __ INC T4 + 1 
48e8 : 4c 3d 47 JMP $473d ; (sort_and_render_faces.s23 + 0)
.s38:
48eb : c8 __ __ INY
48ec : b1 47 __ LDA (T1 + 0),y 
48ee : aa __ __ TAX
48ef : c8 __ __ INY
48f0 : b1 47 __ LDA (T1 + 0),y 
48f2 : 86 47 __ STX T1 + 0 
48f4 : 85 48 __ STA T1 + 1 
48f6 : 05 47 __ ORA T1 + 0 
48f8 : d0 0b __ BNE $4905 ; (sort_and_render_faces.s39 + 0)
.s46:
48fa : a8 __ __ TAY
48fb : b1 59 __ LDA (T7 + 0),y 
48fd : 85 47 __ STA T1 + 0 
48ff : a0 01 __ LDY #$01
4901 : b1 59 __ LDA (T7 + 0),y 
4903 : 85 48 __ STA T1 + 1 
.s39:
4905 : 38 __ __ SEC
4906 : a5 47 __ LDA T1 + 0 
4908 : e9 01 __ SBC #$01
490a : 85 47 __ STA T1 + 0 
490c : b0 02 __ BCS $4910 ; (sort_and_render_faces.s53 + 0)
.s52:
490e : c6 48 __ DEC T1 + 1 
.s53:
4910 : 06 4b __ ASL T2 + 0 
4912 : 26 4c __ ROL T2 + 1 
4914 : 38 __ __ SEC
4915 : a5 4b __ LDA T2 + 0 
4917 : e9 02 __ SBC #$02
4919 : 85 4b __ STA T2 + 0 
491b : b0 02 __ BCS $491f ; (sort_and_render_faces.s55 + 0)
.s54:
491d : c6 4c __ DEC T2 + 1 
.s55:
491f : 18 __ __ CLC
4920 : 6d c8 5b ADC $5bc8 ; (z_rotated + 0)
4923 : 85 5f __ STA T11 + 0 
4925 : ad c9 5b LDA $5bc9 ; (z_rotated + 1)
4928 : 65 4c __ ADC T2 + 1 
492a : 85 60 __ STA T11 + 1 
492c : a0 00 __ LDY #$00
492e : b1 5f __ LDA (T11 + 0),y 
4930 : 85 1b __ STA ACCU + 0 ; (fs + 0)
4932 : c8 __ __ INY
4933 : b1 5f __ LDA (T11 + 0),y 
4935 : 85 60 __ STA T11 + 1 
4937 : a5 5e __ LDA T10 + 1 
4939 : c5 60 __ CMP T11 + 1 
493b : d0 08 __ BNE $4945 ; (sort_and_render_faces.s45 + 0)
.s42:
493d : a5 5d __ LDA T10 + 0 
493f : c5 1b __ CMP ACCU + 0 ; (fs + 0)
.s43:
4941 : 90 08 __ BCC $494b ; (sort_and_render_faces.s41 + 0)
4943 : b0 0e __ BCS $4953 ; (sort_and_render_faces.s40 + 0)
.s45:
4945 : 45 60 __ EOR T11 + 1 
4947 : 10 f8 __ BPL $4941 ; (sort_and_render_faces.s43 + 0)
.s44:
4949 : 90 08 __ BCC $4953 ; (sort_and_render_faces.s40 + 0)
.s41:
494b : a5 1b __ LDA ACCU + 0 ; (fs + 0)
494d : 85 5d __ STA T10 + 0 
494f : a5 60 __ LDA T11 + 1 
4951 : 85 5e __ STA T10 + 1 
.s40:
4953 : e6 55 __ INC T5 + 0 
4955 : d0 02 __ BNE $4959 ; (sort_and_render_faces.s57 + 0)
.s56:
4957 : e6 56 __ INC T5 + 1 
.s57:
4959 : e6 5b __ INC T9 + 0 
495b : d0 02 __ BNE $495f ; (sort_and_render_faces.s59 + 0)
.s58:
495d : e6 5c __ INC T9 + 1 
.s59:
495f : ad ca 5b LDA $5bca ; (vx_pct + 0)
4962 : 18 __ __ CLC
4963 : 65 4b __ ADC T2 + 0 
4965 : 85 1b __ STA ACCU + 0 ; (fs + 0)
4967 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
496a : 65 4c __ ADC T2 + 1 
496c : 85 1c __ STA ACCU + 1 ; (fs + 1)
496e : a0 00 __ LDY #$00
4970 : b1 1b __ LDA (ACCU + 0),y ; (fs + 0)
4972 : 85 1d __ STA ACCU + 2 
4974 : c8 __ __ INY
4975 : b1 1b __ LDA (ACCU + 0),y ; (fs + 0)
4977 : aa __ __ TAX
4978 : a5 47 __ LDA T1 + 0 
497a : 0a __ __ ASL
497b : 85 1b __ STA ACCU + 0 ; (fs + 0)
497d : a5 48 __ LDA T1 + 1 
497f : 2a __ __ ROL
4980 : 85 1c __ STA ACCU + 1 ; (fs + 1)
4982 : ad ca 5b LDA $5bca ; (vx_pct + 0)
4985 : 18 __ __ CLC
4986 : 65 1b __ ADC ACCU + 0 ; (fs + 0)
4988 : 85 5f __ STA T11 + 0 
498a : ad cb 5b LDA $5bcb ; (vx_pct + 1)
498d : 65 1c __ ADC ACCU + 1 ; (fs + 1)
498f : 85 60 __ STA T11 + 1 
4991 : 88 __ __ DEY
4992 : b1 5f __ LDA (T11 + 0),y 
4994 : 18 __ __ CLC
4995 : 65 1d __ ADC ACCU + 2 
4997 : 85 03 __ STA WORK + 0 
4999 : 8a __ __ TXA
499a : c8 __ __ INY
499b : 71 5f __ ADC (T11 + 0),y 
499d : 85 04 __ STA WORK + 1 
499f : 29 80 __ AND #$80
49a1 : 10 02 __ BPL $49a5 ; (sort_and_render_faces.s59 + 70)
49a3 : a9 ff __ LDA #$ff
49a5 : 85 05 __ STA WORK + 2 
49a7 : 85 06 __ STA WORK + 3 
49a9 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
49ac : 18 __ __ CLC
49ad : 65 4b __ ADC T2 + 0 
49af : 85 4b __ STA T2 + 0 
49b1 : ad cd 5b LDA $5bcd ; (vy_pct + 1)
49b4 : 65 4c __ ADC T2 + 1 
49b6 : 85 4c __ STA T2 + 1 
49b8 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
49bb : 18 __ __ CLC
49bc : 65 1b __ ADC ACCU + 0 ; (fs + 0)
49be : 85 5f __ STA T11 + 0 
49c0 : ad cd 5b LDA $5bcd ; (vy_pct + 1)
49c3 : 65 1c __ ADC ACCU + 1 ; (fs + 1)
49c5 : 85 60 __ STA T11 + 1 
49c7 : 88 __ __ DEY
49c8 : b1 4b __ LDA (T2 + 0),y 
49ca : 38 __ __ SEC
49cb : f1 5f __ SBC (T11 + 0),y 
49cd : 85 1b __ STA ACCU + 0 ; (fs + 0)
49cf : c8 __ __ INY
49d0 : b1 4b __ LDA (T2 + 0),y 
49d2 : f1 5f __ SBC (T11 + 0),y 
49d4 : 85 1c __ STA ACCU + 1 ; (fs + 1)
49d6 : 29 80 __ AND #$80
49d8 : 10 02 __ BPL $49dc ; (sort_and_render_faces.s59 + 125)
49da : a9 ff __ LDA #$ff
49dc : 85 1d __ STA ACCU + 2 
49de : 85 1e __ STA ACCU + 3 
49e0 : 20 8c 58 JSR $588c ; (mul32 + 0)
49e3 : 18 __ __ CLC
49e4 : a5 07 __ LDA WORK + 4 
49e6 : 65 43 __ ADC T0 + 0 
49e8 : 85 43 __ STA T0 + 0 
49ea : a5 08 __ LDA WORK + 5 
49ec : 65 44 __ ADC T0 + 1 
49ee : 85 44 __ STA T0 + 1 
49f0 : a5 09 __ LDA WORK + 6 
49f2 : 65 45 __ ADC T0 + 2 
49f4 : 85 45 __ STA T0 + 2 
49f6 : a5 0a __ LDA WORK + 7 
49f8 : 65 46 __ ADC T0 + 3 
49fa : 85 46 __ STA T0 + 3 
49fc : 4c f7 46 JMP $46f7 ; (sort_and_render_faces.l21 + 0)
.s49:
49ff : 20 05 4a JSR $4a05 ; (render_wireframe.s1 + 0)
4a02 : 4c 91 47 JMP $4791 ; (sort_and_render_faces.s3 + 0)
--------------------------------------------------------------------
render_wireframe: ; render_wireframe()->void
; 493, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
4a05 : a2 05 __ LDX #$05
4a07 : b5 53 __ LDA T5 + 0,x 
4a09 : 9d e6 bf STA $bfe6,x ; (render_wireframe@stack + 0)
4a0c : ca __ __ DEX
4a0d : 10 f8 __ BPL $4a07 ; (render_wireframe.s1 + 2)
.s4:
4a0f : ad fb 5a LDA $5afb ; (plane_data_count + 0)
4a12 : 85 50 __ STA T4 + 0 
4a14 : ad fc 5a LDA $5afc ; (plane_data_count + 1)
4a17 : 30 6d __ BMI $4a86 ; (render_wireframe.s3 + 0)
.s15:
4a19 : 85 51 __ STA T4 + 1 
4a1b : 05 50 __ ORA T4 + 0 
4a1d : f0 67 __ BEQ $4a86 ; (render_wireframe.s3 + 0)
.s5:
4a1f : a9 00 __ LDA #$00
4a21 : 85 53 __ STA T5 + 0 
4a23 : 85 54 __ STA T5 + 1 
4a25 : ad fe 36 LDA $36fe ; (plane_data + 0)
4a28 : 85 55 __ STA T6 + 0 
4a2a : ad ff 36 LDA $36ff ; (plane_data + 1)
4a2d : 85 56 __ STA T6 + 1 
.l6:
4a2f : a5 53 __ LDA T5 + 0 
.l22:
4a31 : 0a __ __ ASL
4a32 : 85 43 __ STA T0 + 0 
4a34 : a5 54 __ LDA T5 + 1 
4a36 : 2a __ __ ROL
4a37 : 18 __ __ CLC
4a38 : 65 56 __ ADC T6 + 1 
4a3a : 85 44 __ STA T0 + 1 
4a3c : a4 55 __ LDY T6 + 0 
4a3e : b1 43 __ LDA (T0 + 0),y 
4a40 : 38 __ __ SEC
4a41 : e9 01 __ SBC #$01
4a43 : 85 57 __ STA T7 + 0 
4a45 : c8 __ __ INY
4a46 : b1 43 __ LDA (T0 + 0),y 
4a48 : e9 00 __ SBC #$00
4a4a : 85 58 __ STA T7 + 1 
.l7:
4a4c : a5 53 __ LDA T5 + 0 
4a4e : 0a __ __ ASL
4a4f : a8 __ __ TAY
4a50 : a5 54 __ LDA T5 + 1 
4a52 : 2a __ __ ROL
4a53 : aa __ __ TAX
4a54 : 98 __ __ TYA
4a55 : 18 __ __ CLC
4a56 : 65 55 __ ADC T6 + 0 
4a58 : 85 43 __ STA T0 + 0 
4a5a : 8a __ __ TXA
4a5b : 65 56 __ ADC T6 + 1 
4a5d : 85 44 __ STA T0 + 1 
4a5f : a0 00 __ LDY #$00
4a61 : b1 43 __ LDA (T0 + 0),y 
4a63 : 85 45 __ STA T1 + 0 
4a65 : c8 __ __ INY
4a66 : b1 43 __ LDA (T0 + 0),y 
4a68 : 85 46 __ STA T1 + 1 
4a6a : 05 45 __ ORA T1 + 0 
4a6c : d0 23 __ BNE $4a91 ; (render_wireframe.s11 + 0)
.s8:
4a6e : 24 51 __ BIT T4 + 1 
4a70 : 30 14 __ BMI $4a86 ; (render_wireframe.s3 + 0)
.s10:
4a72 : e6 53 __ INC T5 + 0 
4a74 : d0 02 __ BNE $4a78 ; (render_wireframe.s20 + 0)
.s19:
4a76 : e6 54 __ INC T5 + 1 
.s20:
4a78 : a5 54 __ LDA T5 + 1 
4a7a : c5 51 __ CMP T4 + 1 
4a7c : 90 b1 __ BCC $4a2f ; (render_wireframe.l6 + 0)
.s21:
4a7e : d0 06 __ BNE $4a86 ; (render_wireframe.s3 + 0)
.s9:
4a80 : a5 53 __ LDA T5 + 0 
4a82 : c5 50 __ CMP T4 + 0 
4a84 : 90 ab __ BCC $4a31 ; (render_wireframe.l22 + 0)
.s3:
4a86 : a2 05 __ LDX #$05
4a88 : bd e6 bf LDA $bfe6,x ; (render_wireframe@stack + 0)
4a8b : 95 53 __ STA T5 + 0,x 
4a8d : ca __ __ DEX
4a8e : 10 f8 __ BPL $4a88 ; (render_wireframe.s3 + 2)
4a90 : 60 __ __ RTS
.s11:
4a91 : 06 45 __ ASL T1 + 0 
4a93 : 26 46 __ ROL T1 + 1 
4a95 : 38 __ __ SEC
4a96 : a5 45 __ LDA T1 + 0 
4a98 : e9 02 __ SBC #$02
4a9a : 85 45 __ STA T1 + 0 
4a9c : b0 02 __ BCS $4aa0 ; (render_wireframe.s17 + 0)
.s16:
4a9e : c6 46 __ DEC T1 + 1 
.s17:
4aa0 : 18 __ __ CLC
4aa1 : 6d ca 5b ADC $5bca ; (vx_pct + 0)
4aa4 : 85 49 __ STA T3 + 0 
4aa6 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
4aa9 : 65 46 __ ADC T1 + 1 
4aab : 85 4a __ STA T3 + 1 
4aad : a0 00 __ LDY #$00
4aaf : b1 49 __ LDA (T3 + 0),y 
4ab1 : 85 0f __ STA P2 
4ab3 : c8 __ __ INY
4ab4 : b1 49 __ LDA (T3 + 0),y 
4ab6 : 85 10 __ STA P3 
4ab8 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
4abb : 18 __ __ CLC
4abc : 65 45 __ ADC T1 + 0 
4abe : 85 45 __ STA T1 + 0 
4ac0 : ad cd 5b LDA $5bcd ; (vy_pct + 1)
4ac3 : 65 46 __ ADC T1 + 1 
4ac5 : 85 46 __ STA T1 + 1 
4ac7 : 88 __ __ DEY
4ac8 : b1 45 __ LDA (T1 + 0),y 
4aca : 85 11 __ STA P4 
4acc : c8 __ __ INY
4acd : b1 45 __ LDA (T1 + 0),y 
4acf : 85 12 __ STA P5 
4ad1 : c8 __ __ INY
4ad2 : b1 43 __ LDA (T0 + 0),y 
4ad4 : 85 1b __ STA ACCU + 0 
4ad6 : c8 __ __ INY
4ad7 : b1 43 __ LDA (T0 + 0),y 
4ad9 : aa __ __ TAX
4ada : 05 1b __ ORA ACCU + 0 
4adc : f0 0d __ BEQ $4aeb ; (render_wireframe.s14 + 0)
.s12:
4ade : 38 __ __ SEC
4adf : a5 1b __ LDA ACCU + 0 
4ae1 : e9 01 __ SBC #$01
4ae3 : 85 43 __ STA T0 + 0 
4ae5 : 8a __ __ TXA
4ae6 : e9 00 __ SBC #$00
4ae8 : 4c f1 4a JMP $4af1 ; (render_wireframe.s13 + 0)
.s14:
4aeb : a5 57 __ LDA T7 + 0 
4aed : 85 43 __ STA T0 + 0 
4aef : a5 58 __ LDA T7 + 1 
.s13:
4af1 : 06 43 __ ASL T0 + 0 
4af3 : 2a __ __ ROL
4af4 : 85 44 __ STA T0 + 1 
4af6 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
4af9 : 18 __ __ CLC
4afa : 65 43 __ ADC T0 + 0 
4afc : 85 49 __ STA T3 + 0 
4afe : ad cd 5b LDA $5bcd ; (vy_pct + 1)
4b01 : 65 44 __ ADC T0 + 1 
4b03 : 85 4a __ STA T3 + 1 
4b05 : a0 00 __ LDY #$00
4b07 : b1 49 __ LDA (T3 + 0),y 
4b09 : 85 15 __ STA P8 
4b0b : c8 __ __ INY
4b0c : b1 49 __ LDA (T3 + 0),y 
4b0e : 85 16 __ STA P9 
4b10 : ad ca 5b LDA $5bca ; (vx_pct + 0)
4b13 : 18 __ __ CLC
4b14 : 65 43 __ ADC T0 + 0 
4b16 : 85 47 __ STA T2 + 0 
4b18 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
4b1b : 65 44 __ ADC T0 + 1 
4b1d : 85 48 __ STA T2 + 1 
4b1f : 88 __ __ DEY
4b20 : b1 47 __ LDA (T2 + 0),y 
4b22 : 85 13 __ STA P6 
4b24 : c8 __ __ INY
4b25 : b1 47 __ LDA (T2 + 0),y 
4b27 : 85 14 __ STA P7 
4b29 : 20 38 4b JSR $4b38 ; (drawline.s4 + 0)
4b2c : e6 53 __ INC T5 + 0 
4b2e : f0 03 __ BEQ $4b33 ; (render_wireframe.s18 + 0)
4b30 : 4c 4c 4a JMP $4a4c ; (render_wireframe.l7 + 0)
.s18:
4b33 : e6 54 __ INC T5 + 1 
4b35 : 4c 4c 4a JMP $4a4c ; (render_wireframe.l7 + 0)
--------------------------------------------------------------------
drawline: ; drawline(i16,i16,i16,i16)->void
; 280, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
4b38 : a5 10 __ LDA P3 ; (x0 + 1)
4b3a : c5 14 __ CMP P7 ; (x1 + 1)
4b3c : d0 08 __ BNE $4b46 ; (drawline.s53 + 0)
.s50:
4b3e : a5 0f __ LDA P2 ; (x0 + 0)
4b40 : c5 13 __ CMP P6 ; (x1 + 0)
.s51:
4b42 : 90 08 __ BCC $4b4c ; (drawline.s49 + 0)
4b44 : b0 0e __ BCS $4b54 ; (drawline.s5 + 0)
.s53:
4b46 : 45 14 __ EOR P7 ; (x1 + 1)
4b48 : 10 f8 __ BPL $4b42 ; (drawline.s51 + 0)
.s52:
4b4a : 90 08 __ BCC $4b54 ; (drawline.s5 + 0)
.s49:
4b4c : a9 01 __ LDA #$01
4b4e : 85 44 __ STA T3 + 0 
4b50 : a9 00 __ LDA #$00
4b52 : f0 04 __ BEQ $4b58 ; (drawline.s6 + 0)
.s5:
4b54 : a9 ff __ LDA #$ff
4b56 : 85 44 __ STA T3 + 0 
.s6:
4b58 : 85 45 __ STA T3 + 1 
4b5a : a5 12 __ LDA P5 ; (y0 + 1)
4b5c : c5 16 __ CMP P9 ; (y1 + 1)
4b5e : d0 08 __ BNE $4b68 ; (drawline.s48 + 0)
.s45:
4b60 : a5 11 __ LDA P4 ; (y0 + 0)
4b62 : c5 15 __ CMP P8 ; (y1 + 0)
.s46:
4b64 : 90 08 __ BCC $4b6e ; (drawline.s44 + 0)
4b66 : b0 0e __ BCS $4b76 ; (drawline.s7 + 0)
.s48:
4b68 : 45 16 __ EOR P9 ; (y1 + 1)
4b6a : 10 f8 __ BPL $4b64 ; (drawline.s46 + 0)
.s47:
4b6c : 90 08 __ BCC $4b76 ; (drawline.s7 + 0)
.s44:
4b6e : a9 01 __ LDA #$01
4b70 : 85 46 __ STA T5 + 0 
4b72 : a9 00 __ LDA #$00
4b74 : f0 04 __ BEQ $4b7a ; (drawline.s8 + 0)
.s7:
4b76 : a9 ff __ LDA #$ff
4b78 : 85 46 __ STA T5 + 0 
.s8:
4b7a : 85 47 __ STA T5 + 1 
4b7c : a5 12 __ LDA P5 ; (y0 + 1)
4b7e : c5 16 __ CMP P9 ; (y1 + 1)
4b80 : d0 08 __ BNE $4b8a ; (drawline.s43 + 0)
.s40:
4b82 : a5 11 __ LDA P4 ; (y0 + 0)
4b84 : c5 15 __ CMP P8 ; (y1 + 0)
.s41:
4b86 : b0 08 __ BCS $4b90 ; (drawline.s9 + 0)
4b88 : 90 14 __ BCC $4b9e ; (drawline.s39 + 0)
.s43:
4b8a : 45 16 __ EOR P9 ; (y1 + 1)
4b8c : 10 f8 __ BPL $4b86 ; (drawline.s41 + 0)
.s42:
4b8e : b0 0e __ BCS $4b9e ; (drawline.s39 + 0)
.s9:
4b90 : 38 __ __ SEC
4b91 : a5 11 __ LDA P4 ; (y0 + 0)
4b93 : e5 15 __ SBC P8 ; (y1 + 0)
4b95 : 85 48 __ STA T6 + 0 
4b97 : a5 12 __ LDA P5 ; (y0 + 1)
4b99 : e5 16 __ SBC P9 ; (y1 + 1)
4b9b : 4c a9 4b JMP $4ba9 ; (drawline.s10 + 0)
.s39:
4b9e : 38 __ __ SEC
4b9f : a5 15 __ LDA P8 ; (y1 + 0)
4ba1 : e5 11 __ SBC P4 ; (y0 + 0)
4ba3 : 85 48 __ STA T6 + 0 
4ba5 : a5 16 __ LDA P9 ; (y1 + 1)
4ba7 : e5 12 __ SBC P5 ; (y0 + 1)
.s10:
4ba9 : 85 49 __ STA T6 + 1 
4bab : a5 10 __ LDA P3 ; (x0 + 1)
4bad : c5 14 __ CMP P7 ; (x1 + 1)
4baf : d0 08 __ BNE $4bb9 ; (drawline.s38 + 0)
.s35:
4bb1 : a5 0f __ LDA P2 ; (x0 + 0)
4bb3 : c5 13 __ CMP P6 ; (x1 + 0)
.s36:
4bb5 : b0 08 __ BCS $4bbf ; (drawline.s11 + 0)
4bb7 : 90 14 __ BCC $4bcd ; (drawline.s34 + 0)
.s38:
4bb9 : 45 14 __ EOR P7 ; (x1 + 1)
4bbb : 10 f8 __ BPL $4bb5 ; (drawline.s36 + 0)
.s37:
4bbd : b0 0e __ BCS $4bcd ; (drawline.s34 + 0)
.s11:
4bbf : 38 __ __ SEC
4bc0 : a5 0f __ LDA P2 ; (x0 + 0)
4bc2 : e5 13 __ SBC P6 ; (x1 + 0)
4bc4 : 85 4a __ STA T7 + 0 
4bc6 : a5 10 __ LDA P3 ; (x0 + 1)
4bc8 : e5 14 __ SBC P7 ; (x1 + 1)
4bca : 4c d8 4b JMP $4bd8 ; (drawline.s12 + 0)
.s34:
4bcd : 38 __ __ SEC
4bce : a5 13 __ LDA P6 ; (x1 + 0)
4bd0 : e5 0f __ SBC P2 ; (x0 + 0)
4bd2 : 85 4a __ STA T7 + 0 
4bd4 : a5 14 __ LDA P7 ; (x1 + 1)
4bd6 : e5 10 __ SBC P3 ; (x0 + 1)
.s12:
4bd8 : 85 4b __ STA T7 + 1 
4bda : 38 __ __ SEC
4bdb : a9 00 __ LDA #$00
4bdd : e5 48 __ SBC T6 + 0 
4bdf : 85 4c __ STA T8 + 0 
4be1 : a9 00 __ LDA #$00
4be3 : e5 49 __ SBC T6 + 1 
4be5 : 85 4d __ STA T8 + 1 
4be7 : 38 __ __ SEC
4be8 : a5 4a __ LDA T7 + 0 
4bea : e5 48 __ SBC T6 + 0 
4bec : 85 4e __ STA T9 + 0 
4bee : a5 4b __ LDA T7 + 1 
4bf0 : e5 49 __ SBC T6 + 1 
4bf2 : 4c 0d 4c JMP $4c0d ; (drawline.l54 + 0)
.s17:
4bf5 : 18 __ __ CLC
4bf6 : a5 11 __ LDA P4 ; (y0 + 0)
4bf8 : 65 46 __ ADC T5 + 0 
4bfa : 85 11 __ STA P4 ; (y0 + 0)
4bfc : a5 12 __ LDA P5 ; (y0 + 1)
4bfe : 65 47 __ ADC T5 + 1 
4c00 : 85 12 __ STA P5 ; (y0 + 1)
4c02 : 18 __ __ CLC
4c03 : a5 4e __ LDA T9 + 0 
4c05 : 65 4a __ ADC T7 + 0 
4c07 : 85 4e __ STA T9 + 0 
4c09 : a5 4f __ LDA T9 + 1 
4c0b : 65 4b __ ADC T7 + 1 
.l54:
4c0d : 85 4f __ STA T9 + 1 
4c0f : a5 10 __ LDA P3 ; (x0 + 1)
4c11 : d0 1b __ BNE $4c2e ; (drawline.l55 + 0)
.l33:
4c13 : a5 0f __ LDA P2 ; (x0 + 0)
4c15 : c9 b0 __ CMP #$b0
4c17 : b0 13 __ BCS $4c2c ; (drawline.s14 + 0)
.s30:
4c19 : a5 12 __ LDA P5 ; (y0 + 1)
4c1b : d0 0f __ BNE $4c2c ; (drawline.s14 + 0)
.s32:
4c1d : a5 11 __ LDA P4 ; (y0 + 0)
4c1f : c9 b8 __ CMP #$b8
4c21 : b0 09 __ BCS $4c2c ; (drawline.s14 + 0)
.s31:
4c23 : 85 0e __ STA P1 
4c25 : a5 0f __ LDA P2 ; (x0 + 0)
4c27 : 85 0d __ STA P0 
4c29 : 20 9f 4c JSR $4c9f ; (hires_plot.s4 + 0)
.s14:
4c2c : a5 10 __ LDA P3 ; (x0 + 1)
.l55:
4c2e : c5 14 __ CMP P7 ; (x1 + 1)
4c30 : d0 12 __ BNE $4c44 ; (drawline.s15 + 0)
.s29:
4c32 : a5 0f __ LDA P2 ; (x0 + 0)
4c34 : c5 13 __ CMP P6 ; (x1 + 0)
4c36 : d0 0c __ BNE $4c44 ; (drawline.s15 + 0)
.s27:
4c38 : a5 12 __ LDA P5 ; (y0 + 1)
4c3a : c5 16 __ CMP P9 ; (y1 + 1)
4c3c : d0 06 __ BNE $4c44 ; (drawline.s15 + 0)
.s28:
4c3e : a5 11 __ LDA P4 ; (y0 + 0)
4c40 : c5 15 __ CMP P8 ; (y1 + 0)
4c42 : f0 5a __ BEQ $4c9e ; (drawline.s3 + 0)
.s15:
4c44 : a5 4e __ LDA T9 + 0 
4c46 : 0a __ __ ASL
4c47 : 85 1b __ STA ACCU + 0 
4c49 : a5 4f __ LDA T9 + 1 
4c4b : 2a __ __ ROL
4c4c : 85 1c __ STA ACCU + 1 
4c4e : a5 4d __ LDA T8 + 1 
4c50 : c5 1c __ CMP ACCU + 1 
4c52 : d0 08 __ BNE $4c5c ; (drawline.s26 + 0)
.s23:
4c54 : a5 4c __ LDA T8 + 0 
4c56 : c5 1b __ CMP ACCU + 0 
.s24:
4c58 : 90 08 __ BCC $4c62 ; (drawline.s22 + 0)
4c5a : b0 20 __ BCS $4c7c ; (drawline.s16 + 0)
.s26:
4c5c : 45 1c __ EOR ACCU + 1 
4c5e : 10 f8 __ BPL $4c58 ; (drawline.s24 + 0)
.s25:
4c60 : 90 1a __ BCC $4c7c ; (drawline.s16 + 0)
.s22:
4c62 : 18 __ __ CLC
4c63 : a5 0f __ LDA P2 ; (x0 + 0)
4c65 : 65 44 __ ADC T3 + 0 
4c67 : 85 0f __ STA P2 ; (x0 + 0)
4c69 : a5 10 __ LDA P3 ; (x0 + 1)
4c6b : 65 45 __ ADC T3 + 1 
4c6d : 85 10 __ STA P3 ; (x0 + 1)
4c6f : 38 __ __ SEC
4c70 : a5 4e __ LDA T9 + 0 
4c72 : e5 48 __ SBC T6 + 0 
4c74 : 85 4e __ STA T9 + 0 
4c76 : a5 4f __ LDA T9 + 1 
4c78 : e5 49 __ SBC T6 + 1 
4c7a : 85 4f __ STA T9 + 1 
.s16:
4c7c : a5 1c __ LDA ACCU + 1 
4c7e : c5 4b __ CMP T7 + 1 
4c80 : d0 07 __ BNE $4c89 ; (drawline.s21 + 0)
.s18:
4c82 : a5 1b __ LDA ACCU + 0 
4c84 : c5 4a __ CMP T7 + 0 
4c86 : 4c 8d 4c JMP $4c8d ; (drawline.s19 + 0)
.s21:
4c89 : 45 4b __ EOR T7 + 1 
4c8b : 30 0c __ BMI $4c99 ; (drawline.s20 + 0)
.s19:
4c8d : b0 03 __ BCS $4c92 ; (drawline.s13 + 0)
4c8f : 4c f5 4b JMP $4bf5 ; (drawline.s17 + 0)
.s13:
4c92 : a5 10 __ LDA P3 ; (x0 + 1)
4c94 : d0 98 __ BNE $4c2e ; (drawline.l55 + 0)
4c96 : 4c 13 4c JMP $4c13 ; (drawline.l33 + 0)
.s20:
4c99 : 90 f7 __ BCC $4c92 ; (drawline.s13 + 0)
4c9b : 4c f5 4b JMP $4bf5 ; (drawline.s17 + 0)
.s3:
4c9e : 60 __ __ RTS
--------------------------------------------------------------------
hires_plot: ; hires_plot(u8,u8)->void
; 242, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
4c9f : a5 0d __ LDA P0 ; (x + 0)
4ca1 : c9 b0 __ CMP #$b0
4ca3 : b0 64 __ BCS $4d09 ; (hires_plot.s3 + 0)
.s5:
4ca5 : a5 0e __ LDA P1 ; (y + 0)
4ca7 : c9 b8 __ CMP #$b8
4ca9 : b0 5e __ BCS $4d09 ; (hires_plot.s3 + 0)
.s6:
4cab : 29 07 __ AND #$07
4cad : 85 43 __ STA T1 + 0 
4caf : a5 0e __ LDA P1 ; (y + 0)
4cb1 : 29 f8 __ AND #$f8
4cb3 : 4a __ __ LSR
4cb4 : 4a __ __ LSR
4cb5 : 85 1b __ STA ACCU + 0 
4cb7 : a9 00 __ LDA #$00
4cb9 : 85 1c __ STA ACCU + 1 
4cbb : a9 0b __ LDA #$0b
4cbd : 20 41 53 JSR $5341 ; (mul16by8 + 0)
4cc0 : a5 0d __ LDA P0 ; (x + 0)
4cc2 : 4a __ __ LSR
4cc3 : 4a __ __ LSR
4cc4 : 4a __ __ LSR
4cc5 : 18 __ __ CLC
4cc6 : 65 1b __ ADC ACCU + 0 
4cc8 : 85 1b __ STA ACCU + 0 
4cca : a5 1c __ LDA ACCU + 1 
4ccc : 69 00 __ ADC #$00
4cce : 06 1b __ ASL ACCU + 0 
4cd0 : 2a __ __ ROL
4cd1 : 06 1b __ ASL ACCU + 0 
4cd3 : 2a __ __ ROL
4cd4 : 06 1b __ ASL ACCU + 0 
4cd6 : 2a __ __ ROL
4cd7 : aa __ __ TAX
4cd8 : 18 __ __ CLC
4cd9 : a9 d2 __ LDA #$d2
4cdb : 65 1b __ ADC ACCU + 0 
4cdd : 85 1b __ STA ACCU + 0 
4cdf : 8a __ __ TXA
4ce0 : 69 5b __ ADC #$5b
4ce2 : 85 1c __ STA ACCU + 1 
4ce4 : a5 0d __ LDA P0 ; (x + 0)
4ce6 : 29 07 __ AND #$07
4ce8 : aa __ __ TAX
4ce9 : ad 65 5b LDA $5b65 ; (drawing_mode + 1)
4cec : d0 06 __ BNE $4cf4 ; (hires_plot.s7 + 0)
.s10:
4cee : ac 64 5b LDY $5b64 ; (drawing_mode + 0)
4cf1 : 88 __ __ DEY
4cf2 : f0 0c __ BEQ $4d00 ; (hires_plot.s9 + 0)
.s7:
4cf4 : bd 8a 5b LDA $5b8a,x ; (bitshift[0] + 32)
4cf7 : 49 ff __ EOR #$ff
4cf9 : a4 43 __ LDY T1 + 0 
4cfb : 31 1b __ AND (ACCU + 0),y 
4cfd : 91 1b __ STA (ACCU + 0),y 
4cff : 60 __ __ RTS
.s9:
4d00 : bd 8a 5b LDA $5b8a,x ; (bitshift[0] + 32)
4d03 : a4 43 __ LDY T1 + 0 
4d05 : 11 1b __ ORA (ACCU + 0),y 
.s8:
4d07 : 91 1b __ STA (ACCU + 0),y 
.s3:
4d09 : 60 __ __ RTS
--------------------------------------------------------------------
draw_plane: ; draw_plane(i16*,i16)->void
; 532, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s1:
4d0a : a2 06 __ LDX #$06
4d0c : b5 53 __ LDA T4 + 0,x 
4d0e : 9d e4 bf STA $bfe4,x ; (draw_plane@stack + 0)
4d11 : ca __ __ DEX
4d12 : 10 f8 __ BPL $4d0c ; (draw_plane.s1 + 2)
.s4:
4d14 : ad 67 5b LDA $5b67 ; (PaintersOn + 1)
4d17 : d0 09 __ BNE $4d22 ; (draw_plane.s5 + 0)
.s55:
4d19 : ae 66 5b LDX $5b66 ; (PaintersOn + 0)
4d1c : ca __ __ DEX
4d1d : d0 03 __ BNE $4d22 ; (draw_plane.s5 + 0)
4d1f : 4c 13 4e JMP $4e13 ; (draw_plane.s10 + 0)
.s5:
4d22 : ad ec bf LDA $bfec ; (sstack + 0)
4d25 : 85 50 __ STA T3 + 0 
4d27 : ad ed bf LDA $bfed ; (sstack + 1)
4d2a : 30 06 __ BMI $4d32 ; (draw_plane.s3 + 0)
.s9:
4d2c : 85 51 __ STA T3 + 1 
4d2e : 05 50 __ ORA T3 + 0 
4d30 : d0 0b __ BNE $4d3d ; (draw_plane.s6 + 0)
.s3:
4d32 : a2 06 __ LDX #$06
4d34 : bd e4 bf LDA $bfe4,x ; (draw_plane@stack + 0)
4d37 : 95 53 __ STA T4 + 0,x 
4d39 : ca __ __ DEX
4d3a : 10 f8 __ BPL $4d34 ; (draw_plane.s3 + 2)
4d3c : 60 __ __ RTS
.s6:
4d3d : a9 00 __ LDA #$00
4d3f : 85 53 __ STA T4 + 0 
4d41 : 85 54 __ STA T4 + 1 
.l7:
4d43 : a5 53 __ LDA T4 + 0 
.l68:
4d45 : 0a __ __ ASL
4d46 : 85 43 __ STA T0 + 0 
4d48 : a5 54 __ LDA T4 + 1 
4d4a : 2a __ __ ROL
4d4b : 18 __ __ CLC
4d4c : 65 18 __ ADC P11 ; (indices + 1)
4d4e : 85 44 __ STA T0 + 1 
4d50 : a4 17 __ LDY P10 ; (indices + 0)
4d52 : b1 43 __ LDA (T0 + 0),y 
4d54 : 0a __ __ ASL
4d55 : 85 1b __ STA ACCU + 0 
4d57 : c8 __ __ INY
4d58 : b1 43 __ LDA (T0 + 0),y 
4d5a : 2a __ __ ROL
4d5b : 85 1c __ STA ACCU + 1 
4d5d : ad ca 5b LDA $5bca ; (vx_pct + 0)
4d60 : 18 __ __ CLC
4d61 : 65 1b __ ADC ACCU + 0 
4d63 : 85 47 __ STA T2 + 0 
4d65 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
4d68 : 65 1c __ ADC ACCU + 1 
4d6a : 85 48 __ STA T2 + 1 
4d6c : a0 00 __ LDY #$00
4d6e : b1 47 __ LDA (T2 + 0),y 
4d70 : 85 0f __ STA P2 
4d72 : c8 __ __ INY
4d73 : b1 47 __ LDA (T2 + 0),y 
4d75 : 85 10 __ STA P3 
4d77 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
4d7a : 18 __ __ CLC
4d7b : 65 1b __ ADC ACCU + 0 
4d7d : 85 43 __ STA T0 + 0 
4d7f : ad cd 5b LDA $5bcd ; (vy_pct + 1)
4d82 : 65 1c __ ADC ACCU + 1 
4d84 : 85 44 __ STA T0 + 1 
4d86 : 88 __ __ DEY
4d87 : b1 43 __ LDA (T0 + 0),y 
4d89 : 85 11 __ STA P4 
4d8b : c8 __ __ INY
4d8c : b1 43 __ LDA (T0 + 0),y 
4d8e : 85 12 __ STA P5 
4d90 : 18 __ __ CLC
4d91 : a5 53 __ LDA T4 + 0 
4d93 : 69 01 __ ADC #$01
4d95 : 85 53 __ STA T4 + 0 
4d97 : 85 1b __ STA ACCU + 0 
4d99 : a5 54 __ LDA T4 + 1 
4d9b : 69 00 __ ADC #$00
4d9d : 85 54 __ STA T4 + 1 
4d9f : 85 1c __ STA ACCU + 1 
4da1 : a5 50 __ LDA T3 + 0 
4da3 : 85 03 __ STA WORK + 0 
4da5 : a5 51 __ LDA T3 + 1 
4da7 : 85 04 __ STA WORK + 1 
4da9 : 20 d3 56 JSR $56d3 ; (divmod + 0)
4dac : a5 05 __ LDA WORK + 2 
4dae : 0a __ __ ASL
4daf : 85 43 __ STA T0 + 0 
4db1 : a5 06 __ LDA WORK + 3 
4db3 : 2a __ __ ROL
4db4 : 18 __ __ CLC
4db5 : 65 18 __ ADC P11 ; (indices + 1)
4db7 : 85 44 __ STA T0 + 1 
4db9 : a4 17 __ LDY P10 ; (indices + 0)
4dbb : b1 43 __ LDA (T0 + 0),y 
4dbd : 0a __ __ ASL
4dbe : 85 1b __ STA ACCU + 0 
4dc0 : c8 __ __ INY
4dc1 : b1 43 __ LDA (T0 + 0),y 
4dc3 : 2a __ __ ROL
4dc4 : 85 1c __ STA ACCU + 1 
4dc6 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
4dc9 : 18 __ __ CLC
4dca : 65 1b __ ADC ACCU + 0 
4dcc : 85 47 __ STA T2 + 0 
4dce : ad cd 5b LDA $5bcd ; (vy_pct + 1)
4dd1 : 65 1c __ ADC ACCU + 1 
4dd3 : 85 48 __ STA T2 + 1 
4dd5 : a0 00 __ LDY #$00
4dd7 : b1 47 __ LDA (T2 + 0),y 
4dd9 : 85 15 __ STA P8 
4ddb : c8 __ __ INY
4ddc : b1 47 __ LDA (T2 + 0),y 
4dde : 85 16 __ STA P9 
4de0 : ad ca 5b LDA $5bca ; (vx_pct + 0)
4de3 : 18 __ __ CLC
4de4 : 65 1b __ ADC ACCU + 0 
4de6 : 85 45 __ STA T1 + 0 
4de8 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
4deb : 65 1c __ ADC ACCU + 1 
4ded : 85 46 __ STA T1 + 1 
4def : 88 __ __ DEY
4df0 : b1 45 __ LDA (T1 + 0),y 
4df2 : 85 13 __ STA P6 
4df4 : c8 __ __ INY
4df5 : b1 45 __ LDA (T1 + 0),y 
4df7 : 85 14 __ STA P7 
4df9 : 20 38 4b JSR $4b38 ; (drawline.s4 + 0)
4dfc : a5 54 __ LDA T4 + 1 
4dfe : c5 51 __ CMP T3 + 1 
4e00 : b0 03 __ BCS $4e05 ; (draw_plane.s66 + 0)
4e02 : 4c 43 4d JMP $4d43 ; (draw_plane.l7 + 0)
.s66:
4e05 : f0 03 __ BEQ $4e0a ; (draw_plane.s8 + 0)
4e07 : 4c 32 4d JMP $4d32 ; (draw_plane.s3 + 0)
.s8:
4e0a : a5 53 __ LDA T4 + 0 
4e0c : c5 50 __ CMP T3 + 0 
4e0e : b0 f7 __ BCS $4e07 ; (draw_plane.s66 + 2)
4e10 : 4c 45 4d JMP $4d45 ; (draw_plane.l68 + 0)
.s10:
4e13 : 85 53 __ STA T4 + 0 
4e15 : 85 54 __ STA T4 + 1 
4e17 : 85 56 __ STA T5 + 1 
4e19 : ad ec bf LDA $bfec ; (sstack + 0)
4e1c : 85 57 __ STA T6 + 0 
4e1e : a9 b7 __ LDA #$b7
4e20 : 85 55 __ STA T5 + 0 
4e22 : ad ed bf LDA $bfed ; (sstack + 1)
4e25 : 85 58 __ STA T6 + 1 
4e27 : 10 06 __ BPL $4e2f ; (draw_plane.s12 + 0)
.s11:
4e29 : 8a __ __ TXA
.s63:
4e2a : 85 52 __ STA T7 + 0 
4e2c : 4c b9 4e JMP $4eb9 ; (draw_plane.s13 + 0)
.s12:
4e2f : 05 57 __ ORA T6 + 0 
4e31 : f0 f7 __ BEQ $4e2a ; (draw_plane.s63 + 0)
.s56:
4e33 : 86 44 __ STX T0 + 1 
4e35 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
4e38 : 85 47 __ STA T2 + 0 
4e3a : a9 01 __ LDA #$01
4e3c : 85 52 __ STA T7 + 0 
4e3e : ad cd 5b LDA $5bcd ; (vy_pct + 1)
4e41 : 85 48 __ STA T2 + 1 
.l41:
4e43 : 8a __ __ TXA
4e44 : 0a __ __ ASL
4e45 : 85 50 __ STA T3 + 0 
4e47 : a5 44 __ LDA T0 + 1 
4e49 : 2a __ __ ROL
4e4a : 18 __ __ CLC
4e4b : 65 18 __ ADC P11 ; (indices + 1)
4e4d : 85 51 __ STA T3 + 1 
4e4f : a4 17 __ LDY P10 ; (indices + 0)
4e51 : b1 50 __ LDA (T3 + 0),y 
4e53 : 0a __ __ ASL
4e54 : 85 1b __ STA ACCU + 0 
4e56 : c8 __ __ INY
4e57 : b1 50 __ LDA (T3 + 0),y 
4e59 : 2a __ __ ROL
4e5a : a8 __ __ TAY
4e5b : 18 __ __ CLC
4e5c : a5 47 __ LDA T2 + 0 
4e5e : 65 1b __ ADC ACCU + 0 
4e60 : 85 50 __ STA T3 + 0 
4e62 : 98 __ __ TYA
4e63 : 65 48 __ ADC T2 + 1 
4e65 : 85 51 __ STA T3 + 1 
4e67 : a0 00 __ LDY #$00
4e69 : b1 50 __ LDA (T3 + 0),y 
4e6b : 85 1b __ STA ACCU + 0 
4e6d : c8 __ __ INY
4e6e : b1 50 __ LDA (T3 + 0),y 
4e70 : 85 51 __ STA T3 + 1 
4e72 : c5 56 __ CMP T5 + 1 
4e74 : d0 08 __ BNE $4e7e ; (draw_plane.s54 + 0)
.s51:
4e76 : a5 1b __ LDA ACCU + 0 
4e78 : c5 55 __ CMP T5 + 0 
.s52:
4e7a : 90 08 __ BCC $4e84 ; (draw_plane.s50 + 0)
4e7c : b0 0e __ BCS $4e8c ; (draw_plane.s42 + 0)
.s54:
4e7e : 45 56 __ EOR T5 + 1 
4e80 : 10 f8 __ BPL $4e7a ; (draw_plane.s52 + 0)
.s53:
4e82 : 90 08 __ BCC $4e8c ; (draw_plane.s42 + 0)
.s50:
4e84 : a5 1b __ LDA ACCU + 0 
4e86 : 85 55 __ STA T5 + 0 
4e88 : a5 51 __ LDA T3 + 1 
4e8a : 85 56 __ STA T5 + 1 
.s42:
4e8c : a5 54 __ LDA T4 + 1 
4e8e : c5 51 __ CMP T3 + 1 
4e90 : d0 08 __ BNE $4e9a ; (draw_plane.s49 + 0)
.s46:
4e92 : a5 53 __ LDA T4 + 0 
4e94 : c5 1b __ CMP ACCU + 0 
.s47:
4e96 : 90 08 __ BCC $4ea0 ; (draw_plane.s45 + 0)
4e98 : b0 0e __ BCS $4ea8 ; (draw_plane.s43 + 0)
.s49:
4e9a : 45 51 __ EOR T3 + 1 
4e9c : 10 f8 __ BPL $4e96 ; (draw_plane.s47 + 0)
.s48:
4e9e : 90 08 __ BCC $4ea8 ; (draw_plane.s43 + 0)
.s45:
4ea0 : a5 1b __ LDA ACCU + 0 
4ea2 : 85 53 __ STA T4 + 0 
4ea4 : a5 51 __ LDA T3 + 1 
4ea6 : 85 54 __ STA T4 + 1 
.s43:
4ea8 : e8 __ __ INX
4ea9 : d0 02 __ BNE $4ead ; (draw_plane.s58 + 0)
.s57:
4eab : e6 44 __ INC T0 + 1 
.s58:
4ead : a5 44 __ LDA T0 + 1 
4eaf : c5 58 __ CMP T6 + 1 
4eb1 : 90 90 __ BCC $4e43 ; (draw_plane.l41 + 0)
.s65:
4eb3 : d0 04 __ BNE $4eb9 ; (draw_plane.s13 + 0)
.s44:
4eb5 : e4 57 __ CPX T6 + 0 
4eb7 : 90 8a __ BCC $4e43 ; (draw_plane.l41 + 0)
.s13:
4eb9 : 24 56 __ BIT T5 + 1 
4ebb : 10 06 __ BPL $4ec3 ; (draw_plane.s14 + 0)
.s40:
4ebd : a9 00 __ LDA #$00
4ebf : 85 55 __ STA T5 + 0 
4ec1 : 85 56 __ STA T5 + 1 
.s14:
4ec3 : a5 54 __ LDA T4 + 1 
4ec5 : 10 06 __ BPL $4ecd ; (draw_plane.s39 + 0)
.s16:
4ec7 : a9 00 __ LDA #$00
4ec9 : 85 59 __ STA T8 + 0 
4ecb : f0 78 __ BEQ $4f45 ; (draw_plane.s19 + 0)
.s39:
4ecd : d0 0a __ BNE $4ed9 ; (draw_plane.s37 + 0)
.s38:
4ecf : a5 53 __ LDA T4 + 0 
4ed1 : c9 b8 __ CMP #$b8
4ed3 : b0 04 __ BCS $4ed9 ; (draw_plane.s37 + 0)
.s15:
4ed5 : a5 54 __ LDA T4 + 1 
4ed7 : 90 08 __ BCC $4ee1 ; (draw_plane.s64 + 0)
.s37:
4ed9 : a9 b7 __ LDA #$b7
4edb : 85 53 __ STA T4 + 0 
4edd : a9 00 __ LDA #$00
4edf : 85 54 __ STA T4 + 1 
.s64:
4ee1 : c5 56 __ CMP T5 + 1 
4ee3 : d0 04 __ BNE $4ee9 ; (draw_plane.s18 + 0)
.s17:
4ee5 : a5 53 __ LDA T4 + 0 
4ee7 : c5 55 __ CMP T5 + 0 
.s18:
4ee9 : a9 00 __ LDA #$00
4eeb : 2a __ __ ROL
4eec : 85 59 __ STA T8 + 0 
4eee : f0 55 __ BEQ $4f45 ; (draw_plane.s19 + 0)
.s35:
4ef0 : a5 55 __ LDA T5 + 0 
4ef2 : 85 47 __ STA T2 + 0 
4ef4 : 0a __ __ ASL
4ef5 : 85 43 __ STA T0 + 0 
4ef7 : a9 00 __ LDA #$00
4ef9 : 2a __ __ ROL
4efa : 85 44 __ STA T0 + 1 
4efc : a9 42 __ LDA #$42
4efe : 65 43 __ ADC T0 + 0 
4f00 : 85 45 __ STA T1 + 0 
4f02 : a9 75 __ LDA #$75
4f04 : 65 44 __ ADC T0 + 1 
4f06 : 85 46 __ STA T1 + 1 
4f08 : 18 __ __ CLC
4f09 : a9 e2 __ LDA #$e2
4f0b : 65 43 __ ADC T0 + 0 
4f0d : 85 43 __ STA T0 + 0 
4f0f : a9 73 __ LDA #$73
4f11 : 65 44 __ ADC T0 + 1 
4f13 : 85 44 __ STA T0 + 1 
4f15 : a6 53 __ LDX T4 + 0 
.l36:
4f17 : a9 ff __ LDA #$ff
4f19 : a0 00 __ LDY #$00
4f1b : 91 45 __ STA (T1 + 0),y 
4f1d : c8 __ __ INY
4f1e : 91 45 __ STA (T1 + 0),y 
4f20 : a9 b0 __ LDA #$b0
4f22 : 88 __ __ DEY
4f23 : 91 43 __ STA (T0 + 0),y 
4f25 : 98 __ __ TYA
4f26 : c8 __ __ INY
4f27 : 91 43 __ STA (T0 + 0),y 
4f29 : 18 __ __ CLC
4f2a : a5 43 __ LDA T0 + 0 
4f2c : 69 02 __ ADC #$02
4f2e : 85 43 __ STA T0 + 0 
4f30 : 90 03 __ BCC $4f35 ; (draw_plane.s60 + 0)
.s59:
4f32 : e6 44 __ INC T0 + 1 
4f34 : 18 __ __ CLC
.s60:
4f35 : a5 45 __ LDA T1 + 0 
4f37 : 69 02 __ ADC #$02
4f39 : 85 45 __ STA T1 + 0 
4f3b : 90 02 __ BCC $4f3f ; (draw_plane.s62 + 0)
.s61:
4f3d : e6 46 __ INC T1 + 1 
.s62:
4f3f : e6 47 __ INC T2 + 0 
4f41 : e4 47 __ CPX T2 + 0 
4f43 : b0 d2 __ BCS $4f17 ; (draw_plane.l36 + 0)
.s19:
4f45 : a5 52 __ LDA T7 + 0 
4f47 : f0 0d __ BEQ $4f56 ; (draw_plane.s20 + 0)
.s31:
4f49 : a9 00 __ LDA #$00
4f4b : 85 50 __ STA T3 + 0 
4f4d : 85 51 __ STA T3 + 1 
4f4f : a5 17 __ LDA P10 ; (indices + 0)
4f51 : 85 52 __ STA T7 + 0 
4f53 : 4c d4 4f JMP $4fd4 ; (draw_plane.l32 + 0)
.s20:
4f56 : a9 00 __ LDA #$00
4f58 : 8d 64 5b STA $5b64 ; (drawing_mode + 0)
4f5b : 8d 65 5b STA $5b65 ; (drawing_mode + 1)
4f5e : a5 59 __ LDA T8 + 0 
4f60 : f0 65 __ BEQ $4fc7 ; (draw_plane.s21 + 0)
.l22:
4f62 : a5 55 __ LDA T5 + 0 
4f64 : 0a __ __ ASL
4f65 : 85 43 __ STA T0 + 0 
4f67 : a8 __ __ TAY
4f68 : a9 00 __ LDA #$00
4f6a : 2a __ __ ROL
4f6b : 85 44 __ STA T0 + 1 
4f6d : 69 73 __ ADC #$73
4f6f : 85 46 __ STA T1 + 1 
4f71 : a9 e2 __ LDA #$e2
4f73 : 85 45 __ STA T1 + 0 
4f75 : b1 45 __ LDA (T1 + 0),y 
4f77 : aa __ __ TAX
4f78 : c8 __ __ INY
4f79 : b1 45 __ LDA (T1 + 0),y 
4f7b : 85 10 __ STA P3 
4f7d : a9 42 __ LDA #$42
4f7f : 65 43 __ ADC T0 + 0 
4f81 : 85 43 __ STA T0 + 0 
4f83 : a9 75 __ LDA #$75
4f85 : 65 44 __ ADC T0 + 1 
4f87 : 85 44 __ STA T0 + 1 
4f89 : a0 00 __ LDY #$00
4f8b : b1 43 __ LDA (T0 + 0),y 
4f8d : 85 13 __ STA P6 
4f8f : c8 __ __ INY
4f90 : b1 43 __ LDA (T0 + 0),y 
4f92 : 85 14 __ STA P7 
4f94 : c5 10 __ CMP P3 
4f96 : d0 0a __ BNE $4fa2 ; (draw_plane.s30 + 0)
.s27:
4f98 : 86 45 __ STX T1 + 0 
4f9a : a5 13 __ LDA P6 
4f9c : c5 45 __ CMP T1 + 0 
.s28:
4f9e : b0 08 __ BCS $4fa8 ; (draw_plane.s26 + 0)
4fa0 : 90 17 __ BCC $4fb9 ; (draw_plane.s23 + 0)
.s30:
4fa2 : 45 10 __ EOR P3 
4fa4 : 10 f8 __ BPL $4f9e ; (draw_plane.s28 + 0)
.s29:
4fa6 : b0 11 __ BCS $4fb9 ; (draw_plane.s23 + 0)
.s26:
4fa8 : 86 0f __ STX P2 
4faa : a5 55 __ LDA T5 + 0 
4fac : 85 11 __ STA P4 
4fae : 85 15 __ STA P8 
4fb0 : a9 00 __ LDA #$00
4fb2 : 85 12 __ STA P5 
4fb4 : 85 16 __ STA P9 
4fb6 : 20 38 4b JSR $4b38 ; (drawline.s4 + 0)
.s23:
4fb9 : e6 55 __ INC T5 + 0 
4fbb : a5 54 __ LDA T4 + 1 
4fbd : 30 08 __ BMI $4fc7 ; (draw_plane.s21 + 0)
.s25:
4fbf : d0 a1 __ BNE $4f62 ; (draw_plane.l22 + 0)
.s24:
4fc1 : a5 53 __ LDA T4 + 0 
4fc3 : c5 55 __ CMP T5 + 0 
4fc5 : b0 9b __ BCS $4f62 ; (draw_plane.l22 + 0)
.s21:
4fc7 : a9 01 __ LDA #$01
4fc9 : 8d 64 5b STA $5b64 ; (drawing_mode + 0)
4fcc : a9 00 __ LDA #$00
4fce : 8d 65 5b STA $5b65 ; (drawing_mode + 1)
4fd1 : 4c 22 4d JMP $4d22 ; (draw_plane.s5 + 0)
.l32:
4fd4 : a5 50 __ LDA T3 + 0 
.l69:
4fd6 : 0a __ __ ASL
4fd7 : 85 43 __ STA T0 + 0 
4fd9 : a5 51 __ LDA T3 + 1 
4fdb : 2a __ __ ROL
4fdc : 18 __ __ CLC
4fdd : 65 18 __ ADC P11 ; (indices + 1)
4fdf : 85 44 __ STA T0 + 1 
4fe1 : a4 52 __ LDY T7 + 0 
4fe3 : b1 43 __ LDA (T0 + 0),y 
4fe5 : 0a __ __ ASL
4fe6 : 85 1b __ STA ACCU + 0 
4fe8 : c8 __ __ INY
4fe9 : b1 43 __ LDA (T0 + 0),y 
4feb : 2a __ __ ROL
4fec : 85 1c __ STA ACCU + 1 
4fee : ad ca 5b LDA $5bca ; (vx_pct + 0)
4ff1 : 18 __ __ CLC
4ff2 : 65 1b __ ADC ACCU + 0 
4ff4 : 85 47 __ STA T2 + 0 
4ff6 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
4ff9 : 65 1c __ ADC ACCU + 1 
4ffb : 85 48 __ STA T2 + 1 
4ffd : a0 00 __ LDY #$00
4fff : b1 47 __ LDA (T2 + 0),y 
5001 : 85 0d __ STA P0 
5003 : c8 __ __ INY
5004 : b1 47 __ LDA (T2 + 0),y 
5006 : 85 0e __ STA P1 
5008 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
500b : 18 __ __ CLC
500c : 65 1b __ ADC ACCU + 0 
500e : 85 43 __ STA T0 + 0 
5010 : ad cd 5b LDA $5bcd ; (vy_pct + 1)
5013 : 65 1c __ ADC ACCU + 1 
5015 : 85 44 __ STA T0 + 1 
5017 : 88 __ __ DEY
5018 : b1 43 __ LDA (T0 + 0),y 
501a : 85 0f __ STA P2 
501c : c8 __ __ INY
501d : b1 43 __ LDA (T0 + 0),y 
501f : 85 10 __ STA P3 
5021 : 18 __ __ CLC
5022 : a5 50 __ LDA T3 + 0 
5024 : 69 01 __ ADC #$01
5026 : 85 50 __ STA T3 + 0 
5028 : 85 1b __ STA ACCU + 0 
502a : a5 51 __ LDA T3 + 1 
502c : 69 00 __ ADC #$00
502e : 85 51 __ STA T3 + 1 
5030 : 85 1c __ STA ACCU + 1 
5032 : a5 57 __ LDA T6 + 0 
5034 : 85 03 __ STA WORK + 0 
5036 : a5 58 __ LDA T6 + 1 
5038 : 85 04 __ STA WORK + 1 
503a : 20 5e 57 JSR $575e ; (mods16 + 0)
503d : a5 05 __ LDA WORK + 2 
503f : 0a __ __ ASL
5040 : 85 43 __ STA T0 + 0 
5042 : a5 06 __ LDA WORK + 3 
5044 : 2a __ __ ROL
5045 : 18 __ __ CLC
5046 : 65 18 __ ADC P11 ; (indices + 1)
5048 : 85 44 __ STA T0 + 1 
504a : a4 52 __ LDY T7 + 0 
504c : b1 43 __ LDA (T0 + 0),y 
504e : 0a __ __ ASL
504f : 85 1b __ STA ACCU + 0 
5051 : c8 __ __ INY
5052 : b1 43 __ LDA (T0 + 0),y 
5054 : 2a __ __ ROL
5055 : 85 1c __ STA ACCU + 1 
5057 : ad cc 5b LDA $5bcc ; (vy_pct + 0)
505a : 18 __ __ CLC
505b : 65 1b __ ADC ACCU + 0 
505d : 85 47 __ STA T2 + 0 
505f : ad cd 5b LDA $5bcd ; (vy_pct + 1)
5062 : 65 1c __ ADC ACCU + 1 
5064 : 85 48 __ STA T2 + 1 
5066 : a0 00 __ LDY #$00
5068 : b1 47 __ LDA (T2 + 0),y 
506a : 85 13 __ STA P6 
506c : c8 __ __ INY
506d : b1 47 __ LDA (T2 + 0),y 
506f : 85 14 __ STA P7 
5071 : ad ca 5b LDA $5bca ; (vx_pct + 0)
5074 : 18 __ __ CLC
5075 : 65 1b __ ADC ACCU + 0 
5077 : 85 45 __ STA T1 + 0 
5079 : ad cb 5b LDA $5bcb ; (vx_pct + 1)
507c : 65 1c __ ADC ACCU + 1 
507e : 85 46 __ STA T1 + 1 
5080 : 88 __ __ DEY
5081 : b1 45 __ LDA (T1 + 0),y 
5083 : 85 11 __ STA P4 
5085 : c8 __ __ INY
5086 : b1 45 __ LDA (T1 + 0),y 
5088 : 85 12 __ STA P5 
508a : 20 a8 50 JSR $50a8 ; (scan_edge.s4 + 0)
508d : 24 58 __ BIT T6 + 1 
508f : 10 03 __ BPL $5094 ; (draw_plane.s34 + 0)
5091 : 4c 56 4f JMP $4f56 ; (draw_plane.s20 + 0)
.s34:
5094 : a5 51 __ LDA T3 + 1 
5096 : c5 58 __ CMP T6 + 1 
5098 : b0 03 __ BCS $509d ; (draw_plane.s67 + 0)
509a : 4c d4 4f JMP $4fd4 ; (draw_plane.l32 + 0)
.s67:
509d : d0 f2 __ BNE $5091 ; (draw_plane.l69 + 187)
.s33:
509f : a5 50 __ LDA T3 + 0 
50a1 : c5 57 __ CMP T6 + 0 
50a3 : b0 ec __ BCS $5091 ; (draw_plane.l69 + 187)
50a5 : 4c d6 4f JMP $4fd6 ; (draw_plane.l69 + 0)
--------------------------------------------------------------------
scan_edge: ; scan_edge(i16,i16,i16,i16)->void
; 476, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
50a8 : a6 0f __ LDX P2 ; (y1 + 0)
50aa : a4 10 __ LDY P3 ; (y1 + 1)
50ac : c4 14 __ CPY P7 ; (y2 + 1)
50ae : d0 05 __ BNE $50b5 ; (scan_edge.s5 + 0)
.s36:
50b0 : e4 13 __ CPX P6 ; (y2 + 0)
50b2 : d0 01 __ BNE $50b5 ; (scan_edge.s5 + 0)
50b4 : 60 __ __ RTS
.s5:
50b5 : a5 14 __ LDA P7 ; (y2 + 1)
50b7 : c5 10 __ CMP P3 ; (y1 + 1)
50b9 : d0 08 __ BNE $50c3 ; (scan_edge.s35 + 0)
.s32:
50bb : a5 13 __ LDA P6 ; (y2 + 0)
50bd : c5 0f __ CMP P2 ; (y1 + 0)
.s33:
50bf : 90 08 __ BCC $50c9 ; (scan_edge.s31 + 0)
50c1 : b0 22 __ BCS $50e5 ; (scan_edge.s6 + 0)
.s35:
50c3 : 45 10 __ EOR P3 ; (y1 + 1)
50c5 : 10 f8 __ BPL $50bf ; (scan_edge.s33 + 0)
.s34:
50c7 : 90 1c __ BCC $50e5 ; (scan_edge.s6 + 0)
.s31:
50c9 : a5 13 __ LDA P6 ; (y2 + 0)
50cb : 86 13 __ STX P6 ; (y2 + 0)
50cd : 85 0f __ STA P2 ; (y1 + 0)
50cf : a5 14 __ LDA P7 ; (y2 + 1)
50d1 : 84 14 __ STY P7 ; (y2 + 1)
50d3 : 85 10 __ STA P3 ; (y1 + 1)
50d5 : a5 11 __ LDA P4 ; (x2 + 0)
50d7 : a6 0d __ LDX P0 ; (x1 + 0)
50d9 : 86 11 __ STX P4 ; (x2 + 0)
50db : 85 0d __ STA P0 ; (x1 + 0)
50dd : a5 12 __ LDA P5 ; (x2 + 1)
50df : a6 0e __ LDX P1 ; (x1 + 1)
50e1 : 86 12 __ STX P5 ; (x2 + 1)
50e3 : 85 0e __ STA P1 ; (x1 + 1)
.s6:
50e5 : a5 14 __ LDA P7 ; (y2 + 1)
50e7 : c5 10 __ CMP P3 ; (y1 + 1)
50e9 : d0 07 __ BNE $50f2 ; (scan_edge.s30 + 0)
.s27:
50eb : a5 13 __ LDA P6 ; (y2 + 0)
50ed : c5 0f __ CMP P2 ; (y1 + 0)
.s28:
50ef : b0 08 __ BCS $50f9 ; (scan_edge.s7 + 0)
50f1 : 60 __ __ RTS
.s30:
50f2 : 45 10 __ EOR P3 ; (y1 + 1)
50f4 : 10 f9 __ BPL $50ef ; (scan_edge.s28 + 0)
.s29:
50f6 : 90 01 __ BCC $50f9 ; (scan_edge.s7 + 0)
50f8 : 60 __ __ RTS
.s7:
50f9 : a5 11 __ LDA P4 ; (x2 + 0)
50fb : 38 __ __ SEC
50fc : e5 0d __ SBC P0 ; (x1 + 0)
50fe : 85 1c __ STA ACCU + 1 
5100 : a5 12 __ LDA P5 ; (x2 + 1)
5102 : e5 0e __ SBC P1 ; (x1 + 1)
5104 : 85 1d __ STA ACCU + 2 
5106 : 29 80 __ AND #$80
5108 : 10 02 __ BPL $510c ; (scan_edge.s7 + 19)
510a : a9 ff __ LDA #$ff
510c : 85 1e __ STA ACCU + 3 
510e : 38 __ __ SEC
510f : a5 13 __ LDA P6 ; (y2 + 0)
5111 : e5 0f __ SBC P2 ; (y1 + 0)
5113 : 85 03 __ STA WORK + 0 
5115 : a5 14 __ LDA P7 ; (y2 + 1)
5117 : e5 10 __ SBC P3 ; (y1 + 1)
5119 : 85 04 __ STA WORK + 1 
511b : 0a __ __ ASL
511c : a9 00 __ LDA #$00
511e : 85 1b __ STA ACCU + 0 
5120 : 69 ff __ ADC #$ff
5122 : 49 ff __ EOR #$ff
5124 : 85 05 __ STA WORK + 2 
5126 : 85 06 __ STA WORK + 3 
5128 : 20 f4 58 JSR $58f4 ; (divs32 + 0)
512b : a2 00 __ LDX #$00
512d : a5 10 __ LDA P3 ; (y1 + 1)
512f : d0 6b __ BNE $519c ; (scan_edge.l8 + 0)
.l26:
5131 : a5 0f __ LDA P2 ; (y1 + 0)
5133 : c9 b7 __ CMP #$b7
5135 : b0 65 __ BCS $519c ; (scan_edge.l8 + 0)
.s14:
5137 : 0a __ __ ASL
5138 : 85 43 __ STA T5 + 0 
513a : a8 __ __ TAY
513b : a9 00 __ LDA #$00
513d : 2a __ __ ROL
513e : 85 44 __ STA T5 + 1 
5140 : a9 e2 __ LDA #$e2
5142 : 85 45 __ STA T6 + 0 
5144 : a9 73 __ LDA #$73
5146 : 65 44 __ ADC T5 + 1 
5148 : 85 46 __ STA T6 + 1 
514a : b1 45 __ LDA (T6 + 0),y 
514c : 85 1e __ STA ACCU + 3 
514e : a5 0e __ LDA P1 ; (x1 + 1)
5150 : c8 __ __ INY
5151 : d1 45 __ CMP (T6 + 0),y 
5153 : d0 08 __ BNE $515d ; (scan_edge.s25 + 0)
.s22:
5155 : a5 0d __ LDA P0 ; (x1 + 0)
5157 : c5 1e __ CMP ACCU + 3 
.s23:
5159 : 90 08 __ BCC $5163 ; (scan_edge.s21 + 0)
515b : b0 10 __ BCS $516d ; (scan_edge.s15 + 0)
.s25:
515d : 51 45 __ EOR (T6 + 0),y 
515f : 10 f8 __ BPL $5159 ; (scan_edge.s23 + 0)
.s24:
5161 : 90 0a __ BCC $516d ; (scan_edge.s15 + 0)
.s21:
5163 : a5 0d __ LDA P0 ; (x1 + 0)
5165 : 88 __ __ DEY
5166 : 91 45 __ STA (T6 + 0),y 
5168 : a5 0e __ LDA P1 ; (x1 + 1)
516a : c8 __ __ INY
516b : 91 45 __ STA (T6 + 0),y 
.s15:
516d : 18 __ __ CLC
516e : a9 42 __ LDA #$42
5170 : 65 43 __ ADC T5 + 0 
5172 : 85 43 __ STA T5 + 0 
5174 : a9 75 __ LDA #$75
5176 : 65 44 __ ADC T5 + 1 
5178 : 85 44 __ STA T5 + 1 
517a : a0 01 __ LDY #$01
517c : b1 43 __ LDA (T5 + 0),y 
517e : c5 0e __ CMP P1 ; (x1 + 1)
5180 : d0 09 __ BNE $518b ; (scan_edge.s20 + 0)
.s17:
5182 : 88 __ __ DEY
5183 : b1 43 __ LDA (T5 + 0),y 
5185 : c5 0d __ CMP P0 ; (x1 + 0)
.s18:
5187 : 90 08 __ BCC $5191 ; (scan_edge.s16 + 0)
5189 : b0 11 __ BCS $519c ; (scan_edge.l8 + 0)
.s20:
518b : 45 0e __ EOR P1 ; (x1 + 1)
518d : 10 f8 __ BPL $5187 ; (scan_edge.s18 + 0)
.s19:
518f : 90 0b __ BCC $519c ; (scan_edge.l8 + 0)
.s16:
5191 : a5 0d __ LDA P0 ; (x1 + 0)
5193 : a0 00 __ LDY #$00
5195 : 91 43 __ STA (T5 + 0),y 
5197 : a5 0e __ LDA P1 ; (x1 + 1)
5199 : c8 __ __ INY
519a : 91 43 __ STA (T5 + 0),y 
.l8:
519c : e6 0f __ INC P2 ; (y1 + 0)
519e : d0 02 __ BNE $51a2 ; (scan_edge.s38 + 0)
.s37:
51a0 : e6 10 __ INC P3 ; (y1 + 1)
.s38:
51a2 : a5 14 __ LDA P7 ; (y2 + 1)
51a4 : c5 10 __ CMP P3 ; (y1 + 1)
51a6 : d0 07 __ BNE $51af ; (scan_edge.s13 + 0)
.s10:
51a8 : a5 13 __ LDA P6 ; (y2 + 0)
51aa : c5 0f __ CMP P2 ; (y1 + 0)
.s11:
51ac : b0 07 __ BCS $51b5 ; (scan_edge.s9 + 0)
51ae : 60 __ __ RTS
.s13:
51af : 45 10 __ EOR P3 ; (y1 + 1)
51b1 : 10 f9 __ BPL $51ac ; (scan_edge.s11 + 0)
.s12:
51b3 : b0 18 __ BCS $51cd ; (scan_edge.s3 + 0)
.s9:
51b5 : 8a __ __ TXA
51b6 : 18 __ __ CLC
51b7 : 65 1b __ ADC ACCU + 0 
51b9 : aa __ __ TAX
51ba : a5 0d __ LDA P0 ; (x1 + 0)
51bc : 65 1c __ ADC ACCU + 1 
51be : 85 0d __ STA P0 ; (x1 + 0)
51c0 : a5 0e __ LDA P1 ; (x1 + 1)
51c2 : 65 1d __ ADC ACCU + 2 
51c4 : 85 0e __ STA P1 ; (x1 + 1)
51c6 : a5 10 __ LDA P3 ; (y1 + 1)
51c8 : d0 d2 __ BNE $519c ; (scan_edge.l8 + 0)
51ca : 4c 31 51 JMP $5131 ; (scan_edge.l26 + 0)
.s3:
51cd : 60 __ __ RTS
--------------------------------------------------------------------
DrawBorders: ; DrawBorders()->void
; 324, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
51ce : a9 00 __ LDA #$00
51d0 : 85 0f __ STA P2 
51d2 : 85 10 __ STA P3 
51d4 : 85 11 __ STA P4 
51d6 : 85 12 __ STA P5 
51d8 : 85 14 __ STA P7 
51da : 85 15 __ STA P8 
51dc : 85 16 __ STA P9 
51de : a9 af __ LDA #$af
51e0 : 85 13 __ STA P6 
51e2 : 20 38 4b JSR $4b38 ; (drawline.s4 + 0)
51e5 : a9 00 __ LDA #$00
51e7 : 85 10 __ STA P3 
51e9 : 85 11 __ STA P4 
51eb : 85 12 __ STA P5 
51ed : a9 af __ LDA #$af
51ef : 85 0f __ STA P2 
51f1 : a9 b7 __ LDA #$b7
51f3 : 85 15 __ STA P8 
51f5 : 20 38 4b JSR $4b38 ; (drawline.s4 + 0)
51f8 : a9 00 __ LDA #$00
51fa : 85 10 __ STA P3 
51fc : 85 12 __ STA P5 
51fe : 85 13 __ STA P6 
5200 : a9 af __ LDA #$af
5202 : 85 0f __ STA P2 
5204 : a9 b7 __ LDA #$b7
5206 : 85 11 __ STA P4 
5208 : 20 38 4b JSR $4b38 ; (drawline.s4 + 0)
520b : a9 00 __ LDA #$00
520d : 85 0f __ STA P2 
520f : 85 10 __ STA P3 
5211 : 85 12 __ STA P5 
5213 : 85 15 __ STA P8 
5215 : a9 b7 __ LDA #$b7
5217 : 85 11 __ STA P4 
5219 : 4c 38 4b JMP $4b38 ; (drawline.s4 + 0)
--------------------------------------------------------------------
hires_render: ; hires_render()->void
; 350, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
521c : a9 01 __ LDA #$01
521e : 85 47 __ STA T2 + 0 
5220 : a9 00 __ LDA #$00
5222 : a2 07 __ LDX #$07
.l18:
5224 : 9d 00 10 STA $1000,x 
5227 : ca __ __ DEX
5228 : 10 fa __ BPL $5224 ; (hires_render.l18 + 0)
.s19:
522a : 85 45 __ STA T1 + 0 
522c : 85 46 __ STA T1 + 1 
.l5:
522e : a5 45 __ LDA T1 + 0 
.l24:
5230 : 85 48 __ STA T3 + 0 
5232 : a5 46 __ LDA T1 + 1 
5234 : 85 49 __ STA T3 + 1 
5236 : a9 16 __ LDA #$16
5238 : 85 4a __ STA T6 + 0 
.l6:
523a : a9 00 __ LDA #$00
523c : 85 0f __ STA P2 
523e : 85 10 __ STA P3 
5240 : a5 48 __ LDA T3 + 0 
5242 : 0a __ __ ASL
5243 : 85 0d __ STA P0 
5245 : a5 49 __ LDA T3 + 1 
5247 : 2a __ __ ROL
5248 : 06 0d __ ASL P0 
524a : 2a __ __ ROL
524b : 06 0d __ ASL P0 
524d : 2a __ __ ROL
524e : 85 0e __ STA P1 
5250 : 20 ee 52 JSR $52ee ; (pattern_equal.s4 + 0)
5253 : aa __ __ TAX
5254 : d0 46 __ BNE $529c ; (hires_render.s9 + 0)
.s7:
5256 : a5 47 __ LDA T2 + 0 
5258 : c9 02 __ CMP #$02
525a : 90 1e __ BCC $527a ; (hires_render.s8 + 0)
.s14:
525c : a2 01 __ LDX #$01
.l15:
525e : 8a __ __ TXA
525f : 0a __ __ ASL
5260 : 85 0f __ STA P2 
5262 : a9 00 __ LDA #$00
5264 : 2a __ __ ROL
5265 : 06 0f __ ASL P2 
5267 : 2a __ __ ROL
5268 : 06 0f __ ASL P2 
526a : 2a __ __ ROL
526b : 85 10 __ STA P3 
526d : 20 ee 52 JSR $52ee ; (pattern_equal.s4 + 0)
5270 : a8 __ __ TAY
5271 : d0 70 __ BNE $52e3 ; (hires_render.s17 + 0)
.s16:
5273 : e8 __ __ INX
5274 : e4 47 __ CPX T2 + 0 
5276 : 90 e6 __ BCC $525e ; (hires_render.l15 + 0)
.s21:
5278 : a5 47 __ LDA T2 + 0 
.s8:
527a : c9 ff __ CMP #$ff
527c : f0 1e __ BEQ $529c ; (hires_render.s9 + 0)
.s13:
527e : 85 0f __ STA P2 
5280 : 20 19 53 JSR $5319 ; (copy_pattern.s4 + 0)
5283 : a5 48 __ LDA T3 + 0 
5285 : 85 43 __ STA T0 + 0 
5287 : 18 __ __ CLC
5288 : a5 49 __ LDA T3 + 1 
528a : 69 1e __ ADC #$1e
528c : 85 44 __ STA T0 + 1 
528e : a5 0f __ LDA P2 
5290 : a0 00 __ LDY #$00
5292 : 91 43 __ STA (T0 + 0),y 
5294 : 18 __ __ CLC
5295 : 69 01 __ ADC #$01
5297 : 85 47 __ STA T2 + 0 
5299 : 4c ad 52 JMP $52ad ; (hires_render.s10 + 0)
.s9:
529c : 18 __ __ CLC
529d : a5 49 __ LDA T3 + 1 
529f : 69 1e __ ADC #$1e
52a1 : 85 44 __ STA T0 + 1 
52a3 : a9 00 __ LDA #$00
.s20:
52a5 : a6 48 __ LDX T3 + 0 
52a7 : 86 43 __ STX T0 + 0 
52a9 : a0 00 __ LDY #$00
52ab : 91 43 __ STA (T0 + 0),y 
.s10:
52ad : 18 __ __ CLC
52ae : a5 49 __ LDA T3 + 1 
52b0 : 69 96 __ ADC #$96
52b2 : 85 44 __ STA T0 + 1 
52b4 : a9 05 __ LDA #$05
52b6 : 91 43 __ STA (T0 + 0),y 
52b8 : e6 48 __ INC T3 + 0 
52ba : d0 02 __ BNE $52be ; (hires_render.s23 + 0)
.s22:
52bc : e6 49 __ INC T3 + 1 
.s23:
52be : c6 4a __ DEC T6 + 0 
52c0 : f0 03 __ BEQ $52c5 ; (hires_render.s11 + 0)
52c2 : 4c 3a 52 JMP $523a ; (hires_render.l6 + 0)
.s11:
52c5 : 18 __ __ CLC
52c6 : a5 45 __ LDA T1 + 0 
52c8 : 69 16 __ ADC #$16
52ca : 85 45 __ STA T1 + 0 
52cc : a5 46 __ LDA T1 + 1 
52ce : 69 00 __ ADC #$00
52d0 : 85 46 __ STA T1 + 1 
52d2 : c9 01 __ CMP #$01
52d4 : f0 03 __ BEQ $52d9 ; (hires_render.s12 + 0)
52d6 : 4c 2e 52 JMP $522e ; (hires_render.l5 + 0)
.s12:
52d9 : a5 45 __ LDA T1 + 0 
52db : c9 fa __ CMP #$fa
52dd : f0 03 __ BEQ $52e2 ; (hires_render.s3 + 0)
52df : 4c 30 52 JMP $5230 ; (hires_render.l24 + 0)
.s3:
52e2 : 60 __ __ RTS
.s17:
52e3 : 18 __ __ CLC
52e4 : a5 49 __ LDA T3 + 1 
52e6 : 69 1e __ ADC #$1e
52e8 : 85 44 __ STA T0 + 1 
52ea : 8a __ __ TXA
52eb : 4c a5 52 JMP $52a5 ; (hires_render.s20 + 0)
--------------------------------------------------------------------
pattern_equal: ; pattern_equal(u16,u16)->u8
; 335, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
52ee : 18 __ __ CLC
52ef : a9 d2 __ LDA #$d2
52f1 : 65 0d __ ADC P0 ; (a + 0)
52f3 : 85 1b __ STA ACCU + 0 
52f5 : a9 5b __ LDA #$5b
52f7 : 65 0e __ ADC P1 ; (a + 1)
52f9 : 85 1c __ STA ACCU + 1 
52fb : a5 0f __ LDA P2 ; (b + 0)
52fd : 85 43 __ STA T1 + 0 
52ff : 18 __ __ CLC
5300 : a5 10 __ LDA P3 ; (b + 1)
5302 : 69 10 __ ADC #$10
5304 : 85 44 __ STA T1 + 1 
5306 : a0 00 __ LDY #$00
.l5:
5308 : b1 1b __ LDA (ACCU + 0),y 
530a : d1 43 __ CMP (T1 + 0),y 
530c : d0 08 __ BNE $5316 ; (pattern_equal.s8 + 0)
.s6:
530e : c8 __ __ INY
530f : c0 08 __ CPY #$08
5311 : 90 f5 __ BCC $5308 ; (pattern_equal.l5 + 0)
.s7:
5313 : a9 01 __ LDA #$01
.s3:
5315 : 60 __ __ RTS
.s8:
5316 : a9 00 __ LDA #$00
5318 : 60 __ __ RTS
--------------------------------------------------------------------
copy_pattern: ; copy_pattern(u16,u8)->void
; 343, "D:/Arbeit/dev/OscarTutorials-main/0000 Vic20/3d20.cpp"
.s4:
5319 : a5 0f __ LDA P2 ; (character + 0)
531b : 0a __ __ ASL
531c : 85 1b __ STA ACCU + 0 
531e : a9 02 __ LDA #$02
5320 : 2a __ __ ROL
5321 : 06 1b __ ASL ACCU + 0 
5323 : 2a __ __ ROL
5324 : 06 1b __ ASL ACCU + 0 
5326 : 2a __ __ ROL
5327 : 85 1c __ STA ACCU + 1 
5329 : a9 d2 __ LDA #$d2
532b : 65 0d __ ADC P0 ; (source + 0)
532d : 85 43 __ STA T1 + 0 
532f : a9 5b __ LDA #$5b
5331 : 65 0e __ ADC P1 ; (source + 1)
5333 : 85 44 __ STA T1 + 1 
5335 : a0 00 __ LDY #$00
.l5:
5337 : b1 43 __ LDA (T1 + 0),y 
5339 : 91 1b __ STA (ACCU + 0),y 
533b : c8 __ __ INY
533c : c0 08 __ CPY #$08
533e : d0 f7 __ BNE $5337 ; (copy_pattern.l5 + 0)
.s3:
5340 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
5341 : 4a __ __ LSR
5342 : f0 2e __ BEQ $5372 ; (mul16by8 + 49)
5344 : a2 00 __ LDX #$00
5346 : a0 00 __ LDY #$00
5348 : 90 13 __ BCC $535d ; (mul16by8 + 28)
534a : a4 1b __ LDY ACCU + 0 
534c : a6 1c __ LDX ACCU + 1 
534e : b0 0d __ BCS $535d ; (mul16by8 + 28)
5350 : 85 02 __ STA $02 
5352 : 18 __ __ CLC
5353 : 98 __ __ TYA
5354 : 65 1b __ ADC ACCU + 0 
5356 : a8 __ __ TAY
5357 : 8a __ __ TXA
5358 : 65 1c __ ADC ACCU + 1 
535a : aa __ __ TAX
535b : a5 02 __ LDA $02 
535d : 06 1b __ ASL ACCU + 0 
535f : 26 1c __ ROL ACCU + 1 
5361 : 4a __ __ LSR
5362 : 90 f9 __ BCC $535d ; (mul16by8 + 28)
5364 : d0 ea __ BNE $5350 ; (mul16by8 + 15)
5366 : 18 __ __ CLC
5367 : 98 __ __ TYA
5368 : 65 1b __ ADC ACCU + 0 
536a : 85 1b __ STA ACCU + 0 
536c : 8a __ __ TXA
536d : 65 1c __ ADC ACCU + 1 
536f : 85 1c __ STA ACCU + 1 
5371 : 60 __ __ RTS
5372 : b0 04 __ BCS $5378 ; (mul16by8 + 55)
5374 : 85 1b __ STA ACCU + 0 
5376 : 85 1c __ STA ACCU + 1 
5378 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
5379 : a0 00 __ LDY #$00
537b : 84 07 __ STY WORK + 4 
537d : 84 08 __ STY WORK + 5 
537f : 84 09 __ STY WORK + 6 
5381 : 4a __ __ LSR
5382 : b0 0d __ BCS $5391 ; (mul32by8 + 24)
5384 : f0 26 __ BEQ $53ac ; (mul32by8 + 51)
5386 : 06 1b __ ASL ACCU + 0 
5388 : 26 1c __ ROL ACCU + 1 
538a : 26 1d __ ROL ACCU + 2 
538c : 26 1e __ ROL ACCU + 3 
538e : 4a __ __ LSR
538f : 90 f5 __ BCC $5386 ; (mul32by8 + 13)
5391 : aa __ __ TAX
5392 : 18 __ __ CLC
5393 : a5 07 __ LDA WORK + 4 
5395 : 65 1b __ ADC ACCU + 0 
5397 : 85 07 __ STA WORK + 4 
5399 : a5 08 __ LDA WORK + 5 
539b : 65 1c __ ADC ACCU + 1 
539d : 85 08 __ STA WORK + 5 
539f : a5 09 __ LDA WORK + 6 
53a1 : 65 1d __ ADC ACCU + 2 
53a3 : 85 09 __ STA WORK + 6 
53a5 : 98 __ __ TYA
53a6 : 65 1e __ ADC ACCU + 3 
53a8 : a8 __ __ TAY
53a9 : 8a __ __ TXA
53aa : d0 da __ BNE $5386 ; (mul32by8 + 13)
53ac : 84 0a __ STY WORK + 7 
53ae : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
53af : b1 19 __ LDA (IP + 0),y 
53b1 : c8 __ __ INY
53b2 : aa __ __ TAX
53b3 : b5 00 __ LDA $00,x 
53b5 : 85 03 __ STA WORK + 0 
53b7 : b5 01 __ LDA $01,x 
53b9 : 85 04 __ STA WORK + 1 
53bb : b5 02 __ LDA $02,x 
53bd : 85 05 __ STA WORK + 2 
53bf : b5 03 __ LDA WORK + 0,x 
53c1 : 85 06 __ STA WORK + 3 
53c3 : a5 05 __ LDA WORK + 2 
53c5 : 0a __ __ ASL
53c6 : a5 06 __ LDA WORK + 3 
53c8 : 2a __ __ ROL
53c9 : 85 08 __ STA WORK + 5 
53cb : f0 06 __ BEQ $53d3 ; (freg + 36)
53cd : a5 05 __ LDA WORK + 2 
53cf : 09 80 __ ORA #$80
53d1 : 85 05 __ STA WORK + 2 
53d3 : a5 1d __ LDA ACCU + 2 
53d5 : 0a __ __ ASL
53d6 : a5 1e __ LDA ACCU + 3 
53d8 : 2a __ __ ROL
53d9 : 85 07 __ STA WORK + 4 
53db : f0 06 __ BEQ $53e3 ; (freg + 52)
53dd : a5 1d __ LDA ACCU + 2 
53df : 09 80 __ ORA #$80
53e1 : 85 1d __ STA ACCU + 2 
53e3 : 60 __ __ RTS
53e4 : 06 1e __ ASL ACCU + 3 
53e6 : a5 07 __ LDA WORK + 4 
53e8 : 6a __ __ ROR
53e9 : 85 1e __ STA ACCU + 3 
53eb : b0 06 __ BCS $53f3 ; (freg + 68)
53ed : a5 1d __ LDA ACCU + 2 
53ef : 29 7f __ AND #$7f
53f1 : 85 1d __ STA ACCU + 2 
53f3 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
53f4 : a5 06 __ LDA WORK + 3 
53f6 : 49 80 __ EOR #$80
53f8 : 85 06 __ STA WORK + 3 
53fa : a9 ff __ LDA #$ff
53fc : c5 07 __ CMP WORK + 4 
53fe : f0 04 __ BEQ $5404 ; (faddsub + 16)
5400 : c5 08 __ CMP WORK + 5 
5402 : d0 11 __ BNE $5415 ; (faddsub + 33)
5404 : a5 1e __ LDA ACCU + 3 
5406 : 09 7f __ ORA #$7f
5408 : 85 1e __ STA ACCU + 3 
540a : a9 80 __ LDA #$80
540c : 85 1d __ STA ACCU + 2 
540e : a9 00 __ LDA #$00
5410 : 85 1b __ STA ACCU + 0 
5412 : 85 1c __ STA ACCU + 1 
5414 : 60 __ __ RTS
5415 : 38 __ __ SEC
5416 : a5 07 __ LDA WORK + 4 
5418 : e5 08 __ SBC WORK + 5 
541a : f0 38 __ BEQ $5454 ; (faddsub + 96)
541c : aa __ __ TAX
541d : b0 25 __ BCS $5444 ; (faddsub + 80)
541f : e0 e9 __ CPX #$e9
5421 : b0 0e __ BCS $5431 ; (faddsub + 61)
5423 : a5 08 __ LDA WORK + 5 
5425 : 85 07 __ STA WORK + 4 
5427 : a9 00 __ LDA #$00
5429 : 85 1b __ STA ACCU + 0 
542b : 85 1c __ STA ACCU + 1 
542d : 85 1d __ STA ACCU + 2 
542f : f0 23 __ BEQ $5454 ; (faddsub + 96)
5431 : a5 1d __ LDA ACCU + 2 
5433 : 4a __ __ LSR
5434 : 66 1c __ ROR ACCU + 1 
5436 : 66 1b __ ROR ACCU + 0 
5438 : e8 __ __ INX
5439 : d0 f8 __ BNE $5433 ; (faddsub + 63)
543b : 85 1d __ STA ACCU + 2 
543d : a5 08 __ LDA WORK + 5 
543f : 85 07 __ STA WORK + 4 
5441 : 4c 54 54 JMP $5454 ; (faddsub + 96)
5444 : e0 18 __ CPX #$18
5446 : b0 33 __ BCS $547b ; (faddsub + 135)
5448 : a5 05 __ LDA WORK + 2 
544a : 4a __ __ LSR
544b : 66 04 __ ROR WORK + 1 
544d : 66 03 __ ROR WORK + 0 
544f : ca __ __ DEX
5450 : d0 f8 __ BNE $544a ; (faddsub + 86)
5452 : 85 05 __ STA WORK + 2 
5454 : a5 1e __ LDA ACCU + 3 
5456 : 29 80 __ AND #$80
5458 : 85 1e __ STA ACCU + 3 
545a : 45 06 __ EOR WORK + 3 
545c : 30 31 __ BMI $548f ; (faddsub + 155)
545e : 18 __ __ CLC
545f : a5 1b __ LDA ACCU + 0 
5461 : 65 03 __ ADC WORK + 0 
5463 : 85 1b __ STA ACCU + 0 
5465 : a5 1c __ LDA ACCU + 1 
5467 : 65 04 __ ADC WORK + 1 
5469 : 85 1c __ STA ACCU + 1 
546b : a5 1d __ LDA ACCU + 2 
546d : 65 05 __ ADC WORK + 2 
546f : 85 1d __ STA ACCU + 2 
5471 : 90 08 __ BCC $547b ; (faddsub + 135)
5473 : 66 1d __ ROR ACCU + 2 
5475 : 66 1c __ ROR ACCU + 1 
5477 : 66 1b __ ROR ACCU + 0 
5479 : e6 07 __ INC WORK + 4 
547b : a5 07 __ LDA WORK + 4 
547d : c9 ff __ CMP #$ff
547f : f0 83 __ BEQ $5404 ; (faddsub + 16)
5481 : 4a __ __ LSR
5482 : 05 1e __ ORA ACCU + 3 
5484 : 85 1e __ STA ACCU + 3 
5486 : b0 06 __ BCS $548e ; (faddsub + 154)
5488 : a5 1d __ LDA ACCU + 2 
548a : 29 7f __ AND #$7f
548c : 85 1d __ STA ACCU + 2 
548e : 60 __ __ RTS
548f : 38 __ __ SEC
5490 : a5 1b __ LDA ACCU + 0 
5492 : e5 03 __ SBC WORK + 0 
5494 : 85 1b __ STA ACCU + 0 
5496 : a5 1c __ LDA ACCU + 1 
5498 : e5 04 __ SBC WORK + 1 
549a : 85 1c __ STA ACCU + 1 
549c : a5 1d __ LDA ACCU + 2 
549e : e5 05 __ SBC WORK + 2 
54a0 : 85 1d __ STA ACCU + 2 
54a2 : b0 19 __ BCS $54bd ; (faddsub + 201)
54a4 : 38 __ __ SEC
54a5 : a9 00 __ LDA #$00
54a7 : e5 1b __ SBC ACCU + 0 
54a9 : 85 1b __ STA ACCU + 0 
54ab : a9 00 __ LDA #$00
54ad : e5 1c __ SBC ACCU + 1 
54af : 85 1c __ STA ACCU + 1 
54b1 : a9 00 __ LDA #$00
54b3 : e5 1d __ SBC ACCU + 2 
54b5 : 85 1d __ STA ACCU + 2 
54b7 : a5 1e __ LDA ACCU + 3 
54b9 : 49 80 __ EOR #$80
54bb : 85 1e __ STA ACCU + 3 
54bd : a5 1d __ LDA ACCU + 2 
54bf : 30 ba __ BMI $547b ; (faddsub + 135)
54c1 : 05 1c __ ORA ACCU + 1 
54c3 : 05 1b __ ORA ACCU + 0 
54c5 : f0 0f __ BEQ $54d6 ; (faddsub + 226)
54c7 : c6 07 __ DEC WORK + 4 
54c9 : f0 0b __ BEQ $54d6 ; (faddsub + 226)
54cb : 06 1b __ ASL ACCU + 0 
54cd : 26 1c __ ROL ACCU + 1 
54cf : 26 1d __ ROL ACCU + 2 
54d1 : 10 f4 __ BPL $54c7 ; (faddsub + 211)
54d3 : 4c 7b 54 JMP $547b ; (faddsub + 135)
54d6 : a9 00 __ LDA #$00
54d8 : 85 1b __ STA ACCU + 0 
54da : 85 1c __ STA ACCU + 1 
54dc : 85 1d __ STA ACCU + 2 
54de : 85 1e __ STA ACCU + 3 
54e0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
54e1 : a5 1b __ LDA ACCU + 0 
54e3 : 05 1c __ ORA ACCU + 1 
54e5 : 05 1d __ ORA ACCU + 2 
54e7 : f0 0e __ BEQ $54f7 ; (crt_fmul + 22)
54e9 : a5 03 __ LDA WORK + 0 
54eb : 05 04 __ ORA WORK + 1 
54ed : 05 05 __ ORA WORK + 2 
54ef : d0 09 __ BNE $54fa ; (crt_fmul + 25)
54f1 : 85 1b __ STA ACCU + 0 
54f3 : 85 1c __ STA ACCU + 1 
54f5 : 85 1d __ STA ACCU + 2 
54f7 : 85 1e __ STA ACCU + 3 
54f9 : 60 __ __ RTS
54fa : a5 1e __ LDA ACCU + 3 
54fc : 45 06 __ EOR WORK + 3 
54fe : 29 80 __ AND #$80
5500 : 85 1e __ STA ACCU + 3 
5502 : a9 ff __ LDA #$ff
5504 : c5 07 __ CMP WORK + 4 
5506 : f0 42 __ BEQ $554a ; (crt_fmul + 105)
5508 : c5 08 __ CMP WORK + 5 
550a : f0 3e __ BEQ $554a ; (crt_fmul + 105)
550c : a9 00 __ LDA #$00
550e : 85 09 __ STA WORK + 6 
5510 : 85 0a __ STA WORK + 7 
5512 : 85 0b __ STA WORK + 8 
5514 : a4 1b __ LDY ACCU + 0 
5516 : a5 03 __ LDA WORK + 0 
5518 : d0 06 __ BNE $5520 ; (crt_fmul + 63)
551a : a5 04 __ LDA WORK + 1 
551c : f0 0a __ BEQ $5528 ; (crt_fmul + 71)
551e : d0 05 __ BNE $5525 ; (crt_fmul + 68)
5520 : 20 7b 55 JSR $557b ; (crt_fmul8 + 0)
5523 : a5 04 __ LDA WORK + 1 
5525 : 20 7b 55 JSR $557b ; (crt_fmul8 + 0)
5528 : a5 05 __ LDA WORK + 2 
552a : 20 7b 55 JSR $557b ; (crt_fmul8 + 0)
552d : 38 __ __ SEC
552e : a5 0b __ LDA WORK + 8 
5530 : 30 06 __ BMI $5538 ; (crt_fmul + 87)
5532 : 06 09 __ ASL WORK + 6 
5534 : 26 0a __ ROL WORK + 7 
5536 : 2a __ __ ROL
5537 : 18 __ __ CLC
5538 : 29 7f __ AND #$7f
553a : 85 0b __ STA WORK + 8 
553c : a5 07 __ LDA WORK + 4 
553e : 65 08 __ ADC WORK + 5 
5540 : 90 19 __ BCC $555b ; (crt_fmul + 122)
5542 : e9 7f __ SBC #$7f
5544 : b0 04 __ BCS $554a ; (crt_fmul + 105)
5546 : c9 ff __ CMP #$ff
5548 : d0 15 __ BNE $555f ; (crt_fmul + 126)
554a : a5 1e __ LDA ACCU + 3 
554c : 09 7f __ ORA #$7f
554e : 85 1e __ STA ACCU + 3 
5550 : a9 80 __ LDA #$80
5552 : 85 1d __ STA ACCU + 2 
5554 : a9 00 __ LDA #$00
5556 : 85 1b __ STA ACCU + 0 
5558 : 85 1c __ STA ACCU + 1 
555a : 60 __ __ RTS
555b : e9 7e __ SBC #$7e
555d : 90 15 __ BCC $5574 ; (crt_fmul + 147)
555f : 4a __ __ LSR
5560 : 05 1e __ ORA ACCU + 3 
5562 : 85 1e __ STA ACCU + 3 
5564 : a9 00 __ LDA #$00
5566 : 6a __ __ ROR
5567 : 05 0b __ ORA WORK + 8 
5569 : 85 1d __ STA ACCU + 2 
556b : a5 0a __ LDA WORK + 7 
556d : 85 1c __ STA ACCU + 1 
556f : a5 09 __ LDA WORK + 6 
5571 : 85 1b __ STA ACCU + 0 
5573 : 60 __ __ RTS
5574 : a9 00 __ LDA #$00
5576 : 85 1e __ STA ACCU + 3 
5578 : f0 d8 __ BEQ $5552 ; (crt_fmul + 113)
557a : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
557b : 38 __ __ SEC
557c : 6a __ __ ROR
557d : 90 1e __ BCC $559d ; (crt_fmul8 + 34)
557f : aa __ __ TAX
5580 : 18 __ __ CLC
5581 : 98 __ __ TYA
5582 : 65 09 __ ADC WORK + 6 
5584 : 85 09 __ STA WORK + 6 
5586 : a5 0a __ LDA WORK + 7 
5588 : 65 1c __ ADC ACCU + 1 
558a : 85 0a __ STA WORK + 7 
558c : a5 0b __ LDA WORK + 8 
558e : 65 1d __ ADC ACCU + 2 
5590 : 6a __ __ ROR
5591 : 85 0b __ STA WORK + 8 
5593 : 8a __ __ TXA
5594 : 66 0a __ ROR WORK + 7 
5596 : 66 09 __ ROR WORK + 6 
5598 : 4a __ __ LSR
5599 : f0 0d __ BEQ $55a8 ; (crt_fmul8 + 45)
559b : b0 e2 __ BCS $557f ; (crt_fmul8 + 4)
559d : 66 0b __ ROR WORK + 8 
559f : 66 0a __ ROR WORK + 7 
55a1 : 66 09 __ ROR WORK + 6 
55a3 : 4a __ __ LSR
55a4 : 90 f7 __ BCC $559d ; (crt_fmul8 + 34)
55a6 : d0 d7 __ BNE $557f ; (crt_fmul8 + 4)
55a8 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
55a9 : a5 1b __ LDA ACCU + 0 
55ab : 05 1c __ ORA ACCU + 1 
55ad : 05 1d __ ORA ACCU + 2 
55af : d0 03 __ BNE $55b4 ; (crt_fdiv + 11)
55b1 : 85 1e __ STA ACCU + 3 
55b3 : 60 __ __ RTS
55b4 : a5 1e __ LDA ACCU + 3 
55b6 : 45 06 __ EOR WORK + 3 
55b8 : 29 80 __ AND #$80
55ba : 85 1e __ STA ACCU + 3 
55bc : a5 08 __ LDA WORK + 5 
55be : f0 62 __ BEQ $5622 ; (crt_fdiv + 121)
55c0 : a5 07 __ LDA WORK + 4 
55c2 : c9 ff __ CMP #$ff
55c4 : f0 5c __ BEQ $5622 ; (crt_fdiv + 121)
55c6 : a9 00 __ LDA #$00
55c8 : 85 09 __ STA WORK + 6 
55ca : 85 0a __ STA WORK + 7 
55cc : 85 0b __ STA WORK + 8 
55ce : a2 18 __ LDX #$18
55d0 : a5 1b __ LDA ACCU + 0 
55d2 : c5 03 __ CMP WORK + 0 
55d4 : a5 1c __ LDA ACCU + 1 
55d6 : e5 04 __ SBC WORK + 1 
55d8 : a5 1d __ LDA ACCU + 2 
55da : e5 05 __ SBC WORK + 2 
55dc : 90 13 __ BCC $55f1 ; (crt_fdiv + 72)
55de : a5 1b __ LDA ACCU + 0 
55e0 : e5 03 __ SBC WORK + 0 
55e2 : 85 1b __ STA ACCU + 0 
55e4 : a5 1c __ LDA ACCU + 1 
55e6 : e5 04 __ SBC WORK + 1 
55e8 : 85 1c __ STA ACCU + 1 
55ea : a5 1d __ LDA ACCU + 2 
55ec : e5 05 __ SBC WORK + 2 
55ee : 85 1d __ STA ACCU + 2 
55f0 : 38 __ __ SEC
55f1 : 26 09 __ ROL WORK + 6 
55f3 : 26 0a __ ROL WORK + 7 
55f5 : 26 0b __ ROL WORK + 8 
55f7 : ca __ __ DEX
55f8 : f0 0a __ BEQ $5604 ; (crt_fdiv + 91)
55fa : 06 1b __ ASL ACCU + 0 
55fc : 26 1c __ ROL ACCU + 1 
55fe : 26 1d __ ROL ACCU + 2 
5600 : b0 dc __ BCS $55de ; (crt_fdiv + 53)
5602 : 90 cc __ BCC $55d0 ; (crt_fdiv + 39)
5604 : 38 __ __ SEC
5605 : a5 0b __ LDA WORK + 8 
5607 : 30 06 __ BMI $560f ; (crt_fdiv + 102)
5609 : 06 09 __ ASL WORK + 6 
560b : 26 0a __ ROL WORK + 7 
560d : 2a __ __ ROL
560e : 18 __ __ CLC
560f : 29 7f __ AND #$7f
5611 : 85 0b __ STA WORK + 8 
5613 : a5 07 __ LDA WORK + 4 
5615 : e5 08 __ SBC WORK + 5 
5617 : 90 1a __ BCC $5633 ; (crt_fdiv + 138)
5619 : 18 __ __ CLC
561a : 69 7f __ ADC #$7f
561c : b0 04 __ BCS $5622 ; (crt_fdiv + 121)
561e : c9 ff __ CMP #$ff
5620 : d0 15 __ BNE $5637 ; (crt_fdiv + 142)
5622 : a5 1e __ LDA ACCU + 3 
5624 : 09 7f __ ORA #$7f
5626 : 85 1e __ STA ACCU + 3 
5628 : a9 80 __ LDA #$80
562a : 85 1d __ STA ACCU + 2 
562c : a9 00 __ LDA #$00
562e : 85 1c __ STA ACCU + 1 
5630 : 85 1b __ STA ACCU + 0 
5632 : 60 __ __ RTS
5633 : 69 7f __ ADC #$7f
5635 : 90 15 __ BCC $564c ; (crt_fdiv + 163)
5637 : 4a __ __ LSR
5638 : 05 1e __ ORA ACCU + 3 
563a : 85 1e __ STA ACCU + 3 
563c : a9 00 __ LDA #$00
563e : 6a __ __ ROR
563f : 05 0b __ ORA WORK + 8 
5641 : 85 1d __ STA ACCU + 2 
5643 : a5 0a __ LDA WORK + 7 
5645 : 85 1c __ STA ACCU + 1 
5647 : a5 09 __ LDA WORK + 6 
5649 : 85 1b __ STA ACCU + 0 
564b : 60 __ __ RTS
564c : a9 00 __ LDA #$00
564e : 85 1e __ STA ACCU + 3 
5650 : 85 1d __ STA ACCU + 2 
5652 : 85 1c __ STA ACCU + 1 
5654 : 85 1b __ STA ACCU + 0 
5656 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
5657 : a0 00 __ LDY #$00
5659 : 84 06 __ STY WORK + 3 
565b : a5 03 __ LDA WORK + 0 
565d : a6 04 __ LDX WORK + 1 
565f : f0 1c __ BEQ $567d ; (mul16 + 38)
5661 : 38 __ __ SEC
5662 : 6a __ __ ROR
5663 : 90 0d __ BCC $5672 ; (mul16 + 27)
5665 : aa __ __ TAX
5666 : 18 __ __ CLC
5667 : 98 __ __ TYA
5668 : 65 1b __ ADC ACCU + 0 
566a : a8 __ __ TAY
566b : a5 06 __ LDA WORK + 3 
566d : 65 1c __ ADC ACCU + 1 
566f : 85 06 __ STA WORK + 3 
5671 : 8a __ __ TXA
5672 : 06 1b __ ASL ACCU + 0 
5674 : 26 1c __ ROL ACCU + 1 
5676 : 4a __ __ LSR
5677 : 90 f9 __ BCC $5672 ; (mul16 + 27)
5679 : d0 ea __ BNE $5665 ; (mul16 + 14)
567b : a5 04 __ LDA WORK + 1 
567d : 4a __ __ LSR
567e : 90 0d __ BCC $568d ; (mul16 + 54)
5680 : aa __ __ TAX
5681 : 18 __ __ CLC
5682 : 98 __ __ TYA
5683 : 65 1b __ ADC ACCU + 0 
5685 : a8 __ __ TAY
5686 : a5 06 __ LDA WORK + 3 
5688 : 65 1c __ ADC ACCU + 1 
568a : 85 06 __ STA WORK + 3 
568c : 8a __ __ TXA
568d : 06 1b __ ASL ACCU + 0 
568f : 26 1c __ ROL ACCU + 1 
5691 : 4a __ __ LSR
5692 : b0 ec __ BCS $5680 ; (mul16 + 41)
5694 : d0 f7 __ BNE $568d ; (mul16 + 54)
5696 : 84 05 __ STY WORK + 2 
5698 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
5699 : 24 1c __ BIT ACCU + 1 
569b : 10 0d __ BPL $56aa ; (divs16 + 17)
569d : 20 b7 56 JSR $56b7 ; (negaccu + 0)
56a0 : 24 04 __ BIT WORK + 1 
56a2 : 10 0d __ BPL $56b1 ; (divs16 + 24)
56a4 : 20 c5 56 JSR $56c5 ; (negtmp + 0)
56a7 : 4c d3 56 JMP $56d3 ; (divmod + 0)
56aa : 24 04 __ BIT WORK + 1 
56ac : 10 f9 __ BPL $56a7 ; (divs16 + 14)
56ae : 20 c5 56 JSR $56c5 ; (negtmp + 0)
56b1 : 20 d3 56 JSR $56d3 ; (divmod + 0)
56b4 : 4c b7 56 JMP $56b7 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
56b7 : 38 __ __ SEC
56b8 : a9 00 __ LDA #$00
56ba : e5 1b __ SBC ACCU + 0 
56bc : 85 1b __ STA ACCU + 0 
56be : a9 00 __ LDA #$00
56c0 : e5 1c __ SBC ACCU + 1 
56c2 : 85 1c __ STA ACCU + 1 
56c4 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
56c5 : 38 __ __ SEC
56c6 : a9 00 __ LDA #$00
56c8 : e5 03 __ SBC WORK + 0 
56ca : 85 03 __ STA WORK + 0 
56cc : a9 00 __ LDA #$00
56ce : e5 04 __ SBC WORK + 1 
56d0 : 85 04 __ STA WORK + 1 
56d2 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
56d3 : a5 1c __ LDA ACCU + 1 
56d5 : d0 3b __ BNE $5712 ; (divmod + 63)
56d7 : a5 04 __ LDA WORK + 1 
56d9 : d0 1e __ BNE $56f9 ; (divmod + 38)
56db : 85 06 __ STA WORK + 3 
56dd : a2 04 __ LDX #$04
56df : 06 1b __ ASL ACCU + 0 
56e1 : 2a __ __ ROL
56e2 : c5 03 __ CMP WORK + 0 
56e4 : 90 02 __ BCC $56e8 ; (divmod + 21)
56e6 : e5 03 __ SBC WORK + 0 
56e8 : 26 1b __ ROL ACCU + 0 
56ea : 2a __ __ ROL
56eb : c5 03 __ CMP WORK + 0 
56ed : 90 02 __ BCC $56f1 ; (divmod + 30)
56ef : e5 03 __ SBC WORK + 0 
56f1 : 26 1b __ ROL ACCU + 0 
56f3 : ca __ __ DEX
56f4 : d0 eb __ BNE $56e1 ; (divmod + 14)
56f6 : 85 05 __ STA WORK + 2 
56f8 : 60 __ __ RTS
56f9 : a5 1b __ LDA ACCU + 0 
56fb : 85 05 __ STA WORK + 2 
56fd : a5 1c __ LDA ACCU + 1 
56ff : 85 06 __ STA WORK + 3 
5701 : a9 00 __ LDA #$00
5703 : 85 1b __ STA ACCU + 0 
5705 : 85 1c __ STA ACCU + 1 
5707 : 60 __ __ RTS
5708 : 85 03 __ STA WORK + 0 
570a : a9 00 __ LDA #$00
570c : 85 04 __ STA WORK + 1 
570e : a5 1c __ LDA ACCU + 1 
5710 : f0 c9 __ BEQ $56db ; (divmod + 8)
5712 : a5 04 __ LDA WORK + 1 
5714 : d0 1f __ BNE $5735 ; (divmod + 98)
5716 : a5 03 __ LDA WORK + 0 
5718 : 30 1b __ BMI $5735 ; (divmod + 98)
571a : a9 00 __ LDA #$00
571c : 85 06 __ STA WORK + 3 
571e : a2 10 __ LDX #$10
5720 : 06 1b __ ASL ACCU + 0 
5722 : 26 1c __ ROL ACCU + 1 
5724 : 2a __ __ ROL
5725 : c5 03 __ CMP WORK + 0 
5727 : 90 02 __ BCC $572b ; (divmod + 88)
5729 : e5 03 __ SBC WORK + 0 
572b : 26 1b __ ROL ACCU + 0 
572d : 26 1c __ ROL ACCU + 1 
572f : ca __ __ DEX
5730 : d0 f2 __ BNE $5724 ; (divmod + 81)
5732 : 85 05 __ STA WORK + 2 
5734 : 60 __ __ RTS
5735 : a9 00 __ LDA #$00
5737 : 85 05 __ STA WORK + 2 
5739 : 85 06 __ STA WORK + 3 
573b : a0 10 __ LDY #$10
573d : 18 __ __ CLC
573e : 26 1b __ ROL ACCU + 0 
5740 : 26 1c __ ROL ACCU + 1 
5742 : 26 05 __ ROL WORK + 2 
5744 : 26 06 __ ROL WORK + 3 
5746 : 38 __ __ SEC
5747 : a5 05 __ LDA WORK + 2 
5749 : e5 03 __ SBC WORK + 0 
574b : aa __ __ TAX
574c : a5 06 __ LDA WORK + 3 
574e : e5 04 __ SBC WORK + 1 
5750 : 90 04 __ BCC $5756 ; (divmod + 131)
5752 : 86 05 __ STX WORK + 2 
5754 : 85 06 __ STA WORK + 3 
5756 : 88 __ __ DEY
5757 : d0 e5 __ BNE $573e ; (divmod + 107)
5759 : 26 1b __ ROL ACCU + 0 
575b : 26 1c __ ROL ACCU + 1 
575d : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
575e : 24 1c __ BIT ACCU + 1 
5760 : 10 10 __ BPL $5772 ; (mods16 + 20)
5762 : 20 b7 56 JSR $56b7 ; (negaccu + 0)
5765 : 24 04 __ BIT WORK + 1 
5767 : 10 03 __ BPL $576c ; (mods16 + 14)
5769 : 20 c5 56 JSR $56c5 ; (negtmp + 0)
576c : 20 d3 56 JSR $56d3 ; (divmod + 0)
576f : 4c 7d 57 JMP $577d ; (negtmpb + 0)
5772 : 24 04 __ BIT WORK + 1 
5774 : 10 03 __ BPL $5779 ; (mods16 + 27)
5776 : 20 c5 56 JSR $56c5 ; (negtmp + 0)
5779 : 4c d3 56 JMP $56d3 ; (divmod + 0)
577c : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
577d : 38 __ __ SEC
577e : a9 00 __ LDA #$00
5780 : e5 05 __ SBC WORK + 2 
5782 : 85 05 __ STA WORK + 2 
5784 : a9 00 __ LDA #$00
5786 : e5 06 __ SBC WORK + 3 
5788 : 85 06 __ STA WORK + 3 
578a : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
578b : 20 d3 53 JSR $53d3 ; (freg + 36)
578e : a5 07 __ LDA WORK + 4 
5790 : c9 7f __ CMP #$7f
5792 : b0 07 __ BCS $579b ; (f32_to_i16 + 16)
5794 : a9 00 __ LDA #$00
5796 : 85 1b __ STA ACCU + 0 
5798 : 85 1c __ STA ACCU + 1 
579a : 60 __ __ RTS
579b : e9 8e __ SBC #$8e
579d : 90 16 __ BCC $57b5 ; (f32_to_i16 + 42)
579f : 24 1e __ BIT ACCU + 3 
57a1 : 30 09 __ BMI $57ac ; (f32_to_i16 + 33)
57a3 : a9 ff __ LDA #$ff
57a5 : 85 1b __ STA ACCU + 0 
57a7 : a9 7f __ LDA #$7f
57a9 : 85 1c __ STA ACCU + 1 
57ab : 60 __ __ RTS
57ac : a9 00 __ LDA #$00
57ae : 85 1b __ STA ACCU + 0 
57b0 : a9 80 __ LDA #$80
57b2 : 85 1c __ STA ACCU + 1 
57b4 : 60 __ __ RTS
57b5 : aa __ __ TAX
57b6 : a5 1c __ LDA ACCU + 1 
57b8 : 46 1d __ LSR ACCU + 2 
57ba : 6a __ __ ROR
57bb : e8 __ __ INX
57bc : d0 fa __ BNE $57b8 ; (f32_to_i16 + 45)
57be : 24 1e __ BIT ACCU + 3 
57c0 : 10 0e __ BPL $57d0 ; (f32_to_i16 + 69)
57c2 : 38 __ __ SEC
57c3 : 49 ff __ EOR #$ff
57c5 : 69 00 __ ADC #$00
57c7 : 85 1b __ STA ACCU + 0 
57c9 : a9 00 __ LDA #$00
57cb : e5 1d __ SBC ACCU + 2 
57cd : 85 1c __ STA ACCU + 1 
57cf : 60 __ __ RTS
57d0 : 85 1b __ STA ACCU + 0 
57d2 : a5 1d __ LDA ACCU + 2 
57d4 : 85 1c __ STA ACCU + 1 
57d6 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
57d7 : 24 1c __ BIT ACCU + 1 
57d9 : 30 03 __ BMI $57de ; (sint16_to_float + 7)
57db : 4c f5 57 JMP $57f5 ; (uint16_to_float + 0)
57de : 38 __ __ SEC
57df : a9 00 __ LDA #$00
57e1 : e5 1b __ SBC ACCU + 0 
57e3 : 85 1b __ STA ACCU + 0 
57e5 : a9 00 __ LDA #$00
57e7 : e5 1c __ SBC ACCU + 1 
57e9 : 85 1c __ STA ACCU + 1 
57eb : 20 f5 57 JSR $57f5 ; (uint16_to_float + 0)
57ee : a5 1e __ LDA ACCU + 3 
57f0 : 09 80 __ ORA #$80
57f2 : 85 1e __ STA ACCU + 3 
57f4 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
57f5 : a5 1b __ LDA ACCU + 0 
57f7 : 05 1c __ ORA ACCU + 1 
57f9 : d0 05 __ BNE $5800 ; (uint16_to_float + 11)
57fb : 85 1d __ STA ACCU + 2 
57fd : 85 1e __ STA ACCU + 3 
57ff : 60 __ __ RTS
5800 : a2 8e __ LDX #$8e
5802 : a5 1c __ LDA ACCU + 1 
5804 : 30 06 __ BMI $580c ; (uint16_to_float + 23)
5806 : ca __ __ DEX
5807 : 06 1b __ ASL ACCU + 0 
5809 : 2a __ __ ROL
580a : 10 fa __ BPL $5806 ; (uint16_to_float + 17)
580c : 0a __ __ ASL
580d : 85 1d __ STA ACCU + 2 
580f : a5 1b __ LDA ACCU + 0 
5811 : 85 1c __ STA ACCU + 1 
5813 : 8a __ __ TXA
5814 : 4a __ __ LSR
5815 : 85 1e __ STA ACCU + 3 
5817 : a9 00 __ LDA #$00
5819 : 85 1b __ STA ACCU + 0 
581b : 66 1d __ ROR ACCU + 2 
581d : 60 __ __ RTS
--------------------------------------------------------------------
sint32_to_float: ; sint32_to_float
581e : 24 1e __ BIT ACCU + 3 
5820 : 30 03 __ BMI $5825 ; (sint32_to_float + 7)
5822 : 4c 48 58 JMP $5848 ; (uint32_to_float + 0)
5825 : 38 __ __ SEC
5826 : a9 00 __ LDA #$00
5828 : e5 1b __ SBC ACCU + 0 
582a : 85 1b __ STA ACCU + 0 
582c : a9 00 __ LDA #$00
582e : e5 1c __ SBC ACCU + 1 
5830 : 85 1c __ STA ACCU + 1 
5832 : a9 00 __ LDA #$00
5834 : e5 1d __ SBC ACCU + 2 
5836 : 85 1d __ STA ACCU + 2 
5838 : a9 00 __ LDA #$00
583a : e5 1e __ SBC ACCU + 3 
583c : 85 1e __ STA ACCU + 3 
583e : 20 48 58 JSR $5848 ; (uint32_to_float + 0)
5841 : a5 1e __ LDA ACCU + 3 
5843 : 09 80 __ ORA #$80
5845 : 85 1e __ STA ACCU + 3 
5847 : 60 __ __ RTS
--------------------------------------------------------------------
uint32_to_float: ; uint32_to_float
5848 : a5 1b __ LDA ACCU + 0 
584a : 05 1c __ ORA ACCU + 1 
584c : 05 1d __ ORA ACCU + 2 
584e : 05 1e __ ORA ACCU + 3 
5850 : d0 01 __ BNE $5853 ; (uint32_to_float + 11)
5852 : 60 __ __ RTS
5853 : a2 9e __ LDX #$9e
5855 : a5 1e __ LDA ACCU + 3 
5857 : 30 0a __ BMI $5863 ; (uint32_to_float + 27)
5859 : ca __ __ DEX
585a : 06 1b __ ASL ACCU + 0 
585c : 26 1c __ ROL ACCU + 1 
585e : 26 1d __ ROL ACCU + 2 
5860 : 2a __ __ ROL
5861 : 10 f6 __ BPL $5859 ; (uint32_to_float + 17)
5863 : 24 1b __ BIT ACCU + 0 
5865 : 10 13 __ BPL $587a ; (uint32_to_float + 50)
5867 : e6 1c __ INC ACCU + 1 
5869 : d0 0f __ BNE $587a ; (uint32_to_float + 50)
586b : e6 1d __ INC ACCU + 2 
586d : d0 0b __ BNE $587a ; (uint32_to_float + 50)
586f : 18 __ __ CLC
5870 : 69 01 __ ADC #$01
5872 : 90 06 __ BCC $587a ; (uint32_to_float + 50)
5874 : 4a __ __ LSR
5875 : 66 1d __ ROR ACCU + 2 
5877 : 66 1c __ ROR ACCU + 1 
5879 : e8 __ __ INX
587a : 0a __ __ ASL
587b : a4 1c __ LDY ACCU + 1 
587d : 84 1b __ STY ACCU + 0 
587f : a4 1d __ LDY ACCU + 2 
5881 : 84 1c __ STY ACCU + 1 
5883 : 85 1d __ STA ACCU + 2 
5885 : 8a __ __ TXA
5886 : 4a __ __ LSR
5887 : 85 1e __ STA ACCU + 3 
5889 : 66 1d __ ROR ACCU + 2 
588b : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
588c : a5 04 __ LDA WORK + 1 
588e : 05 05 __ ORA WORK + 2 
5890 : 05 06 __ ORA WORK + 3 
5892 : d0 05 __ BNE $5899 ; (mul32 + 13)
5894 : a5 03 __ LDA WORK + 0 
5896 : 4c 79 53 JMP $5379 ; (mul32by8 + 0)
5899 : a0 00 __ LDY #$00
589b : 84 07 __ STY WORK + 4 
589d : 84 08 __ STY WORK + 5 
589f : 98 __ __ TYA
58a0 : 38 __ __ SEC
58a1 : 66 03 __ ROR WORK + 0 
58a3 : 90 15 __ BCC $58ba ; (mul32 + 46)
58a5 : aa __ __ TAX
58a6 : 18 __ __ CLC
58a7 : a5 07 __ LDA WORK + 4 
58a9 : 65 1b __ ADC ACCU + 0 
58ab : 85 07 __ STA WORK + 4 
58ad : a5 08 __ LDA WORK + 5 
58af : 65 1c __ ADC ACCU + 1 
58b1 : 85 08 __ STA WORK + 5 
58b3 : 98 __ __ TYA
58b4 : 65 1d __ ADC ACCU + 2 
58b6 : a8 __ __ TAY
58b7 : 8a __ __ TXA
58b8 : 65 1e __ ADC ACCU + 3 
58ba : 46 04 __ LSR WORK + 1 
58bc : 90 0f __ BCC $58cd ; (mul32 + 65)
58be : aa __ __ TAX
58bf : 18 __ __ CLC
58c0 : a5 08 __ LDA WORK + 5 
58c2 : 65 1b __ ADC ACCU + 0 
58c4 : 85 08 __ STA WORK + 5 
58c6 : 98 __ __ TYA
58c7 : 65 1c __ ADC ACCU + 1 
58c9 : a8 __ __ TAY
58ca : 8a __ __ TXA
58cb : 65 1d __ ADC ACCU + 2 
58cd : 46 05 __ LSR WORK + 2 
58cf : 90 09 __ BCC $58da ; (mul32 + 78)
58d1 : aa __ __ TAX
58d2 : 18 __ __ CLC
58d3 : 98 __ __ TYA
58d4 : 65 1b __ ADC ACCU + 0 
58d6 : a8 __ __ TAY
58d7 : 8a __ __ TXA
58d8 : 65 1c __ ADC ACCU + 1 
58da : 46 06 __ LSR WORK + 3 
58dc : 90 03 __ BCC $58e1 ; (mul32 + 85)
58de : 18 __ __ CLC
58df : 65 1b __ ADC ACCU + 0 
58e1 : 06 1b __ ASL ACCU + 0 
58e3 : 26 1c __ ROL ACCU + 1 
58e5 : 26 1d __ ROL ACCU + 2 
58e7 : 26 1e __ ROL ACCU + 3 
58e9 : 46 03 __ LSR WORK + 0 
58eb : 90 cd __ BCC $58ba ; (mul32 + 46)
58ed : d0 b6 __ BNE $58a5 ; (mul32 + 25)
58ef : 84 09 __ STY WORK + 6 
58f1 : 85 0a __ STA WORK + 7 
58f3 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
58f4 : 24 1e __ BIT ACCU + 3 
58f6 : 10 0d __ BPL $5905 ; (divs32 + 17)
58f8 : 20 12 59 JSR $5912 ; (negaccu32 + 0)
58fb : 24 06 __ BIT WORK + 3 
58fd : 10 0d __ BPL $590c ; (divs32 + 24)
58ff : 20 2c 59 JSR $592c ; (negtmp32 + 0)
5902 : 4c 46 59 JMP $5946 ; (divmod32 + 0)
5905 : 24 06 __ BIT WORK + 3 
5907 : 10 f9 __ BPL $5902 ; (divs32 + 14)
5909 : 20 2c 59 JSR $592c ; (negtmp32 + 0)
590c : 20 46 59 JSR $5946 ; (divmod32 + 0)
590f : 4c 12 59 JMP $5912 ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
5912 : 38 __ __ SEC
5913 : a9 00 __ LDA #$00
5915 : e5 1b __ SBC ACCU + 0 
5917 : 85 1b __ STA ACCU + 0 
5919 : a9 00 __ LDA #$00
591b : e5 1c __ SBC ACCU + 1 
591d : 85 1c __ STA ACCU + 1 
591f : a9 00 __ LDA #$00
5921 : e5 1d __ SBC ACCU + 2 
5923 : 85 1d __ STA ACCU + 2 
5925 : a9 00 __ LDA #$00
5927 : e5 1e __ SBC ACCU + 3 
5929 : 85 1e __ STA ACCU + 3 
592b : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
592c : 38 __ __ SEC
592d : a9 00 __ LDA #$00
592f : e5 03 __ SBC WORK + 0 
5931 : 85 03 __ STA WORK + 0 
5933 : a9 00 __ LDA #$00
5935 : e5 04 __ SBC WORK + 1 
5937 : 85 04 __ STA WORK + 1 
5939 : a9 00 __ LDA #$00
593b : e5 05 __ SBC WORK + 2 
593d : 85 05 __ STA WORK + 2 
593f : a9 00 __ LDA #$00
5941 : e5 06 __ SBC WORK + 3 
5943 : 85 06 __ STA WORK + 3 
5945 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
5946 : a9 00 __ LDA #$00
5948 : 85 07 __ STA WORK + 4 
594a : 85 08 __ STA WORK + 5 
594c : 85 09 __ STA WORK + 6 
594e : 85 0a __ STA WORK + 7 
5950 : a5 05 __ LDA WORK + 2 
5952 : 05 06 __ ORA WORK + 3 
5954 : f0 4b __ BEQ $59a1 ; (divmod32 + 91)
5956 : a0 10 __ LDY #$10
5958 : a5 1e __ LDA ACCU + 3 
595a : 85 08 __ STA WORK + 5 
595c : a5 1d __ LDA ACCU + 2 
595e : 85 07 __ STA WORK + 4 
5960 : a9 00 __ LDA #$00
5962 : 85 1d __ STA ACCU + 2 
5964 : 85 1e __ STA ACCU + 3 
5966 : 18 __ __ CLC
5967 : 26 1b __ ROL ACCU + 0 
5969 : 26 1c __ ROL ACCU + 1 
596b : 26 07 __ ROL WORK + 4 
596d : 26 08 __ ROL WORK + 5 
596f : 26 09 __ ROL WORK + 6 
5971 : 26 0a __ ROL WORK + 7 
5973 : a5 07 __ LDA WORK + 4 
5975 : c5 03 __ CMP WORK + 0 
5977 : a5 08 __ LDA WORK + 5 
5979 : e5 04 __ SBC WORK + 1 
597b : a5 09 __ LDA WORK + 6 
597d : e5 05 __ SBC WORK + 2 
597f : aa __ __ TAX
5980 : a5 0a __ LDA WORK + 7 
5982 : e5 06 __ SBC WORK + 3 
5984 : 90 11 __ BCC $5997 ; (divmod32 + 81)
5986 : 86 09 __ STX WORK + 6 
5988 : 85 0a __ STA WORK + 7 
598a : a5 07 __ LDA WORK + 4 
598c : e5 03 __ SBC WORK + 0 
598e : 85 07 __ STA WORK + 4 
5990 : a5 08 __ LDA WORK + 5 
5992 : e5 04 __ SBC WORK + 1 
5994 : 85 08 __ STA WORK + 5 
5996 : 38 __ __ SEC
5997 : 88 __ __ DEY
5998 : d0 cd __ BNE $5967 ; (divmod32 + 33)
599a : 26 1b __ ROL ACCU + 0 
599c : 26 1c __ ROL ACCU + 1 
599e : a4 02 __ LDY $02 
59a0 : 60 __ __ RTS
59a1 : a5 1d __ LDA ACCU + 2 
59a3 : 05 1e __ ORA ACCU + 3 
59a5 : d0 0c __ BNE $59b3 ; (divmod32 + 109)
59a7 : 20 d3 56 JSR $56d3 ; (divmod + 0)
59aa : a5 05 __ LDA WORK + 2 
59ac : 85 07 __ STA WORK + 4 
59ae : a5 06 __ LDA WORK + 3 
59b0 : 85 08 __ STA WORK + 5 
59b2 : 60 __ __ RTS
59b3 : a0 20 __ LDY #$20
59b5 : a5 04 __ LDA WORK + 1 
59b7 : d0 27 __ BNE $59e0 ; (divmod32 + 154)
59b9 : 18 __ __ CLC
59ba : 26 1b __ ROL ACCU + 0 
59bc : 26 1c __ ROL ACCU + 1 
59be : 26 1d __ ROL ACCU + 2 
59c0 : 26 1e __ ROL ACCU + 3 
59c2 : 2a __ __ ROL
59c3 : 90 05 __ BCC $59ca ; (divmod32 + 132)
59c5 : e5 03 __ SBC WORK + 0 
59c7 : 38 __ __ SEC
59c8 : b0 06 __ BCS $59d0 ; (divmod32 + 138)
59ca : c5 03 __ CMP WORK + 0 
59cc : 90 02 __ BCC $59d0 ; (divmod32 + 138)
59ce : e5 03 __ SBC WORK + 0 
59d0 : 88 __ __ DEY
59d1 : d0 e7 __ BNE $59ba ; (divmod32 + 116)
59d3 : 85 07 __ STA WORK + 4 
59d5 : 26 1b __ ROL ACCU + 0 
59d7 : 26 1c __ ROL ACCU + 1 
59d9 : 26 1d __ ROL ACCU + 2 
59db : 26 1e __ ROL ACCU + 3 
59dd : a4 02 __ LDY $02 
59df : 60 __ __ RTS
59e0 : a5 1e __ LDA ACCU + 3 
59e2 : d0 10 __ BNE $59f4 ; (divmod32 + 174)
59e4 : a6 1d __ LDX ACCU + 2 
59e6 : 86 1e __ STX ACCU + 3 
59e8 : a6 1c __ LDX ACCU + 1 
59ea : 86 1d __ STX ACCU + 2 
59ec : a6 1b __ LDX ACCU + 0 
59ee : 86 1c __ STX ACCU + 1 
59f0 : 85 1b __ STA ACCU + 0 
59f2 : a0 18 __ LDY #$18
59f4 : 18 __ __ CLC
59f5 : 26 1b __ ROL ACCU + 0 
59f7 : 26 1c __ ROL ACCU + 1 
59f9 : 26 1d __ ROL ACCU + 2 
59fb : 26 1e __ ROL ACCU + 3 
59fd : 26 07 __ ROL WORK + 4 
59ff : 26 08 __ ROL WORK + 5 
5a01 : 90 0c __ BCC $5a0f ; (divmod32 + 201)
5a03 : a5 07 __ LDA WORK + 4 
5a05 : e5 03 __ SBC WORK + 0 
5a07 : aa __ __ TAX
5a08 : a5 08 __ LDA WORK + 5 
5a0a : e5 04 __ SBC WORK + 1 
5a0c : 38 __ __ SEC
5a0d : b0 0c __ BCS $5a1b ; (divmod32 + 213)
5a0f : 38 __ __ SEC
5a10 : a5 07 __ LDA WORK + 4 
5a12 : e5 03 __ SBC WORK + 0 
5a14 : aa __ __ TAX
5a15 : a5 08 __ LDA WORK + 5 
5a17 : e5 04 __ SBC WORK + 1 
5a19 : 90 04 __ BCC $5a1f ; (divmod32 + 217)
5a1b : 86 07 __ STX WORK + 4 
5a1d : 85 08 __ STA WORK + 5 
5a1f : 88 __ __ DEY
5a20 : d0 d3 __ BNE $59f5 ; (divmod32 + 175)
5a22 : 26 1b __ ROL ACCU + 0 
5a24 : 26 1c __ ROL ACCU + 1 
5a26 : 26 1d __ ROL ACCU + 2 
5a28 : 26 1e __ ROL ACCU + 3 
5a2a : a4 02 __ LDY $02 
5a2c : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
5a2d : 18 __ __ CLC
5a2e : a5 1b __ LDA ACCU + 0 
5a30 : 69 05 __ ADC #$05
5a32 : 29 fc __ AND #$fc
5a34 : 85 03 __ STA WORK + 0 
5a36 : a5 1c __ LDA ACCU + 1 
5a38 : 69 00 __ ADC #$00
5a3a : 85 04 __ STA WORK + 1 
5a3c : ad a4 76 LDA $76a4 ; (HeapNode.end + 0)
5a3f : d0 26 __ BNE $5a67 ; (crt_malloc + 58)
5a41 : a9 00 __ LDA #$00
5a43 : 8d aa 76 STA $76aa 
5a46 : 8d ab 76 STA $76ab 
5a49 : ee a4 76 INC $76a4 ; (HeapNode.end + 0)
5a4c : a9 a8 __ LDA #$a8
5a4e : 09 02 __ ORA #$02
5a50 : 8d a2 76 STA $76a2 ; (HeapNode.next + 0)
5a53 : a9 76 __ LDA #$76
5a55 : 8d a3 76 STA $76a3 ; (HeapNode.next + 1)
5a58 : 38 __ __ SEC
5a59 : a9 00 __ LDA #$00
5a5b : e9 02 __ SBC #$02
5a5d : 8d ac 76 STA $76ac 
5a60 : a9 bc __ LDA #$bc
5a62 : e9 00 __ SBC #$00
5a64 : 8d ad 76 STA $76ad 
5a67 : a9 a2 __ LDA #$a2
5a69 : a2 76 __ LDX #$76
5a6b : 85 1d __ STA ACCU + 2 
5a6d : 86 1e __ STX ACCU + 3 
5a6f : 18 __ __ CLC
5a70 : a0 00 __ LDY #$00
5a72 : b1 1d __ LDA (ACCU + 2),y 
5a74 : 85 1b __ STA ACCU + 0 
5a76 : 65 03 __ ADC WORK + 0 
5a78 : 85 05 __ STA WORK + 2 
5a7a : c8 __ __ INY
5a7b : b1 1d __ LDA (ACCU + 2),y 
5a7d : 85 1c __ STA ACCU + 1 
5a7f : f0 20 __ BEQ $5aa1 ; (crt_malloc + 116)
5a81 : 65 04 __ ADC WORK + 1 
5a83 : 85 06 __ STA WORK + 3 
5a85 : b0 14 __ BCS $5a9b ; (crt_malloc + 110)
5a87 : a0 02 __ LDY #$02
5a89 : b1 1b __ LDA (ACCU + 0),y 
5a8b : c5 05 __ CMP WORK + 2 
5a8d : c8 __ __ INY
5a8e : b1 1b __ LDA (ACCU + 0),y 
5a90 : e5 06 __ SBC WORK + 3 
5a92 : b0 0e __ BCS $5aa2 ; (crt_malloc + 117)
5a94 : a5 1b __ LDA ACCU + 0 
5a96 : a6 1c __ LDX ACCU + 1 
5a98 : 4c 6b 5a JMP $5a6b ; (crt_malloc + 62)
5a9b : a9 00 __ LDA #$00
5a9d : 85 1b __ STA ACCU + 0 
5a9f : 85 1c __ STA ACCU + 1 
5aa1 : 60 __ __ RTS
5aa2 : a5 05 __ LDA WORK + 2 
5aa4 : 85 07 __ STA WORK + 4 
5aa6 : a5 06 __ LDA WORK + 3 
5aa8 : 85 08 __ STA WORK + 5 
5aaa : a0 02 __ LDY #$02
5aac : a5 07 __ LDA WORK + 4 
5aae : d1 1b __ CMP (ACCU + 0),y 
5ab0 : d0 15 __ BNE $5ac7 ; (crt_malloc + 154)
5ab2 : c8 __ __ INY
5ab3 : a5 08 __ LDA WORK + 5 
5ab5 : d1 1b __ CMP (ACCU + 0),y 
5ab7 : d0 0e __ BNE $5ac7 ; (crt_malloc + 154)
5ab9 : a0 00 __ LDY #$00
5abb : b1 1b __ LDA (ACCU + 0),y 
5abd : 91 1d __ STA (ACCU + 2),y 
5abf : c8 __ __ INY
5ac0 : b1 1b __ LDA (ACCU + 0),y 
5ac2 : 91 1d __ STA (ACCU + 2),y 
5ac4 : 4c e4 5a JMP $5ae4 ; (crt_malloc + 183)
5ac7 : a0 00 __ LDY #$00
5ac9 : b1 1b __ LDA (ACCU + 0),y 
5acb : 91 07 __ STA (WORK + 4),y 
5acd : a5 07 __ LDA WORK + 4 
5acf : 91 1d __ STA (ACCU + 2),y 
5ad1 : c8 __ __ INY
5ad2 : b1 1b __ LDA (ACCU + 0),y 
5ad4 : 91 07 __ STA (WORK + 4),y 
5ad6 : a5 08 __ LDA WORK + 5 
5ad8 : 91 1d __ STA (ACCU + 2),y 
5ada : c8 __ __ INY
5adb : b1 1b __ LDA (ACCU + 0),y 
5add : 91 07 __ STA (WORK + 4),y 
5adf : c8 __ __ INY
5ae0 : b1 1b __ LDA (ACCU + 0),y 
5ae2 : 91 07 __ STA (WORK + 4),y 
5ae4 : a0 00 __ LDY #$00
5ae6 : a5 05 __ LDA WORK + 2 
5ae8 : 91 1b __ STA (ACCU + 0),y 
5aea : c8 __ __ INY
5aeb : a5 06 __ LDA WORK + 3 
5aed : 91 1b __ STA (ACCU + 0),y 
5aef : 18 __ __ CLC
5af0 : a5 1b __ LDA ACCU + 0 
5af2 : 69 02 __ ADC #$02
5af4 : 85 1b __ STA ACCU + 0 
5af6 : 90 02 __ BCC $5afa ; (crt_malloc + 205)
5af8 : e6 1c __ INC ACCU + 1 
5afa : 60 __ __ RTS
--------------------------------------------------------------------
plane_data_count:
5afb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
wireframeOn:
5afd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
fround5:
5b00 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
5b10 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
sin_tab:
5b1c : __ __ __ BYT 00 06 0b 10 16 1b 20 25 29 2d 31 34 37 3a 3c 3e : ...... %)-147:<>
5b2c : __ __ __ BYT 3f 40 40 40 3f 3e 3c 3a 37 34 31 2d 29 25 20 1b : ?@@@?><:741-)% .
5b3c : __ __ __ BYT 16 10 0b 06 00 fa f5 f0 ea e5 e0 db d7 d3 cf cc : ................
5b4c : __ __ __ BYT c9 c6 c4 c2 c1 c0 c0 c0 c1 c2 c4 c6 c9 cc cf d3 : ................
5b5c : __ __ __ BYT d7 db e0 e5 ea f0 f5 fa                         : ........
--------------------------------------------------------------------
drawing_mode:
5b64 : __ __ __ BYT 01 00                                           : ..
--------------------------------------------------------------------
PaintersOn:
5b66 : __ __ __ BYT 01 00                                           : ..
--------------------------------------------------------------------
borderOn:
5b68 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
bitshift:
5b6a : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
5b7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5b8a : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
5b9a : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
files:
5ba2 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
5baa : __ __ __ BSS	16
--------------------------------------------------------------------
c:
5bba : __ __ __ BSS	2
--------------------------------------------------------------------
d:
5bbc : __ __ __ BSS	2
--------------------------------------------------------------------
h:
5bbe : __ __ __ BSS	2
--------------------------------------------------------------------
u:
5bc0 : __ __ __ BSS	2
--------------------------------------------------------------------
x_pct:
5bc2 : __ __ __ BSS	2
--------------------------------------------------------------------
y_pct:
5bc4 : __ __ __ BSS	2
--------------------------------------------------------------------
z_pct:
5bc6 : __ __ __ BSS	2
--------------------------------------------------------------------
z_rotated:
5bc8 : __ __ __ BSS	2
--------------------------------------------------------------------
vx_pct:
5bca : __ __ __ BSS	2
--------------------------------------------------------------------
vy_pct:
5bcc : __ __ __ BSS	2
--------------------------------------------------------------------
u_array:
5bce : __ __ __ BSS	2
--------------------------------------------------------------------
a:
5bd0 : __ __ __ BSS	2
--------------------------------------------------------------------
bitmap:
5bd2 : __ __ __ BSS	4048
--------------------------------------------------------------------
bucket_head:
6ba2 : __ __ __ BSS	512
--------------------------------------------------------------------
face_offset:
6da2 : __ __ __ BSS	800
--------------------------------------------------------------------
face_next:
70c2 : __ __ __ BSS	800
--------------------------------------------------------------------
min_x:
73e2 : __ __ __ BSS	352
--------------------------------------------------------------------
max_x:
7542 : __ __ __ BSS	352
--------------------------------------------------------------------
HeapNode:
76a2 : __ __ __ BSS	4
