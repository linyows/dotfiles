" PLUGIN

set nocompatible " Vi互換にしない
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'sudo.vim'

" Edit {{{
" なめらかにスクロール
Bundle 'Smooth-Scroll'
" 最強コメント処理
Bundle 'scrooloose/nerdcommenter.git'
" 自動閉じタグ [dump等に影響があるので使用をやめる]
"Bundle 'AutoClose'
" 補完
"Bundle 'AutoComplPop'
Bundle 'Shougo/neocomplcache'
" A neocomplcache plugin for English, using look command
Bundle 'ujihisa/neco-look'
" -- でメソッドチェーン整形
Bundle 'c9s/cascading.vim'
" visually indent guide
Bundle 'nathanaelkane/vim-indent-guides'
" XMLとかHTMLとかの編集機能を強化する
Bundle 'xmledit'
" 高機能整形・桁揃えプラグイン
Bundle 'Align'
" フィルタリングと整形
Bundle 'godlygeek/tabular'
" マルチバイト対応の整形
Bundle 'h1mesuke/vim-alignta'
" yankの履歴を順番に呼び出せる
Bundle 'LeafCage/yankround.vim'
" undo履歴を追える (need python support)
Bundle 'Gundo'
" 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
Bundle 'grep.vim'
" vimの正規表現をrubyやperlの正規表現な入力でできる
Bundle 'eregex.vim'
" vimでackを使う
Bundle 'mileszs/ack.vim'
" カーソルの下のURLを開くor単語を検索エンジンで検索
Bundle 'tyru/open-browser.vim'
Bundle 'tpope/vim-repeat'
Bundle 'kana/vim-operator-user'
" Operator to Surround a Text Object
Bundle 'rhysd/vim-operator-surround'
" スニペット機能をvimで(snippetsEmuより使いやすい)
"Bundle 'msanders/snipmate.vim'
"Bundle 'linyows/snipmate.vim'
" 命名規則変換
" abcDef: crc, AbcDef: crm,
" abc_def: cr_, ABC_DEF: cru,
" abc-def: cr-
Bundle 'tpope/vim-abolish'
" ソースコード上のメソッド宣言、変数宣言の一覧を表示
Bundle 'taglist.vim'
" tagsを利用したソースコード閲覧・移動補助機能 tagsファイルの自動生成
Bundle 'Source-Explorer-srcexpl.vim'
" ディレクトリのファイル一覧、バッファ一覧、タグ一覧を別ウィンドウで表示できる
Bundle 'winmanager'
" perldocやphpmanual等のリファレンスをvim上で見る
Bundle 'thinca/vim-ref'
" Simple Unit Testing Framework for Vim script
Bundle 'h1mesuke/vim-unittest'
" require 対象の補完をする unite.vim ソース
Bundle 'rhysd/unite-ruby-require.vim'
" neocomplcache で Ruby 2.0 のキーワード引数を補完
Bundle 'rhysd/neco-ruby-keyword-args'
" no no past (:Nonopaste, :'<,'>Nonopaste)
Bundle 'banyan/Nonopaste.vim'
" :CopyPath, :CopyFileName
Bundle 'taku-o/vim-copypath'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mattboehm/vim-unstack'
" }}}

" Language Syntax & Supports {{{
Bundle 'Blackrush/vim-gocode'
Bundle 'scrooloose/syntastic'
Bundle 'nginx.vim'
Bundle 'jQuery'
Bundle 'tpope/vim-markdown'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-haml'
Bundle 'slim-template/vim-slim'
Bundle 'juvenn/mustache.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'joker1007/vim-ruby-heredoc-syntax'
Bundle 'joker1007/vim-markdown-quote-syntax'
Bundle 'basyura/jslint.vim'
Bundle 'php.vim--Garvin'
Bundle 'php.vim'
Bundle 'php_localvarcheck.vim'
Bundle 'linyows/PDV--phpDocumentor-for-Vim'
Bundle 'puppetlabs/puppet-syntax-vim'
" }}}

