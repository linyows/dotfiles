function peco-snippets() {
    if [ -e ~/.dotfiles/_config/snipets ]; then
        local selected="$(grep -v "^#" ~/.dotfiles/_config/snipets | peco --query "$LBUFFER")"
        if [ -n "$selected" ]; then
            if [ -x "`which pbcopy`" ]; then
                echo "${selected}" | pbcopy
            else
                BUFFER="${selected}"
                CURSOR=$#BUFFER
            fi
        fi
        zle clear-screen
    fi
}
zle -N peco-snippets
