" https://github.com/keith/gist.vim/blob/master/doc/gist.txt
let g:gist_open_url = 0
let g:gist_default_private = 1
let g:gist_copy_url = 1
let g:gist_yank_register = '+'

" https://github.com/mxw/vim-jsx#usage
let g:jsx_ext_required = 0 " dont require .jsx extension

" projectionist
nnoremap ,a :A<cr>

" qf
let g:qf_mapping_ack_style = 1

" git gutter shit
set updatetime=200
let g:gitgutter_terminal_reports_focus=0

" git gutter colors from apprentice.vim
hi GitGutterAdd          ctermbg=234 ctermfg=108 guibg=NONE guifg=#bcbcbc cterm=NONE gui=NONE
hi GitGutterChange       ctermbg=234 ctermfg=229 guibg=NONE guifg=#bcbcbc cterm=NONE gui=NONE
hi GitGutterDelete       ctermbg=234 ctermfg=131 guibg=NONE guifg=#bcbcbc cterm=NONE gui=NONE
hi GitGutterChangeDelete ctermbg=234 ctermfg=229 guibg=NONE guifg=#bcbcbc cterm=NONE gui=NONE
