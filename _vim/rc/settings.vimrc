" SETTING

let s:iswin = has('win32') || has('win64')

" Use English interface.
if s:iswin
  language message en
else
  language mes C
endif

" Japanese {{{
    " euc-jpがlatin1で表示される対策
    if &encoding !=# 'utf-8'
    else
        "ucs-bom,utf-8,default,latin1 デフォの状態
        set fileencodings-=latin1
        set fileencodings+=euc-jp
        set fileencodings+=latin1
    endif
" }}}

" Mouse {{{
    set mouse=a      " マウスモード有効
    set nomousefocus " マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
    set mousehide    " 入力時にマウスポインタを隠す (nomousehide:隠さない)
    set ttymouse=xterm2 " screenでマウスを使う
" }}}

" Searching {{{
    set ignorecase  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
    set smartcase   " 検索文字列に大文字が含まれている場合は区別して検索する
    set incsearch   " インクリメンタルサーチ 検索文字を打っている途中で、目的の単語を見つけたらEnterを押下 検索をやめたい場合はEscを押下
    set wrapscan    " 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
    set noincsearch " 検索文字列入力時に順次対象文字列にヒットさせない
" }}}
