#!/bin/sh

#
# This script download git repositories
#

if [ ! -d src ]; then
    mkdir src
fi


# ls color
git clone https://github.com/seebi/dircolors-solarized.git ./src/

# iterm color setting
git clone https://github.com/altercation/solarized.git ./src/

# nerd font (NOW NOT USED)
<< NOTICE
Now not used !!
instead, using icons-in-terminal.
BUT, nerd font has larger number of gryphs, so will come back in the future
NOTICE
git clone https://github.com/ryanoasis/nerd-fonts.git ./src/

# menlo for powerline (NOW NOT USED)
# → homebrewへ変更
git clone https://github.com/lxbrtsch/Menlo-for-Powerline.git ./src/

# icons in terminal
git https://github.com/sebastiencs/icons-in-terminal.git ./src/


# 2021/12/4
# antigen
git clone git@github.com:zsh-users/antigen.git ./src/

# z.sh
# git clone git://github.com/rupa/z ${HOME}/src/z/
git clone git://github.com/rupa/z ./src/



