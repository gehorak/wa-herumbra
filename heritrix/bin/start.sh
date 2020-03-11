#!/bin/bash

#export HERITRIX_HOME=/opt/heritrix/
#export JAVA_HOME=/opt/java/testing
#export JAVA_OPTS="-server -Xmx100M -XX:+UseParallelGC -Dcom.sun.management.jmxremote.port=5000 -Djava.rmi.server.hostname=0.0.0.0 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

/opt/heritrix/bin/heritrix -a ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} -b ${HERITRIX_BIND_HOST} -p ${HERITRIX_ADMIN_PORT} --jobs-dir ${HERITRIX_JOBS_PATH}
