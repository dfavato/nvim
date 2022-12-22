call plug#begin()
Plug 'almo7aya/openingh.nvim'  " Use OpenInGH command to open files in GitHub
Plug 'ap/vim-css-color'  " Highlight colors in css
Plug 'cbochs/portal.nvim'  " Jumps with <leader>o and <leader>i
Plug 'folke/which-key.nvim'  " Show keybindings
Plug 'github/copilot.vim'
Plug 'lukas-reineke/indent-blankline.nvim'  " Indent guides
Plug 'mfussenegger/nvim-fzy'  " Fuzzy search with :Search [path]
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'  " Telescope dependency
Plug 'nvim-telescope/telescope.nvim', {'branch': '0.1.x'}  " Fuzzy search <c-p>
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Improve highlights
Plug 'preservim/nerdtree'  " File explorer
Plug 'preservim/tagbar'
Plug 'rafi/awesome-vim-colorschemes'  " Color schemes
Plug 'ryanoasis/vim-devicons'  " Icons
Plug 'tc50cal/vim-terminal'  " Terminal
Plug 'tpope/vim-commentary'    " gcc for commenting
Plug 'tpope/vim-surround'  " Change quotes and brackets
Plug 'vim-airline/vim-airline'  " Status line
call plug#end()


silent! colorscheme jellybeans
