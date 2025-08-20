lua << EOF
local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end
local actions = require("telescope.actions")

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<M-v>"] = actions.select_vertical,
				["<M-s>"] = actions.select_horizontal,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			n = {
				["v"] = actions.select_vertical,
				["s"] = actions.select_horizontal,
			},
		},
	},
}
EOF
nnoremap <leader>ff :lua require("telescope.builtin").find_files({hidden=true})<CR>
nnoremap <leader>fp :lua require("telescope.builtin").git_files({hidden=true})<CR>
nnoremap <leader>fd :lua require("telescope.builtin").find_files({cwd="~/"})<CR>
nnoremap <leader>fs :Telescope live_grep<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fr :Telescope oldfiles<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <C-p> :Telescope<CR>
