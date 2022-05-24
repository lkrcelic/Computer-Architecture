# CONAS v3.0 output file
#
# Processor name: RV32I
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/RISC-V/LED.a
#
#
<1,0>	             ;#s1 adresa gpio-a
<2,0>	             ;#
<3,0>	             ;
<4,0>	             ;#init gpio
<5,0>	00000000  83 ; lw s1, GPIO(x0)
|         24
|         00
|         03
<6,0>	00000004  93 ; addi t0, x0, 0b11100000
|         02
|         00
|         0E
<7,0>	00000008  23 ; sw t0, 8(s1) #definiraj ulaz izlaz
|         A4
|         54
|         00
<8,0>	             ;
<9,0>	             ;LOOP
<10,0>	0000000C  83 ; lw t0, 0(s1) #ucitaj sa gpio-a
|         A2
|         04
|         00
<11,0>	00000010  93 ; andi t0, t0, 0b00000010
|         F2
|         22
|         00
<12,0>	00000014  63 ; blt x0, t0, ON
|         48
|         50
|         00
<13,0>	             ; 
<14,0>	             ;OFF #ugasi lampu
<15,0>	00000018  93 ; addi t0, x0, 0
|         02
|         00
|         00
<16,0>	0000001C  23 ; sw t0, 0(s1) 
|         A0
|         54
|         00
<17,0>	00000020  6F ; jal x0, LOOP
|         F0
|         DF
|         FE
<18,0>	             ;
<19,0>	             ;ON #upali lampu
<20,0>	00000024  93 ; addi t0, x0, 0b00100000
|         02
|         00
|         02
<21,0>	00000028  23 ; sw t0, 0(s1) 
|         A0
|         54
|         00
<22,0>	0000002C  6F ; jal x0, LOOP
|         F0
|         1F
|         FE
<23,0>	             ;
<24,0>	             ;
<25,0>	             ;
<26,0>	00000030! 00 ;GPIO dw 0xFFFF0B00
|         0B
|         FF
|         FF
#
# Debug Data
#
.debug:
<5,0> 
#
#
# Assembling: OK