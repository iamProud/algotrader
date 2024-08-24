#!/usr/bin/env bash
# set -x  # echo all commands
./wait-for-it.sh timescaledb:5432 --timeout=30 --strict -- echo "TimescaleDB is up"

pid=0

# run python3 main.py in the background and store its PID
python3 main.py &

# store the PID of the last background command
pid=$!

# wait for the background command to exit
wait $pid

# forward the exit status of the background command
exit $?
