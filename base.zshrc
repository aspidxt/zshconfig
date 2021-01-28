# History
HISTFILE=~/.myshell/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt hist_ignore_all_dups     # no duplicate
setopt hist_reduce_blanks       # trim blanks
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_verify              # show before executing history commands
# setopt share_history          # share hist between sessions

# Line editor
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


