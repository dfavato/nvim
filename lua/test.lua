local M = {}
local get_buffer_contents = function (bufnr)
    -- Given a buffer returns its contents as a string
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    return table.concat(lines, "\n")
end
local get_buffer_name = function (bufnr)
    -- Given a buffer returns its name
    return vim.api.nvim_buf_get_name(bufnr)
end
local get_valid_buffers = function ()
    -- Loops through all buffers and returns a list of valid buffnrs
    -- Valid buffers are not hidden, not a terminal
    local bufs = vim.api.nvim_list_bufs()
    local valid_bufs = vim.iter(bufs):filter(function (bufnr)
        return vim.api.nvim_buf_is_loaded(bufnr)
            and vim.api.nvim_get_option_value("bufhidden", { buf = bufnr }) == false
            and vim.api.nvim_get_option_value("buftype", { buf = bufnr }) ~= "terminal"
            and vim.api.nvim_get_option_value("buftype", { buf = bufnr }) ~= "prompt"
    end)
    return valid_bufs:totable()
end
local get_buffers_info = function ()
    -- Loops through all buffers and returns a list of tables with bufnr, name and contents
    local bufs = get_valid_buffers()
    local buf_info = bufs:map(function (bufnr)
        return {
            bufnr = bufnr,
            name = get_buffer_name(bufnr),
            contents = get_buffer_contents(bufnr),
        }
    end)
    -- debug print the buf_info
    for k, v in pairs(buf_info) do
        print(v)
    end
    return buf_info
end
M.get_buffers_info = get_buffers_info
M.get_buffer_contents = get_buffer_contents
M.get_valid_buffers = get_valid_buffers
M.get_buffer_name = get_buffer_name
return M
