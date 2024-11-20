" Color Definitions
highlight journalsAllCaps ctermfg=yellow guifg=#5fafaf
highlight journalsTodo ctermfg=red guifg=#af5f5f
highlight journalsCompleted ctermfg=green guifg=#87af87

" Define syntax cluster
syntax cluster journalsSyntax contains=journalsAllCaps,journalsTodo,journalsCompleted

" Highlight all caps as yellow
syntax match journalsAllCaps /\<[A-Z][A-Z']\+\>/

" Highlight [ ] as red
syntax match journalsTodo /\[\s\]/

" Highlight [x] as green
syntax match journalsCompleted /\[x\]/
