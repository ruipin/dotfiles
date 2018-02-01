"""""""""""""""""""""""""""""""""""""""""
" init.vim
" Author: Rui Pinheiro
"
" First file loaded by vimrc, responsible for sourcing all other necessary files
"""""""""""""""""""""""""""""""""""""""""

" Configuration file
call SourceDotfile('config.vim')

" Vimscript utilities
call SourceDotfile('script_utils.vim')

" Python
call SourceDotfile('python.vim')

" Plugins
call SourceDotfile('plugins.vim')

" Tab/Spaces
call SourceDotfile('tabs.vim')

" Input
call SourceDotfile('input.vim')

" Scrolling
call SourceDotfile('scrolling.vim')

" Miscellaneous
call SourceDotfile('misc.vim')

" Tmux
call SourceDotfile('tmux.vim')

" Auto Highlight
call SourceDotfile('auto_highlight.vim')

" Large Files
call SourceDotfile('large_files.vim')
