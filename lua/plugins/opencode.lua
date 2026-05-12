local get_opencode_channel = function()
    -- loop through buffers to find the one with b:term_title = 'OpenCode'
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local ok, title = pcall(vim.api.nvim_buf_get_var, buf, 'term_title')
        if ok then
            if title == 'OpenCode' or string.match(title, 'OC |') then
                return vim.api.nvim_buf_get_var(buf, 'terminal_job_id')
            end
        end
    end
    return nil
end

local function chansend_to_opencode(str)
    local channel = get_opencode_channel()
    if channel then
        vim.fn.chansend(channel, str .. "\n")
    else
        print("OpenCode terminal not found")
    end
end

local function get_selected_text()
    -- Exit visual mode to update marks
    local mode = vim.fn.mode()
    if mode:match("[vV\22]") then
        vim.cmd('normal! \27')
    end

    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    local start_line, start_col = start_pos[2], start_pos[3]
    local end_line, end_col = end_pos[2], end_pos[3]

    -- If first line is indented, remove the indentation from all lines
    local indent = vim.fn.indent(start_line)

    local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

    local selected_text = {}
    for _, line in ipairs(lines) do
        -- For block selection, extract the column range
        local segment = line:sub(start_col + indent, end_col)
        table.insert(selected_text, segment)
    end
    return selected_text
end


local function send_selection_to_opencode()
    local selected_text = get_selected_text()
    if #selected_text > 0 then
        local text = table.concat(selected_text, "\n")
        chansend_to_opencode(text)
    else
        print("No text selected")
    end
end

return {
    "dfavato/opencode.nvim",
    branch = "fix/pgrep-v0.3.0",
    dependencies = {
        { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    lazy = false,
    config = function()
        vim.g.opencode_opts = {
            provider = {
                snacks = {
                    win = {
                        width = 0.3,
                    },
                }
            },
        }
        vim.keymap.set({ 'n', 'v', }, '<leader>op', function() require('opencode').select() end,
            { desc = 'Select prompt' })
        vim.keymap.set('n', '<leader>oA', function() require('opencode').ask('', { submit = true }) end,
            { desc = 'Ask opencode' })
        vim.keymap.set({ 'n', 'v', }, '<leader>oa', function() require('opencode').prompt('\n@this\n') end,
            { desc = 'Add this to prompt' })
        vim.keymap.set('n', '<leader>ob', function() require('opencode').prompt('\n@buffer\n') end,
            { desc = 'Add buffer to prompt' })
        vim.keymap.set({ 'n', }, '<leader>oo', function() require('opencode').toggle() end,
            { desc = 'Toggle embedded opencode' })
        vim.keymap.set('n', '<leader>os', function() require('opencode').command('prompt.submit') end,
            { desc = 'Submit prompt' })
        vim.keymap.set('n', '<leader>on', function() require('opencode').command('session.new') end,
            { desc = 'New session' })
        vim.keymap.set('n', '<leader>oy', function() require('opencode').command('messages_copy') end,
            { desc = 'Copy last message' })
        vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session.interrupt") end,
            { desc = "Interrupt session" })
        vim.keymap.set("n", "<leader>oc", function() require("opencode").command("prompt.clear") end,
            { desc = "Clear input" })
        vim.keymap.set("n", "<leader>ol", function() require("opencode").command("session.child.cycle") end,
            { desc = "Child session" })
        vim.keymap.set("n", "<leader>oh", function() require("opencode").command("session.child.cycle.reverse") end,
            { desc = "Parent session" })
        vim.keymap.set("n", "<leader>oL", function() require("opencode").command("agent.cycle") end,
            { desc = "Cycle agent" })
        vim.keymap.set("n", "<leader>oH", function() require("opencode").command("agent.cycle.reverse") end,
            { desc = "Cycle agent reverse" })
        vim.keymap.set('n', '<leader>ogg', function() require('opencode').command('session.first') end,
            { desc = 'Scroll to top' })
        vim.keymap.set('n', '<leader>oG', function() require('opencode').command('session.last') end,
            { desc = 'Scroll to bottom' })
        vim.keymap.set('n', '<leader>ou', function() require('opencode').command('messages_undo') end,
            { desc = 'Undo last action' })
        vim.keymap.set('n', '<leader>or', function() require('opencode').command('messages_redo') end,
            { desc = 'Redo last undone action' })
        vim.keymap.set('n', '<C-k>', function() require('opencode').command('session.half.page.up') end,
            { desc = 'Scroll messages up' })
        vim.keymap.set('n', '<C-j>', function() require('opencode').command('session.half.page.down') end,
            { desc = 'Scroll messages down' })
        vim.keymap.set('x', '<leader>op', send_selection_to_opencode, { desc = 'Send selection to OpenCode' })
    end,
}
