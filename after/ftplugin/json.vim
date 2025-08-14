setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()

augroup Json
    autocmd!
    autocmd BufWinEnter *.json :CocOutline
augroup END
