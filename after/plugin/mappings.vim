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

" More convenient escape in terminal mode
tnoremap <esc><esc> <C-\><C-n>

" Send current line to last terminal buffer and move cursor down
lua << EOF

local get_first_openned_terminal = function()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" and vim.fn.bufwinid(buf) ~= -1 then
        return buf
    end
  end
  return nil
end

local send_lines_to_terminal = function(lines)
  -- Find the last terminal buffer
  local buf = get_first_openned_terminal()
  for _, line in ipairs(lines) do
    vim.api.nvim_chan_send(vim.b[buf].terminal_job_id, line .. "\n")
  end
  -- Scroll terminal to bottom without activating it
  vim.api.nvim_buf_call(buf, function() vim.cmd('normal! G') end)
end

-- Send a sigle line to last terminal buffer and move cursor down
vim.keymap.set("n", ",", function()
  local line = vim.fn.trim(vim.api.nvim_get_current_line())
  -- Move cursor down
  vim.api.nvim_command("normal! j")
  send_lines_to_terminal({ line })
end, { noremap = true, silent = true })

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
    for i, line in ipairs(lines) do
        -- For block selection, extract the column range
        local segment = line:sub(start_col + indent, end_col)
        table.insert(selected_text, segment)
    end
    return selected_text
end

-- Send selected lines to last terminal buffer
vim.keymap.set({ "v", "x" }, ",", function()
  -- Get visual selection range
  local lines = get_selected_text()
  send_lines_to_terminal(lines)
end, { noremap = true, silent = true })
EOF


nnoremap <TAB> :tabnext<CR>
nnoremap <S-TAB> :tabprevious<CR>
