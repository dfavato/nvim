-- Listen for `opencode` events
vim.api.nvim_create_autocmd("User", {
    pattern = "OpencodeEvent",
    callback = function(args)
        -- See the available event types and their properties
        -- vim.notify(vim.inspect(args.data))
        -- Do something useful
        if args.data.type == "session.idle" then
            vim.notify("`opencode` Done!")
        end
    end,
})

return {
    'NickvanDyke/opencode.nvim',
    dependencies = {
        -- Recommended for better prompt input, and required to use opencode.nvim's embedded terminal. Otherwise optional.
        { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    keys = {
        -- Recommended keymaps
        { '<leader>oA',  function() require('opencode').ask('', { submit = true }) end,                             desc = 'Ask opencode', },
        { '<leader>os',  function() require('opencode').prompt('', { submit = true }) end,                          desc = 'Submit prompt',            mode = 'n', },
        { '<leader>oa',  function() require('opencode').prompt('@this') end,                                        desc = 'Add this to prompt',       mode = { 'n', 'v', }, },
        { '<leader>ob',  function() require('opencode').prompt('@buffer') end,                                      desc = 'Add buffer to prompt',     mode = 'n', },
        { "<leader>od",  function() require("opencode").ask("decompose the following task", { submit = true }) end, desc = "Decompose task" },
        { "<leader>oI",  function() require("opencode").ask("Implement @this task", { submit = true }) end,         desc = "Implement task" },
        { "<leader>of",  function() require("opencode").ask("help me debug @this") end,                             desc = "Debug" },
        { '<leader>ot',  function() require('opencode').toggle() end,                                               desc = 'Toggle embedded opencode', },
        { '<leader>on',  function() require('opencode').command('session_new') end,                                 desc = 'New session', },
        { '<leader>oy',  function() require('opencode').command('messages_copy') end,                               desc = 'Copy last message', },
        { '<leader>op',  function() require('opencode').select() end,                                               desc = 'Select prompt',            mode = { 'n', 'v', }, },
        { "<leader>oi",  function() require("opencode").command("session_interrupt") end,                           desc = "Interrupt session" },
        { "<leader>oc",  function() require("opencode").command("input_clear") end,                                 desc = "Clear input" },
        { "<leader>ol",  function() require("opencode").command("session_child_cycle") end,                         desc = "Child session" },
        { "<leader>oh",  function() require("opencode").command("session_child_cycle_reverse") end,                 desc = "Parent session" },
        { "<leader>oL",  function() require("opencode").command("cycle_agent") end,                                 desc = "Cycle agent" },
        { "<leader>oH",  function() require("opencode").command("session_child_cycle_reverse") end,                 desc = "Cycle agent reverse" },
        { '<C-k>',       function() require('opencode').command('messages_half_page_up') end,                       desc = 'Scroll messages up', },
        { '<C-j>',       function() require('opencode').command('messages_half_page_down') end,                     desc = 'Scroll messages down', },
        { '<leader>ogg', function() require('opencode').command('messages_first') end,                              desc = 'Scroll to top', },
        { '<leader>oG',  function() require('opencode').command('messages_last') end,                               desc = 'Scroll to bottom', },
        -- Example: keymap for custom prompt
        -- { '<leader>oe', function() require('opencode').prompt("Explain @cursor and its context") end, desc = "Explain code near cursor", },
    },
}
