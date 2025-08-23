return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
        },
        keys = {
            { "<F12>", "<cmd>Neotest summary<cr>", desc = "Neotest summary", noremap = true, silent = true },
        },
        opts = function()
            return {
                adapters = {
                    require("neotest-python")({
                        runner = "pytest",
                        args = {
                            "-q",
                            "-vv",
                            "--showlocals",
                            "--disable-warnings",
                            "--no-cov",
                            "--no-header"
                        },
                    })
                }
            }
        end,
    }
}
