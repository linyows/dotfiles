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
    find . -name "*.swp*" -print | grep .swp
}

function delete_swp() {
    find . -name "*.swp*" -print0 | xargs -0 rm
}

function find_un() {
    find . -name "*.un*" -print | grep .un
}

function delete_un() {
    find . -name "*.un*" -print0 | xargs -0 rm
}

function find_conflicted() {
    find . -name "*.orig*" -print | grep .orig
}

function delete_conflicted() {
    find . -name "*.orig*" -print0 | xargs -0 rm
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

# http://d.hatena.ne.jp/itchyny/20130227/1361933011
function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

if [ `uname` = "Darwin" ]; then
  alias google-chrome='open -a Google\ Chrome'
fi
alias chrome='google-chrome'
alias -s html=chrome

function man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

function checkout_all_branch() {
    for branch in `git branch -r | grep -v HEAD | awk '{sub("origin/","")}{print $1}'`
    do
        git checkout $branch; git pull
    done
}

function flush_dnscache() {
    sudo killall -HUP mDNSResponder
}

function refresh_dhcp() {
    sudo networksetup -setdhcp 'Wi-Fi'
    sleep 5

    while ! ping -c 1 ghe.tokyo.pb; do
      flush_dnscache
      sleep 3
    done
}
