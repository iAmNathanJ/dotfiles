# Define all dotfiles
dotfiles=( ".bashrc" ".zshrc" ".gitconfig" ".gitignore_global" )

# Ceate backup directory
echo "Creating backup directory..."
mkdir -p ~/dotfiles_old

# Loop through dotfiles and...
echo "Creating symlinks..."
for file in "${dotfiles[@]}"
do
  # if file exists, back it up
  [ ! -f ~/$file ] || mv -f ~/$file ~/dotfiles_old/$file
  # create symlink
  ln -s $PWD/$file ~/$file
done

echo "Existing dotfiles have been backed up in ~/dotfiles_old"

##################
# Manual Version
##################

# Backup files
# [ ! -f ~/.zshrc ] || mv -f ~/.zshrc ~/dotfiles_old/.zshrc
# [ ! -f ~/.gitignore_global ] || mv -f ~/.gitignore_global ~/dotfiles_old/.gitignore_global

# Create symlinks
# ln -s $PWD/.zshrc ~/.zshrc
# ln -s $PWD/.gitignore_global ~/.gitignore_global
