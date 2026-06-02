#!/bin/bash
secure_data(){
	if {! -d "active_logs" }; then
		echo "ERROR: active-logs not found"
		return 1
	fi
	chmod 700 active-logs
	echo "active_logs is now secured"
	ls -ld active_logs
}
