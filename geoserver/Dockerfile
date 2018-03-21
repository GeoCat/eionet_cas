FROM oscarfonts/geoserver:2.12.1

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN wget https://github.com/ngageoint/elasticgeo/releases/download/2.12.0-RC1/elasticgeo-2.12.0.zip -O elasticgeo.zip
RUN unzip -o elasticgeo.zip -d /usr/local/geoserver/WEB-INF/lib/
#RUN mv elasticgeo-2.11.0.jar /usr/local/geoserver/WEB-INF/lib/

RUN rm /usr/local/geoserver/WEB-INF/lib/postgresql-*.jar

RUN wget https://github.com/locationtech/geogig/releases/download/v1.2.0/geoserver-2.12-SNAPSHOT-geogig-plugin.zip -O geogig-plugin.zip
RUN unzip -o geogig-plugin.zip -d /usr/local/geoserver/WEB-INF/lib/

EXPOSE 8080
