"""""""""""""""""""""""""""""""""""""""""
" indentline.vim
" Author: Rui Pinheiro
"
" indent-related plugins and related configuration
"""""""""""""""""""""""""""""""""""""""""

" indentLine
Plug 'Yggdroot/indentLine'

" Configuration
let g:indentLine_char = '│'

" Use default conceal colors
let g:indentLine_setColors = 0

" Keep conceal value
let g:indentLine_setConceal = 0
let g:indentLine_concealcursor = ""



" vim-indent-object
" Adds the following text objects:
"   <count>ai : An Indentation level (and line above)
"   <count>ii : Inner Indentation level (no line above)
"   <count>aI : An Indentation level and lines above/below
"   <count>iI : Inner Indentation level (no lines above/below)
Plug 'michaeljsmith/vim-indent-object'
