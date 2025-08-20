local ok, buffer_manager = pcall(require, "buffer_manager")
if not ok then
    return
end

buffer_manager.setup({
    show_indicators = "before",
    short_file_names = true,
    short_term_names = true,
})

local ok, buffer_manager_ui = pcall(require, "buffer_manager.ui")
if not ok then
    return
end

vim.keymap.set(
    "n", "<leader>b",
    function()
        buffer_manager_ui.toggle_quick_menu()
    end,
    {noremap = true, silent = true}
)
