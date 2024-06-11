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
set shiftwidth=0
set smarttab
set updatetime=40
set tags=tags
set notagrelative
set exrc
set foldmethod=expr
set foldexpr=v:lua.vim.treesitter.foldexpr()
set foldlevelstart=3

filetype on
filetype plugin indent on

set list
set shiftwidth=4 softtabstop=2 expandtab
set laststatus=3

function IsFloatingWindow()
    return win_gettype(win_getid()) ==# 'popup'
endfunction

set winbar=
augroup Winbar
    autocmd!
    autocmd WinEnter * setlocal winbar=
    autocmd WinLeave * if !IsFloatingWindow() | setlocal winbar=%n\ %.20f | endif
augroup END
