"""""""""""""""""""""""""""""""""""""""""
" rainbow.vim
" Author: Rui Pinheiro
"
" Rainbow plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
" NOTE: Newer commits seem to be broken
Plug 'luochen1990/rainbow', { 'commit': 'd7bb89e6a6fae25765ee16020ea7a85d43bd6e41' }

" Configuration
let g:rainbow_active = 1

	function! CreateRainbowParenthesesOperators()
		let l:op  = '_\('

		let l:op .= ','  . '\|'
		let l:op .= '+'  . '\|'
		let l:op .= '-'  . '\|'
		let l:op .= '='  . '\|'
		let l:op .= '!'  . '\|'
		let l:op .= '<'  . '\|'
		let l:op .= '>'  . '\|'
		let l:op .= '&'  . '\|'
		let l:op .= '|'  . '\|'
		let l:op .= '\~' . '\|' " tilde
		let l:op .= '\(\/\@<!\)\*\(\/\@!\)' . '\|' " matches * but not /* or */
		let l:op .= '\/\([\/\*]\@!\)' " matches / but not /* or //

		let l:op .= '\)_'
		return l:op
	endfunction

let g:rainbow_conf = {
\  'ctermfgs': ['DarkBlue', '34', 'DarkRed', '207', 'brown', '129', '202', '12'],
\  'guifgs': ['CornflowerBlue', 'Green', 'DarkRed', 'HotPink', 'SaddleBrown', 'MediumPurple', 'OrangeRed', 'PaleGreen'],
\  'operators': CreateRainbowParenthesesOperators(),
\  'parentheses': ['start=/(/ skip=/\/\/.*$/ end=/)/ fold extend'],
\  'separately': {
\     '*': {},
\     'tex':
\        { 'parentheses': ['start=/(/ end=/)/'] },
\     'vim':
\        { 'parentheses': ['start=/(/ end=/)/', 'start=/(/ end=/)/ containedin=vimFuncBody'] },
\     'verilog_systemverilog':
\        { 'parentheses': ['start=/(/ skip=/\(\/\/.*$\)\|\(".\{-}"\)/ end=/)/ fold extend keepend',
\                          'start=/(/ skip=/\(\/\/.*$\)\|\(".\{-}"\)/ end=/)/ fold extend keepend containedin=verilogAssign'] },
\     'css': 0,
\  },
\}

" Key bindings
map <F3> :RainbowToggle<CR>
