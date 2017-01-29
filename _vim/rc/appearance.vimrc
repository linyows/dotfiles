" APPEARANCE

set helpfile=$VIMRUNTIME/doc/help.txt
filetype plugin indent on

set background=dark
if exists('g:isMultiColor')
    set t_Co=256
    try
        "colorscheme dw_red
        "colorscheme ironman
        "colorscheme ikvoli
        "colorscheme matrix
        "colorscheme oceandeep
        "colorscheme summerfruit256
        "colorscheme molokai
        "colorscheme moss
        "colorscheme getafe
        "colorscheme Tomorrow-Night
        if exists(":ToggleBG")
          call togglebg#map("<F5>")
        endif
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_degrade=0
        let g:solarized_bold=1
        let g:solarized_underline=1
        let g:solarized_italic=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        colorscheme solarized
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme desert
    endtry
else
    colorscheme desert
endif

set textwidth=0                " 自動折り返しをoffにするため無制限に設定 (段落整形したい時はgq,gwとかすればいい)
if exists('&colorcolumn')
    set colorcolumn=+1
    autocmd FileType sh,cpp,perl,vim,ruby,python,haskell,scheme,markdown setlocal textwidth=80
endif
set hidden                     " 変更中のファイルでも、保存しないで他のファイルを表示することが出来るようにする
set title                      " ウィンドウのタイトルを変更する設定
set ruler                      " カーソルが何行目の何列目に置かれているかを表示する
set shellslash                 " ファイル名の展開にスラッシュを使う
set wildmenu                   " コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set display=lastline           " テキスト表示の方法を変える
set whichwrap=b,s,[,],<,>      " カーソルを行頭、行末で止まらないようにする
set cmdheight=2                " コマンドラインに使われるスクリーン上の行数
set nonumber                   " 行番号を表示しない
set nowrap                     " 行折り返しをしない
set showcmd                    " 入力中のコマンドをステータスに表示する
set showmatch                  " 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set laststatus=2               " ステータスラインを常に表示
set backspace=indent,eol,start " バックスペースでインデントや改行を削除できるようにする
set lsp=3                      " 行間
"set number                    " 行番号を表示
"set cursorline                " カーソル行を強調表示
set listchars=tab:\ \          " タブの左側にカーソル表示
set list                       " タブ文字、行末など不可視文字を表示する
set expandtab                  " タブをスペースに展開する :retab でタブ・スペースの変換(noexpandtab:展開しない)
set tabstop=4                  " タブスペース数設定
set shiftwidth=4               " 自動的に挿入される量
set softtabstop=0              " <Tab>キーを押した時に挿入される空白の量
set autoindent                 " 自動的にインデントする (noautoindent:インデントしない)
set smartindent                " 新しい行を作ったときに高度な自動インデントを行う
set formatoptions+=mM          " テキスト挿入中の自動折り返しを日本語に対応させる
set guioptions-=T              " ツールバー非表示
set virtualedit=block          " 矩形ビジュアルモードで文字の無いところにもカーソル移動
if !executable('tmux') || $TMUX == ''
    set clipboard=unnamed,autoselect " yank時にclipboardにcopy (要+clipboard) -> fackclip.vimで不要
