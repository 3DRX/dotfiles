set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let mapleader=" "

"------------------------------------------------------------------------------------
" imports
runtime ./plug.vim
runtime ./keybinding.vim
runtime ./plugins/nerdtree.vim
runtime ./plugins/telescope.vim
runtime ./plugins/NERDCommenter.vim
runtime ./plugins/gitgutter.vim
"runtime ./colors/NeoSolarized.vim
lua require('init')

"------------------------------------------------------------------------------------

set number
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

"neovide
set guifont=DejaVuSansMono\ Nerd\ Font:h20
let g:neovide_transparency=0.6

" colorscheme
let g:airline_theme='papercolor'
if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=5
    set background=dark
    "" Use NeoSolarized
    "let g:neosolarized_termtrans=1
    "let g:neosolarized_contrast="high"
    "runtime ./colors/NeoSolarized.vim
    "colorscheme NeoSolarized
    "" Use TokyoNight
    let g:tokyonight_transparent=1
    let g:tokyonight_colors = {
                \ 'comment' : 'red',
                \ }
    colorscheme tokyonight
endif
hi Normal ctermfg=none ctermbg=none 
highlight clear LineNr

"settings of indentLine
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

