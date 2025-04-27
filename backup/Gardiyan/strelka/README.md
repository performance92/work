

#### Step 4a: Strelka kurulumu için cd /home/gardiyan/Gardiyan/strelka/build dizinine gidin ve no-build compose dosyasını aşağıdaki komut ile çalışıtırın
**Note**: You can skip the `go build` process and use the `Strelka UI` at `http://0.0.0.0:9980` to analyze files.

```bash
docker compose -f build/docker-compose-no-build.yaml up -d 
```

#### Step 4b: Build and start Strelka
**Note**: Arayüze girmek için makinenin ip adresi ve 9980 portunda erişin kulancı adı ve şifre admin:admin çıkan sayfada api kısmına gelin api anahtarını kopyalayın ve etcClient klasörünün altında com.karcin.cfg dosyasının en altına strelka api key kısmına girin

