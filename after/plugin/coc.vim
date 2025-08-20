" You can add extensions names to the g:coc_global_extensions and coc will
" install the missing extensions after coc service started
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-git',
    \ 'coc-pyright',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-eslint',
    \ 'coc-yaml',
    \ 'coc-xml',
    \ 'coc-css',
    \ 'coc-vimlsp',
    \ 'coc-lua',
    \ 'coc-sql',
    \ ]

" Conqueror of completes configuration

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-W>d <Plug>(coc-float-hide)
nmap <silent> <C-W>f <Plug>(coc-float-jump)
nnoremap <silent> K :call ShowDocumentation()<CR>

function ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nnoremap <silent><F2> :CocCommand document.toggleInlayHint<CR>
nnoremap <silent><F3> :call CocActionAsync('showOutline')<CR>
nnoremap <silent><F4> :call CocActionAsync('showIncomingCalls')<CR>
nnoremap <silent><F5> :call CocActionAsync('showSubTypes')<CR>

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Highlight
highlight link CocErrorVirtualText ErrorMsg
highlight link CocWarningVirtualText WarningMsg
highlight link CocInfoVirtualText MoreMsg
highlight link CocHintVirtualText ModeMsg

command -nargs=0 OpenInGH :CocCommand git.browserOpen
command -nargs=0 CopyUrl :CocCommand git.copyUrl
