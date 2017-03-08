# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Path to dotfiles
export DOTFILES_DIR=~/.dotfiles

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# ZSH auto-update (in days)
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES_DIR/.oh-my-zsh/custom

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/ or ZSH_CUSTOM specified above
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Make and Change Dir
function mkcd() {
  mkdir -p $1 && cd $1
}

# Push Merge
function git-poooosh() {
  git push && git push origin :$1 && git branch -d $1
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

# Clean Desktop
function cdt() {
  mv -iv $HOME/Desktop/*.png ~/.Trash/
}

# Clean Downloads
function cdl() {
  mv -iv $HOME/Downloads/* ~/.Trash/
}

# Aliases
alias gs="git status -s"
alias gpp="git-poooosh"
alias reset="source $HOME/.zshrc"
alias cpath="pwd | pbcopy"
alias hg="history | grep "
alias c="clear"
alias ftk="sudo killall VDCAssistant"
alias rp="rails s -b 0.0.0.0"

source $ZSH/oh-my-zsh.sh
source $HOME/.bashrc

# Environment
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# GPG
if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -n "$INSIDE_EMACS" ]; then
    export TERM=xterm-256color
    # Disable set title
    # prompt_pure_set_title() {}
fi

PATH="$PATH:/usr/local/bin:/~/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin" # Add postgres stuff to PATH
PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH"


# Automatically added by Platform.sh CLI installer
export PATH="/Users/nj/.platformsh/bin:$PATH"
. '/Users/nj/.platformsh/shell-config.rc' 2>/dev/null
