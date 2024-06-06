setlocal shiftwidth=4 softtabstop=2 expandtab
setlocal makeprg=pipenv\ run\ python\ %:S

lua<<EOF
function _start_python_terminal()
    local ok, terminal = pcall(require, "toggleterm.terminal")
    if not ok then
        print("toggleterm.terminal not found")
      return
    end
    if terminal.get(8, true) then
        return
    end
    print("Creating python terminal")
    local python = terminal.Terminal:new({
        cmd = "pipenv run python",
        count= 8,
        name = "python",
        direction = "horizontal",
        on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
        end
    })
    python:spawn()
end
_start_python_terminal()

function _restart_python_terminal()
    local ok, terminal = pcall(require, "toggleterm.terminal")
    if not ok then
        return
    end
    local python = terminal.get(8, true)
    if python then
        python:shutdown()
    end
    _start_python_terminal()
end
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
    autocmd BufWinEnter *.py nnoremap <buffer> <F5> <cmd>lua _restart_python_terminal()<CR>
    autocmd BufWritePost *.py :silent call CocAction('format')
    autocmd BufWritePost test_*.py lua require("neotest").run.run(vim.fn.expand("%"))
    autocmd BufWritePost test_*.py lua require("neotest").summary.open()
    autocmd BufWinEnter test_*.py nnoremap <buffer> K <cmd>call TestOutputOrDoc()<CR>
augroup END
