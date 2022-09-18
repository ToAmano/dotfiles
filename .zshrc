############################################
# ~/.zshrc
#
#
#
# the orginal file is in ${HOME}/works/codes/.zshrc
#
############################################




# in ~/.zshenv, executed `unsetopt GLOBAL_RCS` and ignored /etc/zshrc
[ -r /etc/zshrc ] && . /etc/zshrc




#環境変数

#2020/2/23 TERM
#"xterm"だとemacs+solarizedが上手く表示されるが，"xterm+256color"ではemacs+solarizedは上手くいかない
export TERM="xterm-256color"
#export TERM="xterm-24bit"

# 可能なtermの設定は/usr/share/terminfo/以下に入っている．
# https://stackoverflow.com/questions/12345675/screen-cannot-find-terminfo-entry-for-xterm-256color/16566036


#
fpath+=$HOME/.zsh/pure




# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi


# path to homebrew
## The path can be defferent on on defferent machines.
if [[ -d '/home/linuxbrew/.linuxbrew' ]]; then
 # Linux/WSL
 HOMEBREW_HOME='/home/linuxbrew/.linuxbrew'
elif [[ -d '/opt/homebrew' ]]; then
 # M1 Mac
 HOMEBREW_HOME='/opt/homebrew'
else
 # Intel Mac (should be the last)
 HOMEBREW_HOME='/usr/local' 
fi
eval "$($HOMEBREW_HOME/bin/brew shellenv)"


####################################################
#
#lsコマンドの色について
#
####################################################


# デフォルト設定(別になくても良い)
#LS_COLORS="デフォルトの色設定(ご自由に)"
#export LS_COLORS

#read dircolors
#dircolors-solarizedを使うため，対応するファイルを読み込む．

#対応するファイルの場所
# 2021/10/30 mv dotfiles to works/codes
# 2021/12/03 mv dotfiles to works/dotfiles
dircolorsPATH=${HOME}/works/dotfiles/iterm2setting/dircolors.ansi-modify-dark
#dircolorsPATH=~/dotfiles/iterm2setting/dircolors-solarized/dircolors.ansi-modify-dark
#dircolorsPATH=~/dotfiles/iterm2setting/dircolors-solarized/dircolors.256dark
#以下で読み込み
if [ -f  ${dircolorsPATH} ];then
    if type dircolors >/dev/null 2>&1;then
	eval $(dircolors ${dircolorsPATH} )
    elif type gdircolors >/dev/null 2>&1;then
	eval $(gdircolors ${dircolorsPATH} ) 
    fi
else
    echo error DO NOT exist ${dircolorsPATH}
fi





#####補完機能について
##https://gist.github.com/d-kuro/352498c993c51831b25963be62074afa
# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "




##########cd拡張機能

# cdを使わずにディレクトリを移動できる
setopt auto_cd
# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

# 2021/12/3
# https://qiita.com/mollifier/items/1a9126b2200bcbaf515f
autoload -Uz smart-insert-last-word


# 2021/12/3
# https://wonderwall.hatenablog.com/entry/2017/02/26/000702
autoload -U zmv


# 2021/12/3
# https://qiita.com/Kakuni/items/a8025e075926272f491d

# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

# lsコマンドの補完候補にも色付き表示
zstyle ':completion:*:default' list-colors ${LS_COLORS}


# ヒストリー機能
# command r でコマンド履歴を辿るのでいっぱいにしとく
HISTFILE=~/.zsh/.zsh_history      # ヒストリファイルを指定
HISTSIZE=10000               # ヒストリに保存するコマンド数
SAVEHIST=10000               # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
zstyle ':completion:*:default' menu select


# emacs スタイルのキーバインド
# https://yuta84q.hatenadiary.org/entry/20090318/1237340720
bindkey -e

# 文字コードの設定
export LANG=ja_JP.UTF-8


#change prompt to pure
#autoload -U promptinit; promptinit
#prompt pure


#source /Users/amanotomohito/Downloads/Menlo-for-Powerline-master/'Menlo for Powerline.ttf'

# Gitブランチ名を表示
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#source ~/.git-prompt.sh

# Gitブランチの状況を*+%で表示
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto


# # 出力の後に改行を入れます
# function add_line {
#   if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
#     PS1_NEWLINE_LOGIN=true
#   else
#     printf '\n'
#   fi
# }
# PROMPT_COMMAND='add_line'


#export PS1='\[\e[37;100m\] \# \[\e[90;47m\]\[\e[30;47m\] \W \[\e[37m\]$(__git_ps1 "\[\e[37;102m\] \[\e[30m\] %s \[\e[0;92m\]")\[\e[49m\]\[\e[m\] \$ '











