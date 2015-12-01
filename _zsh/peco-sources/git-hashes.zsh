function peco-git-hashes () {
    local selected="$(git log --format="%ai  %an  %h  %d %s" | peco | perl -pe 's/\n//g')"
    if [ -n "$selected" ]; then
        local remote="$(git remote -v | grep fetch | awk '{print $2}' | perl -pe 's/:/\//' | perl -pe 's/git@/https:\/\//' | perl -pe 's/\.git$//')"
        BUFFER="open ${remote}/commit/$(echo $selected | awk '{print $5}')"
        CURSOR=$#BUFFER
    fi
    zle clear-screen
}
zle -N peco-git-hashes
