return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    init = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python",
                "javascript", "typescript", "sql", "html", "bash", "dockerfile", "fish",
                "htmldjango", "json", "latex", "markdown", "yaml", "vue", "svelte",
                "css", "norg", "scss", "tsx", "typst"},
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["as"] = "@statement.outer",
                    },
                },
            },
        })
    end,
    config = function()
        local install = require("nvim-treesitter.install")
        local ts_cli_version = require("nvim-treesitter.utils").ts_cli_version()
        if ts_cli_version then
            local version = vim.split(ts_cli_version, " ")[1]
            if version >= "0.26" or version < "0.20.2" then
                install.ts_generate_args = { "generate" }
            end
        end
    end,
}