####################################################
#
#promptの設定について
#
####################################################

#color変更のために必要らしい
#https://www.sirochro.com/note/terminal-zsh-prompt-customize/#i-4
autoload -Uz colors
colors

#   %n ユーザ名
#   %m ホスト名
#   %* 24時間表示の時間
 
#   %{%B%}...%{%b%}: 「...」を太字にする。
#   %K{red}...%{%k%}: 「...」を赤の背景色にする。
#   %{%F{cyan}%}...%{%f%}: 「...」をシアン色の文字にする。
#   %n: ユーザ名
#   %?: 最後に実行したコマンドの終了ステータス
#   %(x.true-text.false-text): xが真のときはtrue-textになり
#                              偽のときはfalse-textになる。

##promptには，左側に表示するPROMPTと，右側に表示するRPROMPTがある．



#promptの表示．改行も楽ちん
#https://qrunch.net/@rugamaga/entries/XcrcLjb2vb5EfEUn
 # PROMPT='
 # %K{230}%F{33} %n%f %F{64}at%f %F{61}%m %f%k%K{245}%F{230}%f %F{230}%~%f%k%F{245}%f   %# '

function prompt-make {
    echo "\n %K{33}%F{235} %n%f %F{125}at%f %F{254}%m %f%k%K{136}%F{33}%f %F{230}%~ %f%k%F{136}%f   %# "
    return
}

 PROMPT='`prompt-make`'

 

#https://suwaru.tokyo/1箇所コピペするだけでgitブランチ名を常に表示【-zshrc/
# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status
 
  if [ ! -e  ".git" ]; then
      # git 管理されていないディレクトリは何も返さない
      echo "%F{245}\ue0b2%f%K{245}%F{230} %* \uf017%f %k"
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="%F{64} \ue0a0 ${branch_name}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="%F{160} \ue0a0 ${branch_name} \uf059"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="%F{160} \ue0a0 ${branch_name} \uf055"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="%F{136} \ue0a0 ${branch_name} \uf06a"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{160} \ue0a0 \uf05a (no branch)"
    return
  else
    # 上記以外の状態の場合
    branch_status="%F{33} ${branch_name}"
  fi
  # ブランチ名を色付きで表示する
  # echo "%F{245}\ue0b2%f%K{245}\ue0a0 ${branch_name} ${branch_status} %F{230}\ue0b2%k%f%K{230} %* %k"
  echo "%F{230}\ue0b2%f%K{230} ${branch_status} %F{245}\ue0b2%k%f%K{245}%F{230} %* \uf017%f %k"
}




# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
 
#https://qiita.com/YumaInaura/items/874d5be9cfdb3d0415f1
RPROMPT='`rprompt-git-current-branch`'


##これは最終兵器．powerlevel9k 最悪これを設定すればよし
##https://chaika.hatenablog.com/entry/2019/06/09/090000

# POWERLEVEL9K_MODE='nerdfont-complete'
# source ~/dotfiles/iterm2setting/powerlevel9k/powerlevel9k.zsh-theme

# # Theme settings
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true




##alias
# https://qiita.com/the_red/items/a30e23c66a3d8838912a



#2022/07/23 locate
# homebrewと被っているのを元に戻す.
alias locate="/usr/bin/locate"

#2022/7/7 g++/gcc
alias g++="${HOMEBREW_HOME}/bin/g++-11"
alias gcc="${HOMEBREW_HOME}/bin/gcc-11"


#2020/2/23 ls
#これはsolarized colorになるようにわざわざcoreutilsを入れている
#https://joppot.info/2013/12/24/265
#

#eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

# 2021/11/19
# homebrewに写ったことで，lsと打てばglsを引っ張ってくれる．
# しかし，grcにもlsの設定があるため，バッティングする．そこで，glsにaliasを入れる．
alias ls="gls -F --color=auto"
alias lsa='gls -Fa --color=auto'
alias lsl='gls -Fl --color=auto'


#2021/11/17
# color cat,less, etc...

# read grc setting 
#[[ -s "/usr/local/etc/grc.zsh" ]] && source ${HOMEBREW_HOME}/etc/grc.zsh
#[[ -s "${HOMEBREW_HOME}/share/zsh/site-functions/usr/local/etc/grc.zsh" ]] && source ${HOMEBREW_HOME}/etc/grc.zsh
[[ -s "${HOMEBREW_HOME}/etc/grc.zsh" ]] && source ${HOMEBREW_HOME}/etc/grc.zsh

# less
export LESS="-R"
export LESSOPEN="| ${HOMEBREW_HOME}/bin/src-hilite-lesspipe.sh  %s"

