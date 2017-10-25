"""""""""""""""""""""""""""""""""""""""""
" plugins.vim
" Author: Rui Pinheiro
"
" Loads and configures plugins
"""""""""""""""""""""""""""""""""""""""""

if has('nvim')
	call plug#begin('~/.config/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif
	"""""""""""
	" Plugins with separate configuration

	" Vim theme, color, etc
	call SourceDotfile('theme.vim')

	" Vim-airline
	call SourceDotfile('plugins/airline.vim')

	" Autocomplete
	call SourceDotfile('plugins/autocomplete.vim')

	" NERDTree
	call SourceDotfile('plugins/nerdtree.vim')

	" FastFold
	call SourceDotfile('plugins/fastfold.vim')

	" System Verilog highligting
	call SourceDotfile('plugins/system_verilog.vim')

	" Tagbar
	call SourceDotfile('plugins/tagbar.vim')

	" indentLine
	call SourceDotfile('plugins/indentline.vim')

	" EasyAlign
	call SourceDotfile('plugins/easyalign.vim')

	" Fzf fuzzy finder
	call SourceDotfile('plugins/fzf.vim')

	" Auto pairs
	call SourceDotfile('plugins/auto-pairs.vim')

	" Rainbow Parentheses
	call SourceDotfile('plugins/rainbow.vim')


	"""""""""""""""
	" Other plugins

	" Vim-Signature: Show marks
	Plug 'kshenoy/vim-signature' "Show marks

	" Vim-Easymotion: Faster motions
	Plug 'easymotion/vim-easymotion'

	" Vim-autoread: Reload files when they change on disk
	Plug 'djoshea/vim-autoread'

	" Bufexplorer: Easily navigate buffers using \be, \bv, \bs
	Plug 'jlanzarotta/bufexplorer'

	" Adds XtermColorTable command to list all available terminal colors
	"Plug 'guns/xterm-color-table.vim'

	" i3 status syntax
	Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'vim' }

	" Tmux syntax highlighting
	Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

	" Gitgutter: Shows signs for added, modifed, removed lines in current git repo
	Plug 'airblade/vim-gitgutter'

	" Vim-DevIcons: Adds a lot more icons to vim (e.g. NerdTree file types)
	" NOTE: Requires a "Nerd Font" (i.e. patched font), from https://github.com/ryanoasis/nerd-fonts
	Plug 'ryanoasis/vim-devicons'

call plug#end()
