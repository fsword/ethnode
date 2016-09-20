#!/bin/sh

INSTANCE_NAME=${instance:-`hostname`}
CONTACT_DETAILS=${contact_details:-no@email}

export INSTANCE_NAME CONTACT_DETAILS

exec node $@
