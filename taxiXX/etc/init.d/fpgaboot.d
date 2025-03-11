#!/bin/sh

source /opt/taxi/setupenv.sourceme

case "$1" in 
    start)	/opt/taxi/bin/fpgainit -f /opt/taxi/firmware/default-firmware.bit ;;
    restart)	/opt/taxi/bin/fpgainit -f /opt/taxi/firmware/default-firmware.bit ;;
    stop)	;;
esac
