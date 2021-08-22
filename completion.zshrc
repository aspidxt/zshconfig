autoload -Uz compinit && compinit
zmodload zsh/complist

setopt COMPLETEALIASES        # complete alisases

bindkey -M menuselect         '\e'         send-break				# ESC in menu to cancel
bindkey -M menuselect         '/'          history-incremental-search-forward	# / to serch im menu as in man

zstyle ':completion:*'        menu         select		# Enable menu completion for all (change to 'yes select' to start from menu)
zstyle ':completion:*'        special-dirs no
zstyle ':completion:*'        matcher-list 'm:{a-z}={A-Z}'      # Ignore CASE
zstyle ':completion:*:make:*' tag-order    targets		# Makefile completion

# Python PIP completion
function _pip_completion {   # generated using `pip completion --zsh`
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

