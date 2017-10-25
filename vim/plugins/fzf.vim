"""""""""""""""""""""""""""""""""""""""""
" fzf.vim
" Author: Rui Pinheiro
"
" fzf plugin and related configuration
" This plugin is a fuzzy-finder that helps navigate files/directories inside vim
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
let g:junegunn_fzf_oncmd = [ 'Buffers', 'GitFiles', 'Files' ]
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin', 'on': g:junegunn_fzf_oncmd }
Plug 'junegunn/fzf.vim', { 'on': g:junegunn_fzf_oncmd }

" Key bindings
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :GitFiles<CR>
nnoremap <C-P> :Files<CR>
