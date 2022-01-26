#!/bin/bash

function baseSetup() {
  $PWD/scripts/prompt-install.sh
  $PWD/scripts/link-dotfiles.sh
}

function personalMachineSetup() {
  $PWD/scripts/mac-setup.sh
  $PWD/scripts/brew-install.sh
  $PWD/scripts/cask-install.sh
}

if [ ! "$SPIN" ]; then
  export DOTFILES="$HOME/code/dotfiles"
  baseSetup()
  personalMachineSetup()
fi
