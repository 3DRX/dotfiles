" key bindings

" window switching
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
nnoremap <C-s> :wa<CR>
imap <c-s> <Esc>:wa<CR>a

" fix jump list
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" line moving dark-art
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fix visual mode
vmap $ g_

" Do not yank with x
:lua vim.keymap.set('n', 'x', '"_x')

" Increment/decrement
:lua vim.keymap.set('n', '+', '<C-a>')
:lua vim.keymap.set('n', '-', '<C-x>')

" Resize window
:lua vim.keymap.set('n', '<C-w>h', '<C-w>>')
:lua vim.keymap.set('n', '<C-w>l', '<C-w><')
:lua vim.keymap.set('n', '<C-w>k', '<C-w>+')
:lua vim.keymap.set('n', '<C-w>j', '<C-w>-')

