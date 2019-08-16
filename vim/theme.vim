"""""""""""""""""""""""""""""""""""""""""
" vimrc
" Author: Rui Pinheiro
"
" Vim color/theme configuration
"""""""""""""""""""""""""""""""""""""""""

if has('nvim')
	Plug 'iCyMind/NeoSolarized'
else
	Plug 'altercation/vim-colors-solarized'
endif

" Background color
set background=dark

" Activate color scheme
autocmd VimEnter * call SetColorScheme()
function SetColorScheme()
	" Color Scheme
	if has('nvim')
		colorscheme NeoSolarized
	else
		colorscheme solarized
	endif

	" Plugins
	if exists("*SetFoldColorScheme")
		call SetFoldColorScheme()
	endif
	if exists("*SetGitGutterColorScheme")
		call SetGitGutterColorScheme()
	endif

	" Refresh vim-airline to fix colors
	if exists("*AirlineRefresh")
		AirlineRefresh
	endif

	" Refresh Rainbow to fix colors
	if exists('g:rainbow_active') && g:rainbow_active
		RainbowToggleOn
	endif
endfunction

" Split separator glyphs:
if has('nvim')
	set fillchars=vert:│
endif


" Line numbering
set number
"set relativenumber

" Highlight current line
set cursorline

" Colors
set t_Co=256

" Color column
if (has('nvim') || v:version >= 703)
	if g:color_column >= 0
		execute 'set colorcolumn=' . g:color_column
	endif

	" Override color column for specific file types
	augroup colorcolumn
		au!
		" Gitcommit 50/72 rule - we should wrap after the 72nd column
		au FileType gitcommit set colorcolumn=73
	augroup END
endif

" Show status line always
set laststatus=2

" Only redraw modified parts of the screen
"set lazyredraw
"set ttyfast
