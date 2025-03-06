#!/bin/sh

# copy files to a taxi host and run the kickstart.sh
# version: 2025-03-05


if [ -z "$1" ]; then
    echo "specify a hostname"
    exit 1
fi
host=$1

# rsync command and options to use
rsync="/usr/bin/rsync --perms --times --recursive --checksum --partial --inplace --progress --timeout=120"

# get some permissions fixed first (if from github)
chmod -R go-w    ./taxiXX/*
chmod go-rwx     ./taxiXX/home/root
chmod -R go-rwx  ./taxiXX/home/root/.ssh
chmod ug+x       ./taxiXX/home/root/kickstart.sh
chmod ugo+x      ./taxiXX/etc/init.d/*.d

# copy files over
echo -e "\nCopying files to ${host} ..."
${rsync} ./taxiXX/* root@${host}:/

# run the kickstart script
echo -e "\nRunning the kickstart ..."
ssh root@${host} "/home/root/kickstart.sh"

