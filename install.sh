#!/usr/bin/env bash

VIM_PATH=~/.vim
REPO="https://github.com/jbro/vim.git"

while getopts dcp: flag; do
  case $flag in
    c)
      REPO="git@github.com:jbro/vim.git"
      ;;
    p)
      VIM_PATH=$OPTARG
      ;;
    d)
      NO_SYMLINK=true
      ;;
    ?)
      exit
      ;;
  esac
done

git clone --recursive $REPO $VIM_PATH

cd $VIM_PATH
./update.sh -r
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ ! $NO_SYMLINK ]; then
  ln -s $VIM_PATH/vimrc  ~/.vimrc
fi

