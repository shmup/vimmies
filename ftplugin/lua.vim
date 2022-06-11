let &l:formatprg = 'npx prettier-eslint --parser=babel --stdin'

noremap <buffer> <space>la :Dispatch lua % <cr>

if executable('luacheck')
  " setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=luacheck\ --no-color
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
