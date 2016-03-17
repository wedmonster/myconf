#!/bin/bash

## Install programs: 
# list: brew, python, macvim, tmux

# install brew
echo "install brew"
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "brew is installed. checking the version:"
    brew -v
fi

# install python
echo "install python"
which -s python
if [[ $? != 0 ]] ; then
    brew install python
else
    echo "python is installed. checking the version:"
    python -V
fi

# install macvim
echo "install macvim"
which -s mvim
if [[ $? != 0 ]] ; then
    brew install macvim
    brew linkapps macvim
else
    echo "macvim is installed. checking the version:"
    mvim --version | head -n 1
fi

# install tmux
echo "install tmux"
which -s tmux
if [[ $? != 0 ]] ; then
    brew install tmux
else
    echo "mux is already installed. checking the version:"
    tmux -V
fi

## Install modules

# install powerline-status
echo "install powerline-status"
IS_INSTALLED=$(pip show powerline-status | grep powerline-status | wc -l)
if [ $IS_INSTALLED < 1 ]; then
    sudo pip install https://github.com/Lokaltog/powerline/tarball/develop
else
    echo "powerline-status is already installed. chkecing the version:"
    pip show powerline-status | grep powerline-status
fi

## Set configuration

# set bash configuration
echo "set bash configuration"
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# set vim configuration
echo "set vim configuration"
cp -r .vim ~/

if [ -f ~/.vimrc ]; then
    echo "remove existing ~/.vimrc"
    rm ~/.vimrc
fi

ln -s ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall

# set tmux configuration
echo "set tmux configuration"
cp -r .tmux ~/
if [ -f ~/.tmux.conf ]; then
    echo "remove existing ~/.tmux.conf"
    rm ~/.tmux.conf
fi

ln -s ~/.tmux/.tmux.conf ~/.tmux.conf


