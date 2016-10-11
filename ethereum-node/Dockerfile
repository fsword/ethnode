FROM ubuntu

RUN apt-get update && \
    apt-get install -y wget && \
    cd /tmp && \
    wget https://github.com/ethcore/parity/releases/download/v1.3.5/parity_1.3.5-0_amd64.deb && \
    dpkg -i parity*.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8545
ENTRYPOINT parity --jsonrpc-interface all --jsonrpc-hosts all
