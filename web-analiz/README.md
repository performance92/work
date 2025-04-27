# 📊 WEB Analiz - Matomo Kurulumu

Bu uygulama, web uygulamalarının detaylı analizini yaparak kullanıcı hareketlerini takip eder ve raporlar. Google Analytics'e benzer şekilde çalışır ancak kendi sunucunuzda barındırılır.

---

## 🔧 1. Proje Dosyalarının İndirilmesi

Aşağıdaki komut ile proje dosyalarını sunucunuza klonlayın:

```bash
git clone http://git.cekino.local/s.parti/web-analiz.git
```

---

## 📂 2. Proje Dizini ve Docker Kurulumu

Proje dizinine gidin:

```bash
cd web-analiz
```

Sunucunuzda Docker kurulu değilse, aşağıdaki komut ile kurulum yapın:

```bash
sudo apt-get update
sudo apt-get install docker docker-compose
```

> 💡 `docker*` yerine doğrudan `docker` ve `docker-compose` paketlerini yüklemeniz önerilir.

---

## 🚀 3. Uygulamayı Docker ile Başlatma

Proje dizininde aşağıdaki komut ile uygulamayı başlatın:

```bash
docker-compose up -d
```

Ya da:

```bash
docker compose up -d
```

> 🛠 Eğer başlatma sırasında **Nginx SSL sertifikası** hatası alırsanız, aşağıdaki komutla self-signed bir sertifika oluşturabilirsiniz:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./nginx/certs/selfsigned.key \
  -out ./nginx/certs/selfsigned.crt \
  -subj "/CN=analytics.cekino.local"
```

`CN=` alanında kendi domain adınızı (FQDN) belirtmeyi unutmayın. Sertifika oluşturulduktan sonra `nginx` konteynerini yeniden başlatın:

```bash
docker restart nginx
```

---

## 🌐 4. Web Arayüzüne Erişim

Tüm konteynerlar düzgün şekilde başlatıldığında, aşağıdaki örnekteki gibi web arayüzüne erişebilirsiniz:

```text
https://analytics.cekino.local
```

---

## 🛠 5. İlk Kurulum ve İzleme Ayarları

Matomo kurulum ekranı geldiğinde:

1. İzlemek istediğiniz siteyi ekleyin. Örnek:
   ```text
   https://analytics.cekino.local/client
   ```

2. Kurulum tamamlandığında size özel bir **JavaScript izleme kodu** sunulacaktır.

3. Bu kodu izlemek istediğiniz web sitesinin `index.html` dosyasında `<head>` etiketi içine ekleyin:

```html
<head>
  <!-- Diğer etiketler -->
  <script>...matomo tracking code...</script>
</head>
```

> ✅ Kod doğru eklendiyse, Matomo üzerinden ziyaretçi analizini görebileceksiniz.

---

## 📌 Notlar

- Docker ve Nginx yapılandırmaları `docker-compose.yml` içinde tanımlıdır.
- Domain DNS ayarlarınızın doğru yapılandırıldığından emin olun.
- Gerekirse `hosts` dosyasına manuel giriş yapılabilir (test ortamları için).

---

Herhangi bir sorunla karşılaşırsanız lütfen sistem yöneticinize veya DevOps ekibinize başvurun.

