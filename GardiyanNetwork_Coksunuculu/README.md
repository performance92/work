# **Gardiyan Network Modülü Kurulum Kılavuzu**

Bu belge, Gardiyan Network Modülü'nün internet bağlantısı üzerinden nasıl kurulacağını açıklar.

---

## **Gereksinimler**
- **Ubuntu 22.04** işletim sistemi
- **Docker** ve **Docker Compose** yüklü olmalıdır
- **İnternet bağlantısı** gereklidir

---

## **1. Mevcut Docker Durumunu Kontrol Etme**
Docker'ın çalışıp çalışmadığını kontrol etmek için:

```bash
docker container ls
```

---

## **2. Docker Konfigürasyonu**
Docker'ı özel repository'den çekebilmek için aşağıdaki adımlar uygulanmalıdır:

```bash
vim /etc/docker/daemon.json
```

Dosyanın içeriğini şu şekilde düzenleyin:

```json
{
    "insecure-registries": ["repo.gardiyan.com"]
}
```

Docker'ı yeniden başlatın:

```bash
systemctl restart docker
```

Docker repository'ye giriş yapın:

```bash
docker login repo.gardiyan.com || test ortam için docker login nexusdev.cekino.com
```

**Kullanıcı Adı:** setup  
**Şifre:** Gardiyan.2025!

Giriş başarılı olduğunda **"Login Succeeded"** mesajı alınmalıdır.

---

## **3. Proje Dosyalarının İndirilmesi**

Eğer Network Modülü, Gardiyan'ın çalıştığı sunucuya kurulacaksa:

```bash
git clone https://git.gardiyan.com/Gardiyan/GardiyanNetwork_TekSunuculu.git
```

Eğer ayrı bir sunucuya kurulacaksa:

```bash
git clone https://git.gardiyan.com/Gardiyan/GardiyanNetwork_Coksunuculu.git
```

---

## **4. Yapılandırma Dosyalarının Güncellenmesi**

Aşağıdaki dosyalar gerektiğinde güncellenmelidir:

- **/etcNetwork/com.karcin.network.cfg**
- **/etcNetwork/com.karcin.network.datasource.cfg**


## **5. Servisleri Başlatma**

Docker Compose kullanarak servisleri ayağa kaldırın:

```bash
docker-compose up -d veya docker compose up -d
```

Kurulum tamamlandıktan sonra mevcut durumu kontrol etmek için:

```bash
docker container ls veya docker ps -a 
```

---

## **6. Netdisco Deployment**

Tüm konteynerlerin çalıştığını doğrulamak için:

```bash
docker container ls veya docker ps -a
```

Eğer ayağa kalkmayan container var ise logları kontrol edin:

```bash
docker logs -f container_name veya container_id
```

Netdisco kurulumuna geçmek için:

```bash
docker exec -it "netdisco-container" sh
netdisco-deploy
```

Kurulum sırasında tüm sorulara **yes** yanıtı verin ve kullanıcı adı/şifre istenirse **admin/admin** girin.

---

## **7. Veritabanı Yetkilendirmesi**

Netdisco'nun veritabanına erişimi için:

```bash
docker exec -it postgres psql -U postgres -d karcin_network -c "INSERT INTO public.users (username, \"password\", creation, last_on, port_control, ldap, \"admin\", fullname, note, \"token\", token_from, radius, tacacs, portctl_role) VALUES ('guest', NULL, '2024-12-28 23:24:54.263', NULL, true, false, true, NULL, NULL, NULL, NULL, false, false, NULL);"
```

---

## **8. NGİNX AYARLARI fqdn kullanılacak yerler için**
Nginx.conf Dosyasına Eklenmesi Gereken Ayarlar

Backend İletişimi

Network IU dosyasının backend ile sorunsuz haberleşebilmesi için, aşağıda belirtilen ayarların nginx.conf dosyasına eklenmesi gerekmektedir.

Lütfen, network backend sunucusunda çalışan IP adreslerine göre ayarları revize ediniz.

Aynı Sunucuda Bulunan Modüller

Diğer modüller ile network modülü aynı sunucuda yer alıyorsa, mevcut ayarları değiştirmeden doğrudan uygulamanız yeterlidir.

Grafana Ayarı

Grafana yapılandırması yalnızca FQDN (Fully Qualified Domain Name) kullanılan sistemlerde uygulanmalıdır eğer ortamda fqdn kullanıcaksa ip yerine fqdn adresini yazın ve compose dosyasında Grafana enviroment kısmında root url satırını ngnix ile aynı olucak şeklide güncelleyin örnek "http://public.fqdn.com/grafana;":

```bash
                location /network-new/rest/ {
                        proxy_pass http://127.0.0.1:8191;
                        rewrite ^/network-new/rest/(.*) /$1 break;
                        client_max_body_size 2048M;
                        proxy_read_timeout 86400;
                        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                }

                location /websocketNetworkNew/ {
                        proxy_pass http://127.0.0.1:7215;
                        proxy_http_version 1.1;
                        proxy_set_header Upgrade $http_upgrade;
                        proxy_set_header Connection "upgrade";
                        proxy_read_timeout 86400;
                }
				
		
```

## **9. Log, NetFlow ve sFlow Konfigürasyonu**


Aşağıdaki portlara veri gönderimini etkinleştirin:

- **Syslog:** 515
- **NetFlow:** 2055
- **sFlow:** 6343
- **Trap:** 162

---
## **10.Kafka broker ve retention ayarları

Flow datalarının sunucu diskinden yer kaplamaması için kafkanın ayarları güncellenmelidir Bunun yapılmasının sebebi flow dataları  influx üzerinde tutuldugundan dolayı replica verinin önüne geçip disk kullanımını rahatlatmak ve gereksiz verinin önüne geçilmektir:

```bash
docker exec -it kafka kafka-configs \
  --bootstrap-server kafka:9092 \
  --entity-type topics \
  --entity-name flows-messages \
  --alter \
  --add-config retention.ms=60000,segment.ms=30000

```
 yukardaki komutu girdikten sonra flow verileri geldiğinde datanın silinip silnmediğini mutlaka kontrol edin:

 ```bash
 docker exec -it kafka bash
 cd /var/lib/kafka/data
 watch -d ls -lh flows-messages-0/ 
 ```
 watch komutu ile izlediğinizde eğer veri boyutu 1 dakika sonra kontrollü olarak düşüyorsa problem yoktur ama veri sürekli yükseliyorsa retention ve segment komutunu kernel'da tekrar çalışıtırın ve tekrar izleyin:

## **11. Veri Akışını TCPDump ile Test Etme**

### **SNMP Trap Testi (UDP 162 portu)**
```bash
tcpdump -i any udp port 162 -vvv
```

### **Syslog Testi (UDP 515 portu)**
```bash
tcpdump -i any udp port 515 -vvv
```

### **NetFlow Testi (UDP 2055 portu)**
```bash
tcpdump -i any udp port 2055 -vvv
```

### **sFlow Testi (UDP 6343 portu)**
```bash
tcpdump -i any udp port 6343 -vvv
```

---

## **12. SNMP v2 ve v3 Bilgilerini Test Etme**

### **SNMP v2 Testi**
```bash
snmpwalk -v2c -c public localhost
```

### **SNMP v3 Testi**
```bash
snmpwalk -v3 -u admin -l authPriv -a SHA -A "authpassword" -x AES -X "privpassword" localhost
```

---

## **13. Cihaz Tanımlamaları**
Arayüzden girerek cihaz tanımlamalarını gerçekleştirebilirsiniz.

