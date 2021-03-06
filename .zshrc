# Environment
export DOTFILES="$HOME/code/dotfiles"
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

PATH="$PATH:/usr/local/bin:/~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
PATH="$PATH:/etc/sonar/bin/macosx-universal-64"
PATH="$PATH:/etc/sonar-scanner/bin"
PATH="$PATH:$HOME/.composer/vendor/bin"
PATH="$PATH:$HOME/.bin"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.deno/bin" # `deno install` modules
export PATH="$PATH"

export EDITOR=code

autoload -U compaudit compinit
compinit

# Load pure prompt
autoload -U promptinit && promptinit
prompt pure

autoload $DOTFILES/zsh_completion.d/deno.zsh

# Make and Change Dir
function mkcd() {
  mkdir -p $1 && cd $1
}

# Merge, push, and cleanup
function git-merge-push-clean() {
  git merge $1 && git push && git push origin :$1 && git branch -d $1
}

# Stash with untracked and message
function stash() {
  git stash save -u $1
}

# Cherry Pick
function gcp() {
  git cherry-pick $1
}

# Get my IP
function ip() {
  IP=$(ifconfig | grep 'inet 1' | cut -c 6- | awk 'NR==2 {print $1}')
  echo $IP | pbcopy
  echo $IP
}

# Temp Directory
function tmp() {
  pushd .
  WRECKDIR=`mktemp -d /tmp/huzzah.XXXXXXXXX` && {
    cd $WRECKDIR
  }
}

# Clean Desktop Images
function cdt() {
  mv -iv $HOME/Desktop/*.jpg ~/.Trash/
  mv -iv $HOME/Desktop/*.gif ~/.Trash/
  mv -iv $HOME/Desktop/*.png ~/.Trash/
}

# Clean Downloads
function cdl() {
  mv -iv $HOME/Downloads/* ~/.Trash/
}

function diff() {
  git diff -- "$@" ':(exclude)package-lock.json'
}

# Aliases
alias dotfiles="code ~/code/dotfiles"
alias reset="source $HOME/.zshrc"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --disable-gpu --remote-debugging-port=9222"
alias gp="git push -u origin HEAD"
alias gpf="git pushf origin HEAD"
alias gmp="git-poooosh"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gs="git status -s"
alias gl="git log --pretty=format:'%C(cyan)%C(bold)%h%C(reset) %<(60,trunc)%s %<(14)%C(magenta)%ad  %C(magenta)%C(bold)-%C(reset)  %C(blue)%cn%C(reset)'"
alias fu="git rebase -i HEAD~2"
alias cb="git branch | fzf --header Checkout | xargs git checkout"
alias dr="docker run --rm"
alias de="docker exec -it"
alias dcr="docker-compose run --rm"
alias cpath="pwd | pbcopy"
alias hg="history | grep "
alias c="clear"
alias ftk="sudo killall VDCAssistant"
alias fresh="rm .npmrc package-lock.json && rm -rf node_modules && npm i --force --registry=https://registry.npmjs.org/"
alias deno-local="~/code/deno/target/debug/deno"

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# node/npm bash completion
# autoload -Uz bashcompinit && bashcompinit -i
# autoload bashcompinit
# bashcompinit
# . <(node --completion-bash)
# . <(npm completion)

# completions
# autoload -Uz compinit && compinit

. $DOTFILES/partials/utils.sh

src $DOTFILES/partials/bindings.sh
src $DOTFILES/partials/directories.sh
src $DOTFILES/partials/auto-secrets.sh
src $HOME/.bashrc
src $HOME/.personal
src $HOME/.secrets

cd ~/code
