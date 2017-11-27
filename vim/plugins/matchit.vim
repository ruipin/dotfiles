"""""""""""""""""""""""""""""""""""""""""
" matchit.vim
" Author: Rui Pinheiro
"
" Matchit configuration
"""""""""""""""""""""""""""""""""""""""""

" Load match-it
runtime macros/matchit.vim

" Highlight Matchit plugin
Plug 'vimtaku/hl_matchit.vim'

" Enable automatically
let g:hl_matchit_enable_on_vim_startup = 1

" Highlight group. see :highlight
let g:hl_matchit_hl_groupname = 'MatchParen'

" 1 = faster, sometimes does not highlight
" 2 = slower, always highlights
let g:hl_matchit_speed_level = 2

" hl_matchit filetypes
"let g:hl_matchit_allow_ft = 'html,vim,sh'
