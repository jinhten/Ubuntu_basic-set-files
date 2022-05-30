# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################

export no_proxy="127.0.0.1, localhost"


#export LD_LIBRARY_PATH='/usr/lib:/usr/lib64:/home/kktjin/mycode/http3/opensource/msquic/build/bin/Release'
export LD_LIBRARY_PATH='/usr/lib:/usr/lib64:/usr/local/lib'
export PATH='/home/kktjin/android-ndk-r24:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin'

#pkg-config --cflags --libs protobuf
#pkg-config --libs protobuf
#pkg-config --cflags protobuf

#for core
#ulimit -c 1048576


alias vi='vim'
alias b='cd ..'
alias vd='vimdiff '
alias sbash='source ~/.bashrc'
alias bashset='vi ~/.bashrc'
alias vimset='vi ~/.vimrc'

alias cxml='/usr/bin/xmllint --nonet --xinclude --noout'
alias gr='grep -rn'
alias ctags='~/shell/exctags'

alias core='cd $HOME/core'
alias vg='valgrind --tool=memcheck --leak-check=full --show-reachable=yes --log-file=memcheck.txt'

alias rtc='cd /home/kktjin/zib/ZibRTC/zibRtc'
alias debug='cd /home/kktjin/zib/ZibRTC/zibDebug'
alias comm='cd /home/kktjin/zib/ZibRTC/zibComm'
alias turn='cd /home/kktjin/zib/ZibRTC/zibTurn'
alias proto='cd /home/kktjin/zib/ZibRTC/zibProto'
alias main='cd /home/kktjin/zib/ZibRTC/zibMAIN'
alias win='cd /home/kktjin/zib/ZibWindows'
alias winl='cd /home/kktjin/zib/ZibWindows_Linux'
alias zibl='cd /home/kktjin/zib/ZibNet_Linux'
alias stg='cd $HOME/backup/zib'
alias my='cd $HOME/mycode'
alias cpp='cd $HOME/mycode/c++'
alias test='cd $HOME/mycode/test'
alias udp='cd $HOME/mycode/test/udp'
alias tcp='cd $HOME/mycode/test/tcp'
alias thread='cd $HOME/mycode/test/thread/mythread'
alias msquic='cd $HOME/mycode/http3/opensource/msquic'

alias publicip='curl ifconfig.me'

alias g='g++ -std=c++17'

#####################################
#####  git command : https://midnightcow.tistory.com/135
#####################################
alias gitlist='git config --list'
#alias rtcclone='git clone https://kkt.jin@github.sec.samsung.net/ZibServer/ZibRTC.git'
alias rtcclone='git clone git@github.sec.samsung.net:ZibServer/ZibRTC.git'

alias gitunset='git config --unset --global'

alias setgit='vi ~/shell/git.sh'
alias sgit='~/shell/git.sh'

alias add='git add'
alias del='git rm --cached'
alias status='git status'
alias commit='git commit -m'
alias pull='git pull --rebase'
alias push='git push origin'


# curl ident.me, curl ifconfig.me
alias myip='curl icanhazip.com'
alias useport='netstat -nap'
