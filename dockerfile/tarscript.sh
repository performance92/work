#!/bin/bash

# Yedekleme dizinini belirleyin
BACKUP_DIR="./docker_images_backup"
mkdir -p "$BACKUP_DIR"

# Tüm Docker imajlarını listele
IMAGES=$(docker images --format "{{.Repository}}:{{.Tag}}")

if [ -z "$IMAGES" ]; then
    echo "Hiçbir Docker imajı bulunamadı!"
    exit 1
fi

echo "Docker imajları yedekleniyor..."

# Tüm imajları döngüye alarak tar formatında yedekle
for IMAGE in $IMAGES; do
    SAFE_NAME=$(echo "$IMAGE" | tr '/:' '_')
    docker save -o "$BACKUP_DIR/$SAFE_NAME.tar" "$IMAGE"
    echo "$IMAGE başarıyla yedeklendi -> $SAFE_NAME.tar"
done

echo "Tüm Docker imajları başarıyla yedeklendi. Yedek dizini: $BACKUP_DIR"
