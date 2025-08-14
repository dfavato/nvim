local ok, neotest = pcall(require, "neotest")
if not ok then
    return
end
neotest.setup {
    adapters = {
        require("neotest-python")({
            runner = "pytest",
            args = { "-q", "-vv", "--showlocals", "--disable-warnings", "--no-cov", "--no-header" },
        })
    },
}
vim.keymap.set("n", "<F12>", "<cmd>Neotest summary<cr>", { noremap = true, silent = true, desc = "Neotest summary" })
