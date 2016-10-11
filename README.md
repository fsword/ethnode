# ethnode
build a docker images for ethfans' node

# usage

* start up

```bash
# cp docker-compose-sample.yml docker-compose.yml
# <Customize on docker-compose.yml: >
# <    set values of `instance` and `contact_details` environments>
# <    change volume for your REAL folder>
# docker-compose up -d
```

* upgrade

```bash
# git pull
# docker-compose down
# docker-compose build
# docker-compose up -d
```

