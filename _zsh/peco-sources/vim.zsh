function ptvim () {
  if [ -x "`which pt`" ]; then
    vim $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
  else
    echo 'no pt'
  fi
}
