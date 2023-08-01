"""""""""""""""""""""""""""""""""""""""""
" plugins.vim
" Author: Rui Pinheiro
"
" Loads and configures plugins
"""""""""""""""""""""""""""""""""""""""""

"""""
" Default to minimal mode when running as root, to reduce exposure
let g:minimalPlugins = get(g:, 'minimalPlugins', ($USER == 'root'))


" Utility functions
function! s:PlugFile(fname, is_minimal=0)
	if g:minimalPlugins && !a:is_minimal
		return
	endif

	call SourceDotfile(a:fname)
endfunction

function! s:Plug(...)
	if g:minimalPlugins
		return
	endif

	call call("plug#", a:000)
endfunction

function! s:PlugMinimal(...)
	call call("plug#", a:000)
endfunction


"""""
" Load vim-plugged
if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif


"""""
" Load plugins
	" Can be used to create new text objects
	" Some plugins depend on this
	call s:Plug('kana/vim-textobj-user')


	"""""""""""
	" Plugins with separate configuration

	" Vim theme, color, etc
	call s:PlugFile('theme.vim', 1)

	" Vim-airline
	call s:PlugFile('plugins/airline.vim', 1)

	" Autocomplete
	call s:PlugFile('plugins/autocomplete.vim')

	" NERDTree
	if !exists("g:gui_oni") && (has('nvim') || v:version >= 704)
		call s:PlugFile('plugins/nerdtree.vim', 1)
	endif

	" Fold
	call s:PlugFile('plugins/fold.vim')

	" System Verilog highlighting
	call s:PlugFile('plugins/system_verilog.vim')

	" indent
	call s:PlugFile('plugins/indent.vim', 1)

	" EasyAlign
	call s:PlugFile('plugins/easyalign.vim')

	" Fzf fuzzy finder
	call s:PlugFile('plugins/fzf.vim')

	" Auto pairs
	call s:PlugFile('plugins/auto-pairs.vim', 1)

	" Bufkill
	call s:PlugFile('plugins/bufkill.vim')

	" Rainbow Parentheses
	call s:PlugFile('plugins/rainbow.vim')

	" Matchit
	"call s:PlugFile('plugins/matchit.vim')

	" Undotree
	call s:PlugFile('plugins/undotree.vim')

	" Ctags
	"if has('nvim') || v:version >= 704
	"	call s:PlugFile('plugins/ctags.vim')
	"endif

	" vim-json: Better JSON formatting
	call s:PlugFile('plugins/json.vim')

	" Git plugins
	" Gitgutter: Shows signs for added, modifed, removed lines in current git repo
	" Fugitive: Git vim commands
	call s:PlugFile('plugins/git.vim')


	"""""""""""""""
	" Other plugins

	" Vim-Signature: Show marks
	call s:Plug('kshenoy/vim-signature') "Show marks

	" Vim-Easymotion: Faster motions
	"call s:Plug('easymotion/vim-easymotion')

	" Vim-autoread: Reload files when they change on disk
	"call s:Plug('djoshea/vim-autoread')

	" Bufexplorer: Easily navigate buffers using \be, \bv, \bs
	if has('nvim') || v:version >= 703
		call s:Plug('jlanzarotta/bufexplorer')
	endif

	" Adds XtermColorTable command to list all available terminal colors
	"call s:Plug('guns/xterm-color-table.vim')

	" i3 status syntax
	call s:Plug('PotatoesMaster/i3-vim-syntax', { 'for': 'vim' })

	" Tmux syntax highlighting
	call s:Plug('tmux-plugins/vim-tmux', { 'for': 'tmux' })

	" Vim-DevIcons: Adds a lot more icons to vim (e.g. NerdTree file types)
	" NOTE: Requires a "Nerd Font" (i.e. patched font), from https://github.com/ryanoasis/nerd-fonts
	call s:PlugMinimal('ryanoasis/vim-devicons')

	" Vim-Minimap
	" NOTE: Requires Braille glyph support
	"call s:Plug('severin-lemaignan/vim-minimap', { 'on': ['Minimap')] }

	" HiLinkTrace - debug highlight groups using :HLT
	"call s:Plug('gerw/vim-HiLinkTrace', { 'on': ['HLT', 'HLT!')] }

	" Abolish.vim: working with variants of a word
	" See github for examples, but I use it for %S (case-aware substitution)
	call s:Plug('tpope/vim-abolish')

	" commentary.vim: Adds the 'gc' mappings to comment/uncomment code automatically
	"call s:Plug('tpope/vim-commentary')

	" vc.vim: VCS commands
	"call s:Plug('juneedahamed/vc.vim')


"""""
" Done
call plug#end()
