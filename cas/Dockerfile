FROM apereo/cas:v5.2.2

MAINTAINER doublebyte <joana.simoes@geocat.net>

# Add SSL certificates
COPY ./thekeystore /etc/cas/thekeystore
COPY ./server.crt /etc/cas/server.crt

RUN keytool -import -noprompt -trustcacerts -alias cas -file /etc/cas/server.crt \
  -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -keypass changeit
