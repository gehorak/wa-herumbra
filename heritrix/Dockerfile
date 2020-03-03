
FROM openjdk:8-jdk-alpine
#VOLUME /tmp

ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS

#LABEL Name=wa-heritrix-umbra-sandbox Version=0.0.1

# Base packages:
RUN apk add --no-cache \
    curl \
    wget \   
    git \
    unzip \
    tar \ 
    bash \ 
    && rm -rf /var/cache/* /tmp/* \
    && mkdir /var/cache/apk

# Install Heritrix
RUN \
    wget -v -O /heritrix.tar.gz http://builds.archive.org/maven2/org/archive/heritrix/heritrix/3.4.0-SNAPSHOT/heritrix-3.4.0-SNAPSHOT-dist.tar.gz \
    && tar -xvzpf /heritrix.tar.gz \
    && mv /heritrix-3.4.0-SNAPSHOT /opt/heritrix \
    && rm -rf heritrix.tar.gz

# Install AMQP client
# https://mvnrepository.com/artifact/com.rabbitmq/amqp-client/5.8.0
RUN \
    wget -v -O /amqp-client-5.8.0.jar https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.8.0/amqp-client-5.8.0.jar \
    && mv /amqp-client-5.8.0.jar /opt/heritrix/lib 


COPY jobs /opt/heritrix/heritrix-data/jobs
COPY bin /opt/bin

#ADD wa-heritrix-umbra-sandbox.jar wa-heritrix-umbra-sandbox.jar
#ENTRYPOINT exec java $JAVA_OPTS -jar wa-heritrix-umbra-sandbox.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar wa-heritrix-umbra-sandbox.jar

# Configure Heritrix options:
ENV FOREGROUND=true \
    JAVA_OPTS=-Xmx2g
#   JAVA_OPTS -Xmx2g -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2

# Set up some defaults:
# ENV \
#    HERITRIX_ADMIN_USER heritrix \
#    HERITRIX_ADMIN_PASS heritrix \
#    HERITRIX_ADMIN_PORT 8443 \
#    HERITRIX_BIND_HOST 0.0.0.0 

WORKDIR /opt/heritrix

VOLUME /opt/heritrix/heritrix-data

EXPOSE 8443

#CMD /opt/bin/heritrix-start.sh

ENTRYPOINT ["/opt/heritrix/bin/heritrix"]
CMD [ "-b 0.0.0.0","-p 8443","-a heritrix:heritrix","--jobs-dir /opt/heritrix/heritrix-data/jobs" ]

