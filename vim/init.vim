"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

colorscheme fhof

"Convert tabs to spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
"allow opening a buffer with unwritten changes
set hidden
"no swap files
set noswapfile
" Search details
set incsearch
set hlsearch
" Do no wrap searching
set nowrapscan
" To aid the colorscheme...
set t_Co=256
" Set text wrapping at 132 columns
set tw=132
" Indent to the tab positiion when  you cross over the 80 line limit.
set smartindent
" Leave a couple of lines at the top and bottom when scrolling
set scrolloff=2
" Give context on where you are in the file
set ruler
" wrapping is a problem more often than not.
set nowrap
set ff=unix
set showcmd
" show tabs (permanent) and spaces (typing)
set list
set lcs=tab:>-,trail:-
" set ignores case for searches
set ignorecase
"let $VTE_VERSION="100"
set guicursor=
" set ripgrep as vimgrep
set grepprg=rg\ --vimgrep
" set signcolumn to no so we don't see a grey line on the left
set signcolumn=no

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make 'Q' not annoyingly enter into ex edit mode!
nnoremap Q <nop>
nnoremap K <nop>

" Always show a ctags list
"nnoremap <C-]> g<C-]>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('persistent_undo')
    set undodir=$HOME/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMPLETE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has('wildmenu')
""    set wildmode=list:longest,full
"    set wildignore+=*.a,*.o,*.orig,*~
"    set wildmenu
"    set wildmode=longest,list
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MOUSE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow the mouse to be used for selecting
set mouse=a     " Enable all mouse behaviour (the default).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTO COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
" Remove trailing whitepsaces for each line on save.
" Highlight text that goes past the 133 line limit.
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=7 ctermfg=0
"   autocmd BufEnter * match OverLength /\%133v.*/
" augroup END

autocmd BufWritePre * :%s/\s\+$//e

augroup cprog
  " Remove all cprog autocommands
  au!

  " For *.c and *.h files set formatting of comments and set C-indenting on.
  " For other files switch it off.
  " Don't change the order, it's important that the line with * comes first.
    autocmd BufRead,BufNewFile *       set formatoptions=tcql nocindent comments&
    autocmd BufRead,BufNewFile *.c,*.h,*.cpp set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
    set cino=:0,(0,c1
augroup END

autocmd BufWritePre * :%s/\s\+$//e
endif

" Automatically update the ctags file when a file is written
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()
"set .h filetype as c, so that we can use C-snippets
au BufRead,BufNewFile *.h setfiletype c

" make quickfix work
function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " Silently ignore invalid buffers
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')
" vim-telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-commentary' # sorry tpope you had to go
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-surround'
Plug 'kylechui/nvim-surround'

"Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
"Plug 'ktchen14/cscope-auto'
Plug 'dbakker/vim-projectroot'
Plug 'tommcdo/vim-exchange'
Plug 'kkoomen/vim-doge'

" add print statement with stuff under cursor, couldn't make it work with normal vim mapping
Plug 'meain/vim-printer'
Plug 'guns/xterm-color-table.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" Plebvim lsp Plugins
Plug 'tjdevries/nlua.nvim'

" Neovim Tree shitter
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'

" vim-lua
"Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'


" refactoring from ThePrimagen
Plug 'ThePrimeagen/refactoring.nvim'

" nnn in vim
Plug 'mcchrish/nnn.vim'

" nvim looks
Plug 'onsails/lspkind-nvim'
Plug 'glepnir/lspsaga.nvim'

" nvim autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'
" Plug 'one-harsh/vscode-cpp-snippets'

" auto-pairs that works with compe
Plug 'windwp/nvim-autopairs'

" show key mappings if lost
Plug 'folke/which-key.nvim'

" colorizes rgb etc in files
Plug 'norcalli/nvim-colorizer.lua'

" better quick fix
Plug 'kevinhwang91/nvim-bqf'

" reload/restart functionality while running
Plug 'famiu/nvim-reload'

" async stuff
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" to prevent a blank line that apperared all of a sudden
" probably can be removed during a new setup
Plug 'lukas-reineke/indent-blankline.nvim'

"List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

" had to add this as all of a sudden a tabline appeared and I don't know from where
" also blankline.lua didn't appear to work for some reason so disabling the tablines here
let g:indent_blankline_enabled = v:false

" setup asynctask/run
let g:asyncrun_open = 6
" to get the correct root directory for async, otherwise the quickfix didn't work
let g:rootmarkers = ['.root']

" load lua folder
lua require("fhof")
