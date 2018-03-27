#!/usr/bin/bash

echo "Adding the cas server to /etc/hosts"

ip=$(ping -c 1 cas | gawk -F'[()]' '/PING/{print $2}')
echo "$ip cas.eea.org" >> /etc/hosts

/usr/local/bin/start.sh
