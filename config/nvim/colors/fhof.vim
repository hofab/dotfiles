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
set cursorline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS - Variable Definitions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color combinations
let s:light_gray_on_dark =      'ctermfg=252    ctermbg=240     guifg=#d0d0d0 guibg=#585858'
let s:white_on_gray =           'ctermfg=7      ctermbg=8       guifg=#c0c0c0 guibg=#808080'
let s:light_gray_on_magenta =   'ctermfg=252    ctermbg=5       guifg=#d0d0d0 guibg=#af00af'
let s:gray_on_offwhite =        'ctermfg=239    ctermbg=255     guifg=#aeaeae guibg=#eeeeee'
let s:gray_on_pale_yellow =     'ctermfg=239    ctermbg=230     guifg=#aeaeae guibg=#ffffdf'
let s:gray_on_pink =            'ctermfg=8      ctermbg=199     guifg=#808080 guibg=#ff00af'
let s:offwhite_on_pink =        'ctermfg=255    ctermbg=199     guifg=#eeeeee guibg=#ff00af'
let s:black_on_orange =         'ctermfg=0      ctermbg=214     guifg=#000000 guibg=#ffaf00'
let s:gray_on_light_pink =      'ctermfg=8      ctermbg=199     guifg=#808080 guibg=#ffafff'
let s:black_on_sky_blue =       'ctermfg=0      ctermbg=117     guifg=#000000 guibg=#87d7ff'
let s:black_on_light_magenta =  'ctermfg=0      ctermbg=213     guifg=#000000 guibg=#ff87ff'
let s:gray_on_red =             'ctermfg=239    ctermbg=196     guifg=#aeaeae guibg=#ff0000'

" Foreground only colors
let s:dark_gray =       'ctermfg=239    ctermbg=NONE guifg=#4e4e4e guibg=NONE'
let s:medium_gray =     'ctermfg=245    ctermbg=NONE guifg=#8a8a8a guibg=NONE'
let s:green =           'ctermfg=40     ctermbg=NONE guifg=#00d700 guibg=NONE'
let s:gold =            'ctermfg=56     ctermbg=NONE guifg=#B19F32 guibg=NONE'
let s:blue =            'ctermfg=33     ctermbg=NONE guifg=#0087ff guibg=NONE'
let s:magenta =         'ctermfg=5      ctermbg=NONE guifg=#af00af guibg=NONE'
let s:cyan_on_none =    'ctermfg=49     ctermbg=NONE guifg=#00ffaf guibg=NONE'
let s:pink =            'ctermfg=199    ctermbg=NONE guifg=#ff00af guibg=NONE'
let s:bright_blue =     'ctermfg=27     ctermbg=NONE guifg=#005fff guibg=NONE'
let s:teal =            'ctermfg=73     ctermbg=NONE guifg=#5fafaf guibg=NONE'
let s:orange =          'ctermfg=178    ctermbg=NONE guifg=#dfaf00 guibg=NONE'
let s:dark_green =      'ctermfg=29     ctermbg=NONE guifg=#00875f guibg=NONE'
let s:red =             'ctermfg=196    ctermbg=NONE guifg=#ff0000 guibg=NONE'
let s:very_light_gray = 'ctermfg=255    ctermbg=NONE guifg=#a8a8a8 guibg=NONE'
let s:dark_blue =       'ctermfg=20     ctermbg=NONE guifg=#0000d7 guibg=NONE'
let s:none =            'ctermfg=4      ctermbg=NONE guifg=#eeeeee guibg=NONE'

" Background only colors
let s:bg_light_gray =   'ctermfg=NONE ctermbg=253 guifg=NONE guibg=#dadada'
let s:bg_bright_green = 'ctermfg=NONE ctermbg=47  guifg=NONE guibg=#00ff5f'
let s:bg_bright_cyan =  'ctermfg=NONE ctermbg=39  guifg=NONE guibg=#00afff'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS - Highlight Groups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exe 'hi list ' . s:pink
exe 'hi Identifier ' . s:dark_gray
exe 'hi Folded ' . s:light_gray_on_dark
exe 'hi FoldColumn ' . s:white_on_gray
exe 'hi VertSplit ' . s:light_gray_on_magenta
exe 'hi LineNr ' . s:gray_on_offwhite
exe 'hi Normal ' . s:dark_gray
exe 'hi Search ' . s:black_on_orange
exe 'hi Cursor ' . s:gray_on_pink
exe 'hi lCursor ' . s:gray_on_pink
exe 'hi CursorLine ' . s:bg_light_gray
exe 'hi CursorLineNr ' . s:offwhite_on_pink
exe 'hi Comment ' . s:medium_gray
exe 'hi Number ' . s:green
exe 'hi String ' . s:gold
hi def link Character String
exe 'hi Type ' . s:blue . ' gui=NONE'
exe 'hi Boolean ' . s:magenta
exe 'hi Special ' . s:magenta
exe 'hi Error ctermfg=252 ctermbg=49 guifg=#d0d0d0 guibg=#00ffaf'
exe 'hi ErrorMsg ' . s:red
exe 'hi Statement ' . s:pink . ' gui=NONE'
exe 'hi Function ' . s:bright_blue
exe 'hi Macro ' . s:teal
exe 'hi PreProc ' . s:pink
exe 'hi Constant ' . s:dark_green
exe 'hi NonText ' . s:medium_gray
exe 'hi MatchParen ' . s:gray_on_light_pink
exe 'hi MoreMsg gui=NONE'
exe 'hi Question gui=NONE'
exe 'hi Delimiter ' . s:medium_gray
exe 'hi Define ' . s:dark_blue
exe 'hi OverLength ' . s:gray_on_red
exe 'hi Operator ' . s:pink

" popup-colors
exe 'hi Pmenu ' . s:black_on_sky_blue
exe 'hi PmenuSel ' . s:black_on_light_magenta

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # C Pre Proccessor Statements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exe 'hi cDefine ' . s:dark_blue
exe 'hi cPreCondit ' . s:magenta

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTENDED C SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exe 'hi cOperator ' . s:pink
hi def link cDelimiter cSeperator
exe 'hi cBraces ' . s:medium_gray
exe 'hi cEqual ' . s:pink
exe 'hi cErrInBracket ' . s:medium_gray
exe 'hi cSeperator ' . s:medium_gray
exe 'hi cConstant ' . s:dark_green
hi def link cComma cSeperator
hi def link cErrInParen cSeperator
hi def link cMacro cFunction

" custom tag colors
exe 'hi cTodo ' . s:bg_bright_green
exe 'hi cNote ' . s:bg_bright_cyan

exe 'hi Whitespace ' . s:none
