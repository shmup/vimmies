" thing i learned from https://vimways.org/2018/death-by-a-thousand-files/
" so I can :ijump Text or whatever
" setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
setlocal foldmethod=indent
setlocal commentstring=\/\/\ %s
setlocal include=from
setlocal suffixesadd=.jsx,.js
setlocal define=class\\s

" Uses eslint, eslint-cli, and eslint-prettier.
" Only eslint-cli should be installed globally.


if executable('prettier')
  " setlocal formatprg=prettier\ --parser\ javascript
  let &l:formatprg = 'npx prettier --stdin-filepath %'
endif

noremap <buffer> <space>js :Dispatch node % <cr>

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --no-ignore\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('prettier')
  nmap <leader>p <Plug>(PrettierAsync)
endif

