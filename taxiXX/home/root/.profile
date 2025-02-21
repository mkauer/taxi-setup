#!/bin/sh

# initialize the environment  
source /opt/taxi/setupenv.sourceme

export PATH=${PATH}:/home/root/bin
export UNISONLOCALHOSTNAME="localhost"
export EDITOR=vi

# udaq channels currently cabled
export CHANS="1 2 3 4 5 6 7 8"

alias ls='ls --color=auto'
alias ll='ls -hAl'
alias lt='ls -hAl'

alias logout='exit'

