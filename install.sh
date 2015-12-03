#!/bin/bash

cp ./.bashrc ~/
cp ./.bash_profile ~/
cp -r ./.dir_colors ~/
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
echo "Install tmux-mem-cpu-load module in tmx"
PWD=$(pwd)
cd ~/.tmux
cd ~/.tmux/vendor/tmux-mem-cpu-load
cmake .
make
sudo make install
tmux source-file ~/.tmux.conf
cd $PWD

# install vim
if [ -f ~/.vimrc ]; then
    echo "Remove the existing tmux.conf"
    rm ~/.vimrc
    echo "Install .vimrc"
    ln -s ~/.vim/.vimrc ~/.vimrc
fi

# update plugins in vim
echo "Update plugins in vim"
vim +PluginInstall +qall

