;<Program title>

jmp start

;data



;code
start: nop       ; Başlangıç noktası
;Öğrenci numarası son 8 hane "20191023"
; 2019h == 8217 decimal // 1023h == 4131decimal
; 2019h/8217 decimal da depolanan değer 12h ,1023h/4131 decimal de depolanan değer 34h yapıldı.

MVI B, 12h       ; B kaydıraçsına 12h değerini yüklenir.

MVI D, 34h       ; D kaydıraçsına 34h değerini yükle, bu değeri 1023h adresine yazacak.
push D           ; D kaydıraçsını yığın (stack) üzerine it. (D'nin değeri yığına kopyalanır)


LXI H, 2019h     ; H kaydıraçsına 2019h adresini yükler. Bu adresi kullanarak veriyi alacağız.


MOV A, M         ; H kaydıraçsının gösterdiği adresteki veriyi A kaydıraçsına kopyalar.

; A kaydıraçsındaki veriyi D kaydıraçsına kopyala
MOV D, A         ; A'daki veriyi D'ye kopyalar.

PUSH B           ; B kaydıraçsını yığına itilir ve B'nin değeri yığına kopyalanır.


LXI H, 1023h     ; H kaydıraçsına 1023h adresini yükler. Bu adresi kullanarak veriyi alacağız.


MOV A, M         ; H kaydıraçsının gösterdiği adresteki veriyi A kaydıraçsına kopyalar.


MOV B, A         ; A'daki veriyi B'ye kopyalar.

POP D            ; Yığındaki değer D'ye kopyalanır.Lifo konseptine göre olduğu için ve en son B değerini push ettiğimiz için şuan en üstte B değeri var.

POP B            ; Yığındaki değer B'ye kopyalanır.

MOV A, B         ; B'deki değeri A'ya kopyalar.
OUT 00h          ; A'daki değeri 00h portuna çıkış yapar.


MOV A, D         ; D'deki değeri A'ya kopyalar.
OUT 01h          ; A'daki değeri 01h portuna çıkış yapar.

hlt              ; Halt komutu, işlemciyi durdurur ve programı sonlandırır.

