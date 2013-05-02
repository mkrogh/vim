#!/usr/bin/env bash

# go into repo root
cd "$(dirname "$0")"
VIMDIR=`pwd`

function pull {
  # pull from git repo including initialised submodules
  echo "Pull in changes..."
  git pull --recurse-submodules
}

function init_subm {
  # initialise and update new submodules
  echo "Initialise and update submodules..."
  for d in `grep "path =" .gitmodules | cut -d " " -f 3`
  do
    if [ -z "`ls -A $d`" ]; then
      git submodule init $d
      git submodule update $d
    fi
  done
}

function rm_subm {
  # remove untracked submodules
  echo "Remove untracked submodules..."
  git clean -f -f -d
}

function build_command_t {
  # Build native extention for command-t
  echo "Build native extension for Command-t..."
  cd bundle/command-t/ruby/command-t

  if [ -f ~/.rvm/scripts/rvm ]; then
    . ~/.rvm/scripts/rvm
    rvm use system
  fi

  ruby extconf.rb
  make

  # go back into repo root
  cd $VIMDIR
}

function install_fonts {
  #XXX only works on Linux for now
  fc-cache -vf ~/.vim/fonts
}

function update {
  pull
  init_subm
  rm_subm
  build_command_t
  install_fonts
}

function install_rc {
  build_command_t
}

function rerun {
  exit
}

case $1 in
  -i)
    install_rc
    ;;
  -r)
    rerun
    ;;
  *)
    update
    ;;
esac

# rerun update.sh if updated
if [ -n "`git diff --name-only master master@{1} update.sh 2>/dev/null`" ]; then
  echo "update.sh was updated, rerunning."
  ./update.sh -r
fi
