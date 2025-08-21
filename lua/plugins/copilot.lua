return {
    "github/copilot.vim",
    keys = {
        { "<C-f>", mode = {"i"}, "<Plug>(copilot-accept-line)" },
        { "<DOWN>", mode = {"i"}, 'copilot#Accept("")', expr = true, replace_keycodes = false },
    },
    init = function()
        vim.g.copilot_no_tab_map = true
    end,
    lazy = false,
}
