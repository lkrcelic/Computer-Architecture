# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/gpio2.a
#
#
<1,0>	00000000  40 DD A0 E3 ; mov sp, #0x1000
<2,0>	00000004  40 0F A0 E3 ; mov r0, #0x100
<3,0>	00000008  00 00 90 E5 ; ldr r0, [r0]
<4,0>	                      ;
<5,0>	                      ;PRIKAZ
<6,0>	0000000C  0D 10 A0 E3 ; mov r1, #0x0D
<7,0>	00000010  3B 00 00 EB ; bl LCDWR
<8,0>	                      ; 
<9,0>	00000014  41 10 A0 E3 ; mov r1, #0x41 ; slanje znaka ‘A'
<10,0>	00000018  39 00 00 EB ; bl LCDWR
<11,0>	0000001C  52 10 A0 E3 ; mov r1, #0x52 ; slanje znaka ‘R'
<12,0>	00000020  37 00 00 EB ; bl LCDWR
<13,0>	00000024  4D 10 A0 E3 ; mov r1, #0x4D ; slanje znaka ‘M'
<14,0>	00000028  35 00 00 EB ; bl LCDWR
<15,0>	0000002C  0A 10 A0 E3 ; mov r1, #0x0A ;slanje LF-a
<16,0>	00000030  33 00 00 EB ; bl LCDWR
<17,0>	                      ; 
<18,0>	00000034  56 34 12 EF ; swi 0x123456
<19,0>	                      ;
<20,0>	                      ; org 0x100
<21,0>	00000100! 00 0F FF FF ; dw 0xFFFF0F00 ; adresa GPIO-a
<22,0>	                      ;
<23,0>	                      ;
<24,0>	                      ;LCDWR
<25,0>	00000104  02 00 2D E9 ; stmfd sp!, {r1}
<26,0>	                      ; 
<27,0>	00000108  7F 10 01 E2 ; and r1, r1, #0x7F ;postavljanje 7 bita u 0
<28,0>	0000010C  04 10 C0 E5 ; strb r1, [r0,#4]
<29,0>	                      ;
<30,0>	00000110  80 10 81 E3 ; orr r1, r1, #0x80 ;sada postavimo bit 7 u jeadn
<31,0>	00000114  04 10 C0 E5 ; strb r1, [r0,#4]
<32,0>	                      ;
<33,0>	00000118  7F 10 01 E2 ; and r1, r1, #0x7F ;postavljanje 7 bita u 0
<34,0>	0000011C  04 10 C0 E5 ; strb r1, [r0,#4]
<35,0>	                      ;
<36,0>	00000120  02 00 BD E8 ; ldmfd sp!, {r1}
<37,0>	00000124  0E F0 A0 E1 ; mov pc, lr
<38,0>	                      ; 
<39,0>	                      ; 
<40,0>	                      ; 
<41,0>	                      ;
<42,0>	                      ;
<43,0>	                      ;
<44,0>	                      ; 
<45,0>	                      ; 
<46,0>	                      ;
<47,0>	                      ;
<48,0>	                      ;
#
# Debug Data
#
.debug:
<1,0> 
#
#
# Assembling: OK