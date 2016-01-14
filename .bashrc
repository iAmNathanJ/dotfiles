# Functions
mkcd() {
  mkdir $1 && cd $1
}

gca() {
  git add .
  git commit -m $1
}

# Aliases
alias reset="source ~/.zshrc"
alias cpath="pwd | pbcopy"
alias hg="history | grep "
