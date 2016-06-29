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
mkdir -p $HOME/code/dotfiles_old

# Loop through dotfiles and...
echo "Creating symlinks..."
for file in "${dotfiles[@]}"
do

  # CHECK IF FILE IS SYMLINK
  # GO TO NEXT FILE IF SYMLINK

  # if file exists, back it up
  [ ! -f ~/$file ] || mv -f $HOME/$file $HOME/code/dotfiles_old/$file

  # if it's a directory, back it up
  [ ! -d ~/$file ] || mv -f $HOME/$file $HOME/code/dotfiles_old/$file

  # create symlink
  ln -sfFv $PWD/$file $HOME/$file
done

echo "Existing dotfiles have been backed up in ~/code/dotfiles_old"
