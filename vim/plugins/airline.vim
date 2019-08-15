"""""""""""""""""""""""""""""""""""""""""
" airline.vim
" Author: Rui Pinheiro
"
" Vim-airline plugin configuration
"""""""""""""""""""""""""""""""""""""""""

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Configuration
set laststatus=2 "Show a status line always
let g:airline#extensions#whitespace#enabled = 1 "Show whitespace
let g:airline_powerline_fonts = 1 "Powerline symbols (requires compatible font)
let g:airline_theme = 'solarized' " 'molokai'
let g:airline_solarized_bg='dark'

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = "\ue0b8"
let g:airline#extensions#tabline#left_alt_sep = "\ue0b9"
let g:airline#extensions#tabline#formatter = 'default'

let g:airline#extensions#tabline#middle_click_preserves_windows = 1

let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buf_label_first = 0
"let g:airline#extensions#tabline#buffers_label = 'buf'
"let g:airline#extensions#tabline#tabs_label = 'tab'
"let g:airline#extensions#tabline#fnametruncate = 5

let g:airline#extensions#tabline#ellipsis = "\u22ef"
let g:airline#extensions#tabline#pad_with_spaces = 1

let g:airline#extensions#gutentags#enabled = 1

" Add the window number in front of the mode
function! WindowNumber(...)
	let builder = a:1
	let context = a:2
	call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
	return 0
endfunction

autocmd VimEnter * call SetupAirline()
function SetupAirline()
	call airline#add_statusline_func('WindowNumber')
	call airline#add_inactive_statusline_func('WindowNumber')
	AirlineRefresh
endfunction
