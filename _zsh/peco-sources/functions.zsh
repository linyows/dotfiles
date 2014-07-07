function peco-functions () {
    local selected=$(functions | grep "^.*\ ()\ {" | sed -e "s| () {||" | grep peco- | grep -v function-list | peco --query "$LBUFFER")
    if [ -n "$selected" ]; then
        ${selected}
    fi
}
zle -N peco-functions
