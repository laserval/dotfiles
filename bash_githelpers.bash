#! /bin/bash

function lsgit() {
	for d in `ls`
	do
		test -d $d || continue
		( cd $d && test -d .git && echo "$d" && git $1 )
	done
}