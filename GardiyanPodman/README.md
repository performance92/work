
# Gardiyan Podman Kurulum Rehberi (Güncellenme Tarihi: 09.04.2025)

Bu rehber, Gardiyan uygulamasını **Podman ve Podman Compose** kullanarak bir Linux makinesinde nasıl kurup çalıştıracağınızı açıklar. Başarılı bir kurulum için adımları dikkatlice takip edin.

## Otomatik Kurulum

İşlemleri otomatik olarak yapmak istiyorsanız `gardiyan_install.sh` betiğini sunucunuza indirip **root yetkisiyle** çalıştırınız.

Eğer betiği uzaktan indirip otomatik çalıştırmak istiyorsanız aşağıdaki komutu makinenizde çalıştırın:

```bash
curl -L -s http://git.cekino.local/s.parti/GardiyanPodman.git/raw/branch/main/gardiyan_install.sh -o gardiyan_install.sh && chmod +x gardiyan_install.sh && ./gardiyan_install.sh
```

**Not:** Betiği çalıştırmadan önce `gardiyan` adlı kullanıcıyı oluşturup `root` kullanıcısına geçmeniz önerilir. Kurulum süresi, ağ hızı ve sistem performansınıza göre değişebilir.

Eğer adımları manuel olarak yapmak istiyorsanız aşağıdaki adımları takip edebilirsiniz:

---

## Gereksinimler

1. `gardiyan` adlı kullanıcıyı oluşturun:
   ```bash
   sudo adduser gardiyan
   ```
2. Kullanıcıya sudo yetkisi vermek isterseniz:
   ```bash
   sudo usermod -aG sudo gardiyan
   ```

3. Podman kurulumunu gerçekleştirin:
   ```bash
   sudo apt-get update
   sudo apt-get install podman podman-compose -y
   ```

4. Podman kurulumunu doğrulayın:
   ```bash
   systemctl status podman
   ```

---

## Podman Daemon (Registry Ayarları)

Podman için insecure registry ayarı yapmak isterseniz:

1. `/etc/containers/registries.conf` dosyasını düzenleyin:
   ```bash
   sudo nano /etc/containers/registries.conf
   ```

2. Şu satırı ekleyin veya düzenleyin:
   ```toml
   [[registry]]
   prefix = "nexusdev.cekino.com:5005"
   insecure = true
   ```

3. Değişikliklerden sonra `podman` yeniden başlatmaya gerek yoktur, otomatik uygulanır.

---

## Host Dosyası Yapılandırması (Test Ortamı için)

**Bu adım sadece test ortamları için geçerlidir. Müşteri ortamlarında yapılması gerekmez.**

1. `/etc/hosts` dosyasını düzenleyin:
   ```bash
   sudo nano /etc/hosts
   ```

2. Aşağıdaki satırları ekleyin:
   ```
   #172.16.20.141 nexusdev.cekino.com
   #172.16.21.230 git.cekino.local
   ```

---

## Podman ile Registry Girişi (Login)

Repo indirmeleri yapabilmek için aşağıdaki komutu kullanarak giriş yapın:

```bash
echo "Gardiyan.2025!" | podman login nexusdev.cekino.com -u setup --password-stdin
```

---

## Gardiyan Deposu’nu İndirme

Test ortamı için:
```bash
git clone http://git.cekino.com/s.parti/GardiyanPodman.git
```

Production ortamı için:
```bash
git clone https://git.gardiyan.com/Gardiyan/GardiyanPodman.git
```

---

## Podman Compose ile Servisleri Başlatma

1. Gardiyan deposuna gidin:
   ```bash
   cd /home/gardiyan/GardiyanPodman
   ```

2. Gardiyan + Nessus + OpenVAS kurulumları için:
   ```bash
   podman-compose -f podman-compose-nessus.yml -f podman-compose-openvas.yml up -d
   ```

3. Sadece Gardiyan kurulumu için:
   ```bash
   podman-compose up -d
   ```

4. Gardiyan + Superset kurmak istiyorsanız:
   ```bash
   podman-compose -f /home/gardiyan/Gardiyan/podman-compose.yml up -d &
   podman-compose -f /home/gardiyan/Superset/podman-compose-gardiyan.yml up -d
   ```

---

## Bu Compose Dosyası Ne Yapar?

Podman Compose dosyası aşağıdaki bileşenleri otomatik olarak kurar:

- **Gardiyan Bileşenleri:** auth, admin, istemci yönetimi, log-center
- **Veritabanları:** PostgreSQL ve MongoDB
- **Diğer Hizmetler:** RabbitMQ, Redis, Openfire, Guacamole, Nessus, OpenVAS
- **Üçüncü Parti Bağımlılıklar:** Gardiyan’ın ihtiyaç duyduğu tüm yardımcı hizmetler

Kurulum süreci:

1. İmajları ilgili registry’lerden çeker
2. Gerekli container’ları başlatır ve ayarları uygular
3. Ağ yapılandırmalarını gerçekleştirir

**Not:** Kurulumdan sonra veritabanı işlemleri ve bundle yüklemesi arka planda devam eder. Sistem performansına göre bu işlemler biraz zaman alabilir.

Takip için `htop` veya `podman ps` komutları kullanılabilir.

---

## Doğrulama

Kurulum tamamlandıktan sonra:

1. IP adresinizi tarayıcınızda açarak Gardiyan arayüzüne erişin.
2. Varsayılan giriş bilgileri:
   - **Kullanıcı Adı:** `admin`
   - **Şifre:** `changeme`

---

## Kullanıma Hazır

Tebrikler! Gardiyan artık kullanıma hazır. Sistemi yapılandırabilir ve izlemeye başlayabilirsiniz.

**Not:** Network modülüyle ilgili geliştirmeler yapılmakta olup, ilerleyen güncellemelerde burada yer alacaktır.
