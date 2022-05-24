# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/zadatak2.a
#
#
<1,0>	                      ;;RO RTC adresa
<2,0>	                      ;;R2 DMAC adresa
<3,0>	                      ;;R2 radna adresa
<4,0>	                      ;;R3 radna adresa
<5,0>	                      ;
<6,0>	                      ; ORG 0X0
<7,0>	00000000  15 00 00 EA ; B MAIN
<8,0>	                      ;
<9,0>	                      ; ORG 0X18
<10,0>	00000018  2F 00 00 EA ; B POSLANO
<11,0>	                      ;
<12,0>	                      ; ORG 0x1C
<13,0>	0000001C  07 00 2D E9 ; STMFD SP!, {R0,R1,R2}
<14,0>	00000020  DC 0F 9F E5 ; LDR R0, RTC ;dohvati adresu RTC-a
<15,0>	00000024  D4 1F 9F E5 ; LDR R1, DMAC ;dohvati adresu DMAC-a
<16,0>	                      ;;POVECAJ BROJAC
<17,0>	00000028  D8 2F 9F E5 ; LDR R2, BROJAC
<18,0>	0000002C  01 20 82 E2 ; ADD R2, R2, #1 
<19,0>	00000030  D0 2F 8F E5 ; STR R2, BROJAC
<20,0>	                      ;;DEAKTIVIRAJ RTC
<21,0>	00000034  00 20 A0 E3 ; MOV R2, #0
<22,0>	00000038  10 20 80 E5 ; STR R2, [R0, #0x10] ;cr=0 onemoguciti prekide RTC-u
<23,0>	                      ;;PONOVO DEFINIRAJ DMAC
<24,0>	0000003C  50 2E A0 E3 ; MOV R2, #0x500 ;source
<25,0>	00000040  10 20 81 E5 ; STR R2, [R1,#0x10]
<26,0>	00000044  70 2E A0 E3 ; MOV R2, #0x700 ;destination 
<27,0>	00000048  14 20 81 E5 ; STR R2, [R1,#0x14] 
<28,0>	0000004C  01 20 A0 E3 ; MOV R2, #1
<29,0>	00000050  00 20 81 E5 ; STR R2, [R1] ;omoguci kanal cr=1
<30,0>	                      ;
<31,0>	00000054  07 00 BD E8 ; LDMFD SP!,{R0,R1,R2} ;obnovi kontekst
<32,0>	00000058  04 F0 5E E2 ; SUBS PC, LR, #4 ;povratak u glavni program
<33,0>	                      ;
<34,0>	                      ;MAIN
<35,0>	                      ;;STOGOVI
<36,0>	0000005C  D2 F0 29 E3 ; MSR CPSR, #0b11010010 ;način rada IRQ
<37,0>	00000060  80 DC A0 E3 ; MOV R13, #0x8000  ;STOG ZA IZNIMKU
<38,0>	00000064  D1 F0 29 E3 ; MSR CPSR, #0b11010001 ;način rada FIQ
<39,0>	00000068  7C DC A0 E3 ; MOV R13, #0x7C00 ;NORALNI STOG
<40,0>	0000006C  D3 F0 29 E3 ; MSR CPSR, #0b11010011 ;način rada SVC
<41,0>	00000070  78 DC A0 E3 ; MOV R13, #0x7800 ;NORALNI STOG
<42,0>	                      ;
<43,0>	                      ;;INICIJALIZACIJA RTC-A
<44,0>	00000074  88 0F 9F E5 ; LDR R0, RTC ;dohvati adresu RTC-a
<45,0>	00000078  8C 2F 9F E5 ; LDR R2, KONST ;svakih 3 signala promjena
<46,0>	0000007C  04 20 80 E5 ; STR R2, [R0, #0x04] ;upiši konstantu brojenja u MR
<47,0>	00000080  00 20 A0 E3 ; MOV R2, #0
<48,0>	00000084  10 20 80 E5 ; STR R2, [R0, #0x10] ;cr=0, nemoj jos omoguciti prekide RTC-u
<49,0>	                      ;
<50,0>	00000088  00 20 0F E1 ; MRS R2, CPSR ;dozvoli prekid FIQ
<51,0>	0000008C  40 20 C2 E3 ; BIC R2, R2, #0b01000000 ;brisi 6 bit
<52,0>	00000090  02 F0 29 E1 ; MSR CPSR, R2
<53,0>	                      ;
<54,0>	                      ;;INICIJALIZACIJA DMAC-A
<55,0>	00000094  64 1F 9F E5 ; LDR R1, DMAC ; dohvati adresu DMAC-a
<56,0>	00000098  50 2E A0 E3 ; MOV R2, #0x500 ;source
<57,0>	0000009C  10 20 81 E5 ; STR R2, [R1,#0x10]
<58,0>	000000A0  70 2E A0 E3 ; MOV R2, #0x700 ;destination 
<59,0>	000000A4  14 20 81 E5 ; STR R2, [R1,#0x14] 
<60,0>	000000A8  0A 20 A0 E3 ; MOV R2, #0x000A ; B=1,(BS=0) T=10
<61,0>	000000AC  18 20 81 E5 ; STR R2, [R1,#0x18]
<62,0>	000000B0  AC 20 A0 E3 ; MOV R2, #0b10101100 ;konfiguracijska rijec
<63,0>	000000B4  1C 20 81 E5 ; STR R2, [R1,#0x1C] 
<64,0>	000000B8  01 20 A0 E3 ; MOV R2, #1
<65,0>	000000BC  00 20 81 E5 ; STR R2, [R1] ;omoguci kanal cr=1
<66,0>	                      ;
<67,0>	000000C0  00 20 0F E1 ; MRS R2, CPSR 
<68,0>	000000C4  80 20 C2 E3 ; BIC R2, R2, #0b10000000 ;omoguci IRQ
<69,0>	000000C8  02 F0 29 E1 ; MSR CPSR, R2
<70,0>	                      ;
<71,0>	                      ;
<72,0>	                      ;;GLAVNI PROGRAM
<73,0>	                      ;LOOP
<74,0>	000000CC  34 2F 9F E5 ; LDR R2, BROJAC
<75,0>	000000D0  05 00 52 E3 ; CMP R2, #5
<76,0>	000000D4  FC FF FF 1A ; BNE LOOP
<77,0>	                      ;
<78,0>	000000D8  56 34 12 EF ; SWI 0x123456
<79,0>	                      ;
<80,0>	                      ;
<81,0>	                      ;POSLANO
<82,0>	000000DC  0E 40 2D E9 ; STMFD SP!, {R1,R2,R3,LR} ;spremi kontekst
<83,0>	000000E0  18 1F 9F E5 ; LDR R1, DMAC
<84,0>	000000E4  00 20 A0 E3 ; MOV R2, #0
<85,0>	000000E8  04 20 81 E5 ; STR R2, [R1, #0x4] ;dojava prihvata prekida DMAC-u
<86,0>	000000EC  1C 2F 9F E5 ; LDR R2, KONST2 ;ucitaj kosnt 80808080
<87,0>	000000F0  14 30 91 E5 ; LDR R3, [R1, #0x14] ;dohvati odredisnu adresu
<88,0>	000000F4  00 20 83 E5 ; STR R2,[R3] ;spremi na kraj 80808080
<89,0>	                      ;
<90,0>	000000F8  01 00 00 EB ; BL RTC_ON 
<91,0>	000000FC  0E 40 BD E8 ; LDMFD SP!, {R1,R2,R3,LR} ;obnovi kontekst
<92,0>	00000100  04 F0 5E E2 ; SUBS PC, LR, #4 ;povratak u glavni program
<93,0>	                      ;
<94,0>	                      ;RTC_ON 
<95,0>	00000104  05 00 2D E9 ; STMFD SP!, {R0,R2} ;spremi kontekst
<96,0>	00000108  F4 0E 9F E5 ; LDR R0, RTC ;dohvati adresu RTC-a
<97,0>	0000010C  00 20 A0 E3 ; MOV R2, #0
<98,0>	00000110  0C 20 80 E5 ; STR R2, [R0, #0x0C] ;pobriši brojilo
<99,0>	00000114  01 20 A0 E3 ; MOV R2, #1
<100,0>	00000118  08 20 80 E5 ; STR R2, [R0, #0x08] ; obriši status reg. (šalje se bilo što)
<101,0>	                      ;                     ;JAKO BITNO JER GA RESTARTIRA
<102,0>	0000011C  10 20 80 E5 ; STR R2, [R0, #0x10] ;dozvoli prekide
<103,0>	00000120  05 00 BD E8 ; LDMFD SP!, {R0,R2} ;obnovi kontekst
<104,0>	00000124  0E F0 A0 E1 ; MOV PC,LR
<105,0>	                      ;
<106,0>	                      ;
<107,0>	                      ; ORG 0x500 
<108,0>	                      ;
<109,0>	                      ; ORG 0x700
<110,0>	                      ;
<111,0>	                      ;
<112,0>	                      ;;PODATCI
<113,0>	                      ; ORG 0x1000
<114,0>	00001000! 00 00 FF 00 ;DMAC DW 0x00FF0000
<115,0>	00001004! 00 0E FF FF ;RTC DW 0xFFFF0E00
<116,0>	00001008! 00 00 00 00 ;BROJAC DW 0x0
<117,0>	0000100C! 03 00 00 00 ;KONST DW 0x3
<118,0>	00001010! 80 80 80 80 ;KONST2 DW 0x80808080
<119,0>	                      ;
#
# Debug Data
#
.debug:

#
#
# Assembling: OK