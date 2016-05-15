# ethnode
build a docker image for ethfans' node

# usage

1. simple ( not 	recommend , just for building a demo )
```
docker run fsword/ethnode
```
2. production（ set options and mount data folder ）

```
docker run \
  -e instance=<your instance name> \
  -e contact_details=<your email>  \
  -v <your data folder>:/var/lib/chaindata
  fsword/ethnode
```
