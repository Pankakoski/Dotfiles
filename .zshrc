##############################################
# export
#---------------------------------------------
#export LANG=ja_JP.UTF-8
export EDITOR=vim
export PYTHONPATH=$HOME/local/lib/python
export LD_LIBRARY_PATH="$HOME/local/lib"
export EDITOR=vim
#export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

export PATH=$PATH:$HOME/bin
export PERL5LIB=xxx:yyy:zzz:$PERL5LIB

export MANPATH=/opt/local/man:$MANPATH

##############################################
# alias
#---------------------------------------------

#alias ls='ls -F --color'
alias ls='ls -G'
alias lsa="ls -la"
alias lf="ls -F"
alias ll="ls -l"
alias su="su -l"
alias gh="history 0 | grep" 
alias where="command -v"
alias ,q='exit'
alias vi='vim'
#alias grep="egrep -ir --color"
alias perl-debug="perl -MDevel::SimpleTrace"
#alias j="jobs -l"
#alias gd='dirs -v;echo -n "select number: "; read newdir; cd -"$newdir"'
#alias du="du -h"
#alias df="df -h"

##############################################
# prompt 
#---------------------------------------------
autoload colors
colors


AGENT_MARK="A"
if [ -z "$SSH_AGENT_PID" ] ; then
    AGENT_MARK=":"
fi

local GRAY=$'%{\e[1;30m%}'
local LIGHT_GRAY=$'%{\e[0;37m%}'
local DEFAULT=$'%{\e[1;37m%}'

local CYAN=$'%{\e[1;36m%}'
local YELLOW=$'%{\e[1;33m%}'
local PURPLE=$'%{\e[1;35m%}'
local GREEN=$'%{\e[1;32m%}'
local BLUE=$'%{\e[1;34m%}'



HOSTNAME=`hostname`
PROMPT=$DEFAULT'$DEFAULT%(!.#.$) '
RPROMPT=$PURPLE'[%~]'$DEFAULT


setopt PROMPT_SUBST


##############################################
# set options
#---------------------------------------------
setopt auto_pushd
setopt correct
setopt list_packed
#setopt auto_cd
#setopt noautoremoveslash # no remove postfix slash of command line
#setopt nolistbeep # no beep sound when complete list displayed

##############################################
# history
#---------------------------------------------
bindkey -e

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups hist_save_no_dups
setopt share_history # share command history data
setopt auto_list

##############################################
# Completion configuration
#---------------------------------------------
autoload -U compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

compinit



#export TERM=xterm-16color
