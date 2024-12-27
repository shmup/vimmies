highlight journalsAllCaps ctermfg=yellow guifg=#5fafaf
highlight journalsTodo ctermfg=red guifg=#af5f5f
highlight journalsCompleted ctermfg=green guifg=#87af87

syntax cluster journalsSyntax contains=journalsAllCaps,journalsTodo,journalsCompleted

syntax match journalsAllCaps /\<[A-Z][A-Z'-]\+\>/
syntax match journalsTodo /\[\s\]/
syntax match journalsCompleted /\[x\]/

