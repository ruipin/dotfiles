"""""""""""""""""""""""""""""""""""""""""
" autocomplete.vim
" Author: Rui Pinheiro
"
" Loads and configures the autocomplete plugin of choice
"""""""""""""""""""""""""""""""""""""""""

" Neovim
if has('nvim')
	Plug 'Shougo/deoplete.nvim'
	Plug 'fishbullet/deoplete-ruby'

	" Enable deoplete.
	let g:deoplete#enable_at_startup = 1"

	"inoremap <silent> <ESC> <C-r>=<SID>my_esc_function()<ESC>
	"function! s:my_esc_function() abort
	"	return deoplete#close_popup() . "\<ESC>"
	"endfunction


" Vim
else
	if has('lua')
		Plug 'Shougo/neocomplete.vim' " Autocomplete (with tab)
		Plug 'Shougo/vimproc.vim', { 'do' : 'make'  }

		" Configure
		let g:neocomplete#enable_at_startup = 1
		let g:acp_enableAtStartup = 0
		let g:neocomplete#sources#syntax#min_keyword_length = 3
		let g:neocomplete#enable_smart_case = 1
	endif

endif " has('nvim')
