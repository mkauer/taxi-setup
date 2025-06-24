#!/bin/sh

# Initial TAXI hub setup
# M.Kauer
version=2025-03-11


source /home/root/.profile
export PATH=/sbin:$PATH


# ssh permissions
#------------------------------------------
chmod go-rwx /home/root
chmod -R go-rwx /home/root/.ssh


# FPGA Firmware
#------------------------------------------
#FPGA="0x217_taxitop_icescint_06_11_2020_Taxi_3.1.bit"
FPGA="taxiTop_iceScint_0x0301.bit"
rm /opt/taxi/firmware/default-firmware
ln -sf /opt/taxi/firmware/${FPGA} /opt/taxi/firmware/default-firmware.bit
ls -hAl /opt/taxi/firmware/default-firmware.bit


# FieldHub Application
#------------------------------------------
#DIST="udaq-dist-jun_22_2023"
DIST="udaq-dist-dec_26_2024"
rm -r /opt/taxi/udaq
ln -sf /opt/taxi/sfw/${DIST} /opt/taxi/udaq
ls -hAl /opt/taxi/udaq
FIRM=`ls /opt/taxi/udaq/firmware/udaq*.bin`
echo $FIRM
ln -sf ${FIRM} /opt/taxi/udaq/firmware/firmware.bin
ls -hAl /opt/taxi/udaq/firmware/firmware.bin


# Runtime init scripts for udaqdrv.ko and fpgaboot
#------------------------------------------
for n in 0 1 6 ; do
    ln -sf /etc/init.d/udaqdrv.d /etc/rc${n}.d/K63udaqdrv.d
    ln -sf /etc/init.d/fpgaboot.d /etc/rc${n}.d/K41fpgaboot.d
done
for n in 2 3 4 5 ; do
    ln -sf /etc/init.d/udaqdrv.d /etc/rc${n}.d/S63udaqdrv.d
    ln -sf /etc/init.d/fpgaboot.d /etc/rc${n}.d/S41fpgaboot.d
done
for n in 0 1 2 3 4 5 6 ; do
    rm /etc/init.d/fpgaboot.d.00${n}
    ln -sf /etc/init.d/fpgaboot.d /etc/init.d/fpgaboot.d.00${n}
done
#ls -hAl /etc/rc?.d/*udaqdrv.d
#ls -hAl /etc/rc?.d/*fpgaboot.d
#ls -hAl /etc/init.d/fpgaboot.d*


# Restart udaqdrv and fpgaboot if nothing is running
#------------------------------------------
check=`ps ux | grep -v grep | grep -E "field_hub|dump_hist"`
if [ -z "$check" ]; then
    /etc/init.d/fpgaboot.d restart
    /etc/init.d/udaqdrv.d restart
fi


# restart some stuff
#------------------------------------------
# ntpd service doesn't stop correctly so kill
/etc/init.d/ntpd stop; /usr/bin/killall ntpd; /etc/init.d/ntpd start
/etc/init.d/syslog.busybox restart


# add version info to keep track
#------------------------------------------
echo "$version" > /home/root/.version
echo "DONE"

