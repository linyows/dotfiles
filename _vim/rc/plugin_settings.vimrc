" PLUGIN SETTINGS

let s:iswin = has('win32') || has('win64')

" Scroll {{{
    " 次表示をスムーススクロール
    nnoremap <Space>jj :call SmoothScroll("d",2, 2)<Enter>
    nnoremap <Space>j :call SmoothScroll("d",1, 1)<Enter>
    " 前表示をスムーススクロール
    nnoremap <Space>kk :call SmoothScroll("u",2, 2)<Enter>
    nnoremap <Space>k :call SmoothScroll("u",1, 1)<Enter>
" }}}

" bufexplorer.vim バッファ一覧を表示 {{{
    "cnoremap LS BufExplorer<Enter>
" }}}

" vim-indent-guides {{{
    nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_start_level = 4
    let g:indent_guides_guide_size = 1
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
    if 'dark' == &background
        hi IndentGuidesOdd  ctermbg=black
        hi IndentGuidesEven ctermbg=darkgrey
    else
        hi IndentGuidesOdd  ctermbg=white
        hi IndentGuidesEven ctermbg=lightgrey
    endif
" }}}

" nerdtree {{{
    nnoremap <Space>tr :<C-u>NERDTreeToggle<Enter>
    let NERDTreeShowHidden=1
" }}}

" autofmt 自動的に日本語入力(IM)をoffにする機能を有効 {{{
    "set imdisableactivate
" }}}

" Git {{{
    let g:git_no_map_default = 1
    let g:git_command_edit = 'rightbelow vnew'
    nnoremap <Space>gd :<C-u>GitDiff --cached<Enter>
    nnoremap <Space>gD :<C-u>GitDiff<Enter>
    nnoremap <Space>gs :<C-u>GitStatus<Enter>
    nnoremap <Space>gl :<C-u>GitLog<Enter>
    nnoremap <Space>gL :<C-u>GitLog -u \| head -10000<Enter>
    nnoremap <Space>ga :<C-u>GitAdd<Enter>
    nnoremap <Space>gA :<C-u>GitAdd <cfile><Enter>
    nnoremap <Space>gc :<C-u>GitCommit<Enter>
    nnoremap <Space>gC :<C-u>GitCommit --amend<Enter>
    nnoremap <Space>gp :<C-u>Git push
" }}}

" Align {{{
    let g:Align_xstrlen = 3
    vmap <Space>s <Leader>tsp
    smap <Space>s <Leader>tsp
    vmap <Space>a : Align
    smap <Space>a : Align
" }}}

" NERD_commenter.vim {{{
    "let g:NERDCreateDefaultMappings = 0 " デフォルトのマッピングを無効にする
    let g:NERDSpaceDelims = 1 " 行頭に1スペースを作ってコメントアウトする
    " Toggle
    map <Leader><Leader> <Leader>c<space>_
    " Minimal
    map <Space><Leader> <Leader>cm
    " Invert
    "map xxx <leader>ci
    " Sexy
    "map xxx <leader>cs
    " 未対応ファイルタイプのエラーメッセージを表示しない
    let NERDShutUp=1
" }}}

" yankround.vim {{{
    nmap p <Plug>(yankround-p)
    nmap P <Plug>(yankround-P)
    nmap gp <Plug>(yankround-gp)
    nmap gP <Plug>(yankround-gP)
    nmap <C-p> <Plug>(yankround-prev)
    nmap <C-n> <Plug>(yankround-next)
    nnoremap <silent> ,y :<C-u>Unite yankround<CR>
" }}}

" memolist.vim {{{
    map <Leader>mn :MemoNew<CR>
    map <Leader>ml :MemoList<CR>
    map <Leader>mg :MemoGrep<CR>
    let g:memolist_path = '~/Dropbox/Document/Note'
    let g:memolist_memo_suffix       = 'md'
    "let g:memolist_memo_date         = '%Y-%m-%d %H:%M'
    "let g:memolist_memo_date         = 'epoch'
    "let g:memolist_memo_date         = '%D %T'
    "let g:memolist_prompt_tags       = 'true'
    "let g:memolist_prompt_categories = 'true'
    "let g:memolist_qfixgrep          = 'true'
" }}}

" evervim {{{
    " 作業用ワークディレクトリ指定
    let g:evervim_workdir = $HOME . '/.vim/tmp/plugin/.evervim'
    " ノートの一覧表示
    nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
    " タグ一覧表示
    nnoremap <silent> ,et :<C-u>EvervimListTags<CR>
    " 新規ノート
    nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
" }}}

" gundo.Vim {{{
    nmap U :<C-u>GundoToggle<CR>
" }}}

