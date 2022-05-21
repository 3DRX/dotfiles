"vimspector settings
let g:vimspector_enable_mappings='HUMAN'
nnoremap <C-m> :call vimspector#ToggleBreakpoint()<CR>
nnoremap <C-n> :call vimspector#Launch()<CR>
nnoremap <leader>mm :call vimspector#StepInto()<CR>
nnoremap <leader>nn :call vimspector#Continue()<CR>
"packadd! vimspector
