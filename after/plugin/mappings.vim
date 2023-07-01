" Keyboard shortcuts
map <space> <leader>
nnoremap <leader>term :TerminalSplit bash<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarOpenAutoClose<CR>
nnoremap <F5> :silent !ctags -R<CR>
nnoremap <leader>pwd :echo expand("%:p")<CR>
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>ft :Telescope tags<CR>
nnoremap <leader>fr :Telescope oldfiles<CR>
nnoremap <C-p> :Telescope<CR>

" Splits resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
