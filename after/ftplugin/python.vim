setlocal shiftwidth=4 softtabstop=2 expandtab

lua<<EOF
local ok, terminal = pcall(require, "toggleterm.terminal")
if not ok then
  return
end
if terminal.get(3, true) then
    return
end
local python = terminal.Terminal:new({
    cmd = "pipenv run python",
    count= 3,
    name = "python",
    direction = "horizontal",
    on_open = function(term)
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
    end
})
python:spawn()
EOF

function TestOutputOrDoc()
    if !empty(matchlist(getline('.'), 'def '))
        lua require('neotest').output.open()
    else
        call ShowDocumentation()
    endif
endfunction

" Highlight trailing whitespace
highlight pythonExtraWhitespace ctermbg=darkred guibg=darkred
augroup Python
    autocmd!
    autocmd BufWinEnter *.py match pythonExtraWhitespace /\s\+$\| \+\ze\t/
    autocmd BufWinEnter *.py nnoremap <buffer> <Enter> :silent ToggleTermSendCurrentLine 3<CR>
    autocmd BufWinEnter *.py vnoremap <buffer> <Enter> :silent ToggleTermSendVisualLines 3<CR>
    autocmd BufWritePost *.py :silent call CocAction('format')
    autocmd BufWritePost test_*.py lua require("neotest").run.run(vim.fn.expand("%"))
    autocmd BufWritePost test_*.py lua require("neotest").summary.open()
    autocmd BufWinEnter test_*.py nnoremap <buffer> K <cmd>call TestOutputOrDoc()<CR>
augroup END
