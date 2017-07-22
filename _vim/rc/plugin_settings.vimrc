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
    "nmap <C-p> <Plug>(yankround-prev)
    "nmap <C-n> <Plug>(yankround-next)
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

" gtags.vim {{{
    map <C-g> :Gtags 
    map <C-h> :Gtags -f %<CR>
    map <C-j> :GtagsCursor<CR>
    map <C-n> :cn<CR>
    map <C-p> :cp<CR>
" }}}

" unite-tag {{{
    "noremap <silent> <C-]> :<C-u>Unite tags:<C-r>=expand('<cword>')<CR><CR>
    noremap <silent> <C-]> :<C-u>Unite -immediately -no-start-insert tags:<C-r>=expand('<cword>')<CR><CR>
    autocmd BufEnter *
    \  if empty(&buftype)
    \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
    \| endif
    autocmd BufEnter *
    \  if empty(&buftype)
    \|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
    \| endif
    nnoremap <silent> ,t :<C-u>Unite tag<CR>
" }}}

" taglist.vim {{{
    " 関数一覧
    set tags=tags
    "set tags+=~/.tags
    let Tlist_Ctags_Cmd = '/Applications/MacVim.app/Contents/MacOS/ctags' " ctagsのパス
    let Tlist_Show_One_File = 1               " 現在編集中のソースのタグしか表示しない
    let Tlist_Exit_OnlyWindow = 1             " taglistのウィンドーが最後のウィンドーならばVimを閉じる
    let Tlist_Use_Right_Window = 1            " 右側でtaglistのウィンドーを表示
    let Tlist_Enable_Fold_Column = 1          " 折りたたみ
    let Tlist_Auto_Open = 0                   " 自動表示
    let Tlist_Auto_Update = 1
    let Tlist_WinWidth = 30
    map <silent> <leader>l :Tlist<CR>        " taglistを開くショットカットキー
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

" rspec-result-syntax {{{
    let g:quickrun_config['ruby.rspec'] = {
      \'command'                  : 'rspec',
      \'cmdopt'                   : '-cfd',
      \'args'                     : "%{line('.')}",
      \'exec'                     : ['bundle exec %c %o %s:%a'],
      \'outputter/buffer/filetype': 'rspec-result',
      \'filetype'                 : 'rspec-result'
      \}
    augroup RSpec
      autocmd!
      autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
    augroup END

    let g:quickrun_config['ruby.serverspec'] = {
      \'command'                  : 'rspec',
      \'cmdopt'                   : '-cfd',
      \'args'                     : "%{line('.')}",
      \'exec'                     : ['bundle exec %c %o %s:%a'],
      \'outputter/buffer/filetype': 'rspec-result',
      \'filetype'                 : 'rspec-result'
      \}
    augroup Serverspec
      autocmd!
      autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.serverspec
    augroup END
" }}}

" neocomplcache.vim {{{
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplcache#smart_close_popup() . "\<CR>"
    endfunction
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()

    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    if !exists('g:neocomplcache_force_omni_patterns')
      let g:neocomplcache_force_omni_patterns = {}
    endif
    "let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" }}}

" neosnippet.vim {{{
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

    " For snippet_complete marker.
    "if has('conceal')
    "  set conceallevel=2 concealcursor=i
    "endif

    " Enable snipMate compatibility feature.
    "let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell Neosnippet about the other snippets
    "let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}

" snippets {{{
    let g:neosnippet#snippets_directory =
      \'~/.vim/snippets,~/.vim/bundle/vim-go/gosnippets/snippets,~/.vim/bundle/serverspec-snippets,~/.vim/bundle/neosnippet_chef_recipe_snippet/autoload/neosnippet/snippets'
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
"    augroup MyGroup
"      autocmd! MyGroup
"      autocmd FileType javascript call s:javascript_filetype_settings()
"    augroup END
"
"    function! s:javascript_filetype_settings()
"      autocmd BufLeave     <buffer> call jslint#clear()
"      autocmd BufWritePost <buffer> call jslint#check()
"      autocmd CursorMoved  <buffer> call jslint#message()
"    endfunction
" }}}

" typescript-vim {{{
    let g:typescript_indent_disable = 1
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

" codic-vim {{{
" https://gist.github.com/sgur/4e1cc8e93798b8fe9621
  inoremap <silent> <C-x><C-t>  <C-R>=<SID>codic_complete()<CR>
  function! s:codic_complete()
    let line = getline('.')
    let start = match(line, '\k\+$')
    let cand = s:codic_candidates(line[start :])
    call complete(start +1, cand)
    return ''
  endfunction
  function! s:codic_candidates(arglead)
    let cand = codic#search(a:arglead, 30)
    " error
    if type(cand) == type(0)
      return []
    endif
    " english -> english terms
    if a:arglead =~# '^\w\+$'
      return map(cand, '{"word": v:val["label"], "menu": join(map(copy(v:val["values"]), "v:val.word"), ",")}')
    endif
    " japanese -> english terms
    return s:reverse_candidates(cand)
  endfunction
  function! s:reverse_candidates(cand)
    let _ = []
    for c in a:cand
      for v in c.values
        call add(_, {"word": v.word, "menu": !empty(v.desc) ? v.desc : c.label })
      endfor
    endfor
    return _
  endfunction
" }}}

" vim-go {{{
    au FileType go map ,g :w\|:!go run %<cr>
    au FileType go map ,t :w\|:!go test %<cr>

    if isdirectory('/usr/local/opt/go/libexec')
        let g:go_fmt_command = 'goimports'
        set rtp^=/usr/local/opt/go/libexec/misc/vim
    endif

    if isdirectory($GOPATH)
        exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
        set completeopt=menu,preview
        au BufWritePre *.go :GoFmt
        au BufNewFile,BufRead *.go set sw=2 noexpandtab ts=2
        "exe "set rtp+=".globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
        "autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
    endif

    au FileType go compiler go
    " not showing tab-indent if golang
    au FileType go set listchars=tab:\ \ 
    au FileType go highlight NonText ctermbg=NONE ctermfg=DarkGreen
    au FileType go highlight SpecialKey ctermbg=NONE ctermfg=DarkBlue
    au FileType go auto BufWritePre * :%s/'/"/ge

    let g:go_snippet_engine = 'neosnippet'
    "let g:go_play_open_browser = 0
    "let g:go_fmt_fail_silently = 1
    "let g:go_fmt_autosave = 0
    au FileType go nmap <Leader>i <Plug>(go-info)
    au FileType go nmap <Leader>gd <Plug>(go-doc)
    au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
    au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
    au FileType go nmap <leader>r <Plug>(go-run)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dt <Plug>(go-def-tab)

    autocmd FileType go :highlight goErr cterm=none ctermfg=DarkYellow
    autocmd FileType go :match goErr /\<err\>/
" }}}

" clang-gormat {{{
    let g:clang_format#style_options = {
            \ "BasedOnStyle": "LLVM",
            \ "IndentWidth": 2,
            \ "ColumnLimit": 100,
            \ "BreakBeforeBraces": "Linux",
            \ "AllowShortFunctionsOnASingleLine": "None"}
    " map to <Leader>cf in C++ code
    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    " if you install vim-operator-user
    autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
    " Toggle auto formatting:
    nmap <Leader>C :ClangFormatAutoToggle<CR>
    autocmd FileType c ClangFormatAutoEnable
" }}}
