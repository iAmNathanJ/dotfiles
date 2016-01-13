
# Backup originals
mkdir -p ~/dotfiles_old
mv -f ~/.zshrc ~/dotfiles_old/.zshrc
mv -f ~/.gitignore_global ~/dotfiles_old/.gitignore_global

# Create symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitignore ~/.gitignore
