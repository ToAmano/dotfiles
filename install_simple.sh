#!/usr/bin/env bash

dotfiles_logo='
      | |     | |  / _(_) |           
    __| | ___ | |_| |_ _| | ___  ___  
   / _` |/ _ \| __|  _| | |/ _ \/ __| 
  | (_| | (_) | |_| | | | |  __/\__ \ 
   \__,_|\___/ \__|_| |_|_|\___||___/ 
  *** WHAT IS INSIDE? ***
  1. Symlinking dot files to your home directory
  2. Execute all sh files within `etc/init/` (optional)
  See the README for documentation.
'
echo "$dotfiles_logo"

# 未定義な変数があったら途中で終了する
set -u

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
# dirに対してもlinkを貼ろうとするのでそれはやめさせる。

echo 
echo "linking dot files (including gnuplot)..."
echo
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    [ "$f" = ".DS_Store" ] && continue
    [ "$f" = ".emacs.d" ] && continue

    # シンボリックリンクを貼る
    ln -snfv ${PWD}/"$f" ~/
done

# init.elのリンクをはる．
if [ ! -d ${HOME}/.emacs.d ];then
    mkdir ${HOME}/.emacs.d
fi
ln -snfv ${PWD}/.emacs.d/init.el ~/.emacs.d/init.el
ln -snfv ${PWD}/.emacs.d/insert ~/.emacs.d/insert  # for auto-insert template


# make directories for emacs
echo
echo "making directories for emacs..."
echo
if [ ! -d ${HOME}/.emacs.d/elpa ];then
    mkdir ${HOME}/.emacs.d/elpa
fi
if [ ! -d ${HOME}/.emacs.d/elips ];then
    mkdir ${HOME}/.emacs.d/elips
fi
if [ ! -d ${HOME}/.emacs.d/conf ];then
    mkdir ${HOME}/.emacs.d/conf
fi
if [ ! -d ${HOME}/.emacs.d/public_repos ];then
    mkdir ${HOME}/.emacs.d/public_repos
fi
if [ ! -d ${HOME}/.emacs.d/site-lisp ];then
    mkdir ${HOME}/.emacs.d/site-lisp
fi

echo
echo "making directories for downloads..."
echo
if [ ! -d ${HOME}/var ];then
    mkdir ${HOME}/var
fi
if [ ! -d ${HOME}/var/chrome ];then
    mkdir ${HOME}/var/chrome
fi
if [ ! -d ${HOME}/var/mail ];then
    mkdir ${HOME}/var/mail
fi



# sshのlinkをはる。
# mkdir ${HOME}/.ssh
# ln -snfv ${PWD}/.ssh/config ${HOME}/.ssh/config


# emacs true color用の設定．
# https://stackoverflow.com/questions/14672875/true-color-24-bit-in-terminal-emacs
# use "system tic" https://emacs.stackexchange.com/questions/32506/conditional-true-color-24-bit-color-support-for-iterm2-and-terminal-app-in-osx
/usr/bin/tic -x -o ${HOME}/.terminfo ${BASEDIR}/.terminfo/78/terminfo-24bit.src



# https://repo.anaconda.com/archive/Anaconda3-2022.05-MacOSX-x86_64.sh
