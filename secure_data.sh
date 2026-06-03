#!/bin/bash
#create the secure_data function to verify if the directory active_logs is found
secure_data(){
	#uses the if condition to verify if the directory exists.
	if {! -d "active_logs" }; then
		echo "ERROR: active-logs not found"
		return 1
	fi
	# now have to change the permission so that the owner can read, write, and execute the directory.
	chmod 700 active-logs
	echo "active_logs is now secured"
	ls -ld active_logs
}
