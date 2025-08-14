local ok, dap = pcall(require, "dap")
if not ok then
    return
end


local function is_coc_ready()
    ok, _ = pcall(vim.call, "coc#util#get_config", "python")
    if not ok then
        return false
    end
    return true
end


local function get_python_path()
    local python_path = vim.call("coc#util#get_config", "python")["pythonPath"]
    return python_path or "python"
end


local function wait_for_coc(callback)
    local timer = vim.uv.new_timer()
    timer:start(100, 100, vim.schedule_wrap(function()
        if is_coc_ready() then
            pcall(timer.stop, timer)
            pcall(timer.close, timer)
            callback()
        end
    end))
end


local function configure_dap()
    dap.adapters.python = {
        type = 'executable',
        command = get_python_path(),
        args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
        }
    }
end

wait_for_coc(configure_dap)
