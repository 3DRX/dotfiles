set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader=" "
set number
filetype on
filetype indent on
filetype plugin on
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set scrolloff=200
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
set updatetime=50
set undodir=~/.vim/undodir
set undofile
set mouse=
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,bg18030,latin1
set cmdheight=0
set clipboard+=unnamedplus

"------------------------------------------------------------------------------------
" imports
runtime ./plug.vim
runtime ./keybinding.vim
runtime ./plugins/gitgutter.vim
lua require("init")

if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=5
    set background=dark
endif
hi Normal ctermbg=256
hi clear LineNr
