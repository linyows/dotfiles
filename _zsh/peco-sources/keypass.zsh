function peco-keypass() {
    if [ -e ~/.dotfiles/_config/keypass ]; then
        local selected="$(sed -e 's/\(.*\), \(.*\), \(.*\)$/\1, \2/g' ~/.dotfiles/_config/keypass | \
            peco --query "$LBUFFER")"
        local -a array
        local line

        if [ -n "$selected" ]; then
            selected="$(grep "^$selected" ~/.dotfiles/_config/keypass)"
            if [ -x "`which pbcopy`" ]; then
                array=("${(s/, /)selected}")

                if [ ${#array[*]} -gt 1 ]; then
                    local host="$array[1]"
                    local user="$array[2]"
                    local password="$array[3]"

                    echo "${password}" | pbcopy

                    local mysql_user=`echo ${(s/mysql-/)user}`

                    if [ $user = $mysql_user ]; then
                        line="ssh ${user}@${host}"
                    else
                        line="mysql -u${mysql_user} -h${host} -p "
                    fi
                fi
            fi

            if ! [ -n "$line" ]; then
                line="$selected"
            fi
            BUFFER="${line}"
            CURSOR=$#BUFFER
        fi

        zle clear-screen
    fi
}
zle -N peco-keypass
