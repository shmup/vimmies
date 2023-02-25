" vmap ,x :!tidy -q -i --doctype omit --show-errors 0 --hide-endtags 1 --tidy-mark 0 --omit-optional-tags 1<CR>
" setlocal equalprg=tidy\ -quiet\ --show-errors\ 0
" map <F12> :%!tidy -q --tidy-mark 0 2>/dev/null<CR>
"
if executable('prettier')
  setlocal formatprg=prettier\ --parser\ html
endif

" if executable('curl')
"   setlocal makeprg=html-validator\ --verbose\ --format gnu\ --file %
"   nnoremap <buffer><space>m :silent make! % \| redraw!<cr>
" endif
