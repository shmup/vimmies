if executable('php')
  setlocal makeprg=php\ -l\ %
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
  nnoremap <buffer> <silent> <f5> :update<bar>sil! make<bar>cwindow<cr>
endif

if executable('prettier')
  let &l:formatprg = 'prettier --stdin-filepath %'
endif

let g:PHP_outdentphpescape = 0
let g:PHP_htmlInStrings = 1
