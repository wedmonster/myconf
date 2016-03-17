#!/bin/bash

USER=$(whoami)

if [ "$USER" != "root" ]; then
    echo "This script must be run by root. Try use sudo"
    exit 1
fi

case "$(uname -s)" in
    Darwin)
        # Max OSX
        bash ./install_osx.sh
        ;;
    Linux)
        bash ./install_linux.sh
        ;;
esac


# install tmux-mem-cpu-load
#echo "Install tmux-mem-cpu-load module in tmx"
#PWD=$(pwd)
#cd ~/.tmux
#cd ~/.tmux/vendor/tmux-mem-cpu-load
#cmake .
#make
#sudo make install
#tmux source-file ~/.tmux.conf
#cd $PWD

