#!/bin/sh

curl -v -d "action=add&addpath=${HERITRIX_JOBS_PATH}" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}

sleep 5

curl -v -d "action=build" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}

sleep 5

curl -v -d "action=launch" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}

sleep 5

curl -v -d "action=unpause" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}
