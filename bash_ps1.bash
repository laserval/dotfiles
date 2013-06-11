# Git-completion PS1 handler
# Special case for master!
gitbranch() {
	local branch="$(__git_ps1 '%s')"
	case $branch in
		master*)
			echo "| 💀  $branch"
			;;
		"")
			echo ""
			;;
		*)
			echo "| $branch"
			;;
	esac
}

# Approval PS1, from http://jamiedubs.com/ps1-collection-customize-your-bash-prompt
approval() {
	if [ \$? = 0 ]; then
		echo -e '\e[01;32m:)'
	else
		echo -e '\e[01;31m:('
	fi
}

GIT_PS1_SHOWDIRTYSTATE=true
chars=("🐷" "🐯" "🐸" "🐶" "🐵" "🐙" "🐮" "🐰" "🐻" "🐱" "🐯" "🐨" "🐭")
num_chars=${#chars[*]}
COOL_CHAR="${chars[$((RANDOM%num_chars))]} "
export PS1="\[\e]0;$COOL_CHAR \W \a\]\[$GRAY\]"'\t '"\[$CYAN\]"'\u'"\[$WHITEb\] \w \[$RED\]"'$(gitbranch)'"\n\[$DEFAULT\]$COOL_CHAR "
