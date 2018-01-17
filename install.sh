#!/usr/bin/env bash

# check if command is available
has() {
  type "$1" > /dev/null 2>&1
}

# check npm
echo "0. Checking npm version..."

version=`npm --version 2>/dev/null`

if [ -z $version ]; then
  echo >&2 "=> Command npm not found. You should install Node.js, visit https://github.com/creationix/nvm"
  exit -1
fi

echo "=>  npm version: $version"

echo ""
echo ""

echo "1. Installing mnpm..."

# exit if mnpm command is available
if has "mnpm"; then
  echo >&2 "=> Command mnpm already exists."
  exit -2
fi

# alias string
SOURCE_STR='alias mnpm="npm \
  --registry=http://r.npm.sankuai.com \
  --cache=$HOME/.cache/mnpm \
  --disturl=http://npm.sankuai.com/mirrors/node \
  --userconfig=$HOME/.mnpmrc"'

# profile path
PROFILE="$HOME/.profile"

# ask user to edit profile by himself if mnpm is already in profile
if command grep -qc 'mnpm' "$PROFILE"; then
  echo '=> Please paste the following content into ".profile" in your home directory, then reload with source "source ~/.profile"'

  echo ""
  echo ""

  echo "$SOURCE_STR"
  exit -3
fi

# insert mnpm alias into profile

echo "=> Appending mnpm source string to $PROFILE"

command printf "\n\n${SOURCE_STR}\n\n" >> "$PROFILE"

echo "DONE"

echo ""

echo 'Please reload with source "source ~/.profile"'

echo ""

exit 0
