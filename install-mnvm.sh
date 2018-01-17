#!/usr/bin/env bash

# check if command is available
has() {
  type "$1" > /dev/null 2>&1
}

# check nodejs
echo "0. Checking nvm version..."

. ~/.nvm/nvm.sh

version=`nvm --version 2>/dev/null`

if [ -z $version ]; then
  echo >&2 "=> Command nvm not found. You should install nvm, visit https://github.com/creationix/nvm"
  exit -1
fi

echo "=>  nvm version: $version"

echo "1. Installing mnvm..."

# exit if mnvm command is available
if has "mnvm"; then
  echo >&2 "=> Command mnvm already exists."
  exit -2
fi

# alias string
SOURCE_STR='alias mnvm="NVM_NODEJS_ORG_MIRROR=http://npm.sankuai.com/mirrors/node NVM_IOJS_ORG_MIRROR=http://npm.sankuai.com/mirrors/iojs nvm"'

# profile path
PROFILE="$HOME/.profile"

# ask user to edit profile by himself if mnvm is already in profile
if command grep -qc 'mnvm' "$PROFILE"; then
  echo '=> Please paste the following content into ".profile" in your home directory, then reload with source "source ~/.profile"'

  echo ""
  echo ""

  echo "$SOURCE_STR"
  exit -3
fi


# insert alias into profile

echo "=> Appending mnvm source string to $PROFILE"

command printf "\n\n${SOURCE_STR}\n\n" >> "$PROFILE"

echo "DONE"

echo ""

echo 'Please reload with source "source ~/.profile"'

echo ""

exit 0
