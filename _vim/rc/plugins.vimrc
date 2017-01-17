" PLUGIN


if &compatible
  set nocompatible
endif

if v:version >= 704
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

    call dein#begin(expand('~/.vim/dein'))

    call dein#add('sudo.vim')

    " Edit {{{
    " なめらかにスクロール
    call dein#add('Smooth-Scroll')
    " 最強コメント処理
    call dein#add('scrooloose/nerdcommenter.git')
    " 自動閉じタグ [dump等に影響があるので使用をやめる]
    "call dein#add('AutoClose')
    " 補完
    "call dein#add('AutoComplPop')
    call dein#add('Shougo/neocomplcache')
    "call dein#add('Shougo/neosnippet')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('ryuzee/neocomplcache_php_selenium_snippet')
    call dein#add('glidenote/serverspec-snippets')
    call dein#add('glidenote/rspec-result-syntax')
    " A neocomplcache plugin for English, using look command
    call dein#add('ujihisa/neco-look')
    " -- でメソッドチェーン整形
    call dein#add('c9s/cascading.vim')
    " visually indent guide
    call dein#add('nathanaelkane/vim-indent-guides')
    " XMLとかHTMLとかの編集機能を強化する
    call dein#add('xmledit')
    " 高機能整形・桁揃えプラグイン
    call dein#add('Align')
    " フィルタリングと整形
    call dein#add('godlygeek/tabular')
    " マルチバイト対応の整形
    call dein#add('h1mesuke/vim-alignta')
    " yankの履歴を順番に呼び出せる
    call dein#add('LeafCage/yankround.vim')
    " undo履歴を追える (need python support)
    "call dein#add('Gundo')
    " 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
    call dein#add('grep.vim')
    " vimの正規表現をrubyやperlの正規表現な入力でできる
    call dein#add('eregex.vim')
    " vimでackを使う
    call dein#add('mileszs/ack.vim')
    " カーソルの下のURLを開くor単語を検索エンジンで検索
    call dein#add('tyru/open-browser.vim')
    call dein#add('tpope/vim-repeat')
    call dein#add('kana/vim-operator-user')
    " Operator to Surround a Text Object
    call dein#add('rhysd/vim-operator-surround')
    " スニペット機能をvimで(snippetsEmuより使いやすい)
    "call dein#add('msanders/snipmate.vim')
    "call dein#add('linyows/snipmate.vim')
    " 命名規則変換
    " abcDef: crc, AbcDef: crm,
    " abc_def: cr_, ABC_DEF: cru,
    " abc-def: cr-
    call dein#add('tpope/vim-abolish')
    " ソースコード上のメソッド宣言、変数宣言の一覧を表示
    call dein#add('taglist.vim')
    " tagsを利用したソースコード閲覧・移動補助機能 tagsファイルの自動生成
    call dein#add('Source-Explorer-srcexpl.vim')
    " ディレクトリのファイル一覧、バッファ一覧、タグ一覧を別ウィンドウで表示できる
    call dein#add('winmanager')
    " perldocやphpmanual等のリファレンスをvim上で見る
    "call dein#add('thinca/vim-ref')
    " Simple Unit Testing Framework for Vim script
    call dein#add('h1mesuke/vim-unittest')
    " require 対象の補完をする unite.vim ソース
    call dein#add('rhysd/unite-ruby-require.vim')
    " neocomplcache で Ruby 2.0 のキーワード引数を補完
    call dein#add('rhysd/neco-ruby-keyword-args')
    " no no past (:Nonopaste, :'<,'>Nonopaste)
    "call dein#add('banyan/Nonopaste.vim')
    " :CopyPath, :CopyFileName
    call dein#add('taku-o/vim-copypath')
    call dein#add('terryma/vim-multiple-cursors')
    call dein#add('mattboehm/vim-unstack')
    " }}}

    " Language Syntax & Supports {{{
    call dein#add('fatih/vim-go')
    call dein#add('scrooloose/syntastic')
    call dein#add('nginx.vim')
    call dein#add('jQuery')
    call dein#add('tpope/vim-markdown')
    call dein#add('digitaltoad/vim-jade')
    call dein#add('kchmck/vim-coffee-script')
    call dein#add('tpope/vim-haml')
    call dein#add('slim-template/vim-slim')
    call dein#add('juvenn/mustache.vim')
    call dein#add('vim-ruby/vim-ruby')
    call dein#add('tpope/vim-rails')
    call dein#add('joker1007/vim-ruby-heredoc-syntax')
    call dein#add('joker1007/vim-markdown-quote-syntax')
    call dein#add('basyura/jslint.vim')
    call dein#add('php.vim--Garvin')
    call dein#add('php.vim')
    call dein#add('php_localvarcheck.vim')
    call dein#add('sumpygump/php-documentor-vim')
    call dein#add('puppetlabs/puppet-syntax-vim')
    call dein#add('c.vim')
    call dein#add('szw/vim-tags')
    call dein#add('gtags.vim')
    call dein#add('b4b4r07/vim-hcl')
    " }}}

    " Git {{{
    " vimからgit操作
    call dein#add('motemen/git-vim')
    " vimからGist
    call dein#add('mattn/gist-vim')
    " git wrapper
    call dein#add('tpope/vim-fugitive')
    " shows a git diff in the gutter
    call dein#add('airblade/vim-gitgutter')
    " }}}

    " Encording {{{
    call dein#add('banyan/recognize_charcode.vim')
    " }}}

    " Utility {{{
    " like emacs evil
    call dein#add('osyo-manga/vim-over')
    " vim Interface to Web API
    call dein#add('mattn/webapi-vim')
    " <Leader>beでバッファのリストを表示
    "call dein#add('bufexplorer.zip')
    " tree表示のfiler
    "call dein#add('scrooloose/nerdtree')
    " vim上でスクリプト実行、結果表示。コマンドモードで\r
    call dein#add('thinca/vim-quickrun')
    " GitHub Flavoerd Markdown Preview
    call dein#add('superbrothers/vim-quickrun-markdown-gfm')
    " svn commit をした時に表示されるログの編集画面と一緒に、svn diff の内容も表示
    call dein#add('svn-diff.vim')
    " Vimでの対話コマンドの実行 (要コンパイル / Mac $ make -f make_mac.mak / Linux $ make -f make_gcc.mak)
    call dein#add('Shougo/vimproc', {'build' : 'make'})
    " 補完もしてくれるvim上でshell (要vimproc)
    call dein#add('Shougo/vimshell')
    " vimでssh
    call dein#add('ujihisa/vimshell-ssh')
    " search word like vimperator
    call dein#add('Lokaltog/vim-easymotion')
    " ステータスラインに顔文字を表示
    call dein#add('mattn/hahhah-vim')
    " node dictionaly
    call dein#add('guileen/vim-node')
    " CUI版Vimでもクリップボードを使えるように
    call dein#add('fakeclip')
    " ステータスラインカスタマイズ
    call dein#add('Lokaltog/vim-powerline')
    " 図を描画
    call dein#add('DrawIt')
    " Table Mode
    call dein#add('dhruvasagar/vim-table-mode')
    " english for coding
    call dein#add('koron/codic-vim')
    call dein#add('rhysd/vim-clang-format')
    " }}}

    " Unite {{{
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimfiler')
    call dein#add('Shougo/neomru.vim')
    call dein#add('Shougo/neoinclude.vim')
    "see more plugin http://bit.ly/m5PKnU
    call dein#add('Sixeight/unite-grep')
    call dein#add('tsukkee/unite-help')
    call dein#add('h1mesuke/unite-outline')
    "call dein#add('linyows/unite-li3')
    "call dein#add('heavenshell/unite-zf')
    "call dein#add('heavenshell/unite-sf2')
    call dein#add('oppara/vim-unite-cake')
    call dein#add('basyura/unite-rails')
    call dein#add('thinca/vim-unite-history')
    call dein#add('osyo-manga/unite-env')
    call dein#add('tungd/unite-session')
    call dein#add('tsukkee/unite-tag')
    call dein#add('tacroe/unite-alias')
    call dein#add('ujihisa/unite-font')
    call dein#add('ujihisa/unite-colorscheme')
    call dein#add('ujihisa/unite-locate')
    call dein#add('mattn/unite-remotefile')
    "call dein#add('mattn/unite-mcdonalds-vim')
    "call dein#add('mattn/unite-genpatsu-fukushima-vim')
    " }}}

    " Others {{{
    " github interface
    call dein#add('thinca/vim-github')
    " Manage Markdown File
    call dein#add('glidenote/memolist.vim')
    " vimでevernote (need python support)
    "call dein#add('kakkyz81/evervim')
    " }}}

    " Color {{{
    if &t_Co >= 88 || has('gui_running')
        let g:isMultiColor = 'true'
        " 88/256色ターミナルでGUI用カラースキームを使用できる
        ""call dein#add('thinca/vim-guicolorscheme')
        " フルカラーなカラースキームを88/256色対応ターミナル上のVimで有効化
        "call dein#add('godlygeek/csapprox')
        " Scheme
        call dein#add('larssmit/vim-getafe')
        call dein#add('altercation/vim-colors-solarized')
        call dein#add('tomasr/molokai')
        " カラースキーム集
        call dein#add('Slashbunny/vim-colorsamplerpack')
        " CSSの色をプレビュー (重い？)
        "call dein#add('skammer/vim-css-color')
    endif
    " }}}

    call dein#end()
endif

filetype plugin indent on
syntax enable
