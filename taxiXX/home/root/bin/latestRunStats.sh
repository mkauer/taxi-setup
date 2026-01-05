#!/bin/sh

# get the trigger rates of the last run from the spool dir
run=`ls /home/root/data/udaq/ | grep run_ | sort -r | head -n 1`
run="/home/root/data/udaq/${run}"
hostname
echo $run
#ls -hAl $run
cat ${run}/*-info.txt | grep -E "run stats:|rate:"
