" custom leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<SPACE>"
" custom mapping to my liking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j

" shortcuts to make my life easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>w :w<CR>
nmap <LEADER>f :vs<CR><C-L>:Files<CR>
nmap <LEADER>o :Files<CR>
nmap <LEADER>q :q<CR>
nmap <LEADER>sq :wq<CR>
nmap <LEADER>c :qa<CR>
nmap <LEADER>t :tabe<CR>:Files<CR>
nmap <LEADER>h :split <CR>
" no search highlighting until next search
nmap <LEADER>s :noh <CR>
" paste yanked text over word
nmap <LEADER>v ciw<C-r>0<ESC>
" copy word to clipboard
nnoremap <LEADER>cc "+yiw
vnoremap <LEADER>cc "+y

" custom inputs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doxygen line comment
map <LEADER>dc $a<TAB>/**<  */<ESC>2hi
map <LEADER>lc $a<TAB>/*  */<ESC>2hi
" surround code with if-statement
vmap <LEADER>if d<ESC>iif(){<CR>}<ESC>kpk3li

" use clang format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ClFormatOnSave()
  let l:formatdiff = 1
  pyf /usr/share/clang/clang-format.py
endfunction

if filereadable("/usr/share/clang/clang-format.py")
    function! ClFormatOnSave()
      let l:formatdiff = 1
      pyf /usr/share/clang/clang-format.py
    endfunction
    autocmd BufWritePre *.h,*.cc,*.cpp,*.c call ClFormatOnSave()

    map <C-K> :pyf /usr/share/clang/clang-format.py<cr>
    imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
else
    if filereadable("/usr/share/clang/clang-format-6.0/clang-format.py")
    function! ClFormatOnSave()
      let l:formatdiff = 1
      pyf /usr/share/clang/clang-format-6.0/clang-format.py
    endfunction

        map <C-K> :pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
        imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
    endif
endif

