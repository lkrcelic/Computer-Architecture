# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/DMAC.a
#
#
<1,0>	                      ; ORG 0
<2,0>	00000000  05 00 00 EA ; B MAIN ; skok na obradu iznimke RESET
<3,0>	                      ;
<4,0>	                      ; ORG 0x18
<5,0>	00000018  14 00 00 EA ; B DMA_KRAJ ; skok na obradu iznimke IRQ
<6,0>	                      ;
<7,0>	                      ;
<8,0>	                      ;MAIN ; Inicijalizacija stogova
<9,0>	0000001C  D2 F0 29 E3 ; MSR CPSR, #0b11010010 ; prelazak u način rada IRQ
<10,0>	00000020  40 DB A0 E3 ; MOV R13, #0x10000 ; inicijalizacija R13_irq
<11,0>	00000024  D3 F0 29 E3 ; MSR CPSR, #0b11010011 ; prelazak u način rada SVC
<12,0>	00000028  FC DC A0 E3 ; MOV R13, #0xFC00 ; inicijalizacija R13_svc
<13,0>	                      ;
<14,0>	                      ;INIT ; inicijalizacija DMAC-a
<15,0>	0000002C  FF 18 A0 E3 ; MOV R1, #0x00FF0000 ; adresa ima oblik rotiranog bajta
<16,0>	00000030  40 0D A0 E3 ; MOV R0, #0x1000
<17,0>	00000034  10 00 81 E5 ; STR R0, [R1,#0x10] ; Source address
<18,0>	00000038  80 0D A0 E3 ; MOV R0, #0x2000
<19,0>	0000003C  14 00 81 E5 ; STR R0, [R1,#0x14] ; Destination address
<20,0>	00000040  0C 00 A0 E3 ; MOV R0, #0x000C ; Sizes: burst size = 1 = 2^0
<21,0>	00000044  18 00 81 E5 ; STR R0, [R1,#0x18] ; transfer size = 0x040
<22,0>	00000048  AC 00 A0 E3 ; MOV R0, #0b10101100
<23,0>	0000004C  1C 00 81 E5 ; STR R0, [R1,#0x1C] ; Configuration
<24,0>	                      ;
<25,0>	                      ;; omogući prekid IRQ
<26,0>	00000050  00 00 0F E1 ; MRS R0, CPSR
<27,0>	00000054  80 00 C0 E3 ; BIC R0, R0, #0x80
<28,0>	00000058  00 F0 29 E1 ; MSR CPSR, R0
<29,0>	                      ;
<30,0>	                      ;; omogući kanal, tj. pokretanje DMA
<31,0>	0000005C  01 00 A0 E3 ; MOV R0, #1
<32,0>	00000060  00 00 81 E5 ; STR R0, [R1,#0] ; Control
<33,0>	                      ;
<34,0>	                      ;
<35,0>	                      ;NASTAVAK ; neki glavni program….
<36,0>	00000064  01 00 57 E3 ; CMP R7, #1 ; provjera da li je DMA gotov
<37,0>	00000068  FD FF FF 1A ; BNE NASTAVAK
<38,0>	                      ;
<39,0>	0000006C  40 E2 01 EF ; SWI 123456
<40,0>	                      ;
<41,0>	                      ;
<42,0>	                      ;; posluživanje prekida IRQ
<43,0>	                      ;DMA_KRAJ 
<44,0>	00000070  02 40 2D E9 ; STMFD SP!, {R1, LR} ; spremi kontekst
<45,0>	00000074  FF 18 A0 E3 ; MOV R1, #0x00FF0000 ; brisanje statusa, tj. dojava
<46,0>	00000078  04 10 81 E5 ; STR R1, [R1, #0x4] ; prihvata prekida DMAC-u
<47,0>	0000007C  01 00 00 EB ; BL GOTOVO ; nakon DMA-prijenosa => GOTOVO
<48,0>	                      ;
<49,0>	00000080  02 40 BD E8 ; LDMFD SP!, {R1, LR} ; obnovi kontekst
<50,0>	00000084  04 F0 5E E2 ; SUBS PC, LR, #4 ; povratak iz iznimke/prekida
<51,0>	                      ;
<52,0>	                      ;
<53,0>	00000088  01 70 A0 E3 ;GOTOVO MOV R7, #1
<54,0>	0000008C  0E F0 A0 E1 ; MOV PC,LR
<55,0>	                      ;
<56,0>	                      ;
<57,0>	00000090! 00 00 FF 00 ;DMAC_A DW 0x00FF0000 ; adresa DMAC-a
<58,0>	                      ;
<59,0>	                      ; org 0x1000
<60,0>	00001000! 01 00 00 00 ; dw 1,2,3,4,5,6,7,8,9,10,11,12
|         02 00 00 00
|         03 00 00 00
|         04 00 00 00
|         05 00 00 00
|         06 00 00 00
|         07 00 00 00
|         08 00 00 00
|         09 00 00 00
|         0A 00 00 00
|         0B 00 00 00
|         0C 00 00 00
<61,0>	                      ; 
<62,0>	                      ; org 0x2000
<63,0>	00002000! 00 00 00 00 ; ds 48
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
#
# Debug Data
#
.debug:
<2,0> <44,0> <!60,0> <!63,0> 
#
#
# Assembling: OK