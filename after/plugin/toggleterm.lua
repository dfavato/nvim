local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    return
end
toggleterm.setup {
    open_mapping = [[<leader>t]],
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>", {noremap = true})
    end,
}
-- , sends line to terminal
vim.keymap.set(
    "n", ",",
    function()
        require("toggleterm").send_lines_to_terminal(
            "single_line", true, {args = vim.v.count}
        )
        vim.cmd("norm j")
    end,
    {noremap = true}
)
-- , sends selected lines to terminal
vim.keymap.set(
    "v", ",",
    function ()
        require("toggleterm").send_lines_to_terminal(
            "visual_lines", true, {args = vim.v.count}
        )
    end,
    {noremap = true}
)
-- <space>, sends selection to terminal
vim.keymap.set(
    "v", "<leader>s",
    function ()
        require("toggleterm").send_lines_to_terminal(
            "visual_selection", false, {args = vim.v.count}
        )
    end,
    {noremap = true}
)
-- <space>, sends line to terminal (does not trim whitespace)
vim.keymap.set(
    "n", "<space>,",
    function ()
        require("toggleterm").send_lines_to_terminal(
            "single_line", false, {args = vim.v.count}
        )
    vim.cmd("norm j")
    end,
    {noremap = true}
)
-- <space>, sends selected lines to terminal (does not trim whitespace)
vim.keymap.set(
    "v", "<space>,",
    function ()
        require("toggleterm").send_lines_to_terminal(
            "visual_lines", false, {args = vim.v.count}
        )
    end,
    {noremap = true}
)
vim.keymap.set(
    "n", "<F3>", "<cmd>ToggleTerm<CR>", {noremap = true}
)
vim.keymap.set(
    "t", "<F3>", "<cmd>ToggleTerm<CR>", {noremap = true}
)

local bash = require("toggleterm.terminal").Terminal:new({
    cmd = "bash",
    count = 1,
    name = "bash",
    direction = "horizontal",
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(
            term.bufnr, "t", "<Esc>", "<C-\\><C-n>",
            {noremap = true}
        )
    end,
})
bash:spawn()
function _bash_toggle()
    bash:toggle()
end
vim.keymap.set(
    "n", "<leader>t", "<cmd>lua _bash_toggle()<CR>",
    {noremap = true}
)

local lazygit = require("toggleterm.terminal").Terminal:new({
    cmd = "lazygit",
    count = 9,
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
        vim.api.nvim_buf_set_keymap(
            term.bufnr, "n", "q", "<cmd>close<CR>",
            {noremap = true}
        )
    end,
})
lazygit:spawn()
function _lazygit_toggle()
    lazygit:toggle()
end
vim.keymap.set(
    "n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>",
    {noremap = true}
)
