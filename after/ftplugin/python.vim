noremap <buffer> <space>py :!python % <cr>

if executable('yapf')
  let &l:formatprg = 'yapf'
endif
