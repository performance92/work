#!/bin/bash

NEXUS_URL="nexus.cekino.local:5005"
LOG_FILE="nexus_push_log_$(date +'%Y%m%d_%H%M%S').txt"
TIMER_INTERVAL=2  # Her işlem sonrası bekleme süresi

echo "Log dosyası: $LOG_FILE" > "$LOG_FILE"

# Docker ps -a komutu ile tüm container'ları listele
containers=$(docker ps -a --format "{{.ID}} {{.Names}}")

if [ -z "$containers" ]; then
    echo "Hiçbir container bulunamadı." | tee -a "$LOG_FILE"
    exit 0
fi

echo "Toplam $(echo "$containers" | wc -l) container bulundu. İşlemler başlıyor..." | tee -a "$LOG_FILE"

# Tüm container'lar üzerinde işlem yap
while IFS= read -r container; do
    CONTAINER_ID=$(echo "$container" | awk '{print $1}')
    CONTAINER_NAME=$(echo "$container" | awk '{print $2}')

    # Yeni imaj adı ve tag oluştur
    NEW_IMAGE_NAME="${NEXUS_URL}/${CONTAINER_NAME}"
    TAG="${CONTAINER_NAME}:latest"

    echo "Container commit ediliyor: $CONTAINER_NAME ($CONTAINER_ID) -> $TAG" | tee -a "$LOG_FILE"
    if docker commit "$CONTAINER_ID" "$TAG"; then
        echo "Commit işlemi başarılı: $TAG" | tee -a "$LOG_FILE"
    else
        echo "Commit işlemi başarısız: $CONTAINER_NAME ($CONTAINER_ID)" | tee -a "$LOG_FILE"
        continue
    fi

    echo "Etiketleniyor: $TAG -> $NEW_IMAGE_NAME" | tee -a "$LOG_FILE"
    if docker tag "$TAG" "$NEW_IMAGE_NAME"; then
        echo "Etiketleme başarılı: $NEW_IMAGE_NAME" | tee -a "$LOG_FILE"
    else
        echo "Etiketleme başarısız: $TAG" | tee -a "$LOG_FILE"
        continue
    fi

    echo "Push ediliyor: $NEW_IMAGE_NAME" | tee -a "$LOG_FILE"
    if docker push "$NEW_IMAGE_NAME"; then
        echo "Push işlemi başarılı: $NEW_IMAGE_NAME" | tee -a "$LOG_FILE"
    else
        echo "Push işlemi başarısız: $NEW_IMAGE_NAME" | tee -a "$LOG_FILE"
        continue
    fi

    echo "Bekliyor... (${TIMER_INTERVAL} saniye)" | tee -a "$LOG_FILE"
    sleep "$TIMER_INTERVAL"

    echo "Container tamamlandı: $CONTAINER_NAME ($CONTAINER_ID)" | tee -a "$LOG_FILE"
    echo "--------------------------------------------" | tee -a "$LOG_FILE"
done <<< "$containers"

echo "Tüm işlemler tamamlandı. Log: $LOG_FILE" | tee -a "$LOG_FILE"

