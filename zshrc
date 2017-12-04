# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=10000
SAVEHIST=10000

cd ~

export PATH=/home/stephen/bin:/home/stephen/code/android/adt-bundle-linux/sdk/platform-tools/:/home/stephen/code/android/adt-bundle-linux/sdk/tools/:$PATH
#export JAVA_HOME=/usr/lib/jvm/java-6-sun
#export CATALINA_HOME=/usr/share/tomcat6
#export CLASSPATH=/usr/share/maven-repo/
export EDITOR=vim

setopt correct appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "^R" history-incremental-search-backward
#bindkey "\eOH" beginning-of-line
#bindkey "\eOF" end-of-line
#bindkey "\e[5~" beginning-of-buffer-or-history

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/stephen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# vcs_info configuration
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)%S'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' formats '(%b)%S %u%c'

if [[ "$TERM" == "xterm" ]]; then
	export TERM=xterm-256color
fi

function precmd() {

		if [[ -w $PWD ]]; then
			PR_PWDCOLOR=$'%{\e[32m%}'
		else
				PR_PWDCOLOR=$'%{\e[31m%}'
		fi
		vcs_info

}

setprompt() {
	setopt prompt_subst

	autoload colors zsh/terminfo

	if [[ "$terminfo[colors]" -ge 256 ]]; then
		autoload -U colors && colors
	

		for COLOR in RED GREEN YELLOW WHITE BLACK BLUE CYAN GRAY; do
			eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'
			eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
		done

		PR_RESET="%{$reset_color%}"
		PR_PWD_DEFAULT=$'%{\e[38;5;78m%}'
		PR_PWD_YELLOW=$'%{\e[38;5;226m%}'

#		PROMPT=$'${PR_RED} \u2584
#${PR_BRIGHT_BLUE}\u2587${PR_RED}\u2518${PR_BRIGHT_WHITE}%n${PR_BLUE}@${PR_BRIGHT_BLUE}%m ${PR_RESET}${PR_BLUE}(${PR_PWDCOLOR}%~${PR_BLUE})
#${PR_BRIGHT_BLUE}\u2514${PR_GREEN}\u2586${PR_RESET} '

#		PROMPT=$'
#${PR_BRIGHT_WHITE}%n${PR_BLUE}@${PR_BRIGHT_BLUE}%m ${PR_RESET}${PR_BLUE}(${PR_PWDCOLOR}%~${PR_BLUE})
#${PR_RESET}${PR_BLUE}>${PR_BRIGHT_BLUE}>${PR_BRIGHT_WHITE}>${PR_RESET} '

		PROMPT=$'
${PR_RESET}${PR_BLUE}(${PR_PWDCOLOR}%~${PR_BLUE}) ${vcs_info_msg_0_}> ${PR_RESET}'
	else

		PROMPT=$'%n@%m (%~)\n>>> '
	fi
}

setprompt

#if [ $(tty) = '/dev/tty1' ]; then
#	startx 2> /dev/null
#	logout
#fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

############## Aliases
alias ls="ls --color -h --group-directories-first"
alias lsa="ls -Al"
#alias ls="ls++"
#alias lsl="ls++ --potsf"
#alias lsa="ls++ --potsf -a"
#alias lsn="ls"
alias du1="du -h --max-depth=1"
#alias to make Octopress not glob
alias rake="noglob rake"
#alias pacman="pacman-color"
alias vi="vim"


d=.dircolors
test -r $d && eval "$(dircolors $d)"
