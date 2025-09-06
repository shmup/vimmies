if executable('prettier')
  let &l:formatprg = 'npx prettier --stdin-filepath % --tab-width=4'
endif
