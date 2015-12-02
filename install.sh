#!/bin/bash

cp ./.bashrc ~/
cp ./.bash_profile ~/
cp -r ./.dir_colors ~/
cp ./.vimrc ~/
cp -r ./.vim ~/
cp -r ./.tmux ~/

# apply bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if [ -f ~/.tmux.conf ]; then
    echo "Remove the existing tmux.conf"
    rm ~/.tmux.conf
fi

# apply tmux.conf
case "$(uname -s)" in
    Darwin)
        # Max OSX
        ln -s ~/.tmux/.tmux-osx.conf ~/.tmux.conf
        ;;
    Linux)
        ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
        ;;
esac

# install tmux-mem-cpu-load
PWD=$(pwd)
cd ~/.tmux
git submodule init
git submodule update
cd ~/.tmux/vendor/tmux-mem-cpu-load
cmake .
make
sudo make install
tmux source-file ~/.tmux.conf
cd $PWD

