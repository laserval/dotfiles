#! /bin/bash

function lsgit() {
	for d in `ls`
	do
		test -d $d || continue
		( cd $d && test -d .git && echo "$d" && git "$@" )
	done
}

function cleargit {
	git fetch -p
	IFS=$'\n'
	for branch in $(git branch)
	do
		if [[ $branch =~ ^[^\*].*$ && $branch != "  master" ]]; then
			( echo $branch | xargs git branch -d )
		fi
	done
}

function watchtree {
	watch -n 3 git tree
}