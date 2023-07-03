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
set shiftwidth=0
set smarttab
set updatetime=40
set cursorline
set tags=tags
set notagrelative

filetype plugin indent on

set list
set shiftwidth=4 softtabstop=2 expandtab

autocmd VimLeave * mksession! .session.vim
let g:miniBufExplBuffersNeeded = 0
