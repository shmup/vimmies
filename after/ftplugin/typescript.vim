setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s

noremap <buffer> <space>js :!node % <cr>

if executable('tsc')
  setlocal makeprg=tsc
  nnoremap <buffer><space>m :Dispatch tsc %<cr>
endif

if executable('prettier')
  let &l:formatprg = 'prettier --std-in'
endif
