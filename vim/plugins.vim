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
	source $VIMRC_PATH/theme.vim

	" Vim-airline
	source $VIMRC_PATH/plugins/airline.vim

	" Autocomplete
	source $VIMRC_PATH/plugins/autocomplete.vim

	" NERDTree
	source $VIMRC_PATH/plugins/nerdtree.vim

	" FastFold
	source $VIMRC_PATH/plugins/fastfold.vim

	" System Verilog highligting
	source $VIMRC_PATH/plugins/system_verilog.vim

	" Tagbar
	source $VIMRC_PATH/plugins/tagbar.vim

	" indentLine
	source $VIMRC_PATH/plugins/indentline.vim

	" EasyAlign
	source $VIMRC_PATH/plugins/easyalign.vim

	" Fzf fuzzy finder
	source $VIMRC_PATH/plugins/fzf.vim

	" Auto pairs
	source $VIMRC_PATH/plugins/auto-pairs.vim

	" Rainbow Parentheses
	source $VIMRC_PATH/plugins/rainbow.vim


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
	Plug 'PotatoesMaster/i3-vim-syntax'

	" Allow to close buffers without closing split
	Plug 'qpkorr/vim-bufkill'

	" Tmux syntax highlighting
	Plug 'tmux-plugins/vim-tmux'

call plug#end()
