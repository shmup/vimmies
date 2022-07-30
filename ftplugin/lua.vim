" let &l:formatprg = 'npx prettier-eslint --parser=babel --stdin'

noremap <buffer> <space>la :Dispatch lua % <cr>

setlocal sw=4

if executable('prettier')
  setlocal formatprg=prettier\ --parser\ lua
endif

if executable('luacheck')
  setlocal makeprg=luacheck\ --no-color
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
