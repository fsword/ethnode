FROM mhart/alpine-node:6

RUN sed -i -e 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk add --update git && \
        git clone https://github.com/cubedro/eth-net-intelligence-api ethstats-client && \
        cd ethstats-client && \
        mkdir logs && \
        npm install && \
        apk del git ca-certificates libssh2 libcurl expat pcre && \
        rm -rf /var/cache/apk/*

ENV LC_ALL zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

ENV NODE_ENV        production
ENV RPC_HOST        ethereum
ENV RPC_PORT        8545
ENV LISTENING_PORT  30303
ENV WS_SERVER       wss://stats.ethfans.org
ENV WS_SECRET       ethfans4you
ENV VERBOSITY       2

WORKDIR /ethstats-client
COPY run.sh /

ENTRYPOINT /run.sh app.js
