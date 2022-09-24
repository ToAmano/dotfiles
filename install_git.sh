#!/bin/sh

#
# This script download git repositories
#

if [ ! -d src ]; then
    mkdir src
fi

cd src

# ls color
git clone https://github.com/seebi/dircolors-solarized.git 

# iterm color setting
git clone https://github.com/altercation/solarized.git 

# nerd font (NOW NOT USED)
<< NOTICE
Now not used !!
instead, using icons-in-terminal.
BUT, nerd font has larger number of gryphs, so will come back in the future
NOTICE
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git 

# menlo for powerline (NOW NOT USED)
# → homebrewへ変更
git clone https://github.com/lxbrtsch/Menlo-for-Powerline.git 

# icons in terminal
git clone https://github.com/sebastiencs/icons-in-terminal.git 

# 2021/12/4
# antigen
git clone https://github.com/zsh-users/antigen.git 

# z.sh
git clone https://github.com/rupa/z.git
