# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/zadatak1.a
#
#
<1,0>	                      ;;RO rtc adresa
<2,0>	                      ;;R2 gpio adresa
<3,0>	                      ;;R2 radna adresa
<4,0>	                      ;
<5,0>	                      ;
<6,0>	                      ; ORG 0X0
<7,0>	00000000  05 00 00 EA ; B MAIN
<8,0>	                      ;
<9,0>	                      ; ORG 0X18
<10,0>	00000018  16 00 00 EA ; B CHANGE  ;PROMJENI SEMAFOR
<11,0>	                      ;
<12,0>	                      ;MAIN
<13,0>	                      ;;STOGOVI
<14,0>	0000001C  D2 F0 29 E3 ; MSR CPSR, #0b11010010 ;način rada IRQ
<15,0>	00000020  80 DC A0 E3 ; MOV R13, #0x8000  ;STOG ZA IZNIMKU
<16,0>	00000024  D3 F0 29 E3 ; MSR CPSR, #0b11010011 ;način rada SVC
<17,0>	00000028  7C DC A0 E3 ; MOV R13, #0x7C00 ;NORALNI STOG
<18,0>	                      ;
<19,0>	                      ;;INICIJALIZACIJA RTC-A
<20,0>	0000002C  AC 00 9F E5 ; LDR R0, RTC ;dohvati adresu RTC-a
<21,0>	                      ;
<22,0>	00000030  00 20 A0 E3 ; MOV R2, #0
<23,0>	00000034  0C 20 80 E5 ; STR R2, [R0, #0x0C] ;pobriši brojilo
<24,0>	00000038  A8 20 9F E5 ; LDR R2, KONST ;svakih 5 signala promjena
<25,0>	0000003C  04 20 80 E5 ; STR R2, [R0, #0x04] ;upiši konstantu brojenja u MR
<26,0>	                      ;
<27,0>	00000040  01 20 A0 E3 ; MOV R2, #1
<28,0>	00000044  10 20 80 E5 ; STR R2, [R0, #0x10] ;cr=1, omoguci prekide RTC-u
<29,0>	                      ;
<30,0>	00000048  00 20 0F E1 ; MRS R2, CPSR ;dozvoli prekid IRQ
<31,0>	0000004C  80 20 C2 E3 ; BIC R2, R2, #0b10000000 ;brisi 7 bit
<32,0>	00000050  02 F0 29 E1 ; MSR CPSR, R2
<33,0>	                      ;
<34,0>	                      ;;INICIJALIZACIJA GPIO-A
<35,0>	00000054  80 10 9F E5 ; LDR R1, GPIO ; dohvati adresu GPIO-a
<36,0>	00000058  E0 20 A0 E3 ; MOV R2, #0b11100000 ; sve na ulaz osim ledica
<37,0>	0000005C  08 20 81 E5 ; STR R2, [R1, #8] ;pošalji smjer u PA_DDR
<38,0>	00000060  20 20 A0 E3 ; MOV R2, #0b00100000 ;pocetno stanje semafora, crveno
<39,0>	00000064  00 20 81 E5 ; STR R2, [R1] ;podesi početno stanje
<40,0>	                      ;
<41,0>	                      ;
<42,0>	                      ;LOOP
<43,0>	00000068  74 20 9F E5 ; LDR R2, BROJAC
<44,0>	0000006C  10 00 52 E3 ; CMP R2, #16 
<45,0>	00000070  FC FF FF 1A ; BNE LOOP
<46,0>	                      ;
<47,0>	00000074  56 34 12 EF ; SWI 0x123456
<48,0>	                      ;
<49,0>	                      ;
<50,0>	                      ;CHANGE
<51,0>	00000078  1F 00 2D E9 ; STMFD SP!, {R0-R4} ; spremi kontekst
<52,0>	                      ; ;INICIJALIZIRAJ SLJEDEĆI CIKLUS BROJENJA
<53,0>	0000007C  5C 00 9F E5 ; LDR R0, RTC 
<54,0>	00000080  00 20 A0 E3 ; MOV R2, #0 
<55,0>	00000084  0C 20 80 E5 ; STR R2, [R0, #0x0C] ; pobriši brojilo (MR ostaje 5)
<56,0>	00000088  08 20 80 E5 ; STR R2, [R0, #0x08] ; obriši status reg. (šalje se bilo što)
<57,0>	                      ;
<58,0>	                      ; ;DOHVATI I UVECAJ BROJAC
<59,0>	0000008C  50 20 9F E5 ; LDR R2, BROJAC 
<60,0>	00000090  01 20 82 E2 ; ADD R2, R2, #1  
<61,0>	00000094  48 20 8F E5 ; STR R2, BROJAC
<62,0>	                      ; 
<63,0>	                      ; ;PROMJENI SVIJETL0
<64,0>	00000098  3C 10 9F E5 ; LDR R1, GPIO 
<65,0>	0000009C  00 30 91 E5 ; LDR R3, [R1] ;ucitaj trenutno stanje
<66,0>	                      ;
<67,0>	000000A0  20 20 A0 E3 ; MOV R2, #0b00100000 ;stanje 1
<68,0>	000000A4  02 00 53 E1 ; CMP R3,R2
<69,0>	000000A8  60 40 A0 03 ; MOVEQ R4,#0b01100000 ;u R3 stavi sljedece stanje
<70,0>	000000AC  60 20 A0 E3 ; MOV R2, #0b01100000 ;stanje 2
<71,0>	000000B0  02 00 53 E1 ; CMP R3,R2
<72,0>	000000B4  80 40 A0 03 ; MOVEQ R4,#0b10000000 ;u R3 stavi sljedece stanje
<73,0>	000000B8  80 20 A0 E3 ; MOV R2, #0b10000000 ;stanje 3
<74,0>	000000BC  02 00 53 E1 ; CMP R3,R2
<75,0>	000000C0  40 40 A0 03 ; MOVEQ R4,#0b01000000 ;u R3 stavi sljedece stanje
<76,0>	000000C4  40 20 A0 E3 ; MOV R2, #0b01000000 ;stanje 4
<77,0>	000000C8  02 00 53 E1 ; CMP R3,R2
<78,0>	000000CC  20 40 A0 03 ; MOVEQ R4,#0b00100000 ;u R3 stavi sljedece stanje
<79,0>	                      ;
<80,0>	000000D0  00 40 81 E5 ; STR R4, [R1]
<81,0>	                      ;
<82,0>	                      ;;VAN
<83,0>	000000D4  1F 00 BD E8 ; LDMFD SP!, {R0-R4} ; obnovi kontekst
<84,0>	000000D8  04 F0 5E E2 ; SUBS PC, LR, #4 ; povratak u glavni program
<85,0>	                      ;
<86,0>	                      ;
<87,0>	                      ;;PODATCI
<88,0>	000000DC! 00 0B FF FF ;GPIO DW 0xFFFF0B00
<89,0>	000000E0! 00 0E FF FF ;RTC DW 0xFFFF0E00
<90,0>	000000E4! 00 00 00 00 ;BROJAC DW 0x0
<91,0>	000000E8! 05 00 00 00 ;KONST DW 0x5
<92,0>	                      ;
#
# Debug Data
#
.debug:
<14,0> 
#
#
# Assembling: OK