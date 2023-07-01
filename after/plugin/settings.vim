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
set scrolloff=0 " Maintain cursor in the middle
set shiftwidth=0
set smarttab
set updatetime=300
set cursorline
set tags=tags
set notagrelative

filetype plugin indent on

set list
set shiftwidth=4 softtabstop=2 expandtab

autocmd VimLeave * mksession! .session.vim
