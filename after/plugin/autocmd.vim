autocmd VimLeave * mksession! .session.vim
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
