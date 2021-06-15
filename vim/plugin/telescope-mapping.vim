" Using lua functions
nnoremap <leader>f :vs<CR><C-W>l<cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <LEADER>t :tabe<CR><cmd>lua require('telescope.builtin').find_files()<cr>

" grep
nnoremap <leader>rg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" git
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gc :lua require('fhof.telescope').git_branches()<CR>

" check buffers
nnoremap <leader>cb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ch <cmd>lua require('telescope.builtin').help_tags()<cr>

" check dotfiles
nnoremap <leader>cd :lua require('fhof.telescope').search_dotfiles()<CR>

" check Notes
nnoremap <leader>cn :lua require('fhof.telescope').search_notes()<CR>