# cat
if [[ -x `which ccat` ]]; then
  alias cat='ccat'
fi

# diff
if [[ -x `which diff` ]]; then
    alias diff='colordiff -u'
fi


### End Colorize ###


#2020/2/23 emacs

#####以下の問題はmacのデフォルトターミナルでの問題．解決するまでは使わない
#これはsolarizedを使う上で結構重大な問題．TERMがxterm-256colorsだとsolarizedが上手く動かないので，応急処置として，emacsのみxtermで起動するようにする．
#ただしこれはM-x list-colors-display初め多くの所に影響を及ぼす．
#alias e='TERM=xterm emacs -nw'
######


#iterm2では，true colorを使用可能．これによってemacs 26以降でtrue color版を使える．
#https://fossies.org/linux/emacs/doc/misc/efaq.texi#Colors-on-a-TTY
#https://stackoverflow.com/questions/14672875/true-color-24-bit-in-terminal-emacs
alias e='TERM="xterm-24bit" emacs -nw'


##emacs TERM=xterm-direct infocmp | grep seta[bf]--daemonを使う場合のaliasの設
#2021/10/28 
#emacs-daemon+true colorに移行,こっちを使い始める．
#xterm-directでもokらしい．(が，自分のmacにはこのTERMが入ってなさそう)
#https://ytyaru.hatenablog.com/entry/2020/05/26/000000
#いずれにしても~/.terminfoディレクトリが必要なので，これもdotfileにいれておく．
alias ee='TERM=xterm-24bit emacsclient -t'



#20200515 wine（temporary）
# alias wine='~/src/wine/wine64'



##iterm2 shell integration用のコマンド
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"





# --------------------------------------
# Google search from terminal
# --------------------------------------
#2019/5/25 https://qiita.com/YuukiWatanabe/items/d3a684edb77be3804aa9
#google 「検索ワード」でsafariで検索できるようになる．

google(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
        local s="${app}/Safari.app"
    local g="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    case ${opt} in
	"-s")   open "${url}" -a "$s";;
        "-g")   open "${url}" -a "$g";;
        "-f")   open "${url}" -a "$f";;

        *)      open "${url}";;
    esac
}




# 2021/12/3 setting conda for m1 mac?
# conda activate


# 2021/10/20
# hub 
# auto completion for hub
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

eval "$(hub alias -s)"

# シェル起動時にEmacs daemonも起動する．
#  https://www.pandanoir.info/entry/2018/08/03/193000
# function estart() {
#   if ! emacsclient -e 0 > /dev/null 2>&1; then
#     ({
#       cd
#       emacs --daemon
#       cd -
#     } > /dev/null 2>&1 & )
#   fi
# }
# estart # シェル起動時にEmacsデーモンも起動する


# emacsclient用の追加の設定
# https://www.emacswiki.org/emacs/EmacsClient#h5o-1

alias ekill="emacsclient -e '(kill-emacs)'"
#alias erestart="ekill && estart"
#alias e="emacsclient -nw -a ''"
#alias emacs="emacsclient -nw -a ''"
export EDITOR="TERM=TERM=xterm-24bit emacsclient -a ''"
export ALTERNATE_EDITOR=""


# z
# https://github.com/rupa/z
source ~/src/z/z.sh


# iterm2 badge
# https://www.rasukarusan.com/entry/2019/04/13/180443
function badge() {
    printf "\e]1337;SetBadgeFormat=%s\a"\
    $(echo -n "$1" | base64)
}

function ssh_local() {
    local ssh_config=~/.ssh/config
    local server=$(cat $ssh_config | grep "Host " | sed "s/Host //g" | fzf)
    if [ -z "$server" ]; then
        return
    fi
    badge $server
    ssh $server
}


# lmode
source ${HOMEBREW_HOME}/opt/lmod/init/profile


# pyenv
# pyenv
#https://mitsudo.net/python環境の構築-mac-with-anaconda-by-homebrew/
export PYENV_ROOT=~/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)" # https://commte.net/7259
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# brew doctor 対策
# alias brew="env PATH=${PATH/\/Users\/${USER}\/\.pyenv\/shims:/} brew"

# pythonpath(acpype)
export PYTHONPATH=$PYTHONPATH:$HOME/src/acpype


# pythonpath for my modules
export PYTHONPATH=$PYTHONPATH:$HOME/works/research/work21_quadrupole/modules


export PYTHONPATH=$HOME/works/codes/tools:$PYTHONPATH
export PATH=$HOME/works/codes/tools:$PATH


