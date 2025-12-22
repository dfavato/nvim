return {
    'NickvanDyke/opencode.nvim',
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
        vim.keymap.set({ 'n', 'v', }, '<leader>op', function() require('opencode').select() end, { desc = 'Select prompt' })
        vim.keymap.set('n', '<leader>oA', function() require('opencode').ask('', { submit = false }) end, { desc = 'Ask opencode' })
        vim.keymap.set({ 'n', 'v', }, '<leader>oa', function() require('opencode').prompt('@this ') end, { desc = 'Add this to prompt' })
        vim.keymap.set('n', '<leader>ob', function() require('opencode').prompt('@buffer ') end, { desc = 'Add buffer to prompt' })
        vim.keymap.set({ 'n', }, '<leader>oo', function() require('opencode').toggle() end, { desc = 'Toggle embedded opencode' })
        vim.keymap.set('n', '<leader>os', function() require('opencode').command('prompt.submit') end, { desc = 'Submit prompt' })
        vim.keymap.set('n', '<leader>on', function() require('opencode').command('session.new') end, { desc = 'New session' })
        vim.keymap.set('n', '<leader>oy', function() require('opencode').command('messages_copy') end, { desc = 'Copy last message' })
        vim.keymap.set("n", "<leader>oi", function() require("opencode").command("session.interrupt") end, { desc = "Interrupt session" })
        vim.keymap.set("n", "<leader>oc", function() require("opencode").command("prompt.clear") end, { desc = "Clear input" })
        vim.keymap.set("n", "<leader>ol", function() require("opencode").command("session.child.cycle") end, { desc = "Child session" })
        vim.keymap.set("n", "<leader>oh", function() require("opencode").command("session.child.cycle.reverse") end, { desc = "Parent session" })
        vim.keymap.set("n", "<leader>oL", function() require("opencode").command("agent.cycle") end, { desc = "Cycle agent" })
        vim.keymap.set("n", "<leader>oH", function() require("opencode").command("agent.cycle.reverse") end, { desc = "Cycle agent reverse" })
        vim.keymap.set('n', '<leader>ogg', function() require('opencode').command('session.first') end, { desc = 'Scroll to top' })
        vim.keymap.set('n', '<leader>oG', function() require('opencode').command('session.last') end, { desc = 'Scroll to bottom' })
        vim.keymap.set('n', '<leader>ou', function() require('opencode').command('messages_undo') end, { desc = 'Undo last action' })
        vim.keymap.set('n', '<leader>or', function() require('opencode').command('messages_redo') end, { desc = 'Redo last undone action' })
        vim.keymap.set('n', '<C-k>', function() require('opencode').command('session.half.page.up') end, { desc = 'Scroll messages up' })
        vim.keymap.set('n', '<C-j>', function() require('opencode').command('session.half.page.down') end, { desc = 'Scroll messages down' })
    end,
}
