#!/bin/bash

# Check whether the active_logs directory exists
if [ ! -d "active_logs" ]; then
    echo "Creating active_logs directory"
    mkdir active_logs
else
    echo "The active_logs directory already exists."
fi

# Check whether the archived_logs directory exists
if [ ! -d "archived_logs" ]; then
    echo "Creating archived_logs directory"
    mkdir archived_logs
else
    echo "The archived_logs directory already exists."
fi

# Check whether the reports directory exists
if [ ! -d "reports" ]; then
    echo "Creating reports directory"
    mkdir reports
else
    echo "The reports directory already exists."
fi
