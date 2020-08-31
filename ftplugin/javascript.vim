setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s
setlocal include=from
setlocal suffixesadd=.jsx,.js
setlocal define=class\\s

noremap <buffer> <space>js :Dispatch node % <cr>

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --no-ignore\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

let &l:formatprg = 'node /home/jared/workspace/platform/portal/node_modules/prettier-eslint-cli/dist/index.js --parser=babel --stdin'

if executable('tmux')
  nnoremap <buffer>,r :Dispatch remmina -c /home/jared/.local/share/remmina/1534271139285.remmina &>2<cr>
  nnoremap <buffer>,t :Dispatch npm run --prefix $HOME/workspace/platform/portal local-integration-wip<cr>
endif
