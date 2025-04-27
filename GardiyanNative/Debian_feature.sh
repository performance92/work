#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN} 1. CD-ROM deposu kaldırılıyor...${RESET}"
sed -i '/cdrom:/d' /etc/apt/sources.list

echo -e "${GREEN} 2. Debian internet depoları ekleniyor...${RESET}"
cat <<EOF > /etc/apt/sources.list
deb http://deb.debian.org/debian bookworm main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security bookworm-security main contrib non-free non-free-firmware
deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
EOF

echo -e "${GREEN} 3. Paket listesi güncelleniyor...${RESET}"
apt update -y

echo -e "${GREEN} 4. Gerekli paketler yükleniyor (sudo, adduser, passwd, login, wget, tar)...${RESET}"
apt install -y sudo adduser passwd login wget tar

echo -e "${GREEN} 5. Gardiyan kullanıcısı oluşturuluyor...${RESET}"
if id "gardiyan" &>/dev/null; then
    echo -e "${RED}gardiyan kullanıcısı zaten mevcut! İşlemi atlıyorum.${RESET}"
else
    adduser --gecos "" gardiyan
    echo -e "${GREEN}gardiyan kullanıcısı başarıyla oluşturuldu.${RESET}"
fi

echo -e "${GREEN} 6. Gardiyan kullanıcısına sudo yetkisi veriliyor...${RESET}"
usermod -aG sudo gardiyan

echo -e "${GREEN} 7. /etc/sudoers dosyasına yetki ekleniyor...${RESET}"
echo "gardiyan ALL=(ALL:ALL) ALL" | tee -a /etc/sudoers

echo -e "${GREEN} 8. PATH değişkeni düzeltiliyor...${RESET}"
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /root/.bashrc

echo -e "${GREEN} 9. Kurulum  dosyaları repodan indirilmisin mi?${RESET}"
read -rp "$(echo -e "${GREEN} Dosya indirilsin mi? (e/h): ${RESET}")" cevap_indir

if [[ "$cevap_indir" == "e" || "$cevap_indir" == "E" ]]; then
    echo -e "${GREEN} Dosya indiriliyor...${RESET}"
    wget --no-check-certificate --user=download --password=CK.123456 \
    "https://download.cekino.com/remote.php/dav/files/download/System/Native/1-%20Sunucu/debian/gardiyan_native_v2.5.3_debian.tar.gz"

    if [[ -f gardiyan_native_v2.5.3_debian.tar.gz ]]; then
        echo -e "${GREEN} ✅ Dosya başarıyla indirildi.${RESET}"

        read -rp "$(echo -e "${GREEN} Dosya çıkarılsın mı? (e/h): ${RESET}")" cevap_extract

        if [[ "$cevap_extract" == "e" || "$cevap_extract" == "E" ]]; then
            tar -xzvf gardiyan_native_v2.5.3_debian.tar.gz -C /home/gardiyan
            echo -e "${GREEN} Arşiv başarıyla çıkarıldı.${RESET}"

            TARGET_DIR="/home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1"
            if [[ -d "$TARGET_DIR" ]]; then
                chmod -R 777 "$TARGET_DIR"
                echo -e "${GREEN} $TARGET_DIR dizinindeki tüm dosyalara 777 yetkisi verildi.${RESET}"
            else
                echo -e "${RED} Dizin bulunamadı: $TARGET_DIR. Lütfen manuel kontrol edin.${RESET}"
            fi
        else
            echo -e "${RED}⏹ Dosya çıkarma işlemi atlandı.${RESET}"
        fi
    else
        echo -e "${RED}❌ Dosya indirilemedi! Lütfen bağlantıyı kontrol edin.${RESET}"
    fi
else
    echo -e "${RED}⏹ İndirme işlemi atlandı.${RESET}"
fi

# Reboot sorusu
read -rp "$(echo -e "${GREEN} Sistemi şimdi yeniden başlatmak ister misiniz? (e/h): ${RESET}")" cevap_reboot

if [[ "$cevap_reboot" == "e" || "$cevap_reboot" == "E" ]]; then
    echo -e "${GREEN} Sistem yeniden başlatılıyor...${RESET}"
    reboot
else
    echo -e "${GREEN}⏹ Yeniden başlatma atlandı. Değişikliklerin etkili olması için elle reboot önerilir.${RESET}"
fi
