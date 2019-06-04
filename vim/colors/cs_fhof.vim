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

let colors_name = "cs_fhof"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Folded               ctermfg=252   ctermbg=240
hi FoldColumn           ctermfg=7   ctermbg=8
hi VertSplit            ctermfg=252 ctermbg=5
hi LineNr               ctermfg=239 ctermbg=255
hi Normal               ctermfg=239
hi Search               ctermfg=239 ctermbg=230
set cursorline
hi CursorLine           ctermbg=253 cterm=NONE term=NONE
hi CursorLineNr         ctermfg=255 ctermbg=199
hi Comment              ctermfg=245
hi Number               ctermfg=40
hi Search               ctermbg=214
hi Todo                 ctermbg=226
hi String               ctermfg=178
hi def link Character String
hi Type                 ctermfg=33
hi Boolean              ctermfg=5
hi Error                ctermbg=49
hi Statement            ctermfg=199 term=NONE
hi Function             ctermfg=27
hi Macro                ctermfg=73
hi PreProc              ctermfg=178 term=NONE
hi Constant             ctermfg=5
hi ErrorMsg             ctermfg=196 ctermbg=NONE
hi NonText              ctermfg=248

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi wesPrivCtx NONE
hi wesAnnotate NONE
hi wesWescam NONE
hi def link wesUnimportant Function
hi wesThis NONE
hi wesIdentifier        ctermfg=33
hi wesCSpecial          ctermfg=5
hi OverLength           ctermfg=239 ctermbg=196

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # C Pre Proccessor Statements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi cInclude             ctermfg=178     "#include
" hi cIncluded            ctermfg=28      "<file>
hi cDefine              ctermfg=20        "#define
hi cPreCondit           ctermfg=5      "#if, #elif, #else, #endif
" hi cPreProc             ctermfg=        "#error, #warning
" hi cCppOut              ctermfg=        "#if 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTENDED C SYNTAX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi cOperator            ctermfg=199
hi cDelimiter           ctermfg=245
hi cBraces              ctermfg=245
hi cEqual               ctermfg=199
hi cErrInBracket        ctermfg=245
hi cErrInParen          ctermfg=245
hi cSeperator           ctermfg=245
hi def link cComma cSeperator


