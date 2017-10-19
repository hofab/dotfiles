" custom mapping to my liking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j

" shortcuts to make my life easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ;; :w<CR>
map ;t :vs<CR><C-L>:Files<CR>
map ;o :tabe<CR>:Files<CR>
map ;h :split <CR>
" no search highlighting until next search
map ;s :noh <CR>
" paste yanked text over word
map ;v ciw<C-r>0<ESC>
" copy word to clipboard
nnoremap ;cc "+yiw
vnoremap ;cc "+y

" custom inputs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doxygen line comment
map ;dc $a<TAB>/**<  */<ESC>2hi
map ;lc $a<TAB>/*  */<ESC>2hi
" surround code with if-statement
vmap ;if d<ESC>iif(){<CR>}<ESC>kpk3li
