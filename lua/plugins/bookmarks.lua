return {
    "MattesGroeger/vim-bookmarks",
    keys = {
        { "mm", "<cmd>BookmarkToggle<cr>", desc = "Toggle Bookmark" },
        { "mn", "<cmd>BookmarkNext<cr>", desc = "Next Bookmark" },
        { "mp", "<cmd>BookmarkPrev<cr>", desc = "Previous Bookmark" },
        { "ma", "<cmd>BookmarkShowAll<cr>", desc = "List Bookmarks" },
    },
    init = function()
        vim.g.bookmark_no_default_key_mappings = 1
        vim.g.bookmark_save_per_working_dir = 1
        vim.g.bookmark_auto_save = 1
    end
}
