highlight journalsAllCaps guifg=#a8a384 ctermfg=144
highlight journalsTodo guifg=#ff9494 ctermfg=210
highlight journalsCompleted ctermfg=green guifg=#87af87
highlight journalsComment ctermfg=darkgray guifg=#808080

" light text
" guifg=#545c8c ctermfg=60

highlight journalsContinuation ctermfg=104 guifg=#929be5
highlight journalsBullet ctermfg=104 guifg=#929be5

syntax cluster journalsSyntax contains=journalsAllCaps,journalsTodo,journalsCompleted,journalsComment

syntax match journalsAllCaps /\<[A-Z][A-Z'-]\+\>/

syntax match journalsBullet /^\s+[-*]\s.*/
syntax match journalsContinuation /^\s\{4,}.*$/

syntax match journalsTodo /\[\s\]/
syntax match journalsCompleted /\[x\]/
