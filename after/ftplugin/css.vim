if executable('prettier')
  let &l:formatprg = 'npx prettier --stdin-filepath %'
endif
