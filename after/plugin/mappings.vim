" Keyboard shortcuts
map <space> <leader>

" Splits resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Folds
nnoremap <UP> zm
nnoremap <DOWN> zr

" Numbered motions are added to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'j'

nnoremap <leader>c <cmd>lua require('functions').edit_neovim()<CR>

lua << EOF
local ok, _ = pcall(require, "oil")
if ok then
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
end
EOF

" Workaround for wsltty not supporting some C-<key> mappings
nnoremap  <C-]>

" Managing buffers
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>

tnoremap <esc><esc> <C-\><C-n>
