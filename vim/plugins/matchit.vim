"""""""""""""""""""""""""""""""""""""""""
" matchit.vim
" Author: Rui Pinheiro
"
" Matchit configuration
"""""""""""""""""""""""""""""""""""""""""

" Official matchit version
function! __blockcomment()
	" Load match-it
	"runtime macros/matchit.vim

	" Highlight Matchit plugin
	Plug 'vimtaku/hl_matchit.vim'

	" Enable automatically
	let g:hl_matchit_enable_on_vim_startup = 1

	" Highlight group. see :highlight
	let g:hl_matchit_hl_groupname = 'MatchParen'

	" 1 = faster, sometimes does not highlight
	" 2 = slower, always highlights
	let g:hl_matchit_speed_level = 2

	" hl_matchit filetypes
	"let g:hl_matchit_allow_ft = 'html,vim,sh'
endfunction



" Matchup, a drop-in replacement for matchit
Plug 'andymass/vim-matchup'

" Don't recognize anything inside comments
let g:matchup_delim_noskips = 2

" Enable deferred highlighting
let g:matchup_matchparen_deferred = 1

" Highlight surrounding delimiters (requires deferred highlighting)
let g:matchup_matchparen_hi_surround_always = 0
