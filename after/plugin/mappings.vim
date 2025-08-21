" Splits resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Folds
nnoremap <UP> zm
nnoremap <DOWN> zr

" Numbered motions are added to the jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'j'

" Workaround for wsltty not supporting some C-<key> mappings
if $WSL_DISTRO_NAME != ''
    nnoremap  <C-]>
endif

" Managing buffers
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>

" More convenient escape in terminal mode
tnoremap <esc><esc> <C-\><C-n>
