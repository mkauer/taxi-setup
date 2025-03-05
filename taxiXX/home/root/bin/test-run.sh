#!/bin/sh

# check if field_hub is already running
check=`/home/root/bin/running.sh`
if [ ! -z "$check" ]; then
    echo "ERROR: field_hub or dump_hist is running."
    exit 1
fi

# logfile
now=`date +%Y-%m-%d_%H%M%S`
logfile=/home/root/udaq-logs/${now}.log

# config dir
config=/home/root/udaq-config

# take data
#field_hub -c ${config}/hub.cfg -r ${config}/SET-4.cfg --log-level=warn --log-file=${logfile} -l 60
field_hub -c ${config}/hub.cfg -r ${config}/SET-4.cfg -l 60


