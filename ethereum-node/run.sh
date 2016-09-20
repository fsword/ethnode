#!/bin/sh

echo 'dummy user' > pwd.txt
/geth --password pwd.txt account new

exec /geth $@
