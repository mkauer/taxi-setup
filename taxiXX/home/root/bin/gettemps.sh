#!/bin/sh

# check if field_hub is already running
check=`/home/root/bin/running.sh`
if [ ! -z "$check" ]; then
    echo "ERROR: field_hub or dump_hist is running."
    exit 1
fi

for n in $CHANS; do
    temp=`echo "GETMON" | udaq_terminal $n | grep ">" | grep -v Good | awk '{printf("%.2f",$2-273.15)}' `
    #temp=$((temp - 273))
    echo "Ch-$n temp = $temp C"
done

