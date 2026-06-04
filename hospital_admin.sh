#/bin/bash
Initialize_system(){
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
}
Initialize_system

#create the secure_data function to verify if the directory active_logs exists.
secure_data(){
	#uses the if condition to verify if the directory exists.
	if [ ! -d "active_logs" ]; then
		echo "ERROR: active-logs not found"
		return 1
	fi
i	# Apply strict permissions: only the owner can read, write, and execute.
	chmod 700 active-logs
	echo "active_logs is now secured"
	ls -ld active_logs #shows the directory's permission 
}
secure_data


# This script runs the full hospital admin workflow in order

# Call Member 1 function (system setup)
initialize_system

# Call Member 2 function (security setup)
secure_data

# Print final system status with timestamp
echo "System Environment Secured - $(date)"

#!/bin/bash

# Run the system setup function
initialize_system

# Secure the active_logs directory
secure_data

# Display confirmation with current date and time
echo "System Environment Secured - $(date)"
