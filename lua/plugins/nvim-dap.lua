return {
    {
        "igorlfs/nvim-dap-view",
        cmd = { "DapViewOpen", "DapViewClose", "DapViewToggle" },
        dependencies = {
            {
                "mfussenegger/nvim-dap",
            },
            {
                "mfussenegger/nvim-dap-python",
                keys = {
                    {
                        "<leader>d",
                        function ()
                            require("dap-python").test_method()
                            vim.cmd("DapViewOpen")
                        end,
                        desc = "Debug Method"
                    },
                },
                config = function ()
                    local dap_python = require("dap-python")
                    dap_python.setup(vim.g.python3_host_prog)
                end,
            }
        }
    }
}
