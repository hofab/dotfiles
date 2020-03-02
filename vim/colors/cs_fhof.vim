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
hi def link wesWescam       Function
hi def link wesUnimportant  Function
hi def link wesCSpecial     boolean
hi def link wesDbtType      Comment
hi def link wesDbfType      wesDbtType
hi wesIdentifier            ctermfg=33
hi OverLength               ctermfg=239 ctermbg=196
hi def custConstant         ctermfg=28
hi def link custInterface   Function
hi wesPrivCtx               NONE
hi wesAnnotate              NONE
hi wesThis                  NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # C Pre Proccessor Statements
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi cDefine              ctermfg=20        "#define
hi cPreCondit           ctermfg=5         "#if, #elif, #else, #endif

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
hi def link cComma      cSeperator

" popup-colors
hi Pmenu                ctermfg=235

" ccls color highlighting with vim-lsb-cxx
hi default link LspCxxHlSymUnknown          NONE
hi default LspCxxHlGroupEnumConstant        ctermfg=28
hi default link LspCxxHlGroupMemberVariable NONE
hi default link LspCxxHlGroupNamespace      NONE

" Type
hi default link LspCxxHlSymClass            NONE
hi default link LspCxxHlSymStruct           NONE
hi default link LspCxxHlSymEnum             NONE
hi default link LspCxxHlSymTypeAlias        NONE
hi default link LspCxxHlSymTypeParameter    NONE

" Function
hi default link LspCxxHlSymFunction NONE
hi default link LspCxxHlSymMethod NONE
hi default link LspCxxHlSymStaticMethod NONE
hi default link LspCxxHlSymConstructor NONE

" EnumConstant
hi default link LspCxxHlSymEnumMember NONE

" Preprocessor
hi default link LspCxxHlSymMacro NONE

" Namespace
hi default link LspCxxHlSymNamespace NONE

" Variables
hi default link LspCxxHlSymVariable NONE
hi default link LspCxxHlSymParameter NONE
hi default link LspCxxHlSymField NONE

