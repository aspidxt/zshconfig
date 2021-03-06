function zle-line-init {
  marking=0
}

function select-char-right {
  if (( $marking != 1 )); then
    marking=1
    zle set-mark-command
  fi
  zle .forward-char
}

function select-char-left {
  if (( $marking != 1 )); then
    marking=1
    zle set-mark-command
  fi
  zle .backward-char
}

function select-word-left {
  if (( $marking !=1 )); then
    marking=1
    zle set-mark-command
  fi
  zle backward-word
  zle .backward-char
}

function select-word-right {
  if (( $marking !=1 )); then
    marking=1
    zle set-mark-command
  fi
  zle .forward-char
  zle forward-word
  zle .backward-char
}

function forward-char {
  if (( $marking == 1 )); then
    marking=0
    NUMERIC=-1 zle set-mark-command
  fi
  zle .forward-char
}

function backward-char {
  if (( $marking == 1 )); then
    marking=0
    NUMERIC=-1 zle set-mark-command
  fi
  zle .backward-char
}

function backward-delete-char {
  if (( $marking == 1 )); then
    zle kill-region
    marking=0
  else
    zle .backward-delete-char
  fi
}

function delete-char {
  if (( $marking == 1 )); then
    zle kill-region
    marking=0
  else
    zle .delete-char
  fi
}

zle -N zle-line-init
zle -N backward-char
zle -N forward-char
zle -N backward-delete-char
zle -N delete-char
zle -N select-char-left
zle -N select-char-right
zle -N select-word-left
zle -N select-word-right

bindkey -- "^[[H"    beginning-of-line
bindkey -- "^[[F"    end-of-line
bindkey -- "^[[1;5D" backward-word
bindkey -- "^[[1;5C" forward-word

bindkey -- "^H"      backward-kill-word
bindkey -- "^[[3;5~" kill-word
bindkey "^[[3~"      delete-char

bindkey "^[[1;2D"    select-char-left
bindkey "^[[1;2C"    select-char-right

bindkey -- "^[[1;6D"  select-word-left
bindkey -- "^[[1;6C"  select-word-right

