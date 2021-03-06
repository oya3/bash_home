PS1='\[\033]0;\W$(__git_ps1)\007\]\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\W\[\e[0;33m\]$(__git_ps1)\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
alias ls='ls --show-control-chars --color'
alias ll='ls -la --show-control-chars --color'
LS_COLORS='di=34:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS
# emacsclientw.exeは引数なしで起動できない。とりあえず 「$ emacs .」 で逃げる
alias emacs='"C:\bash_home\tools\emacs\bin\emacsclientw.exe"'
# runemacs.exe はemacsが起動してないと使えない。。。

# パス追加
export PATH=$PATH:~/.emacs.d/_usr_/bin

# # gtags with pygments settings
# # .globalrc に変更分を全て記載したため以下不要
# export GTAGSCONF=/c/bash_home/_usr_/share/gtags/gtags.conf
# export GTAGSLABEL=pygments

# git 設定
# source ~/.git-completion.bash
# source ~/git-prompt.sh
source ~/git-completion.bash
source ~/git-prompt.sh

# add されていない変更の存在を「＊」で示す
# commit されていない変更の存在を「＋」で示す
GIT_PS1_SHOWDIRTYSTATE=true
# add されていない新規ファイルの存在を「％」で示す
GIT_PS1_SHOWUNTRACKEDFILES=true
# stash がある場合は「＄」で示す
GIT_PS1_SHOWSTASHSTATE=true
# upstream と同期している場合は「＝」で示す
# upstream より進んでいる場合は「＞」で示す
# upstream より遅れている場合は「＜」で示す
GIT_PS1_SHOWUPSTREAM=auto

# # proxy例外
# export no_proxy=192.168.10.13
# export NO_PROXY=192.168.10.13

alias goomron='cd "C:/home/work/omron"'
alias gomelco='cd "C:/home/work/mitsubishi_electric"'
alias gowebtest='cd "C:/home/work/web_test"'
