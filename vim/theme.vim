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

	" Refresh vim-airline to fix colors
	AirlineRefresh
endfunction

" Split separator glyphs:
set fillchars=vert:│


" Line numbering
set number
"set relativenumber

" Highlight current line
set cursorline

" Colors
set t_Co=256

" Color column
if g:color_column >= 0
	execute 'set colorcolumn=' . g:color_column
endif

" Show status line always
set laststatus=2

" Only redraw modified parts of the screen
"set lazyredraw
"set ttyfast
