setlocal colorcolumn=78
setlocal textwidth=78
setlocal shiftwidth=4

command! Test execute 'Dispatch make test'

if executable('perl6-tidy')
  let &l:formatprg = 'perl6-tidy - %'
endif
