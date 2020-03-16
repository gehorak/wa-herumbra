#!/bin/sh


curl -v -d "action=pause" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}

sleep 5

curl -v -d "action=terminate" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}

sleep 5

curl -v -d "action=teardown" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}
