"""""""""""""""""""""""""""""""""""""""""
" nerdtree.vim
" Author: Rui Pinheiro
"
" Nerdtree vim plugin configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Key binding
map <C-n> :NERDTreeToggle<CR>

" Extensions to ignore
let NERDTreeIgnore = ['\.pyc$']

" Start automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Start if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if only NERDtree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "\uf459",
    \ "Staged"    : "\uf067",
    \ "Untracked" : "\uf005",
    \ "Renamed"   : "\uf45a",
    \ "Unmerged"  : "\uf402",
    \ "Deleted"   : "\uf014",
    \ "Dirty"     : "\uf06a",
    \ "Clean"     : "\uf046",
    \ "Ignored"   : "\uf474",
    \ "Unknown"   : "\uf420"
    \ }

" Vim-devicons + NerdTree
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
