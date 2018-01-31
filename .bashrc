export SHELL="/bin/bash"
export EDITOR="vim"

alias ls="ls --color=auto"
alias l="ls"
alias ll="ls -l"
alias sl="ls"
alias py="python"
alias vim="vim -O"
alias :wq='exit'
alias :wq!='exit'
alias :q='exit'
alias :q!='exit'
alias gcim='gvim'


bind '"\ed": shell-kill-word'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# ensure that the terminal size is updated after each command
shopt -s checkwinsize

export HISTCONTROL=ignoreboth:erasedups

ff() {
	find . -type f -name "*$@*" 2>/dev/null
}

fd() {
	find . -type d -name "*$@*" 2>/dev/null
}

swap_include_src() {
	local new_dir="${PWD}"
	if [[ ${PWD} == *"src"* ]]; then
		new_dir="${PWD/src/include}"
	elif [[ ${PWD} == *"include"* ]]; then
		new_dir="${PWD/include/src}"
	fi
	cd ${new_dir}
}
alias i="swap_include_src"
alias :A="i"

bold_on="\[\e[1m\]"
bold_off="\[\e[21m\]"
inverted_on="\[\e[7m\]"
inverted_off="\[\e[27m\]"
red_on="\[\e[31m\]"
red_off="\[\e[39m\]"
green_on="\[\e[32m\]"
green_off="\[\e[39m\]"

# prompt magic
__prompt() {
	# Use the user@host prefix on the prompt
	PROMPT_PREFIX="\u@${bold_on}\h${bold_off}"
	PROMPT_POSTFIX="\w \$ "

	PROMPT="${PROMPT_PREFIX}"

	# Git stuff
	BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	if [ "${BRANCH}" != "" ]; then
		# Use the branch name as the git indicator
		GIT_TEXT=${green_on}${BRANCH}${green_off}

		# Add additional status about the git repository
		GIT_STATUS=""
		if [ "$(git ls-files --exclude-standard --others)" ]; then
			# There are unstaged changes
			GIT_STATUS=${red_on}"*"${red_off}
		else
			if ! git diff-index --cached --quiet HEAD --ignore-submodules --; then
				# There are uncommited changes
				GIT_STATUS=${green_on}"*"${green_off}
			fi
		fi
		GIT_TEXT+="${GIT_STATUS}"

		PROMPT+=" ${GIT_TEXT}"
	fi

	# Add the final prompt postfix
	PROMPT+=" ${PROMPT_POSTFIX}"
	PS1="${PROMPT}"
}


PROMPT_COMMAND=__prompt
