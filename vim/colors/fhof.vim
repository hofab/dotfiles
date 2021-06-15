"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim color file
" Maintainer:	Yasuhiro Matsumoto <mattn@mail.goo.ne.jp>
" Last Change:	2001 May 25

" This look like normal text editor.
" This color scheme uses a light background.

" First remove all existing highlighting.
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "fhof"

set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Folded               ctermfg=252 ctermbg=240 guifg=#e4e4e4   guibg=#585858
hi FoldColumn           ctermfg=7   ctermbg=8   guifg=#c0c0c0   guibg=#808080
hi VertSplit            ctermfg=252 ctermbg=5   guifg=#e4e4e4   guibg=#af00af
hi LineNr               ctermfg=239 ctermbg=255 guifg=#aeaeae   guibg=#eeeeee
hi Normal               ctermfg=239 ctermbg=NONE  guifg=#4e4e4e
hi Identifier           ctermfg=239 ctermbg=NONE  guifg=#4e4e4e
hi Search               ctermfg=239 ctermbg=230 guifg=#aeaeae   guibg=#ffffdf
set cursorline
hi Cursor               ctermfg=8   ctermbg=199 guifg=#808080   guibg=#ff00af
hi lCursor              ctermfg=8   ctermbg=199 guifg=#808080   guibg=#ff00af
hi CursorLine                       ctermbg=253                 guibg=#dadada cterm=NONE
hi CursorLineNr         ctermfg=255 ctermbg=199 guifg=#eeeeee   guibg=#ff00af
hi Comment              ctermfg=245             guifg=#8a8a8a
hi Number               ctermfg=40              guifg=#00d700
hi Search               ctermfg=0   ctermbg=214 guifg=#000000   guibg=#ffaf00
hi Todo                             ctermbg=226                 guibg=#ffff00
hi String               ctermfg=56              guifg=#B19F32
hi def link Character String
hi Type                 ctermfg=33              guifg=#0087ff                   gui=NONE
hi Boolean              ctermfg=5               guifg=#af00af
hi Special              ctermfg=5               guifg=#af00af
hi Error                            ctermbg=49  guifg=#e4e4e4    guibg=NONE
hi ErrorMsg             ctermfg=49              guifg=#e4e4e4    guibg=NONE
hi Statement            ctermfg=199             guifg=#ff00af                   gui=NONE
hi Function             ctermfg=27              guifg=#005fff
hi Macro                ctermfg=73              guifg=#5fafaf
hi PreProc              ctermfg=178             guifg=#dfaf00
hi Constant             ctermfg=29              guifg=#00875f
hi ErrorMsg             ctermfg=196             guifg=#ff0000
hi NonText              ctermfg=248             guifg=#a8a8a8
hi MatchParen           ctermfg=8   ctermbg=199 guifg=#808080   guibg=#ffafff
hi MoreMsg              gui=NONE
hi Question             gui=NONE
hi Delimiter            ctermfg=245             guifg=#8a8a8a
hi Define               ctermfg=20              guifg=#0000d7       "#define
hi OverLength           ctermfg=239 ctermbg=196 guifg=#aeaeae   guibg=#ff0000

" popup-colors
hi Pmenu         ctermfg=0  ctermbg=117         guifg=#000000   guibg=#87d7ff
hi PmenuSel      ctermfg=0  ctermbg=213         guifg=#000000   guibg=#ff87ff

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi wesPrivCtx NONE
hi wesAnnotate NONE
hi def link wesWescam Function
hi def link wesUnimportant Function
hi wesThis NONE
hi wesIdentifier        ctermfg=33              guifg=#0087ff
hi def link wesCSpecial boolean

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # C Pre Proccessor Statements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi cInclude    ctermfg=178     "#include
" hi cIncluded   ctermfg=28      "<file>
hi cDefine     ctermfg=20                       guifg=#0000d7       "#define
hi cPreCondit  ctermfg=5                        guifg=#af00af       "#if, #elif, #else, #endif
" hi cPreProc    ctermfg=        "#error, #warning
" hi cCppOut     ctermfg=        "#if 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTENDED C SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi cOperator     ctermfg=199                    guifg=#ff00af
hi cOperator     ctermfg=199                    guifg=#ff00af
hi cDelimiter    ctermfg=245                    guifg=#8a8a8a
hi cBraces       ctermfg=245                    guifg=#8a8a8a
hi cEqual        ctermfg=199                    guifg=#ff00af
hi cErrInBracket ctermfg=245                    guifg=#8a8a8a
hi cErrInParen   ctermfg=245                    guifg=#8a8a8a
hi cSeperator    ctermfg=245                    guifg=#8a8a8a
hi cConstant     ctermfg=29                     guifg=#00875f

hi def link cComma cSeperator
hi def link cMacro cFunction

"PmenuSel	selected item  |hl-PmenuSel|
"PmenuSbar	scrollbar  |hl-PmenuSbar|
"PmenuThumb	thumb of the scrollbar  |hl-PmenuThumb|

" custom tag colors
" tags are defined in syntax/c.vim
hi cTodo ctermbg=47                                             guibg=#00ff5f
hi cNote ctermbg=39                                             guibg=#00afff
