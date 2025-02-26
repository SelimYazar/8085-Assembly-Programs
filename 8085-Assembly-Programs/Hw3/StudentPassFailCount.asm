
;<Dersten Başarılı/Başarısız Öğrenciler>
;<152120191023_SelimCanYazar>
jmp start

                ;Veri seti girildi
data: db 01h,02h,03h,04h,05h,06h,07h, 08h, 09h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 10h, 11h, 12h, 13h, 14h,50h



start: nop
IN 00H          ;Değer 01h Port'una elle girilecek IN komutuyla Accumulatore çekilecek.       
 
MOV B, A        ;Accumulatordeki değer B registerına atılacak ve kıyaslama işlemlerinde kullanılacak.       
MVI C,0         ;C registerına '0' değeri atılacak ve her başarılı öğrencide artacak.
MVI E,0         ;E registerına '0' değeri atılacak ve her başarılı öğrencide artacak.
LXI H,data      ;Data H registerına atılacak ve buradan artırma yöntemiyle sırasıyla çekilecek.Program default olarak 4200h'a ayarlı olduğundan 4203H dan başlayacak.    	

call passed     ;count_loop subroutine'i çağırılarak kaç öğrencinin başarılı kaçının başarısız olduğu hesaplanacak.

MOV A,C         ;C registerında başarılı öğrencilerin sayıları tutulduğundan 01H Portuna yazılacak.
OUT 01H
MOV A,E         ;E registerında başarısız öğrencilerin sayıları tutulduğundan 01H Portuna yazılacak.
OUT 02H

call hesapla    ;En son olarak 'hesapla' subroutine'ninde hangi tip öğrencinin fazla olduğu hesaplanacak.

HLT              

   
passed:        MOV A, M         ;Datamızı H registerına atmıştık Şuan H registerında datanın ilk elemanı tutuluyor.İlk değer Accumulatore atılır.     
               CMP B            ;Eleman B registerına attığımız Kıyaslama elemanıyla kıyaslanır.
               JC failed        ;Eğer eleman B'den küçükse program failed label'ından devam eder.
               INR C            ;Eğer eleman B'den büyükse C registerındaki değer 1 artırılır.
               JMP next_student ;Next_student label'ına atlanır.Burada H artırılarak sıradaki elema geçilecek ve bitme şartı kontrol edilecek.
 
                           
 failed:       INR E            ;Eleman B registerıdaki değerden küçükse E registerındaki değer 1 artar. 


next_student:  INX H            ;H registarının tuttuğu adres 1 artıralarak sıradaki elemana geçilir.
               MOV A, M         ;Sıradaki eleman Accumulatore atılır.
               CPI 50h          ;Bitme koşulu sağlandımı kontrol edilir.
               JNZ passed       ;Bitme koşulu sağlanmadıysa başa dönülür ve işlem bitme koşulu sağlanana kadar devam eder.
               RET              ;return
 



hesapla:       MOV A ,E         ;Başarısız öğrencilerinin sayılarının tutulduğu E registerını Accumulatore attık.
               CMP C            ;Başarılı öğrencilerin sayılarıyla kıyasladık.
               JNC hesapla2     ;Başarısız öğrencilerin sayısı daha fazlaysa hesapla2 labelına geçicek.
               MVI A,2h         ;Başarılı öğrenciler daha çoksa Accumulatore 2h yazılacak
               JMP Print_result ;next_student2 labeline geçip çıktı yazılacak.
 
hesapla2:      MVI A,1h         ;Başarısız öğrenciler daha çoksa Accumulatore 2h yazılacak
               JMP Print_result ;next_student2 labeline geçip çıktı yazılacak.
              
Print_result:  OUT 03H          ;03H portuna başarılı öğrenciler çoksa '02h' başarısız öğrenciler çoksa'01h'yazılacak
               RET              ;return

