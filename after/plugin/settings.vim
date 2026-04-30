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
set splitbelow
set splitright

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
endif

" OSC 52 clipboard - works over SSH via Windows Terminal
if !empty($SSH_TTY) || !empty($SSH_CONNECTION)
lua << EOF
local function osc52_copy(lines)
  local text = table.concat(lines, "\n")
  local b64 = vim.base64.encode(text)
  local osc = "\027]52;c;" .. b64 .. "\027\\"
  -- When running inside tmux, wrap with passthrough
  if vim.env.TMUX then
    osc = "\027Ptmux;\027" .. osc .. "\027\\"
  end
  io.stderr:write(osc)
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = function(lines, _) osc52_copy(lines) end,
    ["*"] = function(lines, _) osc52_copy(lines) end,
  },
  paste = {
    ["+"] = function() return { vim.fn.getreg("0", 1, true), vim.fn.getregtype("0") } end,
    ["*"] = function() return { vim.fn.getreg("0", 1, true), vim.fn.getregtype("0") } end,
  },
  cache_enabled = true,
}
EOF
endif
