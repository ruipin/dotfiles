"""""""""""""""""""""""""""""""""""""""""
" wsl.vim
" Author: Rui Pinheiro
"
" WSL-related configuration
"""""""""""""""""""""""""""""""""""""""""

" System clipboard support
let g:clipboard = {
  \   'name': 'WslClipboard',
  \   'copy': {
  \      '+': '/mnt/c/Windows/System32/clip.exe',
  \      '*': '/mnt/c/Windows/System32/clip.exe',
  \    },
  \   'paste': {
  \      '+': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \      '*': '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  \   },
  \   'cache_enabled': 0,
  \ }
