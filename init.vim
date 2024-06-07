call plug#begin()
Plug 'almo7aya/openingh.nvim'  " Use OpenInGH command to open files in GitHub
Plug 'akinsho/toggleterm.nvim' " Terminal
Plug 'andythigpen/nvim-coverage'
Plug 'ap/vim-css-color'  " Highlight colors in css
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Autocomplete
Plug 'nvim-lua/plenary.nvim'  " Telescope dependency
Plug 'nvim-lualine/lualine.nvim'  " Status line
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim', {'branch': '0.1.x'}  " Fuzzy search <c-p>
Plug 'nvim-tree/nvim-web-devicons'  " Icons
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " Improve highlights
Plug 'preservim/tagbar'
Plug 'pwntester/octo.nvim'  " GitHub insied vim
Plug 'ryanoasis/vim-devicons'  " Icons
Plug 'sainnhe/edge' " Colorscheme
Plug 'sheerun/vim-polyglot'  " Syntax highlighting
Plug 'sindrets/diffview.nvim'  " :DiffviewOpen
Plug 'stevearc/oil.nvim' " File explorer
Plug 'tpope/vim-commentary'    " gcc for commenting
Plug 'tpope/vim-fugitive'  " Git
Plug 'tpope/vim-surround'  " Change quotes and brackets
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'nvim-neotest/nvim-nio'
Plug 'nvim-neotest/neotest'
Plug 'nvim-neotest/neotest-python'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-dispatch'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
call plug#end()


if has('termguicolors')
  set termguicolors
endif
let g:edge_transparent_background = 1
let g:edge_dim_inactive_windows = 1
try
	colorscheme edge
catch /^Vim\%((\a\+)\)\=:E185:/ " catch error E185
	colorscheme darkblue
endtry
highlight NvimInternalError ctermbg=darkred guibg=darkred
highlight! link RedrawDebugClear Substitute
highlight SneakLabelMask ctermbg=NONE guibg=NONE
highlight CursorLine guibg=#252525
let g:python3_host_prog = '~/.config/nvim/.venv/bin/python'

syntax match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red

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
