FROM ethereum/client-go

RUN sed -ie 's/archive\.ubuntu\.com/mirrors.ustc.edu.cn/' /etc/apt/sources.list
RUN apt-get update && apt-get install wget git -y
RUN wget -O - https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs -y

RUN cd /opt && git clone https://github.com/cubedro/eth-net-intelligence-api ethstats-client

RUN cd /opt/ethstats-client && npm install
