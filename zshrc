# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistfile
HISTSIZE=10000
SAVEHIST=10000

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. /home/chq-stephenco/proxy_configs

fpath+=("$HOME/repos/thirdparty/pure")

export PATH=/mnt/c/Users/chq-stephenco/bin:$PATH
#export JAVA_HOME=/usr/lib/jvm/java-6-sun
#export CATALINA_HOME=/usr/share/tomcat6
#export CLASSPATH=/usr/share/maven-repo/
export EDITOR=vim
#source ~/qmk_utils/activate_wsl.sh 

setopt correct appendhistory autocd extendedglob nomatch notify inc_append_history
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

#-----------SPECTRUM_LS------------------
#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done


ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-This used to be in some other language I dont understand}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

#-------SPECTRUM_LS---------------


d=.dircolors
test -r $d && eval "$(dircolors $d)"

## vcs_info configuration
#autoload -Uz vcs_info
##zstyle ':vcs_info:*' formats '(%b)%{%f%}'
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*' stagedstr '%{%F{yellow}%B%}%{%f%}'
#zstyle ':vcs_info:*' unstagedstr '%{%F{red}%B%}%{%f%}'
#zstyle ':vcs_info:*' formats "%{%F{012}%}%{%F{012}%} %b %c%u%{%f%} %{%F{012}%} %{%F{007}%}"

if [[ "$TERM" == "xterm" ]]; then
	export TERM=xterm-256color
fi

function precmd() {

		if [[ -w $PWD ]]; then
			#PR_PWDCOLOR=$'%{\e[32m%}'
			PR_PWDCOLOR="%{%F{002}%}"
		else
				PR_PWDCOLOR="%{%F{001}%}"
		fi
		#vcs_info

}

autoload -U promptinit; promptinit
prompt pure


setprompt() {
	setopt prompt_subst

	autoload colors zsh/terminfo

	if [[ "$terminfo[colors]" -ge 256 ]]; then
		autoload -U colors && colors

#		for color in red green yellow white black blue cyan gray; do
#			eval pr_$color='%{$fg[${(l)color}]%}'
#			eval pr_bright_$color='%{$fg_bold[${(l)color}]%}'
#		done

		pr_reset="%{$reset_color%}"
		#pr_pwd_default=$'%{\e[38;5;78m%}'
		pr_pwd_yellow=$'%{\e[38;5;226m%}'
		pr_pwd_default="%{%f{022}%}"

#		prompt=$'${pr_red} \u2584
#${pr_bright_blue}\u2587${pr_red}\u2518${pr_bright_white}%n${pr_blue}@${pr_bright_blue}%m ${pr_reset}${pr_blue}(${pr_pwdcolor}%~${pr_blue})
#${pr_bright_blue}\u2514${pr_green}\u2586${pr_reset} '

		prompt=$'
%{%F{014}%}%n%{%F{012}%} ⇨ %{%F{004}%}%m%{%F{012}%} ⇨ ${PR_PWDCOLOR}%~ ${vcs_info_msg_0_}
%{%b%}${pr_reset}%{%F{014}%}➤%{%F{004}%}➤%{%F{008}%}➤%{%f%} '
#		prompt=$'
#${pr_reset}${pr_blue}(${pr_pwdcolor}%~${pr_blue}) ${vcs_info_msg_0_}> ${pr_reset}'
	else

		prompt=$'%n@%m (%~)\n>>> '
	fi
}

#setprompt

if [ $(tty) = '/dev/tty1' ]; then
	startx 2> /dev/null
	logout
fi

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

############## Aliases
alias ls="ls --color -h --group-directories-first"
alias lsa="ls -Al"
alias lsl="ls -l"
alias du1="du -h --max-depth=1"

alias vi="vim"



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
