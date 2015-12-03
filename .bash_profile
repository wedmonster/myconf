#source .bashrc
eval `dircolors ~/.dir_colors/dircolors.ansi-dark`
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}


function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch     is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2>     /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}
export PS1="\[$(tput bold)\]\[$(tput setaf 0)\][\w] \[\033[38;5;2m\]\`parse_git_branch\` \n\[$(tput bold)\]\[$(tput setaf 6)\]\t \[$(tput setaf 2)\](\[$(tput setaf 3)\]\u\[$(tput sgr0)\]@\[$(tput setaf 3)\]\h \[$(tput bold)\]\[$(tput setaf 6)\]\W\[$(tput sgr0)\]\[$(tput bold)\]\[$(tput setaf 2)\])\[$(tput setaf 4)\]\\$ \[$(tput sgr0)\]"
export PATH="$PATH:/usr/include:/usr/local/bin"
#export PS1="\[$(tput bold)\]\[$(tput setaf 6)\]\W\[$(tput bold)\]\[$(tput setaf 2)\])\[$(tput setaf 4)\]\$ "



# aliases
alias ls='ls --color=always'
alias ll='ls -alF'

