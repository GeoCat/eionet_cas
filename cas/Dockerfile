FROM apereo/cas:v5.1.3

MAINTAINER doublebyte <joana.simoes@geocat.net>

# Add SSL certificates
COPY ./thekeystore /etc/cas/
COPY ./cas-overlay /cas-overlay

RUN echo geoserver cas.eea.org > /etc/hosts

#RUN keytool -import -noprompt -trustcacerts -alias cas -file /etc/cas/server.crt \
#  -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -keypass changeit
WORKDIR /cas-overlay

ENV JAVA_HOME /opt/jre-home
ENV PATH $PATH:$JAVA_HOME/bin:.
RUN ./mvnw clean package -T 10 -Dcas.version=5.1.3

COPY ./cas-overlay/etc/cas/services /tmp/cas/services
