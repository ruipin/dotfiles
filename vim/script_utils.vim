"""""""""""""""""""""""""""""""""""""""""
" script_utils.vim
" Author: Rui Pinheiro
"
" Various vimscript utility functions
"""""""""""""""""""""""""""""""""""""""""

" Removes whitespace from both ends of a string
function! Strip(input_string)
	return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
