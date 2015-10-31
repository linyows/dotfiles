source ~/.bashrc
#source ~/.user_config/bashmarks/bashmarks.sh

if [ -d /Users ]; then
    # brew
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

    # php
    export PATH=/usr/local/Cellar/php/5.3.5/bin:$PATH
    # mongo
    export PATH=/usr/local/bin/mongo:$PATH

    # MacPorts Installer addition on 2009-09-27_at_12:05:18: adding an appropriate PATH variable for use with MacPorts.
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/man:$MANPATH

    # node
    export NODE_PATH=/usr/local/lib/node:$PATH
    export NODE_PATH=~/node_modules:$NODE_PATH

    # npm
    export PATH=/usr/local/share/npm/bin:$PATH

    # rbenv
    export PATH=$HOME/.rbenv:$PATH
    export PATH=$HOME/.rbenv/shims:$PATH

    # rbenv
    if [ -f ~/.rbenv/completions/rbenv.bash ]; then
        eval "$(rbenv init -)"
        source ~/.rbenv/completions/rbenv.bash
    fi
fi

# default
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:$PATH

# local
export PATH=/usr/local/bin/:/usr/local/sbin/:$PATH
export PATH=$HOME/.dotfiles/bin:$PATH
export FLEETCTL_ENDPOINT=http://172.17.8.101:4001
export KUBERNETES_MASTER=http://172.17.8.101:8080
