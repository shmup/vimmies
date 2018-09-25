setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s

if executable('eslint')
  setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
  setlocal makeprg=eslint\ --no-ignore\ --format\ compact
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('prettier')
  let &l:formatprg = 'prettier --stdin --jsx-bracket-same-line --no-bracket-spacing --print-width 80 --single-quote --trailing-comma none'
endif

if executable('tmux')
  nnoremap <buffer>,r :Dispatch remmina -c /home/jared/.local/share/remmina/1534271139285.remmina<cr>
  nnoremap <buffer>,t :Dispatch npm run --prefix $HOME/workspace/platform/portal local-integration-wip<cr>
  nnoremap <buffer>,d :Dispatch<cr>
endif

