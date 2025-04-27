#!/bin/bash

# Root kontrolü
if [[ $EUID -ne 0 ]]; then
   echo "Bu betiği çalıştırmak için root yetkisi gereklidir."
   exit 1
fi


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' 

function print_header() {
  clear
  tput cup 0 0
  echo -e "${CYAN}"
  echo "   ██████╗  █████╗ ██████╗ ██████╗  ██ ██╗   ██╗ █████╗ ███╗   ██╗"
  echo "  ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗    ╚██╗ ██╔╝██╔══██╗████╗  ██║"
  echo "  ██║  ███╗███████║██████╔╝██║  ██║ ██  ╚████╔╝ ███████║██╔██╗ ██║"
  echo "  ██║   ██║██╔══██║██╔══██╗██║  ██║ ██   ╚██╔╝  ██╔══██║██║╚██╗██║"
  echo "  ╚██████╔╝██║  ██║██║  ██║██████╔╝ ██    ██║   ██║  ██║██║ ╚████║"
  echo "   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝"
  echo -e "${NC}"
  echo -e "${YELLOW}════════════════════════════════════════════════════════════"
  echo -e "                      GARDİYAN Kurulum"
  echo -e "════════════════════════════════════════════════════════════${NC}"
  echo
}

function update_progress() {
  echo -e "${BLUE}>> ${NC}$1"
}

print_header

### Kurulum İşlemleri

update_progress "Docker kurulumu güncelleniyor..."
sudo apt-get update
sudo apt-get install -y docker*

update_progress "Docker servisi başlatılıyor..."
sudo systemctl enable docker
sleep 10

update_progress "Docker daemon yapılandırılıyor..."
cat > /etc/docker/daemon.json <<EOL
{
    "insecure-registries": ["nexusdev.cekino.com"]
}
EOL
systemctl restart docker
sleep 10

update_progress "Gardiyan docker kullanıcı ayarları yapılandırılıyor..."
sudo usermod -aG docker gardiyan
sudo usermod -aG sudo gardiyan
sudo bash -c "echo 'gardiyan ALL=(ALL:ALL) NOPASSWD: ALL' > /etc/sudoers.d/90-gardiyan-nopasswd"

update_progress "Hosts dosyası düzenleniyor..."
cat >> /etc/hosts <<EOL
172.16.21.230 git.cekino.local
EOL

update_progress "Docker repolarına giriş yapılıyor..."
echo "Gardiyan.2025!" | docker login nexusdev.cekino.com -u setup --password-stdin

update_progress "Gardiyan repoları indiriliyor..."
# İhtiyacınıza göre aşağıdaki git clone komutlarını aktif edebilirsiniz:
# git clone http://git.cekino.local/s.parti/Gardiyan.git /home/gardiyan/Gardiyan
# git clone http://git.cekino.local/o.yuksel/Superset.git /home/gardiyan/Superset
# git clone http://git.cekino.local/s.parti/Gardiyanprod.git /home/gardiyan/
git clone http://git.cekino.local/s.parti/DockerLocalEnv.git /tmp/Gardiyanall

update_progress "Dosyalar indirildi. Bekleniyor..."
sleep 5 

if [ ! -d "/home/gardiyan" ]; then
    mkdir -p /home/gardiyan
    update_progress "/home/gardiyan dizini oluşturuldu."
fi

rsync -av --progress /tmp/Gardiyanall/ /home/gardiyan/

# Geçici dosyalar temizleniyor
rm -rf /tmp/Gardiyanall
update_progress "Depo başarıyla /home/gardiyan/ altına taşındı!"
update_progress "Klasörler taşındı. İşlem devam ediyor..."
sleep 3
update_progress "Dosya indirme ve taşıma işlemi tamamlandı!"

cd /home/gardiyan/Gardiyan || { update_progress "Dizin bulunamadı! Çıkılıyor..."; exit 1; }

CURRENT_IP=$(hostname -I | awk '{print $1}')
update_progress "Makinenin mevcut IP adresi: $CURRENT_IP"

FOLDERS=("etcAdmin" "etcAuth" "etcClient" "etcLC" "etcMDM" "etcPAM" "etcSOC" "etcPatch" "etcNetwork")

update_progress "Klonlanan dosyalarda IP adresi güncelleniyor..."
for folder in "${FOLDERS[@]}"; do
    TARGET_FOLDER="/home/gardiyan/Gardiyan/$folder"
    if [[ -d $TARGET_FOLDER ]]; then
        update_progress "$TARGET_FOLDER klasörü kontrol ediliyor..."
        find "$TARGET_FOLDER" -type f | while read -r file; do
            update_progress "Dosya işleniyor: $file"
            sed -i "s/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$CURRENT_IP/g" "$file"
        done
    else
        update_progress "$TARGET_FOLDER klasörü bulunamadı, atlanıyor."
    fi
done

# Yetkilendirme Ayarları
REPO_FOLDER="/home/gardiyan/Gardiyan/Repo"
if [[ -d $REPO_FOLDER ]]; then
    update_progress "$REPO_FOLDER klasörü ve altındaki dosyaların yetkileri ayarlanıyor..."
    chown -R root:root "$REPO_FOLDER"
    chmod -R 777 "$REPO_FOLDER"
else
    update_progress "$REPO_FOLDER klasörü bulunamadı. Lütfen klasörün mevcut olduğundan emin olun."
fi

