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