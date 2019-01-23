"""""""""""""""""""""""""""""""""""""""""
" gitgutter.vim
" Author: Rui Pinheiro
"
" Gitgutter plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugins
Plug 'airblade/vim-gitgutter'

""""
" Configuration

" Do not set default highlighting
let g:gitgutter_override_sign_column_highlight = 0

"""""
" Color scheme
function SetGitGutterColorScheme()
	hi SignColumn cterm=bold ctermbg=black
	hi GitGutterAdd cterm=bold ctermbg=black
	hi GitGutterChange cterm=bold ctermbg=black
	hi GitGutterDelete cterm=bold ctermbg=black
	hi GitGutterChangeDelete cterm=bold ctermbg=black
endfunction
