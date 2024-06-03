lua<<EOF
local ok, _ = pcall(require, "oil")
if not ok then
    return
end
require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    win_options = {
        number = true,
        relativenumber = true,
    }
})
EOF
