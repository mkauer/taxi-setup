#!/bin/sh

# check if field_hub is already running
running=`ps ux | grep -v grep | grep field_hub`
if [ ! -z "$running" ]; then
    echo "ERROR: The field_hub application is running."
    exit 1
fi

for n in $CHANS; do
    temp=`echo "GETMON" | udaq_terminal $n | grep ">" | grep -v Good | awk '{printf("%.2f",$2-273.15)}' `
    #temp=$((temp - 273))
    echo "Ch-$n temp = $temp C"
done

