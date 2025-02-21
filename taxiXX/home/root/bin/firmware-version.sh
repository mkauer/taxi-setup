#!/bin/sh


# check if field_hub is already running
running=`ps ux | grep -v grep | grep field_hub`
if [ ! -z "$running" ]; then
    echo "ERROR: The field_hub application is running."
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

