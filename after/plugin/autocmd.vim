augroup Cursorline
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd CursorHold * setlocal cursorline
augroup END

autocmd VimLeave * mksession! .session.vim
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}

augroup Markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spelllang=en_us
augroup END
