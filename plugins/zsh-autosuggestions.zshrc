ZSH_PLUGIN_URL=https://github.com/zsh-users/zsh-autosuggestions.git
ZSH_PLUGIN_NAME=zsh-autosuggestions

if [ ! -d  $ZSH_PLUGIN_DIR/$ZSH_PLUGIN_NAME ]
then
  cd $ZSH_PLUGIN_DIR || exit
  git clone --single-branch --depth=1 $ZSH_PLUGIN_URL
  rm -rf ./$ZSH_PLUGIN_NAME/.git
  cd - || exit
fi

source $ZSH_PLUGIN_DIR/$ZSH_PLUGIN_NAME/zsh-autosuggestions.zsh || exit 1
