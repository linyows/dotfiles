function _zshenv_add_path() {
  if [ -f /bin/grep ]; then
    grep=/bin/grep
  else
    grep=/usr/bin/grep
  fi

  _path=`eval echo \\$$1`

  if ! dirs=`eval echo $2 2>/dev/null`; then
    return
  fi

  reversed_dirs=
  for dir in `eval echo $dirs`; do
    reversed_dirs="$dir $reversed_dirs"
  done

  for dir in `eval echo $reversed_dirs`; do
    if [ ! -d $dir ]; then
      continue
    fi
    if echo $_path | $grep -Eq "(^|:)$dir($|:)"; then
      continue
    fi

    if [ "$_path" = "" ]; then
      eval _path=$dir
    elif [ "$3" = "before" ]; then
      eval _path=$dir:$_path
    else
      eval _path=$_path:$dir
    fi
  done

  eval $1=$_path
}


export PATH=
_zshenv_add_path PATH "$HOME/bin"
_zshenv_add_path PATH "$HOME/.dotfiles/bin"
_zshenv_add_path PATH "$HOME/git/config/bin/*" # git で管理する bin
_zshenv_add_path PATH "$HOME/sbin"
_zshenv_add_path PATH "$HOME/node_modules/.bin"
_zshenv_add_path PATH "$HOME/.rbenv"
_zshenv_add_path PATH "$HOME/.rbenv/bin"
_zshenv_add_path PATH "$HOME/.rbenv/shims"
_zshenv_add_path PATH "$HOME/.nodebrew/current/bin"
_zshenv_add_path PATH "/usr/local/bin"
_zshenv_add_path PATH "/usr/local/sbin"
_zshenv_add_path PATH "/usr/local/*/bin"
_zshenv_add_path PATH "/usr/local/*/sbin"
_zshenv_add_path PATH "/opt/local/bin"
_zshenv_add_path PATH "/opt/local/sbin"
_zshenv_add_path PATH "/opt/local/*/bin"
_zshenv_add_path PATH "/opt/local/*/sbin"
_zshenv_add_path PATH "/opt/bin"
_zshenv_add_path PATH "/opt/sbin"
_zshenv_add_path PATH "/opt/*/bin"
_zshenv_add_path PATH "/opt/*/sbin"
_zshenv_add_path PATH "/bin"
_zshenv_add_path PATH "/sbin"
_zshenv_add_path PATH "/usr/bin"
_zshenv_add_path PATH "/usr/sbin"
_zshenv_add_path PATH "/usr/*/bin"
_zshenv_add_path PATH "/usr/*/sbin"
_zshenv_add_path PATH "/usr/local/lib/flex3/bin"
_zshenv_add_path PATH "/usr/local/src/apache-maven-2.2.1/bin"
_zshenv_add_path PATH "/usr/local/ImageMagick-6.5.8-5/lib"
#_zshenv_add_path PATH "/usr/share/python"
#_zshenv_add_path PATH "/usr/local/share/python"
_zshenv_add_path PATH "$HOME/.ghq/github.com/coreos/fleet/bin"
_zshenv_add_path PATH "$HOME/.cargo/bin"

export CPATH=
_zshenv_add_path CPATH "/usr/local/include"
_zshenv_add_path CPATH "/opt/local/include"
_zshenv_add_path CPATH "/opt/include"

#export PYTHONPATH=/usr/share/python:/usr/local/share/python:$PYTHONPATH

if [ `which go >/dev/null 2>&1 ; echo $?` -eq 0 ]; then
  if [ -d $HOME/.go ]; then
    export GOPATH=$HOME/.go
    export PATH=$PATH:$GOPATH/bin
  fi
  if [ -d /usr/local/opt/go/libexec/bin ]; then
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
  fi
fi

# brew command is slow
# if [ `uname` = 'Darwin' ]; then
#     export RUBY_CONFIGURE_OPTS="--disable-install-doc --with-gcc=clang \
#         --with-readline-dir=`brew --prefix readline` \
#         --with-openssl-dir=`brew --prefix openssl` \
#         --with-iconv-dir=`brew --prefix libiconv`"
#     if [ -f "/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt" ]; then
#         export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt
#     fi
# fi

if [ -d $HOME/.perl5 ]; then
  export PERL_CPANM_OPT="--local-lib=~/.perl5"
  export PERL5LIB=$HOME/.perl5/lib/perl5:$PERL5LIB;
  #PATH="$HOME/.perl5/bin${PATH:+:${PATH}}"; export PATH;
  #PERL5LIB="$HOME/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
  #PERL_LOCAL_LIB_ROOT="$HOME/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
  #PERL_MB_OPT="--install_base \"$HOME/.perl5\""; export PERL_MB_OPT;
  #PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"; export PERL_MM_OPT;
fi

if [ `which direnv >/dev/null 2>&1 ; echo $?` -eq 0 ]; then
  eval "$(direnv hook zsh)"
fi

# load local.zshenv
if [ -f "$HOME/.zshenv.local" ]; then
  source "$HOME/.zshenv.local"
fi
