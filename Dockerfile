FROM ethereum/client-go

RUN sed -ie 's/archive\.ubuntu\.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list
RUN apt-get update && apt-get install curl git -y

RUN curl -o - https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs -y

WORKDIR /root

RUN git clone https://github.com/cubedro/eth-net-intelligence-api ethstats-client && \
        cd ethstats-client && \
        mkdir logs && \
        npm install

VOLUMN /root/ethstats-client/logs

RUN mkdir .ethereum && \
        cd .ethereum && \
        curl -O https://gist.githubusercontent.com/lgn21st/9e7ef6b9dc9a9b45b700e72a6ce49b91/raw/59e343d9f32d1313edd369b3113d9ea677d2ed0a/static-nodes.json

RUN npm install -g pm2 && \
        curl -O https://gist.githubusercontent.com/lgn21st/530faf0f9f31febc6ec5c4e3f0301dca/raw/39fcf2cc389fbb26ab1cf88612ed29ed9b57b5d6/processes.json

RUN sed -ie 's/home\/deploy/root/g' processes.json

CMD pm2 start processes.json && pm2 logs --err --raw
