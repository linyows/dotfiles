" PLUGIN

set nocompatible " Vi互換にしない
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'sudo.vim'

" Edit {{{
" なめらかにスクロール
Plugin 'Smooth-Scroll'
" 最強コメント処理
Plugin 'scrooloose/nerdcommenter.git'
" 自動閉じタグ [dump等に影響があるので使用をやめる]
"Plugin 'AutoClose'
" 補完
"Plugin 'AutoComplPop'
Plugin 'Shougo/neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'ryuzee/neocomplcache_php_selenium_snippet'
Plugin 'glidenote/serverspec-snippets'
" A neocomplcache plugin for English, using look command
Plugin 'ujihisa/neco-look'
" -- でメソッドチェーン整形
Plugin 'c9s/cascading.vim'
" visually indent guide
Plugin 'nathanaelkane/vim-indent-guides'
" XMLとかHTMLとかの編集機能を強化する
Plugin 'xmledit'
" 高機能整形・桁揃えプラグイン
Plugin 'Align'
" フィルタリングと整形
Plugin 'godlygeek/tabular'
" マルチバイト対応の整形
Plugin 'h1mesuke/vim-alignta'
" yankの履歴を順番に呼び出せる
Plugin 'LeafCage/yankround.vim'
" undo履歴を追える (need python support)
Plugin 'Gundo'
" 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
Plugin 'grep.vim'
" vimの正規表現をrubyやperlの正規表現な入力でできる
Plugin 'eregex.vim'
" vimでackを使う
Plugin 'mileszs/ack.vim'
" カーソルの下のURLを開くor単語を検索エンジンで検索
Plugin 'tyru/open-browser.vim'
Plugin 'tpope/vim-repeat'
Plugin 'kana/vim-operator-user'
" Operator to Surround a Text Object
Plugin 'rhysd/vim-operator-surround'
" スニペット機能をvimで(snippetsEmuより使いやすい)
"Plugin 'msanders/snipmate.vim'
"Plugin 'linyows/snipmate.vim'
" 命名規則変換
" abcDef: crc, AbcDef: crm,
" abc_def: cr_, ABC_DEF: cru,
" abc-def: cr-
Plugin 'tpope/vim-abolish'
" ソースコード上のメソッド宣言、変数宣言の一覧を表示
Plugin 'taglist.vim'
" tagsを利用したソースコード閲覧・移動補助機能 tagsファイルの自動生成
Plugin 'Source-Explorer-srcexpl.vim'
" ディレクトリのファイル一覧、バッファ一覧、タグ一覧を別ウィンドウで表示できる
Plugin 'winmanager'
" perldocやphpmanual等のリファレンスをvim上で見る
Plugin 'thinca/vim-ref'
" Simple Unit Testing Framework for Vim script
Plugin 'h1mesuke/vim-unittest'
" require 対象の補完をする unite.vim ソース
Plugin 'rhysd/unite-ruby-require.vim'
" neocomplcache で Ruby 2.0 のキーワード引数を補完
Plugin 'rhysd/neco-ruby-keyword-args'
" no no past (:Nonopaste, :'<,'>Nonopaste)
Plugin 'banyan/Nonopaste.vim'
" :CopyPath, :CopyFileName
Plugin 'taku-o/vim-copypath'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattboehm/vim-unstack'
" }}}

" Language Syntax & Supports {{{
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic'
Plugin 'nginx.vim'
Plugin 'jQuery'
Plugin 'tpope/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'slim-template/vim-slim'
Plugin 'juvenn/mustache.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'joker1007/vim-ruby-heredoc-syntax'
Plugin 'joker1007/vim-markdown-quote-syntax'
Plugin 'basyura/jslint.vim'
Plugin 'php.vim--Garvin'
Plugin 'php.vim'
Plugin 'php_localvarcheck.vim'
Plugin 'linyows/PDV--phpDocumentor-for-Vim'
Plugin 'puppetlabs/puppet-syntax-vim'
" }}}

