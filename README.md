# Configuration

## How to setup the machine

The certifcates were generated for the domain **cas.eea.org**, so you need to add it in the **/etc/hosts** of your host machine by adding the following line:
```
127.0.0.1    cas.eea.org
```

Geoserver is now available on:

```
https://cas.eea.org:8444/geoserver
```

## GeoServer configuration

CAS needs few extra steps to be configured in GeoServer after startup:

1. Start GeoServer and login to the web admin interface as the admin user (default password: 'geoserver').
2. Click the Authentication link located under the Security section of the navigation sidebar.
3. Scroll down to the Authentication Filters panel and click the "Add new" link.
4. Click the CAS link.
5. Fill in the fields of the settings form as follows:
    * Name: CASGS
    * CAS server URL including context root: https://cas.eea.org:8443/cas
    * Check the Participate in single sign out (recomended)
    * Choose a Role source
6. Update the filter chains by adding the new CAS filter.
7. Select the CAS Filter (CASGS) for each filter chain you want to protect with CAS.
8. Save.

More details [here](http://docs.geoserver.org/stable/en/user/security/tutorials/cas/index.html)

## Trying Geoserver-enabled CAS

1. Login into GeoServer - you will be redirected to the cas login page.
2. Login in cas, using the default credentials ("admin", "admin").
3. You will be redirected to the GeoServer page, logged in as "admin".

## Notes for Developers

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
