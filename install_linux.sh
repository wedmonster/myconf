#!/bin/bash

# set vim configuration
echo "set vim configuration"
cp -r .vim ~/

if [ -f ~/.vimrc ]; then
    echo "remove existing ~/.vimrc"
    rm ~/.vimrc
fi

if [ -f ~/.gvimrc ]; then
    echo "remove existing ~/.gvimrc"
    rm ~/.gvimrc
fi

ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.gvimrc ~/.gvimrc
vim +PluginInstall +qall

