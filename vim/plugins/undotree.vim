"""""""""""""""""""""""""""""""""""""""""
" undotree.vim
" Author: Rui Pinheiro
"
" UndoTree plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'mbbill/undotree' "More efficient undo tree


" Persistent History
set undofile
set undodir=$HOME/.vimundo/
set undolevels=200 " not too big

" Key binding
nnoremap <F5> :UndotreeToggle<CR>
