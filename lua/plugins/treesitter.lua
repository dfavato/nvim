return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",  -- Extra text objects
    },
}
