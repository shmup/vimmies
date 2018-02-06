noremap <buffer> <space>py :!python % <cr>

if executable('flake8')
  setlocal errorformat=%f:%l:%c:%m
  setlocal makeprg=flake8
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('yapf')
  let &l:formatprg = 'yapf'
endif
