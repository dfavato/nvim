local function breadcrumbs ()
    return vim.fn["nvim_treesitter#statusline"]({
        transform_fn = function (line, _node)
            return line:gsub('%s*[%[%(%{]*%s*$', ''):gsub('%(.-%)', ''):gsub(':', '')
        end
    })
end
return {
    "nvim-lualine/lualine.nvim",  -- Status line
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
        sections = {
            lualine_a = {
                { "mode", fmt = function (str) return str:sub(1, 1) end }
            },
            lualine_b = {
                { "branch", fmt = function (str) return str:sub(-30) end },
            },
            lualine_c = {
                "diff",
                "filename",
                breadcrumbs,
            },
            lualine_x = {
                {"diagnostics", sources={"coc"}},
                "encoding",
                "fileformat",
                "filetype"
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    }
}
