"""""""""""""""""""""""""""""""""""""""""
" misc.vim
" Author: Rui Pinheiro
"
" Miscellaneous Vim configuration/tweaks
"""""""""""""""""""""""""""""""""""""""""


" Disable automatic comment on next line
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" Live command preview
if (has('nvim'))
	set inccommand=nosplit
endif

" Incremental Search
set incsearch

" Highlight all search matches
set hlsearch

" Use bash for shell commands and scripts (faster)
set shell=bash

" Allow opening of other files without closing buffers
set hidden

" Wild mode
set wildmode=full

