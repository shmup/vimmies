setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s
setlocal include=from
setlocal suffixesadd=.jsx,.js
setlocal define=class\\s

# NOTE a message from eslint-cli:
# "The eslint package must not be installed into global."

# I currently have prettier-eslint and eslint installed within the project

let &l:formatprg = 'prettier-eslint --parser=babel --stdin'

noremap <buffer> <space>js :Dispatch node % <cr>

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --no-ignore\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
