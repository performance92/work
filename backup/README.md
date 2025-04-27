# Gardiyan Docker Kurulum Rehberi (Güncellenme Tarihi: 11.04.2025)

Bu rehber, Gardiyan uygulamasını Docker Compose kullanarak bir Linux makinesinde nasıl kurup çalıştıracağınızı açıklar. Başarılı bir kurulum için adımları dikkatlice takip edin.

## Otomatik Kurulum

İşlemleri otomatik olarak yapmak istiyorsanız `gardiyan_install.sh` betiğini sunucunuza indirip root yetkisiyle çalıştırın.

Eğer betiği uzaktan indirip otomatik çalıştırmak istiyorsanız aşağıdaki komutu makinenizde çalıştırın:

```bash
curl -L -s http://git.cekino.local/s.parti/DockerLocalEnv.git/raw/branch/main/gardiyan_install.sh -o gardiyan_install.sh && chmod +x gardiyan_install.sh && ./gardiyan_install.sh
```

Betiği çalıştırmadan önce `gardiyan` adlı kullanıcıyı oluşturun, sonra root kullanıcısına geçip root yetkisiyle betiği çalıştırın. Kurulum süreci ağ hızı ve sistem performansına bağlı olarak değişebilir.

Eğer adımları manuel yapmak istiyorsanız aşağıdaki adımlar ile devam edin.

---

## Gereksinimler

1. `gardiyan` adlı kullanıcıyı oluşturun:
   ```bash
   sudo adduser gardiyan
   ```
2. Root yetkisi vermek isterseniz:
   ```bash
   sudo usermod -aG sudo gardiyan
   ```
3. Docker kurulumu:
   ```bash
   sudo apt-get install docker*
   ```
4. Docker hizmetini kontrol edin:
   ```bash
   systemctl status docker
   ```

---

## Docker Yapılandırması

1. Docker daemon ayar dosyasını düzenleyin:
   ```bash
   sudo nano /etc/docker/daemon.json
   ```
   Şu içeriği ekleyin:
   ```json
   {
     "insecure-registries": ["nexusdev.cekino.com"]
   }
   ```
2. Kaydedip çıkın ve Docker'ı yeniden başlatın:
   ```bash
   sudo systemctl restart docker
   ```

---

## Host Dosyası Yapılandırması *(Test ortamları içindir)*

1. Docker login için:
   ```bash
   echo "Gardiyan.2025!" | docker login nexusdev.cekino.com -u setup --password-stdin
   ```

---

## Gardiyan Deposu'nu İndirme

```bash

git clone http://git.cekino.local/s.parti/DockerLocalEnv.git
```

---

## Docker Compose'u Çalıştırma

1. Gardiyan dizinine gidin:
   ```bash
   cd /home/gardiyan/Gardiyanall
   ```
2. Nessus ve OpenVAS kurmak için:
   ```bash
   docker-compose -f docker-compose-nessus.yml -f docker-compose-openvas.yml up -d
   ```
3. Sadece Gardiyan için:
   ```bash
   docker-compose up -d
   ```
4. Superset ile birlikte kurulum:
   ```bash
   docker-compose -f /home/gardiyan/Gardiyan/docker-compose.yml up -d &
   docker-compose -f /home/gardiyan/Superset/docker-compose-gardiyan.yml up -d
   ```

---

## Compose Dosyası Neler Yapar?

- **Gardiyan Bileşenleri:** auth, admin, istemci, log-center, network vb.
- **Veritabanları:** PostgreSQL ve MongoDB
- **Hizmetler:** RabbitMQ, Redis, Openfire, Guacamole, Nessus, OpenVAS
- **Araçlar:** Tüm bağımlılıklar otomatik çalışır

Kurulum sonrası sisteminizde:
1. İmajlar çekilir.
2. Konteynerlar kurulur.
3. Yapılandırmalar yapılır ve başlatılır.

Konteyner kurulumundan sonra bundle ve `db-deploy` süreçleri başlar. `htop` komutuyla izleyebilirsiniz.

---

## Netdisco Deployment

Konteyner durumunu kontrol edin:
```bash
docker ps -a
```
Loglar için:
```bash
docker logs -f <container_adı>
```
Netdisco kurulumu:
```bash
docker exec -it netdisco-container sh
netdisco-deploy
```
Tüm sorulara "yes", bilgiler için admin/admin girin.

---

## Veritabanı Yetkilendirmesi

```bash
docker exec -it postgres psql -U postgres -d karcin_network -c "INSERT INTO public.users (...) VALUES (...);"
```
*(Komut içeriği yukarıdaki uzun haliyle kullanılabilir.)*

---

## NGINX Ayarları (FQDN Gerektiren Ortamlar)

Grafana için NGINX örnek konfig:
```nginx
location /grafana/ {
    proxy_pass http://127.0.0.1:3001;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_read_timeout 86400;
}
```

---

## Log, NetFlow, sFlow Konfigürasyonu

Aşağıdaki portları açın:
- Syslog: 515
- NetFlow: 2055
- sFlow: 6343
- Trap: 162

---

## Kafka Retention Ayarları

```bash
docker exec -it kafka kafka-configs \
  --bootstrap-server kafka:9092 \
  --entity-type topics \
  --entity-name flows-messages \
  --alter \
  --add-config retention.ms=60000,segment.ms=30000
```
Kontrol için:
```bash
docker exec -it kafka bash
cd /var/lib/kafka/data
watch -d ls -lh flows-messages-0/
```

---

## TCPDump ile Test

- SNMP Trap:
```bash
tcpdump -i any udp port 162 -vvv
```
- Syslog:
```bash
tcpdump -i any udp port 515 -vvv
```
- NetFlow:
```bash
tcpdump -i any udp port 2055 -vvv
```
- sFlow:
```bash
tcpdump -i any udp port 6343 -vvv
```

---

## SNMP v2/v3 Test

- SNMP v2:
```bash
snmpwalk -v2c -c public localhost
```
- SNMP v3:
```bash
snmpwalk -v3 -u admin -l authPriv -a SHA -A "authpassword" -x AES -X "privpassword" localhost
```

---

## Log Mekanizması Kurulumu

```bash
cd /home/gardiyan/Gardiyan/log
docker compose up -d
```
Kibana arayüzden:
- Index pattern: `docker-*`
- Timestamp field: `@timestamp`
- 7 gün saklama politikası ayarlayın

---

## Doğrulama

1. Arayüz IP adresi ile erişilebilir.
2. Varsayılan bilgiler:
   - Kullanıcı: `admin`
   - Şifre: `changeme`

---

## Kullanıma Hazır

Gardiyan artık hazır. Sistemi yönetmeye başlayabilirsiniz.



