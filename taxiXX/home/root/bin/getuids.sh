#!/bin/sh

# check if field_hub is already running
running=`ps ux | grep -v grep | grep field_hub`
if [ ! -z "$running" ]; then
    echo "ERROR: The field_hub application is running."
    exit 1
fi

for n in $CHANS; do
    uid=`echo "getuid" | udaq_terminal $n | grep ">" | grep -v Good `
    uid="${uid:1}"
    echo "Ch-$n UID = $uid"
done

