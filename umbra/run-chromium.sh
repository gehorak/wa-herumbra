#!/bin/bash

_kill_procs() {
  kill -TERM $chromium
  wait $chromium
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

echo Starting chromium

echo Running "chromium --headless --no-sandbox $@ &"
chromium --headless --no-sandbox  $@ &
chromium=$!

wait $chromium