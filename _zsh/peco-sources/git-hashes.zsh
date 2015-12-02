function peco-git-hashes () {
    local selected="$(git log --format="%ai  %h  %an  %d %s" | peco)"
    if [ -n "$selected" ]; then
        local remote="$(git remote -v | grep fetch | awk '{print $2}' | \
            perl -pe 's/ssh:\/\///' | perl -pe 's/:/\//' | perl -pe 's/git@/https:\/\//' | perl -pe 's/\.git$//')"
        local url="${remote}/commit/$(echo $selected | \
            awk 'match($0,/[[:blank:]]{2}[a-z0-9]{7}[[:blank:]]{2}/) { print substr($0, RSTART+2, RLENGTH-2) }')"

        if [ -x "`which pbcopy`" ]; then
            echo "${url}" | pbcopy
            BUFFER="open ${url}"
            CURSOR=$#BUFFER
            zle accept-line
        else
            BUFFER="open ${url}"
            CURSOR=$#BUFFER
        fi
    fi
    zle clear-screen
}
zle -N peco-git-hashes
