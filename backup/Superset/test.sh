#!/bin/bash
backup_dir="/home/superset/backup" # Yedeklerin kaydedileceği dizin
mkdir -p $backup_dir

for volume in $(docker volume ls -q); do
    docker run --rm -v ${volume}:/data -v ${backup_dir}:/backup ubuntu tar cvf /backup/${volume}.tar /data
done

echo "Tüm volume'lar başarıyla yedeklendi. Yedekler $backup_dir dizininde."

