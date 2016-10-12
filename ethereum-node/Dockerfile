FROM ethereum/client-go:alpine

WORKDIR /root

VOLUME /root/.ethereum

COPY run.sh /

ENTRYPOINT /run.sh --rpc --rpcaddr 0.0.0.0 --fast --maxpeers 100
