local M = {}

function M.edit_neovim()
    require("telescope.builtin").find_files({
        prompt_title = "< Neovim >",
        cwd = "~/.config/nvim/",
        layout_strategy = "horizontal",
        hidden=true
    })
end

return M
