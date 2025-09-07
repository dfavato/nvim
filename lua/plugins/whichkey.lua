return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        spec = {
            { "<leader>f", group = "Find" },
            { "<leader>d", group = "Debugger" },
            { "<leader>o", group = "Opencode" },
            { "m", group = "Bookmarks" },
        }
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
