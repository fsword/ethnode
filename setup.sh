#!/bin/sh

instance_name=${instance:-`hostname`}
contact_details=${contact_details:-no@email}

sed -ie "s/\$INSTANCE_NAME/$instance_name/" processes.json
sed -ie "s/\$CONTACT_DETAILS/$contact_details/" processes.json

echo 'dummy user' > pwd.txt
geth --password pwd.txt account new
