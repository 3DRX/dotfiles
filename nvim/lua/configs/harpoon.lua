local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>mm', '<cmd>lua require("harpoon.mark").add_file()<cr>', opts)
vim.keymap.set('n', '<leader>fm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
