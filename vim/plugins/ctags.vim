"""""""""""""""""""""""""""""""""""""""""
" ctags.vim
" Author: Rui Pinheiro
"
" ctags configuration
"""""""""""""""""""""""""""""""""""""""""

"""""""
" Automatic ctags
" Requires ctags installation (e.g. universal-ctags)
Plug 'ludovicchabant/vim-gutentags'

"""""""
" Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Configuration
nmap <F4> :TagbarToggle<CR>