" Git {{{
" vimからgit操作
Plugin 'motemen/git-vim'
" vimからGist
Plugin 'mattn/gist-vim'
" git wrapper
Plugin 'tpope/vim-fugitive'
" shows a git diff in the gutter
Plugin 'airblade/vim-gitgutter'
" }}}

" Encording {{{
Plugin 'banyan/recognize_charcode.vim'
" }}}

" Utility {{{
" like emacs evil
Plugin 'osyo-manga/vim-over'
" vim Interface to Web API
Plugin 'mattn/webapi-vim'
" <Leader>beでバッファのリストを表示
"Plugin 'bufexplorer.zip'
" tree表示のfiler
"Plugin 'scrooloose/nerdtree'
" vim上でスクリプト実行、結果表示。コマンドモードで\r
Plugin 'thinca/vim-quickrun'
" GitHub Flavoerd Markdown Preview
Plugin 'superbrothers/vim-quickrun-markdown-gfm'
" svn commit をした時に表示されるログの編集画面と一緒に、svn diff の内容も表示
Plugin 'svn-diff.vim'
" Vimでの対話コマンドの実行 (要コンパイル / Mac $ make -f make_mac.mak / Linux $ make -f make_gcc.mak)
Plugin 'Shougo/vimproc'
" 補完もしてくれるvim上でshell (要vimproc)
Plugin 'Shougo/vimshell'
" vimでssh
Plugin 'ujihisa/vimshell-ssh'
" search word like vimperator
Plugin 'Lokaltog/vim-easymotion'
" ステータスラインに顔文字を表示
Plugin 'mattn/hahhah-vim'
" node dictionaly
Plugin 'guileen/vim-node'
" CUI版Vimでもクリップボードを使えるように
Plugin 'fakeclip'
" ステータスラインカスタマイズ
Plugin 'Lokaltog/vim-powerline'
" 図を描画
Plugin 'DrawIt'
" Table Mode
Plugin 'dhruvasagar/vim-table-mode'
" english for coding
Plugin 'koron/codic-vim'
" }}}

" Unite {{{
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimfiler'
Plugin 'Shougo/neomru.vim'
"see more plugin http://bit.ly/m5PKnU
Plugin 'Sixeight/unite-grep'
Plugin 'tsukkee/unite-help'
Plugin 'h1mesuke/unite-outline'
"Plugin 'linyows/unite-li3'
"Plugin 'heavenshell/unite-zf'
"Plugin 'heavenshell/unite-sf2'
Plugin 'oppara/vim-unite-cake'
Plugin 'basyura/unite-rails'
Plugin 'thinca/vim-unite-history'
Plugin 'osyo-manga/unite-env'
Plugin 'tungd/unite-session'
Plugin 'tsukkee/unite-tag'
Plugin 'tacroe/unite-alias'
Plugin 'ujihisa/unite-font'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'ujihisa/unite-locate'
Plugin 'mattn/unite-remotefile'
"Plugin 'mattn/unite-mcdonalds-vim'
"Plugin 'mattn/unite-genpatsu-fukushima-vim'
" }}}

" Others {{{
" github interface
Plugin 'thinca/vim-github'
" Manage Markdown File
Plugin 'glidenote/memolist.vim'
" vimでevernote (need python support)
"Plugin 'kakkyz81/evervim'
" }}}

" Color {{{
if &t_Co >= 88 || has('gui_running')
    let g:isMultiColor = 'true'
    " 88/256色ターミナルでGUI用カラースキームを使用できる
    ""Plugin 'thinca/vim-guicolorscheme'
    " フルカラーなカラースキームを88/256色対応ターミナル上のVimで有効化
    "Plugin 'godlygeek/csapprox'
    " Scheme
    Plugin 'larssmit/vim-getafe'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'tomasr/molokai'
    " カラースキーム集
    Plugin 'Slashbunny/vim-colorsamplerpack'
    " CSSの色をプレビュー (重い？)
    "Plugin 'skammer/vim-css-color'
endif
" }}}

call vundle#end()
filetype plugin indent on
