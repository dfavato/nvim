return {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        input = {},
        picker = {},
        terminal = {},
        bigfile = {},
        image = {
            force = true,
        },
        lazygit = {
        },
    },
    keys = {
        { "\\", function() require("snacks").lazygit() end, desc = "Lazygit" },
    },
}
