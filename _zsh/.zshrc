# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="../../themes/linyows"

# good
# ZSH_THEME="cloud"
# ZSH_THEME="josh"
# ZSH_THEME="af-magic"

# soso
# ZSH_THEME="robbyrussell"
# ZSH_THEME="daveverwer"
# ZSH_THEME="fletcherm"
# ZSH_THEME="gallifrey"
# ZSH_THEME="jnrowe"
# ZSH_THEME="norm"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby gem brew rails3 node npm git-flow vi-mode vagrant osx fabric deb compleat rbenv pow powder cap pip python cpanm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#------------------------------------------------------------------------------------------------------------------------------

# Complement {{{
    typeset -U fpath
    fpath=($fpath ~/.zsh/func)

    autoload -U compinit
    compinit -u

    # 履歴による予測入力 (man zshcontrib)
    autoload -U predict-on

    # 補完候補を ←↓↑→ で選択 (補完候補が色分け表示される)
    zstyle ':completion:*:default' menu select=1
    # 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    # カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補
    zstyle ':completion:*:cd:*' tag-order local-directories path-directories
    zstyle ':completion:*' list-colors 'di=;00;38;05;44' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=00;38;05;44' 'cd=00;38;05;44'
    zstyle ':completion:*' format '%B%d%b'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' use-cache true # 補完候補をキャッシュ
    zstyle ':completion:*' verbose yes # 詳細な情報
    # zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH" # sudo時にはsudo用のパス使用

    # historical backward/forward search with linehead string binded to ^P/^N
    autoload history-search-end
    zle -N history-beginning-search-backward-end history-search-end
    zle -N history-beginning-search-forward-end history-search-end
    bindkey "^p" history-beginning-search-backward-end
    bindkey "^n" history-beginning-search-forward-end
    bindkey "\\ep" history-beginning-search-backward-end
    bindkey "\\en" history-beginning-search-forward-end

    # glob (*) での履歴のインクリメンタル検索
    bindkey '^R' history-incremental-pattern-search-backward
    bindkey '^S' history-incremental-pattern-search-forward

    # vcs_info
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }

    # Autoload zsh modules when they are referenced {{{
    zmodload -a zsh/stat stat
    zmodload -a zsh/zpty zpty
    zmodload -a zsh/zprof zprof
    zmodload -ap zsh/mapfile mapfile
# }}}

