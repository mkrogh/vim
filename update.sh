#!/bin/sh

# go into repo root
cd "$(dirname "$0")"

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
