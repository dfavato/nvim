local ok, neotest = pcall(require, "neotest")
if not ok then
    return
end
neotest.setup {
    adapters = {
        require("neotest-python")({
                runner = "pytest",
            })
    },
}
