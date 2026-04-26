local map = vim.keymap.set

-- Window switching.
map("n", "<C-j>", "<C-w>j", { noremap = true })
map("n", "<C-h>", "<C-w>h", { noremap = true })
map("n", "<C-k>", "<C-w>k", { noremap = true })
map("n", "<C-l>", "<C-w>l", { noremap = true })

map("n", "<C-a>", "ggVG", { noremap = true })
map("n", "<C-\\>", ":vsplit<CR><C-w>l", { noremap = true, silent = true })
map("n", "<C-w>s", ":split<CR><C-w>j", { noremap = true, silent = true })
map("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

map("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
map("v", "$", "g_", { noremap = true })
map("n", "x", '"_x', { noremap = true })

map("n", "<C-w>h", "<C-w>>", { noremap = true })
map("n", "<C-w>j", "<C-w>-", { noremap = true })
map("n", "<C-w>k", "<C-w>+", { noremap = true })
map("n", "<C-w>l", "<C-w><", { noremap = true })

map({ "n", "x" }, "<C-f>", "<Nop>", { noremap = true })
map("n", "<C-f>", "ggVG=<C-o>", { noremap = true })
map("x", "p", "P", { noremap = true })
