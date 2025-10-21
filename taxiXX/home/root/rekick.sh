#!/bin/sh

# Rewrite some config files (quick fix)
# I'm still trying to figure out why/how busybox is
# overwriting these config files when TAXI reboots

# mkauer
version=2025-10-21

echo -e "search psl.spts.icecube.wisc.edu sptsn.icecube.wisc.edu spts.icecube.wisc.edu scint.spts.icecube.wisc.edu ara.spts.icecube.wisc.edu nts.spts.icecube.wisc.edu vpn.spts.icecube.wisc.edu pub.icecube.wisc.edu icecube.wisc.edu wipac.wisc.edu" > /var/run/resolv.conf
echo -e "nameserver 10.2.9.7" >> /var/run/resolv.conf
echo -e "nameserver 10.2.9.8" >> /var/run/resolv.conf

echo -e "auto lo" > /etc/network/interfaces
echo -e "iface lo inet loopback" >> /etc/network/interfaces
echo -e "auto eth0" >> /etc/network/interfaces
echo -e "iface eth0 inet dhcp" >> /etc/network/interfaces

/etc/init.d/fpgaboot.d restart
#/etc/init.d/udaqdrv.d restart
/etc/init.d/ntpd stop; /usr/bin/killall ntpd; /etc/init.d/ntpd start

