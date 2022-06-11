setlocal foldmethod=syntax
setlocal commentstring=\/\/\ %s

noremap <buffer> <space>js :!node % <cr>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" inoremap <silent><expr> <tab> coc#refresh()

if executable('tsc')
  setlocal makeprg=tsc
  nnoremap <buffer><space>m :Dispatch tsc %<cr>
endif

if executable('standard')
  let &l:formatprg = 'npx standard --stdin'
endif

if executable('tmux')
  nnoremap <buffer>,r :Dispatch remmina -c /home/jared/.local/share/remmina/1534271139285.remmina &>2<cr>
  nnoremap <buffer>,t :Dispatch npm run --prefix $HOME/workspace/platform/portal local-integration-wip<cr>
endif
