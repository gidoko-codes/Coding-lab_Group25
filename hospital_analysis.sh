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

water_audit
