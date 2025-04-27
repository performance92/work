# Gardiyan Debian Kurulumu

Bu kurulum rehberi, Gardiyan yazılımının Debian işletim sistemine doğru şekilde yüklenmesini sağlar.

---

## 📁 1. Betiği Yerleştirme

Öncelikle `Debian_feature.sh` isimli kurulum betiğini aşağıdaki dizine kopyalayın veya indirin:

```bash
/root
```

---

## ▶️ 2. Betiği Çalıştırma

Ardından terminalden aşağıdaki adımları uygulayın:

```bash
cd /root
chmod +x Debian_feature.sh
sudo ./Debian_feature.sh
```

> ⚠️ Betik çalıştırıldığında yönetici yetkileri gereklidir. `sudo` kullanarak çalıştırmanız önerilir.

---

## 🔧 3. Betiğin Yaptığı İşlemler

- Debian kaynak listesini günceller
- Gerekli sistem paketlerini kurar
- `gardiyan` adında yeni kullanıcı yoksa oluşturur ve sudo yetkisi verir
- Gardiyan sistem dosyasını indirmeyi isterminisiniz sorusu sorar ve evet derseniz 
- Gardiyan sistem dosyasını indirir
- İndirilen dosyayı çıkarmanız için size sorar
- Dosyaların yetkilerini ayarlar

---

## ♻️ 4. Yeniden Başlatma

Betiğin sonunda size sistemin yeniden başlatılması teklif edilir.

Sisteminizi yeniden başlattığınızdan emin olun.

---

## 🚀 5. Kurulumun Devamı

Sunucu yeniden başladıktan sonra aşağıdaki betiği çalıştırarak kuruluma devam edin:

```bash
/home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/Gardiyan_Debian_setup.sh
```

---

## 📝 Notlar

- Bu kurulum sadece **Debian 12 (bookworm)** ve benzeri sistemler içindir.
- İnternet bağlantınızın aktif olması gerekir.
- Kurulumun her adımı terminalde size bildirilir.

---


