"""""""""""""""""""""""""""""""""""""""""
" fold.vim
" Author: Rui Pinheiro
"
" Fold plugins and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugins
Plug 'Konfekt/FastFold' " Update folding only when necessary
Plug 'Konfekt/FoldText'

""""
" Configuration

" Automatically fold by indentation
set foldmethod=indent

" Open files with all folds opened
set foldlevelstart=99

" Show folds in a column (next to line number)
set foldcolumn=1 

" FastFold should wrap all the fold commands
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

"""""
" Color scheme
function SetFoldColorScheme()
	hi FoldColumn cterm=bold ctermfg=167 ctermbg=black guifg=PaleVioletRed guibg=#073642
	hi Folded     cterm=bold ctermfg=167 ctermbg=52    guifg=PaleVioletRed guibg=Maroon
endfunction

"""""
" Hotkeys

" In normal/visual mode, use Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>


""""
" Treat folds as text objects

" vim-textobj-fold
" Adds the following text objects:
" <count>az : A folding (and line above)
" <count>iz : Inner folding (no line above)
Plug 'kana/vim-textobj-fold'


" Inner folding / A folding
xnoremap if :<C-U>silent! normal! viz<CR>
onoremap if :normal viz<CR>
xnoremap af :<C-U>silent! normal! vaz<CR>
onoremap af :normal vaz<CR>
