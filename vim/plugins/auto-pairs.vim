"""""""""""""""""""""""""""""""""""""""""
" auto-pairs.vim
" Author: Rui Pinheiro
"
" auto-pairs plugin and related configuration
"""""""""""""""""""""""""""""""""""""""""

Plug 'cohama/lexima.vim'

function! Lexima_endwise_make_rule(at, end, filetype, syntax)
  call lexima#add_rule({
  \ 'char': '<CR>',
  \ 'input': '<CR>',
  \ 'input_after': '<CR>' . a:end,
  \ 'at': a:at,
  \ 'except': '\C\v^(\s*)\S.*%#\n%(%(\s*|\1\s.+)\n)*\1' . a:end,
  \ 'filetype': a:filetype,
  \ 'syntax': a:syntax,
  \ })
endfunction

function! Lexima_endwise_SV_rule(open, close)
	call Lexima_endwise_make_rule('\<\%('.a:open.'\)\>.*\%#', a:close, 'verilog_systemverilog', [])
endfunction

autocmd VimEnter * call SetupLexima()
function SetupLexima()
	" SystemVerilog: Disable tick autocomplete for macros
	call lexima#add_rule({ 'char': '`', 'filetype': ['verilog', 'systemverilog', 'verilog_systemverilog'] })

	" SystemVerilog: Endwise rules
	call Lexima_endwise_SV_rule('begin','end')
	call Lexima_endwise_SV_rule('case\|casex\|casez','endcase')
	call Lexima_endwise_SV_rule('module','endmodule')
	call Lexima_endwise_SV_rule('if','endif')
	call Lexima_endwise_SV_rule('fork','join')
	call Lexima_endwise_SV_rule('function','endfunction')
	call Lexima_endwise_SV_rule('task','endtask')
	call Lexima_endwise_SV_rule('specify','endspecify')
	call Lexima_endwise_SV_rule('generate','endgenerate')
	call Lexima_endwise_SV_rule('primitive','endprimitive')
	call Lexima_endwise_SV_rule('table','endtable')
	call Lexima_endwise_SV_rule('class','endclass')
	call Lexima_endwise_SV_rule('checker','endchecker')
	call Lexima_endwise_SV_rule('interface','endinterface')
	call Lexima_endwise_SV_rule('clocking','endclocking')
	call Lexima_endwise_SV_rule('covergroup','endgroup')
	call Lexima_endwise_SV_rule('package','endpackage')
	call Lexima_endwise_SV_rule('property','endproperty')
	call Lexima_endwise_SV_rule('program','endprogram')
	call Lexima_endwise_SV_rule('sequence','endsequence')

	" Setup <CR> again
	if exists("*SetupAutoCompleteCRandTAB")
		call SetupAutoCompleteCRandTAB()
	endif
endfunction
