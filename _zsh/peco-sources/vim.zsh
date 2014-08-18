function ptvim () {
  if [ -x "`which pt`" ]; then
    vim $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
  else
    echo 'no pt'
  fi
}

function peco-open-by-vim () {
    find . | peco | xargs sh -c 'vim "$0" < /dev/tty'
    zle clear-screen
}
zle -N peco-open-by-vim
