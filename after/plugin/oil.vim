lua<<EOF
require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    win_options = {
        number = true,
        relativenumber = true,
    }
})
EOF
