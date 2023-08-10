command Black :call CocAction('format')
setlocal shiftwidth=4 softtabstop=2 expandtab

" Highlight trailing whitespace
highlight pythonExtraWhitespace ctermbg=darkred guibg=darkred
autocmd BufWinEnter *.py match pythonExtraWhitespace /\s\+$\| \+\ze\t/
nnoremap <leader>f :Black<CR> :OR<CR>
