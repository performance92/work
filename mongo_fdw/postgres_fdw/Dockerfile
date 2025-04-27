

FROM postgres:13

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git wget curl cmake make gcc clang zlib1g-dev \
    libssl-dev pkg-config postgresql-server-dev-13 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/EnterpriseDB/mongo_fdw.git
WORKDIR /opt/mongo_fdw
RUN chmod +x autogen.sh && ./autogen.sh

RUN make USE_PGXS=1 && make USE_PGXS=1 install

CMD ["postgres"]