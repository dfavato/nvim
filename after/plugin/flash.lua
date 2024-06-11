local ok, flash = pcall(require, "flash")
if not ok then
    return
end
vim.api.nvim_set_keymap("n", "s", "<cmd>lua require('flash').jump()<CR>", { noremap = true, silent = true })
