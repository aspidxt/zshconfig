
# ================================= History ====================================
HISTFILE=~/zshconfig/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_all_dups     # no duplicate
setopt hist_reduce_blanks       # trim blanks
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_verify              # show before executing history commands
# setopt share_history          # share hist between sessions


# =============================== Line Editor ==================================
autoload -Uz promptinit && promptinit
autoload -Uz colors     && colors

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

ROOT_PROMPT="%F{red}%n%f@%m# "
USER_PROMPT="%F{cyan}%n%f@%m~ "
#export  PROMPT="%(!.$SU_PROMPT.$USER_PROMPT)"
export  PROMPT=$USER_PROMPT
export RPROMPT='%F{cyan}%~%f'

source ~/zshconfig/keys.zshrc
source ~/zshconfig/completion.zshrc

# ================================= Plugins ====================================
export ZSH_PLUGIN_DIR=~/zshconfig/plugins

source ~/zshconfig/plugins/gitclone_ssh.sh
source ~/zshconfig/plugins/zsh-async.zshrc
source ~/zshconfig/plugins/zsh-autosuggestions.zshrc
source ~/zshconfig/plugins/zsh-syntax-highlighting.zshrc  # Should be last in this list


#source ~/zshconfig/plugins/zsh-antigen.zshrc
#ANTIGEN_PLUGINS="
#antigen bundle mafredri/zsh-async
#antigen bundle zsh-users/zsh-completions
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle pip
#antigen apply
#"
#if command -v antigen ; then
#  echo $ANTIGEN_PLUGINS > ~/zshconfig/.antigenrc
#  antigen init ~/zshconfig/.antigenrc
#fi

