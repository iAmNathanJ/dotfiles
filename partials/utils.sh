function src() {
  [[ -f $1 ]] && . $1
}

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

function diff() {
  git diff -- "$@" ':(exclude)package-lock.json'
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

alias reset="source $HOME/.zshrc"
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
alias sc="systemctl"
alias jc="journalctl"
