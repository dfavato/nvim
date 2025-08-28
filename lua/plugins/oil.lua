return {
    {
        "stevearc/oil.nvim",  -- File explorer
        keys = {
            { "-", function() require("oil").open() end, desc = "Open parent directory" }
        },
        opts = {
            default_file_explorer = true,
            skip_confirm_for_simple_edits = true,
            win_options = {
                number = true,
                relativenumber = true,
                signcolumn = "yes:2",
            }
        },
        dependencies = {
            {
                "nvim-mini/mini.icons", opts = {}
            },
        },
        lazy = false,
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = {
            "stevearc/oil.nvim",
        },
        config = true,
        lazy = false,
    }
}
