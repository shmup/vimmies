if executable('perl')
  noremap <buffer> <space>pl :!perl % <cr>
endif

if executable('perltidy')
  let &l:formatprg = 'perltidy - %'
endif
