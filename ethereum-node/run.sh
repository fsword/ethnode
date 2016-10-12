#!/bin/sh

if [ -f 'pwd.txt' ]
then
  echo
else
  echo 'dummy user' > pwd.txt
  /geth --password pwd.txt account new
fi

exec /geth $@
