set background=dark
highlight clear

if exists("syntax_on")
 syntax reset
endif

let g:colors_name = "minimal"

highlight Normal guifg=#44c44f ctermfg=10 guibg=#F4F3F1
highlight NonText guifg=#44c44f ctermfg=10
highlight comment guifg=darkgray ctermfg=darkgray gui=italic
highlight constant guifg=#44c44f ctermfg=10
highlight string guifg=darkgray ctermfg=darkgray
highlight identifier guifg=#44c44f ctermfg=10
highlight statement guifg=#44c44f ctermfg=10 gui=bold cterm=bold
highlight define gui=bold cterm=bold
highlight preproc guifg=#44c44f ctermfg=10
highlight type guifg=#44c44f ctermfg=10 gui=bold cterm=bold
highlight special guifg=#44c44f ctermfg=10 ctermfg=10
highlight Underlined guifg=#44c44f ctermfg=10 gui=underline cterm=underline
highlight label guifg=#44c44f ctermfg=10
highlight operator guifg=#44c44f ctermfg=10
highlight delimiter guifg=darkgray ctermfg=darkgray gui=NONE cterm=NONE

highlight ErrorMsg guifg=#44c44f guifg=#44c44f ctermfg=10
highlight WarningMsg guifg=#44c44f ctermfg=10 gui=bold cterm=bold
highlight ModeMsg guifg=#44c44f gui=NONE ctermfg=10
highlight MoreMsg guifg=#44c44f gui=NONE ctermfg=10
highlight Error guifg=#44c44f guifg=#44c44f gui=underline ctermfg=10

highlight Todo guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight Cursor guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight Search guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight IncSearch guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight LineNr guifg=#44c44f ctermfg=10
highlight title guifg=#44c44f gui=bold cterm=bold

highlight StatusLine cterm=none gui=none guifg=white ctermfg=black guibg=black ctermbg=black
highlight StatusLineNC cterm=none gui=none guifg=fg ctermfg=fg guibg=#cccbca ctermbg=white
highlight VertSplit gui=none guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10

highlight Visual term=reverse ctermfg=10 ctermfg=10 guifg=#44c44f guifg=#44c44f

highlight DiffChange guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight DiffText guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight DiffAdd guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight DiffDelete guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10

highlight Folded guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight FoldColumn guifg=#44c44f guifg=#44c44f ctermfg=10 ctermfg=10
highlight cIf0 guifg=#44c44f ctermfg=10


