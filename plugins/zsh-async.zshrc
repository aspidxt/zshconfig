ZSH_PLUGIN_URL=https://github.com/mafredri/zsh-async.git
ZSH_PLUGIN_NAME=zsh-async

if [ ! -d  $ZSH_PLUGIN_DIR/$ZSH_PLUGIN_NAME ]
then
  cd $ZSH_PLUGIN_DIR || exit
  git clone --single-branch --depth=1 $ZSH_PLUGIN_URL
  rm -rf ./$ZSH_PLUGIN_NAME/.git
  cd - || exit
fi

source $ZSH_PLUGIN_DIR/$ZSH_PLUGIN_NAME/async.zsh || exit 1
autoload -Uz async && async
