" https://elm-lang.org/docs/style-guide

if executable('elm')
  setlocal makeprg=elm\ make
  nnoremap <buffer><space>m :Dispatch elm make %<cr>
endif

if executable('elm-format')
  let &l:formatprg = 'elm-format --stdin'
endif
