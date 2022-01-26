#!/bin/bash

if [ ! "$SPIN" ]; then
  export DOTFILES="$HOME/code/dotfiles"

  echo "***********************************"
  echo "WHY?"
  echo "***********************************"

  $PWD/scripts/prompt-install.sh
  $PWD/scripts/link-dotfiles.sh
  # $PWD/scripts/mac-setup.sh
  # $PWD/scripts/brew-install.sh
  # $PWD/scripts/cask-install.sh
fi

# git config --global user.name iAmNathanJ
