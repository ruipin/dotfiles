"""""""""""""""""""""""""""""""""""""""""
" system_verilog.vim
" Author: Rui Pinheiro
"
" Verilog/System Verilog syntax highlighting
"""""""""""""""""""""""""""""""""""""""""

" Load plugin
Plug 'vhda/verilog_systemverilog.vim'

" Set file types
au bufread,bufnewfile *.vh set filetype=verilog
au bufread,bufnewfile *.mv set filetype=verilog
au bufread,bufnewfile *.sv set filetype=verilog_systemverilog
au bufread,bufnewfile *.svh set filetype=verilog_systemverilog