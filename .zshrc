export DOTFILES="$HOME/code/dotfiles"

if [ "$SPIN" ]; then
  export DOTFILES="$HOME/dotfiles"
fi

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

. $DOTFILES/partials/utils.sh
. $DOTFILES/partials/directories.sh

if [ ! "$SPIN" ]; then
  . $DOTFILES/partials/local.sh
else
  echo "skipping local settings"
fi
