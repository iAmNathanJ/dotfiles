GREEN='\033[1;32m'
NC='\033[0m'

DOTFILES="$HOME/code/dotfiles"

# Ceate backup directory
mkdir -p $DOTFILES/dotfiles_old

# All dotfiles
dotfiles=(
  ".bashrc"
  ".zshrc"
  ".npmrc"
  ".editorconfig"
  ".gitconfig"
  ".gitmessage"
  ".gitignore_global"
  ".gitmessage"
  ".vim"
  ".vimrc"
)

echo "Linking dotfiles..."
for file in "${dotfiles[@]}"
do

  # TODO ############################
  # IF FILE IS SYMLINK
  # NOTIFY OF EXISTING SYMLINK
  # GO TO NEXT FILE
  ###################################

  # if file exists, back it up
  # [ ! -f ~/$file ] || mv -f $HOME/$file $DOTFILES/dotfiles_old/$file

  # if it's a directory, back it up
  # [ ! -d ~/$file ] || mv -f $HOME/$file $DOTFILES/dotfiles_old/$file

  # create symlink
  ln -sfFv $DOTFILES/$file $HOME/$file
  echo "${GREEN}✓${NC} $file"
  ln -sfFv $PWD/$file $HOME/ $file
done

echo "Existing dotfiles have been backed up in $DOTFILES/dotfiles_old"
