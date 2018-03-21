FROM centos:centos7

MAINTAINER Apereo Foundation

ENV PATH=$PATH:$JRE_HOME/bin

RUN yum -y install wget tar unzip git \
    && yum -y clean all

# Download Azul Java, verify the hash, and install \
RUN set -x; \
    java_version=8.0.131; \
    zulu_version=8.21.0.1; \
    java_hash=1931ed3beedee0b16fb7fd37e069b162; \
    
    cd / \
    && wget http://cdn.azul.com/zulu/bin/zulu$zulu_version-jdk$java_version-linux_x64.tar.gz \
    && echo "$java_hash  zulu$zulu_version-jdk$java_version-linux_x64.tar.gz" | md5sum -c - \
    && tar -zxvf zulu$zulu_version-jdk$java_version-linux_x64.tar.gz -C /opt \
    && rm zulu$zulu_version-jdk$java_version-linux_x64.tar.gz \
    && ln -s /opt/zulu$zulu_version-jdk$java_version-linux_x64/jre/ /opt/jre-home;

RUN cd / \
	&& wget http://cdn.azul.com/zcek/bin/ZuluJCEPolicies.zip \
    && unzip ZuluJCEPolicies.zip \
    && mv -f ZuluJCEPolicies/*.jar /opt/jre-home/lib/security \
    && rm ZuluJCEPolicies.zip; 


# Set up Oracle Java properties
# RUN set -x; \
#     java_version=8u112; \
#     java_bnumber=15; \
#     java_semver=1.8.0_112; \
#     java_hash=eb51dc02c1607be94249dc28b0223be3712b618ef72f48d3e2bfd2645db8b91a; \

# # Download Oracle Java, verify the hash, and install \
#     cd / \
#     && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#     http://download.oracle.com/otn-pub/java/jdk/$java_version-b$java_bnumber/server-jre-$java_version-linux-x64.tar.gz \
#     && echo "$java_hash  server-jre-$java_version-linux-x64.tar.gz" | sha256sum -c - \
#     && tar -zxvf server-jre-$java_version-linux-x64.tar.gz -C /opt \
#     && rm server-jre-$java_version-linux-x64.tar.gz \
#     && ln -s /opt/jdk$java_semver/ /opt/jre-home;

# Download the CAS overlay project \
RUN cd / \
    && git clone --depth 1 --single-branch https://github.com/apereo/cas-overlay-template.git cas-overlay \
    && mkdir -p /etc/cas \
    && mkdir -p cas-overlay/bin;

COPY thekeystore /etc/cas/
COPY bin/*.* cas-overlay/bin/
COPY etc/cas/config/*.* /cas-overlay/etc/cas/config/
COPY etc/cas/services/*.* /cas-overlay/etc/cas/services/

RUN chmod -R 750 cas-overlay/bin \
    && chmod 750 cas-overlay/mvnw \
    && chmod 750 cas-overlay/build.sh \
    && chmod 750 /opt/jre-home/bin/java;

# Enable if you are using Oracle Java
#	&& chmod 750 /opt/jre-home/jre/bin/java;

EXPOSE 8080 8443

WORKDIR /cas-overlay

ENV JAVA_HOME /opt/jre-home
ENV PATH $PATH:$JAVA_HOME/bin:.

RUN ./mvnw clean package -T 10

CMD ["/cas-overlay/bin/run-cas.sh"]
