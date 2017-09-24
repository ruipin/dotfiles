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
set smartindent "This copies from previous line and does not interfere with filetype

if g:expand_tabs
	set expandtab
endif

" Some filetypes ignore the above settings
" We need to override them individually here
function! FileTypeSetl(ftype)
	execute 'au FileType ' . a:ftype . ' setl shiftwidth=' . g:tab_width . ' softtabstop=' . g:tab_width . ( g:expand_tabs ? ' expandtab' : '' )
endfunction

call FileTypeSetl('python')


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
function! InsertModeTab()
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
inoremap <expr><TAB> InsertModeTab()
nnoremap <expr><TAB> "i" . InsertModeTab()


"""""""""""""""""""
" Use Tab/Shift-Tab to indent/unindent multiple lines at once in visual mode
vnoremap <expr><TAB>  ">gv"
vnoremap <expr><S-TAB> "<gv"


"""""""""""""""
" Show tabs and spaces
" By default, shows only tabs and trailing spaces
" 'ToggleShowBlanks' can be used to also show other blank characters (such as normal spaces)
let g:blanks_shown=0

function! ShowBlanks()
	let g:blanks_shown=1
	hi SpecialKey ctermfg=240 ctermbg=NONE
	hi Conceal    ctermfg=240 ctermbg=NONE
	hi NonText    ctermfg=240 ctermbg=NONE
	set conceallevel=2
	set concealcursor=nvic
	set listchars=nbsp:·,tab:>·,trail:~,extends:>,precedes:<,space:·
	set list
endfunction

function! HideBlanks()
	let g:blanks_shown=0
	" Default values:
	hi SpecialKey ctermfg=237 ctermbg=NONE
	hi Conceal    ctermfg=237 ctermbg=NONE
	hi NonText    ctermfg=237 ctermbg=NONE
	set conceallevel=2
	set concealcursor=nvic
	set listchars=tab:>\ ,trail:·
	set list
	call clearmatches()
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
