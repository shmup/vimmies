let &l:keywordprg=fnamemodify($MYVIMRC, ":h") . "/tools/perl6.sh " . &l:filetype

if executable('perl6')
  noremap <buffer> <space>pl :!perl6 % <cr>
endif

if executable('eslint')
  setlocal makeprg=perl6\ %
  nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
endif

if executable('perl6-tidy')
  let &l:formatprg = 'perl6-tidy -'
endif

if executable('tmux')
  nnoremap <buffer>,d :Dispatch<cr>
endif

set keywordprg=p6doc
