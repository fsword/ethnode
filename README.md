# ethnode
build a docker image for ethfans' node

# usage

```bash
docker run -d \
  -e instance=<your instance name> \
  -e contact_details=<your email>  \
  -v <your data folder>:/var/lib/chaindata \
  -p 30303:30303 \
  fsword/ethnode
```