# Docker Compose Dosya Kontrolleri
if [[ ! -f "docker-compose.yml" ]]; then
    update_progress "HATA: 'docker-compose.yml' dosyası bulunamadı! Lütfen Gardiyan deposunun eksiksiz klonlandığını kontrol edin."
    exit 1
fi

# --- Aşağıda interaktif menü bölümü mevcut ---

function print_error() {
  echo -e "\n${RED}✗ HATA: $1${NC}\n"
}

function print_success() {
  echo -e "\n${GREEN}✓ BAŞARILI: $1${NC}\n"
}

function check_files() {
  missing=()
  for file in "$@"; do
    [[ ! -f "$file" ]] && missing+=("$file")
  done
  if [[ ${#missing[@]} -gt 0 ]]; then
    print_error "Eksik dosya(lar): ${missing[*]}"
    return 1
  fi
  return 0
}

function run_docker_compose() {
  echo -e "${BLUE}▶ $1${NC}"
  shift
  if docker compose "$@"; then
    print_success "Docker Compose işlemi tamamlandı!"
  else
    print_error "Docker Compose hatası!"
    exit 1
  fi
}

function main_menu() {
    PS3="${YELLOW}➤ Lütfen bir seçenek girin [1-7]: ${NC} "

  options=(
    "Gardiyan + Strelka"
    "Gardiyan + OpenVAS"
    "Gardiyan + Nessus"
    "Gardiyan + OpenVAS + Nessus"
    "Gardiyan + Superset"
    "Gardiyan + Nessus + OpenVAS + Superset"
    "Çıkış"
  )

  print_header
  echo -e "${YELLOW}Lütfen yüklemek istediğiniz bileşeni seçin:${NC}\n"

  select opt in "${options[@]}"; do
    case $REPLY in
      1)
        run_docker_compose "Gardiyan-Strelka çalıştırılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose.yml \
          -f /home/gardiyan/Gardiyan/strelka/build/docker-compose-no-build.yaml \
          up -d
        break
        ;;
      2)
        check_files \
          "/home/gardiyan/Gardiyan/docker-compose.yml" \
          "/home/gardiyan/Gardiyan/docker-compose-openvas.yml" || exit 1
        run_docker_compose "Gardiyan ve OpenVAS başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose.yml \
          -f /home/gardiyan/Gardiyan/docker-compose-openvas.yml \
          up -d
        break
        ;;
      3)
        check_files \
          "/home/gardiyan/Gardiyan/docker-compose.yml" \
          "/home/gardiyan/Gardiyan/docker-compose-nessus.yml" || exit 1
        run_docker_compose "Gardiyan ve Nessus başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose.yml \
          -f /home/gardiyan/Gardiyan/docker-compose-nessus.yml \
          up -d
        break
        ;;
      4)
        check_files \
          "/home/gardiyan/Gardiyan/docker-compose.yml" \
          "/home/gardiyan/Gardiyan/docker-compose-openvas.yml" \
          "/home/gardiyan/Gardiyan/docker-compose-nessus.yml" || exit 1
        run_docker_compose "Gardiyan + OpenVAS + Nessus başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose.yml \
          -f /home/gardiyan/Gardiyan/docker-compose-openvas.yml \
          -f /home/gardiyan/Gardiyan/docker-compose-nessus.yml \
          up -d
        break
        ;;
      5)
        check_files \
          "/home/gardiyan/Gardiyan/docker-compose.yml" \
          "/home/gardiyan/Superset/docker-compose-gardiyan.yml" || exit 1
        run_docker_compose "Gardiyan başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose.yml up -d &
        run_docker_compose "Superset başlatılıyor..." \
          -f /home/gardiyan/Superset/docker-compose-gardiyan.yml up -d
        wait
        break
        ;;
      6)
        check_files \
          "/home/gardiyan/Gardiyan/docker-compose.yml" \
          "/home/gardiyan/Gardiyan/docker-compose-nessus.yml" \
          "/home/gardiyan/Gardiyan/docker-compose-openvas.yml" \
          "/home/gardiyan/Superset/docker-compose-gardiyan.yml" || exit 1
        run_docker_compose "Gardiyan başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose.yml up -d &
        run_docker_compose "Nessus başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose-nessus.yml up -d &
        run_docker_compose "OpenVAS başlatılıyor..." \
          -f /home/gardiyan/Gardiyan/docker-compose-openvas.yml up -d &
        run_docker_compose "Superset başlatılıyor..." \
          -f /home/gardiyan/Superset/docker-compose-gardiyan.yml up -d
        wait
        break
        ;;
      7)
        echo -e "\n${YELLOW}🖐️  Görüşmek üzere!${NC}\n"
        exit 0
        ;;
      *)
        print_error "Geçersiz seçim! Lütfen 1-7 arası bir numara girin."
        ;;
    esac
  done
}


main_menu

update_progress "Geçici dosyalar temizleniyor..."
rm -rf /root/gardiyan_install.sh 
rm -rf /home/gardiyan/gardiyan_install.sh
rm -rf /home/README.md
update_progress "History temizleniyor..."
history -c 
update_progress "Kurulum tamamlandı. Arka planda Karaf bundle'lar yükleniyor ve DB deployment işlemleri yapılıyor."
update_progress "Bu işlem yaklaşık 3-5 dakika sürebilir. Tamamlandığında Gardiyan arayüzüne erişebilirsiniz."

