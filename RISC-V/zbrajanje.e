# CONAS v3.0 output file
#
# Processor name: RV32I
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/RISC-V/zbrajanje.a
#
#
<1,0>	00000000  03 ; lw a4, al(x0)
|         27
|         C0
|         03
<2,0>	00000004  83 ; lw a5, ah(x0)
|         27
|         00
|         04
<3,0>	00000008  03 ; lw a6, bl(x0)
|         28
|         40
|         04
<4,0>	0000000C  83 ; lw a7, bh(x0)
|         28
|         80
|         04
<5,0>	             ;
<6,0>	             ;#t0 zborj nizih rijeci
<7,0>	             ;#t1 zbroj visih rijeci
<8,0>	             ;#t2 preljev višeg zbrajanja
<9,0>	             ;#t3 novi preljev višeg zbrajanja
<10,0>	             ;#t4 dodavanje nižeg preljeva u višu sumu
<11,0>	             ;#t6 nizi preljev
<12,0>	             ;
<13,0>	             ;
<14,0>	00000010  B3 ; add t0, a4, a6 #zbroji nize rijeci
|         02
|         07
|         01
<15,0>	00000014  B3 ; sltu t6, t0,a4 #ako je t0 < a4 ima preljeva
|         BF
|         E2
|         00
<16,0>	00000018  33 ; add t1, a5, a7 #zbroji više dijelove
|         83
|         17
|         01
<17,0>	0000001C  B3 ; sltu t2, t1, a5 #izracunaj preljev višeg zbrajanja
|         33
|         F3
|         00
<18,0>	             ; 
<19,0>	00000020  B3 ; add t4, t1, t6 #zbroji prvi preljev i višu sumu
|         0E
|         F3
|         01
<20,0>	00000024  33 ; sltu t3,t4,t1 #novi preljev više sume
|         BE
|         6E
|         00
<21,0>	00000028  B3 ; add t6,t2,t3 #izračunaj konačni preljev
|         8F
|         C3
|         01
<22,0>	             ;
<23,0>	             ; 
<24,0>	0000002C  23 ; sw t0, rl(x0)
|         26
|         50
|         04
<25,0>	00000030  23 ; sw t4, rh(x0)
|         28
|         D0
|         05
<26,0>	00000034  23 ; sw t6, preljev(x0)
|         2A
|         F0
|         05
<27,0>	             ;
<28,0>	00000038  00 ; halt
|         00
|         00
|         00
<29,0>	             ;
<30,0>	             ;
<31,0>	             ;
<32,0>	0000003C! 01 ;al dw 0x80000001
|         00
|         00
|         80
<33,0>	00000040! F0 ;ah dw 0xFFFFFFF0
|         FF
|         FF
|         FF
<34,0>	00000044! 02 ;bl dw 0x80000002
|         00
|         00
|         80
<35,0>	00000048! 0F ;bh dw 0xF
|         00
|         00
|         00
<36,0>	0000004C! 00 ;rl dw 0
|         00
|         00
|         00
<37,0>	00000050! 00 ;rh dw 0
|         00
|         00
|         00
<38,0>	00000054! 00 ;preljev dw 0
|         00
|         00
|         00
#
# Debug Data
#
.debug:
<!32,0> 
#
#
# Assembling: OK