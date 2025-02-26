
;<Program title>

jmp start

;data


;code
start: nop
        ;00h a I/O Ports dan elle 2'ye bölümü üst olacak sayıyı girdik.
        ;01h a I/O Ports dan elle 2 ile çarpımı taban olacak sayıyı girdik.
         IN 00H   ; 00h daki değeri Accumulatore attık.
         RAR      ; RAR ile eldeye dikkat edilerek 2 ye bölme işlemi yapıldı.
         MOV C, A ; A register'ını C registerına kopyaladık.
         IN 01h   ; 01h daki değeri Accumulatore attık.
         RLC      ;RLC ile 2 ile çarpıldı.
         MOV B, A ; A register'ını B registerına kopyaladık.
         MVI D, 01H	;D registerına 01h datasını verdik.

         CALL UST_DONGUSU
         HLT
                
               
UST_DONGUSU:	JMP CARPMA	
UST_DONGUSU2:	DCR C	        ;üst alma işleminde taban sayıyı üst kadar kendiyle çartığımızdan ve bu komuttan önce carpma labelı çağırıldığından üst değerini tutan C registerını 1 azalttık.
		JNZ UST_DONGUSU	; Eğer C register'ındaki değer sıfır değilse UST_DONGUSU etiketine zıpladık ve döngüyü tekrarladık.

		MOV A, D	;D registerındaki değeri Accumulatore yükledik. Bu çarpma işlemi sonucu elde edilen değeri tutar.
		OUT 02H         ;Accumulatorden aldığımız değeri 02h I/O Portuna yazdırdık.
                RET             ;return
                	        
	
     CARPMA:	MOV E, B	
		MVI A, 00H	
    CARPMA2:    ADD D	        
		DCR E	        
		JNZ CARPMA2	;Zero bayrağı 0 değilken CARPMA2 labeline zıpla.
                MOV D, A	; Accumulaatordeki değeri D resisterına attık.
		JMP UST_DONGUSU2;Koşulsuz olarak UST_DONGUSU 'ne zıpladık.
                	        