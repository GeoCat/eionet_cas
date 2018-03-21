#/bin/bash

echo "Change server name"
sed -i -e "s#https://cas.example.org:8443#https://${SERVERNAME}:8443#g" /etc/cas/config/cas.properties
