"""""""""""""""""""""""""""""""""""""""""
" git.vim
" Author: Rui Pinheiro
"
" Git plugins and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""""
" Configuration

" Do not set default highlighting
let g:gitgutter_override_sign_column_highlight = 0

"""""
" Color scheme
function SetGitGutterColorScheme()
	hi SignColumn            cterm=bold ctermbg=black gui=bold guibg=#073642
	hi GitGutterAdd          cterm=bold ctermbg=black gui=bold guibg=#073642
	hi GitGutterChange       cterm=bold ctermbg=black gui=bold guibg=#073642
	hi GitGutterDelete       cterm=bold ctermbg=black gui=bold guibg=#073642
	hi GitGutterChangeDelete cterm=bold ctermbg=black gui=bold guibg=#073642
endfunction
