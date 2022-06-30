" key bindings

" fix window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" commenting
nmap <silent> <C-_> <plug>NERDCommenterToggle
vmap <silent> <C-_> <plug>NERDCommenterToggle

" copy to system clipboard via <Ctrl-c> in visual mode.
vnoremap <C-c> "+y

" select all
nnoremap <C-a> ggVG

" split window vertically
nnoremap <silent> <C-\> :vsplit<CR><C-w>l
nnoremap <silent> <C-w>s :split<CR><C-w>j

" close window
nnoremap <C-q> :q<CR>

" save file
nnoremap <C-s> :lua vim.lsp.buf.format()<CR>:w<CR>
imap <c-s> <Esc>:lua vim.lsp.buf.format()<CR>:w<CR>a

" fix jump list
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" line moving dark-art
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ctrl v is taken on linux for paste
nmap <C-m> <C-v>


" fix visual mode
vmap $ g_


