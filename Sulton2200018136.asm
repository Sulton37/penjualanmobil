.model small
.code
org 100h
start:
		jmp mulai
nama		db 13,10,'Nama anda	:$'
nim		db 13,10,'NIM		:$'
lanjut	db 13,10,'LANJUT tekan y untuk lanjut >>>>>>>>>>> $'
tampung_nama	db 30,?,30 dup(?)
tampung_nim		db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j db 15

daftar	db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|						DAFTAR HARGA					    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|						    MOBIL						    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|NO |		JENIS			|      MERK		|		HARGA		    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|01 |		SEDAN			|	MERCEDES	|	   900 juta		    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|02 |		TRUCK			|	HINO		|	   300 juta		    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|03 |		PICK UP		|	SUZUKI	|	   100 juta		    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|04 |		SPORT			|	FERRARI	|	   950 juta		    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|05 |		BUS			|	HINO		|	   500 juta 	    |'
		db 13,10,'=-----------------------------------------------------------------------------='
		db 13,10,'|06 |		KLASIK		|	DODGE		|	   700 juta		    |'
		db 13,10,'=-----------------------------------------------------------------------------=','$'




error			db 13,10,'KODE YG ANDA MASUKKAN SALAH $'
pilih_krs		db 13,10,'Silahkan masukkan no/kode mobil yang anda pilih: $'
success		db 13,10,'Selamat anda berhasil $'



	mulai:
	mov ah,09h
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	
	mov ah,09
	lea dx,nim
	int 21h
	mov ah,0ah
	lea dx,tampung_nim
	int 21h
	push dx

	
	mov ah,09h
	mov dx,offset daftar
	int 21h
	mov ah,09h
	mov dx,offset lanjut
	int 21h
	mov ah,01h
	int 21h
	cmp al,'y'
	jmp proses
	jne error_msg



error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h
	int 20h

proses:
	mov ah,09h
	mov dx,offset pilih_krs
	int 21h

	mov ah,1
	int 21h
	mov bh,al
	mov ah,1
	int 21;
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'2'
	je hasil2

	cmp bh,'0'
	cmp bl,'3'
	je hasil3

	cmp bh,'0'
	cmp bl,'4'
	je hasil4

	cmp bh,'0'
	cmp bl,'5'
	je hasil5

	cmp bh,'0'
	cmp bl,'6'
	je hasil6

	jne error_msg

;--------------------------------------------------------------------------------------

hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h

hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h

hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h

hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h

hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h
hasil6:
	mov ah,09h
	lea dx,teks6
	int 21h
	int 20h

;------------------------------------------------------------------------------------------------------------

teks1		db 13,10,'Anda memilih MOBIL SEDAN'
		db 13,10,'Merk Mercedes'
		db 13,10,'Total harga yang harus anda bayar : 900 juta'
		db 13,10,'Terima kasih $'

teks2		db 13,10,'anda memilih MOBIL TRUCK'
		db 13,10,'Merk HINO'
		db 13,10,'Total yang harus anda bayar : 300 juta'
		db 13,10,'Terima kasih $'

teks3		db 13,10,'Anda memilih MOBIL PICK UP'
		db 13,10,'Merk SUZUKI'
		db 13,10,'Total yang harus anda bayar : 100 juta'
		db 13,10,'Terima kasih $'

teks4		db 13,10,'Anda memilih MOBIL SPORT'
		db 13,10,'Merk FERRARI'
		db 13,10,'Total yang harus anda bayar : 950 juta'
		db 13,10,'Terima kasih $'

teks5		db 13,10,'Anda memilih MOBIL BUS'
		db 13,10,'Merk HINO'
		db 13,10,'Total yang harus anda bayar : 500 juta'
		db 13,10,'Terima kasih $'

teks6		db 13,10,'Anda memilih MOBIL klasik'
		db 13,10,'Merk DODGE'
		db 13,10,'Total yang harus anda bayar : 700 juta'
		db 13,10,'Terima kasih $'
end start





	