" taglist.vim {{{
    " 関数一覧
    set tags=tags
    "set tags+=~/.tags
    "let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags' " ctagsのパス
    let Tlist_Show_One_File = 1               " 現在編集中のソースのタグしか表示しない
    let Tlist_Exit_OnlyWindow = 1             " taglistのウィンドーが最後のウィンドーならばVimを閉じる
    let Tlist_Use_Right_Window = 1            " 右側でtaglistのウィンドーを表示
    let Tlist_Enable_Fold_Column = 1          " 折りたたみ
    let Tlist_Auto_Open = 0                   " 自動表示
    let Tlist_Auto_Update = 1
    let Tlist_WinWidth = 30
    "map <silent> <leader>tl :Tlist<CR>        " taglistを開くショットカットキー
" }}}

" Srcexpl {{{
    " [Srcexpl] tagsを利用したソースコード閲覧・移動補助機能
    let g:SrcExpl_UpdateTags    = 1         " tagsをsrcexpl起動時に自動で作成（更新）
    let g:SrcExpl_RefreshTime   = 0         " 自動表示するまでの時間(0:off)
    let g:SrcExpl_WinHeight     = 9         " プレビューウインドウの高さ
    let g:SrcExpl_RefreshMapKey = "<Space>" " 手動表示のMAP
    let g:SrcExpl_GoBackMapKey  = "<C-b>"   " 戻る機能のMAP
    nmap <F8> :SrcExplToggle<CR>            " Source Explorerの機能ON/OFF
" }}}

" vimshell {{{
    let g:vimshell_temporary_directory = expand('~/.vim/tmp/plugin/.vimshell')
    " シェルを起動
    nnoremap <silent> ,vs :<C-u>VimShell<CR>
    " pythonを非同期で起動
    nnoremap <silent> ,vp :<C-u>VimShellInteractive python<CR>
    " irbを非同期で起動
    nnoremap <silent> ,vr :<C-u>VimShellInteractive irb<CR>
    " 非同期で開いたインタプリタに現在の行を評価させる
    vmap <silent> ,ss :<C-u>VimShellSendString<CR>
    " 選択中に,ss: 非同期で開いたインタプリタに選択行を評価させる
    nnoremap <silent> ,ss <S-v>:<C-u>VimShellSendString<CR>
" }}}

" quickrun.vim {{{
    "let mapleader = ' e'
    au Filetype ruby nnoremap <buffer><leader> :!ruby %<Space>
    au Filetype php nnoremap <buffer><leader> :!php %<Space>
    au Filetype perl nnoremap <buffer><leader> :!perl %<Space>
    au Filetype python nnoremap <buffer><leader> :!python %<Space>
    au Filetype sh nnoremap <buffer><leader> :!sh %<Space>
    au Filetype scala nnoremap <buffer><leader> :!scala %<Space>
    au Filetype zsh nnoremap <buffer><leader> :!zsh %<Space>
    au Filetype haskell nnoremap <buffer><leader> :!runghc %<Space>
    au Filetype scheme nnoremap <buffer><leader> :!gosh %<Space>
    au Filetype javascript nnoremap <buffer><leader> :!js %<Space>
    au Filetype vim nnoremap <silent><leader> :source %<Return>
    let g:quickrun_config = {
    \   'markdown': {
    \     'type': 'markdown/gfm',
    \     'outputter': 'browser'
    \   }
    \ }
" }}}

" neocomplcache.vim {{{
    let g:acp_enableAtStartup = 0                        " Disable AutoComplPop.
    let g:neocomplcache_enable_at_startup = 1            " Use neocomplcache.
    let g:neocomplcache_enable_smart_case = 1            " Use smartcase.
    let g:neocomplcache_enable_camel_case_completion = 1 " Use camel case completion
    let g:neocomplcache_enable_underbar_completion = 1   " Use underbar completion.
    let g:neocomplcache_min_syntax_length = 3            " Set minimum syntax keyword length.
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplcache_temporary_dir = $HOME . '/.vim/tmp/plugin/.neocon'
    "let g:neocomplcache_enable_auto_select = 1           " AutoComplPop like behavior.
    "let g:NeoComplCache_SkipInputTime = '1.5'            " 勝手にオムニ補完しない時間を設定

    " Recommended key-mappings.
    " inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>" " doesn't work o_O
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()
    inoremap <expr><C-e> neocomplcache#cancel_popup()
    " inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><C-l> neocomplcache#complete_common_string()

    let tmp = '~/.vim/bundle/snipmate.vim/snippets'
    if isdirectory(tmp)
        let g:neocomplcache_snippets_dir = tmp;
    endif

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" }}}

