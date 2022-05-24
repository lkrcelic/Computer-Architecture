# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/vjezba.a
#
#
<1,0>	00000000  40 DD A0 E3 ; mov sp, #0x1000 
<2,0>	                      ;
<3,0>	00000004  02 00 00 EB ; bl PODJELI
<4,0>	00000008! 07 00 00 00 ;PRVI dw 7
<5,0>	0000000C! 02 00 00 00 ;DRUGI dw 2
<6,0>	                      ;
<7,0>	00000010  56 34 12 EF ; swi 0x123456
<8,0>	                      ;
<9,0>	                      ;
<10,0>	                      ;
<11,0>	                      ;PODJELI
<12,0>	00000014  04 00 2D E9 ; stmfd sp!, {r2}
<13,0>	00000018  04 10 9E E4 ; ldr r1, [lr],#4 ;prvi a ujedno i ostatak
<14,0>	0000001C  04 20 9E E4 ; ldr r2, [lr],#4
<15,0>	00000020  00 00 A0 E3 ; mov r0, #0 ;postavljanje 0 u r0
<16,0>	                      ; 
<17,0>	                      ;LOOP
<18,0>	00000024  02 00 51 E1 ; cmp r1, r2
<19,0>	00000028  02 00 00 3A ; blo VAN ;ako je r2 manji od r3 gotovi smo
<20,0>	                      ; 
<21,0>	0000002C  02 10 41 E0 ; sub r1,r1,r2
<22,0>	00000030  01 00 80 E2 ; add r0, r0,#1
<23,0>	00000034  FA FF FF EA ; b LOOP
<24,0>	                      ;
<25,0>	                      ;VAN
<26,0>	00000038  04 00 BD E8 ; ldmfd sp!, {r2}
<27,0>	0000003C  0E F0 A0 E1 ; mov pc, lr
<28,0>	                      ;
<29,0>	                      ;
<30,0>	                      ; 
<31,0>	                      ;  
<32,0>	                      ;
<33,0>	                      ;
<34,0>	                      ;
#
# Debug Data
#
.debug:
<1,0> <12,0> <!4,0> <!5,0> 
#
#
# Assembling: OK