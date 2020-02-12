#!/bin/bash

# iTerm で実行されたコマンドかチェック
is_iterm(){
    return $(cat<<-EOC|/usr/bin/osascript
    tell application "System Events"
        set front_app to name of (path to frontmost application)
        if front_app is "iTerm.app" then
            return 0
        else
            return 1
        end if
    end tell
	EOC)
}

# 環境変数から引数(ホスト名)に対応するバックグランドカラーを取得
env_iterm_bgcolor(){

    local ENV_PREFIX="ITERM_BGCOLOR_"
    local host=$1

    while read color regx
    do
        if [[ $host =~ $regx ]] ; then
            [[ "$color" =~ {[0-9,\ ]+} ]] && { echo $color ; return 0 ; }
        fi
    done < <(env|grep "^$ENV_PREFIX"|sed -e 's/^[^=]*=//' -e 's/\\/\\\\/g')

    return 1
}

# iTerm のカレントセッションID を取得
get_iterm_sessionid(){
    cat<<-EOC|/usr/bin/osascript
    tell application "iTerm"
      return id of current session of current terminal
    end tell
	EOC
}

# iTerm のバックグラウンドカラー変更処理
change_iterm_bgcolor(){

    [[ "$1" =~ ^/dev/ttys[0-9]{3} ]] || return 1
    [[ "$2" =~ {[0-9,\ ]+}        ]] || return 1

    cat<<-EOC|/usr/bin/osascript
    tell application "iTerm"
      repeat with term in terminals
        repeat with sess in sessions of term
          if id of sess is "$1" then
            set prev_color to background color of sess
            set background color of sess to $2
            return prev_color
          end if
        end repeat
      end repeat
    end tell
	EOC
}
