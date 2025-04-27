#  Docker Ortamında Filebeat + Metricbeat + Elasticsearch + Kibana + Prometheus + Grafana Kurulumu

Bu döküman, Docker kullanarak log ve metrik izleme sistemi kurmak isteyenler için eksiksiz bir kurulum rehberidir. Kurulumda şu bileşenler kullanılmaktadır:

##  1. Servisleri Başlat

```bash
docker-compose up -d
```

---

##  2. Dashboard'ları Yükle

### Metricbeat için:

```bash
docker exec -it metricbeat metricbeat setup --dashboards
```

### Filebeat için:

```bash
docker exec -it filebeat filebeat setup --dashboards \
  -E setup.kibana.host=http://kibana:5601 \
  -E output.elasticsearch.hosts=["http://elasticsearch:9200"] \
  -E output.elasticsearch.username=elastic \
  -E output.elasticsearch.password=Gardiyan.2025!
```

---

##  3. Arayüzlere Erişim

| Uygulama   | Adres               | Giriş Bilgisi                   |
|------------|---------------------|---------------------------------|
| Kibana     | http://localhost:5601 | elastic / Gardiyan.2025!       |
| Grafana    | http://localhost:3000 | admin / admin123               |
| Prometheus | http://localhost:9090 | -                              |
| cAdvisor   | http://localhost:8080 | -                              |

---

##  4. Kibana & Grafana'da Dashboard'ları Görüntüle

### Kibana:
1. Tarayıcıdan `http://localhost:5601` adresine gir
2. Sol menüden **Dashboard** sekmesine tıkla
3. Arama kutusuna `filebeat` veya `metricbeat` yaz
4. Hazır gelen panelleri seçerek izlemeye başla:
   - `[Filebeat] Overview`
   - `[Metricbeat System] Host overview`
   - `[Metricbeat Docker] Containers overview`

### Grafana:
1. `http://localhost:3000` adresine git
2. Giriş: `admin / admin123`
3. Prometheus data source ekle (`http://prometheus:9090`)
4. Dashboard gallery'den ID ile import: Örn. **893** (Docker Host Metrics)

---

