#!/bin/bash

if [ "$SPIN" ]; then
  export DOTFILES="$HOME/dotfiles"
  $PWD/scripts/prompt-install.sh
  $PWD/scripts/link-dotfiles.sh
else
  export DOTFILES="$HOME/code/dotfiles"
  $PWD/scripts/mac-setup.sh
  $PWD/scripts/brew-install.sh
  $PWD/scripts/cask-install.sh
  $PWD/scripts/prompt-install.sh
  $PWD/scripts/link-dotfiles.sh
fi
