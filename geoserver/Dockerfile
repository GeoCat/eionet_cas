FROM oscarfonts/geoserver:2.11.2

MAINTAINER Pascalike <antonio.cerciello@geocat.net>

RUN wget http://ares.boundlessgeo.com/geoserver/release/2.11.2/plugins/geoserver-2.11.2-cas-plugin.zip -O cas-plugin.zip
RUN unzip -o cas-plugin -d /usr/local/geoserver/WEB-INF/lib/

COPY ./ssl.crt /home
COPY ./ssl.key /home
COPY ./server.xml $CATALINA_HOME/conf/

RUN keytool -import -noprompt -trustcacerts -alias cas -file /home/ssl.crt \
 -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -keypass changeit

RUN echo cas cas.eea.org > /etc/hosts

EXPOSE 8443
