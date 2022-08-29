if executable('prettier')
  let &l:formatprg = 'prettier --stdin-filepath %'
endif