# Setup options {{{
    setopt APPEND_HISTORY         # .zsh-history を上書きではなく追加
    setopt AUTO_CD                # ディレクトリ名だけを入力した時にそこに cd する
    setopt AUTO_LIST              # 候補が複数ある時に自動的に一覧を出す
    setopt AUTO_MENU              # TAB で順に補完候補を切り替える
    setopt AUTO_PARAM_SLASH       # 変数名補完時に、その値がディレクトリ名なら直後にスラッシュも補う
    setopt AUTO_PARAM_KEYS        # カッコの対応などを自動的に補完
    setopt AUTO_RESUME            # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
    setopt CHECK_JOBS             # シェルを抜ける (exit) 時に、zsh: you have runnning jobs と警告を出す
    setopt CORRECT                # コマンドのスペルチェック,自動修正
    setopt CORRECT_ALL            # 対象のファイルもスペルチェックをする
    setopt EXTENDED_GLOB          # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
    setopt EXTENDED_HISTORY       # zsh の開始, 終了時刻をヒストリファイルに書き込む
    setopt GLOB_DOTS              # . で開始するファイル名にマッチさせるとき、先頭に明示的に . を指定する必要がなくなる。
    setopt HASH_CMDS              # 各コマンドが実行されるときにパスをハッシュに入れる
    setopt HIST_EXPIRE_DUPS_FIRST # ヒストリリストに追加されるコマンド行が古いものと同じなら古いものを削除する
    setopt HIST_NO_STORE          # history コマンドを history に保存しない
    setopt HIST_IGNORE_DUPS       # 直前と同じコマンドをヒストリに追加しない
    setopt HIST_REDUCE_BLANKS     # 余分な空白は詰めて記録
    setopt HIST_SAVE_NO_DUPS      # ヒストリファイルに書き出すときに、古いコマンドと同じものは無視する
    setopt INC_APPEND_HISTORY     # 履歴をインクリメンタルに追加
    setopt LIST_TYPES             # 補完候補一覧でファイルの種別をマーク表示
    setopt MARK_DIRS              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
    setopt NUMERIC_GLOB_SORT      # 数字を数値と解釈してソートする
    setopt NOBEEP                 # ビープを鳴らさない
    setopt NO_FLOW_CONTROL        # disable C-q, C-s
    setopt PROMPT_SUBST           # PROMPT 変数に対して変数展開、コマンド置換、算術展開を施す
    setopt RM_STAR_WAIT           # rm * を実行する前に確認
    setopt SHARE_HISTORY          # 履歴の共有
    setopt AUTOPUSHD              # cd 時に自動で push
    setopt PUSHD_IGNORE_DUPS      # 同じディレクトリを pushd しない

    setopt AUTO_PUSHD
    setopt LIST_PACKED            # 補完候補を詰めて表示
    setopt NOLISTBEEP             # 補完表示時にビープ音を鳴らさない
    #setopt COMPLETE_ALIASES       # エイリアスを設定したコマンドでも補完機能を使えるようにする -> zの補完が効かなくなるので comment out
    setopt TRANSIENT_RPROMPT      # コピペしやすいようにコマンド実行後は右プロンプトを消す。
    setopt COMPLETE_IN_WORD       # カーソル位置で補完する。
    setopt GLOB_COMPLETE          # globを展開しないで候補の一覧から補完する。
    setopt HIST_EXPAND            # 補完時にヒストリを自動的に展開する。
    setopt NO_BEEP                # 補完候補がないときなどにビープ音を鳴らさない。
    setopt BRACE_CCL              # {a-c} を a b c に展開する機能を使えるようにする

    #setopt EQUALS                # =command を command のパス名に展開する
    #setopt HIST_VERIFY           # ヒストリを呼び出してから実行する間に一旦編集
    #setopt LIST_ROWS_FIRST       # 補完リストを水平にソートする
    #setopt LONG_LIST_JOBS        # 内部コマンド jobs の出力をデフォルトで jobs -l にする
    #setopt MAGIC_EQUAL_SUBST     # --prefix=/usr などの = 以降も補完
    #setopt PRINT_EIGHT_BIT       # 出力時8ビットを通す

    #unsetopt PROMPTCR            # 出力の文字列末尾に改行コードが無い場合でも表示
# }}}

# Setup vars {{{
    export LANG=ja_JP.UTF-8
    export LC_CTYPE="ja_JP.UTF-8"
    export TERM=xterm-256color
    export EDITOR=vim

    HISTFILE=$HOME/.zsh-history
    HISTSIZE=100000
    SAVEHIST=100000
    # Use dircolors where available
    export LS_COLORS='no=00:di=00;38;05;44:ln=01;35:pi=33:so=01;32:bd=00;38;05;44:cd=00;38;05;44:ex=01;32:*.c=36:*.cc=36:*.h=33:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.app=01;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.sit=00;31:*.sitX=00;31:*.zip=00;31:*.bin=00;31:*.hqx=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.pdf=00;35:*.avi=00;35:*.mov=00;35:*.mpg=00;35:*.mpeg=00;35:*.asf=00;35:*.wmv=00;35:*.rm=00;35:*.swf=00;35:*.mp3=00;35:*.aiff=00;35:*.aif=00;35:*.snd=00;35:*.wav=00;35:';
    export ZLS_COLORS=$LS_COLORS
# }}}

# Colours {{{
    local HOSTNAME_COLOR=$'%{\e[38;5;190m%}'
    local USERNAME_COLOR=$'%{\e[38;5;199m%}'
    local PATH_COLOR=$'%{\e[38;5;61m%}'
    local RVM_COLOR=$'%{\e[38;5;31m%}'
    local VCS_COLOR=$'%{\e[38;5;248m%}'
# }}}

# Prompt {{{
    # colors#  → 色指定  $fg[色名]/$bg[色名]/$reset_color (${, $} で囲む必要がある)
    # 30黒 31赤 32緑 33黄 34青 35紫 36水 37白
    # http://coderepos.org/share/export/9486/dotfiles/zsh/mobcov/.zsh/.zshrc
    autoload colors
    colors
# }}}

