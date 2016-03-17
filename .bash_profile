#!/bin/bash

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.path ]; then
    . ~/.path
fi


export XDG_CONFIG_DIRS='~/.config'

# set POWERLINE_HOME
IS_INSTALLED=$(pip show powerline-status | grep powerline-status | wc -l)
if [ $IS_INSTALLED -ge 1 ]; then
    export POWERLINE_HOME=$(pip show powerline-status | grep Location | awk -F ':' '{print $2}' | tr -d '[[:space:]]')/powerline
fi

# apply powerline in bash
if [ -f $POWERLINE_HOME/bindings/bash/powerline.sh ]; then
    source $POWERLINE_HOME/bindings/bash/powerline.sh
fi


