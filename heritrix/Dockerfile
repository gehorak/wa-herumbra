
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
    #wget -v -O /heritrix.tar.gz http://builds.archive.org/maven2/org/archive/heritrix/heritrix/3.4.0-SNAPSHOT/heritrix-3.4.0-SNAPSHOT-dist.tar.gz \
    wget -v -O /heritrix.tar.gz https://repo1.maven.org/maven2/org/archive/heritrix/heritrix-contrib/3.4.0-20200304/heritrix-contrib-3.4.0-20200304-dist.tar.gz \
    && tar -xvzpf /heritrix.tar.gz \
    && mv /heritrix-contrib-3.4.0-20200304 /opt/heritrix \
    && rm -rf heritrix.tar.gz

# Install AMQP client
# https://mvnrepository.com/artifact/com.rabbitmq/amqp-client/5.8.0
# https://www.rabbitmq.com/tutorials/tutorial-one-java.html
# cd /opt/testmq 
# javac -cp amqp-client-5.7.1.jar send.java receive.java
# java -cp .:amqp-client-5.7.1.jar:slf4j-api-1.7.26.jar:slf4j-simple-1.7.26.jar receive
# java -cp .:amqp-client-5.7.1.jar:slf4j-api-1.7.26.jar:slf4j-simple-1.7.26.jar send

COPY testmq /opt/testmq
RUN \
    wget -v -O amqp-client-5.7.1.jar https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.7.1/amqp-client-5.7.1.jar \
    # wget -v -O amqp-client-5.8.0.jar https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.8.0/amqp-client-5.8.0.jar \
    && wget -v -O slf4j-api-1.7.26.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-api/1.7.26/slf4j-api-1.7.26.jar \
    && wget -v -O slf4j-simple-1.7.26.jar https://repo1.maven.org/maven2/org/slf4j/slf4j-simple/1.7.26/slf4j-simple-1.7.26.jar \
    && mv /*.jar /opt/testmq

#ADD wa-heritrix-umbra-sandbox.jar wa-heritrix-umbra-sandbox.jar
#ENTRYPOINT exec java $JAVA_OPTS -jar wa-heritrix-umbra-sandbox.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar wa-heritrix-umbra-sandbox.jar

# Configure Heritrix options:

COPY jobs /opt/heritrix/jobs
COPY bin /opt/heritrix/bin


ENV FOREGROUND=true \
    JAVA_OPTS='-Xmx2g'
    #JAVA_OPTS='-Xmx2g -Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2'

# Set up some defaults:
ENV \
    HERITRIX_ADMIN_USER='admin' \
    HERITRIX_ADMIN_PASS='admin' \
    HERITRIX_ADMIN_PORT='8443' \
    HERITRIX_BIND_HOST='0.0.0.0' \
    HERITRIX_JOBS_PATH='/opt/heritrix/jobs' \
    HERITRIX_JOBNAME='umbra' \
    HERITRIX_OUT='/opt/heritrix/output' \
    HERITRIX_HOME='/opt/heritrix/'

WORKDIR /opt/heritrix

VOLUME /opt/heritrix/jobs
VOLUME /opt/heritrix/output

EXPOSE 8443\
       5000

ENTRYPOINT ["/opt/heritrix/bin/heritrix"]
#CMD [ "-b $HERITRIX_BIND_HOST","-p $HERITRIX_ADMIN_PORT","-a $HERITRIX_ADMIN_USER:$HERITRIX_ADMIN_PASS","--jobs-dir $HERITRIX_JOBS_PATH" ]
CMD [ "-b 0.0.0.0","-p 8443","-a admin:admin","--jobs-dir /opt/heritrix/jobs" ]
# CMD /opt/heritrix/bin/start.sh
