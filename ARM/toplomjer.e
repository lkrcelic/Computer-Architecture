# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/toplomjer.a
#
#
<1,0>	                      ; org 0x0
<2,0>	00000000  1C 00 00 EA ; b MAIN
<3,0>	                      ;
<4,0>	                      ; org 0x1C
<5,0>	                      ; ;provjera da li je temp spreman
<6,0>	0000001C  9C 80 9F E5 ; ldr r8, GPIO1
<7,0>	00000020  00 90 98 E5 ; ldr r9, [r8,#0]
<8,0>	00000024  40 00 19 E3 ; tst r9, #0b01000000
<9,0>	00000028  0D 00 00 0A ; beq NISTA
<10,0>	                      ; 
<11,0>	                      ;;ako je spreman ucitaj temp i pomjeni led
<12,0>	                      ;  ;ucitaj temp
<13,0>	0000002C  3F 90 09 E2 ; and r9, r9, #0b00111111
<14,0>	                      ; 
<15,0>	                      ; ;promjeni led
<16,0>	00000030  14 00 59 E3 ; cmp r9, #20
<17,0>	00000034  80 90 A0 33 ; movlo r9, #0b10000000
<18,0>	00000038  03 00 00 3A ; blo SKOK
<19,0>	0000003C  18 00 59 E3 ; cmp r9, #24
<20,0>	00000040  40 90 A0 33 ; movlo r9, #0b01000000
<21,0>	00000044  00 00 00 3A ; blo SKOK
<22,0>	00000048  20 90 A0 E3 ; mov r9, #0b00100000
<23,0>	                      ; 
<24,0>	                      ;SKOK
<25,0>	0000004C  70 A0 9F E5 ; ldr r10, GPIO2
<26,0>	00000050  00 90 8A E5 ; str r9, [r10,#0]
<27,0>	                      ;
<28,0>	                      ; ;dojavi da si procitao temp
<29,0>	00000054  80 90 89 E3 ; orr r9, r9, #0x80
<30,0>	00000058  00 90 88 E5 ; str r9, [r8,#0]
<31,0>	0000005C  7F 90 09 E2 ; and r9, r9, #0x7F
<32,0>	00000060  00 90 88 E5 ; str r9, [r8,#0]
<33,0>	                      ;
<34,0>	                      ;;restartiraj rtc
<35,0>	                      ;NISTA
<36,0>	00000064  50 80 9F E5 ; ldr r8, RTC
<37,0>	00000068  00 90 A0 E3 ; mov r9, #0
<38,0>	0000006C  0C 90 88 E5 ; str r9, [r8,#12] ;LR
<39,0>	00000070  08 90 88 E5 ; str r9, [r8,#8] ;STAT
<40,0>	                      ; 
<41,0>	                      ;
<42,0>	00000074  04 F0 5E E2 ; subs pc, lr, #4
<43,0>	                      ; 
<44,0>	                      ;
<45,0>	                      ;;r0 RTC
<46,0>	                      ;;r1 GPIO1
<47,0>	                      ;;r2 GPIO2
<48,0>	                      ;MAIN
<49,0>	                      ;;dozvoli fiq prekide
<50,0>	00000078  00 00 0F E1 ; mrs r0, cpsr
<51,0>	0000007C  40 00 C0 E3 ; bic r0, r0, #0b01000000
<52,0>	00000080  00 F0 29 E1 ; msr cpsr, r0
<53,0>	                      ;;inicijalizacija rtc-a
<54,0>	00000084  30 00 9F E5 ; ldr r0, RTC
<55,0>	00000088  28 10 A0 E3 ; mov r1, #40
<56,0>	0000008C  04 10 80 E5 ; str r1, [r0,#0x4] ;MR
<57,0>	00000090  00 10 A0 E3 ; mov r1, #0
<58,0>	00000094  0C 10 80 E5 ; str r1, [r0,#12] ;LR
<59,0>	00000098  01 10 A0 E3 ; mov r1, #1
<60,0>	0000009C  10 10 80 E5 ; str r1, [r0,#16] ;CR
<61,0>	                      ;
<62,0>	                      ;;inicijalizacija temp (GPIO1)
<63,0>	000000A0  18 10 9F E5 ; ldr r1, GPIO1
<64,0>	000000A4  80 20 A0 E3 ; mov r2, #0x80 ;samo ack izlaz
<65,0>	000000A8  08 20 81 E5 ; str r2, [r1,#8] ;PA_DDR 
<66,0>	                      ; 
<67,0>	                      ;;inicijalizacija ledica (GPIO2)
<68,0>	000000AC  10 20 9F E5 ; ldr r2, GPIO2
<69,0>	000000B0  E0 30 A0 E3 ; mov r3, #0b11100000 ;tri ledice izlaz
<70,0>	000000B4  08 30 82 E5 ; str r3, [r2,#8] ;PA_DDR 
<71,0>	                      ;
<72,0>	                      ;LOOP
<73,0>	000000B8  FE FF FF EA ; b LOOP
<74,0>	                      ;
<75,0>	                      ;
<76,0>	000000BC! 00 0E FF FF ;RTC dw 0xFFFF0E00
<77,0>	000000C0! 00 0F FF FF ;GPIO1 dw 0xFFFF0F00
<78,0>	000000C4! 00 0B FF FF ;GPIO2 dw 0xFFFF0B00
#
# Debug Data
#
.debug:

#
#
# Assembling: OK