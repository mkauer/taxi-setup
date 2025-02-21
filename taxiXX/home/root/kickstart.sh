#!/bin/sh

# Initial TAXI hub setup
# M.Kauer
# 2025-02-21


# FPGA Firmware
#----------------------------
#FPGA="0x217_taxitop_icescint_06_11_2020_Taxi_3.1.bit"
#FPGA="taxiTop_iceScint_0x0301.bit"
FPGA="taxiTop_iceScint_0x0302.bit"
ln -sf /opt/taxi/firmware/${FPGA} /opt/taxi/firmware/default-firmware
fpgainit -f /opt/taxi/firmware/default-firmware
firmware-version.sh


# FieldHub Application
#----------------------------
UDAQ="udaq-dist-jun_22_2023"
#UDAQ="udaq-dist-nov_21_2024"
#UDAQ="udaq-dist-dec_26_2024"
rm -r /opt/taxi/udaq
ln -sf /opt/taxi/sfw/${UDAQ} /opt/taxi/udaq


# FieldHub kernel driver
#----------------------------
rmmod udaqdrv.ko
insmod /opt/taxi/udaq/platform/udaqdrv.ko


# Runtime init scripts for udaqdrv.ko
#----------------------------
for n in 0 1 6 ; do ln -sf /etc/init.d/udaqdrv.d /etc/rc${n}.d/K63udaqdrv.d; done
for n in 2 3 4 5 ; do ln -sf /etc/init.d/udaqdrv.d /etc/rc${n}.d/S63udaqdrv.d; done
for n in 0 1 2 3 4 5 6 ; do echo $n; ls /etc/rc${n}.d; done


# Permissions
#----------------------------
chmod go-rwx /home/root
chmod -R go-rwx /home/root/.ssh


