setlocal shiftwidth=4 softtabstop=2 expandtab
TSBufEnable highlight

" Highlight trailing whitespace
highlight pythonExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufWinEnter *.py match pythonExtraWhitespace /\s\+$\| \+\ze\t/
