"""""""""""""""""""""""""""""""""""""""""
" nerdtree.vim
" Author: Rui Pinheiro
"
" Nerdtree vim plugin configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
let g:scrooloose_nerdtree_oncmd = ['NERDTree', 'NERDTreeToggle']
Plug 'scrooloose/nerdtree', { 'on': g:scrooloose_nerdtree_oncmd }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': g:scrooloose_nerdtree_oncmd }

" Key binding
map <C-n> :NERDTreeToggle<CR>

" Extensions to ignore
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" Start automatically if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Start if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close vim if only NERDtree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree-git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Vim-devicons + NerdTree
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
