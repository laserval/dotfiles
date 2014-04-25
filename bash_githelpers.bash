#! /bin/bash

function lsgit() {
	for d in `ls`
	do
		test -d $d || continue
		( cd $d && test -d .git && echo "$d" && git $1 )
	done
}

function cleargit {
	IFS=$'\n'
	for branch in $(git branch)
	do
		echo $branch | grep -e "^  " | xargs git branch -D
	done
}

function watchtree {
	watch -n 3 git tree
}