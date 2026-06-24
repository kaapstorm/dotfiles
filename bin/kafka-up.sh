#!/bin/bash
# Start Kafka and ensure it stays up for 10 seconds, restarting if it exits.

set -u

is_running() {
    # A kafka line containing "Up " (docker ps) or " running" (compose ps)
    # means the container is healthy/running. "Restarting", "Exited", "Created"
    # do not match.
    scripts/docker ps 2>/dev/null \
        | grep kafka \
        | grep -Eq '(\bUp\b|\brunning\b)'
}

start_kafka() {
    echo "Starting kafka..."
    scripts/docker up -d kafka >/dev/null
}

required_uptime=10

while true; do
    stable_since=
    while true; do
        sleep 1
        if is_running; then
            if [ -z "$stable_since" ]; then
                stable_since=$(date +%s)
            fi
            elapsed=$(( $(date +%s) - stable_since ))
            printf '\rkafka up for %ds / %ds' "$elapsed" "$required_uptime"
            if [ "$elapsed" -ge "$required_uptime" ]; then
                echo
                echo "kafka is stable."
                exit 0
            fi
        else
            if [ -n "$stable_since" ]; then
                echo
                echo "kafka stopped before reaching ${required_uptime}s, restarting..."
            fi
            break
        fi
    done
    start_kafka
done
