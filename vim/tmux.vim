"""""""""""""""""""""""""""""""""""""""""
" tmux.vim
" Author: Rui Pinheiro
"
" Tmux-related configuration
"""""""""""""""""""""""""""""""""""""""""


" Not necessary to run this code unless we are using tmux
if !empty($TMUX)


	"""""""""""
	" Automatic tmux title with file name

	" Teach vim the tmux escape sequences for changing pane title
	" Note the "^[" should be a literal escape code (use `^v<esc>` to enter it)
	set t_ts=2;
	set t_fs=\\

	" Turn on setting the title.
	set title

	" The following causes vim to refresh the title each time we change buffers.
	" Otherwise it will only set the title once at startup.
	augroup RefreshTitle
		autocmd!
		" The concatenation of the colon is a hack to prevent vim from
		" interpreting the string as a modeline.
		autocmd BufEnter * let &titlestring = expand("%:t")
	augroup END


endif
