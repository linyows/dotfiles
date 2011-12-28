#!/bin/sh

BACKUP_PATH=$HOME/.mytools_backup/`date +%Y-%m-%d-%H-%M-%S`
mkdir -p $BACKUP_PATH

#
# zsh
#
if [ -L $HOME/.zshrc ]; then
    rm -rf  $HOME/.zshrc
elif [ -f $HOME/.zshrc ]; then
    mv $HOME/.zshrc $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_zsh/.zshrc $HOME/.zshrc

if [ -L $HOME/.zshenv ]; then
    rm -rf  $HOME/.zshenv
elif [ -f $HOME/.zshenv ]; then
    mv $HOME/.zshenv $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_zsh/.zshenv $HOME/.zshenv

if [ -L $HOME/.zsh_aliases ]; then
    rm -rf  $HOME/.zsh_aliases
elif [ -f $HOME/.zsh_aliases ]; then
    mv $HOME/.zsh_aliases $BACKUP_PATH
fi
cp -f $HOME/.mytools/_zsh/.zsh_aliases $HOME/.zsh_aliases

if [ -L $HOME/.oh-my-zsh ]; then
    rm -rf $HOME/.oh-my-zsh
elif [ -d $HOME/.oh-my-zsh ]; then
    mv $HOME/.oh-my-zsh $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_zsh/oh-my-zsh $HOME/.oh-my-zsh

#
# bash
#
if [ -L $HOME/.bash_profile ]; then
    rm -rf $HOME/.bash_profile
elif [ -f $HOME/.bash_profile ]; then
    mv $HOME/.bash_profile $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_bash/.bash_profile $HOME/.bash_profile

if [ -L $HOME/.bashrc ]; then
    rm -rf $HOME/.bashrc
elif [ -f $HOME/.bashrc ]; then
    mv $HOME/.bashrc $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_bash/.bashrc $HOME/.bashrc

if [ -L $HOME/.bash_aliases ]; then
    rm -rf $HOME/.bash_aliases
elif [ -f $HOME/.bash_aliases ]; then
    mv $HOME/.bash_aliases $BACKUP_PATH
fi
cp -f  $HOME/.mytools/_bash/.bash_aliases $HOME/.bash_aliases

if [ -L $HOME/.inputrc ]; then
    rm -rf $HOME/.inputrc
elif [ -f $HOME/.inputrc ]; then
    mv $HOME/.inputrc $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_bash/.inputrc $HOME/.inputrc

#
# virtual consoles
#
if [ -L $HOME/.tmux.conf ]; then
    rm -rf $HOME/.tmux.conf
elif [ -f $HOME/.tmux.conf ]; then
    mv $HOME/.tmux.conf $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_vc/.tmux.conf $HOME/.tmux.conf

if [ -L $HOME/.screenrc ]; then
    rm -rf $HOME/.screenrc
elif [ -f $HOME/.screenrc ]; then
    mv $HOME/.screenrc $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_vc/.screenrc $HOME/.screenrc

#
# git
#
if [ -L $HOME/.gitconfig ]; then
    rm -rf $HOME/.gitconfig
elif [ -f $HOME/.gitconfig ]; then
    mv $HOME/.gitconfig $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_git/.gitconfig $HOME/.gitconfig

if [ -L $HOME/.gitignore ]; then
    rm -rf $HOME/.gitignore
elif [ -f $HOME/.gitignore ]; then
    mv $HOME/.gitignore $BACKUP_PATH
fi
ln -fsv $HOME/.mytools/_git/.gitignore $HOME/.gitignore

#
# submodule
#
cd $HOME/.mytools
git submodule init
git submodule update

#
# vim
#
if [ -L $HOME/.vimrc ]; then
    rm -rf $HOME/.vimrc
elif [ -f $HOME/.vimrc ]; then
    mv $HOME/.vimrc $BACKUP_PATH
fi
ln -fs $HOME/.mytools/_vim/.vimrc $HOME/.vimrc

if [ -L $HOME/.vimrc.local ]; then
    rm -rf $HOME/.vimrc.local
elif [ -f $HOME/.vimrc.local ]; then
    mv $HOME/.vimrc.local $BACKUP_PATH
fi
cp -f  $HOME/.mytools/_vim/.vimrc.local $HOME/.vimrc.local

if [ -L $HOME/.vim ]; then
    rm -rf $HOME/.vim
elif [ -d $HOME/.vim ]; then
    mv $HOME/.vim $BACKUP_PATH
fi
ln -fs $HOME/.mytools/_vim $HOME/.vim

vim -c "BundleInstall" -c "q!" -c "q!"
cd $HOME/.mytools/_vim/bundle/vimproc
# mac
if [ -d /Users ]; then
  make -f make_mac.mak
# linux
else
  make -f make_gcc.mak
fi

#
# mac only
#
if [ -d /Users ]; then
    # vimperator
    if [ -L $HOME/.vimperatorrc ]; then
        rm -rf $HOME/.vimperatorrc
    elif [ -f $HOME/.vimperatorrc ]; then
        mv $HOME/.vimperatorrc $BACKUP_PATH
    fi
    ln -fsv $HOME/.mytools/_vimperator/.vimperatorrc $HOME/.vimperatorrc

    if [ -L $HOME/.vimperator ]; then
        rm -rf $HOME/.vimperator
    elif [ -d $HOME/.vimperator ]; then
        mv $HOME/.vimperator $BACKUP_PATH
    fi
    ln -fsv $HOME/.mytools/_vimperator $HOME/.vimperator

    # tmux-MacOSX-pasteboard
    if [ -f $HOME/.mytools/lib/tmux-MacOSX-pasteboard/reattach-to-user-namespace]; then
        mv $HOME/.mytools/lib/tmux-MacOSX-pasteboard/reattach-to-user-namespace $BACKUP_PATH
    fi

    cd  $HOME/.mytools/lib/tmux-MacOSX-pasteboard
    make reattach-to-user-namespace
    ln -fs $HOME/.mytools/lib/tmux-MacOSX-pasteboard/reattach-to-user-namespace $HOME/.mytools/bin
fi
