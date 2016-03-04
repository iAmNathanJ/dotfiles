# Define all dotfiles
dotfiles=( ".bashrc" ".zshrc" ".editorconfig" ".jshintrc" ".atom" ".gitconfig" ".gitignore_global" ".vim" ".vimrc")

# Ceate backup directory
echo "Creating backup directory..."
mkdir -p ~/dotfiles_old

# Loop through dotfiles and...
echo "Creating symlinks..."
for file in "${dotfiles[@]}"
do
  # if file exists, back it up
  [ ! -f ~/$file ] || mv -f ~/$file ~/dotfiles_old/$file

  # if it's a directory, back it up
  [ ! -d ~/$file ] || mv -f ~/$file ~/dotfiles_old/$file

  # create symlink
  ln -s $PWD/$file ~/$file
done

echo "Existing dotfiles have been backed up in ~/dotfiles_old"
