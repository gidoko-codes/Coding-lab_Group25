#!/bin/bash

process_vitals() {
    echo "Processing critical alerts..."

    grep "CRITICAL" active_logs/heart_rate.log active_logs/temperature.log 2>/dev/null | awk -F',' "{print \$1 \",\" \$2 \",\" \$3}" > reports/critical_alerts.txt

    echo "Critical alerts saved to reports/critical_alerts.txt"
}

process_vitals