local ok, _ = pcall(require, "lualine")
if not ok then
    return
end
require("lualine").setup {
    sections = {
        lualine_a = {
            { "mode", fmt = function (str) return str:sub(1, 1) end }
        },
        lualine_b = {
            { "branch", fmt = function (str) return str:sub(-30) end }
        },
        lualine_c = { "filename" },
        lualine_x = {
            {"diagnostics", sources={"coc"}},
            "encoding",
            "fileformat",
            "filetype"
        },
        lualine_y = { "progress" },
        lualine_z = { "location", { "datetime", style = "%H:%M" } },
    },
}
