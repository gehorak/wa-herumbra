#!/usr/bin/env bash
ulimit -c 0
# https://github.com/internetarchive/umbra/blob/master/bin/drain-queue
drain-queue --url amqp://guest:guest@rabbitmq:5672/%2f
umbra -n 5 --executable /opt/bin/run-chromium.sh --url amqp://guest:guest@rabbitmq:5672/%2f