" unite.vim {{{
    let g:unite_data_directory = expand('~/.vim/tmp/plugin/.unite')
    let g:unite_source_grep_default_opts = '-Hn --color=never'
    if executable('ack-grep')
        let g:unite_source_grep_command = 'ack-grep'
        let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    endif
    " 入力モードで開始する
    "let g:unite_enable_start_insert=1
    " バッファ一覧
    nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
    " ファイル一覧
    nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    " レジスタ一覧
    nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
    " 最近使用したファイル一覧
    nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
    " 常用セット
    nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
    " 全部乗せ
    nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
    " ウィンドウを分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
    " ウィンドウを縦に分割して開く
    au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    " ESCキーを2回押すと終了する
    au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
    au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

    " <C-k> にマッピング http://vim-users.jp/2010/11/hack185/
    imap <C-k> <Plug>(neocomplcache_snippets_expand)
    smap <C-k> <Plug>(neocomplcache_snippets_expand)
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
" }}}

" unite-plugins {{{
    " cnoremap UH Unite help<Enter>
    " cnoremap UO Unite outline<Enter>
    " cnoremap UC Unite colorscheme<Enter>
    " cnoremap UF Unite font<Enter>
" }}}

" vimfiler {{{
    "nmap [Space]v <Plug>(vimfiler_switch)
    nnoremap <silent> [Space]v :<C-u>VimFiler<CR>
    nnoremap [Space]ff :<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle<CR>

    " call vimfiler#set_execute_file('vim', ['vim', 'notepad'])
    " call vimfiler#set_execute_file('txt', 'vim')

    let g:vimfiler_enable_clipboard = 0
    let g:vimfiler_safe_mode_by_default = 0
    let g:vimshell_cd_command = 'TabpageCD'
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_detect_drives = s:iswin ? [
          \ 'C:/', 'D:/', 'E:/', 'F:/', 'G:/', 'H:/', 'I:/',
          \ 'J:/', 'K:/', 'L:/', 'M:/', 'N:/'] :
          \ split(glob('/mnt/*'), '\n') + split(glob('/media/*'), '\n') +
          \ split(glob('/Users/*'), '\n')

    " if s:iswin
    " " Use trashbox.
      " let g:unite_kind_file_use_trashbox = 1
    " else
    " " Like Textmate icons.
      " let g:vimfiler_tree_leaf_icon = ' '
      " let g:vimfiler_tree_opened_icon = '▾'
      " let g:vimfiler_tree_closed_icon = '▸'
      " let g:vimfiler_file_icon = '-'
      " let g:vimfiler_marked_file_icon = '*'
    " endif
    " see keybind: http://d.hatena.ne.jp/h1mesuke/20100611/p1
" }}}

" ack.vim {{{
" }}}

" snipmate.vim {{{
    "inoremap <silent> <c-b> <c-r>=TriggerSnippet()<cr>
    "snoremap <silent> <c-b> <esc>i<right><c-r>=TriggerSnippet()<cr>
" }}}

" jslint.vim {{{
    augroup MyGroup
      autocmd! MyGroup
      autocmd FileType javascript call s:javascript_filetype_settings()
    augroup END

    function! s:javascript_filetype_settings()
      autocmd BufLeave     <buffer> call jslint#clear()
      autocmd BufWritePost <buffer> call jslint#check()
      autocmd CursorMoved  <buffer> call jslint#message()
    endfunction
" }}}

" open-browser.vim {{{
    nmap <Leader>w :<C-u>call openbrowser#_keymapping_smart_search('n')<CR>
" }}}

" gitgutter {{{
    nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
    nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
" }}}

" ruby-hredoc-syntax {{{
    let g:ruby_heredoc_syntax_filetypes = {
            \ "xml" : {
            \   "start" : "XML",
            \},
      \}
" }}}

" markdown-quote-syntax {{{
    let g:markdown_quote_syntax_filetypes = {
            \ "coffee" : {
            \   "start" : "coffee",
            \},
            \ "css" : {
            \   "start" : "\\%(css\\|scss\\)",
            \},
            \ "mustache" : {
            \   "start" : "mustache",
            \},
            \ "haml" : {
            \   "start" : "haml",
            \},
            \ "slim" : {
            \   "start" : "slim",
            \},
            \ "markdown" : {
            \   "start" : "markdown",
            \},
            \ "php" : {
            \   "start" : "php",
            \},
      \}
" }}}

" vim-over {{{
    nnoremap <silent> <Leader>g :OverCommandLine<CR>%s/
" }}}

" vim-operator-surround {{{
    " operator mappings
    map <silent>sa <Plug>(operator-surround-append)
    map <silent>sd <Plug>(operator-surround-delete)
    map <silent>sr <Plug>(operator-surround-replace)

    " delete or replace most inner surround

    " if you use vim-textobj-multiblock
    nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
    nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)

    " if you use vim-textobj-anyblock
    nmap <silent>sdd <Plug>(operator-surround-delete)<Plug>(textobj-anyblock-a)
    nmap <silent>srr <Plug>(operator-surround-replace)<Plug>(textobj-anyblock-a)

    " if you use vim-textobj-between
    nmap <silent>sdb <Plug>(operator-surround-delete)<Plug>(textobj-between-a)
    nmap <silent>srb <Plug>(operator-surround-replace)<Plug>(textobj-between-a)
" }}}

