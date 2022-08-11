" dry run
nnoremap <buffer><space>m :Dispatch make --trace --dry-run -f %<cr>

" TODO
if executable('checkmake')
  setlocal makeprg=checkmake\ %
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
