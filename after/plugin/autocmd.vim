augroup Cursorline
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd CursorHold * setlocal cursorline
augroup END

autocmd VimLeave * mksession! .session.vim
