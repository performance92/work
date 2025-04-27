# Guacamole 1.5.0 İmajını Kullan
FROM guacamole/guacamole:1.5.4

USER root

# Gerekli bağımlılıkları yükle
RUN apt-get update && apt-get install -y \
    ffmpeg \
    build-essential \
    libguac-dev \
    libcairo2-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libossp-uuid-dev \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    libssl-dev \
    libogg-dev \
    libvorbis-dev \
    libvorbisenc2 \
    libpulse-dev \
    libpango1.0-dev \
    libpangocairo-1.0-0 \
    freerdp2-dev \
    libssh2-1-dev \
    libtelnet-dev \
    libwebp-dev \
    libwebsockets-dev \
    libvncserver-dev \
    x11vnc \
    git \
    autoconf \
    automake \
    libtool \
    unzip \
    net-tools \
    gzip \
    nano \
    vim \
    inotify-tools \
    sudo \
    cmake \
    wget \
    && apt-get clean

# LibVNC Server'ı yükle (Bu, VNC bağlantılarını desteklemek için gerekli)
RUN git clone https://github.com/LibVNC/libvncserver.git /tmp/libvncserver \
    && cd /tmp/libvncserver \
    && cmake . \
    && make \
    && make install \
    && ldconfig \
    && rm -rf /tmp/libvncserver

# Guacamole Server'ı kaynaktan derle ve yükle
RUN git clone https://github.com/apache/guacamole-server.git /tmp/guacamole-server \
    && cd /tmp/guacamole-server \
    && autoreconf -fi \
    && ./configure --with-init-dir=/etc/init.d \
    && make \
    && make install \
    && ldconfig \
    && rm -rf /tmp/guacamole-server

# Guacamole WAR dosyasını yükle
RUN mkdir -p /etc/guacamole \
    && wget -O /etc/guacamole/guacamole.war \
       https://downloads.apache.org/guacamole/1.5.4/binary/guacamole-1.5.4.war

# JDBC Postgres Authentication'ı ekle
RUN mkdir -p /root/.guacamole/extensions \
    && wget -O /root/.guacamole/extensions/guacamole-auth-jdbc-postgresql-1.5.4.tar.gz \
       https://downloads.apache.org/guacamole/1.5.0/binary/guacamole-auth-jdbc-postgresql-1.5.4.tar.gz \
    && tar -xzf /root/.guacamole/extensions/guacamole-auth-jdbc-postgresql-1.5.4.tar.gz -C /root/.guacamole/extensions/ \
    && rm /root/.guacamole/extensions/guacamole-auth-jdbc-postgresql-1.5.4.tar.gz

# Guacamole'nin erişim izinlerini ayarla
RUN echo "umask 000" >> /etc/profile
RUN echo "guacamole ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# EntryPoint dosyanı kopyala ve çalıştırılabilir yap
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER guacamole

ENTRYPOINT ["/entrypoint.sh"]

