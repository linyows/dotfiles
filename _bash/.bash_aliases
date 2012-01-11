# vim
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
    export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
else
    export EDITOR='vim'
fi
alias vi='vim -u NONE'

# ctags
if [ -f /Applications/MacVim.app/Contents/MacOS/ctags ]; then
    alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
fi

# screen
alias sc='screen'
alias scexit='screen -r -X quit'

# git
if [ -f /usr/local/bin/git ]; then
    alias git='/usr/local/bin/git'
fi

# ruby
if [ -f /usr/bin/ruby1.9.1 ]; then
    alias ruby='/usr/bin/ruby1.9.1'
fi
if [ -f /usr/bin/gem1.9.1 ]; then
    alias gem='/usr/bin/gem1.9.1'
fi

# node-dev
if [ -f ~/node_modules/node-dev/node-dev ]; then
    alias node-dev='~/node_modules/node-dev/node-dev'
fi

# other
alias ana='request-log-analyzer'
