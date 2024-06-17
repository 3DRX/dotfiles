" key bindings

" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" select all
nnoremap <C-a> ggVG

" split window vertically
nnoremap <silent> <C-\> :vsplit<CR><C-w>l
nnoremap <silent> <C-w>s :split<CR><C-w>j

" close window
nnoremap <silent> <C-q> :q<CR>

" save file
nnoremap <silent> <C-s> :w<CR>
imap <silent> <c-s> <Esc>:w<CR>a

" line moving dark-art
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fix visual mode
vmap $ g_

" Do not yank with x
nnoremap x "_x

" Resize window
nnoremap <C-w>h <C-w>>
nnoremap <C-w>j <C-w>-
nnoremap <C-w>k <C-w>+
nnoremap <C-w>l <C-w><

map <C-f> <Nop>
nmap <C-f> ggVG=<C-o>

xnoremap p P
