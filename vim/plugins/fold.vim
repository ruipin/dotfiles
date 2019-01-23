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
	hi FoldColumn cterm=bold ctermfg=167 ctermbg=black
	hi Folded cterm=bold ctermfg=167 ctermbg=52
endfunction

"""""
" Hotkeys

" In normal/visual mode, use Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
