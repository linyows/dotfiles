" MAPPING

":noremap  ノーマルモード、ビジュアルモード、オペレータ待機モード
":vnoremap ビジュアルモード
":nnoremap ノーマルモード
":onoremap オペレータ待機モード
":noremap! インサートモード、コマンドライン
":inoremap インサートモード
":cnoremap コマンドライン

" .vimrc {{{
    " reload .vimrc
    nnoremap <Leader>s. :<C-u>source $MYVIMRC<Enter>
" }}}

" Help {{{
    " helpを引きやすく
    nnoremap <C-h> :<C-u>help<Space>
    " カーソル下のキーワードでhelpを引く
    nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>
" }}}

" Moving {{{
    "nnoremap <Space>j <C-f>" 次表示
    "nnoremap <Space>k <C-b>" 前表示
" }}}

" Encording {{{
    " ファイルをshift_jisで改行コードをCRLFにする
    nnoremap <Space>w :<C-u>set ff=dos fenc=shift_jis<Enter>
    " ファイルをutf-8で改行コードをLFにする
    nnoremap <Space>u :<C-u>set ff=unix fenc=utf-8<Enter>
    " euc-jpで開く
    nnoremap <Space>e :<C-u>e ++enc=euc-jp<Enter>
    " euc-jpにする
    nnoremap <Space>E :<C-u>set fileencoding=euc-jp<Enter>
" }}}

" Window {{{
    " 次のウインドウに移動
    nnoremap <Space>l <C-w>w<Enter>
    " 前のウインドウに移動
    nnoremap <Space>h <C-w>p<Enter>
    " 垂直分割でウインドウを作る
    nnoremap <Space>n <C-w>v<Enter>
    " ウインドウを閉じる
    nnoremap <Space>d <C-w>q<Enter>
    "nnoremap <Space>a :hide<Enter>" 現在のウインドウを閉じる
    "nnoremap <Space>a :only<Enter>" ほかのウインドウをすべて閉じる
" }}}

" Tab {{{
    " 新規タブを開く
    nnoremap <Space>t :<C-u>tabnew<Enter>
    " 左のタブへ移動
    nnoremap <Space>hh :<C-u>tabp<Enter>
    " 右のタブへ移動
    nnoremap <Space>ll :<C-u>tabn<Enter>
" }}}

" Completion {{{
    " omni補完
    imap <Space>o <C-x><C-o>
    "inoremap <A-(> ()<LEFT>" (), {} 補完
    "inoremap <A-{> <ESC>A<SPACE>{}<Left><CR><ESC>O
    "nnoremap <A-{> A<SPACE>{}<Left><CR><ESC>O
" }}}

" Color {{{
    " see@http://d.hatena.ne.jp/connvoi_tyou/20080306
    " 今、何色を表示できるのか表示
    noremap <Leader>ca so $VIMRUNTIME/syntax/colortest.vim<Enter>
    " 今の色設定を表示
    noremap <Leader>cs so $VIMRUNTIME/syntax/hitest.vim<Enter>
" }}}

" Others {{{
    " 空行を挿入
    "nnoremap <Space>0 :<C-u>call append(expand('.'), '')<Cr>j
    " 検索ハイライトを非表示
    nnoremap <Esc><Esc> :<C-u>nohlsearch<Enter>
    " vimをバックグラウンドへ
    nnoremap <Space>bg :<C-u>suspend<Enter>
    " ruby hash rocket to 1.9 syntax
    vnoremap <silent> <C-h> :s/:\([a-zA-Z0-9_]\+\)\s*=>/\1:/g<CR>
    " for miss type
    inoremap <silent> jj <ESC>
" }}}
