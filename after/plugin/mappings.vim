" Splits resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Folds
nnoremap <UP> zm
nnoremap <DOWN> zr

" Numbered motions are added to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'j'

" Workaround for wsltty not supporting some C-<key> mappings
if $WSL_DISTRO_NAME != ''
    nnoremap  <C-]>
endif

" Managing buffers
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>

" More convenient escape in terminal mode
tnoremap <esc><esc> <C-\><C-n>

" Send current line to last terminal buffer and move cursor down
lua << EOF
vim.keymap.set("n", ",", function()
  -- Get current line
  local line = vim.api.nvim_get_current_line()
  -- Move cursor down
  vim.api.nvim_command("normal! j")

   -- Find the last terminal buffer
   for _, buf in ipairs(vim.api.nvim_list_bufs()) do
     if vim.bo[buf].buftype == "terminal" then
       -- Send line to terminal (with newline)
       vim.api.nvim_chan_send(vim.b[buf].terminal_job_id, line .. "\n")
       -- Scroll terminal to bottom without activating it
       vim.api.nvim_buf_call(buf, function() vim.cmd('normal! G') end)
       break
     end
   end
end, { noremap = true, silent = true })
EOF

" Send all lines above the cursor to last terminal buffer
lua << EOF
vim.keymap.set("n", "<leader>,", function()
  -- Get current cursor position
  local cursor = vim.api.nvim_win_get_cursor(0)
  local current_line = cursor[1] - 1  -- 0-based

  -- Get all lines from start to current line
  local lines = vim.api.nvim_buf_get_lines(0, 0, current_line, false)

  -- Find the last terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      -- Send all lines to terminal (with newlines)
      for _, line in ipairs(lines) do
        vim.api.nvim_chan_send(vim.b[buf].terminal_job_id, line .. "\n")
      end
      -- Scroll terminal to bottom without activating it
      vim.api.nvim_buf_call(buf, function() vim.cmd('normal! G') end)
      break
    end
  end
end, { noremap = true, silent = true })
EOF

" Send selected lines to last terminal buffer
lua << EOF
vim.keymap.set("v", ",", function()
  -- Get visual selection range
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_line = start_pos[2] - 1  -- 0-based
  local end_line = end_pos[2]  -- inclusive

  -- Get selected lines
  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

  -- Find the last terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      -- Send selected lines to terminal (with newlines)
      for _, line in ipairs(lines) do
        vim.api.nvim_chan_send(vim.b[buf].terminal_job_id, line .. "\n")
      end
      -- Scroll terminal to bottom without activating it
      vim.api.nvim_buf_call(buf, function() vim.cmd('normal! G') end)
      break
    end
  end

  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
end, { noremap = true, silent = true })
EOF
