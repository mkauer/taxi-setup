#!/bin/sh
# /etc/init.d/fpgaboot.d

case "$1" in 
    start)	/opt/taxi/bin/fpgainit -f /opt/taxi/firmware/defaultFirmware.bit ;;
    stop)	;;
    restart)	/opt/taxi/bin/fpgainit -f /opt/taxi/firmware/defaultFirmware.bit ;;
esac
