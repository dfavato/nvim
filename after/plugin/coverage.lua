local ok, _ = pcall(require, "coverage")
if not ok then
    return
end
require("coverage").setup()
