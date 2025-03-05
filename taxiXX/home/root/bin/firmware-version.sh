#!/bin/sh

# check if field_hub is already running
check=`/home/root/bin/running.sh`
if [ ! -z "$check" ]; then
    echo "ERROR: field_hub or dump_hist is running."
    exit 1
fi

year=`smcrw -r 8`
year=${year##*x}
mm=`smcrw -r a`
mm=${mm##*x}
mm=$(printf %02d $mm)
dd=`smcrw -r c`
dd=${dd##*x}
dd=$(printf %02d $dd)
ver=`smcrw -r e`
ver=${ver##*:}

echo "firmware: ${ver}  ${year}-${mm}-${dd}"

