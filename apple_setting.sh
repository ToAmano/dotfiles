#!/bin/zsh

######
##symbolic linksを作る．
##2020/3/18
##https://qiita.com/massy22/items/5bdb97f8d6e93517f916
######

# ###パス他
# export DOTFILE_DIR=$HOME/dotfiles
# export ITERM_DIR=$HOME/dotfiles/iterm2setting



# ###最初に設定するべき各種のディレクトリ等
# function make_directories(){
#     mkdir ${DOTFILE_DIR} 
#     mkdir ${ITERM_DIR}
# }



# ###DOT_FILESのシンボリックリンクを作る

# function make_symbolic(){
#     DOT_FILES=(.bashrc .bash_profile .zshrc .zshenv .zprofile .latexmkrc)
    
#     for file in ${DOT_FILES[@]}
#     do
# 	ln -s $HOME/dotfiles/$file $HOME/$file
#     done
# }

# #Nerdfontのインストール
# #https://vwrs.github.io/font/2018/09/26/nerd-fonts/
# function nerd_fonts() {
#   git clone --branch=master --depth 1 https://github.com/ryanoasis/nerd-fonts.git
#   cd nerd-fonts
#   ./install.sh $1  # "Source" to install Sauce Code Nerd Font
# cd ..
# rm -rf nerd-fonts
# }



#  #solarizedテーマのダウンロード方法
#  function download_solarized(){
#      #~/dotfiles/iterm2setting以下にcloneする．
#      #https://hacknote.jp/archives/31390/
#      if [ ! -e ${ITERM_DIR} ]; then
# 	 mkdir ${ITERM_DIR}
#      fi
#      cd ${ITERM_DIR}
#      git clone https://github.com/altercation/solarized.git
     
#  }


 ##このスクリプトは，macのdefauls設定を色々カスタマイズするためのスクリプト

 ##参考文献
 #https://qiita.com/k-kozaki/items/febd07a22faee1b4704f
 #http://baqamore.hatenablog.com/entry/2013/07/31/222438
 #https://qiita.com/djmonta/items/17531dde1e82d9786816

#スクリーンショットの保存先の変更
#https://book.mynavi.jp/macfan/detail_summary/id=90165
mkdir ${HOME}/Documents/ScreenShots/
defaults write com.apple.screencapture location ${HOME}/Documents/ScreenShots/;killall SystemUIServer

# #ファイル存在が-eで確認できるように，dir存在は-dで確認できる．
# SCREENSHOT_DIR=$HOME/Documents/Screenshots
# if [ ! -d ${SCREENSHOT_DIR} ]; then
#     mkdir ${SCREENSHOT_DIR}
# fi

# #screenshot保存先変更
# defaults write com.apple.screencapture location ${SCREENSHOT_DIR}


##########finder設定

#隠しファイルの表示
#https://support.borndigital.co.jp/hc/ja/articles/360005975154-Finderで隠しファイル-隠しフォルダの表示-非表示
defaults write com.apple.finder AppleShowAllFiles TRUE

# https://qiita.com/djmonta/items/17531dde1e82d9786816
# Show Status bar in Finder （ステータスバーを表示）
defaults write com.apple.finder ShowStatusBar -bool true

# Show Path bar in Finder （パスバーを表示）
defaults write com.apple.finder ShowPathbar -bool true

# Show Tab bar in Finder （タブバーを表示）
defaults write com.apple.finder ShowTabView -bool true

# Show the ~/Library directory （ライブラリディレクトリを表示、デフォルトは非表示）
chflags nohidden ~/Library

