FROM ethereum/client-go:alpine

WORKDIR /root

RUN mkdir .ethereum && \
        mkdir /var/lib/chaindata && \
        ln -s /var/lib/chaindata /root/.ethereum/chaindata

VOLUME /var/lib/chaindata

COPY static-nodes.json /root/.ethereum/
COPY run.sh /

ENTRYPOINT /run.sh --rpc --rpcaddr 0.0.0.0 --fast --maxpeers 100
