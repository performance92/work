#!/bin/bash

# Nexus Ayarları
NEXUS_URL="nexus.cekino.local:5000"
REPOSITORY_NAME="nexus.cekino.local"

# Log dosyası
LOG_FILE="nexus_push_log_$(date +'%Y%m%d_%H%M%S').txt"
echo "Log dosyası: $LOG_FILE" > $LOG_FILE

# İşlem sırasında bekleme süresi (saniye)
TIMER_INTERVAL=2  # Her işlem sonrası bekleme süresi (değiştirilebilir)

# Tüm çalışan container'ları al
containers=$(docker ps --format "{{.ID}} {{.Names}}")

if [ -z "$containers" ]; then
    echo "Hiçbir çalışan container bulunamadı." | tee -a $LOG_FILE
    exit 0
fi

echo "Toplam $(echo "$containers" | wc -l) container bulundu. İşlemler başlıyor..." | tee -a $LOG_FILE

# Her bir container'ı işleyin
while IFS= read -r container; do
    CONTAINER_ID=$(echo "$container" | awk '{print $1}')
    CONTAINER_NAME=$(echo "$container" | awk '{print $2}')

    # Yeni imaj adı oluştur (Container adı doğrudan kullanılır)
    NEW_IMAGE_NAME="${REPOSITORY_NAME}/${CONTAINER_NAME}"
    TAG="latest"

    # Değişiklikleri commit et
    echo "Container commit ediliyor: $CONTAINER_NAME ($CONTAINER_ID) -> $NEW_IMAGE_NAME:$TAG" | tee -a $LOG_FILE
    if docker commit "$CONTAINER_ID" "$NEW_IMAGE_NAME:$TAG"; then
        echo "Commit işlemi başarılı: $NEW_IMAGE_NAME:$TAG" | tee -a $LOG_FILE
    else
        echo "Commit işlemi başarısız: $CONTAINER_NAME ($CONTAINER_ID)" | tee -a $LOG_FILE
        continue
    fi

    # Yeni imajı Nexus için etiketle
    NEXUS_TAG="${NEXUS_URL}/${NEW_IMAGE_NAME}:${TAG}"
    echo "Etiketleniyor: $NEW_IMAGE_NAME:$TAG -> $NEXUS_TAG" | tee -a $LOG_FILE
    if docker tag "$NEW_IMAGE_NAME:$TAG" "$NEXUS_TAG"; then
        echo "Etiketleme başarılı: $NEXUS_TAG" | tee -a $LOG_FILE
    else
        echo "Etiketleme başarısız: $NEW_IMAGE_NAME:$TAG" | tee -a $LOG_FILE
        continue
    fi

    # Nexus'a push et
    echo "Push ediliyor: $NEXUS_TAG" | tee -a $LOG_FILE
    if docker push "$NEXUS_TAG"; then
        echo "Push işlemi başarılı: $NEXUS_TAG" | tee -a $LOG_FILE
    else
        echo "Push işlemi başarısız: $NEXUS_TAG" | tee -a $LOG_FILE
        continue
    fi

    # İşlem sonrası bekleme
    echo "Bekliyor... (${TIMER_INTERVAL} saniye)" | tee -a $LOG_FILE
    sleep $TIMER_INTERVAL

    echo "Container tamamlandı: $CONTAINER_NAME ($CONTAINER_ID)" | tee -a $LOG_FILE
    echo "--------------------------------------------" | tee -a $LOG_FILE
done <<< "$containers"

echo "Tüm işlemler tamamlandı. Log: $LOG_FILE" | tee -a $LOG_FILE


