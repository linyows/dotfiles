" MISC

" Vim で"gf"をスラッシュで始まる相対URLに対応させる
" see@http://hail2u.net/blog/software/support-slash-started-relative-url-in-vim-gf.html
autocmd FileType html :setlocal path+=;/

" Mac Quick Look {{{
    " ファイル保存時に拡張属性を設定するコマンド
    " see@http://d.hatena.ne.jp/uasi/20110523/1306079612
    au BufWritePost * call SetUTF8Xattr(expand("<afile>"))

    function! SetUTF8Xattr(file)
        let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
        if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
            call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
        endif
    endfunction
" }}}

" Omni Mapping <tab>で補完 {{{
    function! InsertTabWrapper()
        if pumvisible()
            return "\<c-n>"
        endif
        let col = col('.') - 1
        if !col || getline('.')[col - 1] !~ '\k\|<\|/'
            return "\<tab>"
        elseif exists('&omnifunc') && &omnifunc == ''
            return "\<c-n>"
        else
            return "\<c-x>\<c-o>"
        endif
    endfunction
    inoremap <silent> <tab> <c-r>=InsertTabWrapper()<CR>
" }}}

" Omnifunc {{{
    " 注意: この内容は:filetype onよりも後に記述すること。
    autocmd FileType *
    \   if &l:omnifunc == ''
    \ |   setlocal omnifunc=syntaxcomplete#Complete
    \ | endif
" }}}

" Save Option {{{
    " 行末の空白除去
    " autocmd BufWritePre * :%s/\s\+$//ge
    " tabを4スペースに変換
    " autocmd BufWritePre * :%s/\t/    /ge
" }}}

" VimrcLocalFile {{{
    if filereadable(expand('~/.vimrc.local'))
        source ~/.vimrc.local
    endif
" }}}
