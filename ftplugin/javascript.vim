setlocal foldmethod=syntax

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --no-ignore\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('prettier')
  let &l:formatprg = 'prettier --stdin --jsx-bracket-same-line --no-bracket-spacing --print-width 80 --single-quote --trailing-comma none'
endif

if executable('tmux')
  nnoremap <buffer>,t :Dispatch npm run --prefix portal local-integration-wip<cr>
  nnoremap <buffer>,d :Dispatch<cr>
endif

