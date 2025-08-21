return {
    {
        "sainnhe/edge", -- Colorscheme
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.edge_enable_italic = true
            vim.opt.termguicolors = true
            vim.g.edge_transparent_background = 2  -- more transparent elements
            vim.g.edge_dim_inactive_windows = 1
            vim.g.edge_float_style = "dim"
            vim.g.edge_diagnostic_virtual_text = "colored"
            vim.cmd([[colorscheme edge]])
        end
    },
}
