set runtimepath^=~/.vim
let &packpath = &runtimepath

let mapleader=" "

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
syntax on
filetype on
filetype indent on
filetype plugin on
set cursorline
set noerrorbells
set vb t_vb=
set belloff=all
set number
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set scrolloff=900
set scroll=4
set nocursorline
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
set updatetime=50
set undofile
colorscheme torte
highlight Normal ctermbg=256
"encoding
set encoding=UTF-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,bg18030,latin1
set backspace=indent,eol,start

" key bindings

" copy to system clipboard via <Ctrl-c> in visual mode.
vnoremap <C-c> "+y
" select all
nnoremap <C-a> ggVG
" close window
nnoremap <C-q> :q<CR>
" save file
nnoremap <C-s> :wa<CR>

" fix jump list
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" line moving dark-art
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fix visual mode
vmap $ g_

" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" split window vertically
nnoremap <silent> <C-\> :vsplit<CR><C-w>l
nnoremap <silent> <C-w>s :split<CR><C-w>j

" file manager
nmap <C-b> :Sex!<CR><C-w>l<C-q>
" augroup InitNetrw
"       autocmd!
"         autocmd VimEnter * :silent! Explore
" augroup END

" brackets
function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')
inoremap <expr> ` ConditionalPairMap('`', '`')
inoremap <expr> ' ConditionalPairMap('''', '''')
inoremap <expr> " ConditionalPairMap('"', '"')
inoremap <expr> $ ConditionalPairMap('$', '$')


map <C-f> <Nop>
nmap <C-f> ggVG=<C-o><C-o>
