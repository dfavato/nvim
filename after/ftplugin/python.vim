setlocal shiftwidth=4 softtabstop=2 expandtab
setlocal makeprg=python\ %:S
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()

" Highlight trailing whitespace
highlight pythonExtraWhitespace ctermbg=darkred guibg=darkred
augroup Python
    autocmd!
    autocmd BufWinEnter *.py match pythonExtraWhitespace /\s\+$\| \+\ze\t/
    autocmd BufWinLeave *.py match pythonExtraWhitespace ""
augroup END

command! -nargs=0 Test :CocCommand pyright.singleTest
command! -nargs=0 TestAll :CocCommand pyright.fileTest
