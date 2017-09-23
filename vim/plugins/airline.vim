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
let g:airline#extensions#tabline#enabled = 1 "Display all buffers
let g:airline#extensions#whitespace#enabled = 1 "Show whitespace
let g:airline#extensions#whitespace#checks = [ 'indent' ]
let g:airline_powerline_fonts = 1 "Powerline symbols (requires compatible font)
let g:airline_theme = 'molokai' "'solarized'
