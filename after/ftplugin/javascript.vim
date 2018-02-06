if executable('eslint')
  setlocal makeprg=eslint\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('prettier')
  let &l:formatprg = 'prettier --stdin --no-bracket-spacing --print-width 80 --single-quote --trailing-comma es5'
endif