" Git {{{
" vimからgit操作
Bundle 'motemen/git-vim'
" vimからGist
Bundle 'mattn/gist-vim'
" git wrapper
Bundle 'tpope/vim-fugitive'
" shows a git diff in the gutter
Bundle 'airblade/vim-gitgutter'
" }}}

" Encording {{{
Bundle 'banyan/recognize_charcode.vim'
" }}}

" Utility {{{
" like emacs evil
Bundle 'osyo-manga/vim-over'
" vim Interface to Web API
Bundle 'mattn/webapi-vim'
" <Leader>beでバッファのリストを表示
"Bundle 'bufexplorer.zip'
" tree表示のfiler
"Bundle 'scrooloose/nerdtree'
" vim上でスクリプト実行、結果表示。コマンドモードで\r
Bundle 'thinca/vim-quickrun'
" GitHub Flavoerd Markdown Preview
Bundle 'superbrothers/vim-quickrun-markdown-gfm'
" svn commit をした時に表示されるログの編集画面と一緒に、svn diff の内容も表示
Bundle 'svn-diff.vim'
" Vimでの対話コマンドの実行 (要コンパイル / Mac $ make -f make_mac.mak / Linux $ make -f make_gcc.mak)
Bundle 'Shougo/vimproc'
" 補完もしてくれるvim上でshell (要vimproc)
Bundle 'Shougo/vimshell'
" vimでssh
Bundle 'ujihisa/vimshell-ssh'
" search word like vimperator
Bundle 'Lokaltog/vim-easymotion'
" ステータスラインに顔文字を表示
Bundle 'mattn/hahhah-vim'
" node dictionaly
Bundle 'guileen/vim-node'
" CUI版Vimでもクリップボードを使えるように
Bundle 'fakeclip'
" ステータスラインカスタマイズ
Bundle 'Lokaltog/vim-powerline'
" 図を描画
Bundle 'DrawIt'
" Table Mode
Bundle 'dhruvasagar/vim-table-mode'
" english for coding
Bundle 'koron/codic-vim'
" }}}

" Unite {{{
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/neomru.vim'
"see more plugin http://bit.ly/m5PKnU
Bundle 'Sixeight/unite-grep'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
"Bundle 'linyows/unite-li3'
"Bundle 'heavenshell/unite-zf'
"Bundle 'heavenshell/unite-sf2'
Bundle 'oppara/vim-unite-cake'
Bundle 'basyura/unite-rails'
Bundle 'thinca/vim-unite-history'
Bundle 'osyo-manga/unite-env'
Bundle 'tungd/unite-session'
Bundle 'tsukkee/unite-tag'
Bundle 'tacroe/unite-alias'
Bundle 'ujihisa/unite-font'
Bundle 'ujihisa/unite-colorscheme'
Bundle 'ujihisa/unite-locate'
Bundle 'mattn/unite-remotefile'
"Bundle 'mattn/unite-mcdonalds-vim'
"Bundle 'mattn/unite-genpatsu-fukushima-vim'
" }}}

" Others {{{
" github interface
Bundle 'thinca/vim-github'
" Manage Markdown File
Bundle 'glidenote/memolist.vim'
" vimでevernote (need python support)
"Bundle 'kakkyz81/evervim'
" }}}

" Color {{{
if &t_Co >= 88 || has('gui_running')
    let g:isMultiColor = 'true'
    " 88/256色ターミナルでGUI用カラースキームを使用できる
    ""Bundle 'thinca/vim-guicolorscheme'
    " フルカラーなカラースキームを88/256色対応ターミナル上のVimで有効化
    "Bundle 'godlygeek/csapprox'
    " Scheme
    Bundle 'larssmit/vim-getafe'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    " カラースキーム集
    Bundle 'Slashbunny/vim-colorsamplerpack'
    " CSSの色をプレビュー (重い？)
    "Bundle 'skammer/vim-css-color'
endif
" }}}
