# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/primjerLCD.a
#
#
<1,0>	                      ; ORG 0
<2,0>	00000000  40 DB A0 E3 ;MAIN MOV SP, #0x10000   ; stog
<3,0>	00000004  40 1F A0 E3 ; MOV R1, #0x100         ; R1=100 jer je tu zapisana adresa GPIO-a
<4,0>	00000008  00 10 91 E5 ; LDR R1, [R1]           ; u R1 se učitava bazna adresa GPIO-a
<5,0>	0000000C  04 10 81 E2 ; ADD R1,R1,#4           ; u R1 je adresa PB DR (jer ju koristi LCDWR)
<6,0>	                      ;
<7,0>	                      ;PRIKAZ
<8,0>	00000010  0D 00 A0 E3 ; MOV R0, #0x0D          ; slanje znaka 0xD => briše se ulazni registar
<9,0>	00000014  3A 00 00 EB ; BL LCDWR
<10,0>	00000018  41 00 A0 E3 ; MOV R0, #0x41          ; slanje znaka ‘A'
<11,0>	0000001C  38 00 00 EB ; BL LCDWR
<12,0>	00000020  52 00 A0 E3 ; MOV R0, #0x52          ; slanje znaka ‘R'
<13,0>	00000024  36 00 00 EB ; BL LCDWR
<14,0>	00000028  4D 00 A0 E3 ; MOV R0, #0x4D          ; slanje znaka ‘M'
<15,0>	0000002C  34 00 00 EB ; BL LCDWR
<16,0>	00000030  0A 00 A0 E3 ; MOV R0, #0x0A          ; slanje znaka 0xA => ispis znakova na zaslon
<17,0>	00000034  32 00 00 EB ; BL LCDWR
<18,0>	                      ;
<19,0>	00000038  56 34 12 EF ; SWI 0x123456
<20,0>	                      ;
<21,0>	                      ;
<22,0>	                      ; ORG 0x100
<23,0>	00000100! 00 0F FF FF ; DW 0xFFFF0F00          ; adresa GPIO-a
<24,0>	                      ;
<25,0>	00000104  01 00 2D E9 ;LCDWR STMFD R13!, {R0}
<26,0>	00000108  7F 00 00 E2 ; AND R0, R0, #0x7F      ; postavi bit 7 u nulu (za svaki slučaj, jer
<27,0>	                      ;                        ; u R0 je tu mogla biti 1) i pošalji znak
<28,0>	0000010C  00 00 C1 E5 ; STRB R0, [R1]
<29,0>	                      ;
<30,0>	00000110  80 00 80 E3 ; ORR R0, R0, #0x80      ; postavi bit 7 u jedan (podigni impuls)
<31,0>	00000114  00 00 C1 E5 ; STRB R0, [R1]
<32,0>	                      ;
<33,0>	00000118  7F 00 00 E2 ; AND R0, R0, #0x7F      ; postavi bit 7 u nulu (spusti impuls)
<34,0>	0000011C  00 00 C1 E5 ; STRB R0, [R1]
<35,0>	                      ;
<36,0>	00000120  01 00 BD E8 ; LDMFD R13!, {R0}
<37,0>	00000124  0E F0 A0 E1 ; MOV PC, LR             ; povratak
<38,0>	                      ;
#
# Debug Data
#
.debug:

#
#
# Assembling: OK