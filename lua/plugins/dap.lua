return {
    {
        "igorlfs/nvim-dap-view",
        cmd = { "DapViewOpen", "DapViewClose", "DapViewToggle" },
        opts = {
            winbar = {
                sections = {
                    "console",
                    "repl",
                    "scopes",
                    "threads",
                    "breakpoints",
                    "watches",
                    "sessions",
                    "exceptions",
                },
            }
        },
        init = function()
            local dap = require("dap")
            dap.listeners.after.event_initialized["my_dap_view"] = function(session, _)
                -- update state.exceptions_options to the current defaults
                local state = require("dap-view.state")
                local adapter = session.config.type
                local defaults = dap.defaults[adapter].exception_breakpoints or {}
                for _, option in pairs(state.exceptions_options[adapter] or {}) do
                    option.enabled = vim.tbl_contains(defaults, option.exception_filter.filter)
                end
            end
            dap.listeners.after.event_stopped["my_dap_view"] = function(session, body)
                if body.reason == "exception" then
                    vim.cmd("DapViewShow scopes")
                end
            end
        end,
        dependencies = {
            {
                "mfussenegger/nvim-dap",
                keys = {
                    { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
                    { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
                    { "<leader>dn", "<cmd>DapStepOver<cr>", desc = "Step Over" },
                    { "<leader>dq", "<cmd>DapTerminate<cr>", desc = "Quit" },
                },
                cmd = { "DapNew", "DapContinue", "DapStepOver", "DapStepInto", "DapStepOut", "DapTerminate" },
                init = function()
                    vim.api.nvim_create_autocmd("FileType", {
                        pattern = "dap-repl",
                        callback = function()
                            vim.keymap.set("i", "<C-space>", "<C-x><C-o>", { buffer = true })
                            vim.keymap.set("i", "<TAB>", "<C-n>", { buffer = true })
                            vim.keymap.set("i", "<S-TAB>", "<C-p>", { buffer = true })
                        end,
                    })
                end
            },
            {
                "mfussenegger/nvim-dap-python",
                keys = {
                    {
                        "<leader>dt",
                        function()
                            vim.cmd("DapViewOpen")
                            require("dap-python").test_method()
                            vim.cmd("DapViewShow console")
                        end,
                        desc = "Debug Method"
                    },
                },
                ft = { "python" },
                config = function()
                    require("dap-python").setup(vim.g.python3_host_prog)
                    require('dap').defaults.python.exception_breakpoints = { 'uncaught', 'userUnhandled' }
                end,
                dependencies = {
                    {
                        "theHamsta/nvim-dap-virtual-text",
                        opts = { enable_commands = true },
                        cmd = { "DapVirtualTextEnable", "DapVirtualTextDisable" }
                    }
                }
            }
        }
    }
}
