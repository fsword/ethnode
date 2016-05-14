FROM ethereum/client-go

RUN sed -ie 's/archive\.ubuntu\.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list
RUN apt-get update && \
        apt-get install curl git -y && \
        locale-gen zh_CN.UTF-8

RUN curl -o - https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs -y

ENV LC_ALL zh_CN.UTF-8
ENV LANG zh_CN.UTF-8

WORKDIR /root

RUN git clone https://github.com/cubedro/eth-net-intelligence-api ethstats-client && \
        cd ethstats-client && \
        mkdir logs && \
        npm install

RUN mkdir .ethereum && \
        mkdir /var/lib/chaindata && \
        ln -s /var/lib/chaindata /root/.ethereum/chaindata

RUN cd .ethereum && \
        curl -O https://gist.githubusercontent.com/lgn21st/9e7ef6b9dc9a9b45b700e72a6ce49b91/raw/59e343d9f32d1313edd369b3113d9ea677d2ed0a/static-nodes.json

VOLUME /root/ethstats-client/logs
VOLUME /var/lib/chaindata

RUN npm install -g pm2 && \
        curl -O https://gist.githubusercontent.com/fsword/035109f94bf7d6dc8b1c4dea797288ab/raw/d8b36a894c44741ead94f2a9414aadb57059b557/processes.json 
COPY setup.sh .

CMD bash setup.sh && pm2 start processes.json && pm2 logs --err --raw
