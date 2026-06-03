#!/bin/bash

water_audit() {
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
echo "Running Facility Auditor water usage audit..."

water_audit
