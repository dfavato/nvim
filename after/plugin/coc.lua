-- You can add extensions names to the g:coc_global_extensions and coc will
-- install the missing extensions after coc service started
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-git',
  'coc-pyright',
  'coc-tsserver',
  'coc-html',
  'coc-eslint',
  'coc-yaml',
  'coc-xml',
  'coc-css',
  'coc-vimlsp',
  'coc-lua',
  'coc-sql',
}

-- Conqueror of completes configuration

local function check_backspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- Tab completion
vim.keymap.set('i', '<Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  elseif check_backspace() then
    return '<Tab>'
  else
    return vim.fn['coc#refresh']()
  end
end, { expr = true, silent = true })

vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, { expr = true })

-- Refresh completion
if vim.fn.has('nvim') == 1 then
  vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })
else
  vim.keymap.set('i', '<C-@>', 'coc#refresh()', { expr = true, silent = true })
end

-- Navigation mappings
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', '<C-W>d', '<Plug>(coc-float-hide)', { silent = true })
vim.keymap.set('n', '<C-W>f', '<Plug>(coc-float-jump)', { silent = true })

-- Documentation
vim.keymap.set('n', 'K', function()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_feedkeys('K', 'in', false)
  end
end, { silent = true })

-- Floating window scrolling
vim.keymap.set('n', '<C-j>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    return vim.fn['coc#float#scroll'](1)
  else
    return '<C-f>'
  end
end, { expr = true, silent = true, nowait = true })

vim.keymap.set('n', '<C-k>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    return vim.fn['coc#float#scroll'](0)
  else
    return '<C-b>'
  end
end, { expr = true, silent = true, nowait = true })

vim.keymap.set('i', '<C-j>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    return '<c-r>=coc#float#scroll(1)<cr>'
  else
    return '<Right>'
  end
end, { expr = true, silent = true, nowait = true })

vim.keymap.set('i', '<C-k>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    return '<c-r>=coc#float#scroll(0)<cr>'
  else
    return '<Left>'
  end
end, { expr = true, silent = true, nowait = true })

vim.keymap.set('v', '<C-j>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    return vim.fn['coc#float#scroll'](1)
  else
    return '<C-f>'
  end
end, { expr = true, silent = true, nowait = true })

vim.keymap.set('v', '<C-k>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    return vim.fn['coc#float#scroll'](0)
  else
    return '<C-b>'
  end
end, { expr = true, silent = true, nowait = true })

-- Function key mappings
vim.keymap.set('n', '<F2>', ':CocCommand document.toggleInlayHint<CR>', { silent = true, desc = 'Toggle inlay hints' })
vim.keymap.set('n', '<F3>', function() vim.fn.CocActionAsync('showOutline') end, { silent = true, desc = 'Show outline' })
vim.keymap.set('n', '<F4>', function() vim.fn.CocActionAsync('showIncomingCalls') end, { silent = true, desc = 'Show incoming calls' })
vim.keymap.set('n', '<F5>', function() vim.fn.CocActionAsync('showSubTypes') end, { silent = true, desc = 'Show sub types' })

-- Custom commands
vim.api.nvim_create_user_command('Format', function() vim.fn.CocActionAsync('format') end, { nargs = 0 })
vim.api.nvim_create_user_command('OR', function() vim.fn.CocActionAsync('runCommand', 'editor.action.organizeImport') end, { nargs = 0 })
vim.api.nvim_create_user_command('OpenInGH', 'CocCommand git.browserOpen', { nargs = 0 })
vim.api.nvim_create_user_command('CopyUrl', 'CocCommand git.copyUrl', { nargs = 0 })
