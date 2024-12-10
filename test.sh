#!/bin/bash

# Nexus bilgileri
NEXUS_URL="nexus.cekino.local:5000"
NEXUS_USER="s.parti"
NEXUS_PASSWORD="Logos6337811"

# Docker'a giriş yap
echo "Docker'a Nexus için giriş yapılıyor..."
echo "$NEXUS_PASSWORD" | docker login "$NEXUS_URL" --username "$NEXUS_USER" --password-stdin
if [ $? -ne 0 ]; then
    echo "Docker login başarısız. Lütfen kullanıcı adı ve şifreyi kontrol edin."
    exit 1
fi

# Çalışan containerları listele
echo "Çalışan containerlar kontrol ediliyor..."
containers=$(docker ps -q)

if [ -z "$containers" ]; then
    echo "Hiçbir çalışan container bulunamadı."
    exit 0
fi

# Her bir container için işlemler
for container_id in $containers; do
    # İlgili container'ın imajını bul
    image_name=$(docker inspect --format='{{.Config.Image}}' "$container_id")
    echo "Container ID: $container_id, İmaj: $image_name"

    # İmajı commit et (yeni bir imaj oluştur)
    new_image_name="${NEXUS_URL}/$(basename "$image_name")"
    echo "İmaj commit ediliyor: $new_image_name"
    docker commit "$container_id" "$new_image_name"
    
    # İmajı Nexus için tag'la
    echo "İmaj etiketleniyor: $new_image_name"
    docker tag "$image_name" "$new_image_name"

    # İmajı Nexus'a gönder
    echo "İmaj Nexus'a gönderiliyor: $new_image_name"
    docker push "$new_image_name"
    
    # Sonuç bildirimi
    if [ $? -eq 0 ]; then
        echo "Başarıyla gönderildi: $new_image_name"
    else
        echo "Hata oluştu: $new_image_name gönderilemedi."
    fi
done

echo "Tüm işlemler tamamlandı."

