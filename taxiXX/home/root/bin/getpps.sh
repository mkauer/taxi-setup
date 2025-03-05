#!/bin/sh

# check if field_hub is already running
check=`/home/root/bin/running.sh`
if [ ! -z "$check" ]; then
    echo "ERROR: field_hub or dump_hist is running."
    exit 1
fi

for n in $CHANS; do
    now=`echo "print_pps" | udaq_terminal $n | grep ">" | grep -v Good `
    echo "Ch-$n pps = $now"
done

