#!/usr/bin/env bash

VIM_PATH=~/.vim
REPO="git://github.com/mkrogh/vim.git"

while getopts dcp: flag; do
  case $flag in
    c)
      REPO="git@github.com:mkrogh/vim.git"
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
./update.sh -i

git config user.name "Markus Krogh"
git config user.email markus@casadelkrogh.dk

if [ ! $NO_SYMLINK ]; then
  ln -s $VIM_PATH/vimrc  ~/.vimrc
fi

