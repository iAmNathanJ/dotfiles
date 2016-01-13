
# Backup originals
mkdir ~/dotfiles_old
mv ~/.zshrc ~/dotfiles_old/.zshrc
mv ~/.gitignore ~/dotfiles_old/.gitignore

# Create symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitignore ~/.gitignore
