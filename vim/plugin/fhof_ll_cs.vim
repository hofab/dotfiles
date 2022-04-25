" =============================================================================
" Filename: autoload/lightline/colorscheme/fhof_ll_cs.vim
" Author: itchyny
" License: MIT License
" Last Change: 2015/11/30 08:37:43.
" =============================================================================
let s:NORMAL_TEXT= [ '#4e4e4e', 239 ]
let s:LIGHT_TEXT= [ '#dadada', 253 ]
let s:NORMAL_BGRND= [ '#af00af', 5 ]
let s:base03 = [ '#242424', 235 ]
let s:base023 = [ '#353535 ', 236 ]
let s:base02 = [ '#444444 ', 238 ]
let s:base01 = [ '#585858', 240 ]
let s:base00 = [ '#666666', 242  ]
let s:base0 = [ '#808080', 244 ]
let s:base1 = [ '#969696', 247 ]
let s:base2 = [ '#a8a8a8', 248 ]
let s:base3 = [ '#d0d0d0', 252 ]
let s:yellow = [ '#cae682', 180 ]
let s:orange = [ '#e5786d', 173 ]
let s:red = [ '#e5786d', 203 ]
let s:magenta = [ '#f2c68a', 216 ]
let s:blue = [ '#8ac6f2', 117 ]
let s:cyan = s:blue
let s:green = [ '#95e454', 119 ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
"                      LEFT  TEXT , BACKGROUND RIGHT   TEXT,   BACKGROUND
let s:p.normal.left = [ [ s:LIGHT_TEXT, s:NORMAL_BGRND ], [ s:LIGHT_TEXT, s:base01 ] ]
let s:p.normal.right = [ [ s:LIGHT_TEXT, s:base1], [ s:LIGHT_TEXT, s:base01 ] ]
let s:p.inactive.left =  [ [ s:LIGHT_TEXT, s:base02 ], [ s:LIGHT_TEXT, s:base01 ] ]
let s:p.insert.left = [ [ s:NORMAL_TEXT, s:green ], [ s:LIGHT_TEXT, s:base01 ] ]
let s:p.replace.left = [ [ s:NORMAL_TEXT, s:red ], [ s:LIGHT_TEXT, s:base01 ] ]
let s:p.visual.left = [ [ s:NORMAL_TEXT, s:magenta ], [ s:LIGHT_TEXT, s:base01 ] ]
let s:p.normal.middle = [ [ s:LIGHT_TEXT, s:base02 ] ]
let s:p.inactive.middle = [ [ s:LIGHT_TEXT, s:base023 ] ]
let s:p.tabline.left = [ [ s:LIGHT_TEXT, s:base02 ] ]
let s:p.tabline.tabsel = [ [ s:LIGHT_TEXT, s:NORMAL_BGRND ] ]
let s:p.tabline.middle = [ [ s:orange, s:base3 ] ]
let s:p.tabline.right = [ [ s:LIGHT_TEXT, s:base02 ] ]
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base023, s:yellow ] ]

let g:lightline#colorscheme#fhof_ll_cs#palette = lightline#colorscheme#flatten(s:p)
