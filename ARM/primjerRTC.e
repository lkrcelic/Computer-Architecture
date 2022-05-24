# CONAS v3.0 output file
#
# Processor name: ARM 7
#
8 ; memory word width
#
32 ; address width
#
#
# Original file: C:/ARM/primjerRTC.a
#
#
<1,0>	                      ; ORG 0
<2,0>	00000000  38 00 9F E5 ;INIT LDR R0, RTC        ; dohvati adresu RTC-a
<3,0>	00000004  00 10 A0 E3 ; MOV R1, #0
<4,0>	00000008  0C 10 80 E5 ; STR R1, [R0, #0x0C]    ; pobrisati brojilo preko LR
<5,0>	0000000C  14 20 A0 E3 ; MOV R2, #20            ; broj vijaka u jednom paketu
<6,0>	00000010  04 20 80 E5 ; STR R2, [R0, #0x04]    ; upisati konstantu brojenja u MR
<7,0>	00000014  10 10 80 E5 ; STR R1, [R0, #0x10]    ; zabraniti prekid RTC-u u CR (nije nužno)
<8,0>	                      ;
<9,0>	                      ;GLAVNI                  ; glavni program samo prebraja pakete
<10,0>	                      ;
<11,0>	00000018  08 10 90 E5 ;CEKAJ LDR R1, [R0, #0x08] ; dohvatiti status RTC-a
<12,0>	0000001C  01 00 11 E3 ; TST R1, #1             ; ispitati najniži bit
<13,0>	00000020  FC FF FF 0A ; BEQ CEKAJ              ; dok je status==0 => čekaj spremnost
<14,0>	                      ;PAKET                   ; spreman => odbrojeno je 20 impulsa
<15,0>	00000024  00 10 A0 E3 ; MOV R1, #0             ; inicijaliziraj sljedeći ciklus brojenja
<16,0>	00000028  0C 10 80 E5 ; STR R1, [R0, #0x0C]    ; pobrisati brojilo (MR ostaje 20)
<17,0>	0000002C  08 10 80 E5 ; STR R1, [R0, #0x08]    ; obrisati status (šalje se bilo što)
<18,0>	00000030  0C 10 9F E5 ; LDR R1, BRPAK          ; povećati brojač paketa BRPAK
<19,0>	00000034  01 10 81 E2 ; ADD R1, R1, #1
<20,0>	00000038  04 10 8F E5 ; STR R1, BRPAK
<21,0>	0000003C  F5 FF FF EA ; B CEKAJ                ; beskonačno prebrajaj pakete
<22,0>	                      ;
<23,0>	                      ;
<24,0>	00000040! 00 0E FF FF ;RTC DW 0xFFFF0E00       ; adresa RTC-a
<25,0>	00000044! 00 00 00 00 ;BRPAK DW 0              ; brojač proizvedenih paketa
#
# Debug Data
#
.debug:

#
#
# Assembling: OK