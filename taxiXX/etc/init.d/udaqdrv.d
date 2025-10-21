#!/bin/sh
# /etc/init.d/udaqdrv.d

case "$1" in 
    start)	/sbin/insmod /opt/taxi/udaq/platform/udaqdrv.ko ;;
    stop)	/sbin/rmmod udaqdrv.ko ;;
    restart)	/sbin/rmmod udaqdrv.ko
		/sbin/insmod /opt/taxi/udaq/platform/udaqdrv.ko ;;
esac
