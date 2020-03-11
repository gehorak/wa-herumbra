#!/bin/sh

curl -s -k -u ${HERITRIX_ADMIN_USER}:${HERITRIX_ADMIN_PASS} --anyauth --location https://localhost:8443/engine/job/${HERITRIX_JOBNAME}/status
