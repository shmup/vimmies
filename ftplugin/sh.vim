noremap <buffer><space>sh :!clear; bash %<cr>

if executable('shellcheck')
  setlocal makeprg=shellcheck\ -f\ gcc\ %
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
