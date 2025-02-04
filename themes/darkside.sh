#       _            _        _     _              _     
#      | |          | |      (_)   | |            | |    
#    __| | __ _ _ __| | _____ _  __| | ___     ___| |__  
#   / _` |/ _` | '__| |/ / __| |/ _` |/ _ \   / __| '_ \ 
#  | (_| | (_| | |  |   <\__ \ | (_| |  __/  _\__ \ | | |
#   \__,_|\__,_|_|  |_|\_\___/_|\__,_|\___| (_)___/_| |_|
#
# A shell prompt for evil sith.
# author: @hudsonsmith
                                                       
source ~/.n1/prompt_tools/git.sh

git_stats () {
	if [[ ! $(__git_ps1) ]]; then
		return
	fi

	local STATUS=$(git status -s 2> /dev/null)

	if echo "$STATUS" | grep -q "fatal"; then
		return
	fi

	local UNTRACKED=$(echo "$STATUS" | grep "^??" | wc -l)
	local MODIFIED=$(echo "$STATUS" | grep "^ M\|^MM" | wc -l)
	local DELETED=$(echo "$STATUS" | grep "^ D" | wc -l)

	stats=""

	#if [ $MODIFIED != 0 ]; then
	stats="$green$MODIFIED~$reset "
	#fi
	#if [ $UNTRACKED != 0 ]; then
	stats+="$red$DELETED-$reset "
	stats+="$purple$UNTRACKED!$reset "
	#fi
	echo -e "$stats"
}

export PS1="$cyan┌──[$reset $cyan\u@\h$reset$red in$reset $green\w$reset$cyan ]$reset$cyan($reset$red\T$reset$cyan)$reset$yellow\$(__git_ps1) $reset\$(git_stats)\n$cyan└─❯$reset "
preview="$cyan┌──[$reset ${cyan}smith@matrix$reset$red in$reset $green/home/smith$reset$cyan ]$reset$cyan($reset${red}07:25:19$reset$cyan)$reset$yellow (main) $reset${green}2~${reset} ${red}5-${reset} ${purple}3!${reset}\n$cyan└─❯$reset "
