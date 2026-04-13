"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

colorscheme fhof

"Convert tabs to spaces
:set expandtab
:set shiftwidth=4
:set tabstop=4
filetype plugin indent on
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
" Indent to the tab position when  you cross over the 132 line limit.
set smartindent
" Leave a couple of lines at the top and bottom when scrolling
set scrolloff=6
" Give context on where you are in the file
set ruler
" wrapping is a problem more often than not.
set nowrap
set ff=unix
set showcmd
" show tabs (permanent) and spaces (typing)
set list
set list listchars=tab:>-,trail:-

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
endif

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
" Neovim Tree shitter
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': 'main', 'do': ':TSUpdate'}

" vim-telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-repeat'
Plug 'kylechui/nvim-surround'

Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
"Plug 'ktchen14/cscope-auto'
Plug 'dbakker/vim-projectroot'
Plug 'tommcdo/vim-exchange'

" add print statement with stuff under cursor, couldn't make it work with normal vim mapping
Plug 'meain/vim-printer'
Plug 'vim-scripts/DoxygenToolkit.vim'

" status bar
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'

" vim-lua
"Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

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

" use NNN
Plug 'mcchrish/nnn.vim'

" auto-pairs that works with compe
Plug 'windwp/nvim-autopairs'

" show key mappings if lost
Plug 'folke/which-key.nvim'

" better quick fix
Plug 'kevinhwang91/nvim-bqf'

" reload/restart functionality while running
Plug 'famiu/nvim-reload'

" black integration for python
Plug 'python/black'

"List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:python3_host_prog = '/home/fhof/.pyenv/versions/3.13.1/bin/python3'

" load lua folder
lua require("fhof")
