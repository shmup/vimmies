setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s
setlocal include=from
setlocal suffixesadd=.jsx,.js
setlocal define=class\\s

noremap <buffer> <space>js :!node % <cr>

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --no-ignore\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('prettier')
  " let &l:formatprg = 'prettier-standard --stdin'
  let &l:formatprg = 'prettier-eslint --stdin'
endif

if executable('tmux')
  nnoremap <buffer>,r :Dispatch remmina -c /home/jared/.local/share/remmina/1534271139285.remmina &>2<cr>
  nnoremap <buffer>,t :Dispatch npm run --prefix $HOME/workspace/platform/portal local-integration-wip<cr>
endif
