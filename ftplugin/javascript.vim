if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('prettier')
  let &l:formatprg = 'prettier --stdin --jsx-bracket-same-line --no-bracket-spacing --print-width 80 --single-quote --trailing-comma es5'
endif
