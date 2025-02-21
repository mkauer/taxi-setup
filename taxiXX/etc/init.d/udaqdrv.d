#!/bin/sh
#
# Init Script to load the udaq driver
#
#################################################################################

case "$1" in 
start)		insmod /opt/taxi/udaq/platform/udaqdrv.ko ;;
stop)		rmmod udaqdrv.ko ;;
restart)	rmmod udaqdrv.ko
		insmod /opt/taxi/udaq/platform/udaqdrv.ko ;;
esac

