setlocal wrap

augroup Markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spelllang=en_us
augroup END
