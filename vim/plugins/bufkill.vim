"""""""""""""""""""""""""""""""""""""""""
" bufkill.vim
" Author: Rui Pinheiro
"
" Vim-buffkill plugin configuration
"""""""""""""""""""""""""""""""""""""""""


" Allow to close buffers without closing split
Plug 'qpkorr/vim-bufkill', { 'on': [ 'BUN', 'BD', 'BW', 'BB', 'BF', 'BA'] }


nnoremap <silent> <C-s> :BD<CR>
