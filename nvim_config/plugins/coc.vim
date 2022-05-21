"settings for coc
" complition
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>""
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<c-g>u\<CR>"
:echo exists('&tagfunc')

" navigation & action
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" diagnostics
nmap <silent> <leader>a :CocDiagnostics<CR>

" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')

" settings of c/cpp highlight
"let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
"let g:cpp_class_decl_highlight = 1
"let g:cpp_posix_standard = 1
"let g:cpp_experimental_simple_template_highlight = 1
"let g:cpp_concepts_highlight = 1
