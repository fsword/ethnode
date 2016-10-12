FROM ubuntu

RUN sed -i -e 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y wget && \
    cd /tmp && \
    ( wget http://upyun-assets.ethfans.org/parity/1-3-6/parity_1.3.6-0_amd64.deb \
      || wget https://github.com/ethcore/parity/releases/download/v1.3.6/parity_1.3.6-0_amd64.deb ) && \
    dpkg -i parity*.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /root/.parity

EXPOSE 8545
ENTRYPOINT parity --jsonrpc-interface all --jsonrpc-hosts all
