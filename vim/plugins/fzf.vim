"""""""""""""""""""""""""""""""""""""""""
" fzf.vim
" Author: Rui Pinheiro
"
" fzf plugin and related configuration
" This plugin is a fuzzy-finder that helps navigate files/directories inside vim
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Key bindings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :GitFiles<CR>
nnoremap <C-P> :Files<CR>
