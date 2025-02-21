#!/bin/sh

if [ -z "$1" ]; then
    echo "specify a hostname"
    exit 1
fi

host=$1
rsync="/usr/bin/rsync --perms --times --recursive --checksum --partial --inplace --progress --timeout=120"
${rsync} ./taxiXX/* ${host}:/

