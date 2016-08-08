GREEN='\033[1;32m'
NC='\033[0m'

# export dotfiles dir
export DOTFILES_DIR=$PWD

# Ceate backup directory
echo "Creating backup directory..."
mkdir -p $DOTFILES_DIR/dotfiles_old

# All dotfiles
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

# Loop through dotfiles and...
echo "Creating symlinks..."
for file in "${dotfiles[@]}"
do

  # TODO ############################
  # IF FILE IS SYMLINK
  # NOTIFY OF EXISTING SYMLINK
  # GO TO NEXT FILE
  ###################################
    
  # if file exists, back it up
  # [ ! -f ~/$file ] || mv -f $HOME/$file $DOTFILES_DIR/dotfiles_old/$file

  # if it's a directory, back it up
  # [ ! -d ~/$file ] || mv -f $HOME/$file $DOTFILES_DIR/dotfiles_old/$file

  # create symlink
  echo "${GREEN}✓${NC} $file"
  # ln -sfFv $PWD/$file $HOME/$file
done

echo "Existing dotfiles have been backed up in $DOTFILES_DIR/dotfiles_old"
