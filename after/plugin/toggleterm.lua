local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    return
end
toggleterm.setup {
    open_mapping = [[<leader>t]],
}
vim.keymap.set("n", "<Enter>", "<cmd>silent ToggleTermSendCurrentLine<CR>", {noremap = true})
vim.keymap.set("v", "<Enter>", "<cmd>silent ToggleTermSendVisualLines<CR>", {noremap = true})

local bash = require("toggleterm.terminal").Terminal:new({
    cmd = "bash",
    count = 1,
    name = "bash",
    direction = "horizontal",
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>", {noremap = true})
    end,
})
bash:spawn()
function _bash_toggle()
    bash:toggle()
end
vim.keymap.set("n", "<leader>t", "<cmd>lua _bash_toggle()<CR>", {noremap = true})

local lazygit = require("toggleterm.terminal").Terminal:new({
    cmd = "lazygit",
    count = 2,
    name = "lazygit",
    direction = "float",
    float_opts = {
        border = "single",
        width = function ()
            return math.floor(vim.o.columns * 0.95)
        end,
        height = function ()
            return math.floor(vim.o.lines * 0.85)
        end,
    },
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true})
    end,
})
lazygit:spawn()
function _lazygit_toggle()
    lazygit:toggle()
end
vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true})
