"""""""""""""""""""""""""""""""""""""""""
" scrolling.vim
" Author: Rui Pinheiro
"
" Scrolling plugins and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Number of lines to keep at top/bottom of pane when scrolling, for context
set scrolloff=3


if (! g:isRemote )
	let g:scroll_disable_mapping = 1
	Plug 'cskeeters/vim-smooth-scroll'

	" Scroll Wheel
	noremap <silent> <ScrollWheelDown> :call smooth_scroll#down(3)<CR>
	noremap <silent> <ScrollWheelUp>   :call smooth_scroll#up(3)<CR>

	" Page Up/Down
	noremap <silent> <PageDown> :call smooth_scroll#down(&scroll*2)<CR>
	noremap <silent> <PageUp>   :call smooth_scroll#up(&scroll*2)<CR>

	" Misc keys
	"nnoremap <silent> <c-u> :call smooth_scroll#up(  &scroll)<CR>
	"nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll)<CR>
	nnoremap <silent> K :call smooth_scroll#up(  &scroll)<CR>
	nnoremap <silent> J :call smooth_scroll#down(&scroll)<CR>
	nnoremap <silent> <c-b> :call smooth_scroll#up(  &scroll*2)<CR>
	nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2)<CR>
	nnoremap <silent> zz :call smooth_scroll#center(0)<CR>
	nnoremap <silent> zt :call smooth_scroll#top(0)<CR>
	nnoremap <silent> zb :call smooth_scroll#bottom(0)<CR>
	vnoremap <silent> zz :<c-u>call smooth_scroll#center(1)<CR>
	vnoremap <silent> zt :<c-u>call smooth_scroll#top(1)<CR>
	vnoremap <silent> zb :<c-u>call smooth_scroll#bottom(1)<CR>	

else
	nnoremap <silent> K :call feedkeys(&scroll . 'k')<CR>
	nnoremap <silent> J :call feedkeys(&scroll . 'j')<CR>

endif
