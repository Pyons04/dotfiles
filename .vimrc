" vimをvi互換モードで動作させない
 set nocompatible
" setting
 set fenc=utf-8
"  バックアップファイルを作らない
 set nobackup
"  スワップファイルを作らない
 set noswapfile
"  編集中のファイルが変更されたら自動で読み直す
 set autoread
 " バッファが編集中でもその他のファイルを開けるように
 set hidden
 " 入力中のコマンドをステータスに表示する
 set showcmd
"
"
 " 見た目系
 " 行番号を表示
 set number
 " 現在の行を強調表示
 set cursorline
 " 現在の行を強調表示（縦）
 set cursorcolumn
 " 行末の1文字先までカーソルを移動できるように
 set virtualedit=onemore
"  インデントはスマートインデント
 set smartindent
" " ビープ音を可視化
 set visualbell
" " 括弧入力時の対応する括弧を表示
 set showmatch
" " ステータスラインを常に表示
 set laststatus=2
" " コマンドラインの補完
 set wildmode=list:longest
" " 折り返し時に表示行単位での移動できるようにする
 nnoremap j gj
 nnoremap k gk
" " シンタックスハイライトの有効化
 syntax enable
"
"
" " Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
" set list listchars=tab:\▸\-
" " Tab文字を半角スペースにする
 set expandtab
" " 行頭以外のTab文字の表示幅（スペースいくつ分）
 set tabstop=2
" " 行頭でのTab文字の表示幅
 set shiftwidth=2
"
"
" " 検索系
" " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
 set ignorecase
" " 検索文字列に大文字が含まれている場合は区別して検索する
 set smartcase
" " 検索文字列入力時に順次対象文字列にヒットさせる
 set incsearch
" " 検索時に最後まで行ったら最初に戻る
 " set wrapscan
" " 検索語をハイライト表示
 set hlsearch
" " ESC連打でハイライト解除
 nmap <Esc><Esc> :nohlsearch<CR><Esc>
" NERD Treeをctrl + eで起動
 nnoremap <silent><C-e> :NERDTreeToggle<CR>
 "全角スペースの可視化
"augroup highlightIdegraphicSpace
"  autocmd!
"  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END



"NeoBundle Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=/home/pyons/.vim/bundle/neobundle.vim

    " Required:
    call neobundle#begin(expand('/home/pyons/.vim/bundle'))

    " Let NeoBundle manage NeoBundle
    " Required:
    NeoBundleFetch 'Shougo/neobundle.vim'

    " Add or remove your Bundles here:
    NeoBundle 'Shougo/neosnippet.vim'
    NeoBundle 'Shougo/neosnippet-snippets'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'ctrlpvim/ctrlp.vim'
    NeoBundle 'flazz/vim-colorschemes'
    NeoBundle 'scrooloose/nerdtree' " ファイルツリー表示
    NeoBundle 'tpope/vim-endwise' " Ruby用end補完
    NeoBundle 'neoclide/coc.nvim', 'release', { 'build': { 'others': 'git checkout release' } }
    NeoBundle 'itchyny/lightline.vim'
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'jistr/vim-nerdtree-tabs'
    NeoBundle 'ngmy/vim-rubocop'
    NeoBundle 'scrooloose/syntastic.git'
    NeoBundle 'kana/vim-operator-user'
    NeoBundle 'haya14busa/vim-operator-flashy'
    " NeoBundle 'vim-airline/vim-airline'
    " to use coc.vim, :CocInstall coc-solargraph and gem install solargraph
    " required.

    " You can specify revision/branch/tag.
    NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

    " Required:
    call neobundle#end()

    " Required:
    filetype plugin indent on

    " If there are uninstalled bundles found on startup,
    " this will conveniently prompt you to install them.
    NeoBundleCheck
"End NeoBundle Scripts-------------------------
"enabel coc.nvim start
let g:coc_global_extensions = ['coc-solargraph']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"enable coc.nvim finish
"Airline settings
colorscheme molokai
set term=xterm-256color
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set termguicolors
set noshowmode
set backspace=indent,eol,start

"rubocop settings 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['rubocop', 'mri']
"rubocop settings end

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

map <C-e> <plug>NERDTreeTabsToggle<CR>
nnoremap <C-t> :tabnew<CR>

map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#tagbar#flags = 'f'
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#branch#empty_message = ''
"let g:airline#extensions#branch#displayed_head_limit = 10
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#virtualenv#enabled = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline_theme = 'dark'
"imap <M-h> <Left> 
"imap <M-j> <Down> 
"imap <M-k> <Up>
"imap <M-l> <Right>
"set term=builtin_ansi
