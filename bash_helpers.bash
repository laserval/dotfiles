#! /bin/bash

function resetmodes() {
	mode=$1
	for d in `ls`
	do
		( test ".git" = "$d" && continue )
		ls -la $d
		if [[ -d $d ]]; then
			echo "chmod =rwx $d"
			( test "-f" = $mode && chmod =rwx $d)
			( cd $d && resetmodes $mode )
		fi
		if [[ -f $d ]]; then
			echo "chmod =rw $d"
			( test "-f" = $mode && chmod =rw $d)
		fi
	done
}

function sourcebash() {
	source ~/.bash_profile
}

function lsdo {
	for d in `ls`
	do
		test -d $d || continue
		( cd $d && echo ": $d : $1" && "$@" )
	done
}

# http://stackoverflow.com/a/7157609
function watch() {
	local delay=2
	local lines=$(tput lines)
	lines=$((${lines:-20} - 1))

	if [[ "$1" -eq "-n" ]]; then
		shift 
		delay=$((${1:-2}))
		shift 
	fi

	while true
	do
		clear
		"$@" | head -n $lines
		sleep $delay
	done
}

function timestamp() {
	while read line; do
		echo $(date)" : "$line
	done <&0
}