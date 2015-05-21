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

function addGitTree {
	git config --global alias.tree "log --graph --pretty=format:'%C(white bold dim)%h%Creset%C(blue)%d%Creset %C(white)%s%C(reset) (by %C(green dim)%an %C(red dim)%ar%C(reset))%Creset' --all"
}
