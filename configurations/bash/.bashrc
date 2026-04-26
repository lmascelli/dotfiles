#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias em='emacs -nw'
PS1='[\u@\h \W]\$ '

export PATH="/home/leonardo/usr/bin:$PATH"
export XUSERFILESEARCHPATH="/home/leonardo/usr/etc/app-defaults/%N"
