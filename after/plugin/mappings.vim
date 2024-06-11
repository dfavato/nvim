" Keyboard shortcuts
map <space> <leader>
nnoremap <F2> :CocCommand document.toggleInlayHint<CR>
nnoremap <leader>pwd :echo expand("%:p")<CR>
nnoremap <leader>ff :lua require("telescope.builtin").find_files({hidden=true})<CR>
nnoremap <leader>fp :lua require("telescope.builtin").git_files({hidden=true})<CR>
nnoremap <leader>fd :lua require("telescope.builtin").find_files({cwd="~/"})<CR>
nnoremap <leader>fs :Telescope live_grep<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fr :Telescope oldfiles<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <C-p> :Telescope<CR>

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
