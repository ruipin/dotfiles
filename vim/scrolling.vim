"""""""""""""""""""""""""""""""""""""""""
" scrolling.vim
" Author: Rui Pinheiro
"
" Scrolling plugins and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Number of lines to keep at top/bottom of pane when scrolling, for context
set scrolloff=2

"""""""""""""""
" Smooth scrolling

" Helper
function SmoothScroll(cmd, lines, speed)
	let speed=a:speed
	if a:cmd == 0
		let cmdstr="\<C-U>"
		let cmdtype=0
	elseif a:cmd == 1
		let cmdstr="\<C-D>"
		let cmdtype=0
	elseif a:cmd == 2
		let cmdstr="k"
		let cmdtype=1
	elseif a:cmd == 3
		let cmdstr="j"
		let cmdtype=1
	endif
	echo cmdstr

	" Set single-line scroll
	let oldscroll=&scroll
	let &scroll=speed

	" Repeat command "count times"
	let counter=0
	let max=a:lines
	while counter < max
		if speed > max-counter
			let speed=max-counter
			let &scroll=speed
		endif
		let counter+=speed

		" Execute command & redraw
		if cmdtype == 0
			exec "normal! " . cmdstr
		else
			exec "normal! " . speed . cmdstr
		endif
		redraw

		" Wait a bit before the next command
		if counter < max
			sleep 1m
		endif
	endwhile

	" Reset scroll
	let &scroll=oldscroll
endfunction

" Bindings
if ( !g:isRemote )
	" Page Up/Down
	nnoremap <silent> <PageUp>   :call SmoothScroll(0, &scroll*2, 3)<CR>
	nnoremap <silent> <PageDown> :call SmoothScroll(1, &scroll*2, 3)<CR>

	" Half-page Up/Down
	nnoremap <silent> <S-K> :call SmoothScroll(0, &scroll, 3)<CR>
	nnoremap <silent> <S-J> :call SmoothScroll(1, &scroll, 3)<CR>

	" Move cursor quarter page Up/Down
	nnoremap <silent> <S-Up> :call SmoothScroll(2, &scroll/2, 1)<CR>
	nnoremap <silent> <S-Down> :call SmoothScroll(3, &scroll/2, 1)<CR>
else
	" Page Up/Down (non-smooth)
	nnoremap <silent> <PageUp>   1000<C-U>
	nnoremap <silent> <PageDown> 1000<C-D>

	" Half-page Up/Down (non-smooth)
	nnoremap <silent> <S-K> <C-U>
	nnoremap <silent> <S-J> <C-D>

	" Move cursor quarter page Up/Down
	nnoremap <silent> <S-Up> :exec "normal! " . &scroll/2 . "k"<CR>
	nnoremap <silent> <S-Down> :exec "normal! " . &scroll/2 . "j"<CR>
endif

"""""""""""""""
" Default keybinds

" Page Up/Down in Insert Mode (non-smooth)
inoremap <silent> <PageUp>   <C-O>1000<C-U>
inoremap <silent> <PageDown> <C-O>1000<C-D>
