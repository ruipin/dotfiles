"""""""""""""""""""""""""""""""""""""""""
" python.vim
" Author: Rui Pinheiro
"
" Python vim configuration
"""""""""""""""""""""""""""""""""""""""""

" ---
" In order to setup a virtualenv for neovim:
" - Install pyenv + pyenv-virtualenv
" - pyenv install 3.4.4
" - pyenv virtualenv 3.4.4 py3neovim
" - pyenv activate py3neovim
" - pip install neovim
" - pyenv which python # Use this path

function! DetectPyenv()
	if filereadable($PYENV_ROOT . "/versions/py3neovim/bin/python")
		let g:python3_host_prog = $PYENV_ROOT . '/versions/py3neovim/bin/python'
	endif
endfunction
call DetectPyenv()
