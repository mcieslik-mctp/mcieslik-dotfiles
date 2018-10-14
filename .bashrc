#!/usr/bin/env bash
[[ $- != *i* ]] && return
[ -z "$PS1" ] && return
if [ -z "${EMACS}" ]; then
    export TERM="xterm-256color"
fi
shopt -s checkwinsize
shopt -s globstar
shopt -s histappend
export LANG=en_US.UTF-8
export SHELL=/bin/bash
export PROMPT_DIRTRIM=10
PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"

## aliases
alias e="TERM=xterm-256color emacs -nw"
alias l="ls --color=always --group-directories-first"
alias config='/usr/bin/git --git-dir=/home/mcieslik/.cfg/ --work-tree=/home/mcieslik'
