" Using lua functions
nnoremap <leader>f :vs<CR><C-W>l<cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <LEADER>t :call CheckGitRepository()<CR>

" grep
nnoremap <leader>rg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

" git
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gs :lua require('fhof.telescope').git_branches()<CR>

" check buffers
nnoremap <leader>cb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ch <cmd>lua require('telescope.builtin').help_tags()<cr>

" check dotfiles
nnoremap <leader>cd :lua require('fhof.telescope').search_dotfiles()<CR>

" check Notes
nnoremap <leader>cn :lua require('fhof.telescope').search_notes()<CR>

" grep for word und cursor
nnoremap <leader>cw :lua require('telescope.builtin').grep_string({silent = true, noremap = true})<CR>

" check GNB
nnoremap <leader>cg :lua require('fhof.telescope').search_gnb()<CR>

" check mission
nnoremap <leader>cm :lua require('fhof.telescope').search_mission()<CR>

function! CheckGitRepository()
    let current_dir = expand('%:p:h')

    " Check if the directory is a Git repository
    if system("git rev-parse --is-inside-work-tree") ==# "true\n"
        " Directory is a Git repository
        :tabe | execute "lua require('telescope.builtin').git_files()"
    else
        " Directory is not a Git repository
        :tabe | execute "lua require('telescope.builtin').find_files()"
    endif
endfunction


