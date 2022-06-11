if executable('php')
  setlocal makeprg=php\ -l\ %
  setlocal errorformat=%m\ in\ %f\ on\ line\ %l,%-GErrors\ parsing\ %f,%-G
  nnoremap <buffer> <silent> <f5> :update<bar>sil! make<bar>cwindow<cr>
endif

