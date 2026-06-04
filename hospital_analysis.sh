#!/bin/bash

process_vitals() {
    mkdir -p reports

    grep "CRITICAL" active_logs/heart_rate_log.log active_logs/temperature_log.log | awk -F'|' '
    {
        timestamp=$1
        device_id=$2
        value=$3
        gsub(/^ +| +$/, "", timestamp)
        gsub(/^ +| +$/, "", device_id)
        gsub(/^ +| +$/, "", value)
        print timestamp, device_id, value
    }
    ' > reports/critical_alerts.txt

    echo "Critical alerts saved to reports/critical_alerts.txt"
}

water_audit() {
    if [ ! -f "active_logs/water_usage_log.log" ]; then
        echo "Water usage log not found."
        return 1
    fi

    awk -F'|' '
    /ICU_WATER_RESERVE/ {
        sum += $3
        count++
    }
    END {
        if (count > 0) {
            printf "ICU Water Reserve Average Usage: %.2f Liters/min\n", sum/count
        } else {
            printf "No ICU Water Reserve data found.\n"
        }
    }
    ' active_logs/water_usage_log.log
}

echo "Running Clinical Analyst vitals process..."
process_vitals

echo "Running Facility Auditor water usage audit..."
water_audit
