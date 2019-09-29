"""""""""""""""""""""""""""""""""""""""""
" tabs.vim
" Author: Rui Pinheiro
"
" TAB-related configuration and functions
"""""""""""""""""""""""""""""""""""""""""

" Spaces/Tab
execute 'set tabstop='     . g:tab_width
execute 'set softtabstop=' . g:tab_width
execute 'set shiftwidth='  . g:tab_width
set autoindent
"set smartindent

if g:expand_tabs
	set expandtab
else
	set noexpandtab
endif

" Some filetypes ignore the above settings
" We need to override them individually here
" Parameters: file_type, [tab_width, [expand_tabs]]
function! AutoFileTypeSetl(ftype,...)
	let tab_width = (a:0 >= 1) ? a:1 : g:tab_width
	let expand_tabs = (a:0 >= 2) ? a:2 : g:expand_tabs

	exe 'augroup AutoFileType' . a:ftype
		autocmd!
		exe 'autocmd FileType ' . a:ftype . ' setl shiftwidth=' . tab_width . ' softtabstop=' . tab_width . ' tabstop=' . tab_width . ' expandtab' . ( expand_tabs ? '' : '!' )
	augroup END
endfunction

call AutoFileTypeSetl('python')
call AutoFileTypeSetl('ruby')


"""""""""""""""""
" Returns the correct tab character(s), i.e. \<Tab> or multiple spaces
function! GetTabCharacters()
	if &expandtab
		return repeat(' ', &tabstop)
	else
		return "\<Tab>"
	endif
endfunction



"""""""""""""""""
" Custom insert-mode tab behaviour

" Returns output for pressing Tab in Insert Mode
function! InsertModeTAB()
	" If auto-complete is visible
	" insert current choice
	if pumvisible()
		return "\<C-n>"
	endif

	" Get current column
	let curcol = virtcol('.')

	" Check if line is empty or whitespace-only
	let line_empty = ( strlen(Strip(getline('.'))) <= 0 )

	if line_empty
		let curcindent = cindent('.')+1 " get C indent

		" If cursor is before cindent, add spaces until correct indent, then
		" delete rest of line
		if curcol < curcindent
			return "\<C-O>0\<C-O>\"_D" . repeat(GetTabCharacters(), (curcindent/&tabstop))

		" Otherwise, insert a Tab
		else
			return GetTabCharacters()
		endif
	else
		let curindent = indent('.')+1 " get indent of existing text

		" If cursor is before current indent, go to first character in line
		if curcol < curindent
			return "\<C-O>^"

		" Otherwise, insert a tab
		else
			return GetTabCharacters()
		endif
	endif
endfunction

" Insert-Tab Keybindings
inoremap <expr><TAB> InsertModeTAB()
nnoremap <expr><TAB> "i" . InsertModeTAB()


"""""""""""""""""""
" Use Tab/Shift-Tab to indent/unindent multiple lines at once in visual mode
function! VisualModeTAB()
	return ">gv"
endfunction
vnoremap <expr><TAB>   VisualModeTAB()
vnoremap <expr><S-TAB> "<gv"


"""""""""""""""
" Show tabs and spaces
" By default, shows only tabs and trailing spaces
" 'ToggleShowBlanks' can be used to also show other blank characters (such as normal spaces)
let g:blanks_shown=0

" enable conceal only on normal and command mode
let g:default_concealcursor = "nc"

function! ShowBlanks()
	let g:blanks_shown=1
	hi SpecialKey ctermfg=240 ctermbg=NONE guifg=gray30 guibg=NONE
	hi Conceal    ctermfg=240 ctermbg=NONE guifg=gray30 guibg=NONE
	hi NonText    ctermfg=240 ctermbg=NONE guifg=gray30 guibg=NONE
	if has('nvim')
		set conceallevel=2
		set concealcursor=nvic
		set listchars=nbsp:·,tab:>·,trail:~,extends:>,precedes:<,space:·
	else
		set listchars=nbsp:·,extends:>,precedes:<,space:·
	endif
	set list

	if exists(":IndentLinesEnable") && g:indentLine_enabled
		IndentLinesEnable
	endif
endfunction

function! HideBlanks()
	let g:blanks_shown=0
	" Default values:
	hi SpecialKey ctermfg=238 ctermbg=NONE guifg=gray26 guibg=NONE
	hi Conceal    ctermfg=238 ctermbg=NONE guifg=gray26 guibg=NONE
	hi NonText    ctermfg=238 ctermbg=NONE guifg=gray26 guibg=NONE
	if has('nvim')
		set conceallevel=2
		exe "set concealcursor=".g:default_concealcursor
		set listchars=tab:>\ ,trail:·
	else
		set listchars=
	endif
	set list
	call clearmatches()

	if exists(":IndentLinesEnable") && g:indentLine_enabled
		IndentLinesEnable
	endif
endfunction

function! RefreshShowBlanks()
	if g:blanks_shown
		call ShowBlanks()
	else
		call HideBlanks()
	endif
endfunction

function! ToggleShowBlanks()
	if g:blanks_shown
		call HideBlanks()
	else
		call ShowBlanks()
	endif
endfunction

command ToggleShowBlanks call ToggleShowBlanks()
command ShowBlanks call ShowBlanks()
command HideBlanks call HideBlanks()
command RefreshShowBlanks call RefreshShowBlanks()
map <F2> :ToggleShowBlanks<CR>

" Necessary in order to make sure the correct syntax highlighting is used on any new buffer
autocmd VimEnter * RefreshShowBlanks
autocmd BufEnter * RefreshShowBlanks


"""""""""""""""
" Remove Trailing blanks
command RemoveTrailing %s/\s\+$//
