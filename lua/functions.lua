local M = {}
local ok, _ = pcall(require, "telescope.builtin")
if not ok then
    return M
end
function M.edit_neovim()
    require("telescope.builtin").git_files({
        prompt_title = "< Neovim >",
        cwd = "~/.config/nvim/",
        layout_strategy = "horizontal",
        hidden=true
    })
end

return M
