if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --format\ compact
  autocmd BufWritePost <buffer> silent make! % | silent redraw!
endif

if executable('prettier')
  let &l:formatprg = 'prettier --option --option ...'
endif
