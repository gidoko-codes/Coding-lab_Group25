#!/bin/bash

archive_logs() {
    echo "Starting log archive process..."

    mkdir -p active_logs archived_logs

    timestamp=$(date +"%Y%m%d_%H%M")

    for logfile in active_logs/*.log
    do
        if [ -f "$logfile" ]; then
            filename=$(basename "$logfile")
            name="${filename%.log}"

            mv "$logfile" "archived_logs/${name}_${timestamp}.log"
            echo "Archived $filename"

            touch "$logfile"
            echo "Recreated empty $filename in active_logs"
        fi
    done

    echo "Log archive process completed."
}

archive_logs

