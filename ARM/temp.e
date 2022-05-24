# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/temp.a
#
#
<1,0>	00000000  40 DD A0 E3 ; mov sp,#0x1000
<2,0>	00000004  B0 00 9F E5 ; ldr r0, GPIO
<3,0>	00000008  C4 10 A0 E3 ; mov r1, #TEMP ;adresa rezultata
<4,0>	0000000C  AC 20 9F E5 ; ldr r2, KONST ;brojac
<5,0>	00000010  80 30 A0 E3 ; mov r3, #0b10000000 ; smjer vrata A, bit 7 je
<6,0>	00000014  08 30 80 E5 ; str r3, [r0, #0x8] ; izlazni, ostali su ulazni
<7,0>	                      ;
<8,0>	                      ;;r3 radni registar
<9,0>	                      ;PETlJA
<10,0>	00000018  14 00 52 E3 ; cmp r2, #20
<11,0>	0000001C  14 00 00 0A ; beq KRAJ
<12,0>	00000020  01 20 82 E2 ; add r2, r2, #1 
<13,0>	                      ; 
<14,0>	00000024  0D 30 A0 E3 ; mov r3, #0x0D
<15,0>	00000028  12 00 00 EB ; bl ISPIS 
<16,0>	                      ;
<17,0>	                      ;LOOP
<18,0>	0000002C  00 30 90 E5 ; ldr r3, [r0, #0]
<19,0>	00000030  40 00 13 E3 ; tst r3, #0b01000000
<20,0>	00000034  FC FF FF 0A ; beq LOOP
<21,0>	                      ; 
<22,0>	00000038  3F 30 03 E2 ; and r3, r3, #0b00111111
<23,0>	0000003C  02 30 C1 E7 ; strb r3, [r1,r2]
<24,0>	                      ; 
<25,0>	00000040  13 00 00 EB ; bl MOD10 ;vraća rez preko r3 i r4, r3 manje tezine
<26,0>	                      ; 
<27,0>	00000044  30 30 83 E2 ; add r3, r3, #48
<28,0>	00000048  0A 00 00 EB ; bl ISPIS
<29,0>	                      ;
<30,0>	0000004C  04 30 A0 E1 ; mov r3, r4
<31,0>	00000050  30 30 83 E2 ; add r3, r3, #48
<32,0>	00000054  07 00 00 EB ; bl ISPIS
<33,0>	                      ;
<34,0>	00000058  0A 30 A0 E3 ; mov r3, #0x0A
<35,0>	0000005C  05 00 00 EB ; bl ISPIS
<36,0>	                      ;
<37,0>	                      ;IMPULS ; kratki impuls na bitu 7 – potvrda da je podatak pročitan
<38,0>	00000060  80 30 83 E3 ; orr r3, r3, #0b10000000 ; digni bit 7 u jedan
<39,0>	00000064  00 30 80 E5 ; str r3, [r0, #0]
<40,0>	00000068  80 30 C3 E3 ; bic r3, r3, #0b10000000 ; vrati bit 7 u nulu 
<41,0>	0000006C  00 30 80 E5 ; str r3, [r0, #0]
<42,0>	                      ; 
<43,0>	00000070  E8 FF FF EA ; b PETLJA
<44,0>	                      ;
<45,0>	                      ;KRAJ
<46,0>	00000074  56 34 12 EF ; swi 0x123456
<47,0>	                      ;
<48,0>	                      ;ISPIS
<49,0>	00000078  7F 30 03 E2 ; and r3, r3, #0x7F
<50,0>	0000007C  04 30 C0 E5 ; strb r3, [r0,#4]
<51,0>	00000080  80 30 83 E3 ; orr r3, r3, #0x80
<52,0>	00000084  04 30 C0 E5 ; strb r3, [r0,#4]
<53,0>	00000088  7F 30 03 E2 ; and r3, r3, #0x7F
<54,0>	0000008C  04 30 C0 E5 ; strb r3, [r0,#4]
<55,0>	00000090  0E F0 A0 E1 ; mov pc, lr
<56,0>	                      ;
<57,0>	                      ;MOD10
<58,0>	00000094  07 00 2D E9 ; stmfd sp!, {r0-r2}
<59,0>	00000098  03 40 A0 E1 ; mov r4, r3
<60,0>	0000009C  00 30 A0 E3 ; mov r3, #0
<61,0>	                      ; 
<62,0>	                      ;ODUZMI
<63,0>	000000A0  0A 00 54 E3 ; cmp r4, #10
<64,0>	000000A4  02 00 00 3A ; blo VAN
<65,0>	000000A8  0A 40 44 E2 ; sub r4, r4, #10
<66,0>	000000AC  01 30 83 E2 ; add r3, r3, #1
<67,0>	000000B0  FA FF FF EA ; b ODUZMI
<68,0>	                      ; 
<69,0>	                      ;VAN
<70,0>	000000B4  07 00 BD E8 ; ldmfd sp!, {r0-r2}
<71,0>	000000B8  0E F0 A0 E1 ; mov pc, lr
<72,0>	                      ;
<73,0>	000000BC! 00 0F FF FF ;GPIO dw 0xFFFF0F00
<74,0>	000000C0! 00 00 00 00 ;KONST dw 0
<75,0>	                      ;TEMP
<76,0>	000000C4! 00 00 00 00 ; ds 20
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
#
# Debug Data
#
.debug:
<1,0> <!74,0> <!76,0> 
#
#
# Assembling: OK