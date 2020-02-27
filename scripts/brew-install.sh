# Get Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew Packages
brew install wget
brew install zsh
brew install zsh-completions

brew install gpg
brew install gnupg
brew install gpg-agent
brew install pinentry-mac

brew install postgres
brew install mysql

brew install imagemagick

brew install git-secrets

# Get Oh My Zsh
# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Get RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --autolibs=enabled --ruby --rails

# Get NVM
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
