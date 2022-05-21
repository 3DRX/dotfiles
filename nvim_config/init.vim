set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader=" "

"------------------------------------------------------------------------------------
" imports
runtime ./plug.vim
runtime ./keybinding.vim
runtime ./plugins/coc.vim
runtime ./plugins/nerdtree.vim
runtime ./plugins/telescope.vim
runtime ./plugins/vimspector.vim
runtime ./plugins/NERDCommenter.vim
runtime ./plugins/gitgutter.vim
runtime ./plugins/formatting.vim


"------------------------------------------------------------------------------------

set number
set relativenumber
set cmdheight=2
filetype on
filetype indent on
filetype plugin on
set tabstop=4
set expandtab
%retab
set shiftwidth=4
set softtabstop=4
set scrolloff=200
set scroll=4
"set cursorline
"set cursorcolumn
set autoindent
set smarttab
set incsearch
set showmatch
set nohlsearch
set matchtime=5
set nowrap
set ignorecase
set nobackup
set nowritebackup
set updatetime=300
set undodir=~/.vim/undodir
set undofile
"encoding
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,bg18030,latin1

" look
let g:airline_theme='papercolor'
colorscheme gruvbox
"set background=dark
" setting transparent vim
hi Normal ctermfg=none ctermbg=none

"settings of indentLine
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
