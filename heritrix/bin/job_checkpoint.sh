#!/bin/sh

curl -v -d "action=checkpoint" -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location -H "Accept: application/xml" https://localhost:8443/engine/job/${HERITRIX_JOBNAME}
