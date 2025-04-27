#!/bin/bash

BACKUP_DIR="/home/gardiyan/restore"

echo "📌 PostgreSQL ve MongoDB geri yükleme işlemi başlatılıyor..."

echo "📌 Servisler Durduruluyor Ve PostgreSQL veritabanları siliniyor ve yeniden oluşturuluyor..."
cd /home/gardiyan/Gardiyan
docker compose down
sleep 10

POSTGRES_DBS=("karcin_admin" "karcin_auth" "karcin_log" "karcin_client" "karcin_network" "karcin_pam" "karcin_soc" "karcin_patch" "guacamole")
docker compose up -d db mongodb 
sleep 20
docker exec -i postgres psql -U postgres -c "ALTER SYSTEM SET superuser_reserved_connections = 3;"
docker exec -i postgres psql -U postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname IN ('${POSTGRES_DBS[@]}');"
docker restart postgres
sleep 10

for DB in "${POSTGRES_DBS[@]}"
do
    echo " Siliniyor: $DB"
    docker exec -i postgres psql -U postgres -c "DROP DATABASE IF EXISTS $DB;"
    
    echo " Yeniden oluşturuluyor: $DB"
    docker exec -i postgres psql -U postgres -c "CREATE DATABASE $DB;"

    if [[ -f "$BACKUP_DIR/$DB.sql" ]]; then
        echo "📌 PostgreSQL geri yükleniyor: $DB"
        docker exec -i postgres psql -U postgres -d $DB < $BACKUP_DIR/$DB.sql
        echo " $DB geri yüklendi!"
    else
        echo " Uyarı: $DB.sql dosyası bulunamadı, geri yükleme atlandı!"
    fi
done

echo " PostgreSQL geri yükleme işlemi tamamlandı."

echo " MongoDB geri yükleme işlemi başlatılıyor..."

if [[ -d "$BACKUP_DIR/mongodb_backup" ]]; then
    docker cp $BACKUP_DIR/mongodb_backup mongodb:/backup

    echo " MongoDB eski verileri siliniyor..."
    docker exec -it mongodb mongosh --username gardiyan --password 'Cekino.123!' --authenticationDatabase admin --eval "
    db.adminCommand({shutdown: 1, force: true});
   "

    docker exec -it mongodb mongorestore --username gardiyan --password 'Cekino.123!' --authenticationDatabase admin /backup

    echo " MongoDB geri yükleme işlemi tamamlandı."
else
    echo "Uyarı: MongoDB yedek klasörü bulunamadı, geri yükleme atlandı!"
fi

echo " PostgreSQL ve MongoDB yeniden başlatılıyor..."
cd /home/gardiyan/Gardiyan
docker compose down
sleep 10
docker compose up -d

echo "🎉 Tüm geri yükleme işlemleri başarıyla tamamlandı!"
