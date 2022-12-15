"Set the python path correctly
let g:python3_host_prog="/home/dfavato/.pyenv/shims/python"


call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'    " gcc for commenting
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'tc50cal/vim-terminal'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
call plug#end()


colorscheme jellybeans
source mappings.vim
source settings.vim
source commands.vim
