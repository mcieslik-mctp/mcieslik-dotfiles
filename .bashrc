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
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias e="TERM=xterm-256color emacs -nw"
alias l="ls --color=always --group-directories-first"
alias ds="docker ps"

function b {
    PROJ=/mctp/users/mcieslik/proj
    WDIR=$PROJ/wdir
    RNASCAPE=/mctp/projects/rnascape
    docker run --privileged -t -i \
        "${@:2}" \
        -v /tcga:/tcga \
        -v /mctp:/mctp \
        -v $PROJ:/proj \
        -v $WDIR:/wdir \
        -v $RNASCAPE:/rnascape \
        -v $RNASCAPE/refs/rel3:/refs \
        -e GXVER=v1 -e USER=$USER --user=$(id -u) -e HOME=/wdir -w /wdir \
        --name $1 -e DOCKER_CONTAINER=$1 \
        --net=host \
        "gxmcieslik:1.7.0" /bin/bash
}

function t {
    source /mctp/users/mcieslik/proj/tpo/tpo.sh
    docker run --privileged -t -i \
        "${@:2}" \
        -v /mctp:/mctp \
        -v $TPO_HERE:/tpo \
        --user=$(id -u) -w /home/$USER \
        --name $1 \
        --net=host \
        "$TPOUSER_IMAGE" /bin/bash
}

function da {
    docker attach "$1"
}

function ds {
    docker ps -a
}

function dx {
    docker rm $(docker ps -a -q) &>/dev/null
}
