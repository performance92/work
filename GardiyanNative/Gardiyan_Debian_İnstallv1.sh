#!/bin/bash
set -e

# Renk tanımlamaları
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
  echo "   ██████╗  █████╗ ██████╗ ██████╗  ██ ██╗   ██╗ █████╗ ███╗   ██╗"
  echo "  ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗    ╚██╗ ██╔╝██╔══██╗████╗  ██║"
  echo "  ██║  ███╗███████║██████╔╝██║  ██║ ██  ╚████╔╝ ███████║██╔██╗ ██║"
  echo "  ██║   ██║██╔══██║██╔══██╗██║  ██║ ██   ╚██╔╝  ██╔══██║██║╚██╗██║"
  echo "  ╚██████╔╝██║  ██║██║  ██║██████╔╝ ██    ██║   ██║  ██║██║ ╚████║"
  echo "   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝    ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝"
echo -e "${YELLOW}════════════════════════════════════════════════════════════"
echo -e "                      GARDİYAN DEBİAN KURULUM"
echo -e "════════════════════════════════════════════════════════════${NC}"

echo "Kurulum başlıyor..."

### Gardiyan dosyaları ve Python dağıtımı
echo "Gardiyan çıkartılıyor"
tar -xf disk1_v2.tar.gz -C /home/gardiyan
tar -xf dist.tar.gz -C /usr/local/lib/python3.11/dist-packages
#tar -xf paping.tar.gz -C /usr/local/bin
#chmod 755 /usr/local/bin/paping
#rm -r paping.tar.gz
sleep 2

### Oracle Java8 kurulumu (arşivden çıkarma yöntemi)
echo "Oracle Java8 kuruluyor"
sleep 2
mkdir -p /usr/lib/jvm/ && tar -xf java-8-oracle.tar.gz -C /usr/lib/jvm/
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH

java -version
sleep 2
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> /root/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> /home/gardiyan/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /root/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/gardiyan/.bashrc
echo "Oracle Java8 kuruldu"
sleep 2

### Karaf repolarının aktarılması
echo "Karaf repoları aktarılıyor..."
tar -xf karaf_m2.tar.gz -C /home/gardiyan
ln -s /home/gardiyan/.m2 /root/.m2
echo "Karaf repoları aktarıldı."

### Nginx kurulumu ve yapılandırması
echo "Nginx ayarları yapılıyor"
apt update -y
apt install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
curl -fsSL https://nginx.org/keys/nginx_signing.key | gpg --dearmor -o /usr/share/keyrings/nginx-archive-keyring.gpg
apt update -y
sleep 2
apt install -y nginx
clear
nginx -v
usermod -g www-data gardiyan
clear
echo "Nginx kuruldu"
sleep 2

### PostgreSQL kurulumu
echo "PostgreSQL kuruluyor"
wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | tee /etc/apt/keyrings/postgresql.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/postgresql.asc] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list
apt update -y
apt install -y postgresql-13 postgresql-client-13
sleep 5

cd postgres_config && cp -r * /etc/postgresql/13/main/
systemctl daemon-reload
systemctl restart postgresql
cd ..
echo "PostgreSQL kuruldu"
sleep 2

### Guacamole bileşenlerinin kurulumu
echo "Guacamole bileşenleri kuruluyor..."
sleep 2
apt update -y
apt install -y gcc g++ curl libcairo2-dev libjpeg-turbo-progs libjpeg62-turbo-dev libpng-dev libtool-bin libossp-uuid-dev libavcodec-dev libavutil-dev libswscale-dev freerdp2-dev libpango1.0-dev libssh2-1-dev libvncserver-dev libtelnet-dev libssl-dev libvorbis-dev libwebp-dev libpulse-dev libavformat-dev ffmpeg cowsay make openjdk-17-jdk
echo "Guacamole bileşenleri kuruldu."
sleep 7

### Guacamole derlemesi
echo "Guacamole derleniyor..."
sleep 2
cd /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new
tar -xf guacamole-server-1.5.5.tar.gz
cd guacamole-server-1.5.5/
make clean || true
./configure --with-init-dir=/etc/init.d --disable-dependency-tracking
sleep 2
make
sleep 2
make install
sleep 2
ldconfig
sleep 2
systemctl daemon-reload
systemctl stop guacd
cd /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1
clear

### Openfire kurulumu
echo "Openfire kuruluyor..."
cd /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1
sleep 2
dpkg -i openfire_4.7.5_all.deb
echo "Openfire kuruldu"
sleep 2
clear

### SSHPass kurulumu
echo "SSHPass kuruluyor"
sleep 2
apt install -y sshpass
echo "SSHPass kuruldu"
sleep 2
clear