# CPATH m1macだとうまく動いていない．
# https://apple.stackexchange.com/questions/414622/installing-a-c-c-library-with-homebrew-on-m1-macs
# export CPATH=/opt/homebrew/include:$CPATH
# export LIBRARY_PATH=/opt/homebrew/lib:$LIBRARY_PATH
export CPATH=${HOMEBREW_HOME}/Cellar/boost/1.79.0_1/include/:$CPATH  #boost 
export CPATH=${HOMEBREW_HOME}/Cellar/open-mpi/4.1.4/include/:$CPATH  #mpi.h
# export CPLUS_INCLUDE_PATH=/opt/homebrew/Cellar/gcc/11.3.0_2/include/c++/11:$CPLUS_INCLUDE_PATH #標準library置き換え macのdefaultでは/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1/vector:704:10:にある．


export PATH=${HOME}/works/research/jsr_utokyo/tools:${PATH}
export PYTHONPATH=${HOME}/works/research/jsr_utokyo/tools:${PYTHONPATH}
export PATH=${HOME}/works/codes/tools:${PATH}
export PYPJONPATH=${HOME}/works/codes/tools:${PYTHONPATH}



#=============================
# packages manager antigen
#=============================
# 2021/12/4
# とりあえずpackage-managerを導入．homebrewだとintel-M1macでのpathの違いが面倒なので．
# いくつかあるようだが，とりあえずantigenを使用する．
if [ -f ${HOME}/.zsh/antigen/antigen.zsh ]; then
source ${HOME}/.zsh/antigen/antigen.zsh
fi

# 
antigen bundle zsh-users/zsh-completions

# autosuggestion bundle.
antigen bundle zsh-users/zsh-autosuggestions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting


# Tell antigen that you're done.
antigen apply

# #2021/12/3
# # https://zenn.dev/k4zu/articles/zsh-tutorial
# # zsh_autosuggestions
# if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#   source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# fi


# #=============================
# # source zsh-syntax-highlighting
# #=============================

# #https://blog.glidenote.com/blog/2012/12/15/zsh-syntax-highlighting/
# #https://github.com/zsh-users/zsh-syntax-highlighting/blob/master
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

# if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#     source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi
# export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

export PATH=/Users/amano/anaconda3/bin:$PATH


# activate ssh-agent
# exec ssh-agent $SHELL


# lmod+intel/oneapi

export MODULEPATH=/opt/intel/oneapi/modulefiles:${MODULEPATH}


# AiiDA completion
# eval "$(_VERDI_COMPLETE=zsh_source verdi)"
# export PATH="/opt/homebrew/opt/ruby/bin:$PATH"


export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/amano/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/amano/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/amano/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/amano/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# coreutils
PATH=${HOMEBREW_HOME}/opt/coreutils/libexec/gnubin:${PATH}
MANPATH=${HOMEBREW_HOME}/opt/coreutils/libexec/gnuman:${MANPATH}
# ed
PATH=${HOMEBREW_HOME}/opt/ed/libexec/gnubin:${PATH}
MANPATH=${HOMEBREW_HOME}/opt/ed/libexec/gnuman:${MANPATH}
# findutils
PATH=${HOMEBREW_HOME}/opt/findutils/libexec/gnubin:${PATH}
MANPATH=${HOMEBREW_HOME}/opt/findutils/libexec/gnuman:${MANPATH}
# sed
PATH=${HOMEBREW_HOME}/opt/gnu-sed/libexec/gnubin:${PATH}
MANPATH=${HOMEBREW_HOME}/opt/gnu-sed/libexec/gnuman:${MANPATH}
# tar
PATH=${HOMEBREW_HOME}/opt/gnu-tar/libexec/gnubin:${PATH}
MANPATH=${HOMEBREW_HOME}/opt/gnu-tar/libexec/gnuman:${MANPATH}
# grep
PATH=${HOMEBREW_HOME}/opt/grep/libexec/gnubin:${PATH}
MANPATH=${HOMEBREW_HOME}/opt/grep/libexec/gnuman:${MANPATH}


export DYLD_FALLBACK_LIBRARY_PATH=${HOMEBREW_HOME}/bin/:$DYLD_FALLBACK_LIBRARY_PATH
export DYLD_LIBRARY_PATH=${HOMEBREW_HOME}/bin/:$DYLD_LIBRARY_PATH


export DYLD_FALLBACK_LIBRARY_PATH=${HOMEBREW_HOME}/Cellar/postgresql/14.5_1/lib/postgresql@14:$DYLD_FALLBACK_LIBRARY_PATH






>>>>>>> f33d973bb894652681a0da0c05d1d63614eab07c
