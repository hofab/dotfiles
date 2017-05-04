" Vim color file
" Maintainer:   Robert Laswick <robert.laswick@gmail.com> 
" Last Change:  $Id$
" URL:      	http://sites.google.com/site/projectslaswick
" License:      GPL
"
" Plain colour scheme for a white background.  Very similar to MS Visual Studio.
"
" To install, copy to ~/.vim/colors directory. Then :colorscheme laswick-white. 

set background=light
hi clear          
if exists("syntax_on")
    syntax reset
endif

highlight   Comment     ctermfg=DarkBlue

highlight   Constant    ctermfg=DarkRed
    "highlight   String      ctermfg=
    "highlight   Character   ctermfg=
    "highlight   Number      ctermfg=
    "highlight   Boolean     ctermfg=
    "highlight   Float       ctermfg=

highlight   Identifier  ctermfg=DarkCyan
    "highlight   Function    ctermfg=

highlight   Statement   ctermfg=DarkBlue
    "highlight   Conditional ctermfg=
    "highlight   Repeat      ctermfg=
    "highlight   Label       ctermfg=
    "highlight   Operator    ctermfg=
    "highlight   Keyword     ctermfg=
    "highlight   Exception   ctermfg=

highlight   PreProc     ctermfg=DarkMagenta
    "highlight   Include     ctermfg=
    "highlight   Define      ctermfg=
    "highlight   Macro       ctermfg=
    "highlight   PreCondit   ctermfg=

highlight   Type        ctermfg=DarkGreen
    "highlight   StorageClass ctermfg=
    "highlight   Structure   ctermfg=
    "highlight   Typedef     ctermfg=

    "highlight   Special     ctermfg=
    "highlight   SpecialChar ctermfg=
    "highlight   Tag         ctermfg=
    "highlight   Delimiter   ctermfg=
    "highlight   SpecialComment ctermfg=
    "highlight   Debug       ctermfg=

    "highlight   Underlined  ctermfg=

    "highlight   Ignore      ctermfg=

    "highlight   Error       ctermfg=

highlight   Todo        ctermfg=White ctermbg=LightGreen

highlight   Search      ctermfg=White ctermbg=blue cterm=bold

highlight   VertSplit   ctermfg=White   ctermbg=LightGrey

"highlight   CursorLine  ctermbg=LightGrey
"set cursorline

highlight   StatusLine ctermfg=White ctermbg=DarkBlue
highlight   StatusLineNC ctermfg=LightGrey
