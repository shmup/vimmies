noremap <buffer><space>sh :!clear; bash %<cr>

" .vim/ftplugin/sh.vim
" formatprg and makeprg config for bash shit

" go https://github.com/mvdan/sh#shfmt
" gggqG
if executable('shfmt')
  setlocal formatprg=shfmt
endif

" cabal or npm https://github.com/koalaman/shellcheck#installing
" <space>m
if executable('shellcheck')
  setlocal makeprg=shellcheck\ -f\ gcc\ %
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
