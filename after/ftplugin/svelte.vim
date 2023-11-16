if executable('prettier')
  " setlocal formatprg=prettier\ --parser\ javascript
  let &l:formatprg = 'prettier --plugin prettier-plugin-svelte --stdin-filepath %'
endif

if executable('prettier')
  nmap <leader>p <Plug>(PrettierAsync)
endif
