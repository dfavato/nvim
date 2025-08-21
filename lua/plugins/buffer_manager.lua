local function open()
    buffer_manager = require("buffer_manager.ui")
    buffer_manager.toggle_quick_menu()
end
return {
    "j-morano/buffer_manager.nvim",  -- Buffer management
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>b", open }
    },
    opts = {
        show_indicators = "before",
        short_file_names = true,
        short_term_names = true,
    }
}
