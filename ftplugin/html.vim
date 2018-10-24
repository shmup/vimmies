vmap ,x :!tidy -q -i --doctype omit --show-errors 0 --hide-endtags 1 --tidy-mark 0 --omit-optional-tags 1<CR>
setlocal equalprg=tidy\ -quiet\ --show-errors\ 0
setlocal  makeprg=tidy\ -quiet\ -e\ %
map <F12> :%!tidy -q --tidy-mark 0 2>/dev/null<CR>
