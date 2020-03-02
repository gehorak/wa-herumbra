#!/bin/bash


echo "Starting heritrix...."
/opt/heritrix/bin/heritrix -a heritrix:heritrix -b 0.0.0.0
tail -f /opt/heritrix/heritrix_out.log

