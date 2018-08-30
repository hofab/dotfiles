" custom leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<SPACE>"
let localleader = "'"
" custom mapping to my liking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j

" shortcuts to make my life easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>[ <S-V>i{<C-K>
nnoremap <LEADER>cs :!cscope -bcqR<CR><ESC> :cs reset<CR><ESC>
nmap <LEADER>f :vs<CR><C-L>:Files<CR>
nmap <LEADER>o :Files<CR>
nmap <LEADER>s <C-Z>
nmap <LEADER>q :qa<CR>
nmap <LEADER>t :tabe<CR>:Files<CR>
nmap <LEADER>h :split <CR>
nmap <LEADER>ut :UndotreeToggle <CR>
" delete to beginning of the line and join with line above
nmap <LEADER>j d0kJ<CR>
" no search highlighting until next search
nmap <LEADER>dh :noh <CR>
" paste yanked text over word
nmap <LEADER>v ciw<C-r>0<ESC>
" copy word to clipboard
nnoremap <LEADER>cc "+yiw
vnoremap <LEADER>cc "+y
nnoremap <LEADER>r *<ESC>:%s///g<left><left>
nnoremap <LEADER>ggt :GitGutterSignsToggle<CR>
"map ; to :
nnoremap ; :

" deoplete mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap <expr> <C-n>  deoplete#mappings#manual_complete()

" variable dispatch command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>mk :Dispatch make -f MakePldMx15Zn_CMX SW_PN=76589 SW_VER=01 SW_REV=X -j

" custom inputs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" doxygen line comment
map <LEADER>dc $a<TAB>/**<  */<ESC>2hi
map <LEADER>lc $a<TAB>/*  */<ESC>2hi
" surround code with if-statement
vmap <LEADER>if d<ESC>iif(){<CR>}<ESC>kpk3li


" use cscope as default
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=cscope
    set csto=0
    set cst
    " add any database in current directory
    " if filereadable("cscope.out")
    "     silent cs add cscope.out
    " " else add database pointed to by environment
    " elseif $CSCOPE_DB != ""
    "     silent cs add $CSCOPE_DB
    " endif
endif

map <LEADER>gf :cs find 3 <C-R>=expand("<cword>")<CR><CR>

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

    map <LEADER>k :pyf /usr/share/clang/clang-format.py<cr>
    imap <C-K> <c-o>:pyf /usr/share/clang/clang-format.py<cr>
else
    if filereadable("/usr/share/clang/clang-format-6.0/clang-format.py")
    function! ClFormatOnSave()
      let l:formatdiff = 1
      pyf /usr/share/clang/clang-format-6.0/clang-format.py
    endfunction

        map <LEADER>k :pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
        imap <C-K> <c-o>:pyf /usr/share/clang/clang-format-6.0/clang-format.py<cr>
    endif
endif

"" easymotion configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to line
map <LEADER><LEADER>l <Plug>(easymotion-bd-jk)
nmap <LEADER><LEADER>l <Plug>(easymotion-overwin-line)

" s{char}{char} to move to {char}{char}
nmap <LEADER><LEADER>s <Plug>(easymotion-overwin-f2)
