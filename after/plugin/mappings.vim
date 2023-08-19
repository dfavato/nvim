" Keyboard shortcuts
map <space> <leader>
nnoremap <leader>term :TerminalSplit bash<CR>
nnoremap <F3> :TagbarToggle<CR>
nnoremap <F5> :!git ls-files \| ctags --tag-relative -L -<CR>
nnoremap <leader>pwd :echo expand("%:p")<CR>
nnoremap <leader>ff :lua require("telescope.builtin").find_files({hidden=true})<CR>
nnoremap <leader>fp :lua require("telescope.builtin").git_files({hidden=true})<CR>
nnoremap <leader>fd :lua require("telescope.builtin").find_files({cwd="~/"})<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fr :Telescope oldfiles<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <C-p> :Telescope<CR>

" Splits resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Numbered motions are added to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'j'

nnoremap <leader>c <cmd>lua require('functions').edit_neovim()<CR>

lua << EOF
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
EOF
