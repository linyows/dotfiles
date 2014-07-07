function peco-cd () {
    local proj_root=$(find-proj-root)
    local gitignore="${proj_root}/.gitignore"

    if [ -z "$proj_root" ]; then
        echo -e "\nproject root path was not found." 1>&2
        zle accept-line
        return
    fi

    ignore_opt_str='-name .git'
    if [ -f "$gitignore" ]; then
        ignore_opt_str+=$(egrep -v -e '^#' -e '^ *$' "$gitignore" | perl -npe "s/^/ -o -name '/; s/\n/'/")
    fi

    local selected_dir=$(
        cd "$proj_root" &&
        echo "find . \( $ignore_opt_str \) -prune -o -maxdepth 10 -type d -print" |
          sh | peco --query "$LBUFFER"
    )

    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${proj_root}/${selected_dir#./}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cd
