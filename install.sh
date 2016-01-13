# Define all dotfiles
dotfiles=( ".zshrc" ".gitignore_global" )

# Ceate backup directory
mkdir -p ~/dotfiles_old

for i in "${dotfiles[@]}"
do
  # if file exists, back it up
  [ ! -f ~/$i ] || mv -f ~/$i ~/dotfiles_old/$i

  # create symlink
  ln -s $PWD/$i ~/$i
done

##################
# Manual Version
##################

# Backup files
# [ ! -f ~/.zshrc ] || mv -f ~/.zshrc ~/dotfiles_old/.zshrc
# [ ! -f ~/.gitignore_global ] || mv -f ~/.gitignore_global ~/dotfiles_old/.gitignore_global

# Create symlinks
# ln -s ~/dotfiles/.zshrc ~/.zshrc
# ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
