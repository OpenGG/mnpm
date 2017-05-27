#!/usr/bin/env bash

# check if command is available
has() {
  type "$1" > /dev/null 2>&1
}

# check nodejs
echo "0. Checking node version..."

version=`node --version 2>/dev/null`

if ! [ $version ]; then
  echo >&2 "=> Command node not found. You should install Node.js, visit https://github.com/creationix/nvm"
  exit -1
fi

echo "=>  node version: $version"

# check yarn
echo "1. Checking yarn version..."

version=`yarn --version 2>/dev/null`

if ! [ $version ]; then
  echo >&2 "=> Command yarn not found. You should install yarn, visit https://yarnpkg.com/lang/en/docs/install/"
  exit -4
fi

echo "=>  yarn version: $version"

echo ""
echo ""

echo "2. Installing myarn..."

# exit if myarn command is available
if has "myarn"; then
  echo >&2 "=> Command myarn already exists."
  exit -2
fi

echo "=> init .myarnrc file"

# myarnrc string
RC_STR="
registry=http://r.npm.sankuai.com
cache=$HOME/.cache/myarn
disturl=http://npm.sankuai.com/dist/node
"

RC="$HOME/.myarnrc"

# init .myarnrc file
echo "$RC_STR" > "$RC"

# alias string
SOURCE_STR='alias myarn="YARN_CACHE_FOLDER=$HOME/.cache/myarn-cache NPM_CONFIG_USERCONFIG=$HOME/.myarnrc yarn"'

# profile file
PROFILE="$HOME/.profile"

# ask user to edit profile by himself if myarn is already in profile
if command grep -qc 'myarn' "$PROFILE"; then
  echo '=> Please paste the following content into ".profile" in your home directory, then reload with source "source ~/.profile"'

  echo ""
  echo ""

  echo "$SOURCE_STR"

  exit -3
fi

# insert myarn alias into profile

echo "=> Appending myarn source string to $PROFILE"

command printf "\n\n${SOURCE_STR}\n\n" >> "$PROFILE"

echo "DONE"

echo ""

echo 'Please reload with source "source ~/.profile"'
