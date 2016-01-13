
# files = ( "~/test" "~/test2" )



# Backup originals
mkdir -p ~/dotfiles_old
[ ! -f ~/.zshrc ] || mv -f ~/.zshrc ~/dotfiles_old/.zshrc
[ ! -f ~/.gitignore_global ] || mv -f ~/.gitignore_global ~/dotfiles_old/.gitignore_global

# Create symlinks
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
