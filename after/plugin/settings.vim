" Basics
set autoindent
set encoding=utf-8
set mouse=a
set nobackup
set noswapfile
set nowrap
set nowritebackup
set number
set relativenumber
set scrolloff=5
set sidescroll=10
set smarttab
set updatetime=40
set foldlevelstart=3
set foldmethod=indent
set path+=**

if has('termguicolors')
  set termguicolors
endif

filetype on
filetype plugin indent on

set list
set shiftwidth=4 softtabstop=2 expandtab
set laststatus=3

set fileformats=unix,dos,mac

function IsFloatingWindow()
    return win_gettype(win_getid()) ==# 'popup'
endfunction

function IsTerminalWindow()
    return &buftype ==# 'terminal'
endfunction

function ShouldHideWinbar()
    return IsFloatingWindow() || IsTerminalWindow()
endfunction

set winbar=%n\ %.80f
augroup Winbar
    autocmd!
    autocmd WinEnter * if ShouldHideWinbar() | setlocal winbar= | endif
augroup END

let g:edge_transparent_background = 1
let g:edge_dim_inactive_windows = 1
let g:python3_host_prog = '~/.config/nvim/.venv/bin/python'

" WSL clipboard (directly from help)
if executable('clip.exe') && executable('powershell.exe')
    let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
end
