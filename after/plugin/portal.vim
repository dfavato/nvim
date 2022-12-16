lua << EOF
local portal = require "portal"
vim.keymap.set("n", "<leader>o", portal.jump_backward, {})
vim.keymap.set("n", "<leader>i", portal.jump_forward, {})
EOF
