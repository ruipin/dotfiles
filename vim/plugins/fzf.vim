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
nnoremap <C-P>     :Files<CR>
nnoremap <leader>t :Tags<CR>

" Remap bindings
let $FZF_DEFAULT_OPTS = "--bind shift-tab:toggle-all"

" Append '-U' to ag calls : search .gitignored files as well
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-U', <bang>0)
