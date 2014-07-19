function peco-git-hashes () {
    local selected_hash=$(git log --format="%ai  %an  %h  %d %s" | peco)
    if [ -n "$selected_hash" ]; then
        BUFFER="$(echo $selected_hash | \
            awk 'match($0,/[[:blank:]]{2}[a-z0-9]{7}[[:blank:]]{2}/)
            { print substr($0, RSTART, RLENGTH) }')"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-hashes
