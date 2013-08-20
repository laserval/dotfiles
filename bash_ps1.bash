#! /bin/bash
# Git-completion PS1 handler
# Special case for master!
ps1_gitbranch() {
	local branch="$(__git_ps1 '%s')"
	case $branch in
		master*)
			echo "| ‡‡ $branch ‡‡"
			;;
		"")
			echo ""
			;;
		*)
			echo "| $branch"
			;;
	esac
}

ps1_generate() {
	result=$1
	coolchar=$2
	
	title="\[\e]0;$COOL_CHAR \W \a\]"
	user="\[$CYAN\]"'\u'
	path="\[$WHITEb\]\w"
	branch="\[$RED\]"'$(ps1_gitbranch)'
	lb="\[$DEFAULT\]\n"
	approval="\[$RED\]✘\[$DEFAULT\]"
	if [ $result = 0 ]; then
		approval="\[$GREEN\]✔\[$DEFAULT\]"
	fi
	prompt="\[$YELLOWb\]$coolchar\[$DEFAULT\]"
	str="$title$approval $user $path $branch$lb$prompt  "
	# Set PS1
	PS1=$str
}

GIT_PS1_SHOWDIRTYSTATE=true
chars=("☆" "☼" "♨" "♎" "☯" "△" "❖")
num_chars=${#chars[*]}
COOL_CHAR="${chars[$((RANDOM%num_chars))]} "
#export PS1='$(ps1_gitbranch)' "
PROMPT_COMMAND='ps1_generate $? $COOL_CHAR'