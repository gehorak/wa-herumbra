#!/usr/bin/env bash
ulimit -c 0
# https://github.com/internetarchive/umbra/blob/master/bin/drain-queue
drain-queue --url amqp://guest:guest@rabbitmq:5672/%2f

umbra -n 5 --executable /usr/bin/run-chromium  --url amqp://guest:guest@activemq:5672/%2f
