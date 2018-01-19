"""""""""""""""""""""""""""""""""""""""""
" scrolling.vim
" Author: Rui Pinheiro
"
" Scrolling plugins and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Large File Size Minimum
let g:large_file_size_mb = 10
let g:large_file_size = 1024 * 1024 * g:large_file_size_mb

" DetectLarge Files
augroup LargeFile 
	autocmd!
	autocmd BufReadPre * call LargeFile()
augroup END

function LargeFile()
	" Detect File size
	let f=getfsize(expand("<afile>"))

	" If file is too large, disable various functionality
	if ( f > g:large_file_size || f == -2 )
		" no syntax highlighting etc
		set eventignore+=FileType
		" save memory when other file is viewed
		setlocal bufhidden=unload
		" is read-only (write with :w new_filename)
		setlocal buftype=nowrite
		" no undo possible
		setlocal undolevels=-1
		" display message
		echom "File is larger than " . string(g:large_file_size_mb) . "MB, so some features were disabled."
	endif
endfunction
