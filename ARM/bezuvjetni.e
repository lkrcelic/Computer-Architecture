# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/bezuvjetni.a
#
#
<1,0>	00000000  50 DC A0 E3 ; mov sp, #0x5000
<2,0>	00000004  84 00 9F E5 ; ldr r0, GPIO ;adresa GPIO-a
<3,0>	00000008  84 40 9F E5 ; ldr r4, GPIO2 ;adresa GPIO2-a
<4,0>	0000000C  00 10 A0 E3 ; mov r1, #0 ;brojac
<5,0>	                      ; 
<6,0>	00000010  80 20 A0 E3 ; mov r2, #0b10000000
<7,0>	00000014  08 20 80 E5 ; str r2, [r0,#0x8] ;defiiraj ulaz izlaz, svi ulazni osim ACK
<8,0>	00000018  E0 20 A0 E3 ; mov r2, #0b11100000 ;samo tri diode izlazne
<9,0>	0000001C  08 20 84 E5 ; str r2, [r4, #0x8]
<10,0>	                      ;
<11,0>	00000020  20 20 A0 E3 ; mov r2, #0b00100000
<12,0>	00000024  00 20 84 E5 ; str r2, [r4, #0x0] ;postavi na crveno na pocetku
<13,0>	                      ;
<14,0>	                      ;;RAD PROGRAMA
<15,0>	                      ;;ucitava sa gpio PA i gleda kada je 6 bit (RDY) u jedinici
<16,0>	                      ;;kad je u jedinici ucitavamo temp i uzimamo samo prvih 6 bitova koje spremamo
<17,0>	                      ;;na adresu 1000 koju vecavamo pomocu brojaca, nakon toga stavimo ack u jedan ša 
<18,0>	                      ;;u nulu kao znak da može početi novo mjerenje
<19,0>	                      ;;pazi na ucitavanje i spremanje bajtova
<20,0>	                      ;
<21,0>	                      ;;r2 radni reg
<22,0>	                      ;PROG
<23,0>	00000028  C8 00 51 E3 ; cmp r1, #200
<24,0>	0000002C  0A 00 00 0A ; beq KRAJ
<25,0>	                      ;
<26,0>	00000030  00 20 90 E5 ; ldr r2, [r0,#0]
<27,0>	00000034  40 00 12 E3 ; tst r2, #0b01000000
<28,0>	00000038  08 00 00 1B ; blne SPREMI
<29,0>	                      ; 
<30,0>	0000003C  00 20 94 E5 ; ldr r2, [r4, #0x0]
<31,0>	00000040  20 00 12 E3 ; tst r2, #0b00100000
<32,0>	00000044  80 20 A0 13 ; movne r2, #0b10000000
<33,0>	00000048  01 00 00 1A ; bne SKOK
<34,0>	0000004C  80 00 12 E3 ; tst r2, #0b10000000
<35,0>	00000050  20 20 A0 13 ; movne r2, #0b00100000
<36,0>	                      ;SKOK
<37,0>	00000054  00 20 84 E5 ; str r2, [r4, #0x0]
<38,0>	                      ;
<39,0>	00000058  F2 FF FF EA ; b PROG 
<40,0>	                      ;
<41,0>	                      ;
<42,0>	                      ;KRAJ
<43,0>	0000005C  56 34 12 EF ; swi 0x123456
<44,0>	                      ;
<45,0>	                      ;
<46,0>	                      ;SPREMI
<47,0>	00000060  0C 00 2D E9 ; stmfd sp!, {r2-r3}
<48,0>	                      ; 
<49,0>	00000064  1F 30 A0 E3 ; mov r3, #0b11111
<50,0>	00000068  03 20 02 E0 ; and r2, r2, r3
<51,0>	0000006C  40 3D A0 E3 ; mov r3, #REZ
<52,0>	00000070  01 20 C3 E7 ; strb r2, [r3,r1] 
<53,0>	                      ;
<54,0>	                      ;IMPULS
<55,0>	00000074  80 20 82 E3 ; orr r2, r2, #0x80
<56,0>	00000078  00 20 80 E5 ; str r2, [r0,#0]
<57,0>	0000007C  7F 20 02 E2 ; and r2, r2, #0x7F
<58,0>	00000080  00 20 80 E5 ; str r2, [r0,#0]
<59,0>	                      ;        
<60,0>	00000084  01 10 81 E2 ; add r1, r1, #1
<61,0>	00000088  0C 00 BD E8 ; ldmfd sp!, {r2-r3}
<62,0>	0000008C  0E F0 A0 E1 ; mov pc, lr
<63,0>	                      ;
<64,0>	00000090! 00 0F FF FF ;GPIO dw 0xFFFF0F00
<65,0>	00000094! 00 0B FF FF ;GPIO2 dw 0xFFFF0B00
<66,0>	                      ;
<67,0>	                      ;
<68,0>	                      ; org 0x1000
<69,0>	                      ;REZ
<70,0>	00001000! 00 00 00 00 ; ds 200
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
<71,0>	                      ;
#
# Debug Data
#
.debug:
<1,0> <!64,0> <!70,0> 
#
#
# Assembling: OK