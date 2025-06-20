" custom leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<SPACE>"

" custom mapping to my liking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>k <C-W>k
nnoremap <LEADER>h <C-W>h
nnoremap <LEADER>l <C-W>l
nnoremap <LEADER>j <C-W>j

" shortcuts to make my life easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>[ <S-V>i{<C-K>
nnoremap <LEADER>cs :!cscope -bcqR<CR><ESC> :cs reset<CR><ESC>
nmap <LEADER>s <C-Z>
nmap <LEADER>q :qa<CR>
nmap <LEADER>ut :UndotreeToggle <CR>
" delete to beginning of the line and join with line above
nmap <LEADER><LEADER>j d0kJ
" no search highlighting until next search
nmap <LEADER>dh :noh <CR>
" paste yanked text over word
nmap <LEADER>v ciw<C-r>0<ESC>
" copy word to clipboard
nnoremap <LEADER>cc "+yiw
vnoremap <LEADER>cc "+y

" overwrite the selection with contents of buffer 0
vnoremap <LEADER>ow "0p

nnoremap <LEADER>r *<ESC>:%s///g<left><left>
nnoremap <LEADER>b :??t.<left><left><left>
nnoremap <LEADER>gb :Git blame<CR>
"map ; to :
nnoremap ; :

inoremap jj <ESC>
inoremap jk <ESC>
inoremap kk <ESC>
inoremap kj <ESC>

" custom inputs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use clang format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("/usr/share/clang/clang-format.py")
    autocmd Filetype c,cpp map <LEADER>i :py3f /usr/share/clang/clang-format.py<cr>
    autocmd Filetype c,cpp imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
endif

if filereadable("/usr/share/clang/clang-format-18/clang-format.py")
    autocmd Filetype c,cpp map <LEADER>i :py3f /usr/share/clang/clang-format-18/clang-format.py<cr>
    autocmd Filetype c,cpp imap <C-K> <c-o>:py3f /usr/share/clang/clang-format-18/clang-format.py<cr>
endif

"" easymotion configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to line
nmap <LEADER><LEADER>l <Plug>(easymotion-bd-jk)
nmap <LEADER><LEADER>l <Plug>(easymotion-overwin-line)

" Beginning of word forward and backward
nmap <LEADER>a <Plug>(easymotion-bd-w)

" s{char}{char} to move to {char}{char}
nmap <LEADER><LEADER>s <Plug>(easymotion-overwin-f2)

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Avoid showing message extra message when using completion
set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" resize window to 120 and 106
map <LEADER>y :call ToogleColumnWidth() <CR>

" DoxygenToolkit mapping
nnoremap <LEADER>do :Dox <CR>

" reload vimrc
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" asynctask mappings
noremap <silent><f5> :AsyncTask file-run<cr>
noremap <silent><f9> :AsyncTask file-build<cr>

" check no expandtab mapping
noremap <LEADER>et :verbose set expandtab?<CR>

"
nnoremap <LEADER>nt :execute "tabe" \| execute "NnnPicker"<CR>
nnoremap <LEADER>nf :vs<CR><C-W>l :NnnPicker<CR>

" determine highlight group of text under cursor
nnoremap <LEADER>hg :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") ."> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" 4 spaces to tabs
noremap <silent><f5> :%s/    /  /g<cr>
