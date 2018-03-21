FROM apereo/cas:v5.1.3

MAINTAINER doublebyte <joana.simoes@geocat.net>

# Add SSL certificates
#COPY thekeystore /etc/cas/
#COPY server.crt /etc/cas/
COPY cas.properties /cas-overlay/etc/cas/config/

#RUN keytool -import -noprompt -trustcacerts -alias cas -file /etc/cas/server.crt \
#  -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -keypass changeit
