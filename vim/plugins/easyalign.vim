"""""""""""""""""""""""""""""""""""""""""
" easyalign.vim
" Author: Rui Pinheiro
"
" EasyAlign plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
