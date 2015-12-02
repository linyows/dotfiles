function peco-git-hashes () {
    local selected="$(git log --format="%ai  %an  %h  %d %s" | peco)"
    if [ -n "$selected" ]; then
        local remote="$(git remote -v | grep fetch | awk '{print $2}' | perl -pe 's/:/\//' | perl -pe 's/git@/https:\/\//' | perl -pe 's/\.git$//')"
        local url="${remote}/commit/$(echo $selected | awk '{print $5}')"
        if [ -x "`which pbcopy`" ]; then
            echo "${url}" | pbcopy
        else
            BUFFER="open ${url})"
            CURSOR=$#BUFFER
        fi
    fi
    zle clear-screen
}
zle -N peco-git-hashes
