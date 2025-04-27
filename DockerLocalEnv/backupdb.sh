#!/bin/bash
BACKUP_DIR="/home/gardiyan/restore"
mkdir -p $BACKUP_DIR
echo "📌 PostgreSQL ve MongoDB yedekleme işlemi başlatılıyor..."

echo "📌 PostgreSQL yedekleme işlemi başlatılıyor..."
POSTGRES_DBS=("karcin_admin" "karcin_auth" "karcin_log" "karcin_client" "karcin_network" "karcin_pam" "karcin_soc" "karcin_patch" "guacamole")
POSTGRES_USER="postgres"
POSTGRES_HOST="localhost"
POSTGRES_PORT="7100"

for DB in "${POSTGRES_DBS[@]}"
do
    echo "📌 PostgreSQL Yedek Alınıyor: $DB"
    PGPASSWORD="Cekino.123!" pg_dump -U $POSTGRES_USER -h $POSTGRES_HOST -p $POSTGRES_PORT -d $DB > "$BACKUP_DIR/$DB.sql"
done

sleep 10
echo "✅ PostgreSQL yedekleme işlemi tamamlandı."

echo "📌 MongoDB yedekleme işlemi başlatılıyor..."
docker exec -i mongodb mongodump --username gardiyan --password 'Cekino.123!' --authenticationDatabase admin --out /backup
sleep 10
docker cp mongodb:/backup "$BACKUP_DIR/mongodb_backup"
sleep 10
echo "✅ MongoDB yedekleme işlemi tamamlandı."

echo "📌 Yedekler başarıyla alındı. Yedek dosyaları:"
ls -lah $BACKUP_DIR
echo "🎉 Tüm yedekleme işlemleri başarıyla tamamlandı!"
