#!/bin/bash

# Script to generate CPU load
DURATION=${1:-60}  # Duration in seconds, default 60

echo "Generating load for $DURATION seconds..."

# Start multiple yes commands to generate CPU load
for i in $(seq 1 $(nproc)); do
    yes > /dev/null &
done

# Store PIDs
LOAD_PIDS=$!

# Wait for specified duration
sleep $DURATION

# Kill load processes
kill $LOAD_PIDS 2>/dev/null
wait $LOAD_PIDS 2>/dev/null

echo "Load test completed"
