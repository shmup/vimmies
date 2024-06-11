" syntax off
let &l:formatprg = "raco fmt --width 60"
let b:slime_cell_delimiter = ";%%"
let g:slime_preserve_curpos = 0
unmap <buffer> K
let b:slime_target = "vimterminal"
highlight Folded ctermfg=240 guifg=#af8787

