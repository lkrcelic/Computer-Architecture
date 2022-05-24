# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/pomocni.a
#
#
<1,0>	00000000  40 DB A0 E3 ;MAIN MOV SP, #0x10000 ; inicijalizacija stoga
<2,0>	00000004  30 00 A0 E3 ; MOV R0, #STRING1 ; pripremi argumente
<3,0>	00000008  2C 00 8F E5 ; STR R0, ST
<4,0>	0000000C  61 00 A0 E3 ; MOV R0, #0x61 ; ASCII-kôd slova ‘a’
<5,0>	00000010  28 00 8F E5 ; STR R0, CH
<6,0>	00000014  0B 00 00 EB ; BL STRCHR ; poziv funkcije
<7,0>	00000018  24 00 9F E5 ; LDR R0, REZ ; dohvat i upotreba rezultata
<8,0>	0000001C  00 00 50 E3 ; CMP R0, #0 ; je li vraćen NULL pokazivač?
<9,0>	00000020  01 00 00 0A ; BEQ KRAJ ; ako ‘a’ nije pronađen => gotovo
<10,0>	00000024  62 10 A0 E3 ;A_U_B MOV R1, #0x62 ; ascii-kod slova ‘b’
<11,0>	00000028  00 10 C0 E5 ; STRB R1, [R0] ; zamijeni ‘a’ sa ‘b’
<12,0>	0000002C  56 34 12 EF ;KRAJ SWI 0x123456
<13,0>	                      ;
<14,0>	00000030! 66 67 61 66 ;STRING1 DSTR "fgafasdf" ; upis stringa u memoriju
|         61 73 64 66
|         00
<15,0>	0000003C! 00 00 00 00 ;ST DW 0 ; prvi parametar – pokazivač na string
<16,0>	00000040! 00          ;CH DB 0 ; drugi parametar – znak koji tražimo
<17,0>	00000044! 00 00 00 00 ;REZ DW 0 ; rezultat – pokazivač na pronađeni znak
<18,0>	                      ;
<19,0>	00000048  07 00 2D E9 ;STRCHR STMFD SP!, {R0-R2} ; spremi kontekst
<20,0>	0000004C  18 00 1F E5 ; LDR R0, ST ; dohvat parametara iz fiksnih lokacija ST i CH
<21,0>	00000050  18 10 5F E5 ; LDRB R1, CH
<22,0>	                      ;
<23,0>	00000054  00 20 D0 E5 ;LOOP LDRB R2, [R0] ; čitaj znak po znak iz stringa
<24,0>	00000058  00 00 52 E3 ; CMP R2, #0 ; provjeri kraj stringa ‘\0’
<25,0>	0000005C  00 00 A0 03 ;NEMA MOVEQ R0, #0 ; došli smo do kraja - znak nije pronađen
<26,0>	00000060  03 00 00 0A ; BEQ VAN ; zapamti NULL kao rezultat i prekini petlju
<27,0>	00000064  01 00 52 E1 ; CMP R2, R1 ; usporedi trenutni znak sa zadanim
<28,0>	00000068  01 00 00 0A ;ISTI BEQ VAN ; isti su – R0 je adresa pronađenog znaka
<29,0>	0000006C  01 00 80 E2 ;DALJE ADD R0, R0, #1 ; nisu isti – traži dalje
<30,0>	00000070  F7 FF FF EA ; B LOOP
<31,0>	00000074  38 00 0F E5 ;VAN STR R0, REZ ; spremi rezultat u fiksnu lokaciju REZ
<32,0>	00000078  07 00 BD E8 ; LDMFD SP!, {R0-R2} ; obnova konteksta i povratak
<33,0>	0000007C  0E F0 A0 E1 ; MOV PC, LR
#
# Debug Data
#
.debug:
<1,0> <!14,0> <!15,0> <!16,0> <!17,0> 
#
#
# Assembling: OK