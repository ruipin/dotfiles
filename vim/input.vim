"""""""""""""""""""""""""""""""""""""""""
" input.vim
" Author: Rui Pinheiro
"
" Input-related configuration
"""""""""""""""""""""""""""""""""""""""""

" Key timeouts
set timeoutlen=1000 ttimeoutlen=0

" Scrolling
set mouse+=a

"Fix mouse for tmux (resizing splits)
if (!has('nvim'))
	if has("mouse_sgr")
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	end
endif

" Backspace deletes in insert mode
set backspace=2


" Leader key bindings
map <leader>y "*y
map <leader>Y "*Y
map <leader>s "*s
map <leader>S "*S
map <leader>d "*d
map <leader>d "*d
map <leader>x "*x
map <leader>X "*X
map <leader>c "*c
map <leader>C "*C
map <leader>p "*p
map <leader>P "*P


" Ctrl+hjkl split switching
inoremap <silent> <C-l> <c-w>l
inoremap <silent> <C-h> <c-w>h
inoremap <silent> <C-k> <c-w>k
inoremap <silent> <C-j> <c-w>j
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

inoremap <silent> <C-Right> <c-w>l
inoremap <silent> <C-Left> <c-w>h
inoremap <silent> <C-Up> <c-w>k
inoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <silent> <C-a> :bp<CR>
nnoremap <silent> <C-d> :bn<CR>


" Re-yank text pasted in selection mode (so that we don't lose the contents of "1)
" In summary, pastes (supports "xp and p), re-selects the last selection, and yanks it back into the register
xnoremap <expr> p 'pgv"'.v:register.'y`>'
