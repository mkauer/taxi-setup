#!/bin/sh

# udaq channels currently cabled
export CHANS="1 2 3 4 5 6 7 8"

# initialize the environment  
source /opt/taxi/setupenv.sourceme

export PATH=${PATH}:/home/root/bin
export UNISONLOCALHOSTNAME="localhost"
export EDITOR=vi

alias ls='/bin/ls --color=auto'
alias ll='ls -hAl'
alias lt='ls -hAl'
alias rm='/bin/rm -rf'
alias logout='exit'

