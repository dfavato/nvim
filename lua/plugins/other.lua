return {
    {
        "ap/vim-css-color",  -- Highlight colors in css
        lazy = false,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git",
    },
    {
        "tpope/vim-surround",  -- Change quotes and brackets
        lazy = false,
    },
    {
        "tpope/vim-commentary",  -- gcc for commenting
        lazy = false
    },
    {
        "antoinemadec/FixCursorHold.nvim",
        lazy = false,
    },  -- Fix CursorHold event to improve Coc performance
    {
        "goerz/jupytext.vim",  -- Jupyter support
        lazy = false,
    },
    {
        "sphamba/smear-cursor.nvim",
        lazy = false,
        opts = {
            smear_to_cmd = false,
            legacy_computing_symbols_support = true,
            smear_between_neighbor_lines = false,
            smear_insert_mode = false,
            never_draw_over_target = true,
        },
    },
}
