# Define all dotfiles
dotfiles=(
  ".bashrc"
  ".zshrc"
  ".editorconfig"
  ".jshintrc"
  ".gitconfig"
  ".gitignore_global"
  ".vim"
  ".vimrc"
  ".oh-my-zsh/themes/nj.zsh-theme"
  )

# Ceate backup directory
echo "Creating backup directory..."
mkdir -p ~/code/dotfiles_old

# Loop through dotfiles and...
echo "Creating symlinks..."
for file in "${dotfiles[@]}"
do
  # if file exists, back it up
  [ ! -f ~/$file ] || mv -f ~/$file ~/code/dotfiles_old/$file

  # if it's a directory, back it up
  [ ! -d ~/$file ] || mv -f ~/$file ~/code/dotfiles_old/$file

  # create symlink
  ln -sfFv $(pwd)/$file ~/$file
done

echo "Existing dotfiles have been backed up in ~/code/dotfiles_old"
