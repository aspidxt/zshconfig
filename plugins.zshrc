source <(antibody init)
antibody bundle << EOF
    zsh-users/zsh-completions 
    zsh-users/zsh-syntax-highlighting 
    zsh-users/zsh-autosuggestions
    mafredri/zsh-async
EOF

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height=40% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_CTRL_T_COMMAND='$FZF_DEFAULT_COMMAND'
export FZF_DEFAULT_COMMAND='rg --files'


