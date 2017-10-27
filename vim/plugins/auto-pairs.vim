"""""""""""""""""""""""""""""""""""""""""
" auto-pairs.vim
" Author: Rui Pinheiro
"
" auto-pairs plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'jiangmiao/auto-pairs'
"Plug 'vim-scripts/auto-pairs-gentle'


" Configuration
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0
"let g:AutoPairsMapBS=0
"let g:AutoPairsMapCh=0
"let g:AutoPairsMapCR=0
"let g:AutoPairsMapSpace=0
"let g:AutoPairsCenterLine=0
"let g:AutoPairsShortcutFastWrap=''
"let g:AutoPairsShortcutJump=''
"let g:AutoPairsShortcutBackInsert=''


" Workaround auto-pairs bug with the <M-"> mapping that causes typing "<" to timeout
autocmd VimEnter,BufWinEnter * silent! iunmap <buffer> <M-">
