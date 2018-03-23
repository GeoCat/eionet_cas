The self-certificates were generated in folder "certificates", using this command:

```bash


openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 -subj \
    "/C=DK/ST=Copenhagen/L=Copenhagen/O=EEA/CN=cas.eea.org" -keyout \
    ./ssl.key -out ./ssl.crt
```

created keystore (used 'changeit' as password):

```bash


openssl x509 -in ssl.crt -inform PEM -out cert.der -outform DER
keytool -import -trustcacerts -alias cas.eea.org -file cert.der -keystore thekeystore
```

Please copy them manually, to all **relevant paths** (e.g.: geoserver, cas)


Geoserver is available on:

```
https://localhost:8444/geoserver
```
