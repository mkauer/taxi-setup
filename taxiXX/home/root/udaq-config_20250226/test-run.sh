#!/bin/sh

# 2026-01-06

# check if field_hub is already running
check=`/home/root/bin/running.sh`
if [ ! -z "$check" ]; then
    echo "ERROR: field_hub or dump_hist is running."
    exit 1
fi

# get the station name
station=$(echo `hostname` | cut -d '_' -f 2)

# greater than 60 seconds to record one HV/Threshold auto-update
field_hub -c "./hub.cfg" -r "./${station}-taxi.cfg" -l 70

# show results of the test run
run=`ls /home/root/data/udaq/ | grep run_ | sort -r | head -n 1`
run="/home/root/data/udaq/${run}"
echo $run
ls -hAl $run
cat ${run}/*-info.txt | grep -E "run stats:|rate:"

