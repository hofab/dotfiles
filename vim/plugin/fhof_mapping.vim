" custom leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<SPACE>"

" custom mapping to my liking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <LEADER>k <C-W>k
map <LEADER>h <C-W>h
map <LEADER>l <C-W>l
map <LEADER>j <C-W>j

" shortcuts to make my life easier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>w :w<CR>
nnoremap <LEADER>[ <S-V>i{<C-K>
nnoremap <LEADER>cs :!cscope -bcqR<CR><ESC> :cs reset<CR><ESC>
" nmap <LEADER>f :vs<CR><C-W>l:call FileSearch()<CR>
" nmap <LEADER>o :call FileSearch()<CR>
nmap <LEADER>s <C-Z>
nmap <LEADER>q :qa<CR>
" nmap <LEADER>t :tabe<CR>:execute 'Files' ProjectRootGuess()<CR>
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

nnoremap <LEADER>r *<ESC>:%s///g<left><left>
nnoremap <LEADER>b :??t.<left><left><left>
nnoremap <LEADER>gb :Gblame<CR>
"map ; to :
nnoremap ; :

inoremap jj <ESC>
inoremap jk <ESC>
inoremap kk <ESC>
inoremap kj <ESC>

" variable dispatch command
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <LEADER>mk :Dispatch make -f MakePldMx15Zn_CMX SW_PN=76589 SW_VER=01 SW_REV=X -j

" coc and ccls mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" no idea what this does :/
map <LEADER>gf :cs find 3 <C-R>=expand("<cword>")<CR><CR>

" use clang format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable("/usr/share/clang/clang-format.py")
    map <LEADER>k :py3f /usr/share/clang/clang-format.py<cr>
    imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
endif

"" easymotion configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to line
map <LEADER><LEADER>l <Plug>(easymotion-bd-jk)
nmap <LEADER><LEADER>l <Plug>(easymotion-overwin-line)

" Beginning of word forward and backward
map <LEADER>a <Plug>(easymotion-bd-w)

" s{char}{char} to move to {char}{char}
nmap <LEADER><LEADER>s <Plug>(easymotion-overwin-f2)

" " coc.vim selection with TAB
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" try something new auto generate log from hovered over word
nmap <LEADER>pv yiw<ESC>owpv<C-J><ESC><right>ciw<C-R>0<ESC>

"" resize window to 120 and 106
map <LEADER>y :call ToogleColumnWidth() <CR>

" DoxygenToolkit mapping
nnoremap <LEADER>do :Dox <CR>

" reload vimrc
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
