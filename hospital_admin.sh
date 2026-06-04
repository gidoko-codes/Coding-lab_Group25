#!/bin/bash
#create the secure_data function to verify if the directory active_logs exists.
secure_data(){
	#uses the if condition to verify if the directory exists.
	if [ ! -d "active_logs" ]; then
		echo "ERROR: active-logs not found"
		return 1
	fi
	# Apply strict permissions: only the owner can read, write, and execute.
	chmod 700 active-logs
	echo "active_logs is now secured"
	ls -ld active_logs #shows the directory's permission 
}
secure_data
