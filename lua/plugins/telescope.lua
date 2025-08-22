return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            }
        },
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "Find Files (hidden)" },
            { "<leader>fp", function() require("telescope.builtin").git_files({ hidden = true }) end, desc = "Find Git Files (hidden)" },
            { "<leader>fd", function() require("telescope.builtin").find_files({ cwd = "~/" }) end, desc = "Find Files (home)" },
            { "<leader>c", function() require("telescope.builtin").find_files({ cwd = "~/.config/nvim/" }) end, desc = "Find Config" },
            { "<leader>fs", ":Telescope live_grep<CR>", desc = "Live Grep" },
            { "<leader>ft", ":Telescope tags<CR>", desc = "Find Tags" },
            { "<leader>fr", ":Telescope oldfiles<CR>", desc = "Recent Files" },
            { "<leader>fh", ":Telescope help_tags<CR>", desc = "Help Tags" },
            { "<C-p>", ":Telescope<CR>", desc = "Telescope" },
        },
        cmd = "Telescope",
    },
}
