PATH="$PATH:$HOME/.bin"
PATH="$PATH:$HOME/.deno/bin" # `deno install` modules
export PATH="$PATH"
export EDITOR=code

autoload -U compaudit compinit
compinit

# node/npm bash completion
# autoload -Uz bashcompinit && bashcompinit -i
# autoload bashcompinit
# bashcompinit
# . <(node --completion-bash)
# . <(npm completion)

# completions
# autoload -Uz compinit && compinit


if [ "$SPIN" ]; then
  export DOTFILES="$HOME/dotfiles"
  . $DOTFILES/partials/utils.sh
  . $DOTFILES/partials/directories.sh
else
  export DOTFILES="$HOME/code/dotfiles"
  git config user.email nj@nj.codes
  git config commit.gpgsign true
  . $DOTFILES/partials/utils.sh
  . $DOTFILES/partials/directories.sh
  . $DOTFILES/partials/local.sh
fi
