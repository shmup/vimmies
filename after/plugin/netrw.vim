" - is for dirvish, and _ is for a nerdtree kinda view
" p is for preview
nnoremap _ :Lex<cr>

let g:netrw_list_hide = netrw_gitignore#Hide() .. '.*\.swp$'
let g:netrw_banner = 0       " disable the netrw banner
let g:netrw_liststyle = 3    " set the list style to tree view
let g:netrw_browse_split = 4 " open files in a new tab
let g:netrw_altv = 1         " use alternate vertical split for browsing
let g:netrw_winsize = 18     " set the netrw window size to 18 columns
let g:netrw_preview = 1      " enable file preview in netrw

augroup vimrc
  autocmd!
  autocmd FileType netrw call s:RemoveNetrwMap()
augroup END

function s:RemoveNetrwMap()
  if hasmapto('<Plug>NetrwRefresh')
    unmap <buffer> <C-l>
  endif
endfunction
