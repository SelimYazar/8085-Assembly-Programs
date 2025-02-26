;<Program title>

jmp start

;data


;code
start: nop
     
    ;Öğrenci numaramın son 8 hanesi "20191023"

    ; Port 00H'den 20h değerini accumulatore al ve B registerına taşı
    IN 00H   ; Port 00H'den değeri al
    MOV B, A ; Bu değeri B registerına taşı

    ; Port 01H'den 19h değerini accumulatore al ve C registerına taşı
    IN 01H   ; Port 01H'den değeri al
    MOV C, A ; Bu değeri C registerına taşı

    ; Port 02H'den 67h değerini accumulatore al ve D registerına taşı
    IN 02H   ; Port 02H'den değeri al
    MOV D, A ; Bu değeri D registerına taşı

    ; Port 03H'den 89h değerini accumulatore al ve E registerına taşı
    IN 03H   ; Port 03H'den değeri al
    MOV E, A ; Bu değeri E registerına taşı

    ; Accumulatorde şuan E registerındaki değer var ADD komutu E ve C yi toplar ve accumulatore atar
    ADD C

    ; Accumulatordeki değeri BCD düzelt
    DAA      ; BCD toplama işlemi sonrası A kaydını düzelten işlem

    ; Bellek adresinin yüksek (H) ve düşük (L) baytını ayarla
    MVI H, 10H  ; Bellek adresinin yüksek baytını 10H olarak ayarla
    MVI L, 23H  ; Bellek adresinin düşük baytını 23H olarak ayarla

    ; Accumulatordeki değeri belleğe yaz
    MOV M, A

    ; B registerındaki değeri Accumulatore taşı
    MOV A, B

    ; D registerındaki Accumulatore ekle
    ADC D

    ; Accumulatordeki değeri BCD düzelt
    DAA      ; BCD toplama işlemi sonrası Accumulatorü düzelten işlem

    ; H registerındaki değeri bir birim artır
    INX H


    MOV M, A  ; Sonucu belleğe yaz

hlt