" .vim/after/ftplugin/sh.vim

" formatprg and makeprg config for bash shit

noremap <buffer><space>sh :!clear; bash %<cr>

" go https://github.com/mvdan/sh#shfmt
" gq<motion>
if executable('shfmt')
  setlocal formatprg=shfmt\ -i\ 2
endif

" cabal or npm https://github.com/koalaman/shellcheck#installing
" <space>m
if executable('shellcheck')
  setlocal makeprg=shellcheck\ -f\ gcc\ %
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif
