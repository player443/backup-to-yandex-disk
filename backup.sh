#!/bin/sh
# Место размещения резервных файлов на Яндекс Диске
backups_dir='/mnt/yandex/backups'
# Абсолютный путь к папке, которую будем бэкапить
data_dir='/data/'
# Пароль, с помощью которого будут шифроваться данные
password='y0ur_p4$$w0rd'
# Создаём архив
/usr/bin/tar czvpf - $data_dir | gpg --symmetric --cipher-algo aes256 --batch --no-tty --passphrase "$password" -o $backups_dir/data_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz.gpg
# Удаляем архивы старше 30 дней
/usr/bin/find $yandex_dir -type f -mtime +30 -exec rm {} \;
