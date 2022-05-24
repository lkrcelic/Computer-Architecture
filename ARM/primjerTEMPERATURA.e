# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/primjerTEMPERATURA.a
#
#
<1,0>	                      ; ORG 0
<2,0>	00000000  40 DB A0 E3 ;MAIN MOV SP, #0x10000   ; stog
<3,0>	00000004  C0 5F A0 E3 ; MOV R5, #TEMP           ; blok za spremanje temperatura
<4,0>	00000008  14 20 A0 E3 ; MOV R2, #20             ; brojac ocitanja za petlju
<5,0>	0000000C  AC 10 9F E5 ;INIT LDR R1, GPIO       ; R1 = GPIO bazna adresa
<6,0>	00000010  80 00 A0 E3 ; MOV R0, #0b10000000     ; smjer vrata A, bit 7 je
<7,0>	00000014  08 00 81 E5 ; STR R0, [R1, #0x8]      ; izlazni, ostali su ulazni
<8,0>	                      ;
<9,0>	                      ;LOOP                    ; citaj sa vrata A, ispiši na LCD i spremaj temperaturu 20 puta
<10,0>	                      ;CEKAJ                   ; cekaj spremnost temperaturnog uredaja na bitu 6
<11,0>	00000018  00 00 91 E5 ; LDR R0, [R1, #0]
<12,0>	0000001C  40 00 10 E2 ; ANDS R0, R0, #0b01000000
<13,0>	00000020  FC FF FF 0A ; BEQ CEKAJ
<14,0>	00000024  00 00 91 E5 ;CITAJ LDR R0, [R1, #0]  ; citaj temperaturu
<15,0>	00000028  3F 00 00 E2 ; AND R0, R0, #0b00111111 ; izdvoji samo bitove 0-5
<16,0>	0000002C  01 00 C5 E4 ;SPREMI STRB R0, [R5], #1 ; spremi temperaturu u blok
<17,0>	00000030  06 00 00 EB ; BL LCD                  ; ispis temperature na LCD
<18,0>	                      ;
<19,0>	                      ;IMPULS                  ; kratki impuls na bitu 7 – potvrda da je podatak pročitan
<20,0>	00000034  80 00 80 E3 ; ORR R0, R0, #0b10000000 ; digni bit 7 u jedan
<21,0>	00000038  00 00 81 E5 ; STR R0, [R1, #0]
<22,0>	0000003C  80 00 C0 E3 ; BIC R0, R0, #0b10000000 ; vrati bit 7 u nulu
<23,0>	00000040  00 00 81 E5 ; STR R0, [R1, #0]
<24,0>	00000044  01 20 52 E2 ; SUBS R2, R2, #1         ; smanji brojac i vrti petlju
<25,0>	00000048  F2 FF FF 1A ; BNE LOOP
<26,0>	                      ;
<27,0>	0000004C  56 34 12 EF ;KRAJ SWI 0x123456
<28,0>	                      ;
<29,0>	                      ;
<30,0>	00000050  00 40 2D E9 ;LCD STMFD R13!, {LR}
<31,0>	00000054  00 30 A0 E1 ; MOV R3,R0               ; prebaci u dvije dekadske znameke
<32,0>	00000058  09 00 00 EB ; BL DIV10 
<33,0>	                      ;               ; dijeljenje s 10 ulaz u R3, rez u R4, ostatak u R3
<34,0>	0000005C  0D 00 A0 E3 ; MOV R0, #0x0D           ; slanje znaka 0xD => briše se ulazni registar
<35,0>	00000060  0D 00 00 EB ; BL LCDWR
<36,0>	                      ;
<37,0>	00000064  30 00 84 E2 ; ADD R0,R4,#48
<38,0>	00000068  0B 00 00 EB ; BL LCDWR                ; pošalji znamenku desetice
<39,0>	0000006C  30 00 83 E2 ; ADD R0,R3,#48
<40,0>	00000070  09 00 00 EB ; BL LCDWR                ; pošalji znamenku jedinice
<41,0>	                      ;
<42,0>	00000074  0A 00 A0 E3 ; MOV R0, #0x0A           ; slanje znaka 0xA => ispis znakova na zaslon
<43,0>	00000078  07 00 00 EB ; BL LCDWR
<44,0>	                      ;
<45,0>	0000007C  00 40 BD E8 ; LDMFD R13!, {LR}
<46,0>	00000080  0E F0 A0 E1 ; MOV PC,LR
<47,0>	                      ;
<48,0>	00000084  00 40 A0 E3 ;DIV10 MOV R4,#0         ; dijeljenje s 10 ulaz u R3, rez u R4, ostatak u R3
<49,0>	00000088  0A 00 53 E3 ;L1 CMP R3, #10
<50,0>	0000008C  0E F0 A0 31 ; MOVLO PC, LR
<51,0>	00000090  0A 30 43 E2 ; SUB R3, R3, #10
<52,0>	00000094  01 40 84 E2 ; ADD R4,R4,#1
<53,0>	00000098  FA FF FF EA ; B L1
<54,0>	                      ;
<55,0>	0000009C  01 00 2D E9 ;LCDWR STMFD R13!, {R0}  ; slanje znaka na LCD
<56,0>	000000A0  7F 00 00 E2 ; AND R0, R0, #0x7F       ; postavi bit 7 u nulu (za svaki slucaj, jer
<57,0>	                      ;                        ; u R0 je tu mogla biti 1) i pošalji znak
<58,0>	000000A4  04 00 C1 E5 ; STRB R0, [R1,#4]
<59,0>	000000A8  80 00 80 E3 ; ORR R0, R0, #0x80       ; postavi bit 7 u jedan (podigni impuls)
<60,0>	000000AC  04 00 C1 E5 ; STRB R0, [R1,#4]
<61,0>	000000B0  7F 00 00 E2 ; AND R0, R0, #0x7F       ; postavi bit 7 u nulu (spusti impuls)
<62,0>	000000B4  04 00 C1 E5 ; STRB R0, [R1,#4]
<63,0>	000000B8  01 00 BD E8 ; LDMFD R13!, {R0}
<64,0>	000000BC  0E F0 A0 E1 ; MOV PC, LR              ; povratak
<65,0>	                      ;
<66,0>	                      ;
<67,0>	000000C0! 00 0F FF FF ;GPIO DW 0xFFFF0F00      ; adresa GPIO-a
<68,0>	                      ;
<69,0>	                      ; ORG 0x300
<70,0>	00000300! 00 00 00 00 ;TEMP DS 20              ; blok za pohranu 20 temperatura
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
|         00 00 00 00
#
# Debug Data
#
.debug:

#
#
# Assembling: OK