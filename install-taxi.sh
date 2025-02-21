#!/bin/sh

if [ -z "$1" ]; then
    echo "specify a hostname"
    exit 1
fi

host=$1
rsync="/usr/bin/rsync --perms --times --recursive --checksum --partial --inplace --progress --timeout=120"

# copy files over
${rsync} ./taxiXX/* ${host}:/

# run the kickstart script
ssh $host "/home/root/kickstart.sh"

