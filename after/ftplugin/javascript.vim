if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --format\ compact
  nnoremap <space>m :silent make! % \| redraw!<cr>
  " autocmd BufWritePost <buffer> silent make! % | silent redraw!
endif

if executable('prettier')
  let &l:formatprg = 'prettier --option --option ...'
endif
