#README

запуск
-----------------

#####В данном варианте рлэйбука для хостовой машины используется  `Ubuntu Server 18.04 LTS`
Что бы не менять переменные в `vars.yaml`


0. запускаем инстенс на aws c открытым в фаерволе ssh(22) и http(80) портом
1. переходим в скачанный репозиторий и изменяем в файле `hosts` dns имя инстанса и указываем путь до private key файла (`ansible_ssh_private_key_file`)
2. запускаем плэйбук командой `ansible-playbook -i hosts main.yaml`
3. вводим в строку браузера dns имя хоста который был указан в файле `hosts`

-----------------
## плэйбук разворачиваем на ec2 aws, отображение новейшего кадра с видео стрима
На инстансе разворачивается 3 контейнера:
1) C nginx для отображения картинки
2) Для запуска скрипта, изменения ссылки индексного дискриптера на новейший файл и очистки устаревших jpg файлов
3) Разбивка видеопотока на jpg файлы (так как в примере видеопоток не бесконечный, по его завершению контейнер рестартуется и начинается воспроизведение с начала)

Создаются 2 докер вольюма для связи 1-го и 2-го, 2-го и 3-го контейнеров

Конфиг nginx храниться на хостовой машине

Скрипт для второго контейнера также храниться на самом хосте, что бы лишний раз не собирать, билдить, пушить образ

```
FROM ubuntu
ADD script.sh /opt/script.sh
CMD /bin/bash /opt/script.sh
```
Я посчитал, что писать целую роль ради 2-х тасок это оверхед для данного задания, поэтому просто разбил на несколько yaml файлов
