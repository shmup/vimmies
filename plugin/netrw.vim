" so - is for dirvish, and _ is for a nerdtree kinda view
" nnoremap _ :Lex<cr>

" this is set up for a nerdtree style pane on the left side
" and p shows a preview in a vertical split
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_preview = 1

command! ExploreFind let @/=expand("%:t") | execute 'Vexplore' expand("%:h") | normal n
nnoremap _ :ExploreFind<cr>
