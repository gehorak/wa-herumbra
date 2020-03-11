#!/bin/bash

_kill_procs() {
  kill -TERM $chromium-browser
  wait $chromium-browser
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

echo Starting chromium

echo Running "chromium --headless --no-sandbox $@ &"
chromium-browser --headless --no-sandbox --disable-gpu --disable-software-rasterizer --disable-dev-shm-usage $@ &
chromium-browser=$!

wait $chromium-browser