#!/bin/bash

process_vitals() {
    report_file="reports/critical_alerts.txt"

    > "$report_file"

    echo "CRITICAL ALERT REPORT" >> "$report_file"

    grep "CRITICAL" active_logs/heart_rate_log.log | \
    awk -F' \\| ' '{printf "Timestamp: %s | Device_ID: %s | Value: %s\n", $1, $2, $3}' \
    >> "$report_file"

    grep "CRITICAL" active_logs/temperature_log.log | \
    awk -F' \\| ' '{printf "Timestamp: %s | Device_ID: %s | Value: %s\n", $1, $2, $3}' \
    >> "$report_file"
}
process_vitals