### Yetki ayarları ve diğer araçların kurulumu
systemctl daemon-reload
chown gardiyan:gardiyan -R /home/gardiyan/Gardiyan
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=$JAVA_HOME/bin:$PATH
clear

echo "Araçlar kuruluyor..."
apt install -y unzip zip inxi net-tools
echo "Araçlar kuruldu."
sleep 3
clear

### Apache Karaf ile Gardiyan uygulamasının başlatılması (test amaçlı)
echo "Gardiyan test amacıyla ilk kez çalıştırılıyor..."
cd /home/gardiyan/Gardiyan/Server/Main/apache-karaf-4.0.10/bin/ && ./start && sleep 90
echo "Gardiyan M2 uygulandı."
sleep 2
clear

### Saat diliminin ayarlanması
echo "Sunucunun saat dilimi ayarlanıyor..."
timedatectl set-timezone Europe/Istanbul
echo "Saat dilimi ayarlandı..."
cat /etc/timezone
clear

### Docker kurulumu
cd /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1
curl -fsSL https://get.docker.com -o install-docker.sh
chmod 777 *
./install-docker.sh
echo "Docker kuruldu."
clear

### Veritabanı import işlemleri
cd /home/gardiyan/DBs
./import_dbs.sh
sleep 10

### SSH ve IPv6 yapılandırma betikleri
cd /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/scripts
./ssh_config.sh
./disable_ipv6.sh

### Python ve Impacket kurulumu
apt update -y
apt install -y python3 python3-pip python3-dev build-essential libssl-dev libffi-dev
pip install impacket==0.9.24 --break-system-packages
echo "Python güncellemeleri ve Impacket yüklendi."

#############################
# Guacamole ve Tomcat9 Ayarları
#############################
sleep 2
mkdir -p /etc/guacamole/{extensions,lib}
cp /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new/guacamole.war /etc/guacamole/
clear
sleep 2
cp /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new/guacamole.properties /etc/guacamole/
cp /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new/guacamole-auth-jdbc-1.3.0/postgresql/guacamole-auth-jdbc-postgresql-1.3.0.jar /etc/guacamole/extensions/
cp /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new/postgresql-connector-java-42.2.21/postgresql-42.2.21.jre6.jar /etc/guacamole/lib/
#cat /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new/guacamole-auth-jdbc-1.3.0/postgresql/schema/*.sql | psql -h localhost -p 7100 -U postgres guacamole

echo "Tomcat9 kuruluyor..."
cd /opt
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
tar -xzvf apache-tomcat-9.0.73.tar.gz
mv apache-tomcat-9.0.73 tomcat9
rm apache-tomcat-9.0.73.tar.gz

if ! id -u tomcat >/dev/null 2>&1; then
    useradd -r -m -U -d /opt/tomcat9 -s /bin/false tomcat
fi
chown -R tomcat:tomcat /opt/tomcat9

cp /etc/guacamole/guacamole.war /opt/tomcat9/webapps/
cp /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/guacamole_setup_new/server.xml /opt/tomcat9/conf/

echo "GUACAMOLE_HOME=/etc/guacamole" | tee -a /opt/tomcat9/bin/setenv.sh

cat > /etc/systemd/system/tomcat9.service <<EOF
[Unit]
Description=Apache Tomcat 9
After=network.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment="JAVA_HOME=/usr/lib/jvm/java-8-oracle"
Environment="CATALINA_PID=/opt/tomcat9/temp/tomcat.pid"
Environment="CATALINA_HOME=/opt/tomcat9"
Environment="CATALINA_BASE=/opt/tomcat9"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ExecStart=/opt/tomcat9/bin/startup.sh
ExecStop=/opt/tomcat9/bin/shutdown.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable tomcat9
systemctl start tomcat9
echo "Tomcat9 kuruldu ve başlatıldı."
sleep 2
clear

### Openfire yapılandırması
echo "Openfire yapılandırılıyor..."
cd /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1
tar -xf openfirexml.tar.gz
cp -r openfire/ /etc/
systemctl disable openfire
systemctl stop openfire
/etc/init.d/openfire start
echo "Openfire yapılandırıldı."

systemctl daemon-reload
systemctl start guacd
systemctl enable guacd
sleep 5

### Nginx yapılandırması
echo "Nginx yapılandırılıyor..."
sleep 3
systemctl stop nginx
cp -r /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/nginx.conf /etc/nginx/
cp -r /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/nginx.conf.ssl /etc/nginx/
systemctl daemon-reload
systemctl enable nginx
sleep 2
systemctl start nginx

echo "Tamamlandı."
sleep 1
cp -r /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/startup.sh /home/gardiyan/
cp -r /home/gardiyan/Gardiyan_Setup/gardiyan_v2_s1/shutdown.sh /home/gardiyan/
