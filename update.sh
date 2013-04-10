#!/bin/bash

# go into repo root
cd "$(dirname "$0")"
VIMDIR=`pwd`

# pull from git repo including initialised submodules
git pull --recurse-submodules

# initialise and update new submodules
for d in `grep "path =" .gitmodules | cut -d " " -f 3`
do
  if [ -z "`ls -A $d`" ]; then
    git submodule init $d
    git submodule update $d
  fi
done

# remove untracked submodules
git clean -f -f -d

# Build native extention for command-t
cd bundle/command-t/ruby/command-t

if [ -f ~/.rvm/scripts/rvm ]; then
  . ~/.rvm/scripts/rvm
  rvm use system
fi

ruby extconf.rb
make

# go back into repo root
cd $VIMDIR

# rerun update.sh if updated
if [ "$1" != "-r" ]; then
  if [ -n "`git diff --name-only master master@{1} update.sh`" ]; then
    echo "update.sh was updated, rerunning."
    ./update.sh -r
  fi
fi