endif
"set nobackup                   " ファイル〜のバックアップファイルを作らない
set viminfo+=n~/.vim/tmp/viminfo.txt " viminfo保存先指定
set backupdir=~/.vim/tmp/backup " backupファイルのディレクトリ指定
set backupskip=/tmp/*,/private/tmp/* " 特定の場所でbackupしない @see http://weble.org/2011/06/06/mac-cron
set undodir=~/.vim/tmp/undo
"set directory=~/.vim/tmp/swap  " swapファイルのディレクトリ指定
set hlsearch                   " 検索結果文字列のハイライトを有効にする
" シンタックスハイライトを有効にする
if has('syntax')
    syntax on
endif
set foldmethod=marker           " 折りたたみを有効にする

" ステータスラインに文字コードと改行文字を表示する
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline=%<\ %f\                             " filename
set statusline+=%w%h%m%r                           " options
if exists('g:loaded_fugitive')
set statusline+=%{fugitive#statusline()}           " current git branch ;)
endif
set statusline+=\[%{&ff}]                          " fileformat
set statusline+=\%y                                " filetype
set statusline+=\%{'['.(&fenc!=''?&fenc:&enc).']'} " encoding
set statusline+=\[%{getcwd()}]                     " current dir
set statusline+=\[%p%%]                            " current position
"set statusline+=\ [A=\%03.3b/H=\%02.2B]            " ASCII / Hexadecimal value of char
set statusline+=%=%-14.(%l,%c%V%)\                 " right aligned file nav info

" Color {{{
    " ctermbg   コンソールの背景色
    " ctermfg   コンソールのテキストの色
    " term      コンソールのフォントフォーマット（太字など）
    " guibg     Gvimの背景色
    " guifg     Gvimのテキストの色
    " gui       Gvimのフォントフォーマット
    " 特殊文字(SpecialKey)の見える化。listcharsはlcsでも設定可能。trailは行末スペース。
    set list
    set listchars=tab:>.,trail:_,nbsp:%,extends:>,precedes:<
    highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

    highlight Pmenu       ctermbg=white guibg=white
    highlight PmenuSel    ctermbg=blue    ctermfg=white  guibg=blue   guifg=white
    highlight PmenuSbar   ctermbg=black    guibg=black
    highlight TabLine     term=reverse     cterm=reverse  ctermfg=black ctermbg=white
    highlight TabLineSel  term=bold        cterm=bold     ctermfg=black ctermbg=white
    highlight TabLineFill term=reverse     cterm=reverse  ctermfg=black ctermbg=white
    " 入力モード時、ステータスラインのカラーを変更
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * highlight StatusLine ctermfg=black      ctermbg=lightgreen guifg=#2E4340 guibg=#ccdc90
        autocmd InsertLeave * highlight StatusLine ctermfg=lightgreen ctermbg=black      guifg=black   guibg=#c2bfa5
    augroup END
" }}}

" IME {{{
    " IMEのon/offを確認できるようにする
    "hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

    " ノーマルモードでIME OFF
    "augroup InsModeAu
    "    autocmd!
    "    autocmd InsertEnter,CmdwinEnter * set noimdisable
    "    autocmd InsertLeave,CmdwinLeave * set imdisable
    "augroup END

    if has('multi_byte_ime') || has('xim') || has('gui_macvim')
        " カーソル上の文字色は文字の背景色にする。
        " IME Off
        "hi Cursor guifg=bg guibg=Green gui=NONE
        hi CursorIM guifg=NONE guibg=Purple gui=NONE
        " IME On
        "highlight CursorIM guibg=Purple guifg=NONE
        highlight CursorIM guibg=lightgreen guifg=NONE

        " 挿入モード・検索モードでのデフォルトのIME状態設定
        set iminsert=0 imsearch=0

        "if has('xim') && has('GUI_GTK')
            " XIMの入力開始キーを設定:
            " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
            "set imactivatekey=s-space
        "endif
        " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
        "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
    endif
" }}}

" Mac {{{
    if has('gui_macvim')
        if has('gui_running')
            " full screen
            "set fuoptions=maxvert,maxhorz
            "au GUIEnter * set fullscreen
            " hidden scroll bar
            set guioptions-=r
            set guioptions-=R
            set guioptions-=l
            set guioptions-=L
            "winpos 70 70               " ウィンドウの左上隅の位置をピクセル単位で指定で表示
            set columns=120            " window横
            set lines=30               " window縦
            "set showtabline=2         " タブを常に表示
            "set imdisable             " IMを無効化
            autocmd FocusGained * set transparency=10     " フォーカス時透明度
            autocmd FocusLost * set transparency=0       " フォーカスしてない時透明度
            set transparency=10
            set antialias             " アンチエイリアス
            set guifont=VL_Gothic:h12 " フォント
        endif
    endif
" }}}

" Windows {{{
    if has('win32')
        set guifont=VL_Gothic:h10:cSHIFTJIS       " フォント
        if has('printer')
            set printfont=VL_Gothic:h10:cSHIFTJIS     " 印刷時のフォント
            set printoptions=wrap:y,number:y,header:0 " 印刷
        endif
    endif
" }}}
