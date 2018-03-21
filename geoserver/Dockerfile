FROM oscarfonts/geoserver:2.12.2

MAINTAINER Pascalike <antonio.cerciello@geocat.net>

COPY ./server.crt /home
RUN keytool -import -noprompt -trustcacerts -alias cas -file /home/server.crt -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -keypass changeit
