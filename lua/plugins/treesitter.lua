return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",      -- Show context at top of window
        "nvim-treesitter/nvim-treesitter-textobjects",  -- Extra text objects
    },
}
