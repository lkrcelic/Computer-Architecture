# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/RTC.a
#
#
<1,0>	                      ;;r0 RTC
<2,0>	                      ;;r1 radni registar
<3,0>	                      ;
<4,0>	                      ; org 0x0
<5,0>	00000000  05 00 00 EA ; b GLAVNI
<6,0>	                      ;
<7,0>	                      ; org 0x18
<8,0>	00000018  10 00 00 EA ; B IRQ
<9,0>	                      ;
<10,0>	                      ;
<11,0>	                      ;GLAVNI
<12,0>	0000001C  D2 00 A0 E3 ; mov r0, #0b11010010
<13,0>	00000020  00 F0 29 E1 ; msr cpsr, r0
<14,0>	00000024  FC DC A0 E3 ; mov sp, #0xFC00
<15,0>	                      ; 
<16,0>	00000028  D3 00 A0 E3 ; mov r0, #0b11010011
<17,0>	0000002C  00 F0 29 E1 ; msr cpsr, r0
<18,0>	00000030  F8 DC A0 E3 ; mov sp, #0xF800
<19,0>	00000034  00 00 0F E1 ; mrs r0, cpsr
<20,0>	00000038  80 00 C0 E3 ; bic r0, r0, #0b10000000
<21,0>	0000003C  00 F0 29 E1 ; msr cpsr, r0 
<22,0>	                      ; 
<23,0>	00000040  40 00 9F E5 ; ldr r0, RTC
<24,0>	00000044  00 10 A0 E3 ; mov r1, #0
<25,0>	00000048  0C 10 80 E5 ; str r1, [r0,#12] ;brisanje lr
<26,0>	0000004C  01 10 A0 E3 ; mov r1, #1
<27,0>	00000050  10 10 80 E5 ; str r1, [r0,#16] ;pali CR
<28,0>	00000054  14 10 A0 E3 ; mov r1, #20   
<29,0>	00000058  04 10 80 E5 ; str r1, [r0,#4] ;postavljanje MR-a na 20
<30,0>	                      ; 
<31,0>	                      ;LOOP
<32,0>	0000005C  FE FF FF EA ; b LOOP
<33,0>	                      ;
<34,0>	                      ;
<35,0>	                      ;IRQ
<36,0>	00000060  02 00 2D E9 ; stmfd sp!, {r1}
<37,0>	                      ;
<38,0>	00000064  18 10 9F E5 ; ldr r1, BRPAK
<39,0>	00000068  01 10 81 E2 ; add r1, r1, #1
<40,0>	0000006C  10 10 8F E5 ; str r1, BRPAK
<41,0>	00000070  00 10 A0 E3 ; mov r1, #0
<42,0>	00000074  0C 10 80 E5 ; str r1, [r0,#12]
<43,0>	00000078  08 10 80 E5 ; str r1, [r0,#8]
<44,0>	                      ;
<45,0>	0000007C  02 00 BD E8 ; ldmfd sp!,{r1}
<46,0>	00000080  04 F0 5E E2 ; subs pc,lr,#4
<47,0>	                      ;
<48,0>	                      ;
<49,0>	00000084! 00 00 00 00 ;BRPAK dw 0
<50,0>	                      ;
<51,0>	                      ;
<52,0>	00000088! 00 0E FF FF ;RTC dw 0xFFFF0E00
#
# Debug Data
#
.debug:
<!49,0> 
#
#
# Assembling: OK