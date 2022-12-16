lua << EOF
local telescope = require("telescope")
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
