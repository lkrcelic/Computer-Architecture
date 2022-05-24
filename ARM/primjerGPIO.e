# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/primjerGPIO.a
#
#
<1,0>	00000000  1C 00 9F E5 ;INIT LDR R0, GPIO       ; dohvati adresu GPIO-a
<2,0>	00000004  E0 10 A0 E3 ;  MOV R1, #0b11100000     ; smjer vrata A: XPA1=0 ULAZ - sklopka
<3,0>	                      ;                        ; XPA5=1 IZLAZ - LED
<4,0>	                      ;                        ; ostalo: kako je spojeno
<5,0>	00000008  08 10 80 E5 ;SMJER STR R1, [R0, #8]  ; pošalji smjer u PA_DDR
<6,0>	                      ;
<7,0>	0000000C  00 10 90 E5 ;CITAJ LDR R1, [R0, #0]          ; pročitaj stanje sklopke (tj. PA_DR)
<8,0>	00000010  02 00 11 E3 ;  TST R1, #0b00000010             ; ispitaj bit sklopke (bit 1)
<9,0>	00000014  20 10 A0 13 ;UKLJ MOVNE R1, #0b00100000      ; XPA5 = 1 - uključivanje LED-a
<10,0>	00000018  00 10 A0 03 ;ISKLJ MOVEQ R1, #0b00000000     ; XPA5 = 0 - isključivanje LED-a
<11,0>	0000001C  00 10 80 E5 ;  STR R1, [R0, #0]                ; pošalji na LED (tj. PA_DR)
<12,0>	00000020  F9 FF FF EA ;  B CITAJ
<13,0>	                      ;
<14,0>	00000024! 00 0B FF FF ;GPIO DW 0xFFFF0B00 ; adresa GPIO-a
#
# Debug Data
#
.debug:
<1,0> <7,0> 
#
#
# Assembling: OK