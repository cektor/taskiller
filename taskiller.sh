#!/bin/bash

# GNU License | Fatih ÖNDER - https://fatihonder.org.tr



#Bu satır, "Çalışan Aktif Uygulamalar:" metnini ekrana yazdırır. Kullanıcıya hangi uygulamaların listeleneceğini belirtir.
echo "Çalışan Aktif Uygulamalar:"

#Bu komut, ps komutunu kullanarak çalışan uygulamaların PID (Process ID) ve komut adını listeler
ps -eo pid,comm --sort=start_time

#Bu satır, kullanıcıdan kapatmak istediği uygulamaların PID'lerini virgülle ayırarak girmesini bekler. Kullanıcının girdiği değer pids değişkenine atanır.
read -p "Kapatmak istediğiniz uygulamaların PID'lerini virgülle ayırarak girin: " pids

#Bu satır, IFS (Internal Field Separator) değişkenini ayarlayarak girdiyi virgüllerle ayırır ve pid_array dizisine atar. Kullanıcının girdiği PID'ler bu dizide saklanır.
IFS=',' read -ra pid_array <<< "$pids"

#Bu döngü, pid_array dizisindeki her bir PID için aşağıdaki işlemleri gerçekleştirir.
for pid in "${pid_array[@]}"; do

#Bu komut, belirtilen PID'ye sahip uygulamayı sonlandırır. kill komutu, belirtilen PID'ye bir sinyal gönderir ve varsayılan olarak uygulamayı sonlandırır.  
  kill "$pid"

#Bu satır, kapatılan uygulamanın PID'sini ekrana yazdırır.
    echo "PID $pid kapatıldı."
done
