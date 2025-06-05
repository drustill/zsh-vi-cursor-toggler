# : ${INSERT_SHAPE:=6}
# : ${NORMAL_SHAPE:=2}
# : ${VISUAL_SHAPE:=2}

# : ${INSERT_COLOR:="#afd700"}
# : ${NORMAL_COLOR:="#ff5f5f"}
# : ${VISUAL_COLOR:="#ffd700"}

# _color_cursor() { printf '\e]12;%s\a' "$1"; }

bindkey -v

KEYTIMEOUT=5

_shape_cursor() { printf '\e[%d q' "$1"; }

function _refresh_cursor {

  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select _refresh_cursor

_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

_cursor_block_preexec() { printf '\e[1 q'; }
preexec_functions+=(_cursor_block_preexec)
