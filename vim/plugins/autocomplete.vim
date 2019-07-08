"""""""""""""""""""""""""""""""""""""""""
" autocomplete.vim
" Author: Rui Pinheiro
"
" Loads and configures the autocomplete plugin of choice
"""""""""""""""""""""""""""""""""""""""""

" Neovim
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/context_filetype.vim'
	Plug 'Shougo/neoinclude.vim'

	" File types
	Plug 'Shougo/neco-vim', { 'for': 'vim' }
	Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
	Plug 'zchee/deoplete-zsh', { 'for': 'zsh' }

	" Snippets
	Plug 'Shougo/neosnippet.vim'
	Plug 'Shougo/neosnippet-snippets'

	" Enable deoplete.
	let g:deoplete#enable_at_startup = 1"

	autocmd VimEnter * call deoplete#custom#option({
	\ 'auto_complete_delay': 500,
	\ 'max_list': 10
	\})

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

" Handles <CR> presses in insert mode
" If we have an autocomplete menu open with a choice selected we expand it.
" Otherwise, we add a line-break.
function! AutoCompleteInsertModeCR()
	if pumvisible()
		if !empty(v:completed_item)
			if neosnippet#expandable() 
				call feedkeys("\<Plug>(neosnippet_expand)", 'm')
				return ""
			else
				return "\<C-y>"
			endif
		else
			return "\<C-E>\<CR>"
		endif
	elseif neosnippet#jumpable()
		call feedkeys("\<Plug>(neosnippet_jump)", 'm')
		return ""
	else
		return "\<CR>"
	endif
endfunction

" Handles <TAB> presses in insert mode
" If we have an autocomplete menu open, we move to the next choice
" Otherwise, if neosnippet can jump, we jump
" Otherwise, we call the typical TAB handler
function! AutoCompleteInsertModeTAB()
	if pumvisible()
		return "\<C-n>"
	else
		if neosnippet#expandable_or_jumpable() 
			call feedkeys("\<Plug>(neosnippet_expand_or_jump)", 'm')
			return ""
		else
			return InsertModeTAB()
		endif
	endif
endfunction

function! AutoCompleteVisualModeTAB()
	if neosnippet#expandable()
		call feedkeys("\<Plug>(neosnippet_expand_or_jump)", 'm')
		return ""
	else
		return VisualModeTAB()
	endif
endfunction!

" In case there are plugins that try to map <CR>/<TAB>, we can call this method to reset them
function! SetupAutoCompleteCRandTAB()
	exe 'inoremap <expr><silent> <CR> AutoCompleteInsertModeCR()'
	exe 'inoremap <expr><silent> <TAB> AutoCompleteInsertModeTAB()'
	exe 'vnoremap <expr><silent> <TAB> AutoCompleteVisualModeTAB()'
endfunction
autocmd VimEnter * call SetupAutoCompleteCRandTAB()
