return {
  'nanozuki/tabby.nvim',
  opts = {},
  cmd = 'Tabby',
  lazy = false,
  keys = {
    { '<leader>tr', ':Tabby rename_tab ', desc = 'Rename tab' },
    { '<leader>tj', ':Tabby jump_to_tab<CR>', desc = 'Jump to tab' },
    { '<leader>tp', ':Tabby pick_window<CR>', desc = 'Pick window' },
  },
}
