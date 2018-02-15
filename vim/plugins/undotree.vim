"""""""""""""""""""""""""""""""""""""""""
" undotree.vim
" Author: Rui Pinheiro
"
" UndoTree plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' } "More efficient undo tree


" Persistent History
if has('nvim') || v:version >= 704
	set undofile
	set undodir=$HOME/.vimundo/
endif

set undolevels=200 " not too big

" Key binding
nnoremap <F5> :UndotreeToggle<CR>
