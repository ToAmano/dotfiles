#########################################
#
# dot files
#
#########################################

# 

## How to use

### 1, 事前準備
- install xcode command line tools.
- ssh connection to github (option)
- clone "dotfiles" repository in ${HOME}/works

### 2, dotfiles
- install_simple.sh: simply symlinking .files.
- install_brew.sh: install commands/apps via homebrew
- 



## contents

1, shell setting
- .zshrc
- .zshenv
- .zprofile


2, git setting
- .gitconfig
  .gitignore_global


3, emacs setting
- init.el


4,  
- clone.sh clone other's git repository
- ~/src/z.sh
 


3, auto installation for Homebrew
!! causion !!
before installation,
- xcode Tools
are needed.


# apps
- mas
- anaconda3
- emacs

# commands
inetutils
imagemagick
sqlite


# gnu command replace
# https://qiita.com/eumesy/items/3bb39fc783c8d4863c5f
- coreutils --default-names (ls, mv)
- diffutils  (diff, cmp, diff3, sdiff)
- findutils (find, locate, updatedb, xargs)
- ed
- gawk
- gsed
- gnu-tar
- grep
- gzip

# テキスト処理
- ag
- jq
- lv
- parallel
- pandoc
- sift
- wget
- wdiff --with-gettext
- xmlstarlet



### 4, GUI apps installation for homebrew cask
https://qiita.com/takeshisakuma/items/e9685fb9e394212247c0

- alfread
- notion
- keepassXC
- things
- VS code
- iterm2
- zotero
- slack
- skim
- alfred
- deepl
- dropbox
- grammarly
- zoom
- chrome
- 

5, 



##シンボリックリンクを貼るときの相対パスの指定についての注意
#ln -s シンボリックリンクからのパス シンボリックリンクのパス が正しい
https://www.tweeeety.blog/entry/20121129/1354192716
#ただ，これだとわかりにくい．とりあえずdotfilesに関してだけ言えば，ホームディレクトリに$HOMEを用いて絶対パスで指定した方が良い．



### emacsのtrue color設定について
tic -x -o ~/.terminfo terminfo-24bit.src
を実行する。



6, TODO


３、https://github.com/b4b4r07/dotfiles/blob/master/Makefile
を参考に、makeで自動的にやってくれるようにしたい。

８、pdfpc：プレゼンテーションツール



9, python setting for pyenv
https://mitsudo.net/python環境の構築-mac-with-anaconda-by-homebrew/
http://omilab.naist.jp/~mukaigawa/misc/Makefile.html


10, gitに上げられないけど必要なファイルは基本icloudに置く。
- sauronVPN (L2TP).networkConnect
- keepass_passwords.kdbx


11, その他共有が必要なファイル。
- keepassのパスワードファイル
- sshの秘密鍵ファイル。
- 
