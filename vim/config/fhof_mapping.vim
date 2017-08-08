" custom mapping to my liking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j

" shortcuts to make my life easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ;; :w <CR>
map ;t :tabe <CR>
map ;o :tabe<CR>:e
map ;h :split <CR>
" no search highlighting until next search
map ;s :noh <CR>
" paste yanked text over word
map ;v ciw<C-r>0<ESC>
" copy word to clipboard
nnoremap <F4> "+yiw
vnoremap <F4> "+y

" custom inputs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doxygen line comment
map ;dc $a<TAB>/**<  */<ESC>2hi
" surround code with if-statement
vmap ;if d<ESC>iif(){<CR>}<ESC>kpk3li
