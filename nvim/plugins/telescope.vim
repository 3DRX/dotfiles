" telescope settings
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

