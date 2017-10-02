"""""""""""""""""""""""""""""""""""""""""
" misc.vim
" Author: Rui Pinheiro
"
" Miscellaneous Vim configuration/tweaks
"""""""""""""""""""""""""""""""""""""""""


" Disable automatic comments
" 'c': When exceeded certain line width
" 'r': When pressing 'Enter'
" 'o': When pressing 'o'/'O'
autocmd FileType * setlocal formatoptions-=c "formatoptions-=r formatoptions-=o

" Live command preview
if has('nvim')
	set inccommand=nosplit
endif

" Incremental Search
set incsearch

" Highlight all search matches
set hlsearch

" Use sh for shell commands and scripts (faster)
set shell=sh

" Allow opening of other files without closing buffers
set hidden

" Wild mode
set wildmode=full

" Update more often
set updatetime=1000