# Plugins {{{
    # z
    #_Z_CMD=j
    source $HOME/.zsh/plugin/z/z.sh
    precmd() {
      _z --add "$(pwd -P)"
    }

    # cdd を追加
    #source $HOME/.zsh/plugin/cdd

    # incriment search
    source $HOME/.zsh/plugin/incr*.zsh

    # Incriment
    # https://github.com/hchbaw/auto-fu.zsh
    #if [ -f ~/.zsh/plugin/auto-fu/auto-fu.zsh ]; then
        #source ~/.zsh/plugin/auto-fu/auto-fu.zsh
        #zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _list _history
        #zstyle ':auto-fu:var' postdisplay ''
        #zle-line-init () {auto-fu-init;}; zle -N zle-line-init
    #fi
# }}}

# Etc {{
    # 実行したプロセスの消費時間が3秒以上かかったら消費時間の統計情報を表示
    REPORTTIME=3
    chpwd_functions=($chpwd_functions dirs) # ディレクトリが変わったらディレクトリスタックを表示
    WORDCHARS=${WORDCHARS:s,/,,} # 「/」も単語区切りとみなす
# }}}

# .zsh_aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Functions {{{
    # cd and ls
    function cd () {
        builtin cd $1
        ls -CF
    }

    # find out what's new in a directory:
    function lsn() {
        ls -lt ${1+"$@"} | head -20;
    }

    # http://subtech.g.hatena.ne.jp/secondlife/20080604/1212562182
    function cdf () {
        local -a tmpparent; tmpparent=""
        local -a filename; filename="${1}"
        local -a file
        local -a num; num=0
        while [ $num -le 10 ]; do
            tmpparent="${tmpparent}../"
            file="${tmpparent}${filename}"
            if [ -f "${file}" ] || [ -d "${file}" ]; then
                cd ${tmpparent}
                break
            fi
            num=$(($num + 1))
        done
    }

    # it's a function to draw mandelbrot fractal
    function most_useless_use_of_zsh {
       local lines columns colour a b p q i pnew
       ((columns=COLUMNS-1, lines=LINES-1, colour=0))
       for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
           for ((a=-2.0; a<=1; a+=3.0/columns)) do
               for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
                   ((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
               done
               ((colour=(i/4)%8))
                echo -n "\\e[4${colour}m "
            done
            echo
        done
    }

    # 256色を確かめる
    function pcolor() {
        for ((f = 0; f < 255; f++)); do
            printf "\e[38;5;%dm %3d#\e[m" $f $f
            if [[ $f%8 -eq 7 ]] then
                printf "\n"
            fi
        done
        echo
    }

    # show rvm prompt like "1.9.2@gemset_name"
    function rvm_prompt {
        result=`rvm-prompt v g 2> /dev/null`
        if [ "$result" ] ; then
            echo "[$result]"
        fi
    }

    # sshしたら新規ウインドウでタブ名を接続名にする
    function ssh_tmux() {
        eval server=\${$#}
        eval tmux new-window -n "'${server}'" "'ssh $@'"
    }

    # insert clipboad (not tmux)
    function myip() {
        if [ $SHLVL = 1 ]; then
            ifconfig en1 | grep netmask | awk '{ print $2 }' | pbcopy && pbpaste
        else
            ifconfig en1 | grep netmask | awk '{ print $2 }'
        fi
    }

    # cache for rake routes
    function routes_cache {
        local routes_cache; routes_cache="./tmp/routes_cache"
        if [ "$1" = "--force" ]; then
            rm $routes_cache;
        fi
        if ! [ -e $routes_cache ]; then
            bundle exec rake routes > $routes_cache
        fi
        cat $routes_cache
    }

    function generate_and_commit() {
        if [ $# -eq 0 ]; then
            echo 'woops... no argument'
        else
            bundle exec rails generate controller $@ && git add -A && git commit -m "Generate with: $ $(fc -ln -1)"
        fi
    }

    function find_swp() {
        find . -name "*.swp*" -print
    }

    # http://d.hatena.ne.jp/kitokitoki/20120324/p1
    function rlog() {
      it=$(git rev-parse --show-cdup 2>/dev/null)log/development.log &&
      less -NRij10 +F $it
    }

    # https://github.com/ivolo/animals
    function hey() {
        aa="$(curl -s animals.ivolo.me)"
        if [ aa != "" ]; then
            echo
            echo -n "\\033[1;30m"
            echo $aa
            echo -n "\\033[0;39m"
        fi
    }
# }}}
