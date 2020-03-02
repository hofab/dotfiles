"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom constants all upper case with underscores
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match custConstant /\<\u[A-Z0-9]\+_[A-Z_0-9]\+\|\>\u[A-Z0-9]\+/
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match custInterface /\<\u[A-Z0-9]\+_[A-Z_]*IF\>/

" Default highlighting (see help :highlight and help :highlight-link)
" highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight def link multiple_cursors_visual Search
